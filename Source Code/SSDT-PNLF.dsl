// Backlight

DefinitionBlock ("", "SSDT", 2, "T480", "PNLF", 0)
{
    If (_OSI ("Darwin"))
    {
        Scope (_SB)
        {
            Device (PNLF)
            {
                Name (_ADR, Zero)  
                Name (_HID, EisaId ("APP0002"))
                Name (_CID, "backlight")
                //Skylake/KabyLake/KabyLake-R
                Name (_UID, 0x10)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0B)
                }
            }
        }
    }
}

//EOF