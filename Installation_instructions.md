# Installation Instructions

## New installation

1. Download or clone this repository.
2. Close LabVIEW.
3. Copy the complete `openDAQ` folder, with all of its subfolders, into the `instr.lib` folder of your LabVIEW installation, so that the driver ends up in `<LabVIEW>/instr.lib/openDAQ`. Here `<LabVIEW>` is the folder that LabVIEW is installed in.

    Writing to this folder usually requires administrator (root) rights.
4. Optional: delete the binaries you don't need from `openDAQ/Binaries/` (see the README).
5. Start LabVIEW. The driver VIs are in the Functions palette under
   `Instrument I/O » Instrument Drivers » openDAQ`.
6. To check that the driver works, run `Discover Devices.vi` from `openDAQ/Examples`.

---
## Updating the version of the openDAQ LabVIEW driver

Before updating, read the changelog for the new version.

Replace the installed driver folder completely; don't copy the new version over it. Files that were removed or renamed in the new version would otherwise stay behind. For example, openDAQ loads every module in the `modules` folder, so an outdated module left there would load alongside the new one and could conflict with it.

1. Stop all VIs that use openDAQ, then close LabVIEW. While LabVIEW is running, the openDAQ binaries are locked and can't be replaced.
2. If you changed any files inside `<LabVIEW>/instr.lib/openDAQ`, back them up. The next step deletes them.
3. Delete the `openDAQ` folder from `instr.lib`.
4. Copy in the new `openDAQ` folder as described in steps 3–4 of the new installation.
5. Start LabVIEW and open your own VIs that use the driver. They link to the new version automatically because the install path is the same. LabVIEW may mark them as changed and ask you to save them; this is expected.
