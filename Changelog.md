Dell Inspiron G7 7588 Changelog
===============================
#### Tarutaru Updates: April 2022
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

#### Tarutaru Updates: February 2022
- Update OC 0.7.9.
- Update latest kexts.
- Remove Method GPRW in SSDT (improve sleep).
- Intel wireless card's kexts are set by default (Wi-Fi kext AirportItlwm is for macOS Monterey).
- Add AudioDxe and CrScreenShotDxe drivers.
- Add Type-C hotplug SSDT and kext (optional).

#### Tarutaru Updates: February 2022
- Update OC 0.7.8.
- Update latest kexts.
- Drop Clover EFI folder (reason: kext loading buggy)
- Change PointerPollMax values (improving UI and delay time at OpenCanopy and FileVault2.
- Add USBPorts and XHCI-Unsupported kext.
- Disable Device (RHUB) in DSDT (to get native USB ports in macOS with USBPorts.kext).
- Add NVMeFix kext back to reduce idle power consumption of the controller.
- Rewrite all ACPI patches and merge to one file, avoid booting to Windows.

#### Tarutaru Updates: January 2022
- Update OC 0.7.7.
- Update Clover 5143.
- Update latest kexts.
- Update a folder which contains CPUFriendDataProvider for Core i5 machine.
- Remove NVMeFix.kext for native NVMe's power management.
- Improve HPET's IRQNoFlag.
- Improve RTC's alignment and length values (for better hibernation).
- Remove unnecessary devices in SSDT-PCID.
- Add FWHD device to SSDT-PCID.
- Add PPMC device to SSDT-PCID (_ADR is Zero. macOS can't detect if _ADR is 0x001F0002 on this machine because it's not existed).
- Add ARTC device to SSDT-PCID.
- Rework SSDT-DDGPU, to be paired with SSDT-PTSWAK.
- Improve SSDT-ALS0 for enabling native Ambient Light Sensor device in DSDT.
- Remove USB mapping kexts.
- Remove USB map folder.
- Inject USB mapping ports directly using SSDT-XHC (modified version of OEM SSDT-xh_cfhd4, which means the original one is dropped in config.plist).
- Change inject x86 to realize CPU power management method in SSDT-CPUPM.
- Disable Goodix Fingerprint in SSDT-XHC (better battery life I think).
- Add AudioDxe.efi for boot-chime (enabled by default, OpenCore only).
- FileVault 2's setting is enabled by default (OpenCore only).
- Set PointerPollMin, PointerPollMax and PointerPollMask values (OpenCore 0.7.7).
- Add custom HiDPI script.

#### Tarutaru Updates: December 2021
- Update OC 0.7.6.
- Update Clover 5142.
- Update latest kexts.
- Set Broadcom USB mapping kext for default.
- Set CPUFriendDataProvider's data is similar to Windows.
- Update SSDT-PNLF.aml
- Improve system HPET, RTC, TIMR using SSDT-HRTFix.aml
- Fix ACPI typo.

#### Tarutaru Updates: November 2021
- Update OC 0.7.5.
- Update Clover 5141.
- Update latest kexts.
- Set CPUFriendDataProvider data to default for i7-8750H and SMBIOS MacBookPro15,1.
- Optimized SSDTs.
- Remove display connectors data (not need).
- Remove Wi-Fi/Bluetooth kexts.
- Create USB mapping folder for both Intel/Broadcom wireless card.
- Set USB mapping kext for Intel card by default.

#### Tarutaru Updates: October 2021
- Start supporting Intel Wireless card system only.
- Update OC 0.7.4.
- Update Clover 5140.
- Update latest kexts.
- Remove ComboJack method, replace with ALCPlugFix-Swift.
- Remove Innie kext (not necessary).
- Fix typo `SSDT-GPI0.aml`.
- Add CodecCommander kext and SSDT-HDEF.aml to be paired with ALCPlugFix.
- Add `acpi-wake-type` property to wake from USB keyboard correctly.
- Add `alc-verbs` property to enable ALC Verb support.
- Add HibernationFixup kext to improve hibernation (mode 3).

#### Tarutaru Updates: September 2021
- Update OpenCore 0.7.3 (It's better than I thought)
- Update Clover 5139.
- Update lastest kexts.
- Add Innie.kext to make all PCIe drives appear internal.
- Set PNLF brightness code back to default for CoffeeLake model (to trigger AppleBacklight.kext).
- Add backlight smoother.
- Update new CPU power management data for CPUFriendDataProvider.kext, for better battery usage.
- Remove unnecessary device.
- Fix Intel Bluetooth on macOS Monterey Beta (OpenCore only. See config-intel.plist for more infomation).

#### Tarutaru Updates: August 2021
- Update OpenCore 0.7.2.
- Update Clover 5138.
- Update lastest kexts.
- Add `Device (ALS0)` in SSDT and SMCLightSensor kernel extension to get automatically adjust brightness works in System Preference > Display (this machine has light sensor device).
- Improve PNLF brightness code to fix Windows compatibility.
- Update wireless and bluetooth kext folder.
- Update USB mapping kext folder.

#### Tarutaru Updates: July 2021
- Bump version.

#### Tarutaru Updates: June 2021
- Change repository name.
- Add Clover Bootloader EFI.
- Add connector patches for user who is using two external monitors.
- Change audio `layout-id` to `14`, supported subwoofer external speaker.
- Fix GPI0 code to make trackpad work correctly.
- Remove define missing devices's name in SSDT, clean PCI in System Information.
- Remove TB3/Type-C hotplug code in SSDT and IOElectrify kext because of some issues between macOS 11.4 and BIOS.
- Remove DMAC, PMCR, HPET, TMR, IPIC, RTC in SSDT (not need).

#### Tarutaru Updates: May 2021
- Bump to OC 0.6.9.
- Update lastest kexts.
- Remove Device (UIAC) for USB mapping, replaced with USBMap.kext.
- Merge all hotpatches SSDT into one file. You can check SSDT.dsl or the list of hotpatches if you want to know what are inside.
- Change graphic ig-platform-id back to `0900A53E` (better than `00009B3E` when working with Final Cut Pro or Premiere Pro)
- Change audio layout-id back to 13 for the stability and the quality.
- Add audio property `alctsel = <01000000>` for fixing missing audio if rebooting from Windows to macOS.
- Make the PCI more cleaner.

#### Tarutaru Updates: April 2021
- Bump to OC 0.6.7 Plus :< ~~(Why plus: Because current version of VoodooI2C can't run on OC 0.6.8)~~.
- Bump to OC 0.6.8.
- Everything is fine now.
- VoodooI2C 2.6.5 works well.
- Update latest kexts.
- Remove brightness keys ACPI rename method (BRT6, OSID, included _OSI).
- Brightness keys now are worked well with BrightnessKeys.kext.
- By default, because of macOS, Fn+B/S are for changing display brightness. Now they are totally disabled. There are only Fn+F11/F12.
- Add PrtScr button for enabling screenshot/recording. Remember to change it in Keyboard setting.
- Enhance and fix some issues with sleep with PTS/WAK and GPRW SSDT (sleep and wake are very fast now).
- Improve Fn + Insert shortcut key (special thanks to @daliansky, also thanks to Dell):
	* If there is no external display, the machine will sleep.
	* If the external display is connected, the internal display will turn off. The working screen now is external display only. Press Fn + Insert again to wake internal display, both displays will be normal.
- Add some extra hotpatches for Dell machine (thanks to @daliansky).
- Improve touchpad gestures.
- Add CFGUnlock.efi for automatically unlocking MSR 0x02

#### Tarutaru Updates: March 2021
- Latest kernel extensions.
- Fix backlight registers on CoffeeLake platform using properties `enable-backlight-registers-fix = <01000000>`.
- Fix some bugs with OpenCanopy theme.
- Change audio layout-id to 56.
- Merge all SSDTs to only one.
- Optimize USB Type-C/Thunderbolt 3 hotplug method in SSDT, remove unnecessary things.

#### Tarutaru Updates: February 2021
- Latest kernel extensions.
- Update OpenCore theme with background.

#### Tarutaru Updates: January 2021
- Lastest kernel extension.
- "Extracted" SSDT-OC-7588.aml.
- Change AAPL,ig-platform-id back to 00009B3E.
- Change layout-id for audio back to 14.
- Update SSDT-PNLF.aml.
- Add SSDT-TYPC-TB3.aml for TB3 hotplug.
- Add SSDT-UIAC.aml for USB mapping.
- Optimize SSDTs.

#### Tarutaru Updates: December 2020
- Stable EFI for Big Sur with OC 0.6.4.
- Lastest kernel extensions.
- Change AAPL,ig-platform-id back to 0900A53E.
- Change layout-id for audio back to 21.

