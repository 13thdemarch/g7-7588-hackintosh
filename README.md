# Dell Inspiron G7 7588 Hackintosh

<p align="center"><img src="./asset/g7.png" alt="Dell G7 7588" width="40%" align="Right"><a href="https://www.dell.com/support/home/en-vn/drivers/driversdetails?driverid=g8n87&oscode=wt64a&productcode=g-series-15-7588-laptop"><img src="https://img.shields.io/badge/BIOS-1.18-blue"></a> &nbsp;&nbsp;<a href="https://github.com/acidanthera/OpenCorePkg"><img src="https://img.shields.io/badge/OpenCore-0.7.7-blue"></a> &nbsp;&nbsp;<a href="https://github.com/CloverHackyColor/CloverBootloader"><img src="https://img.shields.io/badge/Clover-5142-blue"></a> &nbsp;&nbsp;<img src="https://img.shields.io/badge/macOS-12.1-blue"></p>

This EFI repository contains the files needed to successfully boot into macOS on Dell G7 7588 with Opencore and Clover, also it's very stable now. macOS 12 Monterey works well with Windows 11 in dual boot, even with builtin UEFI Secure Boot with custom secure boot keys (currently OpenCore only). There are probably things that can be improved, so feel free to open issues or even PRs with suggestions or observations.

<h2>Information</h2>

<h3>Specification</h3>

| Type | Item |
| ---- | ---- |
| CPU | Intel Core i7-8750H @ 2.20 GHz, 9M Cache, up to 4.10 GHz |
| RAM | SK Hynix 8GB DDR4-2666MHz HMA81GS6CJR8N-VK, Samsung 8GB DDR4-2666MHz M471A1K43CB1-CTD |
| Monitor Panel | BOE NV156FHM @ 1080p, 144Hz |
| SSD1 | Western Digital SN730 256GB NVMe Solid State Drive (macOS) |
| SSD2 | Samsung PM871b 256GB SATA Solid State Drive (Windows 11) |
| Sound | Realtek ALC256/ALC3246 |
| Wireless, Bluetooth | Fenvi BCM94360NG (94360 real Mac chipset) |
| Integrated GPU | Intel UHD Graphics 630 (GT2) |
| Dedicated GPU | Nvidia GTX 1050Ti (disabled) |
| BIOS Version | 1.18.0 |

<h3>Current status</h3>

| Feature | Status | Note |
| ------------- | ------------- | ------------- |
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
| Wi-Fi/Bluetooth | ✅ Working | Both Intel and Broadcom card work well |
| Airdrop/Handoff | ✅ Working | Broadcom card only |
| FileVault 2 | ✅ Working | OpenCore recommended |
| Hibernation | ✅ Working | Works well with mode 25 without any problems |
| Builtin UEFI Secure Boot | ✅ Working | Generate custom secure boot keys in Ubuntu |
| SD Card | ❌ Not working |
| NVIDIA GPU/HDMI Port | ❌ Not working |
| DRM | ❌ Not working |
| Fingerprint reader | ❌ Not working |
| BootCamp | ❌ Not working |

<h2>Configuration</h2>

<h3>BIOS</h3>

**Recommend you should restore the BIOS setting to BIOS Default first!**

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
  | VT for Direct I/O: | `Enabled` | Need for Windows 11 |
  | Wake on USB | `Enabled` | Wake from keyboard works correctly | |
  | Audo OS Recovery Threshold | `Disabled` | |
  | SupportAssist OS Recovery | `Disabled` | |

<h3>Disable CFG-Lock</h3>

* Before installing, you should disable CFG-Lock because I have already disabled `AppleXcpmCfgLock` (`KernelXCPM` in Clover) key in `config.plist`.
* Simply just run the `CFGUnlock.efi` tool in OpenCore's GUI, press `Y` and hit Enter. Then reboot the machine.
* For Clover user, you have to run it via `UEFI Shell` tool at Clover's boot menu.

<h3>config.plist</h3>

<h4>Graphic display</h4>

* Integrated Intel UHD Graphics 630 support is handled by WhateverGreen, and configured in the `DeviceProperties` section of `config.plist`.
* The NVIDIA GPU is not supported so it is disabled in SSDT.
* The default BIOS DVMT pre-alloc value of `64MB` is sufficient and does not need to be changed.
  #### Enable acceleration
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x2,0x0)
    * `AAPL,ig-platform-id = <0900A53E>`
  #### Fix backlight registers on CoffeeLake platform
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x2,0x0)
    * `enable-backlight-registers-fix = <01000000>`
  #### Enable external display support
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x2,0x0)
    * `agdpmod = <vit9696>`

<h4>Audio</h4>

* For ALC256 on this G7, I use `layout-id = <0E000000>`, it means `14`.
* Without any modifications, the headphone jack is buggy. External microphones aren't detected and the audio output may randomly stop working or start making weird noises.
* Start from Oct 2021 update, I changed to use **ALCPlugFix-Swift** method, instead of old method `ComboJack`. It gives better sound experience and performance when using the headset/headphone. Thanks to [Juan-VC](https://github.com/Juan-VC/Hackintosh-macOS-Dell-G7-7588/blob/main/codec_dump.txt) about his ALC256 codec_dump and [black-dragon74](https://github.com/black-dragon74/ALCPlugFix-Swift) about his ALCPlugFix-Swift method. To permanently fix this issue, please go to [Post-Install](https://github.com/aksm-unmei/Dell-Inspiron-G7-7588-Hackintosh/tree/main#post-installation) for more information.

  #### Fix audio broken after rebooting from Windows into macOS
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x1F,0x3)
    * `alctsel = <01000000>`
  #### Enable ALC Verbs support
  * DeviceProperties/Add/PciRoot(0x0)/Pci(0x1F,0x3)
    * `alc-verbs = <01000000>`

<h2>Useful information</h2>

<h3>Hotpatches SSDT</h3>

- SSDT-ALS0: Enable native ambient light sensor.
- SSDT-CPUPM: CPU power management.
- SSDT-DDGPU: Disable dGPU.
- SSDT-DELL: Special patches for Dell machine.
- SSDT-EC-USBX: Fake embedded controller and fix USB power properties.
- SSDT-GPI0: Enable I2C touchpad.
- SSDT-GPRW: Fix instant wake.
- SSDT-HDEF: Add ALC256 Pin/Node ID for CodecCommander kext, to be paired with ALCPlugFix-Swift.
- SSDT-PCID: Add missing PCI devices and paths.
- SSDT-PNLF: Fix brightness control, currently modified for Coffee Lake only.
- SSDT-PS2K: Modify PS2 keyboard. Disable Fn+B/S for brightness up/down.
- SSDT-PTSWAK: Fix sleep/wake.
- SSDT-HRTFix: Improve system HPET, RTC and TMR.
- SSDT-XHC: Inject USB mapping ports to system without any kext.

<h3>USB</h3>

* **Great new**: Now we don't need USB mapping kext anymore. In Jan 2022 update, I created SSDT-XHC, which is modified version of OEM USB ports ACPI named SSDT-xh_cfhd4. For both Intel and Broadcom card users, you don't need to worry about bluetooth port. I have already mapped both port in the SSDT. Enjoy!
* The G7 7588 DSDT table has a few incorrect USB properties, but we can inject the correct properties via SSDT-XHC which I've already mapped.

| Name | Port | Type     | Visible | Description |
|------|------|----------|---------|-------------|
| HS01 | 1    | Type A   | Yes     | Type A but can be mapped and worked well with Type 3 |
| HS02 | 2    | Type A   | Yes     | Type A but can be mapped and worked well with Type 3 |
| HS03 | 3    | Type A   | Yes     | Type A but can be mapped and worked well with Type 3 |
| HS05 | 5    | Internal | Yes     | Integrated Webcam |
| HS07 | 7    | Internal | Yes     | Broadcom card's bluetooth |
| HS09 | 9    | Internal | Yes     | Goodix Fingerprint |
| HS14 | 14   | Internal | Yes     | Intel card's bluetooth |
| SS01 | 17   | Type 3   | Yes     | |
| SS02 | 18   | Type 3   | Yes     | |
| SS03 | 19   | Type 3   | Yes     | |

<h3>Wireless, bluetooth</h3>

* The stock Intel AC 9560 can be worked well with [OpenIntelWireless](https://github.com/OpenIntelWireless).
* There are some Broadcom cards like DW1560, DW1820A, BCM94360NG, which can use AirDrop well, are compatible with this machine. If you have them, this EFI is worked well. Make sure you have to add wireless and bluetooth kexts correctly (except BCM94360NG, this card is native with macOS, **don't use any kexts!**).
* By default, there is no wifi/bluetooth kexts in the EFI folder!

<h3>Sleep, wake and hibernation</h3>

* Hibernation now is worked correctly with mode 3 and 25 and `HibernationFixup.kext`.
* Disabling additional features prevents random wakeups while the lid is closed. After every update, these settings should be reapplied manually.
```
sudo pmset -a autopoweroff 0
sudo pmset -a powernap 0
sudo pmset -a standby 0
sudo pmset -a proximitywake 0
sudo pmset -a tcpkeepalive 0
```
* Sleep and wake are improved and very fast now. Also, you can use shortcut key `Fn + Insert` to correct sleep function on this machine. For more infomation, please check the [OpenCore 0.6.8 Changelog](https://github.com/aksm-unmei/Hackintosh-Dell-G7-7588-OpenCore/blob/main/Changelog.md#v068) changelog.

<h3>CPU power management</h3>

* CPU power management is done by `CPUFriend.kext` while `CPUFriendDataProvider.kext` defines how it should be done.
* `CPUFriendDataProvider.kext` is generated for a specific CPU and power setting. The one supplied in EFI folder was made for the i7-8750H.
* For Core i5 machine, you should replace with the one which is in `i5-8300H` folder.

<h3>iServices</h3>

* To use iMessage and other Apple services, you need to generate your own serial numbers. This can be done using [CorpNewt's GenSMBIOS](https://github.com/corpnewt/GenSMBIOS). Make sure model is `MacBookPro15,1`. Then, go [Apple Check Coverage page](https://checkcoverage.apple.com/) to check your generated serial numbers. If the website tells you that the serial number **is not valid**, that is fine. Otherwise, you have to generate a new set.

* Next you will have to copy the following values to your `config.plist`:
  - Serial Number -> `PlatformInfo/Generic/SystemSerialNumber`.
  - Board Number -> `PlatformInfo/Generic/MLB`.
  - SmUUID -> `/PlatformInfo/Generic/SystemUUID`.
  Reboot and Apple services should work.

* If they don't, follow [this in-depth guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html). It goes deeper into ROM, clearing NVRAM, clearing Keychain (missing this step might cause major issues), and much more.


<h2>Post Installation</h2>

* Move `Post-Install` folder to `Desktop` and run after you're already finished installing macOS. It will help to fix the output and input audio when you plug 3.5mm headphone/headset/external speaker in and improve sleep.

<h2>UEFI Secure Boot, OpenCore and Windows 11</h2>

* As reported on OpenCore Configuration at Chapter 12.2, OpenCore is designed to provide a secure boot chain between firmware and operating system. On most x86 platforms trusted loading is implemented via UEFI Secure Boot model. Not only OpenCore fully supports this model, but it also extends its capabilities to ensure sealed configuration via vaulting and provide trusted loading to the operating systems using custom verification, such as Apple Secure Boot.

* Start from this month, I start supporting UEFI Secure Boot and OpenCore. UEFI Secure Boot works by using a set of keys embedded in the computer's firmware. These keys (or more precisely, their private counterparts) are used to sign boot loaders, drivers, option ROMs, and other software.

* For a friendly guide, you can check this guide from [profzei](https://github.com/profzei/Matebook-X-Pro-2018/wiki/Enable-BIOS-Secure-Boot-with-OpenCore). His guide is very simple and easy to follow.

* If you don't need UEFI Secure Boot, you can skip this option.

<h2>Thanks to</h2>

* Acidanthera Team for OpenCore Bootloader and many Kernel Extensions.
* Clover Team for Clover Bootloader.
* Dortania Team for Coffee Lake laptop guide.
* Juan-VC for ALC256 codec dump.
* black-dragon74 for ALCPlugFix-Swift.
* profzei for UEFI Secure Boot and OpenCore guide.

<h2>Support me</h2>

  - [Paypal](https://www.paypal.me/tekun0lxrd)
