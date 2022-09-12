DefinitionBlock ("", "SSDT", 2, "T480", "UTILS", 0x00001000)
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

    Scope (\)
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

        Method (OSDW, 0, NotSerialized)
        {
            If (CondRefOf (\_OSI))
            {
                If (_OSI ("Darwin"))
                {
                    Return (One)
                }
            }

            Return (Zero)
        }
    }
}

