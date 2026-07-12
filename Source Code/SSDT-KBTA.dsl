// SSDT for T480 Keyboard Map & Configuration.
// See: https://github.com/MSzturc/ThinkpadAssistant

DefinitionBlock ("", "SSDT", 2, "VNXY", "_KBD", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)              // from opcode
    External (_SB_.PCI0.LPCB.EC__.HKEY.MLCS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC__.HKEY.MMTS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ16, MethodObj)         // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ1F, MethodObj)         // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ60, MethodObj)         // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ61, MethodObj)         // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ62, MethodObj)         // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ64, MethodObj)         // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ66, MethodObj)         // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ6A, MethodObj)         // 0 Arguments
    External (_SB_.PCI0.LPCB.KBD_, DeviceObj)

    Scope (\_SB.PCI0.LPCB.EC)
    {
        Name (LED1, Zero)
        Name (LED2, Zero)
        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.LPCB.KBD, 0x0206)
            Notify (\_SB.PCI0.LPCB.KBD, 0x0286)
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.LPCB.KBD, 0x0205)
            Notify (\_SB.PCI0.LPCB.KBD, 0x0285)
        }

        // _Q6A - (Fn+F4) microphone mute key.
        Method (_Q6A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                // Send a one-shot event (down then up) for scancode 64 to keyboard device. This
                // is picked up by VoodooPS2 and sent to macOS as the F20 key.

                //Bug: Currently it's not possivle to map F20 Key in Systemprefs
                Notify (\_SB.PCI0.LPCB.KBD, 0x036B)

                // Toggle Mute Microphone LED
                If ((LED1 == Zero))
                {
                    // 0x02 = Enable LED
                    \_SB.PCI0.LPCB.EC.HKEY.MMTS (0x02)
                    LED1 = One
                }
                Else
                {
                    // 0x00 = Disable LED
                    \_SB.PCI0.LPCB.EC.HKEY.MMTS (Zero)
                    LED1 = Zero
                }
            }
            Else
            {
                // Call original _Q6A method.
                \_SB.PCI0.LPCB.EC.XQ6A ()
            }
        }

        // _Q16 - (Fn+F7) dual display
        Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0367)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ16 ()
            }
        }

        // _Q64 - (Fn+F8) Wireless disable key.
        Method (_Q64, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                // Send a one-shot event (down then up) for scancode 68 to keyboard device. This
                // is picked up by VoodooPS2 and sent to macOS as the F17 key.
                Notify (\_SB.PCI0.LPCB.KBD, 0x0368)
            }
            Else
            {
                // Call original _Q64 method.
                \_SB.PCI0.LPCB.EC.XQ64 ()
            }
        }

        // _Q66 - (Fn+F9) settings
        Method (_Q66, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0369)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ66 ()
            }
        }

        // _Q60 - (Fn+F10) bluetooth
        Method (_Q60, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x012A)
                Notify (\_SB.PCI0.LPCB.KBD, 0x0368)
                Notify (\_SB.PCI0.LPCB.KBD, 0x01AA)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ60 ()
            }
        }

        // _Q61 - (Fn+F11) keyboard
        Method (_Q61, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                // Send a down event for the Control key (scancode 1d), then a one-shot event (down then up) for
                // the up arrow key (scancode 0e 48), and finally an up event for the Control key (break scancode 9d).
                // This is picked up by VoodooPS2 and sent to macOS as the Control+Up key combo for Mission Control.
                Notify (\_SB.PCI0.LPCB.KBD, 0x011D)
                Notify (\_SB.PCI0.LPCB.KBD, 0x0448)
                Notify (\_SB.PCI0.LPCB.KBD, 0x019D)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ61 ()
            }
        }

        // _Q62 - (Fn+F12) star
        Method (_Q62, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                // Send a one-shot event (down then up) for scancode 6a to keyboard device. This
                // is picked up by VoodooPS2 and sent to macOS as the F19 key.
                Notify (\_SB.PCI0.LPCB.KBD, 0x036A)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.XQ62 ()
            }
        }

        // _Q1F - (Fn+Space) Toggle Keyboard Backlight.
        Method (_Q1F, 0, NotSerialized) // cycle keyboard backlight - _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                // Cycle keyboard backlight states

                If ((LED2 == Zero))
                { 
                    // Right Shift + F16.
                    Notify (\_SB.PCI0.LPCB.KBD, 0x0136)
                    Notify (\_SB.PCI0.LPCB.KBD, 0x0367)
                    Notify (\_SB.PCI0.LPCB.KBD, 0x01B6)
                    //  Off to dim
                    \_SB.PCI0.LPCB.EC.HKEY.MLCS (One)
                    LED2 = One
                }
                ElseIf ((LED2 == One))
                {
                    // Left Shift + F19.
                    Notify (\_SB.PCI0.LPCB.KBD, 0x012A)
                    Notify (\_SB.PCI0.LPCB.KBD, 0x036A)
                    Notify (\_SB.PCI0.LPCB.KBD, 0x01AA)
                    //  dim to bright
                    \_SB.PCI0.LPCB.EC.HKEY.MLCS (0x02)
                    LED2 = 0x02
                }
                ElseIf ((LED2 == 0x02))
                {
                    // Left Shift + F16.
                    Notify (\_SB.PCI0.LPCB.KBD, 0x012A)
                    Notify (\_SB.PCI0.LPCB.KBD, 0x0367)
                    Notify (\_SB.PCI0.LPCB.KBD, 0x01AA)
                    // bright to off
                    \_SB.PCI0.LPCB.EC.HKEY.MLCS (Zero)
                    LED2 = Zero
                }
                Else
                {
                    // Call original _Q6A method.
                    \_SB.PCI0.LPCB.EC.XQ1F ()
                }
            }
        }
    }
}

