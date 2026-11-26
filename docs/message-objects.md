# Message objects, Ease functions and Gen~

*Azumatone Motion package · Created by Timothée Rémi-Tekoutcheff*

`azu.ease` and `azu.morph` use the same 19 Ease functions as `azu.ease~`,
`mc.azu.ease~` and the supplied Gen~ library.

## Shared attributes

| Attribute | Default | Behavior |
|---|---|---|
| `function` | `smoothstep` | One of the 19 registered functions |
| `mode` | `in` | `in`, `out`, `inout` |
| `overshoot` | `1` | Character intensity: native at 1; exaggerated above 1. The inspector label is **Character / Overshoot**. Controls elasticity for `bounce_gravity` and contact softness for `bounce_viscoelastic`. |
| `headroom` | `0.5` | Soft output margin around 0..1; values <=0 hard-clamp. |
| `drift` | `0` | Deterministic variation depth, clipped to 0..1. |

On the two message objects, attributes are scalar and global, including for
lists. On `mc.azu.ease~`, `overshoot`, `headroom` and `drift` accept one value
per channel.

## azu.ease

```text
azu.ease @function smoothstep

0.25                    -> float 0.15625
0. 0.25 0.5 0.75 1.     -> list 0. 0.15625 0.5 0.84375 1.
function bow_change     -> no output
bang                    -> reevaluate the last valid input
```

Each list element is an independent progress value and shares the same drift
generation. Finite input outside 0..1 saturates to the endpoints before drift
is applied.

Changes do not produce output. Send an input or `bang` to calculate. `nextdrift`
and `resetdrift` also produce no output. `dump` prints the settings and last
valid input to the Max console.

## azu.morph

`azu.morph` transitions between nonempty numeric lists along one Ease curve.
The first list initializes and outputs the state. Later lists set destinations
from the latest successful output.

```text
220. 0.1 -0.5            -> initialize immediately
880. 0.8  0.5            -> store destination; emit retargeted
0.                       -> 220. 0.1 -0.5
0.5                      -> 550. 0.45 0.
1.                       -> 880. 0.8 0.5
```

With `q = Ease(progress)` after mode, drift and headroom:

```text
output[i] = (1-q) * start[i] + q * target[i]
```

| Message | Effect |
|---|---|
| list | Initialize on the first use; then select a destination |
| number | Progress in external mode; a one-value destination in timed mode |
| `progress <p>` | Set progression explicitly in either mode |
| `bang` | Recalculate the remembered progression |
| `duration <ms>` | Enable timed mode; also available as `@duration <ms>` |
| `external` | Return to externally driven progression |
| `stop` | Stop a timed transition and keep its last output |
| `clear` | Stop and forget both states |
| `nextdrift`, `resetdrift` | Change drift generation without output |
| `dump` | Print settings, states, lengths and progression without outlet output |

The right outlet emits `retargeted` after a destination is accepted and `done`
after the final output of a timed transition.

### External mode

External progression is the default. A destination list snapshots the last
successful output as its start, resets remembered progression to zero and emits
only `retargeted`. Send `progress <p>` or a scalar progression after that.
At p=0 the output equals the previous state; reusing an old mid-ramp progression
would jump directly into the new transition.

For retargeting an external line, send the new ramp only after
`[route retargeted]` reports success. Continuity is in value, not velocity.
`nextdrift` is explicit: choose a new generation before restarting the ramp.

Destination lengths must match the latest output. Use `clear` before changing
dimension. There is no padding, broadcasting or truncation.

### Timed mode

```text
azu.morph @duration 750 @function hesitate

280. 0.18 -0.8       -> initialize and output
4200. 0.1 0.8        -> transition over 750 ms
1100. 0.24 0.        -> retarget from the latest emitted state
progress 0.5         -> cancel the timer and set progression
stop                 -> stop and retain the current output
```

`duration` uses the same validated attribute setter at creation and runtime.
Changing it affects the next destination. A duration of zero moves directly to
the destination. In timed mode, a number can initialize a one-value state and
later numbers select destinations. The scheduler emits approximately every
20 ms, so timed mode is not audio-rate control.

`done` is emitted after the final state, including duration zero. Initialization,
`bang`, `clear`, `stop` and superseded transitions do not emit it.

`clear` emits neither data nor `done`, forgets both endpoints and the last
output, and returns progression to zero. It preserves mode, duration, Ease
settings and drift generation.

[azu.morph-timed.maxpat](../help/azu.morph-timed.maxpat) is the package example.

### Units

Interpolation is affine in the supplied units. Angles, discrete values and
perceptual or logarithmic domains are not special-cased. `headroom 0` keeps each
parameter between its two state values; positive headroom permits proportional
extrapolation. It does not protect final Hz, gain, pan or other physical units.

`azu.morph` does not provide Fluence's inertia, velocity, coupling or pursuit.

## Errors and limits

Inputs and states must contain 1..32767 finite numbers. A symbol, empty list,
non-finite value or oversized message rejects the entire request and does not
partially update stored data. Missing states, unequal dimensions and numerical
overflow produce no output. The last successful calculation remains available.

## Ease functions

The function menu follows the browsing order below. Numeric IDs are listed in
the [Gen~](#gen) table.

The 19 functions are grouped into four families:

- **Curves**: `smoothstep`, `gompertz`, `viscous`
- **Dynamics**: `spring_soft`, `spring_tight`, `bounce_gravity`,
  `bounce_viscoelastic`, `recoil`, `magnetic_snap`
- **Gestural behaviors**: `stutter`, `ratchet`, `collapse`, `phi_spiral`,
  `ink_diffusion`, `hesitate`, `fracture`
- **Articulations**: `bow_change`, `ricochet`, `spiccato`

| Family | Function | Character 1 |
|---|---|---|
| Curves | `smoothstep` | Cubic S-curve |
| Curves | `gompertz` | Asymmetric sigmoid: slow start, fast middle, long tail |
| Curves | `viscous` | Stiction, then an exponential catch-up |
| Dynamics | `spring_soft` | Slow, heavily damped spring |
| Dynamics | `spring_tight` | Taut, lightly damped spring |
| Dynamics | `bounce_gravity` | Ballistic fall and inelastic rebounds |
| Dynamics | `bounce_viscoelastic` | Indentation, recovery and decaying flights |
| Dynamics | `recoil` | Pull-back, snap and damped ring |
| Dynamics | `magnetic_snap` | Smooth attraction toward five levels |
| Gestural behaviors | `stutter` | Four shrinking alternating pulses |
| Gestural behaviors | `ratchet` | Eight climbs with broad mechanical setbacks |
| Gestural behaviors | `collapse` | Pre-tension, compressed release and hold |
| Gestural behaviors | `phi_spiral` | Log-periodic oscillation around the golden-ratio point |
| Gestural behaviors | `ink_diffusion` | Near-linear mark, then two spreading stages |
| Gestural behaviors | `hesitate` | Two backward dips before commitment |
| Gestural behaviors | `fracture` | Unequal facets and a smaller nested ridge |
| Articulations | `bow_change` | Dip and catch around a bow change |
| Articulations | `ricochet` | Decaying oscillation with accelerating repetitions |
| Articulations | `spiccato` | `smoothstep` with a deep notch near 0.45 |

### Character and mode

For the functions that scale a character contribution, values between 0 and 1
move toward the complete gesture and values beyond 1 exaggerate it. Negative
finite values are accepted. `bounce_gravity` and `bounce_viscoelastic` treat
zero and negative values alike:

- `bounce_gravity`: no rebound at <=0; positive Character increases restitution.
- `bounce_viscoelastic`: <=0 selects the firmest contact; positive Character
  increases softness and restitution.

`spring_soft` and `spring_tight` scale amplitude through Character 1. Above 1,
the soft spring becomes slower and doughier, while the tight spring gains cycles
and rings longer. `recoil` and `hesitate` shape their sub-gestures nonlinearly:
the pull-back and second hesitation gain relative weight above native.

`out` reverses and reflects the gesture; `inout` applies it to two halves.
Descriptions in this file refer to mode `in`.

Fast or abruptly changed curves can alias in audio use; Character does not make
the package an anti-aliasing filter.

## Drift

`drift` adds reproducible, generation-based variation to timing and curve
structure without changing `overshoot`. It affects all 19 functions; `drift 0`
disables it. MC channels receive decorrelated variations even at the same
depth.

On message objects:

- `nextdrift` selects the next generation;
- `resetdrift` returns to generation zero;
- neither message produces output or clears settings and states;
- normal input, retargeting and backward progression do not advance generation.

On `azu.ease~` and `mc.azu.ease~`, a generation also advances when the progress
signal jumps more than 0.5 into the region below 0.05 or above 0.95. Continuous
ramps and ordinary direction reversals do not reseed. The variation stays fixed
throughout a gesture.

`drift 1` is maximum variation depth, not maximum bounce or Character. A draw can
be close to zero, so variation is not necessarily equally prominent on every
generation or function.

## Signal objects

`azu.ease~` and `mc.azu.ease~` clamp progress to 0..1 before evaluating the
curve. `mc.azu.ease~` follows the input channel count unless `@chans N` fixes the
output width from 1 to 64; `@chans 0` follows the input.

On `mc.azu.ease~`, a list sets `overshoot`, `headroom` or `drift` per channel.
A shorter list holds its last value; extra values are ignored. `function` and
`mode` are global.

`nextdrift` advances every channel at the next signal vector. `resetdrift`
returns every channel to generation zero.

Live `overshoot` changes use a fixed 5 ms linear ramp. Function changes use an
independent 10 ms crossfade. Mode, headroom and drift changes are immediate.
Message objects and pure Gen library calls apply changes immediately.

## Gen~

[`azu.ease.gendsp`](../patchers/azu.ease.gendsp) uses the supplied
[`AzumatoneEaseFunctions.genexpr`](../patchers/AzumatoneEaseFunctions.genexpr)
library. Progress is expected on inlet 1.

```genexpr
require("AzumatoneEaseFunctions.genexpr");

Param function(0, min=0, max=18);
Param mode(0);
Param overshoot(1);
Param headroom(0.5);
Param drift(0);

out1 = azuEaseEvaluate(in1, function, mode, overshoot, headroom, drift, 0, 0);
```

Direct library calls supply the drift generation and zero-based stream
explicitly. `gen~ azu.ease` and `mc.gen~ azu.ease` retain the state needed for
automatic restart detection and MC stream selection.

Gen~ parameters are numeric:

| Param | Values |
|---|---|
| `function` | `0` smoothstep, `1` gompertz, `2` viscous, `3` spring_soft, `4` spring_tight, `5` bounce_gravity, `6` recoil, `7` magnetic_snap, `8` stutter, `9` ratchet, `10` collapse, `11` phi_spiral, `12` ink_diffusion, `13` hesitate, `14` bow_change, `15` ricochet, `16` spiccato, `17` fracture, `18` bounce_viscoelastic |
| `mode` | `0` in, `1` out, `2` inout |
| `overshoot` | Character intensity; default `1` |
| `headroom` | Soft-limit margin; default `0.5`; <=0 hard-clamps |
| `drift` | Variation depth, clipped to 0..1; default `0` |

For per-channel depth in `mc.gen~ azu.ease`:

```text
applyvalues drift 0. 0.2 0.4 0.6 0.8 1.
setvalue 3 drift 0.7
```

The Gen~ patch renews drift only on detected restarts; it has no `nextdrift` or
`resetdrift` messages.

## Static function viewer

[functions viewer.maxpat](../patchers/functions%20viewer.maxpat) plots the
limited output of `azu.ease`. It exposes function, mode, Character, headroom and
drift, plus `nextdrift` and `resetdrift`.

The viewer is sampled and does not show audio crossfades, automatic drift
renewal or MC channel variation.
