# Message objects, Ease functions and Gen~

*Azumatone Motion package · Created by Timothée Rémi-Tekoutcheff*

`azu.ease` and `azu.morph` are Max message externals, not MSP objects: they run
with DSP off. They share the same 19 Ease functions with `azu.ease~`,
`mc.azu.ease~` and the Gen~ library. In inspectors and menus, `overshoot` is
labeled **Character / Overshoot**; the attribute name is `overshoot`, with no
`character` alias.

## Shared attributes

| Attribute | Default | Behavior |
|---|---|---|
| `function` | `smoothstep` | Menu of the 19 registered functions |
| `mode` | `in` | Menu: `in`, `out`, `inout` |
| `overshoot` | `1` | Character intensity: native at 1, exaggerated above 1; negative finite values accepted. Controls elasticity for `bounce_gravity` and contact softness for `bounce_viscoelastic` |
| `headroom` | `0.5` | Soft margin around the shaped progression's 0..1 interval; <=0 hard-clamps |
| `drift` | `0` | Deterministic variation depth, clipped to 0..1 |

On `azu.ease` and `azu.morph`, attributes are scalar and global, including for
lists, and accept exactly one value. On `mc.azu.ease~`, `overshoot`, `headroom`
and `drift` take one value per channel (see [Signal objects](#signal-objects)).
Changes are used at the next calculation: message objects have no automatic
output, function crossfade, parameter smoothing or internal clock.

## azu.ease

One inlet and one outlet.

```text
azu.ease @function smoothstep

0.25                    -> float 0.15625
0. 0.25 0.5 0.75 1.     -> list 0. 0.15625 0.5 0.84375 1.
function bow_change     -> no output
bang                    -> reevaluate the last valid input with current settings
```

An int or float produces a float. An explicit list produces a float list,
including a one-element list. Elements are independent inputs, not time steps,
and share one drift context. Reordering or splitting a list into scalars
does not change its numerical results at the same settings/generation.
Finite inputs outside 0..1 saturate to exact 0/1 before drift is applied.
`bang` before any valid input reports an error.

Changing a setting produces no output: send an input or `bang` to recalculate.
`nextdrift` and `resetdrift` change the deterministic drift generation
([Drift](#drift)), also without output. `dump` prints the settings and the last
input to the Max console.

Messages arriving from different threads are handled safely. Concurrent
calculations may wait for one another and their outputs can still interleave
downstream; this is not a hard-real-time guarantee. Serialize a complete
multi-message operation in the patch when downstream objects require a
particular order.

## azu.morph

Transitions between states, each a nonempty numeric list, along an Ease curve.
One inlet, a left list outlet and a right status outlet. The first list
initializes and outputs the state immediately. Later lists define destinations,
starting at the latest successful output.

```text
220. 0.1 -0.5            -> initialize immediately
880. 0.8  0.5            -> store destination; emit retargeted on right outlet
0.                       -> 220. 0.1 -0.5
0.5                      -> 550. 0.45 0.
1.                       -> 880. 0.8 0.5
```

With `q = Ease(p)` after mode, drift and headroom:

```text
output[i] = (1-q) * start[i] + q * target[i]
```

Output is always a list of floats.

| Message | Effect |
|---|---|
| list | The first list initializes the state; later lists are destinations |
| number | Progression `p` in external mode (default); a one-value destination in timed mode |
| `progress <p>` | Sets the progression explicitly, in either mode |
| `bang` | Recalculates the remembered progression |
| `duration <ms>` | Enables timed mode (also `@duration <ms>` at creation) |
| `external` | Returns to scalar, externally driven progression |
| `stop` | Stops the current transition and keeps its last output |
| `clear` | Stops and forgets the states; the next list initializes again |
| `nextdrift`, `resetdrift` | Change the drift generation without output ([Drift](#drift)) |
| `dump` | Prints settings, drift generation, full A/B and last-output lists, list lengths, remembered progression and readiness to the Max console, without outlet data |

The right outlet emits `retargeted` when a destination is accepted and `done`
after the final list of a timed transition.

### External progression

By default a number drives the progression and `bang` recalculates the
remembered progression. A destination list resets the progression to zero
without emitting a new state. Finite progressions outside 0..1 saturate to the
endpoints. For a one-value state, send an explicit `list 100.` to initialize,
then `list 500.` to choose a destination; a bare number is reserved for
progression.

Destination lengths must match the latest output. Use `clear` before changing
dimension. No padding, scalar broadcasting or truncation occurs.

#### Continuous retargeting with an external ramp

Each destination list snapshots the **last successfully emitted numerical
state** as the start and sets the remembered progression to zero. It does not
emit state data, advance drift, or control the external ramp. Invalid
destination requests change nothing.

The right outlet emits `retargeted` synchronously, after a successful retarget
has committed. A rejected request emits no success notification and leaves the
running transition untouched. Use `[route retargeted]` to stop the old `[line]`
and send `0., 1. 2000` only after success, not an unconditional trigger chain.
Returning to p=0 reproduces the previous output exactly. Reusing the old
mid-ramp progression instead would immediately advance within the new gesture.
Continuity is of values, not velocity or physical momentum. To renew drift,
send `nextdrift` explicitly before restarting the ramp.

### Timed mode

Set a duration to enable timed mode: `@duration <ms>` at creation or
`duration <ms>` at runtime. `duration` is a Max attribute, so creation
arguments, messages and attrui use the same validated setter; `dump` reports
it in milliseconds.

```text
azu.morph @duration 750 @function hesitate

280. 0.18 -0.8       -> initialize and output this state immediately
4200. 0.1 0.8        -> ease to this destination over 750 ms
1100. 0.24 0.        -> retarget from the latest emitted state
progress 0.5         -> explicitly set Ease progression instead of targeting
stop                 -> stop the current transition and keep its last output
clear                -> stop and forget states; next target initializes again
external             -> return to scalar, externally driven progression
```

If the object has not emitted a state yet, the first list initializes it;
subsequent lists are destinations and must have the same number of values. If an
externally driven state was already emitted, a list transitions from that latest
output instead of reinitializing. In timed mode a single number is a one-value
destination; use `progress <p>` to cancel the timer and explicitly apply a
progression. A duration of zero moves to the destination immediately. Updating
the duration affects the next destination, not a transition already in progress.

`done` is emitted after the final state, including for duration zero.
Initialization, `bang`, `clear`, `stop` and superseded transitions do not emit
it. Avoid an immediate infinite cycle of zero-duration targets.

`clear` cancels the current transition without emitting data or `done`, empties
both endpoints and the last output, and returns progression to zero. It
preserves the control mode, duration, Ease settings and drift generation. In
timed mode, the next valid number or list initializes immediately, including a
different list length; in external mode, the next list initializes immediately.

This mode uses Max's message scheduler and emits approximately every 20 ms; it
does not provide audio-rate control. Without a duration setting, the object
remains externally driven: numbers are progressions, while lists initialize or
prepare destinations without animation.

Open [azu.morph-timed.maxpat](../help/azu.morph-timed.maxpat) from the main
helpfile for a one-parameter example using `azu.morph @duration 2000 @headroom 0`.
The first number initializes; later numbers are destinations. Use `clear`
followed by a value to initialize again without a transition. Lists can be
distributed with `[unpack f f f]`; audio controls may require downstream signal
interpolation.

### Units and bounds

Interpolation is affine in the supplied units. Hz is linear in Hz; no special
handling of angles, discrete values, perceptual scales or logarithmic domains.
With `headroom 0`, each parameter remains between its two state values.
Positive headroom permits extrapolation proportional to each parameter's
A-to-B interval, including reversed intervals. Constant parameters stay constant.
It is **not** a limiter for final Hz, gain, pan or other physical units.
Protect downstream ranges separately if overshoot is enabled.

This is not Fluence: no inertia, velocity, coupling or target pursuit.

## Errors and limits

Inputs and states must contain 1..32767 finite numbers (Max's list outlet uses
a signed short count). A symbol, empty list, non-finite value or oversized
message rejects the entire request, logs an error and does not partially update
stored data. No implicit symbol-to-zero conversion. Creation accepts attributes
only, not positional arguments.

Calculation errors (missing input/states, unequal sizes, numerical overflow)
emit nothing. Overflow is checked before limiting as well as after interpolation;
it is not silently hidden by headroom. The last successful calculation remains
available. Accepted destination lists remain stored. Length errors report both
sizes; destination errors compare the request with the last output, which is
the source of the new transition.

## Ease functions

Function menus list the gestures in the browsing order below, independently of
their stable numeric IDs (see [Gen~](#gen)). Character 1 is the native gesture.
Character 0 removes the function's scaled contribution and leaves its
baseline, which is not always a line. To see the curves, use the
[static function viewer](#static-function-viewer).

| Function | Native gesture (Character 1) | Character 0 |
|---|---|---|
| `smoothstep` | Cubic S-curve; the neutral baseline of the set | Straight line |
| `gompertz` | Asymmetric sigmoid: slow start, fast middle, long gentle tail | Straight line |
| `viscous` | Near-stillness (stiction), then an exponential catch-up like viscous drag | Straight line |
| `ink_diffusion` | Near-linear mark, brief settling, then two unequal spreading stages with creeping shoulders before resolving | Near-linear early mark, brief settling, then a final advance |
| `phi_spiral` | Log-periodic oscillation pivoting on the golden-ratio point (about 0.618), its amplitude decaying away from the pivot | Straight line |
| `magnetic_snap` | Smooth pull toward five evenly spaced levels (0, 0.25, 0.5, 0.75, 1); never a hard quantizer | `smoothstep`, no snapping |
| `hesitate` | Two backward dips (attempts) before committing to the target | `smoothstep` |
| `recoil` | Pull-back away from the target, a fast snap past it, then a damped ring | Fast exponential approach, without pull-back or ring |
| `spring_soft` | Heavily damped spring: one soft, doughy overshoot before settling | Straight line |
| `spring_tight` | Lightly damped spring that keeps ringing almost to the target | Straight line |
| `bounce_gravity` | Fall from rest toward the target, then inelastic bounces | Fall without rebound |
| `bounce_viscoelastic` | Fall, soft indentation with creep, delayed release and decaying rebounds, the last contact absorbing the motion | Firmest contact, not a line |
| `ricochet` | Decaying bounce-like oscillation whose repetitions speed up | Straight line |
| `bow_change` | A dip then a catch around 0.55, like a bow direction change | `smoothstep` |
| `spiccato` | `smoothstep` with a deep, near-silent notch around 0.45 where the value falls back toward 0 | `smoothstep` |
| `stutter` | Four shrinking, alternating pulses crowding toward 0.42, like a stammer | `smoothstep` |
| `ratchet` | Eight smooth climbs, catches and broad mechanical setbacks; no damped clack oscillation | Linear progression |
| `fracture` | Faceted relief of unequal straight facets with a smaller nested ridge | Straight line |
| `collapse` | Broad pre-tension, then a compressed smoothstep release followed by a hold | Wait until the breakpoint, then a gentle smoothstep release |

### Character and mode

Between zero and one, Character interpolates the complete gesture; above one
and at negative values it extrapolates it, before the headroom limiter.
`bounce_gravity` and `bounce_viscoelastic` are the exception: zero and negative
values are equivalent.

`out` time-reverses and reflects the gesture (for example rebounds first, then
departure); `inout` combines both halves. With drift enabled, the input
midpoint of `inout` may move. Chronology descriptions below refer to mode `in`.

Curves are control trajectories, not anti-aliased audio: fast ramps, abrupt
parameter changes and very high-frequency springs can alias. Extremely large
`overshoot` values stay finite and headroom-bounded but give no meaningful
shape; NaN/infinite attribute values are invalid.

### Springs, recoil and hesitate

At or below native Character, `spring_soft` and `spring_tight` only scale
their amplitude. Above native (`excess = overshoot - 1`), each accentuates its
own character:

- `spring_soft`: damping and frequency are both divided by `1 + 0.5*excess`,
  the same doughy decay, uniformly slower.
- `spring_tight`: frequency is multiplied by `1 + 0.6*excess` and damping
  divided by `1 + 0.25*excess`, so cycles are more visible and ring longer.

`recoil` drives its pull-back and its post-snap ring with different,
non-linear responses to Character. Beyond native the pull-back grows
superlinearly and the ring sublinearly, so the pull-back increasingly
dominates; below native the ring is relatively larger. Neither has a natural
saturation plateau.

`hesitate` drives its two dips differently as well. At drift zero the first has
native depth 0.14 and the second 0.05. The first grows sublinearly and the
second superlinearly, so below native the first is emphasized and the second
recedes, while above native the second gains weight and can become dominant.

### Gravity: fall, impact and settling

`bounce_gravity` models a fall from rest toward the fixed target at 1,
followed by inelastic impacts. With `mode in`, `overshoot 1` and `drift 0`,
acceleration is constant between impacts. The first contact occurs at progress
approximately 0.169. Each collision reverses velocity and retains 70% of its
magnitude: flight durations shrink by 0.70 and rebound heights by 0.49. The
first rebound retreats to 0.51. The trajectory settles at 1 by progress 0.96
without an endpoint correction.

At every Character setting the curve remains in `[0, 1]`, with sharp velocity
changes only at impacts. Character controls collision restitution directly:
zero or negative values give a fall without rebound, and increasing positive
values produce higher and more numerous rebounds:

| Character (`overshoot`) | Restitution at drift zero | First rebound height | Rebounds above 1% height |
|---|---|---|---|
| 0.5 | 0.595 | 35.4% | 4 |
| 1 | 0.70 | 49% | 6 |
| 2 | 0.768 | 58.9% | 8 |
| 4 | 0.807 | 65.1% | 10 |

Restitution stays below 1 even at extreme Character, so the sequence always
loses energy and settles. The total gesture duration is unchanged: greater
elasticity shifts the first impact earlier to fit more flights before settling.

### Viscoelastic: compression, release and absorption

`bounce_viscoelastic` is function **18**. Unlike the rigid impacts of
`bounce_gravity`, it follows a fall, rapid indentation, slow additional
yielding (creep), delayed release and successive ballistic rebounds. Six
contacts alternate with five decreasing flights; the last contact absorbs the
remaining motion, and the resolution toward 1 starts during that contact's
recovery, without stopping and restarting at absorption. The contact is
**inside the range at 0.68**; compression stays below 0.96, and free flights
remain below the contact level. The entire gesture stays in `[0, 1]` in every
mode, even at extreme Character, and velocity is continuous at entry, takeoff,
absorption and final resolution. It is a stylized material gesture, not a
physical collision against the final target or a full material simulation.
`headroom 0` preserves the full compression and recovery; larger headroom does
not change this bounded function.

Character controls both material softness and restitution. Higher values
produce deeper, longer compression, later recovery and more perceptible
rebounds. Zero (and negative values) means a firm, more strongly damped contact;
1 is the native soft material; try 4 for a more yielding and elastic surface.
The six-contact structure stays fixed, so smaller rebounds simply become
perceptible as Character rises, with no count jumps during live changes. Every
nonfinal contact deepens its impression before recovery; the last contact has a
short indentation and a long, shoulder-free tail.

Measured with `mode in` and `drift 0` (identical at `headroom 0` and
`headroom 0.5`), isolating the first contact:

| Character | First-contact compression above 0.68 | First-contact time above 0.70 (fraction of gesture) | Rebounds deeper than 0.02 below contact |
|---|---|---|---|
| 0.5 | 0.086 | 0.053 | 3 |
| 1 | 0.154 | 0.067 | 4 |
| 4 | 0.260 | 0.083 | 5 |

The first material peaks are approximately 0.766, 0.834 and 0.940; the global
maximum is always 1 at the final target. At native settings the first contact
begins near 0.112. Rapid indentation ends at 14% of the first-contact duration,
then deepens slowly by 12% until the single peak at 60%. The five rebounds
retreat approximately 0.305, 0.137, 0.061, 0.028 and 0.012 below the contact.

### Ink: mark then stain

Ink uses a near-linear mark followed by two unequal spreading stages, rather
than a sigmoid, cursive loops or a bell-shaped bloom. At drift zero, in mode
`in`, the mark reaches 0.84 at progress 0.25 and briefly settles. A first,
faster spread runs from 0.34 to 0.46 with depth 0.30; a second, slower and
shallower one runs from 0.55 to 0.74 with depth 0.13. Between and after them,
the trace keeps creeping instead of stopping at staircase levels. From 0.83,
it rejoins the target without a rebound. Segments are mostly straight, with
short rounded joins that keep value and slope continuous.

Character scales **only the stain**: the entire mark and initial settling
remain identical across settings. Zero leaves the clean mark; 0.5 produces
moderate spreading, and one makes both spreading stages pronounced. Negative
values reverse the deformation; values above one exaggerate it before limiting.
There is no pressure ripple, tremor, oscillatory rebound or additional random
state, and the output always finishes exactly at 1. This is a shape metaphor,
not a physical simulation or an effect continuing after progress stops.

Drift redistributes durations and relative depths, not just the position of a
fixed pattern. The first spread stays faster and deeper than the second.

### Fracture

`fracture` is function **17**. It is a deterministic, stateless faceted relief.
At drift zero, its main time/value landmarks are `(0,0)`, `(0.13,0.25)`,
`(0.28,0.12)`, `(0.35,0.48)`, `(0.58,0.38)`, `(0.71,0.80)`,
`(0.80,0.61)`, `(0.92,0.94)`, `(1,1)`. Between landmarks the facets are mostly
straight, with short rounded joins. A smaller ridge of height 0.08 grows from
0.43 to 0.47 and falls away by 0.53, nested within the long descending facet.
This provides two geometric scales, not an infinite fractal or high-frequency
noise. There are no value jumps, periodic teeth or damped oscillations.

Character 0 is an exact line; 0..1 blends toward the complete relief; values
above one exaggerate it and negative values invert its departure from the
line, before headroom limiting. At Character 1 the raw relief stays within
0..1, so hard clamping does not erase its shape. Drift continuously
redistributes facet lengths/heights and the secondary ridge while retaining
their ordering.

### Sampling short gestures

Message-rate resolution still matters: the 20 ms grain of timed `azu.morph`
samples only the eight tooth boundaries of a 160 ms `ratchet` ramp, erasing the
Character effect at drift zero. Short ramps can also miss the smaller ridge of
`fracture`. Use a finer message grain or a signal-rate progression for short
gestures; the viewer's dense plot does not show this.

## Drift

`drift` (0..1) adds deterministic variation. In every Ease implementation it
leaves `overshoot` unchanged, warps progress by up to `0.12 * sin(pi*x)`, and
supplies function-specific structural variation to all 19 curves. `drift 0`
disables drift variation.

Variation is selected by a *generation*, an unsigned 32-bit counter that wraps
at 2^32. The same generation reproduces the same variation exactly. Generation
zero is the initial one and is already a varied state when drift is enabled, not
an unvaried special case. Each MC channel (`mc.azu.ease~`, `mc.gen~`) draws its
own variation, so even identical nonzero depths are decorrelated across
channels.

On `azu.ease` and `azu.morph`, `nextdrift` increments the generation and
`resetdrift` returns it to zero. Neither outputs anything, and `resetdrift` does
not clear settings, data, states or remembered progression. Numbers, list
elements, bang, state changes, retarget and backward progression do not advance
the generation. There is no seed or per-parameter variation. `azu.fluence~` has
no drift; its `reset` message resets its ensemble.

### Structural drift

The structural draw is `j = drift * (2 * hash - 1)`, independent of the timing
draw and reproducible per generation and MC channel. A single draw controls a
coherent combination of material parameters; it is not fresh noise per sample.
The following ranges are reached at the theoretical extremes `j = -1..1`:

| Function | Structural changes at full drift |
|---|---|
| `smoothstep` | Asymmetric contour term `2.4*j*x^2*(1-x)^2` (up to +/-0.15); native intensity remains monotone |
| `gompertz` | Steepness 3.6..8.4; center 0.23..0.47; endpoints renormalized |
| `viscous` | Stiction threshold 0.028..0.132; drag rate 2..6 |
| `spring_soft` | Damping 2.75..7.25; frequency +/-22%; oscillatory amplitude +/-25% |
| `spring_tight` | Damping 0.66..1.74; frequency +/-22%; oscillatory amplitude +/-25% |
| `bounce_gravity` | Native restitution approximately 0.626..0.774; settling time 0.93..0.99 |
| `bounce_viscoelastic` | Contact duration +/-18%; restitution +/-0.05; recovery start +/-0.025; indentation depth +/-5%; internal absorption time 0.85..0.91 with overlapping final resolution; six contacts and five flights retained |
| `recoil` | Charge fraction 0.27..0.43; pull depth +/-40%; approach rate 2.5..7.5; ring damping +/-35%, frequency +/-20%, amplitude +/-25% |
| `magnetic_snap` | Attraction strength +/-45% and kernel exponent 0.4..1.6; five detent levels unchanged |
| `stutter` | Pulse spacing/width +/-35%, plus initial pulse amplitude and decay ratio +/-25%; four pulses retained |
| `ratchet` | Catch fraction 0.3575..0.7425 per tooth; setback depth 0.126..0.234 of a tooth; eight teeth retained |
| `collapse` | Breakpoint 0.52..0.72; native release occupies 0.2925..0.6075 of the remaining interval; pre-tension 0.035..0.105 |
| `phi_spiral` | Pivot +/-0.1; logarithmic frequency +/-30%; envelope exponent 1.04..1.56 and amplitude +/-20% |
| `ink_diffusion` | Mark end 0.23..0.27 at level 0.82..0.86; first/second depths 0.255..0.345 / 0.104..0.156; spreading times, shoulder durations and recovery 0.82..0.84 also vary |
| `hesitate` | Later, separated attempts; variable relative depth and asymmetric withdrawal/recovery (see below) |
| `bow_change` | Turn position +/-0.12, width +/-40%, dip/catch amplitude +/-35% |
| `ricochet` | Damping 1.1..2.9; initial frequency +/-15%; chirp rate +/-35%; bounce amplitude +/-25% |
| `spiccato` | Notch center 0.38..0.52, width 0.0225..0.0775 and depth 0.7125..1.1875 |
| `fracture` | Seven interior landmarks vary in time/height; nested ridge starts 0.415..0.445, rises over 0.032..0.048, falls over 0.048..0.072, height 0.064..0.096 |

These are correlated ranges, not independently selectable controls. Endpoint
anchors are recomputed for the varied shape. `overshoot` still scales each
function's character contribution, but drift can alter that contribution's
envelope; it does not merely multiply the public `overshoot` setting. Some
functions also vary their baseline (for example `viscous` and `collapse`).

At native `overshoot 1`, `hesitate` retains its two symmetric Gaussian dips at
`j = 0`. As `abs(j)` grows, both attempts move later in the progression, with
centers `0.15 + 0.20*abs(j) + 0.04*j` and `0.27 + 0.24*abs(j) + 0.10*j`, and
stay separated rather than collapsing into one. Their depths,
`0.14*(1 - 0.3*j)` and `0.05 + 0.15*abs(j) + 0.08*j`, exchange emphasis, and
each dip has its own withdrawal and recovery width. The halves meet with
matching value and slope. Positive draws favor a slower recovery from the first
attempt and a deeper, sharply released second attempt; negative draws favor the
first retreat. Zero Character still removes both dips, leaving the smoothstep
baseline before the shared time warp.

Do not expect identical drift strength across functions, nor a minimum
variation on every generation: the signed draw can be near zero. The time warp
stays strictly increasing, so it cannot skip an entire interior gesture, but
structural variation can change pulse overlap and hard limiting (`headroom 0`)
can still remove excursions. To audition drift, use `drift 1` in the viewer and
compare several `nextdrift` messages. `drift 1` means maximum timing/structural
variation, not maximum bounce: it never reduces character intensity, and
`ricochet` retains its bounce contribution at the chosen `overshoot`. Changing
drift during a running gesture is not smoothed.

## Signal objects

`azu.ease~` and `mc.azu.ease~` apply the Ease functions to a normalized
progress signal and output a control signal. Progress outside 0..1 saturates to
the endpoints. `mc.azu.ease~` is natively multichannel: its channel count follows
the input unless `@chans N` fixes it (1..64; 0 follows the input). `@chans` alone
does not duplicate a mono signal; use `mc.dup~` for that.

On `mc.azu.ease~`, `overshoot`, `headroom` and `drift` take one value per
channel, for example `@drift 0.1 0.3 0.5 0.9`. A single value applies to every
channel, a shorter list holds its last value for the remaining channels, and
extra values are ignored. `function` and `mode` are global.

### Drift renewal

With drift above 0, a channel advances to the next drift generation on a
detected restart: a jump of more than `0.5` landing below `0.05` or above `0.95`,
with both samples inside `[0, 1]`. Continuous ramps and ordinary direction
reversals do not reseed, and the variation stays fixed throughout each ramp.
State tracking pauses at `drift 0`. The initial previous sample is invalid, so
startup is not a restart.

`nextdrift` advances the generation of every channel by one, exactly like a
detected restart, at the start of the next signal vector. `resetdrift` returns
every channel to generation zero; a `nextdrift` sent after it is still applied.
Both messages also apply to channels whose drift is currently zero. `dump`
prints the object's settings.

### Short Character smoothing and function crossfade

`azu.ease~`, `mc.azu.ease~` and the supplied `azu.ease.gendsp` apply a fixed
**5 ms linear ramp to live changes of `overshoot`**, for all functions and
independently per channel/Gen instance. The first processed value is adopted
immediately; later changes begin at the current interpolated value. Repeating a
target does not restart the ramp; interrupting it reaches the latest target in a
fresh 5 ms (rounded up to a whole sample).

Only Character is interpolated, before drift and function evaluation. The
output signal, progress input, collisions and endpoints are not filtered, and
settled settings reproduce the same curves exactly. This reduces parameter steps
while editing, but does not freeze changing trajectories in a scope or guarantee
click-free arbitrary fast modulation. `dump` reports the fixed smoothing time.

Mode, headroom and drift changes are immediate. Function changes crossfade
linearly over 10 ms, independently of the Character ramp. If a change interrupts
a fade, the current mixture of curves is kept so the new fade starts without a
value step; repeating the current selection does not restart the fade. Headroom
limiting is applied once, after mixing.

Message `azu.ease`, `azu.morph` and the pure `azuEase*` library functions apply
every change immediately, and the viewer queues its calculations without
smoothing. The signal objects reset their state when the DSP graph is set up,
and the current target is then adopted directly; Gen histories reset when the
patch is recreated or recompiled.

## Gen~

[`patchers/azu.ease.gendsp`](../patchers/azu.ease.gendsp) loads the package's own
[`AzumatoneEaseFunctions.genexpr`](../patchers/AzumatoneEaseFunctions.genexpr)
library. Instantiate `gen~ azu.ease` (the `.gendsp` extension is implicit), or
`mc.gen~ azu.ease` for multichannel, with normalized progress on inlet 1.
The same library is usable directly in another Gen~ codebox:

```genexpr
require("AzumatoneEaseFunctions.genexpr");

Param function(0, min=0, max=18);
Param mode(0);
Param overshoot(1);
Param headroom(0.5);
Param drift(0);

// Explicit generation 0 and zero-based stream 0 for this stateless example.
out1 = azuEaseEvaluate(in1, function, mode, overshoot, headroom, drift, 0, 0);
```

Direct `azuEaseEvaluate` callers must supply the drift generation and the
zero-based stream explicitly. For automatic per-cycle variation and MC channel
identification, use `gen~ azu.ease` / `mc.gen~ azu.ease` or copy its full
codebox.

Gen~ parameters are numeric, not symbolic menus. `function` is bounded to
`0..18` by its Param declaration and rounded to the nearest integer during
evaluation; fractional inputs cannot interpolate or select nonexistent curves.
The host may still display a decimal value. For named selection, connect a Max
`umenu` (items in the order of the table below) through `prepend function`.
One curve selector plus one mode selector covers all 19 curves without separate
In/Out/InOut names. The public parameter names match the other Ease objects.

| Param | Values |
|---|---|
| `function` | `0` smoothstep, `1` gompertz, `2` viscous, `3` spring_soft, `4` spring_tight, `5` bounce_gravity, `6` recoil, `7` magnetic_snap, `8` stutter, `9` ratchet, `10` collapse, `11` phi_spiral, `12` ink_diffusion, `13` hesitate, `14` bow_change, `15` ricochet, `16` spiccato, `17` fracture, `18` bounce_viscoelastic |
| `mode` | `0` in, `1` out, `2` inout |
| `overshoot` | Curve character/intensity; default `1` |
| `headroom` | Output soft-limit margin; default `0.5`; `0` or less hard-clamps |
| `drift` | Deterministic variation depth per drift generation, clipped to `[0, 1]`; default `0` |

The Gen~ patch renews drift only on detected restarts, with the rule described
under [Drift renewal](#drift-renewal); it has no `nextdrift` or `resetdrift`
messages. It uses the same 5 ms Character ramp and 10 ms function crossfade as
the audio externals. Each `mc.gen~` instance uses its own channel index as its
drift stream.

For six channels, send this message to `mc.gen~ azu.ease @chans 6`:

```text
applyvalues drift 0. 0.2 0.4 0.6 0.8 1.
```

`setvalue 3 drift 0.7` changes only channel 3. Even identical nonzero depths
are decorrelated across channels; `drift 0` disables drift variation.

## Static function viewer

Open [functions viewer.maxpat](../patchers/functions%20viewer.maxpat). It opens
in Presentation mode and uses `azu.ease`, without DSP, to plot 1025 uniformly
spaced samples including both endpoints. Function, mode, Character / Overshoot,
headroom and drift changes queue a recalculation, so the display may lag under
rapid automation. Defaults match `azu.ease`.

The plot shows the actual limited output, not the raw formula. Its Y range stays
at -0.5..1.5 for headroom <= 0.5, preserving a common scale between functions;
larger headroom expands it to -headroom..1+headroom. `nextdrift` selects the next
deterministic drift generation and `resetdrift` returns to generation zero
without resetting settings; with drift zero they do not change the curve.

This is a static sampled view: very fine details remain approximated by line
segments. It does not show audio function-change crossfades, automatic per-cycle
drift reseeding or MC channel variation.
