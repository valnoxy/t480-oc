DefinitionBlock ("", "SSDT", 2, "T480", "BATX", 0x00009000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.BAT0._HID, IntObj)
    External (_SB_.PCI0.LPCB.EC__.BAT0._STA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.BAT1._HID, IntObj)
    External (_SB_.PCI0.LPCB.EC__.BAT1._STA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.HIID, FieldUnitObj)

    Scope (\_SB.PCI0.LPCB.EC)
    {
        OperationRegion (BRAM, EmbeddedControl, Zero, 0x0100)
        Device (BATX)
        {
            Name (BDBG, Zero)
            Name (BBIS, One)
            Name (BDQP, Zero)
            Mutex (BAXM, 0x00)
            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0x38), 
                HB0S,   7, 
                HB0A,   1, 
                HB1S,   7, 
                HB1A,   1
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                RC00,   8, 
                RC01,   8, 
                FC00,   8, 
                FC01,   8, 
                AE00,   8, 
                AE01,   8, 
                RS00,   8, 
                RS01,   8, 
                AC00,   8, 
                AC01,   8, 
                VO00,   8, 
                VO01,   8, 
                AF00,   8, 
                AF01,   8, 
                BS00,   8, 
                BS01,   8
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                BM00,   8, 
                BM01,   8, 
                MD00,   8, 
                MD01,   8, 
                CC00,   8, 
                CC01,   8
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                DC00,   8, 
                DC01,   8, 
                DV00,   8, 
                DV01,   8, 
                OM00,   8, 
                OM01,   8, 
                SI00,   8, 
                SI01,   8, 
                DT00,   8, 
                DT01,   8, 
                SN00,   8, 
                SN01,   8
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                CH00,   8, 
                CH01,   8, 
                CH02,   8, 
                CH03,   8
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                MN00,   8, 
                MN01,   8, 
                MN02,   8, 
                MN03,   8, 
                MN04,   8, 
                MN05,   8, 
                MN06,   8, 
                MN07,   8, 
                MN08,   8, 
                MN09,   8, 
                MN0A,   8, 
                MN0B,   8, 
                MN0C,   8, 
                MN0D,   8, 
                MN0E,   8, 
                MN0F,   8
            }

            Field (BRAM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                DN00,   8, 
                DN01,   8, 
                DN02,   8, 
                DN03,   8, 
                DN04,   8, 
                DN05,   8, 
                DN06,   8, 
                DN07,   8, 
                DN08,   8, 
                DN09,   8, 
                DN0A,   8, 
                DN0B,   8, 
                DN0C,   8, 
                DN0D,   8, 
                DN0E,   8, 
                DN0F,   8
            }

            Method (SBRC, 0, NotSerialized)
            {
                Return (B1B2 (RC00, RC01))
            }

            Method (SBFC, 0, NotSerialized)
            {
                Return (B1B2 (FC00, FC01))
            }

            Method (SBAE, 0, NotSerialized)
            {
                Return (B1B2 (AE00, AE01))
            }

            Method (SBRS, 0, NotSerialized)
            {
                Return (B1B2 (RS00, RS01))
            }

            Method (SBAC, 0, NotSerialized)
            {
                Return (B1B2 (AC00, AC01))
            }

            Method (SBVO, 0, NotSerialized)
            {
                Return (B1B2 (VO00, VO01))
            }

            Method (SBAF, 0, NotSerialized)
            {
                Return (B1B2 (AF00, AF01))
            }

            Method (SBBS, 0, NotSerialized)
            {
                Return (B1B2 (BS00, BS01))
            }

            Method (SBBM, 0, NotSerialized)
            {
                Return (B1B2 (BM00, BM01))
            }

            Method (SBMD, 0, NotSerialized)
            {
                Return (B1B2 (MD00, MD01))
            }

            Method (SBCC, 0, NotSerialized)
            {
                Return (B1B2 (CC00, CC01))
            }

            Method (SBDC, 0, NotSerialized)
            {
                Return (B1B2 (DC00, DC01))
            }

            Method (SBDV, 0, NotSerialized)
            {
                Return (B1B2 (DV00, DV01))
            }

            Method (SBOM, 0, NotSerialized)
            {
                Return (B1B2 (OM00, OM01))
            }

            Method (SBSI, 0, NotSerialized)
            {
                Return (B1B2 (SI00, SI01))
            }

            Method (SBDT, 0, NotSerialized)
            {
                Return (B1B2 (DT00, DT01))
            }

            Method (SBSN, 0, NotSerialized)
            {
                Return (ToDecimalString (B1B2 (SN00, SN01)))
            }

            Method (SBCH, 0, NotSerialized)
            {
                Return (ToString (B1B4 (CH00, CH01, CH02, CH03), Ones))
            }

            Method (SBMN, 0, NotSerialized)
            {
                Local0 = Buffer (0x10){}
                Local0 [Zero] = MN00 /* \_SB_.PCI0.LPCB.EC__.BATX.MN00 */
                Local0 [One] = MN01 /* \_SB_.PCI0.LPCB.EC__.BATX.MN01 */
                Local0 [0x02] = MN02 /* \_SB_.PCI0.LPCB.EC__.BATX.MN02 */
                Local0 [0x03] = MN03 /* \_SB_.PCI0.LPCB.EC__.BATX.MN03 */
                Local0 [0x04] = MN04 /* \_SB_.PCI0.LPCB.EC__.BATX.MN04 */
                Local0 [0x05] = MN05 /* \_SB_.PCI0.LPCB.EC__.BATX.MN05 */
                Local0 [0x06] = MN06 /* \_SB_.PCI0.LPCB.EC__.BATX.MN06 */
                Local0 [0x07] = MN07 /* \_SB_.PCI0.LPCB.EC__.BATX.MN07 */
                Local0 [0x08] = MN08 /* \_SB_.PCI0.LPCB.EC__.BATX.MN08 */
                Local0 [0x09] = MN09 /* \_SB_.PCI0.LPCB.EC__.BATX.MN09 */
                Local0 [0x0A] = MN0A /* \_SB_.PCI0.LPCB.EC__.BATX.MN0A */
                Local0 [0x0B] = MN0B /* \_SB_.PCI0.LPCB.EC__.BATX.MN0B */
                Local0 [0x0C] = MN0C /* \_SB_.PCI0.LPCB.EC__.BATX.MN0C */
                Local0 [0x0D] = MN0D /* \_SB_.PCI0.LPCB.EC__.BATX.MN0D */
                Local0 [0x0E] = MN0E /* \_SB_.PCI0.LPCB.EC__.BATX.MN0E */
                Local0 [0x0F] = MN0F /* \_SB_.PCI0.LPCB.EC__.BATX.MN0F */
                Return (ToString (Local0, Ones))
            }

            Method (SBDN, 0, NotSerialized)
            {
                Local0 = Buffer (0x10){}
                Local0 [Zero] = DN00 /* \_SB_.PCI0.LPCB.EC__.BATX.DN00 */
                Local0 [One] = DN01 /* \_SB_.PCI0.LPCB.EC__.BATX.DN01 */
                Local0 [0x02] = DN02 /* \_SB_.PCI0.LPCB.EC__.BATX.DN02 */
                Local0 [0x03] = DN03 /* \_SB_.PCI0.LPCB.EC__.BATX.DN03 */
                Local0 [0x04] = DN04 /* \_SB_.PCI0.LPCB.EC__.BATX.DN04 */
                Local0 [0x05] = DN05 /* \_SB_.PCI0.LPCB.EC__.BATX.DN05 */
                Local0 [0x06] = DN06 /* \_SB_.PCI0.LPCB.EC__.BATX.DN06 */
                Local0 [0x07] = DN07 /* \_SB_.PCI0.LPCB.EC__.BATX.DN07 */
                Local0 [0x08] = DN08 /* \_SB_.PCI0.LPCB.EC__.BATX.DN08 */
                Local0 [0x09] = DN09 /* \_SB_.PCI0.LPCB.EC__.BATX.DN09 */
                Local0 [0x0A] = DN0A /* \_SB_.PCI0.LPCB.EC__.BATX.DN0A */
                Local0 [0x0B] = DN0B /* \_SB_.PCI0.LPCB.EC__.BATX.DN0B */
                Local0 [0x0C] = DN0C /* \_SB_.PCI0.LPCB.EC__.BATX.DN0C */
                Local0 [0x0D] = DN0D /* \_SB_.PCI0.LPCB.EC__.BATX.DN0D */
                Local0 [0x0E] = DN0E /* \_SB_.PCI0.LPCB.EC__.BATX.DN0E */
                Local0 [0x0F] = DN0F /* \_SB_.PCI0.LPCB.EC__.BATX.DN0F */
                Return (ToString (Local0, Ones))
            }

            Method (B1B2, 2, NotSerialized)
            {
                Return ((Arg0 | (Arg1 << 0x08)))
            }

            Method (B1B4, 4, NotSerialized)
            {
                Local0 = (Arg2 | (Arg3 << 0x08))
                Local0 = (Arg1 | (Local0 << 0x08))
                Local0 = (Arg0 | (Local0 << 0x08))
                Return (Local0)
            }

            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    If ((CondRefOf (^^BAT1._STA) && CondRefOf (^^BAT1._STA)))
                    {
                        Return ((^^BAT0._STA () | ^^BAT1._STA ()))
                    }

                    If (CondRefOf (^^BAT1._STA))
                    {
                        Return (^^BAT1._STA ())
                    }

                    Return (^^BAT0._STA ())
                }

                Return (Zero)
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (_OSI ("Darwin"))
                {
                    If (CondRefOf (^^BAT0._HID))
                    {
                        ^^BAT0._HID = Zero
                    }

                    If (CondRefOf (^^BAT1._HID))
                    {
                        ^^BAT1._HID = Zero
                    }
                }
            }

            Name (PBIX, Package (0x15)
            {
                One, 
                One, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                One, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x00017318, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x03E8, 
                0x01F4, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                "", 
                "", 
                "", 
                "", 
                Zero
            })
            Name (BX0I, Package (0x15){})
            Name (BX1I, Package (0x15){})
            Method (GBIX, 2, NotSerialized)
            {
                If ((Arg0 == 0x10))
                {
                    Local4 = HB1S /* \_SB_.PCI0.LPCB.EC__.BATX.HB1S */
                    Local5 = HB1A /* \_SB_.PCI0.LPCB.EC__.BATX.HB1A */
                }
                Else
                {
                    Local4 = HB0S /* \_SB_.PCI0.LPCB.EC__.BATX.HB0S */
                    Local5 = HB0A /* \_SB_.PCI0.LPCB.EC__.BATX.HB0A */
                }

                Local6 = 0x0A
                Local7 = Zero
                While ((!Local7 && Local6))
                {
                    If (Local5)
                    {
                        If (((Local4 & 0x07) == 0x07))
                        {
                            Sleep (0x03E8)
                            Local6--
                        }
                        Else
                        {
                            Local7 = One
                        }
                    }
                    Else
                    {
                        Local6 = Zero
                    }
                }

                If ((Local7 != One))
                {
                    Debug = "BATX:GBIX: !!!WARNING: Could not get battery-data in time. Giving up for now. - WARNING!!!"
                    Arg1 [0x02] = 0xFFFFFFFF
                    Arg1 [0x03] = 0xFFFFFFFF
                    Arg1 [0x06] = Zero
                    Arg1 [0x07] = Zero
                    Return (Arg1)
                }

                If (Acquire (BAXM, 0xFFFF))
                {
                    Debug = "BATX:AcquireLock failed in GBIX"
                    Return (Arg1)
                }

                HIID = (Arg0 | One)
                Arg1 [0x08] = SBCC ()
                Local7 = SBBM ()
                Local7 >>= 0x0F
                Arg1 [One] = (Local7 ^ One)
                HIID = Arg0
                If (Local7)
                {
                    Local1 = (SBFC () * 0x0A)
                }
                Else
                {
                    Local1 = SBFC ()
                }

                Arg1 [0x03] = Local1
                HIID = (Arg0 | 0x02)
                If (Local7)
                {
                    Local0 = (SBDC () * 0x0A)
                }
                Else
                {
                    Local0 = SBDC ()
                }

                Arg1 [0x02] = Local0
                Arg1 [0x06] = ((Local0 / 0x64) * 0x0A)
                Arg1 [0x07] = ((Local0 / 0x64) * 0x05)
                Arg1 [0x05] = SBDV ()
                Arg1 [0x11] = SBSN ()
                HIID = (Arg0 | 0x06)
                Arg1 [0x10] = SBDN ()
                HIID = (Arg0 | 0x04)
                Arg1 [0x12] = SBCH ()
                HIID = (Arg0 | 0x05)
                Arg1 [0x13] = SBMN ()
                Release (BAXM)
                Return (Arg1)
            }

            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                If ((BDBG == One))
                {
                    Debug = "BATX:_BIX"
                }

                BX0I = GBIX (Zero, PBIX)
                If ((HB0A && (BDBG == One)))
                {
                    Concatenate ("BATX:BIXPowerUnit: BAT0 ", BX0I [One], Debug)
                    Concatenate ("BATX:BIXDesignCapacity: BAT0 ", ToDecimalString (DerefOf (BX0I [0x02])), Debug)
                    Concatenate ("BATX:BIXLastFullChargeCapacity: BAT0 ", ToDecimalString (DerefOf (BX0I [0x03])), Debug)
                    Concatenate ("BATX:BIXBatteryTechnology: BAT0 ", ToDecimalString (DerefOf (BX0I [0x04])), Debug)
                    Concatenate ("BATX:BIXDesignVoltage: BAT0 ", ToDecimalString (DerefOf (BX0I [0x05])), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfWarning: BAT0 ", ToDecimalString (DerefOf (BX0I [0x06])), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfLow: BAT0 ", ToDecimalString (DerefOf (BX0I [0x07])), Debug)
                    Concatenate ("BATX:BIXCycleCount: BAT0 ", ToDecimalString (DerefOf (BX0I [0x08])), Debug)
                    Concatenate ("BATX:BIXModelNumber: BAT0 ", DerefOf (BX0I [0x10]), Debug)
                    Concatenate ("BATX:BIXSerialNumber: BAT0 ", DerefOf (BX0I [0x11]), Debug)
                    Concatenate ("BATX:BIXBatteryType: BAT0 ", DerefOf (BX0I [0x12]), Debug)
                    Concatenate ("BATX:BIXOEMInformation: BAT0 ", DerefOf (BX0I [0x13]), Debug)
                }

                If (!HB1A)
                {
                    Return (BX0I) /* \_SB_.PCI0.LPCB.EC__.BATX.BX0I */
                }

                BX1I = GBIX (0x10, PBIX)
                If ((BDBG == One))
                {
                    Concatenate ("BATX:BIXPowerUnit: BAT1 ", BX1I [One], Debug)
                    Concatenate ("BATX:BIXDesignCapacity: BAT1 ", ToDecimalString (DerefOf (BX1I [0x02])), Debug)
                    Concatenate ("BATX:BIXLastFullChargeCapacity: BAT1 ", ToDecimalString (DerefOf (BX1I [0x03])), Debug)
                    Concatenate ("BATX:BIXBatteryTechnology: BAT1 ", ToDecimalString (DerefOf (BX1I [0x04])), Debug)
                    Concatenate ("BATX:BIXDesignVoltage: BAT1 ", ToDecimalString (DerefOf (BX1I [0x05])), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfWarning: BAT1 ", ToDecimalString (DerefOf (BX1I [0x06])), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfLow: BAT1 ", ToDecimalString (DerefOf (BX1I [0x07])), Debug)
                    Concatenate ("BATX:BIXCycleCount: BAT1 ", ToDecimalString (DerefOf (BX1I [0x08])), Debug)
                    Concatenate ("BATX:BIXModelNumber: BAT1 ", DerefOf (BX1I [0x10]), Debug)
                    Concatenate ("BATX:BIXSerialNumber: BAT1 ", DerefOf (BX1I [0x11]), Debug)
                    Concatenate ("BATX:BIXBatteryType: BAT1 ", DerefOf (BX1I [0x12]), Debug)
                    Concatenate ("BATX:BIXOEMInformation: BAT1 ", DerefOf (BX1I [0x13]), Debug)
                }

                If (!HB0A)
                {
                    Return (BX1I) /* \_SB_.PCI0.LPCB.EC__.BATX.BX1I */
                }

                If ((DerefOf (BX0I [One]) != DerefOf (BX1I [One]
                    )))
                {
                    Debug = "BATX:BIXPowerUnit: !!!WARNING: PowerUnits differ between batteries. This case isn\'t handled in SSDT-BATX atm. Please report a bug - WARNING!!!"
                }

                Local0 = BX0I /* \_SB_.PCI0.LPCB.EC__.BATX.BX0I */
                Local0 [0x02] = (DerefOf (BX0I [0x02]) + DerefOf (
                    BX1I [0x02]))
                Local0 [0x03] = (DerefOf (BX0I [0x03]) + DerefOf (
                    BX1I [0x03]))
                Local0 [0x05] = ((DerefOf (BX0I [0x05]) + DerefOf (
                    BX1I [0x05])) / 0x02)
                Local0 [0x06] = (DerefOf (BX0I [0x06]) + DerefOf (
                    BX1I [0x06]))
                Local0 [0x07] = (DerefOf (BX0I [0x07]) + DerefOf (
                    BX1I [0x07]))
                Local0 [0x08] = ((DerefOf (BX0I [0x08]) + DerefOf (
                    BX1I [0x08])) / 0x02)
                Local0 [0x10] = Concatenate (Concatenate (DerefOf (BX0I [0x10]), 
                    " / "), DerefOf (BX1I [0x10]))
                Local0 [0x11] = Concatenate (Concatenate (DerefOf (BX0I [0x11]), 
                    " / "), DerefOf (BX1I [0x11]))
                Local0 [0x12] = Concatenate (Concatenate (DerefOf (BX0I [0x12]), 
                    " / "), DerefOf (BX1I [0x12]))
                Local0 [0x13] = Concatenate (Concatenate (DerefOf (BX0I [0x13]), 
                    " / "), DerefOf (BX1I [0x13]))
                If ((BDBG == One))
                {
                    Concatenate ("BATX:BIXPowerUnit: BATX ", Local0 [One], Debug)
                    Concatenate ("BATX:BIXDesignCapacity: BATX ", ToDecimalString (DerefOf (Local0 [0x02])), Debug)
                    Concatenate ("BATX:BIXLastFullChargeCapacity: BATX ", ToDecimalString (DerefOf (Local0 [0x03])), Debug)
                    Concatenate ("BATX:BIXBatteryTechnology: BATX ", ToDecimalString (DerefOf (Local0 [0x04])), Debug)
                    Concatenate ("BATX:BIXDesignVoltage: BATX ", ToDecimalString (DerefOf (Local0 [0x05])), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfWarning: BATX ", ToDecimalString (DerefOf (Local0 [0x06])), Debug)
                    Concatenate ("BATX:BIXDesignCapacityOfLow: BATX ", ToDecimalString (DerefOf (Local0 [0x07])), Debug)
                    Concatenate ("BATX:BIXCycleCount: BATX ", ToDecimalString (DerefOf (Local0 [0x08])), Debug)
                    Concatenate ("BATX:BIXModelNumber: BATX ", DerefOf (Local0 [0x10]), Debug)
                    Concatenate ("BATX:BIXSerialNumber: BATX ", DerefOf (Local0 [0x11]), Debug)
                    Concatenate ("BATX:BIXBatteryType: BATX ", DerefOf (Local0 [0x12]), Debug)
                    Concatenate ("BATX:BIXOEMInformation: BATX ", DerefOf (Local0 [0x13]), Debug)
                }

                Return (Local0)
            }

            Name (PBST, Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Name (BT0P, Package (0x04){})
            Name (BT1P, Package (0x04){})
            Method (GBST, 2, NotSerialized)
            {
                If (Acquire (BAXM, 0xFFFF))
                {
                    Debug = "BATX:AcquireLock failed in GBST"
                    Return (Arg1)
                }

                If ((Arg0 == Zero))
                {
                    Local6 = HB0S /* \_SB_.PCI0.LPCB.EC__.BATX.HB0S */
                }
                Else
                {
                    Local6 = HB1S /* \_SB_.PCI0.LPCB.EC__.BATX.HB1S */
                }

                If ((Local6 & 0x20))
                {
                    Local0 = 0x02
                }
                ElseIf ((Local6 & 0x40))
                {
                    Local0 = One
                }
                Else
                {
                    Local0 = Zero
                }

                HIID = (Arg0 | One)
                Local7 = SBBM ()
                Local7 >>= 0x0F
                HIID = Arg0
                Local2 = SBRC ()
                If (Local7)
                {
                    Local2 *= 0x0A
                }

                Local1 = SBAC ()
                If ((Local0 == One))
                {
                    If ((Local1 >= 0x8000))
                    {
                        Local1 = (0x00010000 - Local1)
                    }
                }
                Else
                {
                    Local1 = Zero
                }

                Local3 = SBVO ()
                If (Local7)
                {
                    Local1 = ((Local1 * Local3) / 0x03E8)
                }

                Arg1 [Zero] = Local0
                Arg1 [One] = Local1
                Arg1 [0x02] = Local2
                Arg1 [0x03] = Local3
                Release (BAXM)
                Return (Arg1)
            }

            Name (PBAI, Package (0x02)
            {
                0xFF, 
                0xFF
            })
            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                If ((BDBG == One))
                {
                    Debug = "BATX:_BST()"
                }

                Local3 = DerefOf (PBAI [Zero])
                Local4 = DerefOf (PBAI [One])
                If (((Local3 != HB0A) || (Local4 != HB1A)))
                {
                    PBAI [Zero] = HB0A /* \_SB_.PCI0.LPCB.EC__.BATX.HB0A */
                    PBAI [One] = HB1A /* \_SB_.PCI0.LPCB.EC__.BATX.HB1A */
                    If (((Local3 != 0xFF) || (Local4 != 0xFF)))
                    {
                        If ((BDBG == One))
                        {
                            Concatenate ("BATX:_BST() - PBAI:HB0A (old): ", Local3, Debug)
                            Concatenate ("BATX:_BST() - PBAI:HB1A (old): ", Local4, Debug)
                            Concatenate ("BATX:_BST() - PBAI:HB0A (new): ", HB0A, Debug)
                            Concatenate ("BATX:_BST() - PBAI:HB1A (new): ", HB1A, Debug)
                        }

                        Notify (BATX, 0x81) // Information Change
                    }
                }

                If (HB0A)
                {
                    BT0P = GBST (Zero, PBST)
                    If ((BDBG == One))
                    {
                        Concatenate ("BATX:BSTState: BAT0 (acpi) - ", HB0S, Debug)
                        Concatenate ("BATX:BSTState: BAT0 ", DerefOf (BT0P [Zero]), Debug)
                        Concatenate ("BATX:BSTPresentRate: BAT0 ", ToDecimalString (DerefOf (BT0P [One])), Debug)
                        Concatenate ("BATX:BSTRemainingCapacity: BAT0 ", ToDecimalString (DerefOf (BT0P [0x02])), Debug)
                        Concatenate ("BATX:BSTPresentVoltage: BAT0 ", ToDecimalString (DerefOf (BT0P [0x03])), Debug)
                    }

                    If (!HB1A)
                    {
                        Return (BT0P) /* \_SB_.PCI0.LPCB.EC__.BATX.BT0P */
                    }
                }

                BT1P = GBST (0x10, PBST)
                If ((BDBG == One))
                {
                    Concatenate ("BATX:BSTState: BAT1 (acpi) - ", HB1S, Debug)
                    Concatenate ("BATX:BSTState: BAT1 ", DerefOf (BT1P [Zero]), Debug)
                    Concatenate ("BATX:BSTPresentRate: BAT1 ", ToDecimalString (DerefOf (BT1P [One])), Debug)
                    Concatenate ("BATX:BSTRemainingCapacity: BAT1 ", ToDecimalString (DerefOf (BT1P [0x02])), Debug)
                    Concatenate ("BATX:BSTPresentVoltage: BAT1 ", ToDecimalString (DerefOf (BT1P [0x03])), Debug)
                }

                If (!HB0A)
                {
                    Return (BT1P) /* \_SB_.PCI0.LPCB.EC__.BATX.BT1P */
                }

                Local0 = BT0P /* \_SB_.PCI0.LPCB.EC__.BATX.BT0P */
                Local4 = DerefOf (BT0P [Zero])
                Local5 = DerefOf (BT1P [Zero])
                Local0 [Zero] = Zero
                If (((Local4 == 0x02) || (Local5 == 0x02)))
                {
                    Local0 [Zero] = 0x02
                }
                ElseIf (((Local4 == One) || (Local5 == One)))
                {
                    Local0 [Zero] = One
                }

                Local0 [One] = (DerefOf (BT0P [One]) + DerefOf (
                    BT1P [One]))
                Local0 [0x02] = (DerefOf (BT0P [0x02]) + DerefOf (
                    BT1P [0x02]))
                Local0 [0x03] = ((DerefOf (BT0P [0x03]) + DerefOf (
                    BT1P [0x03])) / 0x02)
                If ((BDBG == One))
                {
                    Concatenate ("BATX:BSTState: BATX ", DerefOf (Local0 [Zero]), Debug)
                    Concatenate ("BATX:BSTPresentRate: BATX ", ToDecimalString (DerefOf (Local0 [One])), Debug)
                    Concatenate ("BATX:BSTRemainingCapacity: BATX ", ToDecimalString (DerefOf (Local0 [0x02])), Debug)
                    Concatenate ("BATX:BSTPresentVoltage: BATX ", ToDecimalString (DerefOf (Local0 [0x03])), Debug)
                }

                Return (Local0)
            }

            If (BBIS)
            {
                Name (PBSS, Package (0x07)
                {
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF
                })
                Name (PBS0, Package (0x07){})
                Name (PBS1, Package (0x07){})
                Method (GBSS, 2, NotSerialized)
                {
                    If (Acquire (BAXM, 0xFFFF))
                    {
                        Debug = "BATX:AcquireLock failed in GBSS"
                        Return (PBSS) /* \_SB_.PCI0.LPCB.EC__.BATX.PBSS */
                    }

                    HIID = Arg0
                    Local6 = SBAF ()
                    If ((Local6 == 0xFFFF))
                    {
                        Local6 = Zero
                    }

                    Arg1 [One] = Local6
                    Local6 = SBAE ()
                    If ((Local6 == 0xFFFF))
                    {
                        Local6 = Zero
                    }

                    Arg1 [0x02] = Local6
                    Arg1 [0x03] = SBRS ()
                    Arg1 [0x04] = SBAC ()
                    Arg1 [Zero] = 0x0BD7
                    Release (BAXM)
                    Return (Arg1)
                }

                Method (CBSS, 0, NotSerialized)
                {
                    If ((BDBG == One))
                    {
                        Debug = "BATX:CBSS()"
                    }

                    If (HB0A)
                    {
                        PBS0 = GBSS (Zero, PBSS)
                        If ((BDBG == One))
                        {
                            Concatenate ("BATX:BSSTimeToFull: BAT0 ", ToDecimalString (DerefOf (PBS0 [One])), Debug)
                            Concatenate ("BATX:BSSTimeToEmpty: BAT0 ", ToDecimalString (DerefOf (PBS0 [0x02])), Debug)
                            Concatenate ("BATX:BSSChargeLevel: BAT0 ", ToDecimalString (DerefOf (PBS0 [0x03])), Debug)
                            Concatenate ("BATX:BSSAverageRate: BAT0 ", ToDecimalString (DerefOf (PBS0 [0x04])), Debug)
                        }

                        If (!HB1A)
                        {
                            Return (PBS0) /* \_SB_.PCI0.LPCB.EC__.BATX.PBS0 */
                        }
                    }

                    PBS1 = GBSS (0x10, PBSS)
                    If ((BDBG == One))
                    {
                        Concatenate ("BATX:BSSTimeToFull: BAT1 ", ToDecimalString (DerefOf (PBS1 [One])), Debug)
                        Concatenate ("BATX:BSSTimeToEmpty: BAT1 ", ToDecimalString (DerefOf (PBS1 [0x02])), Debug)
                        Concatenate ("BATX:BSSChargeLevel: BAT1 ", ToDecimalString (DerefOf (PBS1 [0x03])), Debug)
                        Concatenate ("BATX:BSSAverageRate: BAT1 ", ToDecimalString (DerefOf (PBS1 [0x04])), Debug)
                    }

                    If (!HB0A)
                    {
                        Return (PBS1) /* \_SB_.PCI0.LPCB.EC__.BATX.PBS1 */
                    }

                    Local0 = PBS0 /* \_SB_.PCI0.LPCB.EC__.BATX.PBS0 */
                    Local0 [One] = (DerefOf (PBS0 [One]) + DerefOf (
                        PBS1 [One]))
                    Local0 [0x02] = (DerefOf (PBS0 [0x02]) + DerefOf (
                        PBS1 [0x02]))
                    Local0 [0x03] = ((DerefOf (PBS0 [0x03]) + DerefOf (
                        PBS1 [0x03])) / 0x02)
                    Local0 [0x04] = (DerefOf (PBS0 [0x04]) + DerefOf (
                        PBS1 [0x04]))
                    If ((BDBG == One))
                    {
                        Concatenate ("BATX:BSSTimeToFull: BATX ", ToDecimalString (DerefOf (Local0 [One])), Debug)
                        Concatenate ("BATX:BSSTimeToEmpty: BATX ", ToDecimalString (DerefOf (Local0 [0x02])), Debug)
                        Concatenate ("BATX:BSSChargeLevel: BATX ", ToDecimalString (DerefOf (Local0 [0x03])), Debug)
                        Concatenate ("BATX:BSSAverageRate: BATX ", ToDecimalString (DerefOf (Local0 [0x04])), Debug)
                    }

                    Return (Local0)
                }

                Name (PBIS, Package (0x07)
                {
                    0x007F007F, 
                    0xFFFFFFFF, 
                    0x2342, 
                    0x2342, 
                    0x2342, 
                    0x2342, 
                    0x2342
                })
                Method (CBIS, 0, NotSerialized)
                {
                    If ((BDQP == One))
                    {
                        PBIS [Zero] = 0x006F007F
                    }

                    If ((BDBG == One))
                    {
                        Debug = "BATX:CBIS()"
                    }

                    If (Acquire (BAXM, 0xFFFF))
                    {
                        Debug = "BATX:AcquireLock failed in CBIS"
                        Return (PBIS) /* \_SB_.PCI0.LPCB.EC__.BATX.PBIS */
                    }

                    HIID = 0x02
                    PBIS [One] = SBDT ()
                    Local6 = ToString (SBSN (), Ones)
                    PBIS [0x02] = Local6
                    PBIS [0x03] = Local6
                    PBIS [0x04] = Local6
                    PBIS [0x05] = Local6
                    PBIS [0x06] = Local6
                    Release (BAXM)
                    If ((BDBG == One))
                    {
                        Concatenate ("BATX:CBIS:BISConfig BATX ", PBIS [Zero], Debug)
                        Concatenate ("BATX:CBIS:BISManufactureDate BATX ", PBIS [One], Debug)
                        Concatenate ("BATX:CBIS:BISPackLotCode BATX ", PBIS [0x02], Debug)
                    }

                    Return (PBIS) /* \_SB_.PCI0.LPCB.EC__.BATX.PBIS */
                }
            }
        }
    }
}

