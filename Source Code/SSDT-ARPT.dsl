//
// Adds the OSX-native ACPI-interface for broadcom-wifi-cards.
//
// Stub for now, needs rework to be actually useful.
//
DefinitionBlock ("", "SSDT", 2, "T480", "ARPT", 0x00002000)
{
    // External method from SSDT-UTILS.dsl
    External (OSDW, MethodObj) // 0 Arguments
    External (DTGP, MethodObj) // 5 Arguments

    External (_SB.PCI0.RP01, DeviceObj)
    External (_SB.PCI0.RP01.PXSX, DeviceObj)


    // WIFI
    Scope (_SB.PCI0.RP01)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_PS0, 0, Serialized)  // _PS0: Power State 0
        {
            Debug = "ARPT:_PS0"

            If (OSDW ())
            {
            }
        }

        Method (_PS3, 0, Serialized)  // _PS3: Power State 3
        {
            Debug = "ARPT:_PS3"

            If (OSDW ())
            {
            }
        }

        Scope (PXSX)
        {
            Name (_GPE, 0x31)  // _GPE: General Purpose Events

            OperationRegion (ARE2, PCI_Config, Zero, 0x80)
            Field (ARE2, ByteAcc, NoLock, Preserve)
            {
                AVND,   16, 
                ADID,   16, 
                Offset (0x4C), 
                PSTX,   2
            }

            OperationRegion (ARE3, PCI_Config, 0x80, 0x80)
            Field (ARE3, DWordAcc, NoLock, Preserve)
            {
                BDMR,   32, 
                Offset (0x08), 
                BDEN,   32, 
                Offset (0x20), 
                BDIR,   32, 
                BDDR,   32
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Local0 = Package ()
                    {
                        "name", "AirPort Extreme", 
                        "model", "Broadcom Wireless Network Adapter",
                        "device_type", "Network controller",
                        "built-in", One,
                        "brcmfx-country", "#a"
                    }

                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }

            Method (WWEN, 1, NotSerialized)
            {
                Debug = Concatenate ("ARPT:WWEN - Arg0: ", Arg0)
            }

            Method (PDEN, 1, NotSerialized)
            {
                Debug = Concatenate ("ARPT:PDEN - Arg0: ", Arg0)
            }
        }
    }
}
// EOF
