<h1 align="center"> Dell Inspiron G7 7588 Hackintosh </h1>

<p align="center">
  <a href="https://www.apple.com/">
    <img src="https://img.shields.io/badge/macOS-11.6.7-red"></a> &nbsp;&nbsp;
  <a href="https://www.dell.com/support/home/en-vn/drivers/driversdetails?driverid=1dkg0&oscode=wt64a&productcode=g-series-15-7588-laptop">
    <img src="https://img.shields.io/badge/BIOS-1.21-blue"></a> &nbsp;&nbsp;
  <a href="https://github.com/acidanthera/OpenCorePkg">
    <img src="https://img.shields.io/badge/OpenCore-0.8.2-12AED6"></a> &nbsp;&nbsp;
  <a href="https://github.com/CloverHackyColor/CloverBootloader">
    <img src="https://img.shields.io/badge/Clover-5148-00CC00"></a> &nbsp;&nbsp;
</p>

<p align="center">
  <img src="./asset/g7.png" alt="Dell G7 7588" width="40%">
</p>

This EFI repository contains the files needed to successfully boot into macOS on Dell G7 7588 with Opencore and Clover, also it's very stable now. macOS 12 Monterey works well with Windows 11 in dual boot, even with builtin UEFI Secure Boot with custom secure boot keys (currently OpenCore only). There are probably things that can be improved, so feel free to open issues or even PRs with suggestions or observations.

## Update

* Full changelog is here | [Changelog Archive](https://github.com/aksm-unmei/Dell-Inspiron-G7-7588-Hackintosh/blob/main/Changelog.md)

### Latest changelog

- Remove MMIO whitelist.
- Some optimisations.

## Guide

* For a more friendly reading experience, the guide is now hosted [here](https://aksm-unmei.github.io/hackintosh-guide/dell-g7/).

<h2>Thanks to</h2>

* [Acidanthera Team](https://github.com/acidanthera) for OpenCore Bootloader and many Kernel Extensions.
* [Juan-VC](https://github.com/Juan-VC/Hackintosh-macOS-Dell-G7-7588/blob/main/codec_dump.txt) for ALC256 codec dump.
* [black-dragon74](https://github.com/black-dragon74/ALCPlugFix-Swift) for ALCPlugFix-Swift.
* [profzei](https://github.com/profzei/Matebook-X-Pro-2018/wiki/Enable-BIOS-Secure-Boot-with-OpenCore) for UEFI Secure Boot and OpenCore guide.
* [daliansky](https://github.com/daliansky/OC-little) for ACPI patch snippets.

<h2>Support me</h2>

* [Paypal](https://www.paypal.me/tekun0lxrd)
