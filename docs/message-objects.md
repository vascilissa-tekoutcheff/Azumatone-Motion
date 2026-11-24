# Message tools: azu.ease and azu.morph

*Azumatone Motion package · Created by Timothée Rémi-Tekoutcheff*

These are Max message externals, not MSP objects. They run with DSP off and
reuse all 19 Ease mappings without importing the Fluence ensemble.
The same shared curves serve the audio objects; the UI label for `overshoot`
is **Character / Overshoot** in both message and signal Ease objects.
The technical attribute name remains `overshoot`, without a `character` alias.
The Gen library's drift variation for `bounce_gravity`, `bounce_viscoelastic`,
`magnetic_snap`, `ratchet` and `fracture` now matches the C++ objects.
Gen patches using those functions with nonzero drift may therefore produce
different trajectories than in earlier builds; drift-zero shapes are unchanged.

## Shared attributes

| Attribute | Default | Behavior |
|---|---|---|
| `function` | `smoothstep` | Menu of the 19 registered functions |
| `mode` | `in` | Menu: `in`, `out`, `inout` |
| `overshoot` | `1` | Character intensity: native at 1, exaggerated above 1; negative finite values accepted. Controls elasticity for `bounce_gravity` and contact softness for `bounce_viscoelastic` |
| `headroom` | `0.5` | Soft margin around the shaped progression's 0..1 interval; <=0 hard-clamps |
| `drift` | `0` | Deterministic variation depth, clipped to 0..1 |

Function menus present the gestures in a browsing order, independently of
their stable numeric IDs:
`smoothstep`, `gompertz`, `viscous`, `ink_diffusion`, `phi_spiral`,
`magnetic_snap`, `hesitate`, `recoil`, `spring_soft`, `spring_tight`,
`bounce_gravity`, `bounce_viscoelastic`, `ricochet`, `bow_change`, `spiccato`,
`stutter`, `ratchet`, `fracture`, `collapse`.

All attributes are scalar and global, including for lists. They accept exactly
one value of the appropriate type. Changes are used at the next calculation:
no automatic output, function crossfade, parameter smoothing or internal clock.
`azu.ease` protects its settings and remembered input when messages arrive
from different threads. Concurrent calculations may wait for one another,
and their outputs can still interleave downstream; it is not a hard-real-time
guarantee. Serialize a complete multi-message operation in the patch when its
downstream objects require a particular order.
`overshoot 0` removes a function's scaled contribution, not necessarily its
whole shape. Its remaining baseline can be linear, smoothstep, delayed
or an early precise stroke. For `bounce_gravity`, zero gives a fall without
rebound, not a line. For `bounce_viscoelastic`, zero gives the firmest contact,
not a line; negative values have the same behavior as zero.

### Short Character smoothing in signal objects

`azu.ease~`, `mc.azu.ease~` and the supplied `azu.ease.gendsp` apply a fixed
**5 ms linear ramp to live changes of `overshoot`**. This affects all functions,
independently per channel/Gen instance. The first processed value is adopted
immediately; later changes begin at the current interpolated value. Repeating
a target does not restart the ramp; interrupting it reaches the latest target
in a fresh 5 ms (rounded up to a whole sample).

Only Character is interpolated, before drift and function evaluation.
The output signal, progress input, collisions and endpoints are not filtered.
Settled settings reproduce the same curves exactly. This reduces parameter
steps while editing, but does not freeze changing trajectories in a scope or
guarantee click-free arbitrary fast modulation.
No new attribute is added; `dump` reports the fixed smoothing time.
The C++ audio state resets on DSP graph setup; the current target is then
adopted directly. Gen histories reset when the patch is recreated/recompiled.

Message `azu.ease`, `azu.morph` and pure `azuEase*` library calls remain
immediate/stateless with respect to Character; the DSP-free viewer queues
its calculations without applying smoothing.
Only the supplied stateful Gen patch includes this control ramp.
Mode, headroom and drift changes remain immediate. The existing function-change
crossfade is still 10 ms and is independent of this shorter Character ramp.

### Gesture-level Character

`ratchet`, `collapse` and `ink_diffusion` now apply Character to their primary
gesture, not just a small clack, pre-break chirp or pressure ripple.
This intentionally changes these three curves, **including at drift zero**,
in message, mono/MC signal and Gen implementations. The separate ballistic
redesign of `bounce_gravity` is described below.
Existing presets using these three functions will therefore sound/look different.

| Function | Character 0 | Character 1 |
|---|---|---|
| `ratchet` | Linear progression | Eight smooth climbs, catches and broad mechanical setbacks; no damped clack oscillation |
| `collapse` | Wait until the breakpoint, then a gentle smoothstep release | Broad pre-tension, then a compressed smoothstep release followed by a hold |
| `ink_diffusion` | Near-linear early mark, brief settling, then a final advance | Same mark, then two unequal spreading stages with creeping shoulders before resolving |

Between zero and one these interpolate the complete gesture; above one and
at negative values they extrapolate it, before the usual headroom limiter.
There is no new attribute, randomness or drift-renewal rule in these curve formulas;
signal objects additionally apply the short live Character ramp described above.
Ratchet tooth boundaries/catches and collapse phase joins have continuous
value and slope. This removes the old square-root onset and fast clack in
ratchet, and the accelerating chirp/instability tremor in collapse; it is not
an anti-aliasing guarantee for fast ramps or abrupt parameter changes.

### Springs, recoil and hesitate: shaped Character

Character now reshapes spring damping/frequency and uses different signed
powers for the charge/ring in `recoil` and the two attempts in `hesitate`.
No new attribute is added; variation still uses only overshoot and drift.
At `overshoot = -1, 0, 1`, the former shapes are retained within floating-point
rounding. Both springs also retain their former amplitude-only behavior at
other values below one, within the numerical bound described below.
For `recoil` and `hesitate`, other settings intentionally change, **including
between zero and one and at negative values**. Existing presets at those
settings therefore need review.

**`spring_soft` / `spring_tight`.** At and below native Character the springs
retain the former shape. Above native (`overshoot > 1`), each spring now
accentuates its own character rather than only increasing amplitude:

| Function | Beyond native (`overshoot > 1`, `excess = overshoot - 1`) |
|---|---|
| `spring_soft` | Damping and frequency are both divided by `1 + 0.5*excess`: the same doughy decay, uniformly slower |
| `spring_tight` | Frequency is multiplied by `1 + 0.6*excess` and damping divided by `1 + 0.25*excess`: more visible cycles that also ring longer |

**`recoil`.** The pull-back (charge) and the post-snap ring no longer share a
single linear scalar. Each is driven by `copysign(abs(overshoot)^k, overshoot)`,
with `k = 1.6` for the charge and `k = 0.6` for the ring; both still equal
exactly -1, 0 and 1 at `overshoot = -1, 0, 1`. Beyond native, the pull-back
grows superlinearly while the ring grows sublinearly: charge increasingly
dominates the gesture. Below one, the ring's coefficient is larger than
the charge's. Neither power law has a natural saturation plateau.

**`hesitate`.** The two Gaussian dips are now driven by
`copysign(abs(overshoot)^k, overshoot)`, with `k = 0.6` for the first,
attempt and `k = 1.8` for the second; both still
equal exactly -1, 0 and 1 at `overshoot = -1, 0, 1`, so the native shape and
the documented native drift-only ranges (Structural drift, below) are unchanged.
The first grows sublinearly, the second superlinearly; the second gains relative
weight as Character rises and can become dominant. At drift zero the first has
native depth 0.14 and the second 0.05, so the second is not inherently deeper.
Below one, the first is emphasized and the second recedes.

For these four curves only, evaluation internally bounds finite `overshoot`
to approximately `[-1e100, 1e100]` (within floating-point rounding)
**before** computing powers, amplitudes and frequencies.
This numerical guard leaves practical settings unchanged and prevents
overflow before output limiting. It is not a new attribute: stored settings
and `dump` retain the requested value. The usual `headroom` limiter is applied
after curve evaluation. Extremely large settings are finite but are not an
audio anti-aliasing or meaningful-shape guarantee; high-frequency springs can
alias. NaN/infinite attribute values remain invalid.

### Gravity: fall, impact and settling

`bounce_gravity` now models a fall from rest toward the fixed target at 1,
followed by inelastic impacts. This replaces the former fixed-rate oscillation
on a moving baseline in message, mono/MC signal and Gen implementations,
including `azu.morph`; existing presets intentionally change even at drift zero.
With `mode in`, `overshoot 1` and `drift 0`, acceleration is constant between
impacts. The first contact occurs at progress approximately 0.169. Each collision
reverses velocity and retains 70% of its magnitude: flight durations shrink by
0.70 and rebound heights by 0.49. The first rebound retreats to 0.51.
The trajectory settles at 1 by progress 0.96 without an endpoint correction.

At every Character setting the curve remains in `[0, 1]`, with sharp velocity changes
only at impacts. `out` time-reverses and reflects this gesture (rebounds first,
then departure); `inout` combines both halves using the existing mode rules.
Character now controls collision restitution directly, rather than blending or
extrapolating the shape against a line. This intentionally changes the previous
ballistic version. Zero or negative values give a fall without rebound.
Increasing positive values produces higher and more numerous rebounds:

| Character (`overshoot`) | Restitution at drift zero | First rebound height | Rebounds above 1% height |
|---|---|---|---|
| 0.5 | 0.595 | 35.4% | 4 |
| 1 | 0.70 | 49% | 6 |
| 2 | 0.768 | 58.9% | 8 |
| 4 | 0.807 | 65.1% | 10 |

For `c = max(0, overshoot)` and structural draw `j`, restitution is
`r = (0.85 + 0.05*j) * c/(c + 3/14)`. It stays below 1 even at extreme
Character, so the sequence always loses energy and settles. No new attribute
is added. The total gesture duration is unchanged: greater elasticity shifts
the first impact earlier to fit more flights before settling.
Structural drift varies native restitution from approximately 0.659 to 0.741
and settling time from 0.94 to 0.98. Constant acceleration applies between
impacts before the shared nonlinear drift time warp.

### Viscoelastic: compression, release and absorption

`bounce_viscoelastic` is appended at index **18**, preserving every earlier
index and curve. It is shared by Ease message, mono/MC signal, Morph and Gen.
Unlike the rigid impacts of `bounce_gravity`, it follows a fall, rapid
indentation, slow additional yielding (fluage), delayed release and successive
ballistic rebounds. Six contacts alternate with five decreasing flights;
the last contact absorbs the remaining motion. Resolution toward 1
starts during that last contact's recovery, without stopping and restarting
at absorption. The contact is **inside the range at 0.68**;
compression stays below 0.96, and free flights remain below the contact level.
The entire gesture stays in `[0, 1]` in every mode, even at extreme Character.
Velocity is continuous at entry, takeoff, absorption and final resolution.
This intentionally replaces the previous target-crossing version: it is a
stylized material gesture, not a physical collision against the final target.

Character controls both material softness and restitution. Higher values
produce deeper, longer compression, later recovery and more perceptible
rebounds. Zero (and negative values) means firm, more strongly damped contact;
1 is the native soft material; try 4 for a more yielding and elastic surface.
There is no new attribute. Structural drift coherently varies contact times,
restitution and settling time. The six-contact structure stays fixed, avoiding
integer-count jumps during live changes: smaller rebounds simply become
perceptible as Character rises. Every nonfinal contact deepens its impression
before recovery instead of beginning recovery immediately. The last contact
has a short indentation and a long, shoulder-free tail: it is not a miniature
repetition of the others. This expressive coupling is not a strict
single-material physics simulation.

Character's range is deliberately broad: the former subtle material variation
has been replaced by a strongly changing contact duration and indentation depth.
With `mode in` and `drift 0`, measured output is identical at `headroom 0`
and `headroom 0.5`:

| Character | First-contact compression above 0.68 | First-contact time above 0.70 (fraction of gesture) | Rebounds deeper than 0.02 below contact |
|---|---|---|---|
| 0.5 | 0.086 | 0.053 | 3 |
| 1 | 0.154 | 0.067 | 4 |
| 4 | 0.260 | 0.083 | 5 |

These measurements isolate the first contact so the overlapping final
resolution does not inflate compression width or depth.
The first material peaks are approximately 0.766, 0.834 and 0.940; the global maximum
is always 1 at the final target. Adjacent presets are tested for broad
output differences after soft/hard limiting, including 20 ms message sampling;
this measures contrast, not a guarantee of perceptibility for every use.

This is a stateless, effective contact model, not a full material simulation.
In dimensionless time, initial fall has acceleration 2 and lasts 1. For
`s = max(0, overshoot)/(1 + max(0, overshoot))` and structural draw `j`:

- Base contact duration `T = (0.18 + 1.80*s*s)*(1 + 0.18*j)`.
- Restitution `r = 0.42 + 0.50*s + 0.02*j`.
- Six contacts last `T*q^i`, `i = 0..5`, with `q = 0.95`.
  The five intervening flights last `2*r^(i+1)`, `i = 0..4`,
  with heights `r^(2*(i+1))` before output mapping. Contact duration
  decays more slowly than flight duration, keeping late motion material-led.
- Within each nonfinal contact, rapid indentation ends at `a = 0.12 + 0.04*s`
  with depth `D = 0.10 + 0.16*s`. Recovery starts at `b = 0.36 + 0.48*s`.
  Depth is scaled by incoming speed times contact duration.
- Writing `S(v) = v*v*(3-2*v)`, indentation is
  `D*S(v) + a*v*(1-v)^2` for `v = u/a`.
  The yielding shoulder is `D*(1+0.12*S(v))` for `v = (u-a)/(b-a)`;
  it slowly adds 12% indentation, with no withdrawal or flat hold before
  the single compression peak at `b`.
- Nonfinal recovery is `1.12*D*(1-S(v)) + r*(1-b)*v^2*(1-v)` for
  `v = (u-b)/(1-b)`. The final contact instead uses `u*(1-u)^3`,
  scaled by incoming speed and its own duration; it peaks at `u = 0.25`
  then is absorbed without a shoulder or another takeoff.
  These segments preserve entry/exit velocity, including
  zero residual material velocity at absorption. They are an expressive material approximation, not the
  analytic solution of a spring/damper. Free flight uses acceleration 2.

The material sequence is normalized to settle at progress `R = 0.88 + 0.02*j`.
Its total dimensionless duration is
`N = 1 + T*sum(q^i, i=0..5) + 2*r*(1-r^5)/(1-r)`.
Its raw coordinate `z` is mapped to output `0.68*z` below contact (`z <= 1`),
and `0.68 + 0.28*tanh(0.68*(z-1)/0.28)` during compression. This C1 mapping
keeps indentation bounded inside the range without relying on the global
headroom limiter. It also intentionally stylizes the contact mechanics.
Resolution begins at progress
`L = (N - 0.75*T*q^5)*R/N`, the peak of the final
contact, not at `R`. If `m` is the bounded material output, final output is
`m + (1-m)*S(clamp((x-L)/(1-L), 0, 1))`. After `R`, `m = 0.68` but
resolution is already moving: absorption does not create an extra stop.
The transition is C1 and reaches the target at zero velocity.

At native settings the first contact begins near 0.112. Rapid indentation
ends at 14% of first-contact duration, then slowly deepens by 12% until
the single peak at 60%. The five rebounds retreat approximately
0.305, 0.137, 0.062, 0.028 and 0.012 below the internal contact.
Character lengthens recovery delay and deepens the impression while increasing
restitution. The result alternates soft, yielding contacts with decreasing
flights, rather than producing a continuously oscillating spring.
The existing `out`/`inout` transforms still apply.

`headroom 0` preserves the full compression and recovery; larger headroom is
optional and does not change this bounded function. Contact and flight joins are C1, not an
anti-aliasing guarantee for fast or abruptly modulated ramps.
Tests measure visible compression, Character-dependent contact width/depth,
three/four/five visible rebounds (including 20 ms sampling of a two-second
gesture), continuous Character variation without count-switching jumps,
velocity continuity, additional yielding without a double peak, the distinct
last-contact profile, moving resolution through absorption, and RMS separation from all 18 earlier
curves in every mode, in addition to C++/Gen arithmetic parity. An additional
grid compares the native gesture to earlier curves across modes, eight
Character values and three structural draws; it is an approximation check,
not proof that no combination or time remapping can resemble the gesture.

### Ink: mark then stain

Ink uses a near-linear mark followed by two unequal spreading stages, rather
than a sigmoid, cursive loops or a bell-shaped bloom. At drift zero, in mode
`in`, the mark reaches 0.84 at progress 0.25 and briefly settles. A first,
faster spread runs from 0.34 to 0.46 with depth 0.30; a second, slower and
shallower one runs from 0.55 to 0.74 with depth 0.13. Between and after them,
the trace keeps creeping instead of stopping at staircase levels. From 0.83,
it rejoins the target without a rebound.

Each component uses the same rounded linear ramp: for `t = clamp(u, 0, 1)`
and `e = 0.08`, `R(u)` is `t*t/(2*e*(1-e))` below `e`,
`(t-e/2)/(1-e)` between `e` and `1-e`, and
`1-(1-t)*(1-t)/(2*e*(1-e))` above `1-e`.
**84% of each component is exactly affine**, with rounding confined to its
ends. Value and slope remain continuous at the joins and endpoints; second
derivatives need not match. This avoids smoothing the entire movement into
successive S curves. The common drift timing warp can still bend these affine
segments when drift is enabled.

Character scales **only the stain**: the entire mark and initial settling
remain identical across settings. Zero leaves the clean mark; 0.5 produces
moderate spreading, and one makes both spreading stages pronounced. Negative
values reverse the deformation; values above one exaggerate it before limiting.
There is no pressure ripple, tremor, oscillatory rebound or additional random
state. The output always finishes exactly at 1. This is a shape metaphor, not
a physical simulation or an effect continuing after progress stops.

For signed structural draw `j`, the component ranges are:

| Component | Timing | Height/depth |
|---|---|---|
| Mark | 0 to `0.25+0.02*j` | `0.84+0.02*j` |
| First spread | `0.34+0.02*j` to `0.46+0.01*j` | `0.30*(1+0.15*j)` |
| Second spread | `0.55-0.015*j` to `0.74+0.015*j` | `0.13*(1-0.2*j)` |
| Connecting creep | First spread onset to recovery | 0.025 |
| Recovery | `0.83-0.01*j` to 1 | Restores accumulated spreading and completes the mark |

Drift redistributes durations and relative depths, not just the position of a
fixed pattern. The first spread stays faster/deeper than the second; the
shoulders remain slow but moving. The shared timing warp remains unchanged.
`out` reverses/mirrors the whole gesture; `inout` mirrors it in two halves.
The early-stroke/late-bloom chronology describes mode `in`.

This intentionally replaces the earlier ink redesigns, **including Character
zero and drift zero**, in message, mono/MC signal and Gen implementations.
It is not a reproduction of EnvGen's random letter-profile generator.

At native Character, tests require one connected retreat per half-gesture,
exceeding 0.20 output units over 0.20 of the input interval, with signed draws
-1, -0.5, 0, 0.5 and 1, hard/soft limiting and 1025/8193 samples.
`inout` halves both thresholds. Character 0.5 must already produce a retreat
above 0.08 over 0.12 of the interval; Character zero must have none.
Tests also check the affine attack, both spreading velocities, shallower
second spread, creeping shoulders, unchanged early strokes and all localized
rounding joins across the full drift range.

### Shared numerical and sampling checks

Tests require a Character 0-to-1 RMS difference above 0.02 and an absolute
difference above 0.01 over at least 30% of the progression, at signed structural
draws -1, -0.5, 0, 0.5 and 1, with both hard and soft limiting. `inout` halves
the amplitude thresholds. Representative 250 ms, 500 ms, 1 s and 2 s ramps
also retain an RMS difference above 0.012 on shifted 20 ms sampling grids.
These are output-shape tests, not listening tests or universal audibility claims.

Message-rate resolution still matters: the 20 ms grain of timed `azu.morph`
samples only the eight tooth boundaries of a 160 ms ratchet ramp, erasing the
Character effect at drift zero. Use a finer message grain or a signal-rate
progression for short gestures; the viewer's dense plot cannot prevent this.

### Fracture

`fracture` is appended as function **17**, after `spiccato` (16). All previous
indices, defaults and curve formulas remain unchanged by this addition.
It is a deterministic, stateless faceted relief, not a port of EnvGen's
random midpoint-displacement algorithm. No other EnvGen generators are added.

At drift zero, its main time/value landmarks are `(0,0)`, `(0.13,0.25)`,
`(0.28,0.12)`, `(0.35,0.48)`, `(0.58,0.38)`, `(0.71,0.80)`,
`(0.80,0.61)`, `(0.92,0.94)`, `(1,1)`. Between landmarks, 84% of each
facet is affine; the remaining ends are rounded with the same C1 ramp used
by ink. A smaller ridge of height 0.08 grows from 0.43 to 0.47 and falls
away by 0.53, nested within the long descending facet. This provides two
geometric scales, not an infinite fractal or high-frequency noise.
There are no value jumps, periodic teeth or damped oscillations.

Character 0 is an exact line; 0..1 blends toward the complete relief;
values above one exaggerate it and negative values invert its departure
from the line, before headroom limiting. At Character 1 the raw relief
stays within 0..1, so hard clamping does not erase its shape.
Drift continuously redistributes facet lengths/heights and the secondary
ridge while retaining their ordering. The existing time warp, hashes and
generation rules are reused; the same generation/stream repeats exactly.

Tests check primary landmark depths, an actual secondary reversal above
0.02, affine facets, C1 joins and a linear zero-character baseline across
201 signed structural draws. At least three distinct retreats per half
remain at 1025/8193 samples with either hard or soft limiting.
Representative 20 ms message grids retain a measurable overall Character
effect, but short ramps can still miss the smaller ridge. This is a
control trajectory, not a claim about audibility or audio anti-aliasing.

`nextdrift` increments the object's unsigned 32-bit generation (wrapping at
2^32); `resetdrift` returns it to zero. Neither outputs anything. A generation
selects stable time-warp and structural-jitter variations using the
same hash calculation as audio Ease's channel zero. The initial generation is
zero, not an unvaried special case when drift is enabled.

Numbers, list elements, bang, state changes, retarget and backward progression
do not advance the generation. `resetdrift` does not clear settings, data, states or
remembered progression. No seed or per-parameter variation in this version.

## Static function viewer

Open [functions viewer.maxpat](../patchers/functions%20viewer.maxpat) with
`externals/` on Max's search path. It opens in Presentation mode and uses
`azu.ease`, without DSP, to plot 1025 uniformly spaced samples including both
endpoints. Function, mode, Character / Overshoot, headroom and drift changes
queue a recalculation on Max's low-priority thread. This keeps complete draws
serialized when controls are driven by both the scheduler and the UI; the
display may lag under rapid automation. Defaults match `azu.ease`.

The 720 x 360 plot shows the actual limited output, not the raw formula.
Its Y range stays at -0.5..1.5 for headroom <= 0.5, preserving a common scale
between functions; larger headroom expands it to -headroom..1+headroom.
Nextdrift selects the next deterministic drift generation; `resetdrift` returns to
generation zero without resetting settings. With drift zero they do not
change the curve. The abstraction retains its function-menu inlet and emits
the selected settings and drift commands through its outlet.

This is a static sampled view: very fine details remain approximated by line
segments. It does not show audio function-change crossfades, automatic
per-cycle drift reseeding or MC channel variation.

## Gen~ implementation

[`patchers/azu.ease.gendsp`](../patchers/azu.ease.gendsp) loads our own
[`AzumatoneEaseFunctions.genexpr`](../patchers/AzumatoneEaseFunctions.genexpr)
library. It does not depend on Max Ease or `InterpEaseFunctions.genexpr`.
Add `patchers/` to Max's search path, keeping both files available, then
instantiate `gen~ azu.ease` with normalized progress on inlet 1.
The `.gendsp` extension is implicit; existing `gen~ azu.ease.gen` boxes must
be renamed to `gen~ azu.ease`.
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

For automatic per-cycle variation and MC channel identification, use
`gen~ azu.ease` / `mc.gen~ azu.ease` or copy its full codebox. It keeps
`History` state and a local `Data weights(19)` array in the codebox, caches
hashes on restarts, and calls pure library functions for drift, curve evaluation
and output limiting. Direct `azuEaseEvaluate` callers
must supply the generation and zero-based stream explicitly.

`require` imports GenExpr function definitions, not compiled Max externals.
All function definitions precede executable statements. One curve selector
plus one mode selector covers all 19 curves without separate In/Out/InOut names.
The numeric selectors and defaults remain:

Gen~ parameters are numeric, not symbolic menus. `function` is bounded to
`0..18` by its Param declaration and rounded to the nearest integer during
evaluation; fractional inputs cannot interpolate or select nonexistent curves.
The host may still display a decimal value. For named selection, connect a
Max `umenu` (items in the order below) through `prepend function`.

| Param | Values |
|---|---|
| `function` | `0` smoothstep, `1` gompertz, `2` viscous, `3` spring_soft, `4` spring_tight, `5` bounce_gravity, `6` recoil, `7` magnetic_snap, `8` stutter, `9` ratchet, `10` collapse, `11` phi_spiral, `12` ink_diffusion, `13` hesitate, `14` bow_change, `15` ricochet, `16` spiccato, `17` fracture, `18` bounce_viscoelastic |
| `mode` | `0` in, `1` out, `2` inout |
| `overshoot` | Curve character/intensity; default `1` |
| `headroom` | Output soft-limit margin; default `0.5`; `0` or less hard-clamps |
| `drift` | Deterministic variation depth per drift generation, clipped to `[0, 1]`; default `0` |

The public parameter names match the other Ease objects. Earlier Gen~ patches
using `curve` or `jitter` must now send `function` or `drift`, respectively.
The former direct signed structural control has been replaced by the full
audio `drift` mechanism; negative values now clip to zero.

In all Ease implementations, `drift` leaves `overshoot` unchanged,
warps progress by up to `0.12 * sin(pi*x)`, and now supplies function-specific
structural variation to all 19 curves, not just four. The time warp, generation
hashes and drift-renewal rules are unchanged; `drift 0` disables drift variation.
The Character redesign described above still applies at drift zero.
Nonzero drift intentionally produces different results from earlier builds.
Hashes stay fixed throughout each ramp.
A restart must jump more than `0.5` and land below `0.05` or above `0.95`,
with both samples inside `[0, 1]`. Continuous ramps and ordinary direction
reversals do not reseed. State tracking pauses at `drift 0`, as in the audio
external; the initial previous sample is invalid, so startup is not a restart.

`azu.ease~` and `mc.azu.ease~` also accept a `nextdrift` message. It advances
the drift generation of every channel by one, exactly like a detected restart,
at the start of the next signal vector. `resetdrift` returns every channel to
generation zero; a `nextdrift` sent after it is still applied. As in `azu.ease`,
both messages also apply to channels whose drift is currently zero.
The supplied Gen patch has no equivalent messages; it renews drift only on
detected restarts.

The former `reset` message of `azu.ease` and `azu.morph` has been renamed
`resetdrift`, without an alias; `azu.fluence~` keeps `reset` for its ensemble.

### Structural drift

The structural draw is `j = drift * (2 * hash - 1)`, independent of the timing
draw, reproducible per generation and MC stream. A single draw controls a
coherent combination of material parameters; it is not fresh noise per sample.
The following ranges are reached at the theoretical extremes `j = -1..1`:

| Function | Structural changes at full drift |
|---|---|
| `smoothstep` | Asymmetric contour term `2.4*j*x^2*(1-x)^2` (up to +/-0.15); native intensity remains monotone |
| `gompertz` | Steepness 3.6..8.4; center 0.23..0.47; endpoints renormalized |
| `viscous` | Stiction threshold 0.028..0.132; drag rate 2..6 |
| `spring_soft` | Damping 2.75..7.25; frequency +/-22%; oscillatory amplitude +/-25% |
| `spring_tight` | Damping 0.66..1.74; frequency +/-22%; oscillatory amplitude +/-25% |
| `bounce_gravity` | Character controls velocity restitution; native structural range approximately 0.659..0.741; settling time 0.94..0.98 |
| `bounce_viscoelastic` | Contact duration +/-18%; restitution +/-0.02; internal absorption time 0.86..0.90 with overlapping final resolution; six contacts and five flights retained |
| `recoil` | Charge fraction 0.27..0.43; pull depth +/-40%; approach rate 2.5..7.5; ringing damping/frequency/amplitude also vary |
| `magnetic_snap` | Attraction strength +/-35% and kernel exponent 0.6..1.4; five detent levels unchanged |
| `stutter` | Pulse spacing/width +/-35%, plus initial pulse amplitude and decay ratio +/-25%; four pulses retained |
| `ratchet` | Catch fraction 0.4125..0.6875 per tooth; setback depth 0.126..0.234 of a tooth; eight teeth retained |
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
envelope; it does not merely multiply the public `overshoot` setting.
Some functions also vary their baseline (for example viscous and collapse).

At native Character, `hesitate` retains its original two symmetric Gaussian
dips at `j = 0`, within floating-point rounding.
As `abs(j)` grows, both attempts move later into the progression: centers are
`0.15 + 0.20*abs(j) + 0.04*j` and `0.27 + 0.24*abs(j) + 0.10*j`.
Their separation is `0.12 + 0.04*abs(j) + 0.06*j`, rather than collapsing
the second dip into the first. Depths are `0.14*(1 - 0.3*j)` and
`0.05 + 0.15*abs(j) + 0.08*j`, exchanging emphasis between the attempts.
Each dip has separate withdrawal/recovery widths: first
`0.05*(1 - 0.3*j)` / `0.05*(1 + 0.5*j)`, second
`0.04*(1 + 0.3*j)` / `0.04*(1 - 0.5*j)`.
The halves meet with matching value and slope; endpoint anchoring remains.
Positive draws favor a slower recovery from the first attempt and a deeper,
sharply released second attempt; negative draws favor the first retreat.
This intentionally changes nonzero-drift hesitation curves from earlier builds,
without changing other functions or the shared time warp.

At native `overshoot 1`, tests require two measurable retreats at structural
draws `-1`, `-0.5`, `0.5`, `1`, even with `headroom 0` and at the viewer's
1025-point resolution. Each retreat must exceed 0.01 output units and 0.015
of the input interval (`inout` halves both thresholds and mirrors the gesture).
Small draws still approach the original curve continuously and do not guarantee
a perceptible second reversal. Zero character still removes both dips, leaving
the smoothstep baseline before the shared time warp.

This takes inspiration from the EnvGen generator's material-specific variation,
not its random breakpoint walk or contour postprocessing. Ease remains a
closed-form mapping without point buffers or new per-sample random draws.
Do not expect identical drift strength across functions, nor a minimum
variation on every drift generation: the signed draw can be near zero. In the viewer,
use `drift 1` and compare several nextdrift messages; `resetdrift` restores generation 0.
Changing drift during a running gesture is not smoothed.

Each MC instance uses `mc_channel() - 1` as its stream index, matching the
audio external's zero-based channel salt. The 32-bit generation, hash and
variation formulas match C++; no continuously changing noise is introduced.
Recreating/recompiling the Gen patch initializes its histories again.
Function changes crossfade linearly over 10 ms, matching the audio external.
Each instance retains its current mixture of curves when a change interrupts
a fade, so the new fade starts without a value step. Repeating the current
selection does not restart the fade. Only curves with nonzero weights are
evaluated, and headroom limiting is applied once, after mixing.
Drift inputs are computed once per sample before the blending loop. At rest,
only the selected curve is evaluated and the weight array is not read or
written; the loop runs only during a fade or to initialize the mixture.
Each MC instance owns its own weight array.
The first processed sample uses the initial selection and Character directly.
Live Character changes use the separate 5 ms per-instance ramp described above;
mode, headroom and drift changes are not smoothed, just as in the audio external.

For six channels, send this message to `mc.gen~ azu.ease @chans 6`:

```text
applyvalues drift 0. 0.2 0.4 0.6 0.8 1.
```

`setvalue 3 drift 0.7` changes only channel 3. Even identical nonzero depths
are decorrelated across channels; `drift 0` disables drift variation.
`drift 1` means maximum timing/structural variation, not maximum bounce.
Unlike the earlier implementation, it never reduces character intensity to
zero: `ricochet` retains its bounce contribution at the chosen `overshoot`.
This intentional change applies to Gen~, audio and message Ease/Morph objects.
Rebuild and reload the C++ externals to use the new behavior there.
Regression checks sweep all 19 curves in all three modes at structural jitter
`-1`, `-0.5`, `0`, `0.5`, `1`, with native `overshoot 1`, before output limiting.
They check both distance from a line and preservation of the character
contribution relative to each curve's own `overshoot 0` baseline.
Separate C++ and GenExpr sweeps isolate structural drift without the shared
time warp: at `j = -1` and `j = 1`, every native curve must differ from its
`j = 0` curve by more than 0.003 RMS (0.0015 in `inout`).
Tests also check native curve-family monotonicity, varied endpoint continuity,
exact endpoints, deterministic generations, bounds and C++/GenExpr parity.
The time warp remains strictly increasing at full depth, so it cannot skip
an entire interior gesture. This does not guarantee identical visual prominence:
structural variation can change pulse overlap, and hard limiting (`headroom 0`)
can still remove excursions. Explicit `overshoot 0` also intentionally removes
the scaled contribution (or removes rebounds for `bounce_gravity`, or selects
the firmest contact for `bounce_viscoelastic`).

`ink_diffusion` uses the same rounded-ramp arithmetic in C++ and GenExpr,
without an error-function approximation. Like the other curves,
its arithmetic comparisons use a `1e-12` tolerance.
The internal endpoint is anchored before the
mode transform, including the exact `0.5` join of `inout` before drift's
time warp (the input midpoint itself may move when drift is enabled).

The automated test checks library loading/wiring and evaluates the GenExpr
arithmetic against the C++ curves over all modes, with negative/zero/positive
character, drift depths, generations, MC streams, limiting and boundary cases.
It also checks restart detection and per-instance History sequencing. This arithmetic
check compares interrupted/repeated function fades with the C++ blend at
44.1, 48 and 96 kHz, plus a non-integer 10 ms sample count. It models Data
reads/writes, checks independent MC mixtures and verifies one drift calculation
per sample plus the single-curve idle path. These operation-count checks are
not a native CPU benchmark. This
check is not a substitute for compiling the patch in Max: after updating,
reopen/recompile `gen~ azu.ease` and check the Max console.

## azu.ease

The helpfile's function selector groups related gestures in a presentation-only
order and sends function names; registered numeric indices remain unchanged.
`bang` recalculates the last input after settings change; `nextdrift` and
`resetdrift` change the deterministic drift generation without emitting output.
The optional auto-run uses Max messages, not DSP. Its labeled output display
covers `-0.5..1.5` (default headroom); larger headroom can exceed that display scale.

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

## azu.morph

One inlet, a left list outlet and a right status outlet. States must be nonempty
numeric lists. The first list initializes and outputs the state immediately.
Later lists define destinations, starting at the latest successful output.

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

By default, a number drives progression and `bang` recalculates the remembered
progression. A destination list resets progression to zero without emitting a
new state. Finite progressions outside 0..1 saturate to endpoints. Output is
always a list of floats. For a one-value state in manual mode, send an explicit
`list 100.` to initialize, then `list 500.` to choose a destination; a bare number
is reserved for progression. `progress <p>` also works in either control mode.

Destination lengths must match the latest output. Use `clear` before changing
dimension. No padding, scalar broadcasting or truncation occurs. The former
`from`, `to` and `retarget` input messages are removed; migrate initialization
to lists (optionally preceded by `clear`) and send subsequent lists as targets.

### Direct timed use

Set a duration to enable timed mode:

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
output instead of reinitializing. `duration <ms>` enables this mode at runtime;
`@duration <ms>` enables it at creation. A duration of zero moves to the
destination immediately. Updating the duration affects the next destination, not
a transition already in progress. The right outlet reports `retargeted` when a
destination is accepted and `done` after its final list is emitted. `stop` keeps
the current output. In timed mode, a single number is a one-value destination;
use `progress <p>` to cancel the timer and explicitly apply a progression. Without
a duration setting, the object remains externally driven: numbers are
progressions, while lists initialize or prepare destinations without animation.

`clear` cancels the current transition without emitting data or `done`, empties
both endpoints and the last output, and returns progression to zero. It preserves
the current control mode, duration, Ease settings and drift generation. In timed
mode, the next valid number or list initializes immediately, including a different
list length. In external mode, the next list initializes immediately.
`resetdrift` resets the drift generation only; it does not affect states or progression.

`duration` is a Max attribute: creation arguments, runtime messages and attrui
use the same validated setter. `dump` reports its stored duration in milliseconds
and identifies the attribute-only dispatch implementation.

This mode uses Max's message scheduler and emits approximately every 20 ms; it
does not provide audio-rate control. It requires no JavaScript coordinator or
companion abstraction.

### Continuous retargeting with an external ramp

In externally driven mode, each destination list snapshots the **last
successfully emitted numerical state** as the start and sets remembered
progression to zero. It does not emit state data, advance drift, or control the
external ramp. Invalid destination requests change nothing.

The right outlet emits `retargeted` synchronously, after a successful retarget
has committed. A rejected request emits no success notification and leaves the
running transition untouched. Use `[route retargeted]` to stop the old `[line]`
and send `0., 1. 2000` only after success, not an unconditional trigger chain.
Returning to p=0 reproduces the previous output exactly. Reusing the old
mid-ramp progression instead would immediately advance within the new gesture.
Continuity is of values, not velocity or physical momentum. To renew drift,
send `nextdrift` explicitly before restarting the ramp.

### Units and bounds

Interpolation is affine in the supplied units. Hz is linear in Hz; no special
handling of angles, discrete values, perceptual scales or logarithmic domains.
With `headroom 0`, each parameter remains between its two state values.
Positive headroom permits extrapolation proportional to each parameter's
A-to-B interval, including reversed intervals. Constant parameters stay constant.
It is **not** a limiter for final Hz, gain, pan or other physical units.
Protect downstream ranges separately if overshoot is enabled.

This is not Fluence: no inertia, velocity, coupling or target pursuit.

### Inspecting state

`dump` prints settings, drift generation, full A/B and last-output lists, list
lengths, remembered progression and readiness to the Max console, without
producing outlet data. `azu.ease` also supports `dump` for its last input.
Length errors report both sizes; destination errors compare the request with the
last output, which is the source of the new transition.

### Timed examples

Open [azu.morph-timed.maxpat](../help/azu.morph-timed.maxpat) from the main
helpfile for a one-parameter example using `azu.morph @duration 2000 @headroom 0`.
The first number initializes; later numbers are destinations. Use `clear`
followed by a value to initialize again without a transition.

The former timed companion abstraction and JavaScript coordinator have been
removed. In older patches, replace the abstraction with `azu.morph` using the
same explicit duration and Ease attributes. Replace `set <values>` with
`clear` followed by a numeric list. Specify `@headroom 0` to retain the old
abstraction's bounded default; the external's default remains 0.5.

The right outlet emits `done` after the final state, including duration zero.
Initialization, `bang`, `clear`, `stop` and superseded transitions do not emit
`done`. Avoid an immediate infinite cycle of zero-duration targets.
Lists can be distributed with `[unpack f f f]`; audio controls may require
downstream signal interpolation. The migrated examples still need manual
review in Max; automated patch-structure tests do not replace that check.

### Musical comparison

Open [demo_azu_morph.maxpat](../demo_azu_morph.maxpat) from the package root.
It opens in Presentation mode, with audio opt-in and volume initialized to zero.
Enable audio manually and raise Volume gently.

Three destinations control filter cutoff, gain and stereo pan of one shared
sawtooth source. Two identical voices are driven in parallel: one by three
ordinary Max `line` ramps, the other by `azu.morph`. Both receive the same
targets and duration. The listening menu crossfades between them over 30 ms;
switching it does not restart either trajectory. Reset returns both to A.
Try Reset > B with Linear, then repeat with Ease / hesitate. Choose C while
moving to test a new destination. Function edits affect only the Ease path;
choose a function before starting a gesture to avoid a mid-gesture shape jump.

The demo voice bounds physical ranges independently of Ease's headroom,
smooths controls over 20 ms and clips the filtered signal before gain.
Master gain is capped at 0.15; the resulting per-channel peak is at most
0.03375. The demo never sends an automatic DSP-on message. Use a sensible
listening level; stereo positioning is best heard over two speakers/headphones.
This illustrates expressive state transitions, not a velocity-preserving
physical model, logarithmic interpolation or a preset-management system.
Native loading verifies that the complete demo and both voices resolve; the
automated checks cover routing, shared destinations/duration and gain bounds.
Listening quality and audio-device-specific behavior still require audition.

## Errors and limits

Inputs and states must contain 1..32767 finite numbers (Max's list outlet uses
a signed short count). A symbol, empty list, non-finite value or oversized
message rejects the entire request, logs an error and does not partially update
stored data. No implicit symbol-to-zero conversion. Creation accepts attributes
only, not positional arguments.

Calculation errors (missing input/states, unequal sizes, numerical overflow)
emit nothing. Overflow is checked before limiting as well as after interpolation;
it is not silently hidden by headroom. The last successful calculation remains
available. Accepted destination lists remain stored.
Allocation failures are reported explicitly.

## Build and verification

Run these commands from the separate development folder, with Max closed:

```sh
cmake -S . -B build/externals -G Xcode
cmake --build build/externals --config Release
cmake -S tests -B build/tests -DCMAKE_BUILD_TYPE=Release
cmake --build build/tests
ctest --test-dir build/tests --output-on-failure
```

macOS builds default to Intel/Apple Silicon universal bundles directly in the
active package's `externals/`, not the development folder.
The new message targets retain the SDK's packaging but remove its automatic MSP
and Jitter link dependencies. The pure C++ tests do not require Max.
The existing Windows helper remains Fluence-only; Windows native loading of the
new objects is not certified.

Keep the active package in Max's Packages directory; do not add development
or personal-test folders to Max's global search path. Restart Max after
rebuilding and open [Ease help](../help/azu.ease.maxhelp) and
[Morph help](../help/azu.morph.maxhelp) from the installed package.

Native acceptance on Max 9.0.9 / macOS arm64 checked 924 cases across message
Ease/Morph, mono/MC Ease signal and mono/MC Gen (7,392 checks), with no failures
or captured console errors. Normal-shape comparisons used absolute tolerance
`1e-9`; the maximum observed error was approximately `2.1e-13`.
At enormous spring frequencies, 288 checks required only finite, headroom-bounded
outputs, not phase parity beyond floating-point resolution.
The run included all 19 functions, all modes, drift zero/full, Character near
zero/one, signed extremes, hard limiting and exact endpoints for the four
reshaped curves. DSP was stopped after testing; no signal was routed to speakers.
This does not certify native Intel/Windows execution, CPU headroom, visual
help layout or subjective musical quality.

Native testing also exposed a Gen loop-local compilation issue in stutter,
resolved by explicitly expanding its four pulses without changing their math.
Unsigned hash arithmetic now avoids large integer literals and overflowing
integer accumulators in Gen; it retains the C++ generation/stream mapping.
JavaScript arithmetic parity alone cannot detect these native compiler issues.

Native Max acceptance (not replaced by standalone or mock tests):

- Restart Max if a previous binary is loaded; resolve both new objects.
- Open both helpfiles with DSP off; check number/list shapes and attribute menus.
- Change functions/modes, then bang; verify there is no timed output.
- Test repeated input, nextdrift and resetdrift with nonzero drift.
- Click targets repeatedly during the companion helpfile's ramp: no value jump at
  the restart, with normal completion at the new target.
- Exercise deliberate errors, restore initial states, and check console messages.
- Enable recoil/headroom and inspect excursions; check helpfile layout/wiring.
