// Fixing / Adding various devices for macOS compatibility
// ALS0, PWRB, MCHC, SMBUS, DMAC

DefinitionBlock ("", "SSDT", 2, "T480", "VDEV", 0)
{
    External (DTGP, MethodObj)
    External (OSDW, MethodObj)
    
    Scope (\_SB)
    {
        Device (ALS0)
        {
            Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
            Name (_CID, "smc-als")  // _CID: Compatible ID
            Name (_ALI, 0x012C)  // _ALI: Ambient Light Illuminance
            Name (_ALR, Package (0x01)  // _ALR: Ambient Light Response
            {
                Package (0x02)
                {
                    0x64, 
                    0x012C
                }
            })

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (OSDW ())
                {
                    Return (0x0B)  // ALS Enabled.  Don't show it in UI.
                }

                Return (Zero)
            }
        }
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Return (Zero)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (OSDW ())
                {
                    Return (0x0B)
                }

                Return (Zero)
            }
        }

    }


    /*
     * SMBus compatibility table.
     *
     * Needed to load com.apple.driver.AppleSMBusController
     */

    External (\_SB.PCI0, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Device (MCHC)
        {
            Name (_ADR, Zero)

            Method (_STA, 0, NotSerialized)
            {
                If (OSDW ())
                {
                    Return (0x0F)
                }
                
                Return (Zero)
            }
        }
    }
    
    External (_SB_.PCI0.SBUS, DeviceObj)

    Scope (_SB.PCI0.SBUS)
    {
        Device (BUS0)
        {
            Name (_CID, "smbus")  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (OSDW ())
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (BUS1)
        {
            Name (_CID, "smbus")  // _CID: Compatible ID
            Name (_ADR, One)  // _ADR: Address

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (OSDW ())
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }
    
     /*
     * Fix up memory controller
     */
    
    External (_SB_.PCI0.LPCB, DeviceObj)

    Scope (_SB.PCI0.LPCB)
    {
        Device (DMAC)
        {
            Name (_HID, EISAID("PNP0200"))

            Name (_CRS, ResourceTemplate()
            {
                IO (Decode16, 0x00, 0x00, 0x01, 0x20)
                IO (Decode16, 0x81, 0x81, 0x01, 0x11)
                IO (Decode16, 0x93, 0x93, 0x01, 0x0d)
                IO (Decode16, 0xc0, 0xc0, 0x01, 0x20)
                DMA (Compatibility, NotBusMaster, Transfer8_16) { 4 }
            })

            Method (_STA, 0, NotSerialized)
            {
                If (OSDW ())
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }


}