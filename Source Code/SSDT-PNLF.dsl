DefinitionBlock ("", "SSDT", 2, "T480", "PNLF", 0x00000000)
{
    If (_OSI ("Darwin"))
    {
        Scope (_SB)
        {
            Device (PNLF)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                Name (_CID, "backlight")  // _CID: Compatible ID
                Name (_UID, 0x10)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0B)
                }
            }
        }
    }
}

