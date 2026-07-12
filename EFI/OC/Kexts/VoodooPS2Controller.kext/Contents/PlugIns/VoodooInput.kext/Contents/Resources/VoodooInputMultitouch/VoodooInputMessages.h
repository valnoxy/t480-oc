//
//  VoodooInputMessages.h
//  VooodooInput
//
//  Copyright © 2019 Kishor Prins. All rights reserved.
//

#ifndef VOODOO_INPUT_MESSAGES_H
#define VOODOO_INPUT_MESSAGES_H

#define VOODOO_INPUT_IDENTIFIER "VoodooInput Instance"

#define VOODOO_INPUT_TRANSFORM_KEY "IOFBTransform"
#define VOODOO_INPUT_LOGICAL_MAX_X_KEY "Logical Max X"
#define VOODOO_INPUT_LOGICAL_MAX_Y_KEY "Logical Max Y"
#define VOODOO_INPUT_PHYSICAL_MAX_X_KEY "Physical Max X"
#define VOODOO_INPUT_PHYSICAL_MAX_Y_KEY "Physical Max Y"

#define VOODOO_INPUT_MAX_TRANSDUCERS 10
#define kIOMessageVoodooInputMessage 12345
#define kIOMessageVoodooInputUpdateDimensionsMessage 12346
#define kIOMessageVoodooInputUpdatePropertiesNotification 12347
#define kIOMessageVoodooTrackpointRelativePointer iokit_vendor_specific_msg(430)
#define kIOMessageVoodooTrackpointScrollWheel iokit_vendor_specific_msg(431)
#define kIOMessageVoodooTrackpointMessage iokit_vendor_specific_msg(432)
#define kIOMessageVoodooTrackpointUpdatePropertiesNotification iokit_vendor_specific_msg(433)

#define kVoodooInputTransducerFingerType 1
#define kVoodooInputTransducerStylusType 2

#define VOODOO_TRACKPOINT_KEY "VoodooInput Trackpoint"
#define VOODOO_TRACKPOINT_BTN_CNT "Button Count"
#define VOODOO_TRACKPOINT_DEADZONE "Deadzone"

#define VOODOO_TRACKPOINT_MOUSE_MULT_X "Mouse Multiplier X"
#define VOODOO_TRACKPOINT_MOUSE_MULT_Y "Mouse Multiplier Y"
#define VOODOO_TRACKPOINT_SCROLL_MULT_X "Scroll Multiplier X"
#define VOODOO_TRACKPOINT_SCROLL_MULT_Y "Scroll Multiplier Y"

#define VOODOO_TRACKPOINT_MOUSE_DIV_X "Mouse Divisor X"
#define VOODOO_TRACKPOINT_MOUSE_DIV_Y "Mouse Divisor Y"
#define VOODOO_TRACKPOINT_SCROLL_DIV_X "Scroll Divisor X"
#define VOODOO_TRACKPOINT_SCROLL_DIV_Y "Scroll Divisor Y"

#include "VoodooInputTransducer.h"
#include "VoodooInputEvent.h"

#endif /* VoodooInputMessages_h */
