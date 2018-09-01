#ifndef cdfs_H
#define cdfs_H

/* C header file for CDFS
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:52 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 22 June 1995
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

#ifndef filecore_H
#include "oslib/filecore.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  CDFS_ConvertDriveToDevice
#define CDFS_ConvertDriveToDevice               0x41E80
#undef  XCDFS_ConvertDriveToDevice
#define XCDFS_ConvertDriveToDevice              0x61E80
#undef  CDFS_SetBufferSize
#define CDFS_SetBufferSize                      0x41E81
#undef  XCDFS_SetBufferSize
#define XCDFS_SetBufferSize                     0x61E81
#undef  CDFS_GetBufferSize
#define CDFS_GetBufferSize                      0x41E82
#undef  XCDFS_GetBufferSize
#define XCDFS_GetBufferSize                     0x61E82
#undef  CDFS_SetNumberOfDrives
#define CDFS_SetNumberOfDrives                  0x41E83
#undef  XCDFS_SetNumberOfDrives
#define XCDFS_SetNumberOfDrives                 0x61E83
#undef  CDFS_GetNumberOfDrives
#define CDFS_GetNumberOfDrives                  0x41E84
#undef  XCDFS_GetNumberOfDrives
#define XCDFS_GetNumberOfDrives                 0x61E84
#undef  CDFS_GiveFileType
#define CDFS_GiveFileType                       0x41E85
#undef  XCDFS_GiveFileType
#define XCDFS_GiveFileType                      0x61E85
#undef  CDFS_DescribeDisc
#define CDFS_DescribeDisc                       0x41E86
#undef  XCDFS_DescribeDisc
#define XCDFS_DescribeDisc                      0x61E86
#undef  CDFS_WhereIsFile
#define CDFS_WhereIsFile                        0x41E87
#undef  XCDFS_WhereIsFile
#define XCDFS_WhereIsFile                       0x61E87
#undef  CDFS_Truncation
#define CDFS_Truncation                         0x41E88
#undef  XCDFS_Truncation
#define XCDFS_Truncation                        0x61E88
#undef  CDFSTruncation_Read
#define CDFSTruncation_Read                     0x0
#undef  CDFSTruncation_Write
#define CDFSTruncation_Write                    0x1

/********************
 * Type definitions *
 ********************/
typedef int cdfs_truncation_type;

/************************
 * Constant definitions *
 ************************/
#define cdfs_TRUNCATION_FROM_RIGHT              ((cdfs_truncation_type) 0x0u)
#define cdfs_TRUNCATION_FROM_LEFT               ((cdfs_truncation_type) 0x1u)
#define cdfs_TRUNCATION_NONE                    ((cdfs_truncation_type) 0x2u)
#define cdfs_TRUNCATION_DEFAULT                 ((cdfs_truncation_type) 0xFFFFFFFFu)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      cdfs_convert_drive_to_device()
 *
 * Description:   Converts a logical drive number to a physical drive
 *                number
 *
 * Input:         log_no - value of R0 on entry
 *
 * Output:        phys_no - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41E80.
 */

extern os_error *xcdfs_convert_drive_to_device (int log_no,
      int *phys_no);
extern int cdfs_convert_drive_to_device (int log_no);

/* ------------------------------------------------------------------------
 * Function:      cdfs_set_buffer_size()
 *
 * Description:   Calls SWI 0x41E81
 *
 * Input:         buffer_size_exp - value of R0 on entry
 */

extern os_error *xcdfs_set_buffer_size (int buffer_size_exp);
__swi (0x41E81) void cdfs_set_buffer_size (int buffer_size_exp);

/* ------------------------------------------------------------------------
 * Function:      cdfs_get_buffer_size()
 *
 * Description:   Calls SWI 0x41E82
 *
 * Output:        buffer_size_exp - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 */

extern os_error *xcdfs_get_buffer_size (int *buffer_size_exp);
__swi (0x41E82) int cdfs_get_buffer_size (void);

/* ------------------------------------------------------------------------
 * Function:      cdfs_set_number_of_drives()
 *
 * Description:   Calls SWI 0x41E83
 *
 * Input:         drive_count - value of R0 on entry
 */

extern os_error *xcdfs_set_number_of_drives (int drive_count);
__swi (0x41E83) void cdfs_set_number_of_drives (int drive_count);

/* ------------------------------------------------------------------------
 * Function:      cdfs_get_number_of_drives()
 *
 * Description:   Calls SWI 0x41E84
 *
 * Output:        drive_count - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 */

extern os_error *xcdfs_get_number_of_drives (int *drive_count);
__swi (0x41E84) int cdfs_get_number_of_drives (void);

/* ------------------------------------------------------------------------
 * Function:      cdfs_give_file_type()
 *
 * Description:   Do not use
 *
 * Input:         file_name - value of R0 on entry
 *
 * Output:        file_type - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41E85.
 */

extern os_error *xcdfs_give_file_type (char const *file_name,
      bits *file_type);
extern bits cdfs_give_file_type (char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      cdfs_describe_disc()
 *
 * Description:   Do not use
 *
 * Input:         log_no - value of R0 on entry
 *                disc - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x41E86.
 */

extern os_error *xcdfs_describe_disc (int log_no,
      filecore_disc *disc);
__swi (0x41E86) void cdfs_describe_disc (int log_no,
      filecore_disc *disc);

/* ------------------------------------------------------------------------
 * Function:      cdfs_where_is_file()
 *
 * Description:   Calls SWI 0x41E87
 *
 * Input:         file_name - value of R0 on entry
 *
 * Output:        block_no - value of R1 on exit
 *                size - value of R2 on exit
 */

extern os_error *xcdfs_where_is_file (char const *file_name,
      int *block_no,
      int *size);
extern void cdfs_where_is_file (char const *file_name,
      int *block_no,
      int *size);

/* ------------------------------------------------------------------------
 * Function:      cdfstruncation_read()
 *
 * Description:   Calls reason code 0 of SWI 0x41E88
 *
 * Output:        type - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Before entry, R0 = 0x0.
 */

extern os_error *xcdfstruncation_read (cdfs_truncation_type *type);
extern cdfs_truncation_type cdfstruncation_read (void);

/* ------------------------------------------------------------------------
 * Function:      cdfstruncation_write()
 *
 * Description:   Calls reason code 1 of SWI 0x41E88
 *
 * Input:         type - value of R1 on entry
 *
 * Other notes:   Before entry, R0 = 0x1.
 */

extern os_error *xcdfstruncation_write (cdfs_truncation_type type);
extern void cdfstruncation_write (cdfs_truncation_type type);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
