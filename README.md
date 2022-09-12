# Lenovo ThinkPad T480 - OpenCore Configuation

<img align="right" src="https://dl.exploitox.de/t480-oc/Hackintosh-T480-Monterey.png" alt="macOS Monterey running on the T480" width="425">

[![macOS](https://img.shields.io/badge/macOS-Monterey-brightgreen.svg)](https://developer.apple.com/documentation/macos-release-notes)
[![macOS](https://img.shields.io/badge/macOS-Ventura-brightgreen.svg)](https://developer.apple.com/documentation/macos-release-notes)
[![OpenCore](https://img.shields.io/badge/OpenCore-0.8.3-blue)](https://github.com/acidanthera/OpenCorePkg)
[![License](https://img.shields.io/badge/license-MIT-purple)](/LICENSE)

<p align="center">
   <strong>Status: Maintained</strong>
   <br />
   <strong>Version: </strong>1.2.2
   <br />
   <a href="https://github.com/valnoxy/t480-oc/releases"><strong>Download now »</strong></a>
   <br />
   <a href="https://github.com/valnoxy/t480-oc/issues">Report Bug</a>
   ·
   <a href="https://github.com/valnoxy/t480-oc/blob/main/CHANGELOG.md">View Changelog</a>
  </p>
</p>
</br>

## ⚠️ Disclaimer
This guide is only for the Lenovo ThinkPad T480. I am NOT responsible for any harm you cause to your device. This guide is provided "as-is" and all steps taken are done at your own risk.

> The ACPI patches and the style of this README are from [EETagent](https://github.com/EETagent/T480-OpenCore-Hackintosh).

&nbsp;

## 📝 To-Do
These features will be implemented in a future update:

- [X] macOS Ventura support
- [ ] Touchscreen support

&nbsp;

## 🚧 macOS Ventura Support

> **Warning**
> macOS Ventura is still in Beta! I do not recommend this for productive use!

In version 1.2.0, support for macOS Ventura was added. To update your system to Ventura, the following steps must be performed:

1. Replace your current OpenCore configuration with `EFI - Ventura`. See `♻️ Upgrade macOS / Switch EFI` for more infos.

2. Enroll your device to the Developer Seed. Use `macOS Developer Beta Access Utility` from your Apple Developer Account or by typing the following command into the Terminal: `/System/Library/PrivateFrameworks/Seeding.framework/Versions/Current/Resources/seedutil enroll DeveloperSeed`

3. Download macOS Ventura via Software Update. Create a offline installer or simply update.


### Tested Builds
- [X] Developer Beta 1 `(22A5266r)` 
- [X] Developer Beta 2 `(22A5286j)`
- [X] Developer Beta 3 `(22A5295h & 22A5295i)`
- [X] Developer Beta 4 `(22A5311f)`
- [X] Developer Beta 5 `(22A5321d)`
- [X] Developer Beta 6 `(22A5331f)`

<a href="https://github.com/valnoxy/t480-oc/pull/5"><strong>
Current state of macOS Ventura »</strong></a>

&nbsp;

## Introduction

### EFI folders

This repo includes multiple EFI configuations for different macOS Versions.

| EFI               | Description                                                               | Type      |
| ----------------- | ------------------------------------------------------------------------- | --------- |
| `EFI - Monterey`  | Supports only macOS Monterey                                              | `Stable`  |
| `EFI - HeliPort`  | Supports every macOS Version (except Ventura), Require HeliPort app       | `Stable`  |
| `EFI - Ventura`   | Supports only macOS 13 Ventura                                            | `Beta`    |

<a href="https://github.com/OpenIntelWireless/HeliPort/releases"><strong>
Download HeliPort app »</strong></a>


<details>
<summary><strong>💻 My Hardware</strong></summary>
<br>
These are the Hardware component I use. But this OpenCore configuation <strong>should still work</strong> with your device, even if the components are not equal.

> **Note** Check the model of your WiFi & Bluetooth card. Intel cards should be compatible with itlwm (or AirportItlwm). If your card is from another manufacturer, please check if your card supports macOS.

| Category  | Component                            |
| --------- | ------------------------------------ |
| CPU       | Intel Core i5-8350U                  |
| GPU       | Intel UHD Graphics 620               |
| SSD       | Intel SSDPEKKF256G8L M.2 NVMe SSD    |
| Memory    | 8GB DDR4 2400Mhz                     |
| Camera    | 720p Camera                          |
| WiFi & BT | Intel Dual Band Wireless AC 8265     |

</details>  
 
</details>

&nbsp;

## Installation
You can find the Installation guide [here.](https://hackintosh.vnxy.one)

<details>  
<summary><strong>♻️ Upgrade macOS / Switch EFI</strong></summary>
</br>

If you plan to upgrade your macOS (or updating the EFI / switching to HeliPort), you'll need a different OpenCore configuation (EFI). Please follow these steps:

> Note: Download the desired macOS version in the Settings before following these steps, if you are connected via WiFi.

1. Download the newest release & [ProperTree](https://github.com/corpnewt/ProperTree) and extract it.
2. Start ProperTree and load the ```Config.plist``` on your EFI partition. (File -> Open)
> Note: You can mount your EFI partition by pressing ```ALT + SPACE```, typing Terminal and enter the following command: ```sudo diskutil mountDisk disk0s1```.
3. Now also load the new configuration file from the repo for the desired macOS installation (or HeliPort config). 
4. You should now have 2 ProperTree-windows open on your screen.
5. Go in both windows to ```Root -> PlatformInfo -> Generic```. Transfer ```MLB, ROM, SystemProductName, SystemSerialNumber and SystemUUID``` to the new config. 
6. Save the new config (File -> Save) and close both windows.
7. Now delete your existing EFI folder from the EFI partition and copy the new one to it. (Make sure that the Directorys ```Boot and OC``` are in ```EFI```).

If you want to upgrade macOS, download the desired macOS version in the Settings app and perform the upgrade like on a real Mac.

</details>

&nbsp;

## Status

<details>  
<summary><strong>✅ What's working</strong></summary>
</br>
 
- [X] Intel WiFi & Bluetooth (thanks to [itlwn](https://github.com/OpenIntelWireless/itlwm))
- [X] Brightness / Volume Control
- [X] Battery Information
- [X] Audio (Audio Jack & Speaker)
- [X] USB Ports & Built-in Camera
- [X] Graphics Acceleration
- [X] Trackpoint / Touchpad
- [X] Power management / Sleep
- [X] FaceTime / iMessage (iServices)
- [X] HDMI
- [X] Automatic OS updates
- [X] Handoff / Universal Clipboard
- [X] Sidecar (Cable) / AirPlay to Mac
- [X] SIP / FireVault 2
- [X] USB-C

</details>

<details>  
<summary><strong>⚠️ What's not working</strong></summary>
</br>

- [ ] Safari DRM ```Use Chromium powered Browser or Firefox to watch Amazon Prime Video, Netflix, Disney+ and others```
- [ ] AirDrop & Continuity
- [ ] Fingerprint Reader (Disabled with NoTouchID kext)
- [ ] Thunderbolt 3

</details>

<details>  
<summary><strong>🔄 Not tested</strong></summary>
</br>

- [ ] Sidecar Wireless
- [ ] Apple Watch Unlock
- [ ] WWAN
- [ ] Dualbooting Windows / Linux (with OpenCore)

</details>

&nbsp;

## ⭐️ Feedback
Did you find any bugs or just have some questions? Feel free to provide your feedback using the Discussions tab.

&nbsp;

## 📜 License

This repo is licensed under the [MIT License](https://github.com/valnoxy/t480-oc/blob/main/LICENSE).

OpenCore is licensed under the [BSD 3-Clause License](https://github.com/acidanthera/OpenCorePkg/blob/master/LICENSE.txt).

---
```Copyright (c) 2018 - 2022 valnoxy. By Jonas Günner. <jonas@exploitox.de>```