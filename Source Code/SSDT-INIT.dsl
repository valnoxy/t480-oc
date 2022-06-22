DefinitionBlock ("", "SSDT", 2, "T480", "INIT", 0x00001000)
{
    External (_SB_.PCI0, DeviceObj)
    External (DPTF, FieldUnitObj)
    External (HPTE, FieldUnitObj)
    External (OSYS, FieldUnitObj)
    External (WNTF, FieldUnitObj)

    Method (OINI, 0, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            Debug = "Set Variables..."
            HPTE = Zero
            OSYS = 0x07DF
        }
    }
}

