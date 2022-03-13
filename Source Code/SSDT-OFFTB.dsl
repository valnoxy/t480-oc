DefinitionBlock("", "SSDT", 2, "T480", "OFFTB", 0x00001000)
{
    // Force off TB
    External (_SB.PCI0.RP09, DeviceObj)
    External (_SB.PCI0.RP09.POFF, MethodObj) // 0 Arguments
    
    External (_SB.PCI0.RP09.VDID, FieldUnitObj)
    External (_SB.PCI0.RP09.LDIS, FieldUnitObj)
    External (TBTS, FieldUnitObj)
    External (RTBT, FieldUnitObj)
    External (TOFF, FieldUnitObj)
    External (TRD3, FieldUnitObj)

    Scope (_SB.PCI0.RP09)
    {
        Method (DOFF, 0, Serialized)
        {
            Debug = "OFFTB:DOFF()"
            // Debug = "OFFTB:DOFF() - VDID: (before):"
            // Debug = VDID

            // Debug = "OFFTB:TBOF() POFF()"
            TRD3 = 0x01
            POFF ()
            TRD3 = 0x00

            TBTS = Zero
            LDIS = One

            // Debug = "OFFTB:TBOF() - TOFF:"
            // Debug = TOFF

            // Debug = "OFFTB:TBOF() - TBTS:"
            // Debug = TBTS

            // Debug = "OFFTB:TBOF() - VDID:"
            // Debug = VDID
        }

        Method (_STA, 0, Serialized)
        {
            // Debug = "OFFTB:_STA"

            If (_OSI ("Darwin"))
            {
                DOFF ()

                Return (Zero)
            }

            Return (0x0F)
        }

        Method (_PS0, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                DOFF ()
            }
        }

        Method (_PS3, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                DOFF ()
            }
        }
    }
}
// EOF
