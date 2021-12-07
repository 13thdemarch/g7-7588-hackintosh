# Dell Inspiron G7 7588 Hackintosh

![Monterey](screenshot.png)

<p align = "center">
macOS Monterey
</p>

* macOS:
  - Monterey 12.0.1 ✅
  - Big Sur 11.6 ✅
* Bootloader: OpenCore 0.7.6, Clover 5142.
* EFI can be used for both for installation and booting from SSD.

## Introduction

<details>  
<summary><strong>System Overview</strong></summary>
</br>

**Dell G7 7588**

| Type | Item |
| ---- | ---- |
| CPU | Intel Core i7-8750H @ 2.20 GHz, 9M Cache, up to 4.10 GHz
| RAM | SK Hynix 8GB DDR4-2666MHz HMA81GS6CJR8N-VK, Samsung 8GB DDR4-2666MHz M471A1K43CB1-CTD |
| Monitor Panel | BOE NV156FHM @ 1080p, 144Hz |
| SSD1 | Western Digital SN730 256GB NVMe Solid State Drive (macOS) |
| SSD2 | Samsung PM871b 256GB SATA Solid State Drive (Windows 11) |
| Sound | Realtek ALC256/ALC3246 |
| Wireless, Bluetooth | Fenvi BCM94360NG (94360 real Mac chipset) |
| Integrated GPU | Intel UHD Graphics 630 (GT2) |
| Dedicated GPU | Nvidia GTX 1050Ti (disabled) |
| BIOS Version | 1.17.0 |

</details>

<details>  
<summary><strong>Current Status</strong></summary>
</br>

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
| Airdrop/Handoff | ✅ Working (Broadcom card) |
| FileVault 2 (OpenCore recommended)| ✅ Working |
| Hibernation | ✅ Working |
| SD Card | ❌ Not working |
| NVIDIA GPU/HDMI Port | ❌ Not working |
| DRM | ❌ Not working |
| Fingerprint reader | ❌ Not working |
| BootCamp | ❌ Not working |

</details>

## Installation

<details>  
<summary><strong>BIOS Configuration</strong></summary>
</br>

**Recommend you should restore the BIOS setting to BIOS Setting first. Then configure the following things:**

  | Sub-menu | Key: Value | Comment |
  | --- | --- | --- |
  | UEFI Boot Path Security | `Disabled` | |
  | Enable Legacy Option ROMs | `Disabled` | Disable will help OpenCanopy load faster |
  | SATA Operation | `AHCI` | |
  | Enabled USB Boot Support | `Enabled` | |
  | Enable External USB Port | `Enabled` | |
  | Thunderbolt Security | `Disabled` | |
  | Thunderbolt Auto Switch | `Native Enumeration` | |
  | PTT Security | `Disabled` | You can enable it if you want to run Windows 11 |
  | Secure Boot | `Disabled` | Can set to `Enabled` if you have already custom secure boot keys and signed OpenCore binaries |
  | Intel SGX | `Disabled` | |
  | VT for Direct I/O: | `Disabled` | |
  | Wake on USB | `Enabled` | Wake from keyboard works correctly | |
  | Audo OS Recovery Threshold | `Disabled` | |
  | SupportAssist OS Recovery | `Disabled` | |

</details>

<details>  
<summary><strong>Disable CFG-Lock</strong></summary>
</br>

* Before installing, you should disable CFG-Lock because I have already disabled `AppleXcpmCfgLock` (`KernelXCPM` in Clover) key in `config.plist`.
* Simply just run the `CFGUnlock.efi` tool in OpenCore's GUI, press `Y` and hit Enter. Then reboot the machine. Now you can boot into macOS installation normally.
* For Clover user, you have to run is via `UEFI Shell` tool at Clover's boot menu.

</details>

<details>
<summary><strong>Mainly Configuration</strong></summary>

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
* Without any modifications, the headphone jack is buggy. External microphones aren't detected and the audio output may randomly stop working or start making weird noises.
* Start from this version, I change to use **ALCPlugFix-Swift** method, instead of old method `ComboJack`. It gives better sound experience and performance when using the headset/headphone. Thanks to [Juan-VC](https://github.com/Juan-VC/Hackintosh-macOS-Dell-G7-7588/blob/main/codec_dump.txt) about his ALC256 codec_dump and [black-dragon74](https://github.com/black-dragon74/ALCPlugFix-Swift) about his ALCPlugFix-Swift method. To permanently fix this issue, please go to [Post-Install](https://github.com/aksm-unmei/Dell-Inspiron-G7-7588-Hackintosh#post-installation) for more information.
  #### Fix audio broken after rebooting from Windows into macOS
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x1F,0x3)
    * `alctsel = <01000000>`
  #### Enable ALC Verbs support
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x1F,0x3)
    * `alc-verbs = <01000000>`

</details>

<details>
<summary><strong>Other Configuration</strong></summary>

### USB
* There is a folder which includes USB mapping kext for both Intel and Broadcom card. By default, I use USB mapping kext for Intel card in EFI folders.
* The G7 7588 DSDT table has a few incorrect USB properties, but we can inject the correct properties via the kext which I've already mapped.

| Name | Port | Type     | Visible | Description |
|------|------|----------|---------|-------------|
| HS01 | 1    | Type A   | Yes     | |
| HS02 | 2    | Type A   | Yes     | |
| HS03 | 3    | Type A   | Yes     | |
| HS05 | 5    | Internal | Yes     | Integrated Webcam |
| HS07 | 7    | Internal | No      | Broadcom card's Bluetooth, Broadcom kext only |
| HS09 | 9    | Internal | Yes     | Goodix Fingerprint |
| HS14 | 14   | Internal | Yes     | Intel card's Bluetooth, Intel kext only |
| SS01 | 17   | Type 3   | Yes     | |
| SS02 | 18   | Type 3   | Yes     | |
| SS03 | 19   | Type 3   | Yes     | |

### Wireless, Bluetooth
* The stock Intel AC 9560 can be worked well with [OpenIntelWireless](https://github.com/OpenIntelWireless).
* There are some Broadcom cards like DW1560, DW1820A, BCM94360NG, which can use AirDrop well, are compatible with this machine. If you have them, this EFI is worked well. Make sure you have to add wireless and bluetooth kexts correctly (except BCM94360NG, this card is native with macOS, **don't use any kexts!**).
* By default, there is no wifi/bluetooth kexts in the EFI folder!

### Sleep, Wake and Hibernation
* Hibernation now is worked correctly with `hibernatemode = 3` and `HibernationFixup.kext`.
* Disabling additional features prevents random wakeups while the lid is closed. After every update, these settings should be reapplied manually.
```
sudo pmset -a autopoweroff 0
sudo pmset -a powernap 0
sudo pmset -a standby 0
sudo pmset -a proximitywake 0
sudo pmset -a tcpkeepalive 0
```
* Sleep and wake are improved and very fast now. Also, you can use shortcut key `Fn + Insert` to correct sleep function on this machine. For more infomation, please check the [OpenCore 0.6.8](https://github.com/aksm-unmei/Hackintosh-Dell-G7-7588-OpenCore/blob/main/Changelog.md#v068) changelog.

### CPU Power Management
* CPU power management is done by `CPUFriend.kext` while `CPUFriendDataProvider.kext` defines how it should be done. `CPUFriendDataProvider.kext` is generated for a specific CPU and power setting. The one supplied in this repository was made for the i7-8750H. In case you have another CPU, you should follow [this guide](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html) to generate your own `CPUFriendDataProvider.kext`.

</details>

<details>
<summary><strong>iServices</strong></summary>

* To use iMessage and other Apple services, you need to generate your own serial numbers. This can be done using [CorpNewt's GenSMBIOS](https://github.com/corpnewt/GenSMBIOS). Make sure model is `MacBookPro15,1`. Then, go [Apple Check Coverage page](https://checkcoverage.apple.com/) to check your generated serial numbers. If the website tells you that the serial number **is not valid**, that is fine. Otherwise, you have to generate a new set.

* Next you will have to copy the following values to your `config.plist`:
  - Serial Number -> `PlatformInfo/Generic/SystemSerialNumber`.
  - Board Number -> `PlatformInfo/Generic/MLB`.
  - SmUUID -> `/PlatformInfo/Generic/SystemUUID`.
  Reboot and Apple services should work.

* If they don't, follow [this in-depth guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html). It goes deeper into ROM, clearing NVRAM, clearing Keychain (missing this step might cause major issues), and much more.

</details>

## Post Installation

<details>  
<summary><strong>Dell G7 7588 Post-Install Script</strong></summary>
</br>

* Move `Post-Install` folder to `Desktop` and run after you're already finished installing macOS. It will help to fix the output and input audio when you plug 3.5mm headphone/headset/external speaker in and improve sleep.

</details>

<details>  
<summary><strong>UEFI Secure Boot, OpenCore and Windows 11</strong></summary>
</br>

* As reported on OpenCore Configuration at Chapter 12.2, OpenCore is designed to provide a secure boot chain between firmware and operating system. On most x86 platforms trusted loading is implemented via UEFI Secure Boot model. Not only OpenCore fully supports this model, but it also extends its capabilities to ensure sealed configuration via vaulting and provide trusted loading to the operating systems using custom verification, such as Apple Secure Boot.

* Start from this month, I start supporting UEFI Secure Boot and OpenCore. UEFI Secure Boot works by using a set of keys embedded in the computer's firmware. These keys (or more precisely, their private counterparts) are used to sign boot loaders, drivers, option ROMs, and other software.

* For a friendly guide, you can check this guide from [profzei](https://github.com/profzei/Matebook-X-Pro-2018/wiki/Enable-BIOS-Secure-Boot-with-OpenCore). His guide is very simple and easy to follow.

* If you don't need UEFI Secure Boot, you can skip this option.

</details>

## Credit
* Apple for macOS.
* Acidanthera Team for OpenCore Bootloader and many Kernel Extensions.
* Clover Team for Clover Bootloader.
* Dortania Team for Coffee Lake laptop guide.
* Juan-VC for ALC256 codec dump.
* black-dragon74 for ALCPlugFix-Swift.
* profzei for UEFI Secure Boot and OpenCore guide.

## Support
* Support me: 
  - [Paypal](https://www.paypal.me/tekun0lxrd)
