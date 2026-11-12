# Changelog

## Features
---
## Bug fixes
- Fixed an instance of MultiReader object not being correctly released leading to a memory leak in the MultiReader example.
- Fixed an instance of Signal objects not being properly released in Overall example leading to a memory leak when repeatedly creating readers.
- Made a non-mandatory call optional which now prevents a crash that occurred from releasing a non-existent pointer.
---
## Misc
- This release has been tested with the latest version of openDAQ binaries (3.40.3), which have not been updated since the previous release (0.2.1).
- The driver files are now saved in LabVIEW 2020 format (previously LabVIEW 2022). The supported LabVIEW versions remain 2022–2026.
- Added `Installation_instructions.md` with steps for a new installation and for updating an existing installation to a new driver version. The README now links to it.

