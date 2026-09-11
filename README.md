# GstarCAD Grid & Snap Tools

Set grid and snap spacing in one command, toggle both together, and switch polar tracking angles instantly.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Drafting aids should be one command away. This small set sets the grid and snap spacing from two prompts, toggles snap and grid together, and switches polar tracking between 45, 15 degrees and off without digging through settings dialogs.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/grid-setup.lsp` | ;; grid-setup.lsp - Set grid and snap spacing in one command
;; Command: GRIDSET
(defun c:GRIDSET ( / s g )
  (setq s (getdist "\nSnap spacing <10>: "))
  (if (null s) (setq s 10.0))
  (setq g (getdist "\nGrid spacing <50>: "))
  (if (null g) (setq g 50.0))
  (setvar "SNAPUNIT" (list s s))
  (setvar "GRIDUNIT" (list g g))
  (setvar "SNAPMODE" 1)
  (setvar "GRIDMODE" 1)
  (princ "\nGrid and snap updated.")
  (princ)
)
 |
| `scripts/snap-toggle.lsp` | ;; snap-toggle.lsp - Toggle snap and grid together
;; Command: SNAPTOG
(defun c:SNAPTOG ( / on )
  (setq on (if (= (getvar "SNAPMODE") 0) 1 0))
  (setvar "SNAPMODE" on)
  (setvar "GRIDMODE" on)
  (princ (if (= on 1) "\nSnap and grid on." "\nSnap and grid off."))
  (princ)
)
 |
| `scripts/polar-tracking.lsp` | ;; polar-tracking.lsp - Polar tracking angle presets
;; Commands: TRACK45 / TRACK15 / TRACKOFF
(defun c:TRACK45 ( )
  (setvar "POLARANG" (/ pi 4.0))
  (setvar "POLARMODE" 1)
  (princ "\nPolar angle set to 45 degrees.")
  (princ)
)
(defun c:TRACK15 ( )
  (setvar "POLARANG" (/ pi 12.0))
  (setvar "POLARMODE" 1)
  (princ "\nPolar angle set to 15 degrees.")
  (princ)
)
(defun c:TRACKOFF ( )
  (setvar "POLARMODE" 0)
  (princ "\nPolar tracking off.")
  (princ)
)
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
