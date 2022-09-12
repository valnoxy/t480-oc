DefinitionBlock ("", "SSDT", 2, "T480", "AC", 0x00001000)
{
    External (_SB_.PCI0.LPCB.EC__.AC__, DeviceObj)
    External (LWCP, FieldUnitObj)
    External (OSDW, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.LPCB.EC.AC)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If ((\OSDW () || \LWCP))
            {
                Return (Package (0x02)
                {
                    0x17, 
                    0x04
                })
            }

            Return (Package (0x02)
            {
                0x17, 
                0x03
            })
        }
    }
}

