DefinitionBlock ("", "SSDT", 2, "T480", "OFFDGPU", 0x00001000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.HGOF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.DGON, IntObj)
    External (_SB_.PCI0.LPCB.DGRT, IntObj)
    External (_SB_.PCI0.RP01, DeviceObj)
    External (_SB_.PCI0.RP01.LDIS, FieldUnitObj)
    External (_SB_.PCI0.RP01.VDID, FieldUnitObj)
    External (P8XH, MethodObj)    // 2 Arguments

    Scope (_SB.PCI0.RP01)
    {
        Method (DOFF, 0, Serialized)
        {
            Debug = "OFFDGPU:DOFF()"
            \P8XH (Zero, 0x21)
            ^^HGOF ()
            \P8XH (Zero, 0x22)
            ^^LPCB.DGRT = Zero
            ^^LPCB.DGON = Zero
            LDIS = One
        }

        Method (_STA, 0, Serialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                DOFF ()
                Return (Zero)
            }

            Return (0x0F)
        }

        Method (_PS0, 0, Serialized)  // _PS0: Power State 0
        {
            If (_OSI ("Darwin"))
            {
                DOFF ()
            }
        }

        Method (_PS3, 0, Serialized)  // _PS3: Power State 3
        {
            If (_OSI ("Darwin"))
            {
                DOFF ()
            }
        }
    }
}

