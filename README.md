<h1 align="center"> Dell Inspiron G7 7588 Hackintosh </h1>

<p align="center">
  <a href="https://www.apple.com/macos/monterey/">
    <img src="https://img.shields.io/badge/macOS-12.3.1-red"></a> &nbsp;&nbsp;
  <a href="https://www.dell.com/support/home/en-vn/drivers/driversdetails?driverid=g8n87&oscode=wt64a&productcode=g-series-15-7588-laptop">
    <img src="https://img.shields.io/badge/BIOS-1.20-blue"></a> &nbsp;&nbsp;
  <a href="https://github.com/acidanthera/OpenCorePkg">
    <img src="https://img.shields.io/badge/OpenCore-0.8.0-12AED6"></a> &nbsp;&nbsp;
  <a href="https://github.com/CloverHackyColor/CloverBootloader">
    <img src="https://img.shields.io/badge/Clover-5146-00CC00"></a> &nbsp;&nbsp;
</p>

<p align="center">
  <img src="./asset/g7.png" alt="Dell G7 7588" width="40%">
</p>

This EFI repository contains the files needed to successfully boot into macOS on Dell G7 7588 with Opencore and Clover, also it's very stable now. macOS 12 Monterey works well with Windows 11 in dual boot, even with builtin UEFI Secure Boot with custom secure boot keys (currently OpenCore only). There are probably things that can be improved, so feel free to open issues or even PRs with suggestions or observations.

## Update

* Full changelog is here | [Changelog Archive](https://github.com/aksm-unmei/Dell-Inspiron-G7-7588-Hackintosh/blob/main/Changelog.md)

### Latest changelog

- Update OC 0.8.0.
- Update Clover 5146.
- Update latest kexts.
- Improve ALCPlugFix install command.
- Fix USB ports for Broadcom card.
- Change SMBIOS to MacBookPro15,2 for better UHD630 performance and better battery (I guess).
- Add boot argument `-noht40` to disable 40MHz when using 2.4GHz (Natively supported adapters by Apple disable 2.4GHz HT40 by default) (Intel wireless card required).
- Add boot argument `itlwm_cc=JP` for user who is living in Japan (Wi-Fi in Japan is a bit different for some reasons) (Intel wireless card required).
- Add Clover EFI folder back.
- Remove CodecCommander.kext and ALC256's code patch (somehow we don't need them anymore...).
- Update hotplug SSDT for USB-C port.
- Update PointerPollMask, PointerPollMin, PointerPollMax value.
- New experience: Replace VoodooI2CHID with VoodooRMI (The touchpad is from Synaptic but using I2C HID).
- Import Type-C/Thunderbolt3 hotplug method to main SSDT by default.

## Guide

* For a more friendly reading experience, the guide is now hosted [here](https://aksm-unmei.github.io/hackintosh-guide/dell-g7/).

<h2>Thanks to</h2>

* [Acidanthera Team](https://github.com/acidanthera) for OpenCore Bootloader and many Kernel Extensions.
* [Clover Team](https://github.com/CloverHackyColor/CloverBootloader) for Clover Bootloader.
* [Dortania Team](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake.html) for Coffee Lake laptop guide.
* [Juan-VC](https://github.com/Juan-VC/Hackintosh-macOS-Dell-G7-7588/blob/main/codec_dump.txt) for ALC256 codec dump.
* [black-dragon74](https://github.com/black-dragon74/ALCPlugFix-Swift) for ALCPlugFix-Swift.
* [profzei](https://github.com/profzei/Matebook-X-Pro-2018/wiki/Enable-BIOS-Secure-Boot-with-OpenCore) for UEFI Secure Boot and OpenCore guide.
* [daliansky](https://github.com/daliansky/OC-little) for ACPI patch snippets.

<h2>Support me</h2>

* [Paypal](https://www.paypal.me/tekun0lxrd)
