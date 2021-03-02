Dell G7 7588 OpenCore Changelog
===============================
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


