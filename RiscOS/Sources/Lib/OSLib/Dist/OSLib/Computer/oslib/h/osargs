#ifndef osargs_H
#define osargs_H

/* C header file for OSArgs
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
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

#ifndef fileswitch_H
#include "oslib/fileswitch.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  OS_Args
#define OS_Args                                 0x9
#undef  XOS_Args
#define XOS_Args                                0x20009
#undef  OSArgs_ReadPtr
#define OSArgs_ReadPtr                          0x0
#undef  OSArgs_ReadPtrW
#define OSArgs_ReadPtrW                         0x0
#undef  OSArgs_ReadTemporaryFS
#define OSArgs_ReadTemporaryFS                  0x0
#undef  OSArgs_SetPtr
#define OSArgs_SetPtr                           0x1
#undef  OSArgs_SetPtrW
#define OSArgs_SetPtrW                          0x1
#undef  OSArgs_ReadExt
#define OSArgs_ReadExt                          0x2
#undef  OSArgs_ReadExtW
#define OSArgs_ReadExtW                         0x2
#undef  OSArgs_SetExt
#define OSArgs_SetExt                           0x3
#undef  OSArgs_SetExtW
#define OSArgs_SetExtW                          0x3
#undef  OSArgs_ReadAllocation
#define OSArgs_ReadAllocation                   0x4
#undef  OSArgs_ReadAllocationW
#define OSArgs_ReadAllocationW                  0x4
#undef  OSArgs_ReadEOFStatus
#define OSArgs_ReadEOFStatus                    0x5
#undef  OSArgs_ReadEOFStatusW
#define OSArgs_ReadEOFStatusW                   0x5
#undef  OSArgs_SetAllocation
#define OSArgs_SetAllocation                    0x6
#undef  OSArgs_SetAllocationW
#define OSArgs_SetAllocationW                   0x6
#undef  OSArgs_ReadPath
#define OSArgs_ReadPath                         0x7
#undef  OSArgs_ReadPathW
#define OSArgs_ReadPathW                        0x7
#undef  OSArgs_ImageStamped
#define OSArgs_ImageStamped                     0x8
#undef  OSArgs_ImageStampedW
#define OSArgs_ImageStampedW                    0x8
#undef  OSArgs_IOCtl
#define OSArgs_IOCtl                            0x0
#undef  OSArgs_ReadInfo
#define OSArgs_ReadInfo                         0xFE
#undef  OSArgs_ReadInfoW
#define OSArgs_ReadInfoW                        0xFE
#undef  OSArgs_Ensure
#define OSArgs_Ensure                           0xFF
#undef  OSArgs_EnsureW
#define OSArgs_EnsureW                          0xFF
#undef  ArgsV
#define ArgsV                                   0x9

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct osargs_io_ctl_parameters         osargs_io_ctl_parameters;

/********************
 * Type definitions *
 ********************/
typedef bits osargs_stream_status;

typedef bits osargs_io_ctl_operation;

struct osargs_io_ctl_parameters
   {  osargs_io_ctl_operation operation;
      int value;
   };

/************************
 * Constant definitions *
 ************************/
#define osargs_STREAM_INTERACTIVE               ((osargs_stream_status) 0x8u)
#define osargs_STREAM_SUPPORTS_GBPB             ((osargs_stream_status) 0x10u)
#define osargs_STREAM_DIR                       ((osargs_stream_status) 0x20u)
#define osargs_STREAM_READABLE                  ((osargs_stream_status) 0x40u)
#define osargs_STREAM_WRITABLE                  ((osargs_stream_status) 0x80u)
#define osargs_STREAM_WRITTEN                   ((osargs_stream_status) 0x100u)
#define osargs_STREAM_EOF_ERROR_ON_NEXT_READ    ((osargs_stream_status) 0x200u)
#define osargs_STREAM_UNBUFFERED                ((osargs_stream_status) 0x400u)
#define osargs_STREAM_UNALLOCATED               ((osargs_stream_status) 0x800u)
#define osargs_STREAM_CRITICAL                  ((osargs_stream_status) 0x1000u)
#define osargs_STREAM_DATA_LOST                 ((osargs_stream_status) 0x2000u)
#define osargs_STREAM_IMAGE_FILE_BUSY           ((osargs_stream_status) 0x4000u)
#define osargs_IO_CTL_REASON                    ((osargs_io_ctl_operation) 0xFFFFu)
#define osargs_IO_CTL_REASON_SHIFT              0
#define osargs_IO_CTL_GROUP                     ((osargs_io_ctl_operation) 0xFF0000u)
#define osargs_IO_CTL_GROUP_SHIFT               16
#define osargs_IO_CTL_READ_VALUE                ((osargs_io_ctl_operation) 0x40000000u)
#define osargs_IO_CTL_WRITE_VALUE               ((osargs_io_ctl_operation) 0x80000000u)
#define osargs_IO_CTL_BAUD_RATE                 ((osargs_io_ctl_operation) 0x1u)
#define osargs_IO_CTL_DATA_FORMAT               ((osargs_io_ctl_operation) 0x2u)
#define osargs_IO_CTL_HANDSHAKING               ((osargs_io_ctl_operation) 0x3u)
#define osargs_IO_CTL_BUFFER_SIZE               ((osargs_io_ctl_operation) 0x4u)
#define osargs_IO_CTL_BUFFER_THRESHOLDS         ((osargs_io_ctl_operation) 0x5u)
#define osargs_IO_CTL_CONTROL_LINES             ((osargs_io_ctl_operation) 0x6u)
#define osargs_IO_CTL_FIFO_TRIGGER_LEVEL        ((osargs_io_ctl_operation) 0x7u)
#define osargs_IO_CTL_SUPPORTED_BAUD_RATE_COUNT ((osargs_io_ctl_operation) 0x8u)
#define osargs_IO_CTL_SUPPORTED_BAUD_RATE       ((osargs_io_ctl_operation) 0x9u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      osargs_read_ptr()
 *
 * Description:   Reads a file's sequential file pointer. Prefer
 *                OSArgs_ReadPtrW
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        ptr - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x0.
 */

extern os_error *xosargs_read_ptr (os_f file,
      int *ptr);
extern int osargs_read_ptr (os_f file);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_ptrw()
 *
 * Description:   Reads a file's sequential file pointer. Uses 32-bit file
 *                handle
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        ptr - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x0.
 */

extern os_error *xosargs_read_ptrw (os_fw file,
      int *ptr);
extern int osargs_read_ptrw (os_fw file);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_temporary_fs()
 *
 * Description:   Reads the temporary filing system number
 *
 * Output:        temp_fs_no - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x0, R1 = 0x0.
 */

extern os_error *xosargs_read_temporary_fs (fileswitch_fs_no *temp_fs_no);
extern fileswitch_fs_no osargs_read_temporary_fs (void);

/* ------------------------------------------------------------------------
 * Function:      osargs_set_ptr()
 *
 * Description:   Writes an open file's sequential file pointer Prefer
 *                OSArgs_SetPtrW
 *
 * Input:         file - value of R1 on entry
 *                ptr - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x1.
 */

extern os_error *xosargs_set_ptr (os_f file,
      int ptr);
extern void osargs_set_ptr (os_f file,
      int ptr);

/* ------------------------------------------------------------------------
 * Function:      osargs_set_ptrw()
 *
 * Description:   Writes an open file's sequential file pointer. Uses
 *                32-bit file handle
 *
 * Input:         file - value of R1 on entry
 *                ptr - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x1.
 */

extern os_error *xosargs_set_ptrw (os_fw file,
      int ptr);
extern void osargs_set_ptrw (os_fw file,
      int ptr);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_ext()
 *
 * Description:   Reads an open file's extent. Prefer OSArgs_ReadExtW
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        ext - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x2.
 */

extern os_error *xosargs_read_ext (os_f file,
      int *ext);
extern int osargs_read_ext (os_f file);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_extw()
 *
 * Description:   Reads an open file's extent. Uses 32-bit file handle
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        ext - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x2.
 */

extern os_error *xosargs_read_extw (os_fw file,
      int *ext);
extern int osargs_read_extw (os_fw file);

/* ------------------------------------------------------------------------
 * Function:      osargs_set_ext()
 *
 * Description:   Writes an open file's extent. Prefer OSArgs_SetExtW
 *
 * Input:         file - value of R1 on entry
 *                ext - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x3.
 */

extern os_error *xosargs_set_ext (os_f file,
      int ext);
extern void osargs_set_ext (os_f file,
      int ext);

/* ------------------------------------------------------------------------
 * Function:      osargs_set_extw()
 *
 * Description:   Writes an open file's extent. Uses 32-bit file handle.
 *
 * Input:         file - value of R1 on entry
 *                ext - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x3.
 */

extern os_error *xosargs_set_extw (os_fw file,
      int ext);
extern void osargs_set_extw (os_fw file,
      int ext);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_allocation()
 *
 * Description:   Reads an open file's allocated size. Prefer
 *                OSArgs_ReadAllocationW
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        allocation - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x4.
 */

extern os_error *xosargs_read_allocation (os_f file,
      int *allocation);
extern int osargs_read_allocation (os_f file);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_allocationw()
 *
 * Description:   Reads an open file's allocated size. Uses 32-bit file
 *                handle.
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        allocation - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x4.
 */

extern os_error *xosargs_read_allocationw (os_fw file,
      int *allocation);
extern int osargs_read_allocationw (os_fw file);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_eof_status()
 *
 * Description:   Reads an open file's end-of-file (EOF) status. Prefer
 *                OSArgs_ReadEOFStatusW
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        eof_status - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x5.
 */

extern os_error *xosargs_read_eof_status (os_f file,
      osbool *eof_status);
extern osbool osargs_read_eof_status (os_f file);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_eof_statusw()
 *
 * Description:   Reads an open file's end-of-file (EOF) status. Uses
 *                32-bit file handle.
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        eof_status - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x5.
 */

extern os_error *xosargs_read_eof_statusw (os_fw file,
      osbool *eof_status);
extern osbool osargs_read_eof_statusw (os_fw file);

/* ------------------------------------------------------------------------
 * Function:      osargs_set_allocation()
 *
 * Description:   Ensures an open file's size. Prefer OSArgs_SetAllocationW
 *
 * Input:         file - value of R1 on entry
 *                allocation - value of R2 on entry
 *
 * Output:        allocation_out - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x6.
 */

extern os_error *xosargs_set_allocation (os_f file,
      int allocation,
      int *allocation_out);
extern int osargs_set_allocation (os_f file,
      int allocation);

/* ------------------------------------------------------------------------
 * Function:      osargs_set_allocationw()
 *
 * Description:   Ensures an open file's size. Uses 32-bit file handle.
 *
 * Input:         file - value of R1 on entry
 *                allocation - value of R2 on entry
 *
 * Output:        allocation_out - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x6.
 */

extern os_error *xosargs_set_allocationw (os_fw file,
      int allocation,
      int *allocation_out);
extern int osargs_set_allocationw (os_fw file,
      int allocation);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_path()
 *
 * Description:   Converts a file handle to a canonical name. Prefer
 *                OSArgs_ReadPathW
 *
 * Input:         file - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R5 on entry
 *
 * Output:        spare - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x7.
 */

extern os_error *xosargs_read_path (os_f file,
      char *buffer,
      int size,
      int *spare);
extern int osargs_read_path (os_f file,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_pathw()
 *
 * Description:   Converts a file handle to a canonical name. Uses 32-bit
 *                file handle.
 *
 * Input:         file - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R5 on entry
 *
 * Output:        spare - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x7.
 */

extern os_error *xosargs_read_pathw (os_fw file,
      char *buffer,
      int size,
      int *spare);
extern int osargs_read_pathw (os_fw file,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osargs_image_stamped()
 *
 * Description:   Used by an image filing system to inform of a change to
 *                an image stamp. Prefer OSArgs_ImageStampedW
 *
 * Input:         file - value of R1 on entry
 *                image_stamp - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x8.
 */

extern os_error *xosargs_image_stamped (os_f file,
      int image_stamp);
extern void osargs_image_stamped (os_f file,
      int image_stamp);

/* ------------------------------------------------------------------------
 * Function:      osargs_image_stampedw()
 *
 * Description:   Used by an image filing system to inform of a change to
 *                an image stamp. Uses 32-bit file handle.
 *
 * Input:         file - value of R1 on entry
 *                image_stamp - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x8.
 */

extern os_error *xosargs_image_stampedw (os_fw file,
      int image_stamp);
extern void osargs_image_stampedw (os_fw file,
      int image_stamp);

/* ------------------------------------------------------------------------
 * Function:      osargs_io_ctl()
 *
 * Description:   Passes an I/O control command to a device driver - RISC O
 *                S 4+
 *
 * Input:         file - value of R1 on entry
 *                parameters - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0x0.
 */

extern os_error *xosargs_io_ctl (os_f file,
      osargs_io_ctl_parameters *parameters);
extern void osargs_io_ctl (os_f file,
      osargs_io_ctl_parameters *parameters);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_info()
 *
 * Description:   Reads information on a file handle. Prefer
 *                OSArgs_ReadInfoW
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        stream_status - value of R0 on exit
 *                fs_info - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0xFE.
 */

extern os_error *xosargs_read_info (os_f file,
      osargs_stream_status *stream_status,
      fileswitch_fs_info *fs_info);
extern void osargs_read_info (os_f file,
      osargs_stream_status *stream_status,
      fileswitch_fs_info *fs_info);

/* ------------------------------------------------------------------------
 * Function:      osargs_read_infow()
 *
 * Description:   Reads information on a file handle. Uses 32-bit file
 *                handle.
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        stream_status - value of R0 on exit
 *                fs_info - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0xFE.
 */

extern os_error *xosargs_read_infow (os_fw file,
      osargs_stream_status *stream_status,
      fileswitch_fs_info *fs_info);
extern void osargs_read_infow (os_fw file,
      osargs_stream_status *stream_status,
      fileswitch_fs_info *fs_info);

/* ------------------------------------------------------------------------
 * Function:      osargs_ensure()
 *
 * Description:   Ensures data has been written to a file, or to all files
 *                on the temporary filing system. Prefer OSArgs_EnsureW
 *
 * Input:         file - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0xFF.
 */

extern os_error *xosargs_ensure (os_f file);
extern void osargs_ensure (os_f file);

/* ------------------------------------------------------------------------
 * Function:      osargs_ensurew()
 *
 * Description:   Ensures data has been written to a file, or to all files
 *                on the temporary filing system. Uses 32-bit file handle.
 *
 * Input:         file - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x9 with R0 = 0xFF.
 */

extern os_error *xosargs_ensurew (os_fw file);
extern void osargs_ensurew (os_fw file);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#ifndef osargs32_H
#include "oslib/osargs32.h"
#endif

#endif
