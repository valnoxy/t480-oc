DefinitionBlock ("", "SSDT", 2, "T480", "HWAC", 0x00001000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.HWAC, FieldUnitObj)
    External (HWAC, IntObj)

    Scope (\_SB.PCI0.LPCB.EC)
    {
        OperationRegion (ERAM, EmbeddedControl, Zero, 0x0100)
        Field (ERAM, ByteAcc, NoLock, Preserve)
        {
            Offset (0x36), 
            WAC0,   8, 
            WAC1,   8
        }

        Method (XWAC, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Local0 = (WAC1 << 0x08)
                Local0 |= WAC0 /* \_SB_.PCI0.LPCB.EC__.WAC0 */
                Return (Local0)
            }
            Else
            {
                Return (HWAC) /* External reference */
            }
        }
    }
}

