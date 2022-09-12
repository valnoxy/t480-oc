DefinitionBlock ("", "SSDT", 2, "T480", "SLEEP", 0x00001000)
{
    External (_S3_, UnknownObj)
    External (_SB_.LID_, DeviceObj)
    External (_SB_.PCI0.GFX0.CLID, FieldUnitObj)
    External (_SB_.PCI0.GLAN.PMEE, FieldUnitObj)
    External (_SB_.PCI0.HDAS.PMEE, FieldUnitObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.AC__._PSR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.HPLD, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.LED_, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.XDCI.PMEE, FieldUnitObj)
    External (_SB_.PCI0.XHC_.PMEE, FieldUnitObj)
    External (_SB_.SCGE, FieldUnitObj)
    External (LIDS, FieldUnitObj)
    External (OSDW, MethodObj)    // 0 Arguments
    External (PWRS, FieldUnitObj)
    External (S0ID, FieldUnitObj)
    External (SS3_, FieldUnitObj)
    External (STY0, FieldUnitObj)
    External (TBTS, FieldUnitObj)
    External (ZPRW, MethodObj)    // 2 Arguments
    External (ZPTS, MethodObj)    // 1 Arguments
    External (ZWAK, MethodObj)    // 1 Arguments

    Name (DIEN, Zero)
    Name (INIB, One)
    If (OSDW ())
    {
        Debug = "SLEEP: Enabling comprehensive S3-patching..."
        STY0 = Zero
        S0ID = Zero
        If (((STY0 == Zero) && !CondRefOf (\_S3)))
        {
            Name (\_S3, Package (0x04)  // _S3_: S3 System State
            {
                0x05, 
                0x05, 
                Zero, 
                Zero
            })
            SS3 = One
        }
    }

    Name (XLTP, Zero)
    Method (_TTS, 1, NotSerialized)  // _TTS: Transition To State
    {
        Debug = Concatenate ("SLEEP:_TTS() called with Arg0 = ", Arg0)
        XLTP = Arg0
    }

    Scope (_GPE)
    {
        Method (LXEN, 0, NotSerialized)
        {
            Return (One)
        }
    }

    Scope (\)
    {
        Method (SPTS, 0, NotSerialized)
        {
            Debug = "SLEEP:SPTS"
            If ((\LIDS != \_SB.PCI0.LPCB.EC.HPLD))
            {
                Debug = "SLEEP:SPTS - lid-state unsync."
                \LIDS = \_SB.PCI0.LPCB.EC.HPLD /* External reference */
                \_SB.PCI0.GFX0.CLID = LIDS /* External reference */
            }

            \_SB.PCI0.LPCB.EC.LED (0x07, 0xA0)
            \_SB.PCI0.LPCB.EC.LED (Zero, 0xA0)
            \_SB.PCI0.LPCB.EC.LED (0x0A, 0xA0)
        }

        Method (SWAK, 0, NotSerialized)
        {
            Debug = "SLEEP:SWAK"
            If ((\LIDS != \_SB.PCI0.LPCB.EC.HPLD))
            {
                Debug = "SLEEP:SWAK - lid-state unsync."
                \LIDS = \_SB.PCI0.LPCB.EC.HPLD /* External reference */
                \_SB.PCI0.GFX0.CLID = LIDS /* External reference */
            }

            Notify (\_SB.LID, 0x80) // Status Change
            \_SB.PCI0.LPCB.EC.LED (Zero, 0x80)
            \_SB.PCI0.LPCB.EC.LED (0x0A, 0x80)
            \_SB.PCI0.LPCB.EC.LED (0x07, 0x80)
            \PWRS = \_SB.PCI0.LPCB.EC.AC._PSR ()
            \_SB.SCGE = One
        }

        If (CondRefOf (\ZPTS))
        {
            Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
            {
                Debug = Concatenate ("SLEEP:_PTS called - Arg0 = ", Arg0)
                If ((OSDW () && (Arg0 < 0x05)))
                {
                    SPTS ()
                }

                ZPTS (Arg0)
                If ((OSDW () && (Arg0 == 0x05)))
                {
                    If (CondRefOf (\_SB.PCI0.XHC.PMEE))
                    {
                        \_SB.PCI0.XHC.PMEE = Zero
                    }

                    If (CondRefOf (\_SB.PCI0.XDCI.PMEE))
                    {
                        \_SB.PCI0.XDCI.PMEE = Zero
                    }

                    If (CondRefOf (\_SB.PCI0.GLAN.PMEE))
                    {
                        \_SB.PCI0.GLAN.PMEE = Zero
                    }

                    If (CondRefOf (\_SB.PCI0.HDAS.PMEE))
                    {
                        \_SB.PCI0.HDAS.PMEE = Zero
                    }
                }
            }
        }

        If (CondRefOf (\ZWAK))
        {
            Method (_WAK, 1, Serialized)  // _WAK: Wake
            {
                Debug = Concatenate ("SLEEP:_WAK - called Arg0: ", Arg0)
                If ((OSDW () && (Arg0 < 0x05)))
                {
                    SWAK ()
                }

                Local0 = ZWAK (Arg0)
                Return (Local0)
            }
        }

        Method (GPRW, 2, Serialized)
        {
            If (OSDW ())
            {
                Local0 = Package (0x02)
                    {
                        Zero, 
                        Zero
                    }
                Local0 [Zero] = Arg0
                If ((Arg1 >= 0x04))
                {
                    Local0 [One] = Zero
                }

                Return (Local0)
            }

            Return (ZPRW (Arg0, Arg1))
        }
    }

    Scope (_SB.PCI0.LPCB)
    {
        Method (_PS0, 0, Serialized)  // _PS0: Power State 0
        {
            If (((OSDW () && (DIEN == One)) && (INIB == Zero)))
            {
                \SWAK ()
            }

            If ((INIB == One))
            {
                INIB = Zero
            }
        }

        Method (_PS3, 0, Serialized)  // _PS3: Power State 3
        {
            If ((OSDW () && (DIEN == One)))
            {
                \SPTS ()
            }
        }
    }

    Scope (_SB)
    {
        Method (LPS0, 0, NotSerialized)
        {
            If ((DIEN == One))
            {
                Debug = "SLEEP: Enable S0-Sleep / DeepSleep"
            }

            Return (DIEN) /* \DIEN */
        }
    }
}

