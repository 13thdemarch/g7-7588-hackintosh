/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLNb8q4k.aml, Tue Mar  2 12:07:14 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000011E8 (4584)
 *     Revision         0x02
 *     Checksum         0x97
 *     OEM ID           "Dell"
 *     OEM Table ID     "Mizuhara"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "DELL", "Mizuhara", 0x00001000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0.LCD_, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP._DSM, MethodObj)    // 4 Arguments
    External (_SB_.PCI0.PEG0.PEGP._PS3, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.RP21, DeviceObj)
    External (_SB_.PCI0.RP21.PXSX, DeviceObj)
    External (_SB_.PCI0.RP21.UPSB, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PR00, ProcessorObj)

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

        Device (UIAC)
        {
            Name (_HID, "UIA00000")  // _HID: Hardware ID
            Name (RMCF, Package (0x04)
            {
                "XHC", 
                Package (0x04)
                {
                    "port-count", 
                    Buffer (0x04)
                    {
                         0x13, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "ports", 
                    Package (0x1C)
                    {
                        "HS01", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS01"
                            }, 

                            "UsbConnector", 
                            Zero, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS02", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS02"
                            }, 

                            "UsbConnector", 
                            Zero, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x02, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS03", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS03"
                            }, 

                            "UsbConnector", 
                            Zero, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x03, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS04", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS04"
                            }, 

                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x04, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS05", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS05"
                            }, 

                            "UsbConnector", 
                            0xFF, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x05, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS06", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS06"
                            }, 

                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x06, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS07", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS07"
                            }, 

                            "UsbConnector", 
                            0xFF, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x07, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS08", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS08"
                            }, 

                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x08, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS09", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS09"
                            }, 

                            "UsbConnector", 
                            0xFF, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x09, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS10", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS10"
                            }, 

                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x0A, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "HS14", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "HS14"
                            }, 

                            "UsbConnector", 
                            0xFF, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x0E, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "SS01", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "SS01"
                            }, 

                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x11, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "SS02", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "SS02"
                            }, 

                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x12, 0x00, 0x00, 0x00                           // ....
                            }
                        }, 

                        "SS03", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "SS03"
                            }, 

                            "UsbConnector", 
                            0x03, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x13, 0x00, 0x00, 0x00                           // ....
                            }
                        }
                    }
                }, 

                "XHC2", 
                Package (0x04)
                {
                    "port-count", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "ports", 
                    Package (0x02)
                    {
                        "SSP1", 
                        Package (0x06)
                        {
                            "name", 
                            Buffer (0x05)
                            {
                                "SSP1"
                            }, 

                            "UsbConnector", 
                            0x09, 
                            "port", 
                            Buffer (0x04)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }
                        }
                    }
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
    }

    Scope (_SB.PCI0)
    {
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

                Return (Package (0x0A)
                {
                    "AAPL,slot-name", 
                    "Built-in", 
                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }, 

                    "name", 
                    "Gaussian Mixture", 
                    "device_type", 
                    Buffer (0x11)
                    {
                        "Gaussian Mixture"
                    }, 

                    "model", 
                    Buffer (0x39)
                    {
                        "Intel Corporation, Series Chipset Gaussian Mixture Model"
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

                Return (Package (0x0A)
                {
                    "AAPL,slot-name", 
                    "Built-in", 
                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }, 

                    "name", 
                    "Shared SRAM", 
                    "device_type", 
                    Buffer (0x0B)
                    {
                        "Share SRAM"
                    }, 

                    "model", 
                    Buffer (0x2D)
                    {
                        "Intel Corporation, Series Chipset Share SRAM"
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

                Return (Package (0x0A)
                {
                    "AAPL,slot-name", 
                    "Built-in", 
                    "name", 
                    "Serial Bus Controller", 
                    "model", 
                    Buffer (0x31)
                    {
                        "Intel Corporation, Series Chipset SPI Controller"
                    }, 

                    "device_type", 
                    Buffer (0x16)
                    {
                        "Serial Bus Controller"
                    }, 

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

                Return (Package (0x0A)
                {
                    "AAPL,slot-name", 
                    "Built-in", 
                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }, 

                    "name", 
                    "Thermal Controller", 
                    "device_type", 
                    Buffer (0x13)
                    {
                        "Thermal Controller"
                    }, 

                    "model", 
                    Buffer (0x35)
                    {
                        "Intel Corporation, Series Chipset Thermal Controller"
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
    }

    Scope (\_SB.PCI0.RP21)
    {
        Scope (PXSX)
        {
            Name (_STA, Zero)  // _STA: Status
        }

        Device (UPSB)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x02)
                {
                    "PCI-Thunderbolt", 
                    One
                })
            }

            Name (_RMV, One)  // _RMV: Removal Status
            Device (DSB0)
            {
                Device (NHI3)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x0D)
                        {
                            "AAPL,slot-name", 
                            "Built In", 
                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             // .
                            }, 

                            "name", 
                            "Thunderbolt 3 Controller", 
                            "device_type", 
                            Buffer (0x19)
                            {
                                "Thunderbolt 3 Controller"
                            }, 

                            "model", 
                            Buffer (0x40)
                            {
                                "Intel Corporation, Series Chipset Thunderbolt 3 Host Controller"
                            }, 

                            "power-save", 
                            One, 
                            Buffer (One)
                            {
                                 0x00                                             // .
                            }
                        })
                    }
                }

                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (!Arg2)
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x02)
                    {
                        "PCIHotplugCapable", 
                        Zero
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

            Device (DSB1)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
            }

            Device (DSB2)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Device (XHC2)
                {
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (SSP1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0x09, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision           = 0x1,
                                    PLD_IgnoreColor        = 0x1,
                                    PLD_Red                = 0x0,
                                    PLD_Green              = 0x0,
                                    PLD_Blue               = 0x0,
                                    PLD_Width              = 0x0,
                                    PLD_Height             = 0x0,
                                    PLD_UserVisible        = 0x1,
                                    PLD_Dock               = 0x0,
                                    PLD_Lid                = 0x0,
                                    PLD_Panel              = "UNKNOWN",
                                    PLD_VerticalPosition   = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape              = "UNKNOWN",
                                    PLD_GroupOrientation   = 0x0,
                                    PLD_GroupToken         = 0x0,
                                    PLD_GroupPosition      = 0x0,
                                    PLD_Bay                = 0x0,
                                    PLD_Ejectable          = 0x0,
                                    PLD_EjectRequired      = 0x0,
                                    PLD_CabinetNumber      = 0x0,
                                    PLD_CardCageNumber     = 0x0,
                                    PLD_Reference          = 0x0,
                                    PLD_Rotation           = 0x0,
                                    PLD_Order              = 0x0,
                                    PLD_VerticalOffset     = 0x0,
                                    PLD_HorizontalOffset   = 0x0)

                            })
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package (0x0A)
                                {
                                    "UsbCPortNumber", 
                                    0x02, 
                                    "UsbPowerSource", 
                                    0x02, 
                                    "kUSBWakePortCurrentLimit", 
                                    0x0BB8, 
                                    "kUSBSleepPortCurrentLimit", 
                                    0x0BB8, 
                                    "UsbCompanionPortPresent", 
                                    One
                                })
                            }
                        }
                    }

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

                        Return (Package (0x10)
                        {
                            "AAPL,slot-name", 
                            "Built In", 
                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             // .
                            }, 

                            "name", 
                            "USB Controller", 
                            "device_type", 
                            Buffer (0x0F)
                            {
                                "USB Controller"
                            }, 

                            "model", 
                            Buffer (0x38)
                            {
                                "Intel Corporation, Series Chipset USB-C Host Controller"
                            }, 

                            "USBBusNumber", 
                            Zero, 
                            "UsbCompanionControllerPresent", 
                            One, 
                            "AAPL,XHCI-clock-id", 
                            One
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
    }

    Scope (\_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")  // _HID: Hardware ID
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

    Scope (_SB.PCI0.GFX0)
    {
        Device (PNLF)
        {
            Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
            Name (_CID, "backlight")  // _CID: Compatible ID
            Name (_UID, 0x13)  // _UID: Unique ID
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

        Method (BRT6, 2, NotSerialized)
        {
            If ((Arg0 == One))
            {
                Notify (^LCD, 0x86) // Device-Specific
                Notify (^^LPCB.PS2K, 0x10) // Reserved
                Notify (^^LPCB.PS2K, 0x0206)
                Notify (^^LPCB.PS2K, 0x0286)
            }

            If ((Arg0 & 0x02))
            {
                Notify (^LCD, 0x87) // Device-Specific
                Notify (^^LPCB.PS2K, 0x20) // Reserved
                Notify (^^LPCB.PS2K, 0x0205)
                Notify (^^LPCB.PS2K, 0x0285)
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

    Scope (\_SB.PR00)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }
        }
    }

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

    Method (XOSI, 1, NotSerialized)
    {
        Local0 = Package (0x11)
            {
                "Windows 2001", 
                "Windows 2001.1", 
                "Windows 2001 SP1", 
                "Windows 2001 SP2", 
                "Windows 2001 SP3", 
                "Windows 2006", 
                "Windows 2006 SP1", 
                "Windows 2009", 
                "Windows 2012", 
                "Windows 2013", 
                "Microsoft Windows NT", 
                "Microsoft Windows", 
                "Microsoft WindowsME: Millennium Edition"
            }
        If (_OSI ("Darwin"))
        {
            Return ((Ones != Match (Local0, MEQ, Arg0, MTR, Zero, Zero)))
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}

