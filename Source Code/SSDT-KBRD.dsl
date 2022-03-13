// SSDT for T480 Keyboard Map & Configuration.

DefinitionBlock("", "SSDT", 2, "T480", "KBRD", 0)
{
    External(\_SB.PCI0.LPCB.KBD, DeviceObj)

    Scope (\_SB.PCI0.LPCB.KBD)
    
        {
            If (_OSI ("Darwin"))
            {
                // Lenovo ThinkPad T480 Configuration Load
                // Select specific items in VoodooPS2Controller
                Method(_DSM, 4, NotSerialized)
                {
                    If (!Arg2)
                    {
                        Return (Buffer ()
                        {
                            0x03
                        })
                    }

                    Return (Package ()
                    {
                        "RM,oem-id", "LENOVO",
                        "RM,oem-table-id", "T480",
                    })
                }

                // Overrides for settings in the Info.plist files
                Name(RMCF, Package()
                {
                    "Keyboard", Package ()
                    {
                        "ActionSwipeLeft",  "37 d, 21 d, 21 u, 37 u",
                        "ActionSwipeRight", "37 d, 1e d, 1e u, 37 u",
                        "SleepPressTime",   "500",
                        "Swap command and option", ">y",
                        "Custom PS2 Map", Package()
                        {
                            Package(Zero) { },
                            "e038=e05b", //AltGr=Left Windows
                            "e037=64", // PrtSc=F13,via SysPrefs->Keyboard->Shortcuts
                        },
                    },
                })
            }
        }
}
//EOF