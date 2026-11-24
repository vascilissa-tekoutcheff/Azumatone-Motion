# Azumatone Motion

Azumatone Motion is a collection of Max objects for shaping motion and
expressive transitions.

## Installation and compatibility

Place the `Azumatone Motion` folder in your Max Packages folder, then restart
Max. On macOS with Max 9, the folder is normally
`~/Documents/Max 9/Packages/`.

Azumatone Motion requires Max 9 or later on macOS. The included `.mxo`
externals are universal builds for Intel and Apple Silicon; the Intel half has
not been tested natively. No Windows build is provided.

## Objects

| Object | Use |
|---|---|
| `azu.ease~` | Shape a normalized signal with an easing curve. |
| `mc.azu.ease~` | Shape a multichannel signal with easing curves. |
| `azu.ease` | Apply an easing curve to numbers or lists without DSP. |
| `azu.fluence~` | Create several elastic trajectories from one target signal. |
| `mc.azu.fluence~` | Create elastic trajectories in a multichannel signal. |
| `azu.morph` | Transition between values or lists of values. |

Open an object's help patch in Max for an interactive example. Signal-object
examples require DSP to be enabled; the help examples do not send sound to the
speakers.

The `mc.` objects are native multichannel externals. Use `mc.dup~` to send
the same mono signal to several channels.

`azu.fluence~` and `mc.azu.fluence~` drive several coupled elastic voices from
one mono target signal. The first argument sets the number of voices
(default 4). Attributes:

| Attribute | Default | Effect |
|---|---|---|
| `inertia` | `150` | Response time of the voices, in ms |
| `damping` | `0.35` | Damping of the voices' response |
| `cohesion` | `0.35` | Draws the voices together |
| `dispersion` | `0.5` | Spreads the voices apart during transitions |
| `mode` | `free` | `bounded` keeps the voices inside `range`; `free` may overshoot. Set at creation only |
| `range` | `0 1` | Bounds used by `mode bounded`; changes are smoothed over 10 ms |

Each voice has its own pseudo-random response profile. Profiles are reassigned
when the input reverses direction or starts moving after at least 10 ms at a
constant value, so with several voices the one favored by the gesture's
direction changes from one gesture to the next. Positions and velocities are
preserved, so existing momentum may still make another voice visibly lead.

For message objects, the 19 Ease functions and Gen~ usage, see
[message-objects.md](docs/message-objects.md). The package also includes the
`azu.ease.gendsp` Gen~ patch with its supporting `AzumatoneEaseFunctions.genexpr`,
and `functions viewer.maxpat` (in `patchers/`), a plot of every Ease function
with live settings.

## License

Azumatone Motion is distributed under the MIT License. See [LICENSE](LICENSE).

It may be used in personal, educational and commercial Max projects. Modified
or redistributed copies must retain the copyright notice and license text.

The Cycling '74 Max SDK used to build the externals retains its own license.
