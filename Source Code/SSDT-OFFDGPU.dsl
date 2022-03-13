DefinitionBlock("", "SSDT", 2, "T480", "OFFDGPU", 0x00001000)
{
    External (_SB.PCI0, DeviceObj)
    External (_SB.PCI0.RP01, DeviceObj)
    External (_SB.PCI0.HGOF, MethodObj)    // 0 Arguments
    External (P8XH, MethodObj)    // 2 Arguments
    External (_SB.PCI0.RP01.VDID, FieldUnitObj)
    External (_SB.PCI0.RP01.LDIS, FieldUnitObj)
    External (_SB.PCI0.LPCB.DGRT, IntObj)
    External (_SB.PCI0.LPCB.DGON, IntObj)

     // Disable dGPU on PCIe-Level
    Scope (_SB.PCI0.RP01)
    {
        Method (DOFF, 0, Serialized)
        {
            Debug = "OFFDGPU:DOFF()"
            // Debug = "OFFDGPU:VDID: (before)"
            // Debug = VDID

            // disable dGPU
            \P8XH (Zero, 0x21)
            ^^HGOF ()
            \P8XH (Zero, 0x22)

            // disable rp01-pci-bridge
            ^^LPCB.DGRT = Zero
            ^^LPCB.DGON = Zero
            LDIS = One

            // Debug = "OFFDGPU:DGRT: (after)"
            // Debug = ^^LPCB.DGRT

            // Debug = "OFFDGPU:DGON: (after)"
            // Debug = ^^LPCB.DGON

            // Debug = "OFFDGPU:VDID: (after)"
            // Debug = VDID
        }

        Method (_STA, 0, Serialized)
        {
            // Debug = "OFFDGPU:_STA"

            If (_OSI ("Darwin"))
            {
                DOFF ()

                Return (Zero)
            }

            Return (0x0F)
        }

        Method (_PS0, 0, Serialized)
        {
            // Debug = "OFFDGPU:_PS0"

            If (_OSI ("Darwin"))
            {
                DOFF ()
            }
        }

        Method (_PS3, 0, Serialized)
        {
            // Debug = "OFFDGPU:_PS3"

            If (_OSI ("Darwin"))
            {
                DOFF ()
            }
        }
    }
}
// EOF
