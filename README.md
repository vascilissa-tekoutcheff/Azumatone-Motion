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
| `azu.ease~` | Map a progress signal through 19 expressive curves, with Character, headroom and reproducible drift. |
| `mc.azu.ease~` | Apply the Ease curves per channel, with independently varied drift across an MC signal. |
| `azu.ease` | Evaluate the same curves on individual numbers or lists at message rate. |
| `azu.fluence~` | Turn one target signal into coupled elastic trajectories with inertia, damping, cohesion and dispersion. |
| `mc.azu.fluence~` | Deliver the same coupled ensemble as one multichannel signal. |
| `azu.morph` | Interpolate complete numeric states along an Ease curve, with continuous retargeting and externally driven or timed progression. |

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
