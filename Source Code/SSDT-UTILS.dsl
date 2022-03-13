
//
// Commenly used utils
//
DefinitionBlock ("", "SSDT", 2, "T480", "UTILS", 0x00001000)
{
    Scope (\)
    {
        Method (DTGP, 5, NotSerialized)
        {
            If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
            {
                If ((Arg1 == One))
                {
                    If ((Arg2 == Zero))
                    {
                        Arg4 = Buffer (One)
                        {
                            0x03
                        }

                        Return (One)
                    }

                    If ((Arg2 == One))
                    {
                        Return (One)
                    }
                }
            }

            Arg4 = Buffer (One)
            {
                0x00
            }

            Return (Zero)
        }

        /**
         * Detect OSX to enable other patches
         */
        Method (OSDW, 0, NotSerialized)
        {
            If (CondRefOf (\_OSI))
            {
                If (_OSI ("Darwin"))
                {
                    Return (One) // Is OSX
                }
            }

            Return (Zero)
        }
    }
}
//EOF
