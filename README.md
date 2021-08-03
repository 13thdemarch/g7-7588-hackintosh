# Dell Inspiron G7 7588 Hackintosh

![Screenshot](screenshot.png)
- macOS:
  - Monterey 12.0 Beta 🔶
  - Big Sur 11.5,1 ✅
  - Catalina 10.15.7 ✅
- Bootloader: OpenCore 0.7.2, Clover 5138
- EFI can be used for both for installation and booting from SSD.

## Table of Contents
- [System Overview](#system-overview)
- [Current Status](#current-status)
- [Installation](#installation)
  - [BIOS Configuration](#bios-configuration)
  - [Disable CFG-Lock](#disable-cfg-lock)
  - [Graphic Display](#graphic-display)
  - [Audio](#audio)
  - [USB](#usb)
  - [Wireless, Bluetooth](#wireless-bluetooth)
  - [Sleep, Wake and Hibernation](#sleep-wake-and-hibernation)
  - [CPU Power Management](cpu-power-management)
  - [iMessage, Facetime and App Store](imessage-facetime-and-app-store)
- [Finish](#finish)

## System Overview
* Dell G7 7588
| Type | Item |
| ---- | ---- |
| CPU | Intel Core i7-8750H @ 2.20 GHz, 9M Cache, up to 4.10 GHz
| RAM | SK Hynix 8GB DDR4-2666MHz HMA81GS6CJR8N-VK, Samsung 8GB DDR4-2666MHz M471A1K43CB1-CTD |
| Monitor Panel | BOE NV156FHM @ 1080p, 144Hz |
| SSD | Western Digital SN730 256GB NVMe Solid State Drive|
| HDD | Seagate 1TB 2.5" 5400RPM Internal Hard Drive |
| Sound | Realtek ALC256/ALC3246 |
| Wireless, Bluetooth | [Fenvi BCM94360NG WiFi + Bluetooth 4.0 M.2 Card](https://www.aliexpress.com/item/4000631796433.html?spm=a2g0o.store_pc_groupList.8148356.12.1e5c1c8d2nOf4g) |
| Integrated GPU | Intel UHD Graphics 630 (GT2) |
| Dedicated GPU | Nvidia GTX 1050Ti (disabled) |
| BIOS Version | 1.16.0 |

## Current Status

| Feature | Status |
| ------------- | ------------- |
| CPU Power Management | ✅ Working |
| Sleep/Wake | ✅ Working |
| Intel UHD630 Graphics Acceleration | ✅ Working |
| Intel Quartz Extreme and Intel Core Image (QE/CI) | ✅ Working |
| Brightness control slider | ✅ Working |
| Special function keys (audio, brightness, sleep...) | ✅ Working |
| Ethernet | ✅ Working |
| Audio | ✅ Working |
| USB-C Port | ✅ Working |
| Touchpad | ✅ Working |
| Battery | ✅ Working |
| iMessage/Facetime and App Store | ✅ Working  |
| Speakers and Headphones | ✅ Working |
| Built-in Microphone | ✅ Working |
| Webcam | ✅ Working |
| Wi-Fi/Bluetooth | ✅ Working |
| Airdrop/Handoff | ✅ Working |
| FileVault 2 (OpenCore recommended)| ✅ Working |
| SD Card | ❌ Not working |
| Hibernation | ❌ Not working |
| NVIDIA GPU/HDMI Port | ❌ Not working |
| DRM | ❌ Not working |
| Fingerprint reader | ❌ Not working |
| BootCamp | ❌ Not working |

## Installation

### BIOS Configuration
* Recommend you should restore the BIOS setting to BIOS Setting first. Then configure the following things:

  | Sub-menu | Key: Value | Comment |
  | --- | --- | --- |
  | UEFI Boot Path Security | `Disabled` | |
  | Enable Legacy Option ROMs | `Disabled` | Disable will help OpenCore's GUI loaded faster |
  | SATA Operation | `AHCI` | |
  | Enabled USB Boot Support | `Enabled` | |
  | Enable External USB Port | `Enabled` | |
  | Thunderbolt Security | `Enabled` | |
  | Thunderbolt Auto Switch | `Native Enumeration` | |
  | PTT Security | `Disabled` | |
  | Secure Boot Enable | `Disabled` | |
  | Intel SGX | `Disabled` | |
  | VT for Direct I/O: | `Disabled` | |
  | Wake on USB | `Enabled` | Wake from keyboard works correctly |
  | Audo OS Recovery Threshold | `Disabled` | |
  | SupportAssist OS Recovery | `Disabled` ||

### Disable CFG-Lock
* Before installing, you should disable CFG-Lock because I have already disabled `AppleXcpmCfgLock` (`KernelXCPM` in Clover) key in `config.plist`.
* Simply just run the `CFGUnlock.efi` tool in OpenCore's GUI, press `Y` and hit Enter. Then reboot the machine. Now you can boot into macOS installation normally.
* For Clover user, you have to run is via `UEFI Shell` tool at Clover's boot menu.

### Graphic Display
* Integrated Intel UHD Graphics 630 support is handled by WhateverGreen, and configured in the `DeviceProperties` section of `config.plist`.
The NVIDIA GPU is not supported so it is disabled in SSDT.
The default BIOS DVMT pre-alloc value of `64MB` is sufficient and does not need to be changed.
  #### Enable acceleration
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x2,0x0)
    * `AAPL,ig-platform-id = <0900A53E>`
  #### Fix backlight registers on CoffeeLake platform
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x2,0x0)
    * `enable-backlight-registers-fix = <01000000>`
  #### Enable external display support
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x2,0x0)
    * `agdpmod = <vit9696>`

### Audio
* For ALC256 on this G7, I use `layout-id = <0E000000>`, it means `14`.
* Without any modifications, the headphone jack is buggy. External microphones aren't detected and the audio output may randomly stop working or start making weird noises. To permanently fix this issue, please go to [Post-Install](https://github.com/rex-lapis/Dell_G7_7588_OpenCore_Hackintosh#finish) for more information.
  #### Fix audio broken after rebooting from Windows into macOS
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x1F,0x3)
    * `alctsel = <01000000>`

### USB
* From this version, I made a folder about USB ports mapping for somebody who is using Intel or Broadcom wireless card.
* By default, there is no USB kext in bootloader's kext folder. Make sure you have to pick the correct kext(s) depends on what card you are using and save the `config.plist` file.

### Wireless, Bluetooth
* The stock Intel AC 9560 can be worked well with [OpenIntelWireless](https://github.com/OpenIntelWireless), but it's not stable at all. So I replaced it with the Fenvi BCM94360NG card.
  * This card is native with macOS without any kexts injection, because it uses the chipset from BCM94360CS2 card.
* If you have Intel or Broadcom card (like DW1560), this EFI is worked well with them. Make sure you have to add wireless and bluetooth kexts correctly.
* If you have DW1820a card, it is worked too. But trust me, you don't want to use that card! The wifi speed is a bit slower and has problems with 5GHz network. Bluetooth sometimes has issues too.

### Sleep, Wake and Hibernation
* Hibernation is not supported on a Hackintosh and everything related to it should be completely disabled. Disabling additional features prevents random wakeups while the lid is closed. After every update, these settings should be reapplied manually.
```
sudo pmset -a hibernatemode 0
sudo rm -f /var/vm/sleepimage
sudo mkdir /var/vm/sleepimage
sudo pmset -a standby 0
sudo pmset -a autopoweroff 0
sudo pmset -a powernap 0
sudo pmset -a proximitywake 0
```
* Sleep and wake are improved and very fast now. Also, you can use shortcut key `Fn + Insert` to sleep this machine, likes Windows. For more infomation, please check the [OpenCore 0.6.8](https://github.com/rex-lapis/Hackintosh-Dell-G7-7588-OpenCore/blob/main/Changelog.md#v068) changelog.

### CPU Power Management
* CPU power management is done by `CPUFriend.kext` while `CPUFriendDataProvider.kext` defines how it should be done. `CPUFriendDataProvider.kext` is generated for a specific CPU and power setting. The one supplied in this repository was made for the i7-8750H. In case you have another CPU, you can use [one-key-cpufriend](https://github.com/stevezhengshiqi/one-key-cpufriend) to generate your own `CPUFriendDataProvider.kext`.

### iMessage, Facetime and App Store
* To use iMessage and other Apple services, you need to generate your own serial numbers. This can be done using [CorpNewt's GenSMBIOS](https://github.com/corpnewt/GenSMBIOS). Make sure model is `MacBookPro15,1`. Then, go [Apple Check Coverage page](https://checkcoverage.apple.com/) to check your generated serial numbers. If the website tells you that the serial number **is not valid**, that is fine. Otherwise, you have to generate a new set.

* Next you will have to copy the following values to your `config.plist`:
  - Serial Number -> `PlatformInfo/Generic/SystemSerialNumber`.
  - Board Number -> `PlatformInfo/Generic/MLB`.
  - SmUUID -> `/PlatformInfo/Generic/SystemUUID`.
  Reboot and Apple services should work.

* If they don't, follow [this in-depth guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html). It goes deeper into ROM, clearing NVRAM, clearing Keychain (missing this step might cause major issues), and much more.

## Finish
* There is a script file in `Post-Install` folder. Run it after you're already finished installing macOS. It will help to fix the output and input audio when you plug 3.5mm headphone/headset/external speaker in, and disable hibernation for enhancing sleep.

## Credit
* Apple for macOS.
* Acidanthera Team for OpenCore and many Kernel Extensions.
* Dortania Team for Coffee Lake Laptop guide.
* Ivs1974 for ComboJack Fix.

## Support
* Support me: 
  - [Paypal](https://www.paypal.me/tekun0lxrd)
