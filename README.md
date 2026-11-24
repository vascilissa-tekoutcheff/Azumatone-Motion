# Azumatone Motion

Azumatone Motion is a collection of Max objects for shaping motion and
expressive transitions.

## Installation

Place the `Azumatone Motion` folder in your Max Packages folder, then restart
Max. On macOS with Max 9, the folder is normally
`~/Documents/Max 9/Packages/`.

The included `.mxo` externals are universal macOS builds for Intel and Apple
Silicon.

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

For `azu.fluence~` and `mc.azu.fluence~`, voice profiles are pseudo-randomly
reassigned when the input reverses direction or starts moving after at least
10 ms at a constant value. In bounded mode, a direction change must exceed
one millionth of the range span. The profile favoring the gesture's direction
is assigned to a different channel on consecutive gestures (when there are
multiple channels). Positions and velocities are preserved, so existing momentum may
still make another channel visibly lead. The detector follows the input
signal itself, including values outside a bounded range.

For message objects, Ease functions and Gen~ usage, see
[message-objects.md](docs/message-objects.md). The package also includes the
`azu.ease.gendsp` Gen~ patch and its supporting `AzumatoneEaseFunctions.genexpr`.

## License

Azumatone Motion is distributed under the MIT License. See [LICENSE](LICENSE).

It may be used in personal, educational and commercial Max projects. Modified
or redistributed copies must retain the copyright notice and license text.

The Cycling '74 Max SDK used to build the externals retains its own license.
