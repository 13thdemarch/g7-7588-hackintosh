Dell G7 7588 OpenCore Changelog
===============================
#### v0.6.8
- Bump to OC 0.6.8.
- Everything is fine now.
- VoodooI2C 2.6.5 works well.

#### v0.6.7+
- Bump to OC 0.6.7 Plus :< ~~(Why plus: Because current version of VoodooI2C can't run on OC 0.6.8)~~.
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

#### v0.6.7
- Latest kernel extensions.
- Fix backlight registers on CoffeeLake platform using properties `enable-backlight-registers-fix = <01000000>`.
- Fix some bugs with OpenCanopy theme.
- Change audio layout-id to 56.
- Merge all SSDTs to only one.
- Optimize USB Type-C/Thunderbolt 3 hotplug method in SSDT, remove unnecessary things.

#### v0.6.6
- Latest kernel extensions.
- Update OpenCore theme with background.

#### v0.6.5
- Lastest kernel extension.
- "Extracted" SSDT-OC-7588.aml.
- Change AAPL,ig-platform-id back to 00009B3E.
- Change layout-id for audio back to 14.
- Update SSDT-PNLF.aml.
- Add SSDT-TYPC-TB3.aml for TB3 hotplug.
- Add SSDT-UIAC.aml for USB mapping.
- Optimize SSDTs.

#### v0.6.6
- Stable EFI for Big Sur with OC 0.6.4.
- Lastest kernel extensions.
- Change AAPL,ig-platform-id back to 0900A53E.
- Change layout-id for audio back to 21.


