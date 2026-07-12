DefinitionBlock ("", "SSDT", 2, "VNXY", "GPI0", 0x00000000)
{
    External (_SB_.PCI0.GPI0, DeviceObj)

    Scope (\_SB.PCI0.GPI0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }
}

