# Lenovo ThinkPad T480 - OpenCore Configuation

<img align="right" src="https://dl.exploitox.de/t480-oc/Hackintosh-T480-Sequoia.png" alt="macOS Sequoia running on the T480" width="425">

[![macOS](https://img.shields.io/badge/macOS-Monterey-brightgreen.svg?logo=apple)](https://developer.apple.com/documentation/macos-release-notes)
[![macOS](https://img.shields.io/badge/macOS-Ventura-brightgreen.svg?logo=apple)](https://developer.apple.com/documentation/macos-release-notes)
[![macOS](https://img.shields.io/badge/macOS-Sonoma-brightgreen.svg?logo=apple)](https://developer.apple.com/documentation/macos-release-notes)
[![macOS](https://img.shields.io/badge/macOS-Sequoia-brightgreen.svg?logo=apple)](https://developer.apple.com/documentation/macos-release-notes)
[![OpenCore](https://img.shields.io/badge/OpenCore-1.0.0-blue.svg)](https://github.com/acidanthera/OpenCorePkg)
[![License](https://img.shields.io/badge/license-MIT-purple.svg)](/LICENSE)

<p align="center">
   <strong>Status: Maintained</strong>
   <br />
   <strong>Version: </strong>1.4.0
   <br />
   <a href="https://github.com/valnoxy/t480-oc/releases"><strong>Download now »</strong></a>
   <br />
   <a href="https://github.com/valnoxy/t480-oc/issues">Report Bug</a>
   ·
   <a href="https://github.com/valnoxy/t480-oc/blob/main/CHANGELOG.md">View Changelog</a>
   ·
   <a href="https://www.youtube.com/watch?v=thYDWyJuUq4">YouTube Video</a>
  </p>
</p>
</br>

## 📝 Changelog

<details>  
<summary><strong>📅 Version 1.4.0: 26.08.2024</strong></summary>
</br>
This release supports macOS Sequoia.

The following base / kexts was updated:
   - **Airportitlwm**: 2.3.0
   - **AppleALC**: 1.9.2
   - **BlueToolFixup**: 2.6.8
   - **CPUFriend**: 1.2.8
   - **IntelBluetoothFirmware**: 2.3.0
   - **IntelBluetoothInjector**: 2.3.0
   - **IntelBTPatcher**: 2.3.0
   - **Lilu**: 1.6.8
   - **NVMeFix**: 1.1.1
   - **WhateverGreen**: 1.6.8
   - **VirtualSMC**: 1.3.3
   - **OpenCore**: 1.0.0

</details>

<details>  
<summary><strong>📅 Version 1.3.0: 21.06.2023</strong></summary>
</br>
This release supports macOS Sonoma.

The following kexts was removed:
   - AppleBacklightFixup (merged into WhateverGreen)
   
The following base / kexts was updated:
   - **Airportitlwm**: 2.2.0
   - **AppleALC**: 1.8.3
   - **CPUFriend**: 1.2.6
   - **HibernationFixup**: 1.4.9
   - **Lilu**: 1.6.6
   - **VoodooI2C**: 2.7.1
   - **VoodooPS2**: 2.3.3
   - **VoodooRMI**: 1.3.5
   - **WhateverGreen**: 1.6.5
   - **YogaSMC**: 1.5.3
   - **VirtualSMC**: 1.3.2
   - **OpenCore**: 0.9.3

</details>

<details>  
<summary><strong>📅 Version 1.2.2: 19.11.2022</strong></summary>
</br>

The following kexts was added:
   - USBMap (USB mapping)
   - VoodooI2C (Touchscreen Support)
   - VoodooI2CHID (Touchscreen Support)

The following base / kexts was updated:
   - **Airportitlwm**: (Ventura: 2.2.0 DEBUG, Monterey & Big Sur: 2.1.0)
   - **AppleALC**: 1.7.4
   - **HibernationFixup**: 1.4.6
   - **IntelBluetoothFirmware**: 2.2.0
   - **Lilu**: 1.6.2
   - **NVMeFix**: 1.1.0
   - **VirtualSMC (with plugins)**: 1.3.0
   - **VoodooPC2Controller**: 2.2.9
   - **WhateverGreen**: 1.6.1
   - **OpenCore**: 0.8.5

The following config changes was applied:
   - **Added Thinkpad ACPI / Kernel patches**
   - **Removed 'LegacyEnable'**

The following ACPI changes was applied:
   - **Added SSDT-KBTA.aml with source code (ThinkPadAssistant)**

</details>

<details>  
<summary><strong>📅 Version 1.2.1: 22.06.2022</strong></summary>
</br>

### Changes
- Fix HDMI output (issue #7)
- Fix Brightness controlls (issue #7)
- Fix Trackpad issues (issue #7 & #8)

### Updated Kexts:
- **OpenCore**: Version of [e05a69d](https://github.com/acidanthera/OpenCorePkg/commit/e05a69da640009ac1983c7c8c78af4f0d9b4bc6f)
- **AppleALC**: 1.7.2
- **BrcmPatchRAM**: 2.6.2
- **WhateverGreen**: 1.5.9

</details>

<details>  
<summary><strong>📅 Version 1.2.0: 12.06.2022</strong></summary>
</br>

### Changes
- Add macOS 13 Ventura beta support

### OpenCore / Kext Versions:
- **OpenCore**: Modified version of [e05a69d](https://github.com/acidanthera/OpenCorePkg/commit/e05a69da640009ac1983c7c8c78af4f0d9b4bc6f)
- **AppleALC**: 1.7.3 ([bce915e](https://github.com/acidanthera/AppleALC/commit/bce915e4d52a04447932eef7a32696433d16dc7f))
- **CPUFriend**: 1.2.6 ([44efb5f](https://github.com/acidanthera/CPUFriend/commit/44efb5fe04245cf2df4f9bcde126d240710df62e))
- **Lilu**: 1.6.1 ([250b65c](https://github.com/acidanthera/Lilu/commit/250b65cbb4e9c3aced2673b71ac359b5d6771cfe))
- **WhateverGreen**: 1.5.9

### Screenshot
<img src="https://dl.exploitox.de/t480-oc/T480-Ventura.png" alt="macOS Ventura running on the T480" width="650">


</details>

<details>  
<summary><strong>📅 Version 1.1.0: 16.05.2022</strong></summary>
</br>

- Add HeliPort support
- Add macOS 13 Ventura pre-support
- Update OpenCore to ```0.8.0```
- Update AppleALC to ```1.7.1```

</details>

<details>  
<summary><strong>📅 Version 1.0.1: 02.04.2022</strong></summary>
</br>

- Fix boot chime by adding AudioDxe.efi (issue #2)

</details>

<details>  
<summary><strong>📅 Version 1.0: 13.03.2022</strong></summary>
</br>

- Initial commit (supports only Monterey)

</details>

