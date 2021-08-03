/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLkdXL85.aml, Tue Aug  3 09:13:11 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000106A (4202)
 *     Revision         0x02
 *     Checksum         0xA5
 *     OEM ID           "DELL"
 *     OEM Table ID     "SSDT"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "DELL", "7588", 0x00000000)
{
    External (_SB_.ACOS, IntObj)
    External (_SB_.ACSE, IntObj)
    External (_SB_.LID0, DeviceObj)
    External (_SB_.LID0.XLID, MethodObj)    // 0 Arguments
    External (_SB_.LID_, DeviceObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.LID0, DeviceObj)
    External (_SB_.PCI0.LPCB.LID_, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
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
    External (RMCF.BKLT, IntObj)
    External (RMCF.FBTP, IntObj)
    External (RMCF.GRAN, IntObj)
    External (RMCF.LEVW, IntObj)
    External (RMCF.LMAX, IntObj)
    External (XPRW, MethodObj)    // 2 Arguments
    External (ZPTS, MethodObj)    // 1 Arguments
    External (ZWAK, MethodObj)    // 1 Arguments

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.ACOS = 0x80
            \_SB.ACSE = One
            GPHD = Zero
        }
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

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    If (_OSI ("Darwin"))
    {
        Scope (\_SB.PCI0.LPCB)
        {
            Device (EC)
            {
                Name (_HID, "KURO0000")  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }
        }
    }

    Scope (\_SB.PCI0.LPCB.PS2K)
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

    If (_OSI ("Darwin"))
    {
        Scope (\_SB.PCI0.GFX0)
        {
            OperationRegion (RMP3, PCI_Config, Zero, 0x14)
            Device (PNLF)
            {
                Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                Name (_CID, "backlight")  // _CID: Compatible ID
                Name (_UID, 0x13)  // _UID: Unique ID
                Name (_STA, 0x0B)  // _STA: Status
                Field (^RMP3, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    GDID,   16, 
                    Offset (0x10), 
                    BAR1,   32
                }

                OperationRegion (RMB1, SystemMemory, (BAR1 & 0xFFFFFFFFFFFFFFF0), 0x000E1184)
                Field (RMB1, AnyAcc, Lock, Preserve)
                {
                    Offset (0x48250), 
                    LEV2,   32, 
                    LEVL,   32, 
                    Offset (0x70040), 
                    P0BL,   32, 
                    Offset (0xC2000), 
                    GRAN,   32, 
                    Offset (0xC8250), 
                    LEVW,   32, 
                    LEVX,   32, 
                    LEVD,   32, 
                    Offset (0xE1180), 
                    PCHL,   32
                }

                Method (INI1, 1, NotSerialized)
                {
                    If ((Zero == (0x02 & Arg0)))
                    {
                        Local5 = 0xC0000000
                        If (CondRefOf (\RMCF.LEVW))
                        {
                            If ((Ones != \RMCF.LEVW))
                            {
                                Local5 = \RMCF.LEVW /* External reference */
                            }
                        }

                        ^LEVW = Local5
                    }

                    If ((0x04 & Arg0))
                    {
                        If (CondRefOf (\RMCF.GRAN))
                        {
                            ^GRAN = \RMCF.GRAN /* External reference */
                        }
                        Else
                        {
                            ^GRAN = Zero
                        }
                    }
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Local4 = One
                    If (CondRefOf (\RMCF.BKLT))
                    {
                        Local4 = \RMCF.BKLT /* External reference */
                    }

                    If (!(One & Local4))
                    {
                        Return (Zero)
                    }

                    Local0 = ^GDID /* \_SB_.PCI0.GFX0.PNLF.GDID */
                    Local2 = Ones
                    If (CondRefOf (\RMCF.LMAX))
                    {
                        Local2 = \RMCF.LMAX /* External reference */
                    }

                    Local3 = Zero
                    If (CondRefOf (\RMCF.FBTP))
                    {
                        Local3 = \RMCF.FBTP /* External reference */
                    }

                    If (((One == Local3) || (Ones != Match (Package (0x10)
                                        {
                                            0x010B, 
                                            0x0102, 
                                            0x0106, 
                                            0x1106, 
                                            0x1601, 
                                            0x0116, 
                                            0x0126, 
                                            0x0112, 
                                            0x0122, 
                                            0x0152, 
                                            0x0156, 
                                            0x0162, 
                                            0x0166, 
                                            0x016A, 
                                            0x46, 
                                            0x42
                                        }, MEQ, Local0, MTR, Zero, Zero))))
                    {
                        If ((Ones == Local2))
                        {
                            Local2 = 0x0710
                        }

                        Local1 = (^LEVX >> 0x10)
                        If (!Local1)
                        {
                            Local1 = Local2
                        }

                        If ((!(0x08 & Local4) && (Local2 != Local1)))
                        {
                            Local0 = ((^LEVL * Local2) / Local1)
                            Local3 = (Local2 << 0x10)
                            If ((Local2 > Local1))
                            {
                                ^LEVX = Local3
                                ^LEVL = Local0
                            }
                            Else
                            {
                                ^LEVL = Local0
                                ^LEVX = Local3
                            }
                        }
                    }
                    ElseIf (((0x03 == Local3) || (Ones != Match (Package (0x19)
                                        {
                                            0x3E9B, 
                                            0x3EA5, 
                                            0x3E92, 
                                            0x3E91, 
                                            0x3EA0, 
                                            0x3EA6, 
                                            0x3E98, 
                                            0x9BC8, 
                                            0x9BC5, 
                                            0x9BC4, 
                                            0xFF05, 
                                            0x8A70, 
                                            0x8A71, 
                                            0x8A51, 
                                            0x8A5C, 
                                            0x8A5D, 
                                            0x8A52, 
                                            0x8A53, 
                                            0x8A56, 
                                            0x8A5A, 
                                            0x8A5B, 
                                            0x9B41, 
                                            0x9B21, 
                                            0x9BCA, 
                                            0x9BA4
                                        }, MEQ, Local0, MTR, Zero, Zero))))
                    {
                        If ((Ones == Local2))
                        {
                            Local2 = 0xFFFF
                        }

                        INI1 (Local4)
                        Local1 = ^LEVX /* \_SB_.PCI0.GFX0.PNLF.LEVX */
                        If (!Local1)
                        {
                            Local1 = Local2
                        }

                        If ((!(0x08 & Local4) && (Local2 != Local1)))
                        {
                            Local0 = ((^LEVD * Local2) / Local1)
                            If ((Local2 > Local1))
                            {
                                ^LEVX = Local2
                                ^LEVD = Local0
                            }
                            Else
                            {
                                ^LEVD = Local0
                                ^LEVX = Local2
                            }
                        }
                    }
                    Else
                    {
                        If ((Ones == Local2))
                        {
                            If ((Ones != Match (Package (0x16)
                                            {
                                                0x0D26, 
                                                0x0A26, 
                                                0x0D22, 
                                                0x0412, 
                                                0x0416, 
                                                0x0A16, 
                                                0x0A1E, 
                                                0x0A1E, 
                                                0x0A2E, 
                                                0x041E, 
                                                0x041A, 
                                                0x0BD1, 
                                                0x0BD2, 
                                                0x0BD3, 
                                                0x1606, 
                                                0x160E, 
                                                0x1616, 
                                                0x161E, 
                                                0x1626, 
                                                0x1622, 
                                                0x1612, 
                                                0x162B
                                            }, MEQ, Local0, MTR, Zero, Zero)))
                            {
                                Local2 = 0x0AD9
                            }
                            Else
                            {
                                Local2 = 0x056C
                            }
                        }

                        INI1 (Local4)
                        Local1 = (^LEVX >> 0x10)
                        If (!Local1)
                        {
                            Local1 = Local2
                        }

                        If ((!(0x08 & Local4) && (Local2 != Local1)))
                        {
                            Local0 = ((((^LEVX & 0xFFFF) * Local2) / Local1) | 
                                (Local2 << 0x10))
                            ^LEVX = Local0
                        }
                    }

                    If ((Local2 == 0x0710))
                    {
                        _UID = 0x0E
                    }
                    ElseIf ((Local2 == 0x0AD9))
                    {
                        _UID = 0x0F
                    }
                    ElseIf ((Local2 == 0x056C))
                    {
                        _UID = 0x10
                    }
                    ElseIf ((Local2 == 0x07A1))
                    {
                        _UID = 0x11
                    }
                    ElseIf ((Local2 == 0x1499))
                    {
                        _UID = 0x12
                    }
                    ElseIf ((Local2 == 0xFFFF))
                    {
                        _UID = 0x13
                    }
                    Else
                    {
                        _UID = 0x63
                    }
                }
            }
        }

        Scope (_SB)
        {
            Method (BTNV, 2, NotSerialized)
            {
                If ((_OSI ("Darwin") && (Arg0 == 0x02)))
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
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }

            Device (ALS0)
            {
                Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
                Name (_CID, "smc-als")  // _CID: Compatible ID
                Name (_ALI, 0x012C)  // _ALI: Ambient Light Illuminance
                Name (_ALR, Package (0x01)  // _ALR: Ambient Light Response
                {
                    Package (0x02)
                    {
                        0x64, 
                        0x012C
                    }
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
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
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (MCHC)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (PPMC)
        {
            Name (_ADR, 0x001F0002)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
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
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
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
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
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
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
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
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (_SB.PCI0.LPCB)
    {
        Device (DMAC)
        {
            Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x01,               // Alignment
                    0x20,               // Length
                    )
                IO (Decode16,
                    0x0081,             // Range Minimum
                    0x0081,             // Range Maximum
                    0x01,               // Alignment
                    0x11,               // Length
                    )
                IO (Decode16,
                    0x0093,             // Range Minimum
                    0x0093,             // Range Maximum
                    0x01,               // Alignment
                    0x0D,               // Length
                    )
                IO (Decode16,
                    0x00C0,             // Range Minimum
                    0x00C0,             // Range Maximum
                    0x01,               // Alignment
                    0x20,               // Length
                    )
                DMA (Compatibility, NotBusMaster, Transfer8_16, )
                    {4}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (PMCR)
        {
            Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0xFE000000,         // Address Base
                    0x00010000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (Zero)
                }
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

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }
        }
    }

    Scope (_SB.LID0)
    {
        Method (_LID, 0, NotSerialized)  // _LID: Lid Status
        {
            If (_OSI ("Darwin"))
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
            Else
            {
                Return (\_SB.LID0.XLID ())
            }
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

    Device (NHG1)
    {
        Name (_HID, "NHG10000")  // _HID: Hardware ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
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
            Else
            {
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
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
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
        If (_OSI ("Darwin"))
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
        }

        Return (XPRW (Arg0, Arg1))
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (_OSI ("Darwin"))
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
        }

        ZPTS (Arg0)
        If (_OSI ("Darwin"))
        {
            If (CondRefOf (EXT2))
            {
                EXT2 (Arg0)
            }
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (_OSI ("Darwin"))
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
        }

        Local0 = ZWAK (Arg0)
        If (_OSI ("Darwin"))
        {
            If (CondRefOf (EXT4))
            {
                EXT4 (Arg0)
            }
        }

        Return (Local0)
    }
}

