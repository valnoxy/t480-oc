DefinitionBlock ("", "SSDT", 2, "T480", "YOGA", 0x00001000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.HFNI, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.HFSP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.VRST, FieldUnitObj)
    External (_SI_._SST, MethodObj)    // 1 Arguments

    Scope (_SB.PCI0.LPCB.EC)
    {
        OperationRegion (ESEN, EmbeddedControl, Zero, 0x0100)
        Field (ESEN, ByteAcc, Lock, Preserve)
        {
            Offset (0x78), 
            EST0,   8
        }

        Scope (HKEY)
        {
            Method (CSSI, 1, NotSerialized)
            {
                \_SI._SST (Arg0)
            }

            Method (CFSP, 1, NotSerialized)
            {
                \_SB.PCI0.LPCB.EC.HFSP = Arg0
            }

            Method (CFNI, 1, NotSerialized)
            {
                \_SB.PCI0.LPCB.EC.HFNI = Arg0
            }

            Method (CRST, 1, NotSerialized)
            {
                \_SB.PCI0.LPCB.EC.VRST = Arg0
            }
        }
    }
}

