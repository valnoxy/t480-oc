//
// Fix power-management
//
// Many setups disable the PPMC-device and force the PMCR-device to be `Name (_HID, EisaId ("APP9876"))`,
// because they saw something similar at @acidanthera's ACPI-samples.
//
// That's entirely wrong as it is intended to fix NVRAM-access on series 300-mainboards as clearly stated in
// the comment in the file. This breaks the PMC as it disables the real PCI-PMC-controller (PPMC) on x80-thinkpads!
//
// This fixes the actually available PPMC-device to be as closely compatible to the ACPI-setup on
// the macbookpro14,1.
//
//
DefinitionBlock ("", "SSDT", 2, "T480", "PM", 0x00001000)
{
    // External method from SSDT-UTILS.dsl
    External (OSDW, MethodObj) // 0 Arguments
    External (DTGP, MethodObj) // 5 Arguments

    External (_PR.PR00, ProcessorObj)

    //
    // XCPM power management compatibility table.
    // Makes X86PlatformPlugin load.
    //
    Scope (\_PR.PR00)
    {
        Method (_DSM, 4, NotSerialized)
        {
            //
            // Inject plugin-type = 0x01 to load X86*.kext
            //
            Local0 = Package (0x02)
                {
                    "plugin-type", 
                    One
                }
            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
            Return (Local0)
        }
    }

    // Fix PM-Controller
    External (_SB.PCI0, DeviceObj) // 0 Arguments

    Scope (\_SB.PCI0)
    {
        //
        // Same device present on macbook14,1 according to:
        // https://github.com/khronokernel/DarwinDumped/blob/b6d91cf4a5bdf1d4860add87cf6464839b92d5bb/MacBookPro/MacBookPro14%2C1/ACPI%20Tables/DSL/DSDT.dsl#L6120
        //
        Device (PMCR)
        {
            Name (_ADR, 0x001F0002)  // _ADR: Address

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
// EOF
