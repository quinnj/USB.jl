#=
 * Public libusb header file
 * Copyright © 2001 Johannes Erdfelt <johannes@erdfelt.com>
 * Copyright © 2007-2008 Daniel Drake <dsd@gentoo.org>
 * Copyright © 2012 Pete Batard <pete@akeo.ie>
 * Copyright © 2012 Nathan Hjelm <hjelmn@cs.unm.edu>
 * For more information, please visit: http://libusb.info
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 =#

# /** \def LIBUSB_API_VERSION
#  * \ingroup libusb_misc
#  * libusb's API version.
#  *
#  * Since version 1.0.13, to help with feature detection, libusb defines
#  * a LIBUSB_API_VERSION macro that gets increased every time there is a
#  * significant change to the API, such as the introduction of a new call,
#  * the definition of a new macro/enum member, or any other element that
#  * libusb applications may want to detect at compilation time.
#  *
#  * The macro is typically used in an application as follows:
#  * \code
#  * #if defined(LIBUSB_API_VERSION) && (LIBUSB_API_VERSION >= 0x01001234)
#  * // Use one of the newer features from the libusb API
#  * #endif
#  * \endcode
#  *
#  * Internally, LIBUSB_API_VERSION is defined as follows:
#  * (libusb major << 24) | (libusb minor << 16) | (16 bit incremental)
#  */
const LIBUSB_API_VERSION = 0x01000105

# /**
#  * \ingroup libusb_misc
#  * Convert a 16-bit value from host-endian to little-endian format. On
#  * little endian systems, this function does nothing. On big endian systems,
#  * the bytes are swapped.
#  * \param x the host-endian value to convert
#  * \returns the value in little-endian byte order
#  */
# static inline uint16_t libusb_cpu_to_le16(const uint16_t x)
# {
# 	union {
# 		b8[2]::UInt8
# 		b16::UInt16
# 	} _tmp;
# 	_tmp.b8[1] = (uint8_t) (x >> 8);
# 	_tmp.b8[0] = (uint8_t) (x & 0xff);
# 	return _tmp.b16;
# }

# /** \def libusb_le16_to_cpu
#  * \ingroup libusb_misc
#  * Convert a 16-bit value from little-endian to host-endian format. On
#  * little endian systems, this function does nothing. On big endian systems,
#  * the bytes are swapped.
#  * \param x the little-endian value to convert
#  * \returns the value in host-endian byte order
#  */
#define libusb_le16_to_cpu libusb_cpu_to_le16

# # standard USB stuff

# /** \ingroup libusb_desc
#  * Device and/or Interface Class codes */
@enum(libusb_class_code,
	# /** In the context of a \ref libusb_device_descriptor "device descriptor",
	#  * this bDeviceClass value indicates that each interface specifies its
	#  * own class information and all interfaces operate independently.
	#  */
	LIBUSB_CLASS_PER_INTERFACE = 0,

	#  Audio class
	LIBUSB_CLASS_AUDIO = 1,

	#  Communications class
	LIBUSB_CLASS_COMM = 2,

	#  Human Interface Device class
	LIBUSB_CLASS_HID = 3,

	#  Physical
	LIBUSB_CLASS_PHYSICAL = 5,

	#  Printer class
	LIBUSB_CLASS_PRINTER = 7,

	#  Image class
	LIBUSB_CLASS_IMAGE = 6,

	#  Mass storage class
	LIBUSB_CLASS_MASS_STORAGE = 8,

	#  Hub class
	LIBUSB_CLASS_HUB = 9,

	#  Data class
	LIBUSB_CLASS_DATA = 10,

	#  Smart Card
	LIBUSB_CLASS_SMART_CARD = 0x0b,

	#  Content Security
	LIBUSB_CLASS_CONTENT_SECURITY = 0x0d,

	#  Video
	LIBUSB_CLASS_VIDEO = 0x0e,

	#  Personal Healthcare
	LIBUSB_CLASS_PERSONAL_HEALTHCARE = 0x0f,

	#  Diagnostic Device
	LIBUSB_CLASS_DIAGNOSTIC_DEVICE = 0xdc,

	#  Wireless class
	LIBUSB_CLASS_WIRELESS = 0xe0,

	#  Application class
	LIBUSB_CLASS_APPLICATION = 0xfe,

    # Unknown
    UNKNOWN = 0xef,

	#  Class is vendor-specific
	LIBUSB_CLASS_VENDOR_SPEC = 0xff
)

# /** \ingroup libusb_desc
#  * Descriptor types as defined by the USB specification. */
@enum(libusb_descriptor_type,
	#  Device descriptor. See libusb_device_descriptor.
	LIBUSB_DT_DEVICE = 0x01,

	#  Configuration descriptor. See libusb_config_descriptor.
	LIBUSB_DT_CONFIG = 0x02,

	#  String descriptor
	LIBUSB_DT_STRING = 0x03,

	#  Interface descriptor. See libusb_interface_descriptor.
	LIBUSB_DT_INTERFACE = 0x04,

	#  Endpoint descriptor. See libusb_endpoint_descriptor.
	LIBUSB_DT_ENDPOINT = 0x05,

	#  BOS descriptor
	LIBUSB_DT_BOS = 0x0f,

	#  Device Capability descriptor
	LIBUSB_DT_DEVICE_CAPABILITY = 0x10,

	#  HID descriptor
	LIBUSB_DT_HID = 0x21,

	#  HID report descriptor
	LIBUSB_DT_REPORT = 0x22,

	#  Physical descriptor
	LIBUSB_DT_PHYSICAL = 0x23,

	#  Hub descriptor
	LIBUSB_DT_HUB = 0x29,

	#  SuperSpeed Hub descriptor
	LIBUSB_DT_SUPERSPEED_HUB = 0x2a,

	#  SuperSpeed Endpoint Companion descriptor
	LIBUSB_DT_SS_ENDPOINT_COMPANION = 0x30
)

# Descriptor sizes per descriptor type
const LIBUSB_DT_DEVICE_SIZE = 18
const LIBUSB_DT_CONFIG_SIZE = 9
const LIBUSB_DT_INTERFACE_SIZE = 9
const LIBUSB_DT_ENDPOINT_SIZE = 7
const LIBUSB_DT_ENDPOINT_AUDIO_SIZE = 9	# Audio extension
const LIBUSB_DT_HUB_NONVAR_SIZE = 7
const LIBUSB_DT_SS_ENDPOINT_COMPANION_SIZE = 6
const LIBUSB_DT_BOS_SIZE = 5
const LIBUSB_DT_DEVICE_CAPABILITY_SIZE = 3

# BOS descriptor sizes
const LIBUSB_BT_USB_2_0_EXTENSION_SIZE = 7
const LIBUSB_BT_SS_USB_DEVICE_CAPABILITY_SIZE = 10
const LIBUSB_BT_CONTAINER_ID_SIZE = 20

#TODO
# We unwrap the BOS => define its max size
# #define LIBUSB_DT_BOS_MAX_SIZE		((LIBUSB_DT_BOS_SIZE)     +\
# 					(LIBUSB_BT_USB_2_0_EXTENSION_SIZE)       +\
# 					(LIBUSB_BT_SS_USB_DEVICE_CAPABILITY_SIZE) +\
# 					(LIBUSB_BT_CONTAINER_ID_SIZE))

const LIBUSB_ENDPOINT_ADDRESS_MASK = 0x0f    # in bEndpointAddress
const LIBUSB_ENDPOINT_DIR_MASK = 0x80

# /** \ingroup libusb_desc
#  * Endpoint direction. Values for bit 7 of the
#  * \ref libusb_endpoint_descriptor::bEndpointAddress "endpoint address" scheme.
#  */
@enum(libusb_endpoint_direction,
	#  In: device-to-host
	LIBUSB_ENDPOINT_IN = 0x80,

	#  Out: host-to-device
	LIBUSB_ENDPOINT_OUT = 0x00
)

const LIBUSB_TRANSFER_TYPE_MASK = 0x03    # in bmAttributes

# /** \ingroup libusb_desc
#  * Endpoint transfer type. Values for bits 0:1 of the
#  * \ref libusb_endpoint_descriptor::bmAttributes "endpoint attributes" field.
#  */
@enum(libusb_transfer_type,
	#  Control endpoint
	LIBUSB_TRANSFER_TYPE_CONTROL = 0,

	#  Isochronous endpoint
	LIBUSB_TRANSFER_TYPE_ISOCHRONOUS = 1,

	#  Bulk endpoint
	LIBUSB_TRANSFER_TYPE_BULK = 2,

	#  Interrupt endpoint
	LIBUSB_TRANSFER_TYPE_INTERRUPT = 3,

	#  Stream endpoint
	LIBUSB_TRANSFER_TYPE_BULK_STREAM = 4,
)

# /** \ingroup libusb_misc
#  * Standard requests, as defined in table 9-5 of the USB 3.0 specifications */
@enum(libusb_standard_request,
	#  Request status of the specific recipient
	LIBUSB_REQUEST_GET_STATUS = 0x00,

	#  Clear or disable a specific feature
	LIBUSB_REQUEST_CLEAR_FEATURE = 0x01,

	# 0x02 is reserved

	#  Set or enable a specific feature
	LIBUSB_REQUEST_SET_FEATURE = 0x03,

	# 0x04 is reserved

	#  Set device address for all future accesses
	LIBUSB_REQUEST_SET_ADDRESS = 0x05,

	#  Get the specified descriptor
	LIBUSB_REQUEST_GET_DESCRIPTOR = 0x06,

	#  Used to update existing descriptors or add new descriptors
	LIBUSB_REQUEST_SET_DESCRIPTOR = 0x07,

	#  Get the current device configuration value
	LIBUSB_REQUEST_GET_CONFIGURATION = 0x08,

	#  Set device configuration
	LIBUSB_REQUEST_SET_CONFIGURATION = 0x09,

	#  Return the selected alternate setting for the specified interface
	LIBUSB_REQUEST_GET_INTERFACE = 0x0A,

	#  Select an alternate interface for the specified interface
	LIBUSB_REQUEST_SET_INTERFACE = 0x0B,

	#  Set then report an endpoint's synchronization frame
	LIBUSB_REQUEST_SYNCH_FRAME = 0x0C,

	#  Sets both the U1 and U2 Exit Latency
	LIBUSB_REQUEST_SET_SEL = 0x30,

	# /** Delay from the time a host transmits a packet to the time it is
	#   * received by the device. */
	LIBUSB_SET_ISOCH_DELAY = 0x31,
)

# /** \ingroup libusb_misc
#  * Request immutable bits of the
#  * \ref libusb_control_setup::bmRequestType "bmRequestType" field in control
#  * transfers. */
@enum(libusb_request_type,
	#  Standard
	LIBUSB_REQUEST_TYPE_STANDARD = (0x00 << 5),

	#  Class
	LIBUSB_REQUEST_TYPE_CLASS = (0x01 << 5),

	#  Vendor
	LIBUSB_REQUEST_TYPE_VENDOR = (0x02 << 5),

	#  Reserved
	LIBUSB_REQUEST_TYPE_RESERVED = (0x03 << 5)
)

# /** \ingroup libusb_misc
#  * Recipient bits of the
#  * \ref libusb_control_setup::bmRequestType "bmRequestType" field in control
#  * transfers. Values 4 through 31 are reserved. */
@enum(libusb_request_recipient,
	#  Device
	LIBUSB_RECIPIENT_DEVICE = 0x00,

	#  Interface
	LIBUSB_RECIPIENT_INTERFACE = 0x01,

	#  Endpoint
	LIBUSB_RECIPIENT_ENDPOINT = 0x02,

	#  Other
	LIBUSB_RECIPIENT_OTHER = 0x03,
)

const LIBUSB_ISO_SYNC_TYPE_MASK = 0x0C

# /** \ingroup libusb_desc
#  * Synchronization immutable for isochronous endpoints. Values for bits 2:3 of the
#  * \ref libusb_endpoint_descriptor::bmAttributes "bmAttributes" field in
#  * libusb_endpoint_descriptor.
#  */
@enum(libusb_iso_sync_type,
	#  No synchronization
	LIBUSB_ISO_SYNC_TYPE_NONE = 0,

	#  Asynchronous
	LIBUSB_ISO_SYNC_TYPE_ASYNC = 1,

	#  Adaptive
	LIBUSB_ISO_SYNC_TYPE_ADAPTIVE = 2,

	#  Synchronous
	LIBUSB_ISO_SYNC_TYPE_SYNC = 3
)

const LIBUSB_ISO_USAGE_TYPE_MASK = 0x30

# /** \ingroup libusb_desc
#  * Usage immutable for isochronous endpoints. Values for bits 4:5 of the
#  * \ref libusb_endpoint_descriptor::bmAttributes "bmAttributes" field in
#  * libusb_endpoint_descriptor.
#  */
@enum(libusb_iso_usage_type,
	#  Data endpoint
	LIBUSB_ISO_USAGE_TYPE_DATA = 0,

	#  Feedback endpoint
	LIBUSB_ISO_USAGE_TYPE_FEEDBACK = 1,

	#  Implicit feedback Data endpoint
	LIBUSB_ISO_USAGE_TYPE_IMPLICIT = 2,
)

# /** \ingroup libusb_desc
#  * A structure representing the standard USB device descriptor. This
#  * descriptor is documented in section 9.6.1 of the USB 3.0 specification.
#  * All multiple-byte fields are represented in host-endian format.
#  */

immutable libusb_device_descriptor
	#  Size of this descriptor (in bytes)
	bLength::UInt8

	# /** Descriptor type. Will have value
	#  * \ref libusb_descriptor_type::LIBUSB_DT_DEVICE LIBUSB_DT_DEVICE in this
	#  * context. */
	bDescriptorType::UInt8

	# /** USB specification release number in binary-coded decimal. A value of
	#  * 0x0200 indicates USB 2.0, 0x0110 indicates USB 1.1, etc. */
	bcdUSB::UInt16

	#  USB-IF class code for the device. See \ref libusb_class_code.
	bDeviceClass::UInt8

	# /** USB-IF subclass code for the device, qualified by the bDeviceClass
	#  * value */
	bDeviceSubClass::UInt8

	# /** USB-IF protocol code for the device, qualified by the bDeviceClass and
	#  * bDeviceSubClass values */
	bDeviceProtocol::UInt8

	#  Maximum packet size for endpoint 0
	bMaxPacketSize0::UInt8

	#  USB-IF vendor ID
	idVendor::UInt16

	#  USB-IF product ID
	idProduct::UInt16

	#  Device release number in binary-coded decimal
	bcdDevice::UInt16

	#  Index of string descriptor describing manufacturer
	iManufacturer::UInt8

	#  Index of string descriptor describing product
	iProduct::UInt8

	#  Index of string descriptor containing device serial number
	iSerialNumber::UInt8

	#  Number of possible configurations
	bNumConfigurations::UInt8

    libusb_device_descriptor() = new(0,0,0,0,0,0,0,0,0,0,0,0,0,0)
end

# /** \ingroup libusb_desc
#  * A structure representing the standard USB endpoint descriptor. This
#  * descriptor is documented in section 9.6.6 of the USB 3.0 specification.
#  * All multiple-byte fields are represented in host-endian format.
#  */
immutable libusb_endpoint_descriptor
	#  Size of this descriptor (in bytes)
	bLength::UInt8

	# /** Descriptor type. Will have value
	#  * \ref libusb_descriptor_type::LIBUSB_DT_ENDPOINT LIBUSB_DT_ENDPOINT in
	#  * this context. */
	bDescriptorType::UInt8

	# /** The address of the endpoint described by this descriptor. Bits 0:3 are
	#  * the endpoint number. Bits 4:6 are reserved. Bit 7 indicates direction,
	#  * see \ref libusb_endpoint_direction.
	#  */
	bEndpointAddress::UInt8

	# /** Attributes which apply to the endpoint when it is configured using
	#  * the bConfigurationValue. Bits 0:1 determine the transfer immutable and
	#  * correspond to \ref libusb_transfer_type. Bits 2:3 are only used for
	#  * isochronous endpoints and correspond to \ref libusb_iso_sync_type.
	#  * Bits 4:5 are also only used for isochronous endpoints and correspond to
	#  * \ref libusb_iso_usage_type. Bits 6:7 are reserved.
	#  */
	bmAttributes::UInt8

	#  Maximum packet size this endpoint is capable of sending/receiving.
	wMaxPacketSize::UInt16

	#  Interval for polling endpoint for data transfers.
	bInterval::UInt8

	# /** For audio devices only: the rate at which synchronization feedback
	#  * is provided. */
	bRefresh::UInt8

	#  For audio devices only: the address if the synch endpoint
	bSynchAddress::UInt8

	# /** Extra descriptors. If libusb encounters unknown endpoint descriptors,
	#  * it will store them here, should you wish to parse them. */
	extra::Ptr{UInt8}

	#  Length of the extra descriptors, in bytes.
	extra_length::Cint

    libusb_endpoint_descriptor() = new(0,0,0,0,0,0,0,0,0,0)
end

# /** \ingroup libusb_desc
#  * A structure representing the standard USB interface descriptor. This
#  * descriptor is documented in section 9.6.5 of the USB 3.0 specification.
#  * All multiple-byte fields are represented in host-endian format.
#  */
immutable libusb_interface_descriptor
	#  Size of this descriptor (in bytes)
	bLength::UInt8

	# /** Descriptor type. Will have value
	#  * \ref libusb_descriptor_type::LIBUSB_DT_INTERFACE LIBUSB_DT_INTERFACE
	#  * in this context. */
	bDescriptorType::UInt8

	#  Number of this interface
	bInterfaceNumber::UInt8

	#  Value used to select this alternate setting for this interface
	bAlternateSetting::UInt8

	# /** Number of endpoints used by this interface (excluding the control
	#  * endpoint). */
	bNumEndpoints::UInt8

	#  USB-IF class code for this interface. See \ref libusb_class_code.
	bInterfaceClass::UInt8

	# /** USB-IF subclass code for this interface, qualified by the
	#  * bInterfaceClass value */
	bInterfaceSubClass::UInt8

	# /** USB-IF protocol code for this interface, qualified by the
	#  * bInterfaceClass and bInterfaceSubClass values */
	bInterfaceProtocol::UInt8

	#  Index of string descriptor describing this interface
	iInterface::UInt8

	# /** Array of endpoint descriptors. This length of this array is determined
	#  * by the bNumEndpoints field. */
    endpoint::Ptr{libusb_endpoint_descriptor}

	# /** Extra descriptors. If libusb encounters unknown interface descriptors,
	#  * it will store them here, should you wish to parse them. */
	extra::Ptr{UInt8}

	#  Length of the extra descriptors, in bytes.
	extra_length::Cint

    libusb_interface_descriptor() = new(0,0,0,0,0,0,0,0,0,0,0,0)
end

# /** \ingroup libusb_desc
#  * A collection of alternate settings for a particular USB interface.
#  */
immutable libusb_interface
	# /** Array of interface descriptors. The length of this array is determined
	#  * by the num_altsetting field. */
	altsetting::Ptr{libusb_interface_descriptor}

	#  The number of alternate settings that belong to this interface
	num_altsetting::Cint

    libusb_interface() = new(0,0)
end

# /** \ingroup libusb_desc
#  * A structure representing the standard USB configuration descriptor. This
#  * descriptor is documented in section 9.6.3 of the USB 3.0 specification.
#  * All multiple-byte fields are represented in host-endian format.
#  */
immutable libusb_config_descriptor
	#  Size of this descriptor (in bytes)
	bLength::UInt8

	# /** Descriptor type. Will have value
	#  * \ref libusb_descriptor_type::LIBUSB_DT_CONFIG LIBUSB_DT_CONFIG
	#  * in this context. */
	bDescriptorType::UInt8

	#  Total length of data returned for this configuration
	wTotalLength::UInt16

	#  Number of interfaces supported by this configuration
	bNumInterfaces::UInt8

	#  Identifier value for this configuration
	bConfigurationValue::UInt8

	#  Index of string descriptor describing this configuration
	iConfiguration::UInt8

	#  Configuration characteristics
	bmAttributes::UInt8

	# /** Maximum power consumption of the USB device from this bus in this
	#  * configuration when the device is fully operation. Expressed in units
	#  * of 2 mA when the device is operating in high-speed mode and in units
	#  * of 8 mA when the device is operating in super-speed mode. */
	MaxPower::UInt8

	# /** Array of interfaces supported by this configuration. The length of
	#  * this array is determined by the bNumInterfaces field. */
    interface::Ptr{libusb_interface}

	# /** Extra descriptors. If libusb encounters unknown configuration
	#  * descriptors, it will store them here, should you wish to parse them. */
	extra::Ptr{UInt8}

	#  Length of the extra descriptors, in bytes.
	extra_length::Cint

    libusb_config_descriptor() = new(0,0,0,0,0,0,0,0,0,0,0)
end

# /** \ingroup libusb_desc
#  * A structure representing the superspeed endpoint companion
#  * descriptor. This descriptor is documented in section 9.6.7 of
#  * the USB 3.0 specification. All multiple-byte fields are represented in
#  * host-endian format.
#  */
immutable libusb_ss_endpoint_companion_descriptor

	#  Size of this descriptor (in bytes)
	bLength::UInt8

	# /** Descriptor type. Will have value
	#  * \ref libusb_descriptor_type::LIBUSB_DT_SS_ENDPOINT_COMPANION in
	#  * this context. */
	bDescriptorType::UInt8


	# /** The maximum number of packets the endpoint can send or
	#  *  receive as part of a burst. */
	bMaxBurst::UInt8

	# /** In bulk EP:	bits 4:0 represents the	maximum	number of
	#  *  streams the	EP supports. In	isochronous EP:	bits 1:0
	#  *  represents the Mult	- a zero based value that determines
	#  *  the	maximum	number of packets within a service interval  */
	bmAttributes::UInt8

	# /** The	total number of bytes this EP will transfer every
	#  *  service interval. valid only for periodic EPs. */
	wBytesPerInterval::UInt16

    libusb_ss_endpoint_companion_descriptor() = new(0,0,0,0,0)
end

# /** \ingroup libusb_desc
#  * A generic representation of a BOS Device Capability descriptor. It is
#  * advised to check bDevCapabilityType and call the matching
#  * libusb_get_*_descriptor function to get a structure fully matching the type.
#  */
immutable libusb_bos_dev_capability_descriptor
	#  Size of this descriptor (in bytes)
	bLength::UInt8
	# /** Descriptor type. Will have value
	#  * \ref libusb_descriptor_type::LIBUSB_DT_DEVICE_CAPABILITY
	#  * LIBUSB_DT_DEVICE_CAPABILITY in this context. */
	bDescriptorType::UInt8
	#  Device Capability type
	bDevCapabilityType::UInt8
	#  Device Capability data (bLength - 3 bytes)
	dev_capability_data::Ptr{UInt8}

    libusb_bos_dev_capability_descriptor() = new(0,0,0,0)
end

# /** \ingroup libusb_desc
#  * A structure representing the Binary Device Object Store (BOS) descriptor.
#  * This descriptor is documented in section 9.6.2 of the USB 3.0 specification.
#  * All multiple-byte fields are represented in host-endian format.
#  */
immutable libusb_bos_descriptor
	#  Size of this descriptor (in bytes)
	bLength::UInt8

	# /** Descriptor type. Will have value
	#  * \ref libusb_descriptor_type::LIBUSB_DT_BOS LIBUSB_DT_BOS
	#  * in this context. */
	bDescriptorType::UInt8

	#  Length of this descriptor and all of its sub descriptors
	wTotalLength::UInt16

	# /** The number of separate device capability descriptors in
	#  * the BOS */
	bNumDeviceCaps::UInt8

	#  bNumDeviceCap Device Capability Descriptors
    dev_capability::Ptr{libusb_bos_dev_capability_descriptor}

    libusb_bos_descriptor() = new(0,0,0,0,0)
end

# /** \ingroup libusb_desc
#  * A structure representing the USB 2.0 Extension descriptor
#  * This descriptor is documented in section 9.6.2.1 of the USB 3.0 specification.
#  * All multiple-byte fields are represented in host-endian format.
#  */
immutable libusb_usb_2_0_extension_descriptor
	#  Size of this descriptor (in bytes)
	bLength::UInt8

	# /** Descriptor type. Will have value
	#  * \ref libusb_descriptor_type::LIBUSB_DT_DEVICE_CAPABILITY
	#  * LIBUSB_DT_DEVICE_CAPABILITY in this context. */
	bDescriptorType::UInt8

	# /** Capability type. Will have value
	#  * \ref libusb_capability_type::LIBUSB_BT_USB_2_0_EXTENSION
	#  * LIBUSB_BT_USB_2_0_EXTENSION in this context. */
	bDevCapabilityType::UInt8

	# /** Bitmap encoding of supported device level features.
	#  * A value of one in a bit location indicates a feature is
	#  * supported; a value of zero indicates it is not supported.
	#  * See \ref libusb_usb_2_0_extension_attributes. */
	 bmAttributes::UInt32

     libusb_usb_2_0_extension_descriptor() = new(0,0,0,0)
end

# /** \ingroup libusb_desc
#  * A structure representing the SuperSpeed USB Device Capability descriptor
#  * This descriptor is documented in section 9.6.2.2 of the USB 3.0 specification.
#  * All multiple-byte fields are represented in host-endian format.
#  */
immutable libusb_ss_usb_device_capability_descriptor
	#  Size of this descriptor (in bytes)
	bLength::UInt8

	# /** Descriptor type. Will have value
	#  * \ref libusb_descriptor_type::LIBUSB_DT_DEVICE_CAPABILITY
	#  * LIBUSB_DT_DEVICE_CAPABILITY in this context. */
	bDescriptorType::UInt8

	# /** Capability type. Will have value
	#  * \ref libusb_capability_type::LIBUSB_BT_SS_USB_DEVICE_CAPABILITY
	#  * LIBUSB_BT_SS_USB_DEVICE_CAPABILITY in this context. */
	bDevCapabilityType::UInt8

	# /** Bitmap encoding of supported device level features.
	#  * A value of one in a bit location indicates a feature is
	#  * supported; a value of zero indicates it is not supported.
	#  * See \ref libusb_ss_usb_device_capability_attributes. */
	bmAttributes::UInt8

	# /** Bitmap encoding of the speed supported by this device when
	#  * operating in SuperSpeed mode. See \ref libusb_supported_speed. */
	wSpeedSupported::UInt16

	# /** The lowest speed at which all the functionality supported
	#  * by the device is available to the user. For example if the
	#  * device supports all its functionality when connected at
	#  * full speed and above then it sets this value to 1. */
	bFunctionalitySupport::UInt8

	#  U1 Device Exit Latency.
	bU1DevExitLat::UInt8

	#  U2 Device Exit Latency.
	bU2DevExitLat::UInt16

    libusb_ss_usb_device_capability_descriptor() = new(0,0,0,0,0,0,0,0)
end

# /** \ingroup libusb_desc
#  * A structure representing the Container ID descriptor.
#  * This descriptor is documented in section 9.6.2.3 of the USB 3.0 specification.
#  * All multiple-byte fields, except UUIDs, are represented in host-endian format.
#  */
immutable libusb_container_id_descriptor
	#  Size of this descriptor (in bytes)
	bLength::UInt8

	# /** Descriptor type. Will have value
	#  * \ref libusb_descriptor_type::LIBUSB_DT_DEVICE_CAPABILITY
	#  * LIBUSB_DT_DEVICE_CAPABILITY in this context. */
	bDescriptorType::UInt8

	# /** Capability type. Will have value
	#  * \ref libusb_capability_type::LIBUSB_BT_CONTAINER_ID
	#  * LIBUSB_BT_CONTAINER_ID in this context. */
	bDevCapabilityType::UInt8

	#  Reserved field
	bReserved::UInt8

	#  128 bit UUID
    ContainerID::NTuple{16, UInt8}

    libusb_container_id_descriptor() = new(0,0,0,0,ntuple(x->0,16))
end

# /** \ingroup libusb_asyncio
#  * Setup packet for control transfers. */
immutable libusb_control_setup
	# /** Request type. Bits 0:4 determine recipient, see
	#  * \ref libusb_request_recipient. Bits 5:6 determine type, see
	#  * \ref libusb_request_type. Bit 7 determines data transfer direction, see
	#  * \ref libusb_endpoint_direction.
	#  */
	bmRequestType::UInt8

	# /** Request. If the immutable bits of bmRequestType are equal to
	#  * \ref libusb_request_type::LIBUSB_REQUEST_TYPE_STANDARD
	#  * "LIBUSB_REQUEST_TYPE_STANDARD" then this field refers to
	#  * \ref libusb_standard_request. For other cases, use of this field is
	#  * application-specific. */
	bRequest::UInt8

	#  Value. Varies according to request
	wValue::UInt16

	# /** Index. Varies according to request, typically used to pass an index
	#  * or offset */
	wIndex::UInt16

	#  Number of bytes to transfer
	wLength::UInt16

    libusb_control_setup() = new(0,0,0,0,0)
end

const LIBUSB_CONTROL_SETUP_SIZE = sizeof(libusb_control_setup)

# libusb

immutable libusb_context end
immutable libusb_device end
immutable libusb_device_handle end

# /** \ingroup libusb_lib
#  * Structure providing the version of the libusb runtime
#  */
immutable libusb_version
	#  Library major version.
	major::UInt16

	#  Library minor version.
	minor::UInt16

	#  Library micro version.
	micro::UInt16

	#  Library nano version.
	nano::UInt16

	#  Library release candidate suffix string, e.g. "-rc4".
	rc::Ptr{UInt8}

	#  For ABI compatibility only.
	describe::Ptr{UInt8}

    libusb_version() = new(0,0,0,0,0,0)
end

# /** \ingroup libusb_lib
#  * Structure representing a libusb session. The concept of individual libusb
#  * sessions allows for your program to use two libraries (or dynamically
#  * load two modules) which both independently use libusb. This will prevent
#  * interference between the individual libusb users - for example
#  * libusb_set_debug() will not affect the other user of the library, and
#  * libusb_exit() will not destroy resources that the other user is still
#  * using.
#  *
#  * Sessions are created by libusb_init() and destroyed through libusb_exit().
#  * If your application is guaranteed to only ever include a single libusb
#  * user (i.e. you), you do not have to worry about contexts: pass NULL in
#  * every function call where a context is required. The default context
#  * will be used.
#  *
#  * For more information, see \ref libusb_contexts.
#  */
# typedef struct libusb_context libusb_context;

# /** \ingroup libusb_dev
#  * Structure representing a USB device detected on the system. This is an
#  * opaque immutable for which you are only ever provided with a pointer, usually
#  * originating from libusb_get_device_list().
#  *
#  * Certain operations can be performed on a device, but in order to do any
#  * I/O you will have to first obtain a device handle using libusb_open().
#  *
#  * Devices are reference counted with libusb_ref_device() and
#  * libusb_unref_device(), and are freed when the reference count reaches 0.
#  * New devices presented by libusb_get_device_list() have a reference count of
#  * 1, and libusb_free_device_list() can optionally decrease the reference count
#  * on all devices in the list. libusb_open() adds another reference which is
#  * later destroyed by libusb_close().
#  */
# typedef struct libusb_device libusb_device;


# /** \ingroup libusb_dev
#  * Structure representing a handle on a USB device. This is an opaque immutable for
#  * which you are only ever provided with a pointer, usually originating from
#  * libusb_open().
#  *
#  * A device handle is used to perform I/O and other operations. When finished
#  * with a device handle, you should call libusb_close().
#  */
# typedef struct libusb_device_handle libusb_device_handle;

# /** \ingroup libusb_dev
#  * Speed codes. Indicates the speed at which the device is operating.
#  */
@enum(libusb_speed,
	#  The OS doesn't report or know the device speed.
	LIBUSB_SPEED_UNKNOWN = 0,

	#  The device is operating at low speed (1.5MBit/s).
	LIBUSB_SPEED_LOW = 1,

	#  The device is operating at full speed (12MBit/s).
	LIBUSB_SPEED_FULL = 2,

	#  The device is operating at high speed (480MBit/s).
	LIBUSB_SPEED_HIGH = 3,

	#  The device is operating at super speed (5000MBit/s).
	LIBUSB_SPEED_SUPER = 4,
)

# /** \ingroup libusb_dev
#  * Supported speeds (wSpeedSupported) bitfield. Indicates what
#  * speeds the device supports.
#  */
@enum(libusb_supported_speed,
	#  Low speed operation supported (1.5MBit/s).
	LIBUSB_LOW_SPEED_OPERATION   = 1,

	#  Full speed operation supported (12MBit/s).
	LIBUSB_FULL_SPEED_OPERATION  = 2,

	#  High speed operation supported (480MBit/s).
	LIBUSB_HIGH_SPEED_OPERATION  = 4,

	#  Superspeed operation supported (5000MBit/s).
	LIBUSB_SUPER_SPEED_OPERATION = 8,
)

# /** \ingroup libusb_dev
#  * Masks for the bits of the
#  * \ref libusb_usb_2_0_extension_descriptor::bmAttributes "bmAttributes" field
#  * of the USB 2.0 Extension descriptor.
#  */
@enum(libusb_usb_2_0_extension_attributes,
	#  Supports Link Power Management (LPM)
	LIBUSB_BM_LPM_SUPPORT = 2,
)

# /** \ingroup libusb_dev
#  * Masks for the bits of the
#  * \ref libusb_ss_usb_device_capability_descriptor::bmAttributes "bmAttributes" field
#  * field of the SuperSpeed USB Device Capability descriptor.
#  */
@enum(libusb_ss_usb_device_capability_attributes,
	#  Supports Latency Tolerance Messages (LTM)
	LIBUSB_BM_LTM_SUPPORT = 2,
)

# /** \ingroup libusb_dev
#  * USB capability types
#  */
@enum(libusb_bos_type,
	#  Wireless USB device capability
	LIBUSB_BT_WIRELESS_USB_DEVICE_CAPABILITY	= 1,

	#  USB 2.0 extensions
	LIBUSB_BT_USB_2_0_EXTENSION			= 2,

	#  SuperSpeed USB device capability
	LIBUSB_BT_SS_USB_DEVICE_CAPABILITY		= 3,

	#  Container ID type
	LIBUSB_BT_CONTAINER_ID				= 4,
)

# /** \ingroup libusb_misc
#  * Error codes. Most libusb functions return 0 on success or one of these
#  * codes on failure.
#  * You can call libusb_error_name() to retrieve a string representation of an
#  * error code or libusb_strerror() to get an end-user suitable description of
#  * an error code.
#  */
@enum(libusb_error,
	#  Success (no error)
	LIBUSB_SUCCESS = 0,

	#  Input/output error
	LIBUSB_ERROR_IO = -1,

	#  Invalid parameter
	LIBUSB_ERROR_INVALID_PARAM = -2,

	#  Access denied (insufficient permissions)
	LIBUSB_ERROR_ACCESS = -3,

	#  No such device (it may have been disconnected)
	LIBUSB_ERROR_NO_DEVICE = -4,

	#  Entity not found
	LIBUSB_ERROR_NOT_FOUND = -5,

	#  Resource busy
	LIBUSB_ERROR_BUSY = -6,

	#  Operation timed out
	LIBUSB_ERROR_TIMEOUT = -7,

	#  Overflow
	LIBUSB_ERROR_OVERFLOW = -8,

	#  Pipe error
	LIBUSB_ERROR_PIPE = -9,

	#  System call interrupted (perhaps due to signal)
	LIBUSB_ERROR_INTERRUPTED = -10,

	#  Insufficient memory
	LIBUSB_ERROR_NO_MEM = -11,

	#  Operation not supported or unimplemented on this platform
	LIBUSB_ERROR_NOT_SUPPORTED = -12,

	# /* NB: Remember to update LIBUSB_ERROR_COUNT below as well as the
	#    message strings in strerror.c when adding new error codes here. */

	#  Other error
	LIBUSB_ERROR_OTHER = -99,
)

# Total number of error codes in enum libusb_error
const LIBUSB_ERROR_COUNT = 14

# /** \ingroup libusb_asyncio
#  * Transfer status codes */
@enum(libusb_transfer_status,
	# /** Transfer completed without error. Note that this does not indicate
	#  * that the entire amount of requested data was transferred. */
	LIBUSB_TRANSFER_COMPLETED,

	#  Transfer failed
	LIBUSB_TRANSFER_ERROR,

	#  Transfer timed out
	LIBUSB_TRANSFER_TIMED_OUT,

	#  Transfer was cancelled
	LIBUSB_TRANSFER_CANCELLED,

	# /** For bulk/interrupt endpoints: halt condition detected (endpoint
	#  * stalled). For control endpoints: control request not supported. */
	LIBUSB_TRANSFER_STALL,

	#  Device was disconnected
	LIBUSB_TRANSFER_NO_DEVICE,

	#  Device sent more data than requested
	LIBUSB_TRANSFER_OVERFLOW,

	# /* NB! Remember to update libusb_error_name()
	#    when adding new status codes here. */
)

# /** \ingroup libusb_asyncio
#  * libusb_transfer.flags values */
@enum(libusb_transfer_flags,
	#  Report short frames as errors
	LIBUSB_TRANSFER_SHORT_NOT_OK = 1<<0,

	# /** Automatically free() transfer buffer during libusb_free_transfer().
	#  * Note that buffers allocated with libusb_dev_mem_alloc() should not
	#  * be attempted freed in this way, since free() is not an appropriate
	#  * way to release such memory. */
	LIBUSB_TRANSFER_FREE_BUFFER = 1<<1,

	# /** Automatically call libusb_free_transfer() after callback returns.
	#  * If this flag is set, it is illegal to call libusb_free_transfer()
	#  * from your transfer callback, as this will result in a double-free
	#  * when this flag is acted upon. */
	LIBUSB_TRANSFER_FREE_TRANSFER = 1<<2,

	# /** Terminate transfers that are a multiple of the endpoint's
	#  * wMaxPacketSize with an extra zero length packet. This is useful
	#  * when a device protocol mandates that each logical request is
	#  * terminated by an incomplete packet (i.e. the logical requests are
	#  * not separated by other means).
	#  *
	#  * This flag only affects host-to-device transfers to bulk and interrupt
	#  * endpoints. In other situations, it is ignored.
	#  *
	#  * This flag only affects transfers with a length that is a multiple of
	#  * the endpoint's wMaxPacketSize. On transfers of other lengths, this
	#  * flag has no effect. Therefore, if you are working with a device that
	#  * needs a ZLP whenever the end of the logical request falls on a packet
	#  * boundary, then it is sensible to set this flag on <em>every</em>
	#  * transfer (you do not have to worry about only setting it on transfers
	#  * that end on the boundary).
	#  *
	#  * This flag is currently only supported on Linux.
	#  * On other systems, libusb_submit_transfer() will return
	#  * LIBUSB_ERROR_NOT_SUPPORTED for every transfer where this flag is set.
	#  *
	#  * Available since libusb-1.0.9.
	#  */
	LIBUSB_TRANSFER_ADD_ZERO_PACKET = 1 << 3,
)

# /** \ingroup libusb_asyncio
#  * Isochronous packet descriptor. */
immutable libusb_iso_packet_descriptor
	#  Length of data to request in this packet
	length::Cuint

	#  Amount of data that was actually transferred
	actual_length::Cuint

	#  Status code for this packet
    status::libusb_transfer_status

    libusb_iso_packet_descriptor() = (x = new(); x.status = libusb_transfer_status(); return x)
end

# /** \ingroup libusb_asyncio
#  * Asynchronous transfer callback function type. When submitting asynchronous
#  * transfers, you pass a pointer to a callback function of this immutable via the
#  * \ref libusb_transfer::callback "callback" member of the libusb_transfer
#  * structure. libusb will call this function later, when the transfer has
#  * completed or failed. See \ref libusb_asyncio for more information.
#  * \param transfer The libusb_transfer struct the callback function is being
#  * notified about.
#  */
# typedef Void (*libusb_transfer_cb_fn)(struct libusb_transfer *transfer);

# /** \ingroup libusb_asyncio
#  * The generic USB transfer structure. The user populates this structure and
#  * then submits it in order to request a transfer. After the transfer has
#  * completed, the library populates the transfer with the results and passes
#  * it back to the user.
#  */
immutable libusb_transfer
	#  Handle of the device that this transfer will be submitted to
    dev_handle::Ptr{libusb_device_handle}

	#  A bitwise OR combination of \ref libusb_transfer_flags.
	flags::UInt8

	#  Address of the endpoint where this transfer will be sent.
	endpoint::UInt8

	#  Type of the endpoint from \ref libusb_transfer_type
	_type::UInt8

	# /** Timeout for this transfer in milliseconds. A value of 0 indicates no
	#  * timeout. */
	timeout::Cuint

	# /** The status of the transfer. Read-only, and only for use within
	#  * transfer callback function.
	#  *
	#  * If this is an isochronous transfer, this field may read COMPLETED even
	#  * if there were errors in the frames. Use the
	#  * \ref libusb_iso_packet_descriptor::status "status" field in each packet
	#  * to determine if errors occurred. */
	status::libusb_transfer_status

	#  Length of the data buffer
	length::Cint

	# /** Actual length of data that was transferred. Read-only, and only for
	#  * use within transfer callback function. Not valid for isochronous
	#  * endpoint transfers. */
	actual_length::Cint

	# /** Callback function. This will be invoked when the transfer completes,
	#  * fails, or is cancelled. */
    #TODO
    callback::Function
	# libusb_transfer_cb_fn callback;

	#  User context data to pass to the callback function.
    user_data::Any

	#  Data buffer
	buffer::String

	# /** Number of isochronous packets. Only used for I/O with isochronous
	#  * endpoints. */
	num_iso_packets::Cint

	#  Isochronous packet descriptors, for isochronous transfers only.
    iso_packet_desc::Vector{libusb_iso_packet_descriptor}

    function libusb_transfer()
        x = new()
        x.status = libusb_transfer_status()
        x.callback = x->x
        x.buffer = ""
        x.iso_packet_desc = libusb_iso_packet_descriptor[]
        return x
    end
end

# /** \ingroup libusb_misc
#  * Capabilities supported by an instance of libusb on the current running
#  * platform. Test if the loaded library supports a given capability by calling
#  * \ref libusb_has_capability().
#  */
@enum(libusb_capability,
	#  The libusb_has_capability() API is available.
	LIBUSB_CAP_HAS_CAPABILITY = 0x0000,
	#  Hotplug support is available on this platform.
	LIBUSB_CAP_HAS_HOTPLUG = 0x0001,
	# /** The library can access HID devices without requiring user intervention.
	#  * Note that before being able to actually access an HID device, you may
	#  * still have to call additional libusb functions such as
	#  * \ref libusb_detach_kernel_driver(). */
	LIBUSB_CAP_HAS_HID_ACCESS = 0x0100,
	# /** The library supports detaching of the default USB driver, using
	#  * \ref libusb_detach_kernel_driver(), if one is set by the OS kernel */
	LIBUSB_CAP_SUPPORTS_DETACH_KERNEL_DRIVER = 0x0101
)

# /** \ingroup libusb_lib
#  *  Log message levels.
#  *  - LIBUSB_LOG_LEVEL_NONE (0)    : no messages ever printed by the library (default)
#  *  - LIBUSB_LOG_LEVEL_ERROR (1)   : error messages are printed to stderr
#  *  - LIBUSB_LOG_LEVEL_WARNING (2) : warning and error messages are printed to stderr
#  *  - LIBUSB_LOG_LEVEL_INFO (3)    : informational messages are printed to stdout, warning
#  *    and error messages are printed to stderr
#  *  - LIBUSB_LOG_LEVEL_DEBUG (4)   : debug and informational messages are printed to stdout,
#  *    warnings and errors to stderr
#  */
@enum(libusb_log_level,
	LIBUSB_LOG_LEVEL_NONE = 0,
	LIBUSB_LOG_LEVEL_ERROR,
	LIBUSB_LOG_LEVEL_WARNING,
	LIBUSB_LOG_LEVEL_INFO,
	LIBUSB_LOG_LEVEL_DEBUG,
)

macro c(ret, f, argtypes, args...)
    if is_windows()
        return esc(quote
            function $f($(args...))
                ccall(($(QuoteNode(f)), :libusb), stdcall, $ret, $argtypes, $(args...))
            end
        end)
    else
        return esc(quote
            function $f($(args...))
                ccall(($(QuoteNode(f)), :libusb), $ret, $argtypes, $(args...))
            end
        end)
    end
end

function __init__()
    global const libusb = Libdl.dlopen("libusb")
    global const ctxRef = Ref{Ptr{libusb_context}}()
    libusb_init(ctxRef)
    global const ctx = ctxRef[]
    finalizer(ctxRef, x->libusb_exit(ctx))
    global const version = libusb_get_version()
end

@c Cint libusb_init (Ref{Ptr{libusb_context}},) ctx
@c Void libusb_exit (Ptr{libusb_context},) ctx
# Void libusb_set_debug(ctx::Ptr{libusb_context}, level::Cint);
@c libusb_version libusb_get_version ()
# int libusb_has_capability(capability::UInt32);
# const char * libusb_error_name(errcode::Cint);
# int libusb_setlocale(locale::String);
# const char * libusb_strerror(errcode::libusb_error);
#

@c Cssize_t libusb_get_device_list (Ptr{libusb_context}, Ref{Ptr{Ptr{libusb_device}}}) ctx list
@c Void libusb_free_device_list (Ptr{Ptr{libusb_device}}, Cint) list unref_devices

# libusb_device * libusb_ref_device(dev::Ptr{libusb_device});
# Void libusb_unref_device(dev::Ptr{libusb_device});
#
# int libusb_get_configuration(dev::Ptr{libusb_device_handle},
# 	config::Ref{Cint});
@c Cint libusb_get_device_descriptor (Ptr{libusb_device}, Ref{libusb_device_descriptor}) dev desc

# int libusb_get_active_config_descriptor(dev::Ptr{libusb_device},
# 	config::Ref{libusb_config_descriptor});
@c Cint libusb_get_config_descriptor (Ptr{libusb_device}, UInt8, Ref{libusb_config_descriptor}) dev config_index config
# int libusb_get_config_descriptor_by_value(dev::Ptr{libusb_device},
# 	bConfigurationValue::UInt8, config::Ref{libusb_config_descriptor});
# Void libusb_free_config_descriptor(config::libusb_config_descriptor);
# int libusb_get_ss_endpoint_companion_descriptor(
# 	ctx::Ptr{libusb_context},
# 	endpoint::libusb_endpoint_descriptor,
# 	ep_comp::Ref{libusb_ss_endpoint_companion_descriptor});
# Void libusb_free_ss_endpoint_companion_descriptor(
# 	ep_comp::libusb_ss_endpoint_companion_descriptor);
# int libusb_get_bos_descriptor(dev_handle::Ptr{libusb_device_handle},
# 	bos::Ref{libusb_bos_descriptor});
# Void libusb_free_bos_descriptor(bos::libusb_bos_descriptor);
# int libusb_get_usb_2_0_extension_descriptor(
# 	ctx::Ptr{libusb_context},
# 	dev_cap::libusb_bos_dev_capability_descriptor,
# 	usb_2_0_extension::Ref{libusb_usb_2_0_extension_descriptor});
# Void libusb_free_usb_2_0_extension_descriptor(
# 	usb_2_0_extension::libusb_usb_2_0_extension_descriptor);
# int libusb_get_ss_usb_device_capability_descriptor(
# 	ctx::Ptr{libusb_context},
# 	dev_cap::libusb_bos_dev_capability_descriptor,
# 	ss_usb_device_cap::Ref{libusb_ss_usb_device_capability_descriptor});
# Void libusb_free_ss_usb_device_capability_descriptor(
# 	ss_usb_device_cap::libusb_ss_usb_device_capability_descriptor);
# int libusb_get_container_id_descriptor(ctx::Ptr{libusb_context},
# 	dev_cap::libusb_bos_dev_capability_descriptor,
# 	container_id::Ref{libusb_container_id_descriptor});
# Void libusb_free_container_id_descriptor(
# 	container_id::libusb_container_id_descriptor);
# uint8_t libusb_get_bus_number(dev::Ptr{libusb_device});
# uint8_t libusb_get_port_number(dev::Ptr{libusb_device});
# int libusb_get_port_numbers(dev::Ptr{libusb_device}, port_numbers::Ref{UInt8}, port_numbers_len::Cint);
# # LIBUSB_DEPRECATED_FOR(libusb_get_port_numbers)
# int libusb_get_port_path(ctx::Ptr{libusb_context}, dev::Ptr{libusb_device}, path::Vector{UInt8}, uint8_t path_length::UInt8);
# libusb_device * libusb_get_parent(dev::Ptr{libusb_device});
# uint8_t libusb_get_device_address(dev::Ptr{libusb_device});
# int libusb_get_device_speed(dev::Ptr{libusb_device});
# int libusb_get_max_packet_size(dev::Ptr{libusb_device},
# 	endpoint::UInt8);
# int libusb_get_max_iso_packet_size(dev::Ptr{libusb_device},
# 	endpoint::UInt8);
#
# int libusb_open(dev::Ptr{libusb_device}, dev_handle::Ref{libusb_device_handle});
# Void libusb_close(dev_handle::Ptr{libusb_device_handle});
# libusb_device * libusb_get_device(dev_handle::Ptr{libusb_device_handle});
#
# int libusb_set_configuration(dev_handle::Ptr{libusb_device_handle},
# 	configuration::Cint);
# int libusb_claim_interface(dev_handle::Ptr{libusb_device_handle},
# 	interface_number::Cint);
# int libusb_release_interface(dev_handle::Ptr{libusb_device_handle},
# 	interface_number::Cint);
#
# libusb_device_handle * libusb_open_device_with_vid_pid(
# 	ctx::Ptr{libusb_context}, vendor_id::UInt16, product_id::UInt16);
#
# int libusb_set_interface_alt_setting(dev_handle::Ptr{libusb_device_handle},
# 	interface_number::Cint, alternate_setting::Cint);
# int libusb_clear_halt(dev_handle::Ptr{libusb_device_handle},
# 	endpoint::UInt8);
# int libusb_reset_device(dev_handle::Ptr{libusb_device_handle});
#
# int libusb_alloc_streams(dev_handle::Ptr{libusb_device_handle},
# 	num_streams::UInt32, endpoints::Vector{UInt8}, num_endpoints::Cint);
# int libusb_free_streams(dev_handle::Ptr{libusb_device_handle},
# 	endpoints::Vector{UInt8}, num_endpoints::Cint);
#
# unsigned char * libusb_dev_mem_alloc(dev_handle::Ptr{libusb_device_handle},
# 	length::Csize_t);
# int libusb_dev_mem_free(dev_handle::Ptr{libusb_device_handle},
# 	buffer::Vector{UInt8}, length::Csize_t);
#
# int libusb_kernel_driver_active(dev_handle::Ptr{libusb_device_handle},
# 	interface_number::Cint);
# int libusb_detach_kernel_driver(dev_handle::Ptr{libusb_device_handle},
# 	interface_number::Cint);
# int libusb_attach_kernel_driver(dev_handle::Ptr{libusb_device_handle},
# 	interface_number::Cint);
# int libusb_set_auto_detach_kernel_driver(
# 	dev_handle::Ptr{libusb_device_handle}, enable::Cint);

# async I/O

# /** \ingroup libusb_asyncio
#  * Get the data section of a control transfer. This convenience function is here
#  * to remind you that the data does not start until 8 bytes into the actual
#  * buffer, as the setup packet comes first.
#  *
#  * Calling this function only makes sense from a transfer callback function,
#  * or situations where you have already allocated a suitably sized buffer at
#  * transfer->buffer.
#  *
#  * \param transfer a transfer
#  * \returns pointer to the first byte of the data section
#  */
# static inline unsigned char *libusb_control_transfer_get_data(
# 	struct libusb_transfer *transfer)
# {
# 	return transfer->buffer + LIBUSB_CONTROL_SETUP_SIZE;
# }

# /** \ingroup libusb_asyncio
#  * Get the control setup packet of a control transfer. This convenience
#  * function is here to remind you that the control setup occupies the first
#  * 8 bytes of the transfer data buffer.
#  *
#  * Calling this function only makes sense from a transfer callback function,
#  * or situations where you have already allocated a suitably sized buffer at
#  * transfer->buffer.
#  *
#  * \param transfer a transfer
#  * \returns a casted pointer to the start of the transfer data buffer
#  */
# static inline struct libusb_control_setup *libusb_control_transfer_get_setup(
# 	struct libusb_transfer *transfer)
# {
# 	return (struct libusb_control_setup *)(Void *) transfer->buffer;
# }

# /** \ingroup libusb_asyncio
#  * Helper function to populate the setup packet (first 8 bytes of the data
#  * buffer) for a control transfer. The wIndex, wValue and wLength values should
#  * be given in host-endian byte order.
#  *
#  * \param buffer buffer to output the setup packet into
#  * This pointer must be aligned to at least 2 bytes boundary.
#  * \param bmRequestType see the
#  * \ref libusb_control_setup::bmRequestType "bmRequestType" field of
#  * \ref libusb_control_setup
#  * \param bRequest see the
#  * \ref libusb_control_setup::bRequest "bRequest" field of
#  * \ref libusb_control_setup
#  * \param wValue see the
#  * \ref libusb_control_setup::wValue "wValue" field of
#  * \ref libusb_control_setup
#  * \param wIndex see the
#  * \ref libusb_control_setup::wIndex "wIndex" field of
#  * \ref libusb_control_setup
#  * \param wLength see the
#  * \ref libusb_control_setup::wLength "wLength" field of
#  * \ref libusb_control_setup
#  */
# static inline Void libusb_fill_control_setup(unsigned char *buffer,
# 	uint8_t bmRequestType, uint8_t bRequest, uint16_t wValue, uint16_t wIndex,
# 	uint16_t wLength)
# {
# 	struct libusb_control_setup *setup = (struct libusb_control_setup *)(Void *) buffer;
# 	setup->bmRequestType = bmRequestType;
# 	setup->bRequest = bRequest;
# 	setup->wValue = libusb_cpu_to_le16(wValue);
# 	setup->wIndex = libusb_cpu_to_le16(wIndex);
# 	setup->wLength = libusb_cpu_to_le16(wLength);
# }
#
# struct libusb_transfer * libusb_alloc_transfer(iso_packets::Cint);
# int libusb_submit_transfer(transfer::libusb_transfer);
# int libusb_cancel_transfer(transfer::libusb_transfer);
# Void libusb_free_transfer(transfer::libusb_transfer);
# Void libusb_transfer_set_stream_id(
# 	transfer::libusb_transfer, stream_id::UInt32);
# uint32_t libusb_transfer_get_stream_id(
# 	transfer::libusb_transfer);

# /** \ingroup libusb_asyncio
#  * Helper function to populate the required \ref libusb_transfer fields
#  * for a control transfer.
#  *
#  * If you pass a transfer buffer to this function, the first 8 bytes will
#  * be interpreted as a control setup packet, and the wLength field will be
#  * used to automatically populate the \ref libusb_transfer::length "length"
#  * field of the transfer. Therefore the recommended approach is:
#  * -# Allocate a suitably sized data buffer (including space for control setup)
#  * -# Call libusb_fill_control_setup()
#  * -# If this is a host-to-device transfer with a data stage, put the data
#  *    in place after the setup packet
#  * -# Call this function
#  * -# Call libusb_submit_transfer()
#  *
#  * It is also legal to pass a NULL buffer to this function, in which case this
#  * function will not attempt to populate the length field. Remember that you
#  * must then populate the buffer and length fields later.
#  *
#  * \param transfer the transfer to populate
#  * \param dev_handle handle of the device that will handle the transfer
#  * \param buffer data buffer. If provided, this function will interpret the
#  * first 8 bytes as a setup packet and infer the transfer length from that.
#  * This pointer must be aligned to at least 2 bytes boundary.
#  * \param callback callback function to be invoked on transfer completion
#  * \param user_data user data to pass to callback function
#  * \param timeout timeout for the transfer in milliseconds
#  */
# static inline Void libusb_fill_control_transfer(
# 	struct libusb_transfer *transfer, dev_handle::Ptr{libusb_device_handle},
# 	unsigned char *buffer, libusb_transfer_cb_fn callback, Void *user_data,
# 	unsigned int timeout)
# {
# 	struct libusb_control_setup *setup = (struct libusb_control_setup *)(Void *) buffer;
# 	transfer->dev_handle = dev_handle;
# 	transfer->endpo= 0::Cint
# 	transfer->immutable = LIBUSB_TRANSFER_TYPE_CONTROL;
# 	transfer->timeout = timeout;
# 	transfer->buffer = buffer;
# 	if (setup)
# 		transfer->length = (int) (LIBUSB_CONTROL_SETUP_SIZE
# 			+ libusb_le16_to_cpu(setup->wLength));
# 	transfer->user_data = user_data;
# 	transfer->callback = callback;
# }

# /** \ingroup libusb_asyncio
#  * Helper function to populate the required \ref libusb_transfer fields
#  * for a bulk transfer.
#  *
#  * \param transfer the transfer to populate
#  * \param dev_handle handle of the device that will handle the transfer
#  * \param endpoint address of the endpoint where this transfer will be sent
#  * \param buffer data buffer
#  * \param length length of data buffer
#  * \param callback callback function to be invoked on transfer completion
#  * \param user_data user data to pass to callback function
#  * \param timeout timeout for the transfer in milliseconds
#  */
# static inline Void libusb_fill_bulk_transfer(struct libusb_transfer *transfer,
# 	dev_handle::Ptr{libusb_device_handle}, unsigned char endpoint,
# 	unsigned char *buffer, int length, libusb_transfer_cb_fn callback,
# 	Void *user_data, unsigned int timeout)
# {
# 	transfer->dev_handle = dev_handle;
# 	transfer->endpo= endpoint::Cint
# 	transfer->immutable = LIBUSB_TRANSFER_TYPE_BULK;
# 	transfer->timeout = timeout;
# 	transfer->buffer = buffer;
# 	transfer->length = length;
# 	transfer->user_data = user_data;
# 	transfer->callback = callback;
# }

# /** \ingroup libusb_asyncio
#  * Helper function to populate the required \ref libusb_transfer fields
#  * for a bulk transfer using bulk streams.
#  *
#  * Since version 1.0.19, \ref LIBUSB_API_VERSION >= 0x01000103
#  *
#  * \param transfer the transfer to populate
#  * \param dev_handle handle of the device that will handle the transfer
#  * \param endpoint address of the endpoint where this transfer will be sent
#  * \param stream_id bulk stream id for this transfer
#  * \param buffer data buffer
#  * \param length length of data buffer
#  * \param callback callback function to be invoked on transfer completion
#  * \param user_data user data to pass to callback function
#  * \param timeout timeout for the transfer in milliseconds
#  */
# static inline Void libusb_fill_bulk_stream_transfer(
# 	struct libusb_transfer *transfer, dev_handle::Ptr{libusb_device_handle},
# 	unsigned char endpoint, uint32_t stream_id,
# 	unsigned char *buffer, int length, libusb_transfer_cb_fn callback,
# 	Void *user_data, unsigned int timeout)
# {
# 	libusb_fill_bulk_transfer(transfer, dev_handle, endpoint, buffer,
# 				  length, callback, user_data, timeout);
# 	transfer->immutable = LIBUSB_TRANSFER_TYPE_BULK_STREAM;
# 	libusb_transfer_set_stream_id(transfer, stream_id);
# }

# /** \ingroup libusb_asyncio
#  * Helper function to populate the required \ref libusb_transfer fields
#  * for an interrupt transfer.
#  *
#  * \param transfer the transfer to populate
#  * \param dev_handle handle of the device that will handle the transfer
#  * \param endpoint address of the endpoint where this transfer will be sent
#  * \param buffer data buffer
#  * \param length length of data buffer
#  * \param callback callback function to be invoked on transfer completion
#  * \param user_data user data to pass to callback function
#  * \param timeout timeout for the transfer in milliseconds
#  */
# static inline Void libusb_fill_interrupt_transfer(
# 	struct libusb_transfer *transfer, dev_handle::Ptr{libusb_device_handle},
# 	unsigned char endpoint, unsigned char *buffer, int length,
# 	libusb_transfer_cb_fn callback, Void *user_data, unsigned int timeout)
# {
# 	transfer->dev_handle = dev_handle;
# 	transfer->endpo= endpoint::Cint
# 	transfer->immutable = LIBUSB_TRANSFER_TYPE_INTERRUPT;
# 	transfer->timeout = timeout;
# 	transfer->buffer = buffer;
# 	transfer->length = length;
# 	transfer->user_data = user_data;
# 	transfer->callback = callback;
# }

# /** \ingroup libusb_asyncio
#  * Helper function to populate the required \ref libusb_transfer fields
#  * for an isochronous transfer.
#  *
#  * \param transfer the transfer to populate
#  * \param dev_handle handle of the device that will handle the transfer
#  * \param endpoint address of the endpoint where this transfer will be sent
#  * \param buffer data buffer
#  * \param length length of data buffer
#  * \param num_iso_packets the number of isochronous packets
#  * \param callback callback function to be invoked on transfer completion
#  * \param user_data user data to pass to callback function
#  * \param timeout timeout for the transfer in milliseconds
#  */
# static inline Void libusb_fill_iso_transfer(struct libusb_transfer *transfer,
# 	dev_handle::Ptr{libusb_device_handle}, unsigned char endpoint,
# 	unsigned char *buffer, int length, int num_iso_packets,
# 	libusb_transfer_cb_fn callback, Void *user_data, unsigned int timeout)
# {
# 	transfer->dev_handle = dev_handle;
# 	transfer->endpo= endpoint::Cint
# 	transfer->immutable = LIBUSB_TRANSFER_TYPE_ISOCHRONOUS;
# 	transfer->timeout = timeout;
# 	transfer->buffer = buffer;
# 	transfer->length = length;
# 	transfer->num_iso_packets = num_iso_packets;
# 	transfer->user_data = user_data;
# 	transfer->callback = callback;
# }

# /** \ingroup libusb_asyncio
#  * Convenience function to set the length of all packets in an isochronous
#  * transfer, based on the num_iso_packets field in the transfer structure.
#  *
#  * \param transfer a transfer
#  * \param length the length to set in each isochronous packet descriptor
#  * \see libusb_get_max_packet_size()
#  */
# static inline Void libusb_set_iso_packet_lengths(
# 	struct libusb_transfer *transfer, unsigned int length)
# {
# 	i::Cint
# 	for (i = 0; i < transfer->num_iso_packets; i++)
# 		transfer->iso_packet_desc[i].length = length;
# }

# /** \ingroup libusb_asyncio
#  * Convenience function to locate the position of an isochronous packet
#  * within the buffer of an isochronous transfer.
#  *
#  * This is a thorough function which loops through all preceding packets,
#  * accumulating their lengths to find the position of the specified packet.
#  * Typically you will assign equal lengths to each packet in the transfer,
#  * and hence the above method is sub-optimal. You may wish to use
#  * libusb_get_iso_packet_buffer_simple() instead.
#  *
#  * \param transfer a transfer
#  * \param packet the packet to return the address of
#  * \returns the base address of the packet buffer inside the transfer buffer,
#  * or NULL if the packet does not exist.
#  * \see libusb_get_iso_packet_buffer_simple()
#  */
# static inline unsigned char *libusb_get_iso_packet_buffer(
# 	struct libusb_transfer *transfer, unsigned int packet)
# {
# 	i::Cint
# 	size_t offset = 0;
# 	_packet::Cint
#
# 	/* oops..slight bug in the API. packet is an unsigned int, but we use
# 	 * signed integers almost everywhere else. range-check and convert to
# 	 * signed to aVoid compiler warnings. FIXME for libusb-2. */
# 	if (packet > INT_MAX)
# 		return NULL;
# 	_packet = (int) packet;
#
# 	if (_packet >= transfer->num_iso_packets)
# 		return NULL;
#
# 	for (i = 0; i < _packet; i++)
# 		offset += transfer->iso_packet_desc[i].length;
#
# 	return transfer->buffer + offset;
# }

# /** \ingroup libusb_asyncio
#  * Convenience function to locate the position of an isochronous packet
#  * within the buffer of an isochronous transfer, for transfers where each
#  * packet is of identical size.
#  *
#  * This function relies on the assumption that every packet within the transfer
#  * is of identical size to the first packet. Calculating the location of
#  * the packet buffer is then just a simple calculation:
#  * <tt>buffer + (packet_size * packet)</tt>
#  *
#  * Do not use this function on transfers other than those that have identical
#  * packet lengths for each packet.
#  *
#  * \param transfer a transfer
#  * \param packet the packet to return the address of
#  * \returns the base address of the packet buffer inside the transfer buffer,
#  * or NULL if the packet does not exist.
#  * \see libusb_get_iso_packet_buffer()
#  */
# static inline unsigned char *libusb_get_iso_packet_buffer_simple(
# 	struct libusb_transfer *transfer, unsigned int packet)
# {
# 	_packet::Cint
#
# 	/* oops..slight bug in the API. packet is an unsigned int, but we use
# 	 * signed integers almost everywhere else. range-check and convert to
# 	 * signed to aVoid compiler warnings. FIXME for libusb-2. */
# 	if (packet > INT_MAX)
# 		return NULL;
# 	_packet = (int) packet;
#
# 	if (_packet >= transfer->num_iso_packets)
# 		return NULL;
#
# 	return transfer->buffer + ((int) transfer->iso_packet_desc[0].length * _packet);
# }

# sync I/O

# int libusb_control_transfer(dev_handle::Ptr{libusb_device_handle},
# 	request_type::UInt8, bRequest::UInt8, wValue::UInt16, wIndex::UInt16,
# 	data::Vector{UInt8}, wLength::UInt16, timeout::Cuint);
#
# int libusb_bulk_transfer(dev_handle::Ptr{libusb_device_handle},
# 	endpoint::UInt8, data::Vector{UInt8}, length::Cint,
# 	actual_length::Ref{Cint}, timeout::Cuint);
#
# int libusb_interrupt_transfer(dev_handle::Ptr{libusb_device_handle},
# 	endpoint::UInt8, data::Vector{UInt8}, length::Cint,
# 	actual_length::Ref{Cint}, timeout::Cuint);

# /** \ingroup libusb_desc
#  * Retrieve a descriptor from the default control pipe.
#  * This is a convenience function which formulates the appropriate control
#  * message to retrieve the descriptor.
#  *
#  * \param dev_handle a device handle
#  * \param desc_immutable the descriptor type, see \ref libusb_descriptor_type
#  * \param desc_index the index of the descriptor to retrieve
#  * \param data output buffer for descriptor
#  * \param length size of data buffer
#  * \returns number of bytes returned in data, or LIBUSB_ERROR code on failure
#  */
# static inline int libusb_get_descriptor(dev_handle::Ptr{libusb_device_handle},
# 	uint8_t desc_type, uint8_t desc_index, unsigned char *data, int length)
# {
# 	return libusb_control_transfer(dev_handle, LIBUSB_ENDPOINT_IN,
# 		LIBUSB_REQUEST_GET_DESCRIPTOR, (uint16_t) ((desc_immutable << 8) | desc_index),
# 		0, data, (uint16_t) length, 1000);
# }

# /** \ingroup libusb_desc
#  * Retrieve a descriptor from a device.
#  * This is a convenience function which formulates the appropriate control
#  * message to retrieve the descriptor. The string returned is Unicode, as
#  * detailed in the USB specifications.
#  *
#  * \param dev_handle a device handle
#  * \param desc_index the index of the descriptor to retrieve
#  * \param langid the language ID for the string descriptor
#  * \param data output buffer for descriptor
#  * \param length size of data buffer
#  * \returns number of bytes returned in data, or LIBUSB_ERROR code on failure
#  * \see libusb_get_string_descriptor_ascii()
#  */
# static inline int libusb_get_string_descriptor(dev_handle::Ptr{libusb_device_handle},
# 	uint8_t desc_index, uint16_t langid, unsigned char *data, int length)
# {
# 	return libusb_control_transfer(dev_handle, LIBUSB_ENDPOINT_IN,
# 		LIBUSB_REQUEST_GET_DESCRIPTOR, (uint16_t)((LIBUSB_DT_STRING << 8) | desc_index),
# 		langid, data, (uint16_t) length, 1000);
# }
#
# int libusb_get_string_descriptor_ascii(dev_handle::Ptr{libusb_device_handle},
# 	desc_index::UInt8, data::Vector{UInt8}, length::Cint)

# polling and timeouts

# int libusb_try_lock_events(ctx::Ptr{libusb_context});
# Void libusb_lock_events(ctx::Ptr{libusb_context});
# Void libusb_unlock_events(ctx::Ptr{libusb_context});
# int libusb_event_handling_ok(ctx::Ptr{libusb_context});
# int libusb_event_handler_active(ctx::Ptr{libusb_context});
# Void libusb_interrupt_event_handler(ctx::Ptr{libusb_context});
# Void libusb_lock_event_waiters(ctx::Ptr{libusb_context});
# Void libusb_unlock_event_waiters(ctx::Ptr{libusb_context});
# int libusb_wait_for_event(ctx::Ptr{libusb_context}, struct timeval *tv);

# int libusb_handle_events_timeout(ctx::Ptr{libusb_context},
# 	struct timeval *tv);
# int libusb_handle_events_timeout_completed(ctx::Ptr{libusb_context},
# 	struct timeval *tv, int *completed);
# int libusb_handle_events(ctx::Ptr{libusb_context});
# int libusb_handle_events_completed(ctx::Ptr{libusb_context}, completed::Ref{Cint});
# int libusb_handle_events_locked(ctx::Ptr{libusb_context},
# 	struct timeval *tv);
# int libusb_pollfds_handle_timeouts(ctx::Ptr{libusb_context});
# int libusb_get_next_timeout(ctx::Ptr{libusb_context},
# 	struct timeval *tv);

# /** \ingroup libusb_poll
#  * File descriptor for polling
#  */
immutable libusb_pollfd
	#  Numeric file descriptor
	fd::Cint

	# /** Event flags to poll for from <poll.h>. POLLIN indicates that you
	#  * should monitor this file descriptor for becoming ready to read from,
	#  * and POLLOUT indicates that you should monitor this file descriptor for
	#  * nonblocking write readiness. */
    events::Int16
end

# /** \ingroup libusb_poll
#  * Callback function, invoked when a new file descriptor should be added
#  * to the set of file descriptors monitored for events.
#  * \param fd the new file descriptor
#  * \param events events to monitor for, see \ref libusb_pollfd for a
#  * description
#  * \param user_data User data pointer specified in
#  * libusb_set_pollfd_notifiers() call
#  * \see libusb_set_pollfd_notifiers()
#  */
# typedef Void (*libusb_pollfd_added_cb)(int fd, short events,
# 	Void *user_data);

# /** \ingroup libusb_poll
#  * Callback function, invoked when a file descriptor should be removed from
#  * the set of file descriptors being monitored for events. After returning
#  * from this callback, do not use that file descriptor again.
#  * \param fd the file descriptor to stop monitoring
#  * \param user_data User data pointer specified in
#  * libusb_set_pollfd_notifiers() call
#  * \see libusb_set_pollfd_notifiers()
#  */
# typedef Void (*libusb_pollfd_removed_cb)(fd, Void *user_data)::Cint

# const struct libusb_pollfd ** libusb_get_pollfds(
# 	ctx::Ptr{libusb_context});
# Void libusb_free_pollfds(const struct libusb_pollfd **pollfds);
# Void libusb_set_pollfd_notifiers(ctx::Ptr{libusb_context},
# 	libusb_pollfd_added_cb added_cb, libusb_pollfd_removed_cb removed_cb,
# 	Void *user_data);

# /** \ingroup libusb_hotplug
#  * Callback handle.
#  *
#  * Callbacks handles are generated by libusb_hotplug_register_callback()
#  * and can be used to deregister callbacks. Callback handles are unique
#  * per libusb_context and it is safe to call libusb_hotplug_deregister_callback()
#  * on an already deregisted callback.
#  *
#  * Since version 1.0.16, \ref LIBUSB_API_VERSION >= 0x01000102
#  *
#  * For more information, see \ref libusb_hotplug.
#  */
# typedef libusb_hotplug_callback_handle::Cint

# /** \ingroup libusb_hotplug
#  *
#  * Since version 1.0.16, \ref LIBUSB_API_VERSION >= 0x01000102
#  *
#  * Flags for hotplug events */
@enum(libusb_hotplug_flag,
	#  Default value when not using any flags.
	LIBUSB_HOTPLUG_NO_FLAGS = 0,

	#  Arm the callback and fire it for all matching currently attached devices.
	LIBUSB_HOTPLUG_ENUMERATE = 1<<0,
)

# /** \ingroup libusb_hotplug
#  *
#  * Since version 1.0.16, \ref LIBUSB_API_VERSION >= 0x01000102
#  *
#  * Hotplug events */
@enum(libusb_hotplug_event,
	#  A device has been plugged in and is ready to use
	LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED = 0x01,

	# /** A device has left and is no longer available.
	#  * It is the user's responsibility to call libusb_close on any handle associated with a disconnected device.
	#  * It is safe to call libusb_get_device_descriptor on a device that has left */
	LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT    = 0x02,
)

# /** \ingroup libusb_hotplug
#  * Wildcard matching for hotplug events */
const LIBUSB_HOTPLUG_MATCH_ANY = -1

# /** \ingroup libusb_hotplug
#  * Hotplug callback function type. When requesting hotplug event notifications,
#  * you pass a pointer to a callback function of this type.
#  *
#  * This callback may be called by an internal event thread and as such it is
#  * recommended the callback do minimal processing before returning.
#  *
#  * libusb will call this function later, when a matching event had happened on
#  * a matching device. See \ref libusb_hotplug for more information.
#  *
#  * It is safe to call either libusb_hotplug_register_callback() or
#  * libusb_hotplug_deregister_callback() from within a callback function.
#  *
#  * Since version 1.0.16, \ref LIBUSB_API_VERSION >= 0x01000102
#  *
#  * \param ctx            context of this notification
#  * \param device         libusb_device this event occurred on
#  * \param event          event that occurred
#  * \param user_data      user data provided when this callback was registered
#  * \returns bool whether this callback is finished processing events.
#  *                       returning 1 will cause this callback to be deregistered
#  */
# typedef int (*libusb_hotplug_callback_fn)(ctx::Ptr{libusb_context},
# 						dev::Ptr{libusb_device}ice,
# 						libusb_hotplug_event event,
# 						Void *user_data);

# /** \ingroup libusb_hotplug
#  * Register a hotplug callback function
#  *
#  * Register a callback with the libusb_context. The callback will fire
#  * when a matching event occurs on a matching device. The callback is
#  * armed until either it is deregistered with libusb_hotplug_deregister_callback()
#  * or the supplied callback returns 1 to indicate it is finished processing events.
#  *
#  * If the \ref LIBUSB_HOTPLUG_ENUMERATE is passed the callback will be
#  * called with a \ref LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED for all devices
#  * already plugged into the machine. Note that libusb modifies its internal
#  * device list from a separate thread, while calling hotplug callbacks from
#  * libusb_handle_events(), so it is possible for a device to already be present
#  * on, or removed from, its internal device list, while the hotplug callbacks
#  * still need to be dispatched. This means that when using \ref
#  * LIBUSB_HOTPLUG_ENUMERATE, your callback may be called twice for the arrival
#  * of the same device, once from libusb_hotplug_register_callback() and once
#  * from libusb_handle_events(); and/or your callback may be called for the
#  * removal of a device for which an arrived call was never made.
#  *
#  * Since version 1.0.16, \ref LIBUSB_API_VERSION >= 0x01000102
#  *
#  * \param[in] ctx context to register this callback with
#  * \param[in] events bitwise or of events that will trigger this callback. See \ref
#  *            libusb_hotplug_event
#  * \param[in] flags hotplug callback flags. See \ref libusb_hotplug_flag
#  * \param[in] vendor_id the vendor id to match or \ref LIBUSB_HOTPLUG_MATCH_ANY
#  * \param[in] product_id the product id to match or \ref LIBUSB_HOTPLUG_MATCH_ANY
#  * \param[in] dev_class the device class to match or \ref LIBUSB_HOTPLUG_MATCH_ANY
#  * \param[in] cb_fn the function to be invoked on a matching event/device
#  * \param[in] user_data user data to pass to the callback function
#  * \param[out] callback_handle pointer to store the handle of the allocated callback (can be NULL)
#  * \returns LIBUSB_SUCCESS on success LIBUSB_ERROR code on failure
#  */
# int libusb_hotplug_register_callback(ctx::Ptr{libusb_context},
# 						libusb_hotplug_event events,
# 						libusb_hotplug_flag flags,
# 						int vendor_id, int product_id,
# 						int dev_class,
# 						libusb_hotplug_callback_fn cb_fn,
# 						Void *user_data,
# 						libusb_hotplug_callback_handle *callback_handle);

# /** \ingroup libusb_hotplug
#  * Deregisters a hotplug callback.
#  *
#  * Deregister a callback from a libusb_context. This function is safe to call from within
#  * a hotplug callback.
#  *
#  * Since version 1.0.16, \ref LIBUSB_API_VERSION >= 0x01000102
#  *
#  * \param[in] ctx context this callback is registered with
#  * \param[in] callback_handle the handle of the callback to deregister
#  */
# Void libusb_hotplug_deregister_callback(ctx::Ptr{libusb_context},
# 						libusb_hotplug_callback_handle callback_handle);
