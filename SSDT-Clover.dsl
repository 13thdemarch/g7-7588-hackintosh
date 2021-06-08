/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLLnevXN.aml, Tue Jun  8 09:14:49 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000989 (2441)
 *     Revision         0x02
 *     Checksum         0xF7
 *     OEM ID           "DELL"
 *     OEM Table ID     "SSDT"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "DELL", "SSDT", 0x00000000)
{
    External (_SB_.ACOS, IntObj)
    External (_SB_.ACSE, IntObj)
    External (_SB_.LID0, DeviceObj)
    External (_SB_.LID0.XLID, MethodObj)    // 0 Arguments
    External (_SB_.LID_, DeviceObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.IPIC, DeviceObj)
    External (_SB_.PCI0.LPCB.LID0, DeviceObj)
    External (_SB_.PCI0.LPCB.LID_, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.LPCB.RTC_, DeviceObj)
    External (_SB_.PCI0.LPCB.TIMR, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP._DSM, MethodObj)    // 4 Arguments
    External (_SB_.PCI0.PEG0.PEGP._PS3, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI9.FNOK, IntObj)
    External (_SB_.PCI9.MODE, IntObj)
    External (_SB_.PR00, ProcessorObj)
    External (_SB_.XTNV, MethodObj)    // 2 Arguments
    External (DGPU._OFF, MethodObj)    // 0 Arguments
    External (DGPU._ON_, MethodObj)    // 0 Arguments
    External (EXT1, MethodObj)    // 1 Arguments
    External (EXT2, MethodObj)    // 1 Arguments
    External (EXT3, MethodObj)    // 1 Arguments
    External (EXT4, MethodObj)    // 1 Arguments
    External (GPHD, FieldUnitObj)
    External (XPRW, MethodObj)    // 2 Arguments
    External (ZPTS, MethodObj)    // 1 Arguments
    External (ZWAK, MethodObj)    // 1 Arguments

    Scope (\)
    {
        \_SB.ACOS = 0x80
        \_SB.ACSE = One
        GPHD = Zero
    }

    Scope (\_SB)
    {
        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "kUSBSleepPowerSupply", 
                    0x13EC, 
                    "kUSBSleepPortCurrentLimit", 
                    0x0834, 
                    "kUSBWakePowerSupply", 
                    0x13EC, 
                    "kUSBWakePortCurrentLimit", 
                    0x0834
                })
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }
    }

    Scope (\_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")  // _HID: Hardware ID
        }
    }

    Scope (_SB.PR00)
    {
        Method (DTGP, 5, NotSerialized)
        {
            If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
            {
                If ((Arg1 == One))
                {
                    If ((Arg2 == Zero))
                    {
                        Arg4 = Buffer (One)
                            {
                                 0x03                                             // .
                            }
                        Return (One)
                    }

                    If ((Arg2 == One))
                    {
                        Return (One)
                    }
                }
            }

            Arg4 = Buffer (One)
                {
                     0x00                                             // .
                }
            Return (Zero)
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            Local0 = Package (0x02)
                {
                    "plugin-type", 
                    One
                }
            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
            Return (Local0)
        }
    }

    Scope (_SB)
    {
        Method (BTNV, 2, NotSerialized)
        {
            If ((Arg0 == 0x02))
            {
                If ((\_SB.PCI9.MODE == One))
                {
                    \_SB.PCI9.FNOK = One
                    \_SB.XTNV (Arg0, Arg1)
                }
                Else
                {
                    If ((\_SB.PCI9.FNOK != One))
                    {
                        \_SB.PCI9.FNOK = One
                    }
                    Else
                    {
                        \_SB.PCI9.FNOK = Zero
                    }

                    \_SB.XTNV (0x03, Arg1)
                }
            }
            Else
            {
                \_SB.XTNV (Arg0, Arg1)
            }
        }

        Device (PCI9)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (FNOK, Zero)
            Name (MODE, Zero)
            Name (TPTS, Zero)
            Name (TWAK, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (IMEI)
        {
            Name (_ADR, 0x00160000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MCHC)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (XMIX)
        {
            Name (_ADR, 0x00080000)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (XRAM)
        {
            Name (_ADR, 0x00140002)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (XSPI)
        {
            Name (_ADR, 0x001F0005)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x02)
                {
                    "pci-device-hidden", 
                    Buffer (0x08)
                    {
                         0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (XTML)
        {
            Name (_ADR, 0x00120000)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }

    Scope (_SB.PCI0.GFX0)
    {
        Device (PNLF)
        {
            Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
            Name (_CID, "backlight")  // _CID: Compatible ID
            Name (_UID, 0x13)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }
    }

    Scope (_SB.PCI0.SBUS)
    {
        Device (BUS0)
        {
            Name (_CID, "smbus")  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Device (DVL0)
            {
                Name (_ADR, 0x57)  // _ADR: Address
                Name (_CID, "diagsvault")  // _CID: Compatible ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (!Arg2)
                    {
                        Return (Buffer (One)
                        {
                             0x57                                             // W
                        })
                    }

                    Return (Package (0x02)
                    {
                        "address", 
                        0x57
                    })
                }
            }
        }
    }

    Scope (_SB.PCI0.LPCB.PS2K)
    {
        Name (RMCF, Package (0x04)
        {
            "Mouse", 
            Package (0x02)
            {
                "ActLikeTrackpad", 
                ">y"
            }, 

            "Keyboard", 
            Package (0x02)
            {
                "Custom PS2 Map", 
                Package (0x04)
                {
                    Package (0x00){}, 
                    "46=0", 
                    "e045=0", 
                    "e037=64"
                }
            }
        })
    }

    Scope (_SB.LID0)
    {
        Method (_LID, 0, NotSerialized)  // _LID: Lid Status
        {
            If ((\_SB.PCI9.FNOK == One))
            {
                Return (Zero)
            }
            Else
            {
                Return (\_SB.LID0.XLID ())
            }
        }
    }

    Device (NHG1)
    {
        Name (_HID, "NHG10000")  // _HID: Hardware ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If ((CondRefOf (\_SB.PCI0.PEG0.PEGP._DSM) && CondRefOf (\_SB.PCI0.PEG0.PEGP._PS3)))
            {
                \_SB.PCI0.PEG0.PEGP._DSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0") /* Unknown UUID */, 0x0100, 0x1A, Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x03                           // ....
                    })
                \_SB.PCI0.PEG0.PEGP._PS3 ()
            }
        }
    }

    Device (MEM2)
    {
        Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
        Name (_UID, 0x02)  // _UID: Unique ID
        Name (CRS, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x20000000,         // Address Base
                0x00200000,         // Address Length
                )
            Memory32Fixed (ReadWrite,
                0x40000000,         // Address Base
                0x00200000,         // Address Length
                )
        })
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Return (CRS) /* \MEM2.CRS_ */
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }

    Method (EXT3, 1, NotSerialized)
    {
        If ((0x03 == Arg0))
        {
            If (CondRefOf (\_SB.LID))
            {
                Notify (\_SB.LID, 0x80) // Status Change
            }

            If (CondRefOf (\_SB.LID0))
            {
                Notify (\_SB.LID0, 0x80) // Status Change
            }

            If (CondRefOf (\_SB.PCI0.LPCB.LID))
            {
                Notify (\_SB.PCI0.LPCB.LID, 0x80) // Status Change
            }

            If (CondRefOf (\_SB.PCI0.LPCB.LID0))
            {
                Notify (\_SB.PCI0.LPCB.LID0, 0x80) // Status Change
            }
        }
    }

    Method (GPRW, 2, NotSerialized)
    {
        If ((0x6D == Arg0))
        {
            Return (Package (0x02)
            {
                0x6D, 
                Zero
            })
        }

        If ((0x0D == Arg0))
        {
            Return (Package (0x02)
            {
                0x0D, 
                Zero
            })
        }

        Return (XPRW (Arg0, Arg1))
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        \_SB.PCI9.TPTS = Arg0
        If ((\_SB.PCI9.FNOK == One))
        {
            Arg0 = 0x03
        }

        If (CondRefOf (\DGPU._ON))
        {
            \DGPU._ON ()
        }

        If (CondRefOf (EXT1))
        {
            EXT1 (Arg0)
        }

        ZPTS (Arg0)
        If (CondRefOf (EXT2))
        {
            EXT2 (Arg0)
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        \_SB.PCI9.TWAK = Arg0
        If ((\_SB.PCI9.FNOK == One))
        {
            \_SB.PCI9.FNOK = Zero
            Arg0 = 0x03
        }

        If (((Arg0 < One) || (Arg0 > 0x05)))
        {
            Arg0 = 0x03
        }

        If (CondRefOf (\DGPU._OFF))
        {
            \DGPU._OFF ()
        }

        If (CondRefOf (EXT3))
        {
            EXT3 (Arg0)
        }

        Local0 = ZWAK (Arg0)
        If (CondRefOf (EXT4))
        {
            EXT4 (Arg0)
        }

        Return (Local0)
    }
}

