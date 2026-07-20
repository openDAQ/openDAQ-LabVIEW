# LabVIEW openDAQ driver

An integration of openDAQ capabilities into NI's LabVIEW programming environment.

---

## Driver overview

The openDAQ LabVIEW driver provides access to openDAQ capabilities and functionalities in the form of LabVIEW VIs. They encapsulate openDAQ function calls and objects, and are based on the openDAQ C language implementation using the openDAQ C bindings.

openDAQ has an object-based type system: native values such as numbers, strings and lists are *boxed* into openDAQ objects, and *unboxed* back into native values when needed. Separately, every openDAQ object is *reference counted* — it tracks how many references point to it and frees its own memory once that count drops to zero (i.e. once nothing references it any more). In the higher-level language bindings this reference counting is handled automatically by the language runtime; however, because this driver is built on the openDAQ C bindings, lifetime management of openDAQ objects must be handled manually by the user of the LabVIEW driver.

___Warning:___
> Any openDAQ object received as part of the output of a VI needs to have its reference manually released (via `releaseRef`) or increased (via `queryInterface`), as needed. Failing to handle references properly can result in memory leaks or access violations. Dangling objects can lead to undefined behaviour, and a LabVIEW restart may be required before a new openDAQ instance can be started.

Every openDAQ object possesses multiple interfaces through which interaction with it is possible. To switch between them, use the `queryInterface` or `borrowInterface` VI. `queryInterface` increases the object's reference count by 1, while `borrowInterface` does not. For more information on interfaces and switching between them, an illustrative example and a more in-depth explanation are available [here](https://opendaq.github.io/opendaq/dev/explanations/interfaces_objects_wrappers.html).

For an introduction to usage, the driver contains examples that show how to create interactive VIs that display basic openDAQ functionality (discovering an openDAQ device on your local network, connecting and setting up the device for measurement, and streaming data into LabVIEW and displaying it on the VI front panel).

---

## Prerequisites

- A **LabVIEW** development environment (LabVIEW 2022–2026 is supported).
- No separate openDAQ installation is required — the driver already includes the openDAQ runtime binaries for every supported platform (see [Supported platforms](#supported-platforms)).

---

## How to set up the openDAQ LabVIEW driver

Setting up the openDAQ LabVIEW (LV) driver takes only a couple of steps:

1. Download or clone this GitHub repository onto the system that will be running LabVIEW.

2. Copy the complete `openDAQ` folder (with all of its subfolders) into the `instr.lib` directory of your LabVIEW development environment. A standard LabVIEW installation has its `instr.lib` folder under:

    ```
    C:\Program Files\National Instruments\LabVIEW 20XX\instr.lib
    ```

3. Restart LabVIEW.

4. The driver library with all usable VIs can then be found in the Functions palette (block diagram) under:

    ```
    Instrument I/O » Instrument Drivers » openDAQ
    ```

The openDAQ runtime binaries are already bundled with the driver under `openDAQ/Binaries/`, so no additional copying is required.

### (Optional) Remove unused binaries

The bundled binaries are organised by operating system and bitness:

```
openDAQ/Binaries/
    Windows/
        x64/
        x86/
    Linux/
        x64/
```

The driver only loads the set that matches your operating system and LabVIEW bitness. To keep the installation small, you can delete the folders you don't need and keep only the one for your setup — for example, keep `Binaries/Windows/x64/` and delete `Binaries/Windows/x86/` and `Binaries/Linux/`.

---

## Supported platforms

The openDAQ LabVIEW driver is available on **Windows** in 64-bit (x64) and 32-bit (x86) versions, and on **Linux** distributions in 64-bit (x64) versions.

---

## API wrapper VIs

Most of the openDAQ LabVIEW driver consists of API wrapper VIs. These have an almost one-to-one relationship with the openDAQ API — a VI exists for most openDAQ interface functions, each wrapping a single API call.

Where a function takes or returns a *boxable* value — a basic type such as a string, number or boolean — the wrapper VI does the boxing and unboxing for you, so you work with native LabVIEW values instead of openDAQ objects. For example, an openDAQ function that expects an `IString` is wrapped by a VI that accepts an ordinary LabVIEW string.

Arguments that are openDAQ objects in their own right (devices, signals, function blocks, and so on) are passed and returned as openDAQ object references. Any openDAQ object returned as an output has its reference count increased by 1, so once you are finished with it in the VI, its reference **must be released manually** with the `releaseRef` VI.

---

## Featured examples of openDAQ usage

- **Discover devices on the local network** — `Discover Devices.vi`

    Shows how to create an openDAQ instance and scan the local network for openDAQ-compatible devices.
    > ***Warning:*** This driver bundles openDAQ version 3.40.1 and its associated modules. Connecting to devices running a newer version of openDAQ is not supported and may lead to undefined behaviour.

- **Filter and connect to found devices** — `Filter and Connect Device.vi`

    Shows how to filter found devices by a property (in this example, by manufacturer) and connect to them.

- **Get signals from a DAQ device** — `Get Signals.vi`

    Shows how to enumerate all signals that a device broadcasts.

- **MultiReader usage** — `Multi Reader - Read Same Rates - State Machine.vi`

    Demonstrates how to set up a MultiReader that reads measured data from multiple signals on the connected device simultaneously.

- **StreamReader usage** — `Stream Reader.vi`

    Shows how to set up a Stream Reader that reads data from a specific signal of a connected device.

- **Property editor** — `PropertyEditor.vi`

    Demonstrates how to browse a connected device's component tree and view and edit component properties, including handling of the different core types and property value types.

- **Tree traversal** — `TreeTraversal.vi`

    Demonstrates how to recursively traverse the component tree of a connected device (devices, function blocks, channels and signals).

- **Unified example** — `Overall Example.vi`

    Combines the most commonly used openDAQ capabilities: discovery of compatible devices, connection to the discovered devices, streaming and processing of data, and configuration of connected devices.

---

## Troubleshooting

- **No devices or function blocks are found when running the examples.** The openDAQ modules were most likely not loaded. Open the module path VI (`openDAQ/Private/ModulePath/searchModulePath.vi`) and check that it resolves to the correct `modules` directory for your platform.

- **A warning about new dependency paths appears when loading VIs on Windows.** On Windows the VIs default to the x86 (32-bit) binary paths, so LabVIEW may report new or changed dependency paths as the VIs load. This warning can be safely ignored — the paths correct themselves automatically.
