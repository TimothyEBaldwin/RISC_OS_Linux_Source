#ifndef devicefs_H
#define devicefs_H

/* C header file for DeviceFS
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:52 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 June 1995
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#ifndef os_H
#include "oslib/os.h"
#endif

#ifndef osargs_H
#include "oslib/osargs.h"
#endif

#ifndef buffer_H
#include "oslib/buffer.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  DeviceFS_Register
#define DeviceFS_Register                       0x42740
#undef  XDeviceFS_Register
#define XDeviceFS_Register                      0x62740
#undef  DeviceFS_Deregister
#define DeviceFS_Deregister                     0x42741
#undef  XDeviceFS_Deregister
#define XDeviceFS_Deregister                    0x62741
#undef  DeviceFS_RegisterObjects
#define DeviceFS_RegisterObjects                0x42742
#undef  XDeviceFS_RegisterObjects
#define XDeviceFS_RegisterObjects               0x62742
#undef  DeviceFS_DeregisterObjects
#define DeviceFS_DeregisterObjects              0x42743
#undef  XDeviceFS_DeregisterObjects
#define XDeviceFS_DeregisterObjects             0x62743
#undef  DeviceFS_CallDevice
#define DeviceFS_CallDevice                     0x42744
#undef  XDeviceFS_CallDevice
#define XDeviceFS_CallDevice                    0x62744
#undef  DeviceFSCallDevice_Initialise
#define DeviceFSCallDevice_Initialise           0x0
#undef  DeviceFSCallDevice_Terminate
#define DeviceFSCallDevice_Terminate            0x1
#undef  DeviceFSCallDevice_TxWakeUp
#define DeviceFSCallDevice_TxWakeUp             0x2
#undef  DeviceFSCallDevice_RxWakeUp
#define DeviceFSCallDevice_RxWakeUp             0x3
#undef  DeviceFSCallDevice_RxSleep
#define DeviceFSCallDevice_RxSleep              0x4
#undef  DeviceFSCallDevice_EnumDir
#define DeviceFSCallDevice_EnumDir              0x5
#undef  DeviceFSCallDevice_TxCreateBuffer
#define DeviceFSCallDevice_TxCreateBuffer       0x6
#undef  DeviceFSCallDevice_RxCreateBuffer
#define DeviceFSCallDevice_RxCreateBuffer       0x7
#undef  DeviceFSCallDevice_Halt
#define DeviceFSCallDevice_Halt                 0x8
#undef  DeviceFSCallDevice_Resume
#define DeviceFSCallDevice_Resume               0x9
#undef  DeviceFSCallDevice_EndOfData
#define DeviceFSCallDevice_EndOfData            0xA
#undef  DeviceFSCallDevice_StreamCreated
#define DeviceFSCallDevice_StreamCreated        0xB
#undef  DeviceFSCallDevice_IOCtl
#define DeviceFSCallDevice_IOCtl                0xE
#undef  DeviceFS_Threshold
#define DeviceFS_Threshold                      0x42745
#undef  XDeviceFS_Threshold
#define XDeviceFS_Threshold                     0x62745
#undef  DeviceFS_ReceivedChar
#define DeviceFS_ReceivedChar                   0x42746
#undef  XDeviceFS_ReceivedChar
#define XDeviceFS_ReceivedChar                  0x62746
#undef  DeviceFS_TransmitChar
#define DeviceFS_TransmitChar                   0x42747
#undef  XDeviceFS_TransmitChar
#define XDeviceFS_TransmitChar                  0x62747
#undef  Service_DeviceFSStarting
#define Service_DeviceFSStarting                0x70
#undef  Service_DeviceFSDying
#define Service_DeviceFSDying                   0x71
#undef  Service_DeviceDead
#define Service_DeviceDead                      0x79
#undef  Service_DeviceFSCloseRequest
#define Service_DeviceFSCloseRequest            0x81
#undef  Service_DeviceFSCloseRequestW
#define Service_DeviceFSCloseRequestW           0x81
#undef  UpCall_StreamCreated
#define UpCall_StreamCreated                    0xA
#undef  UpCall_StreamCreatedW
#define UpCall_StreamCreatedW                   0xA
#undef  UpCall_StreamClosed
#define UpCall_StreamClosed                     0xB
#undef  UpCall_StreamClosedW
#define UpCall_StreamClosedW                    0xB
#undef  UpCall_DeviceRxDataPresent
#define UpCall_DeviceRxDataPresent              0xF
#undef  UpCall_DeviceThresAbove
#define UpCall_DeviceThresAbove                 0x10
#undef  UpCall_DeviceThresBelow
#define UpCall_DeviceThresBelow                 0x11
#undef  Event_DeviceOverrun
#define Event_DeviceOverrun                     0x16
#undef  Event_DeviceOverrunW
#define Event_DeviceOverrunW                    0x16

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct devicefs_d_                      *devicefs_d;
typedef struct devicefs_s_                      *devicefs_s;
      /*DeviceFS stream handle*/
typedef struct devicefs_h_                      *devicefs_h;
      /*Driver stream handle*/
typedef struct devicefs_device                  devicefs_device;
typedef struct devicefs_device_list             devicefs_device_list;
typedef struct devicefs_device_list_base        devicefs_device_list_base;

/********************
 * Type definitions *
 ********************/
typedef bits devicefs_flags;

struct devicefs_device
   {  int name_offset;
      devicefs_flags flags;
      bits rx_flags;
      int rx_buffer_size;
      bits tx_flags;
      int tx_buffer_size;
      int reserved;
   };

struct devicefs_device_list
   {  devicefs_device d [UNKNOWN];
   };

#define devicefs_DEVICE_LIST(N) \
   struct \
      {  devicefs_device d [N]; \
      }

#define devicefs_SIZEOF_DEVICE_LIST(N) \
   ((N)*sizeof ((devicefs_device_list *) NULL)->d)

typedef bits devicefs_register_flags;

typedef bits devicefs_initialise_flags;

/************************
 * Constant definitions *
 ************************/
#define devicefs_DEVICE_BUFFERED                ((devicefs_flags) 0x1u)
#define devicefs_DEVICE_USES_PATH_VAR           ((devicefs_flags) 0x2u)
#define devicefs_REGISTER_BLOCK_DEVICE          ((devicefs_register_flags) 0x1u)
#define devicefs_REGISTER_FULL_DUPLEX           ((devicefs_register_flags) 0x2u)
#define devicefs_OPEN_FOR_RX                    ((devicefs_initialise_flags) 0x0u)
#define devicefs_OPEN_FOR_TX                    ((devicefs_initialise_flags) 0x1u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      devicefs_register()
 *
 * Description:   Registers a device driver and its associated devices with
 *                DeviceFS
 *
 * Input:         flags - value of R0 on entry
 *                devices - value of R1 on entry
 *                driver - value of R2 on entry
 *                handle - value of R3 on entry
 *                workspace - value of R4 on entry
 *                validation - value of R5 on entry
 *                rx_limit - value of R6 on entry
 *                tx_limit - value of R7 on entry
 *
 * Output:        d - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42740.
 */

extern os_error *xdevicefs_register (devicefs_register_flags flags,
      devicefs_device_list const *devices,
      void const *driver,
      int handle,
      void *workspace,
      char const *validation,
      int rx_limit,
      int tx_limit,
      devicefs_d *d);
extern devicefs_d devicefs_register (devicefs_register_flags flags,
      devicefs_device_list const *devices,
      void const *driver,
      int handle,
      void *workspace,
      char const *validation,
      int rx_limit,
      int tx_limit);

/* ------------------------------------------------------------------------
 * Function:      devicefs_deregister()
 *
 * Description:   Deregisters a device driver and all its devices from
 *                DeviceFS
 *
 * Input:         d - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x42741.
 */

extern os_error *xdevicefs_deregister (devicefs_d d);
__swi (0x42741) void devicefs_deregister (devicefs_d d);

/* ------------------------------------------------------------------------
 * Function:      devicefs_register_objects()
 *
 * Description:   Registers a list of additional devices with a device
 *                driver
 *
 * Input:         d - value of R0 on entry
 *                devices - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x42742.
 */

extern os_error *xdevicefs_register_objects (devicefs_d d,
      devicefs_device_list const *devices);
__swi (0x42742) void devicefs_register_objects (devicefs_d d,
      devicefs_device_list const *devices);

/* ------------------------------------------------------------------------
 * Function:      devicefs_deregister_objects()
 *
 * Description:   Deregisters a device related to a particular device
 *                driver
 *
 * Input:         d - value of R0 on entry
 *                device_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x42743.
 */

extern os_error *xdevicefs_deregister_objects (devicefs_d d,
      char const *device_name);
__swi (0x42743) void devicefs_deregister_objects (devicefs_d d,
      char const *device_name);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_initialise()
 *
 * Description:   Initialises a device
 *
 * Input:         d - value of R1 on entry
 *                s - value of R2 on entry
 *                flags - value of R3 on entry
 *                decoded_special - value of R6 on entry
 *
 * Output:        h - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0x0.
 */

extern os_error *xdevicefscalldevice_initialise (devicefs_d d,
      devicefs_s s,
      devicefs_initialise_flags flags,
      byte const *decoded_special,
      devicefs_h *h);
extern devicefs_h devicefscalldevice_initialise (devicefs_d d,
      devicefs_s s,
      devicefs_initialise_flags flags,
      byte const *decoded_special);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_terminate()
 *
 * Description:   Finalises a device
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0x1.
 */

extern os_error *xdevicefscalldevice_terminate (devicefs_d d,
      devicefs_h h);
extern void devicefscalldevice_terminate (devicefs_d d,
      devicefs_h h);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_tx_wake_up()
 *
 * Description:   Wakes a device up for transmission
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *
 * Output:        woken_up - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0x2.
 */

extern os_error *xdevicefscalldevice_tx_wake_up (devicefs_d d,
      devicefs_h h,
      osbool *woken_up);
extern osbool devicefscalldevice_tx_wake_up (devicefs_d d,
      devicefs_h h);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_rx_wake_up()
 *
 * Description:   Wakes a device up for reception
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0x3.
 */

extern os_error *xdevicefscalldevice_rx_wake_up (devicefs_d d,
      devicefs_h h);
extern void devicefscalldevice_rx_wake_up (devicefs_d d,
      devicefs_h h);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_rx_sleep()
 *
 * Description:   Puts a device to sleep from reception
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0x4.
 */

extern os_error *xdevicefscalldevice_rx_sleep (devicefs_d d,
      devicefs_h h);
extern void devicefscalldevice_rx_sleep (devicefs_d d,
      devicefs_h h);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_enum_dir()
 *
 * Description:   Informs a device that a DeviceFS directory is being
 *                enumerated
 *
 * Input:         d - value of R1 on entry
 *                file_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0x5.
 */

extern os_error *xdevicefscalldevice_enum_dir (devicefs_d d,
      char const *file_name);
extern void devicefscalldevice_enum_dir (devicefs_d d,
      char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_tx_create_buffer()
 *
 * Description:   Informs a device that a buffer is being created for
 *                transmission
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *                flags - value of R3 on entry
 *                size - value of R4 on entry
 *                b - value of R5 on entry
 *                threshold - value of R6 on entry
 *
 * Output:        flags_out - value of R3 on exit
 *                size_out - value of R4 on exit
 *                b_out - value of R5 on exit (X version only)
 *                threshold_out - value of R6 on exit
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0x6.
 */

extern os_error *xdevicefscalldevice_tx_create_buffer (devicefs_d d,
      devicefs_h h,
      buffer_flags flags,
      int size,
      buffer_b b,
      int threshold,
      buffer_flags *flags_out,
      int *size_out,
      buffer_b *b_out,
      int *threshold_out);
extern buffer_b devicefscalldevice_tx_create_buffer (devicefs_d d,
      devicefs_h h,
      buffer_flags flags,
      int size,
      buffer_b b,
      int threshold,
      buffer_flags *flags_out,
      int *size_out,
      int *threshold_out);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_rx_create_buffer()
 *
 * Description:   Informs a device that a buffer is being created for
 *                reception
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *                flags - value of R3 on entry
 *                size - value of R4 on entry
 *                b - value of R5 on entry
 *                threshold - value of R6 on entry
 *
 * Output:        flags_out - value of R3 on exit
 *                size_out - value of R4 on exit
 *                b_out - value of R5 on exit (X version only)
 *                threshold_out - value of R6 on exit
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0x7.
 */

extern os_error *xdevicefscalldevice_rx_create_buffer (devicefs_d d,
      devicefs_h h,
      buffer_flags flags,
      int size,
      buffer_b b,
      int threshold,
      buffer_flags *flags_out,
      int *size_out,
      buffer_b *b_out,
      int *threshold_out);
extern buffer_b devicefscalldevice_rx_create_buffer (devicefs_d d,
      devicefs_h h,
      buffer_flags flags,
      int size,
      buffer_b b,
      int threshold,
      buffer_flags *flags_out,
      int *size_out,
      int *threshold_out);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_halt()
 *
 * Description:   Halts a device
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0x8.
 */

extern os_error *xdevicefscalldevice_halt (devicefs_d d,
      devicefs_h h);
extern void devicefscalldevice_halt (devicefs_d d,
      devicefs_h h);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_resume()
 *
 * Description:   Resumes a device
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0x9.
 */

extern os_error *xdevicefscalldevice_resume (devicefs_d d,
      devicefs_h h);
extern void devicefscalldevice_resume (devicefs_d d,
      devicefs_h h);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_end_of_data()
 *
 * Description:   Returns the end-of-data status of a device
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *
 * Output:        end_of_data - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0xA, R3 = 0xFFFFFFFF.
 */

extern os_error *xdevicefscalldevice_end_of_data (devicefs_d d,
      devicefs_h h,
      osbool *end_of_data);
extern osbool devicefscalldevice_end_of_data (devicefs_d d,
      devicefs_h h);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_stream_created()
 *
 * Description:   Informs a device that a stream has been created
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *                b - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0xB.
 */

extern os_error *xdevicefscalldevice_stream_created (devicefs_d d,
      devicefs_h h,
      buffer_b b);
extern void devicefscalldevice_stream_created (devicefs_d d,
      devicefs_h h,
      buffer_b b);

/* ------------------------------------------------------------------------
 * Function:      devicefscalldevice_io_ctl()
 *
 * Description:   Invokes an IO control operation on a device - RISC O S 4+
 *
 * Input:         d - value of R1 on entry
 *                h - value of R2 on entry
 *                parameters - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x42744 with R0 = 0xE.
 */

extern os_error *xdevicefscalldevice_io_ctl (devicefs_d d,
      devicefs_h h,
      osargs_io_ctl_parameters *parameters);
extern void devicefscalldevice_io_ctl (devicefs_d d,
      devicefs_h h,
      osargs_io_ctl_parameters *parameters);

/* ------------------------------------------------------------------------
 * Function:      devicefs_threshold()
 *
 * Description:   Informs DeviceFS of the threshold value to use on
 *                buffered devices
 *
 * Input:         s - value of R1 on entry
 *                threshold - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x42745.
 */

extern os_error *xdevicefs_threshold (devicefs_s s,
      int threshold);
extern void devicefs_threshold (devicefs_s s,
      int threshold);

/* ------------------------------------------------------------------------
 * Function:      devicefs_received_char()
 *
 * Description:   Informs DeviceFS that a device has recieved a character
 *
 * Input:         b - value of R0 on entry
 *                s - value of R1 on entry
 *
 * Output:        psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x42746.
 */

extern os_error *xdevicefs_received_char (byte b,
      devicefs_s s,
      bits *psr);
extern bits devicefs_received_char (byte b,
      devicefs_s s);

/* ------------------------------------------------------------------------
 * Function:      devicefs_transmit_char()
 *
 * Description:   Informs DeviceFS that a device driver wants to transmit a
 *                character
 *
 * Input:         s - value of R1 on entry
 *
 * Output:        b - value of R0 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x42747.
 */

extern os_error *xdevicefs_transmit_char (devicefs_s s,
      byte *b,
      bits *psr);
extern bits devicefs_transmit_char (devicefs_s s,
      byte *b);

/* ------------------------------------------------------------------------
 * Function:      service_device_fs_starting()
 *
 * Description:   DeviceFS is starting
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x70.
 */

extern os_error *xservice_device_fs_starting (void);
extern void service_device_fs_starting (void);

/* ------------------------------------------------------------------------
 * Function:      service_device_fs_dying()
 *
 * Description:   DeviceFS is dying
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x0, R1 = 0x71.
 */

extern os_error *xservice_device_fs_dying (void);
extern void service_device_fs_dying (void);

/* ------------------------------------------------------------------------
 * Function:      service_device_dead()
 *
 * Description:   Device has been killed by DeviceFS
 *
 * Input:         d - value of R2 on entry
 *                device_name - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x0, R1 = 0x79.
 */

extern os_error *xservice_device_dead (devicefs_d d,
      char const *device_name);
extern void service_device_dead (devicefs_d d,
      char const *device_name);

/* ------------------------------------------------------------------------
 * Function:      service_device_fs_close_request()
 *
 * Description:   Opening a device which already has the maximum number of
 *                streams open. Prefer Service_DeviceFSCloseRequestW
 *
 * Input:         file - value of R2 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x81.
 */

extern os_error *xservice_device_fs_close_request (os_f file,
      osbool *unclaimed);
extern osbool service_device_fs_close_request (os_f file);

/* ------------------------------------------------------------------------
 * Function:      service_device_fs_close_requestw()
 *
 * Description:   Opening a device which already has the maximum number of
 *                streams open. Uses 32-bit file handle
 *
 * Input:         file - value of R2 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x81.
 */

extern os_error *xservice_device_fs_close_requestw (os_fw file,
      osbool *unclaimed);
extern osbool service_device_fs_close_requestw (os_fw file);

/* ------------------------------------------------------------------------
 * Function:      upcall_stream_created()
 *
 * Description:   Stream created - Prefer UpCall_StreamCreatedW
 *
 * Input:         d - value of R1 on entry
 *                tx_stream - value of R2 on entry
 *                file - value of R3 on entry
 *                s - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0xA.
 */

extern os_error *xupcall_stream_created (devicefs_d d,
      osbool tx_stream,
      os_f file,
      devicefs_s s);
extern void upcall_stream_created (devicefs_d d,
      osbool tx_stream,
      os_f file,
      devicefs_s s);

/* ------------------------------------------------------------------------
 * Function:      upcall_stream_createdw()
 *
 * Description:   Stream created. Uses 32-bit file handle.
 *
 * Input:         d - value of R1 on entry
 *                tx_stream - value of R2 on entry
 *                file - value of R3 on entry
 *                s - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0xA.
 */

extern os_error *xupcall_stream_createdw (devicefs_d d,
      osbool tx_stream,
      os_fw file,
      devicefs_s s);
extern void upcall_stream_createdw (devicefs_d d,
      osbool tx_stream,
      os_fw file,
      devicefs_s s);

/* ------------------------------------------------------------------------
 * Function:      upcall_stream_closed()
 *
 * Description:   Stream closed. Prefer UpCall_StreamClosedW
 *
 * Input:         d - value of R1 on entry
 *                tx_stream - value of R2 on entry
 *                file - value of R3 on entry
 *                s - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0xB.
 */

extern os_error *xupcall_stream_closed (devicefs_d d,
      osbool tx_stream,
      os_f file,
      devicefs_s s);
extern void upcall_stream_closed (devicefs_d d,
      osbool tx_stream,
      os_f file,
      devicefs_s s);

/* ------------------------------------------------------------------------
 * Function:      upcall_stream_closedw()
 *
 * Description:   Stream closed. Uses 32-bit file handle
 *
 * Input:         d - value of R1 on entry
 *                tx_stream - value of R2 on entry
 *                file - value of R3 on entry
 *                s - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0xB.
 */

extern os_error *xupcall_stream_closedw (devicefs_d d,
      osbool tx_stream,
      os_fw file,
      devicefs_s s);
extern void upcall_stream_closedw (devicefs_d d,
      osbool tx_stream,
      os_fw file,
      devicefs_s s);

/* ------------------------------------------------------------------------
 * Function:      upcall_device_rx_data_present()
 *
 * Description:   Data has entered a previously empty input buffer - RISC O
 *                S 4+
 *
 * Input:         d - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0xF.
 */

extern os_error *xupcall_device_rx_data_present (devicefs_d d);
extern void upcall_device_rx_data_present (devicefs_d d);

/* ------------------------------------------------------------------------
 * Function:      upcall_device_thres_above()
 *
 * Description:   The amount of data in a stream has exceeded the threshold
 *                value - RISC O S 4+
 *
 * Input:         d - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x10.
 */

extern os_error *xupcall_device_thres_above (devicefs_d d);
extern void upcall_device_thres_above (devicefs_d d);

/* ------------------------------------------------------------------------
 * Function:      upcall_device_thres_below()
 *
 * Description:   The amount of data in a stream has fallen below the
 *                threshold value - RISC O S 4+
 *
 * Input:         d - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x11.
 */

extern os_error *xupcall_device_thres_below (devicefs_d d);
extern void upcall_device_thres_below (devicefs_d d);

/* ------------------------------------------------------------------------
 * Function:      event_device_overrun()
 *
 * Description:   Device overrun event. Prefer Event_DeviceOverrunW
 *
 * Input:         d - value of R1 on entry
 *                file - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x16, R3 = 0x0.
 */

extern os_error *xevent_device_overrun (devicefs_d d,
      os_f file);
extern void event_device_overrun (devicefs_d d,
      os_f file);

/* ------------------------------------------------------------------------
 * Function:      event_device_overrunw()
 *
 * Description:   Device overrun event. Uses 32-bit file handle
 *
 * Input:         d - value of R1 on entry
 *                file - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x16, R3 = 0x0.
 */

extern os_error *xevent_device_overrunw (devicefs_d d,
      os_fw file);
extern void event_device_overrunw (devicefs_d d,
      os_fw file);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#ifndef devicefs32_H
#include "oslib/devicefs32.h"
#endif

#endif
