; ITPLANTS_Custom_USB_Device.inf
; Copyright (c) 2010 libusb-win32 (GNU LGPL)
[Strings]
DeviceName = "ITPLANTS Custom USB Device"
VendorName = "itplants,ltd."
SourceName = "ITPLANTS Custom USB Device Install Disk"
DeviceID   = "VID_250F&PID_000A"
DeviceGUID = "{63B2E468-0CD3-4C5B-83CB-B2E78688CC60}"

[Version]
Signature   = "$Windows NT$"
Class       = "libusb-win32 devices"
ClassGuid   = {EB781AAF-9C70-4523-A5DF-642A87ECA567}
Provider    = "libusb-win32"
CatalogFile = ITPLANTS_Custom_USB_Device.cat
DriverVer   = 04/08/2011, 1.2.4.0

[ClassInstall32]
Addreg = libusb_class_install_add_reg

[libusb_class_install_add_reg]
HKR,,,0,"libusb-win32 devices"
HKR,,Icon,,-20

[Manufacturer]
%VendorName% = Devices, NT, NTAMD64, NTIA64

;--------------------------------------------------------------------------
; libusb-win32 files
;--------------------------------------------------------------------------

[SourceDisksNames]
1 = %SourceName%

[SourceDisksFiles.x86]
libusb0.sys     = 1,x86
libusb0_x86.dll = 1,x86

[SourceDisksFiles.amd64]
libusb0.sys     = 1,amd64
libusb0.dll     = 1,amd64
libusb0_x86.dll = 1,x86

[SourceDisksFiles.ia64]
libusb0.sys     = 1,ia64
libusb0.dll     = 1,ia64
libusb0_x86.dll = 1,x86

[DestinationDirs]
libusb_files_sys       = 10,system32\drivers
libusb_files_dll       = 10,system32
libusb_files_dll_wow64 = 10,syswow64
libusb_files_dll_x86   = 10,system32

[libusb_files_sys]
libusb0.sys

[libusb_files_dll]
libusb0.dll

[libusb_files_dll_x86]
libusb0.dll, libusb0_x86.dll

[libusb_files_dll_wow64]
libusb0.dll, libusb0_x86.dll

;--------------------------------------------------------------------------
; libusb-win32 device driver
;--------------------------------------------------------------------------

[LIBUSB_WIN32_DEV.NT]
CopyFiles = libusb_files_sys, libusb_files_dll_x86

[LIBUSB_WIN32_DEV.NTAMD64]
CopyFiles = libusb_files_sys, libusb_files_dll, libusb_files_dll_wow64

[LIBUSB_WIN32_DEV.NTIA64]
CopyFiles = libusb_files_sys, libusb_files_dll, libusb_files_dll_wow64

[LIBUSB_WIN32_DEV.NT.HW]
DelReg = libusb_del_reg_hw
AddReg = libusb_add_reg_hw

[LIBUSB_WIN32_DEV.NTAMD64.HW]
DelReg = libusb_del_reg_hw
AddReg = libusb_add_reg_hw

[LIBUSB_WIN32_DEV.NTIA64.HW]
DelReg = libusb_del_reg_hw
AddReg = libusb_add_reg_hw

[LIBUSB_WIN32_DEV.NT.Services]
AddService = libusb0, 0x00000002, libusb_add_service

[LIBUSB_WIN32_DEV.NTAMD64.Services]
AddService = libusb0, 0x00000002, libusb_add_service

[LIBUSB_WIN32_DEV.NTIA64.Services]
AddService = libusb0, 0x00000002, libusb_add_service

; Older versions of this .inf file installed filter drivers. They are not
; needed any more and must be removed
[libusb_del_reg_hw]
HKR,,LowerFilters
HKR,,UpperFilters

; libusb-win32 device properties
[libusb_add_reg_hw]
HKR,,SurpriseRemovalOK,0x00010001,1

; (Optional) the usb configuration value to select when this device
; is started.  If this key does not exist the first config is selected.
;HKR,,InitialConfigValue,0x00010001,<your config value>

;--------------------------------------------------------------------------
; libusb-win32 service
;--------------------------------------------------------------------------

[libusb_add_service]
DisplayName   = "libusb-win32 - Kernel Driver 04/08/2011 1.2.4.0"
ServiceType   = 1
StartType     = 3
ErrorControl  = 0
ServiceBinary = %12%\libusb0.sys

;--------------------------------------------------------------------------
; libusb-win32 devices
;--------------------------------------------------------------------------

; Hardware IDs in a 'Devices' section can be installed by libusb-win32
; using usb_install_driver_np(), usb_install_driver_np_rundll(), or the
; inf-wizard utility.
;
[Devices]
%DeviceName% = LIBUSB_WIN32_DEV, USB\%DeviceID%

[Devices.NT]
%DeviceName% = LIBUSB_WIN32_DEV.NT, USB\%DeviceID%

[Devices.NTAMD64]
%DeviceName% = LIBUSB_WIN32_DEV.NTAMD64, USB\%DeviceID%

[Devices.NTIA64]
%DeviceName% = LIBUSB_WIN32_DEV.NTIA64, USB\%DeviceID%
