DefinitionBlock ("", "SSDT", 2, "APPLE ", "TbtOnPCH", 0x00001000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GPCB, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.RP09, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)

    Scope (\)
    {
        Mutex (TCFG, 0x00)
        Scope (_GPE)
        {
            Method (_E2C, 0, NotSerialized)  // _Exx: Edge-Triggered GPE, xx=0x00-0xFF
            {
                If (_OSI ("Darwin"))
                {
                    \_SB.PCI0.RP09.UPSB.AMPE ()
                    \_SB.PCI0.RP09.UPSB.UMPE ()
                }
            }
        }

        Scope (_SB)
        {
            Scope (PCI0)
            {
                If (_OSI ("Darwin"))
                {
                    Scope (RP09)
                    {
                        Name (PXSX._STA, Zero)  // _STA: Status
                        Name (EICM, Zero)
                        Name (R020, Zero)
                        Name (R024, Zero)
                        Name (R028, Zero)
                        Name (R02C, Zero)
                        Name (R118, Zero)
                        Name (R119, Zero)
                        Name (R11A, Zero)
                        Name (R11C, Zero)
                        Name (R120, Zero)
                        Name (R124, Zero)
                        Name (R128, Zero)
                        Name (R12C, Zero)
                        Name (R218, Zero)
                        Name (R219, Zero)
                        Name (R21A, Zero)
                        Name (R21C, Zero)
                        Name (R220, Zero)
                        Name (R224, Zero)
                        Name (R228, Zero)
                        Name (R22C, Zero)
                        Name (R318, Zero)
                        Name (R319, Zero)
                        Name (R31A, Zero)
                        Name (R31C, Zero)
                        Name (R320, Zero)
                        Name (R324, Zero)
                        Name (R328, Zero)
                        Name (R32C, Zero)
                        Name (R418, Zero)
                        Name (R419, Zero)
                        Name (R41A, Zero)
                        Name (R41C, Zero)
                        Name (R420, Zero)
                        Name (R424, Zero)
                        Name (R428, Zero)
                        Name (R42C, Zero)
                        Name (RVES, Zero)
                        Name (R518, Zero)
                        Name (R519, Zero)
                        Name (R51A, Zero)
                        Name (R51C, Zero)
                        Name (R520, Zero)
                        Name (R524, Zero)
                        Name (R528, Zero)
                        Name (R52C, Zero)
                        Name (R618, Zero)
                        Name (R619, Zero)
                        Name (R61A, Zero)
                        Name (R61C, Zero)
                        Name (R620, Zero)
                        Name (R624, Zero)
                        Name (R628, Zero)
                        Name (R62C, Zero)
                        Name (RH10, Zero)
                        Name (RH14, Zero)
                        Name (POC0, Zero)
                        Method (MMBA, 1, Serialized)
                        {
                            Local0 = (\_SB.PCI0.GPCB () + 0x000E8000)
                            OperationRegion (MMMM, SystemMemory, Local0, 0x24)
                            Field (MMMM, DWordAcc, NoLock, Preserve)
                            {
                                Offset (0x19), 
                                SB19,   8, 
                                Offset (0x20), 
                                SB20,   32
                            }

                            Switch (ToInteger (Arg0))
                            {
                                Case (One)
                                {
                                    Local1 = Local0
                                }
                                Case (0x02)
                                {
                                    Local1 = (\_SB.PCI0.GPCB () + (SB19 * 0x00100000))
                                }
                                Case (0x03)
                                {
                                    Local1 = (\_SB.PCI0.GPCB () + ((SB19 + One) * 0x00100000))
                                }
                                Case (0x04)
                                {
                                    Local1 = ((\_SB.PCI0.GPCB () + ((SB19 + One) * 0x00100000)) + 
                                        0x8000)
                                }
                                Case (0x05)
                                {
                                    Local1 = ((\_SB.PCI0.GPCB () + ((SB19 + One) * 0x00100000)) + 
                                        0x00010000)
                                }
                                Case (0x06)
                                {
                                    Local1 = ((\_SB.PCI0.GPCB () + ((SB19 + One) * 0x00100000)) + 
                                        0x00020000)
                                }
                                Case (0x07)
                                {
                                    Local1 = (\_SB.PCI0.GPCB () + ((SB19 + 0x02) * 0x00100000))
                                }
                                Case (0x08)
                                {
                                    Local1 = ((((SB20 & 0xFFFC) << 0x10) & 0xFFF00000) + 
                                        0x00039854)
                                }

                            }

                            Return (Local1)
                        }

                        OperationRegion (RSTR, SystemMemory, MMBA (0x08), 0x0100)
                        Field (RSTR, DWordAcc, NoLock, Preserve)
                        {
                            CIOR,   32, 
                            Offset (0xB8), 
                            ISTA,   32, 
                            Offset (0xF0), 
                            ICME,   32
                        }

                        OperationRegion (RPSM, SystemMemory, MMBA (One), 0x54)
                        Field (RPSM, DWordAcc, NoLock, Preserve)
                        {
                            RPVD,   32, 
                            RPR4,   8, 
                            Offset (0x18), 
                            RP18,   8, 
                            RP19,   8, 
                            RP1A,   8, 
                            Offset (0x1C), 
                            RP1C,   16, 
                            Offset (0x20), 
                            R_20,   32, 
                            R_24,   32, 
                            R_28,   32, 
                            R_2C,   32, 
                            Offset (0x52), 
                                ,   11, 
                            RPLT,   1, 
                            Offset (0x54)
                        }

                        OperationRegion (UPSM, SystemMemory, MMBA (0x02), 0x0550)
                        Field (UPSM, DWordAcc, NoLock, Preserve)
                        {
                            UPVD,   32, 
                            UP04,   8, 
                            Offset (0x08), 
                            CLRD,   32, 
                            Offset (0x18), 
                            UP18,   8, 
                            UP19,   8, 
                            UP1A,   8, 
                            Offset (0x1C), 
                            UP1C,   16, 
                            Offset (0x20), 
                            UP20,   32, 
                            UP24,   32, 
                            UP28,   32, 
                            UP2C,   32, 
                            Offset (0xD2), 
                                ,   11, 
                            UPLT,   1, 
                            Offset (0xD4), 
                            Offset (0x544), 
                            UPMB,   1, 
                            Offset (0x548), 
                            T2PR,   32, 
                            P2TR,   32
                        }

                        OperationRegion (DNSM, SystemMemory, MMBA (0x03), 0xD4)
                        Field (DNSM, DWordAcc, NoLock, Preserve)
                        {
                            DPVD,   32, 
                            DP04,   8, 
                            Offset (0x18), 
                            DP18,   8, 
                            DP19,   8, 
                            DP1A,   8, 
                            Offset (0x1C), 
                            DP1C,   16, 
                            Offset (0x20), 
                            DP20,   32, 
                            DP24,   32, 
                            DP28,   32, 
                            DP2C,   32, 
                            Offset (0xD2), 
                                ,   11, 
                            DPLT,   1, 
                            Offset (0xD4)
                        }

                        OperationRegion (DS3M, SystemMemory, MMBA (0x04), 0x40)
                        Field (DS3M, DWordAcc, NoLock, Preserve)
                        {
                            D3VD,   32, 
                            D304,   8, 
                            Offset (0x18), 
                            D318,   8, 
                            D319,   8, 
                            D31A,   8, 
                            Offset (0x1C), 
                            D31C,   16, 
                            Offset (0x20), 
                            D320,   32, 
                            D324,   32, 
                            D328,   32, 
                            D32C,   32
                        }

                        OperationRegion (DS4M, SystemMemory, MMBA (0x05), 0x0568)
                        Field (DS4M, DWordAcc, NoLock, Preserve)
                        {
                            D4VD,   32, 
                            D404,   8, 
                            Offset (0x18), 
                            D418,   8, 
                            D419,   8, 
                            D41A,   8, 
                            Offset (0x1C), 
                            D41C,   16, 
                            Offset (0x20), 
                            D420,   32, 
                            D424,   32, 
                            D428,   32, 
                            D42C,   32, 
                            Offset (0x564), 
                            DVES,   32
                        }

                        OperationRegion (DS5M, SystemMemory, MMBA (0x06), 0x40)
                        Field (DS5M, DWordAcc, NoLock, Preserve)
                        {
                            D5VD,   32, 
                            D504,   8, 
                            Offset (0x18), 
                            D518,   8, 
                            D519,   8, 
                            D51A,   8, 
                            Offset (0x1C), 
                            D51C,   16, 
                            Offset (0x20), 
                            D520,   32, 
                            D524,   32, 
                            D528,   32, 
                            D52C,   32
                        }

                        OperationRegion (NHIM, SystemMemory, MMBA (0x07), 0x40)
                        Field (NHIM, DWordAcc, NoLock, Preserve)
                        {
                            NH00,   32, 
                            NH04,   8, 
                            Offset (0x10), 
                            NH10,   32, 
                            NH14,   32
                        }

                        Method (_INI, 0, NotSerialized)  // _INI: Initialize
                        {
                            Acquire (TCFG, 0xFFFF)
                            R020 = R_20 /* \_SB_.PCI0.RP09.R_20 */
                            R024 = R_24 /* \_SB_.PCI0.RP09.R_24 */
                            R118 = RP19 /* \_SB_.PCI0.RP09.RP19 */
                            R119 = (RP19 + One)
                            R11A = RP1A /* \_SB_.PCI0.RP09.RP1A */
                            R11C = RP1C /* \_SB_.PCI0.RP09.RP1C */
                            R120 = R_20 /* \_SB_.PCI0.RP09.R_20 */
                            R124 = R_24 /* \_SB_.PCI0.RP09.R_24 */
                            R218 = R119 /* \_SB_.PCI0.RP09.R119 */
                            R219 = (R119 + One)
                            R21A = R11A /* \_SB_.PCI0.RP09.R11A */
                            R21C = R11C /* \_SB_.PCI0.RP09.R11C */
                            R220 = R120 /* \_SB_.PCI0.RP09.R120 */
                            R224 = R124 /* \_SB_.PCI0.RP09.R124 */
                            R318 = R119 /* \_SB_.PCI0.RP09.R119 */
                            R319 = (R119 + 0x02)
                            R31A = (R119 + 0x02)
                            R31C = Zero
                            R320 = Zero
                            R324 = Zero
                            R418 = R119 /* \_SB_.PCI0.RP09.R119 */
                            R419 = (R119 + 0x03)
                            R41A = (R119 + 0x03)
                            R41C = Zero
                            R420 = Zero
                            R424 = Zero
                            RVES = Zero
                            R518 = R119 /* \_SB_.PCI0.RP09.R119 */
                            R519 = (R119 + 0x04)
                            R51A = (R119 + 0x04)
                            R51C = Zero
                            R520 = Zero
                            R524 = Zero
                            R618 = Zero
                            R619 = Zero
                            R61A = Zero
                            R61C = Zero
                            R620 = Zero
                            R624 = Zero
                            RH10 = ((R220 & 0xFFFC) << 0x10)
                            RH14 = Zero
                            Sleep (One)
                            ICMS ()
                            Release (TCFG)
                        }

                        Method (ICMS, 0, NotSerialized)
                        {
                            \_SB.PCI0.RP09.POC0 = One
                            If ((\_SB.PCI0.RP09.ICME != 0x800001A3))
                            {
                                If (\_SB.PCI0.RP09.CNHI ())
                                {
                                    If ((\_SB.PCI0.RP09.ICME != 0xFFFFFFFF))
                                    {
                                        \_SB.PCI0.RP09.WTLT ()
                                        \_SB.PCI0.RP09.ICME |= 0x06
                                        Local0 = 0x03E8
                                        While (((Local0 = (\_SB.PCI0.RP09.ICME & 0x80000000)) == Zero))
                                        {
                                            Local0--
                                            If ((Local0 == Zero))
                                            {
                                                Break
                                            }

                                            Sleep (One)
                                        }

                                        Sleep (0x03E8)
                                    }
                                }
                            }

                            \_SB.PCI0.RP09.POC0 = Zero
                        }

                        Method (CNHI, 0, Serialized)
                        {
                            Local0 = 0x0A
                            While (Local0)
                            {
                                R_20 = R020 /* \_SB_.PCI0.RP09.R020 */
                                R_24 = R024 /* \_SB_.PCI0.RP09.R024 */
                                R_28 = R028 /* \_SB_.PCI0.RP09.R028 */
                                R_2C = R02C /* \_SB_.PCI0.RP09.R02C */
                                RPR4 = 0x07
                                If ((R020 == R_20))
                                {
                                    Break
                                }

                                Sleep (One)
                                Local0--
                            }

                            If ((R020 != R_20))
                            {
                                Return (Zero)
                            }

                            Local0 = 0x0A
                            While (Local0)
                            {
                                UP18 = R118 /* \_SB_.PCI0.RP09.R118 */
                                UP19 = R119 /* \_SB_.PCI0.RP09.R119 */
                                UP1A = R11A /* \_SB_.PCI0.RP09.R11A */
                                UP1C = R11C /* \_SB_.PCI0.RP09.R11C */
                                UP20 = R120 /* \_SB_.PCI0.RP09.R120 */
                                UP24 = R124 /* \_SB_.PCI0.RP09.R124 */
                                UP28 = R128 /* \_SB_.PCI0.RP09.R128 */
                                UP2C = R12C /* \_SB_.PCI0.RP09.R12C */
                                UP04 = 0x07
                                If ((R119 == UP19))
                                {
                                    Break
                                }

                                Sleep (One)
                                Local0--
                            }

                            If ((R119 != UP19))
                            {
                                Return (Zero)
                            }

                            If ((WTLT () == One)){}
                            Else
                            {
                                Return (Zero)
                            }

                            Local0 = 0x0A
                            While (Local0)
                            {
                                DP18 = R218 /* \_SB_.PCI0.RP09.R218 */
                                DP19 = R219 /* \_SB_.PCI0.RP09.R219 */
                                DP1A = R21A /* \_SB_.PCI0.RP09.R21A */
                                DP1C = R21C /* \_SB_.PCI0.RP09.R21C */
                                DP20 = R220 /* \_SB_.PCI0.RP09.R220 */
                                DP24 = R224 /* \_SB_.PCI0.RP09.R224 */
                                DP28 = R228 /* \_SB_.PCI0.RP09.R228 */
                                DP2C = R22C /* \_SB_.PCI0.RP09.R22C */
                                DP04 = 0x07
                                D318 = R318 /* \_SB_.PCI0.RP09.R318 */
                                D319 = R319 /* \_SB_.PCI0.RP09.R319 */
                                D31A = R31A /* \_SB_.PCI0.RP09.R31A */
                                D31C = R31C /* \_SB_.PCI0.RP09.R31C */
                                D320 = R320 /* \_SB_.PCI0.RP09.R320 */
                                D324 = R324 /* \_SB_.PCI0.RP09.R324 */
                                D328 = R328 /* \_SB_.PCI0.RP09.R328 */
                                D32C = R32C /* \_SB_.PCI0.RP09.R32C */
                                D304 = 0x07
                                D418 = R418 /* \_SB_.PCI0.RP09.R418 */
                                D419 = R419 /* \_SB_.PCI0.RP09.R419 */
                                D41A = R41A /* \_SB_.PCI0.RP09.R41A */
                                D41C = R41C /* \_SB_.PCI0.RP09.R41C */
                                D420 = R420 /* \_SB_.PCI0.RP09.R420 */
                                D424 = R424 /* \_SB_.PCI0.RP09.R424 */
                                D428 = R428 /* \_SB_.PCI0.RP09.R428 */
                                D42C = R42C /* \_SB_.PCI0.RP09.R42C */
                                DVES = RVES /* \_SB_.PCI0.RP09.RVES */
                                D404 = 0x07
                                D518 = R518 /* \_SB_.PCI0.RP09.R518 */
                                D519 = R519 /* \_SB_.PCI0.RP09.R519 */
                                D51A = R51A /* \_SB_.PCI0.RP09.R51A */
                                D51C = R51C /* \_SB_.PCI0.RP09.R51C */
                                D520 = R520 /* \_SB_.PCI0.RP09.R520 */
                                D524 = R524 /* \_SB_.PCI0.RP09.R524 */
                                D528 = R528 /* \_SB_.PCI0.RP09.R528 */
                                D52C = R52C /* \_SB_.PCI0.RP09.R52C */
                                D504 = 0x07
                                If ((R219 == DP19))
                                {
                                    Break
                                }

                                Sleep (One)
                                Local0--
                            }

                            If ((R219 != DP19))
                            {
                                Return (Zero)
                            }

                            If ((WTDL () != One))
                            {
                                Return (Zero)
                            }

                            Local0 = 0x64
                            While (Local0)
                            {
                                NH10 = RH10 /* \_SB_.PCI0.RP09.RH10 */
                                NH14 = RH14 /* \_SB_.PCI0.RP09.RH14 */
                                NH04 = 0x07
                                If ((RH10 == NH10))
                                {
                                    Break
                                }
                                Else
                                {
                                }

                                Sleep (One)
                                Local0--
                            }

                            If ((RH10 != NH10))
                            {
                                Return (Zero)
                            }

                            Return (One)
                        }

                        Method (UPCK, 0, Serialized)
                        {
                            If (((UPVD & 0xFF00FFFF) == 0x15008086))
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (ULTC, 0, Serialized)
                        {
                            If ((RPLT == Zero))
                            {
                                If ((UPLT == Zero))
                                {
                                    Return (One)
                                }
                            }

                            Return (Zero)
                        }

                        Method (WTLT, 0, Serialized)
                        {
                            Local0 = 0x07D0
                            Local1 = Zero
                            While (Local0)
                            {
                                If ((RPR4 == 0x07))
                                {
                                    If (ULTC ())
                                    {
                                        If (UPCK ())
                                        {
                                            Local1 = One
                                            Break
                                        }
                                    }
                                }

                                Sleep (One)
                                Local0--
                            }

                            Return (Local1)
                        }

                        Method (DLTC, 0, Serialized)
                        {
                            If ((RPLT == Zero))
                            {
                                If ((UPLT == Zero))
                                {
                                    If ((DPLT == Zero))
                                    {
                                        Return (One)
                                    }
                                }
                            }

                            Return (Zero)
                        }

                        Method (WTDL, 0, Serialized)
                        {
                            Local0 = 0x07D0
                            Local1 = Zero
                            While (Local0)
                            {
                                If ((RPR4 == 0x07))
                                {
                                    If (DLTC ())
                                    {
                                        If (UPCK ())
                                        {
                                            Local1 = One
                                            Break
                                        }
                                    }
                                }

                                Sleep (One)
                                Local0--
                            }

                            Return (Local1)
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }

                        Device (UPSB)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (0x0F)
                            }

                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
                            }

                            Method (AMPE, 0, Serialized)
                            {
                                Notify (\_SB.PCI0.RP09.UPSB.DSB0.NHI0, Zero) // Bus Check
                            }

                            Method (UMPE, 0, Serialized)
                            {
                                Notify (\_SB.PCI0.RP09.UPSB.DSB2.XHC2, Zero) // Bus Check
                            }

                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
                                {
                                    Local0 = Package (0x0A)
                                        {
                                            "AAPL,slot-name", 
                                            Buffer (0x0C)
                                            {
                                                "Thunderbolt"
                                            }, 

                                            "built-in", 
                                            Buffer (One)
                                            {
                                                 0x00
                                            }, 

                                            "model", 
                                            Buffer (0x41)
                                            {
                                                "Intel JHL6240 Alpine Ridge Thunderbolt 3 UPSB Bridge (Low Power)"
                                            }, 

                                            "device_type", 
                                            Buffer (0x0B)
                                            {
                                                "PCI Bridge"
                                            }, 

                                            "PCI-Thunderbolt", 
                                            One
                                        }
                                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                    Return (Local0)
                                }

                                Return (Zero)
                            }

                            Device (DSB0)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
                                    {
                                        Local0 = Package (0x0A)
                                            {
                                                "AAPL,slot-name", 
                                                Buffer (0x0C)
                                                {
                                                    "Thunderbolt"
                                                }, 

                                                "built-in", 
                                                Buffer (One)
                                                {
                                                     0x00
                                                }, 

                                                "model", 
                                                Buffer (0x41)
                                                {
                                                    "Intel JHL6240 Alpine Ridge Thunderbolt 3 DSB0 Bridge (Low Power)"
                                                }, 

                                                "device_type", 
                                                Buffer (0x0B)
                                                {
                                                    "PCI Bridge"
                                                }, 

                                                "PCIHotplugCapable", 
                                                Zero
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }

                                    Return (Zero)
                                }

                                Device (NHI0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }

                                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                    {
                                        Local0 = Package (0x19)
                                            {
                                                "AAPL,slot-name", 
                                                Buffer (0x0C)
                                                {
                                                    "Thunderbolt"
                                                }, 

                                                "name", 
                                                Buffer (0x24)
                                                {
                                                    "Alpine Ridge Thunderbolt Controller"
                                                }, 

                                                "model", 
                                                Buffer (0x3A)
                                                {
                                                    "Intel JHL6240 Alpine Ridge Thunderbolt 3 NHI0 (Low Power)"
                                                }, 

                                                "device_type", 
                                                Buffer (0x12)
                                                {
                                                    "System Peripheral"
                                                }, 

                                                "ThunderboltDROM", 
                                                Buffer (0x48)
                                                {
                                                    0xB8, 0x00, 0x32, 0x9D, 0xC8, 0xBC, 0x5A, 0x4E,
                                                    0x00, 0xB1, 0x13, 0x83, 0x2D, 0x01, 0x3B, 0x00,
                                                    0x09, 0x01, 0x07, 0x17, 0x02, 0x14, 0x08, 0x81,
                                                    0x80, 0x02, 0x80, 0x00, 0x00, 0x00, 0x08, 0x82,
                                                    0x80, 0x02, 0x80, 0x00, 0x00, 0x00, 0x02, 0x83,
                                                    0x0B, 0x84, 0x20, 0x01, 0x00, 0x3C, 0x00, 0x00,
                                                    0x00, 0x00, 0x00, 0x05, 0x85, 0x50, 0x00, 0x00,
                                                    0x09, 0x01, 0x4C, 0x65, 0x6E, 0x6F, 0x76, 0x6F,
                                                    0x00, 0x07, 0x02, 0x54, 0x34, 0x38, 0x30, 0x00 
                                                }, 

                                                "ThunderboltConfig", 
                                                Buffer (0x20)
                                                {
                                                    0x00, 0x02, 0x1C, 0x00, 0x02, 0x00, 0x05, 0x03,
                                                    0x01, 0x00, 0x04, 0x00, 0x05, 0x03, 0x02, 0x00,
                                                    0x03, 0x00, 0x05, 0x03, 0x01, 0x00, 0x00, 0x00,
                                                    0x03, 0x03, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00 
                                                }, 

                                                "pathcr", 
                                                Buffer (0x50)
                                                {
                                                    0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                                    0x00, 0x00, 0x07, 0x00, 0x10, 0x00, 0x10, 0x00,
                                                    0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                                    0x00, 0x00, 0x07, 0x00, 0x10, 0x00, 0x10, 0x00,
                                                    0x01, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x0E, 0x00,
                                                    0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                                    0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                                    0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x01, 0x00,
                                                    0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                                    0x00, 0x00, 0x07, 0x00, 0x02, 0x00, 0x01, 0x00 
                                                }, 

                                                "linkDetails", 
                                                Buffer (0x08)
                                                {
                                                     0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                                                }, 

                                                "TBTFlags", 
                                                Buffer (0x04)
                                                {
                                                     0x03, 0x00, 0x00, 0x00
                                                }, 

                                                "sscOffset", 
                                                Buffer (0x02)
                                                {
                                                     0x00, 0x07
                                                }, 

                                                "TBTDPLowToHigh", 
                                                Buffer (0x04)
                                                {
                                                     0x01, 0x00, 0x00, 0x00
                                                }, 

                                                "power-save", 
                                                One, 
                                                Buffer (One)
                                                {
                                                     0x00
                                                }
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }
                                }
                            }

                            Device (DSB1)
                            {
                                Name (_ADR, 0x00010000)  // _ADR: Address
                                Name (_SUN, One)  // _SUN: Slot User Number
                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    Local0 = Package (0x06)
                                        {
                                            "AAPL,slot-name", 
                                            Buffer (0x0C)
                                            {
                                                "Thunderbolt"
                                            }, 

                                            "model", 
                                            Buffer (0x41)
                                            {
                                                "Intel JHL6240 Alpine Ridge Thunderbolt 3 DSB1 Bridge (Low Power)"
                                            }, 

                                            "device_type", 
                                            Buffer (0x0B)
                                            {
                                                "PCI Bridge"
                                            }
                                        }
                                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                    Return (Local0)
                                }

                                Device (UPS0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (One)
                                    }
                                }
                            }

                            Device (DSB2)
                            {
                                Name (_ADR, 0x00020000)  // _ADR: Address
                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
                                    {
                                        Local0 = Package (0x08)
                                            {
                                                "AAPL,slot-name", 
                                                Buffer (0x0C)
                                                {
                                                    "Thunderbolt"
                                                }, 

                                                "model", 
                                                Buffer (0x41)
                                                {
                                                    "Intel JHL6240 Alpine Ridge Thunderbolt 3 DSB2 Bridge (Low Power)"
                                                }, 

                                                "device_type", 
                                                Buffer (0x0B)
                                                {
                                                    "PCI Bridge"
                                                }, 

                                                "PCIHotplugCapable", 
                                                Zero
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }

                                    Return (Zero)
                                }

                                Device (XHC2)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                    {
                                        Return (Package (0x02)
                                        {
                                            0x69, 
                                            0x03
                                        })
                                    }

                                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                    {
                                        Local0 = Package (0x10)
                                            {
                                                "AAPL,slot-name", 
                                                Buffer (0x0C)
                                                {
                                                    "Thunderbolt"
                                                }, 

                                                "built-in", 
                                                Buffer (One)
                                                {
                                                     0x00                                             // .
                                                }, 

                                                "name", 
                                                Buffer (0x20)
                                                {
                                                    "Alpine Ridge USB 3.1 Controller"
                                                }, 

                                                "model", 
                                                Buffer (0x47)
                                                {
                                                    "Intel JHL6240 Alpine Ridge Thunderbolt 3 Type C Controller (Low Power)"
                                                }, 

                                                "device_type", 
                                                Buffer (0x0F)
                                                {
                                                    "USB controller"
                                                }, 

                                                "USBBusNumber", 
                                                Zero, 
                                                "UsbCompanionControllerPresent", 
                                                One, 
                                                "AAPL,XHC-clock-id", 
                                                One
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }

                                    Name (HS, Package (0x01)
                                    {
                                        "XHC2"
                                    })
                                    Name (FS, Package (0x01)
                                    {
                                        "XHC2"
                                    })
                                    Name (LS, Package (0x01)
                                    {
                                        "XHC2"
                                    })
                                    Device (RHUB)
                                    {
                                        Name (_ADR, Zero)  // _ADR: Address
                                        Device (HS01)
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
                                            Name (SSP, Package (0x02)
                                            {
                                                "XHC2", 
                                                0x03
                                            })
                                            Name (SS, Package (0x02)
                                            {
                                                "XHC2", 
                                                0x03
                                            })
                                        }

                                        Device (SSP1)
                                        {
                                            Name (_ADR, 0x03)  // _ADR: Address
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
                                            Name (FS, Package (0x02)
                                            {
                                                "XHC2", 
                                                One
                                            })
                                            Name (LS, Package (0x02)
                                            {
                                                "XHC2", 
                                                One
                                            })
                                            Name (HS, Package (0x02)
                                            {
                                                "XHC2", 
                                                One
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

                                                Return (Package (0x04)
                                                {
                                                    "UsbCPortNumber", 
                                                    One, 
                                                    "UsbCompanionPortPresent", 
                                                    One
                                                })
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Method (DTGP, 5, NotSerialized)
        {
            If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
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
    }
}

