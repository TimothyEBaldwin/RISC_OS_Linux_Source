#ifndef scsifs_H
#define scsifs_H

/* C header file for SCSIFS
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 27 June 1995
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
#undef  SCSIFS_DiscOp
#define SCSIFS_DiscOp                           0x40980
#undef  XSCSIFS_DiscOp
#define XSCSIFS_DiscOp                          0x60980
#undef  SCSIFSDiscOp_Verify
#define SCSIFSDiscOp_Verify                     0x0
#undef  SCSIFSDiscOp_ReadSectors
#define SCSIFSDiscOp_ReadSectors                0x1
#undef  SCSIFSDiscOp_WriteSectors
#define SCSIFSDiscOp_WriteSectors               0x2
#undef  SCSIFSDiscOp_ReadTrack
#define SCSIFSDiscOp_ReadTrack                  0x3
#undef  SCSIFSDiscOp_ReadId
#define SCSIFSDiscOp_ReadId                     0x3
#undef  SCSIFSDiscOp_WriteTrack
#define SCSIFSDiscOp_WriteTrack                 0x4
#undef  SCSIFSDiscOp_FormatTrack
#define SCSIFSDiscOp_FormatTrack                0x4
#undef  SCSIFSDiscOp_Seek
#define SCSIFSDiscOp_Seek                       0x5
#undef  SCSIFSDiscOp_Restore
#define SCSIFSDiscOp_Restore                    0x6
#undef  SCSIFSDiscOp_ReadSectorsViaCache
#define SCSIFSDiscOp_ReadSectorsViaCache        0x9
#undef  SCSIFSDiscOp_Specify
#define SCSIFSDiscOp_Specify                    0xF
#undef  SCSIFS_Drives
#define SCSIFS_Drives                           0x40982
#undef  XSCSIFS_Drives
#define XSCSIFS_Drives                          0x60982
#undef  SCSIFS_FreeSpace
#define SCSIFS_FreeSpace                        0x40983
#undef  XSCSIFS_FreeSpace
#define XSCSIFS_FreeSpace                       0x60983
#undef  SCSIFS_DescribeDisc
#define SCSIFS_DescribeDisc                     0x40985
#undef  XSCSIFS_DescribeDisc
#define XSCSIFS_DescribeDisc                    0x60985
#undef  SCSIFS_TestReady
#define SCSIFS_TestReady                        0x40986
#undef  XSCSIFS_TestReady
#define XSCSIFS_TestReady                       0x60986
#undef  SCSIFS_TestMounted
#define SCSIFS_TestMounted                      0x40987
#undef  XSCSIFS_TestMounted
#define XSCSIFS_TestMounted                     0x60987
#undef  SCSIFS_MiscOp
#define SCSIFS_MiscOp                           0x4098C
#undef  XSCSIFS_MiscOp
#define XSCSIFS_MiscOp                          0x6098C
#undef  SCSIFS_SectorDiscOp
#define SCSIFS_SectorDiscOp                     0x4098D
#undef  XSCSIFS_SectorDiscOp
#define XSCSIFS_SectorDiscOp                    0x6098D
#undef  SCSIFS_FreeSpace64
#define SCSIFS_FreeSpace64                      0x40992
#undef  XSCSIFS_FreeSpace64
#define XSCSIFS_FreeSpace64                     0x60992

/********************
 * Type definitions *
 ********************/
typedef int scsifs_drive_status;

/************************
 * Constant definitions *
 ************************/
#define scsifs_DRIVE_ABSENT                     ((scsifs_drive_status) 0x0u)
      /*drive not present*/
#define scsifs_DRIVE_UNREADY                    ((scsifs_drive_status) 0x1u)
      /*not present, or present but not ready*/
#define scsifs_DRIVE_READY                      ((scsifs_drive_status) 0x2u)
      /*drive present and ready*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_verify()
 *
 * Description:   Verifies a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                size - value of R4 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                unverified - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0x0.
 */

extern os_error *xscsifsdiscop_verify (bits flags,
      filecore_disc_address disc_addr,
      int size,
      filecore_disc_address *next_disc_addr,
      int *unverified);
extern int scsifsdiscop_verify (bits flags,
      filecore_disc_address disc_addr,
      int size,
      filecore_disc_address *next_disc_addr);

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_read_sectors()
 *
 * Description:   Reads sectors from a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unread - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0x1.
 */

extern os_error *xscsifsdiscop_read_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *unread);
extern int scsifsdiscop_read_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      filecore_disc_address *next_disc_addr,
      byte **next_data);

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_write_sectors()
 *
 * Description:   Writes sectors to a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unwritten - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0x2.
 */

extern os_error *xscsifsdiscop_write_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte const *data,
      int size,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *unwritten);
extern int scsifsdiscop_write_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte const *data,
      int size,
      filecore_disc_address *next_disc_addr,
      byte **next_data);

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_read_track()
 *
 * Description:   Reads a track from a floppy disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0x3.
 */

extern os_error *xscsifsdiscop_read_track (bits flags,
      filecore_disc_address disc_addr,
      byte *data);
extern void scsifsdiscop_read_track (bits flags,
      filecore_disc_address disc_addr,
      byte *data);

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_read_id()
 *
 * Description:   Reads a hard disc ID
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0x3.
 */

extern os_error *xscsifsdiscop_read_id (bits flags,
      filecore_disc_address disc_addr,
      byte *data);
extern void scsifsdiscop_read_id (bits flags,
      filecore_disc_address disc_addr,
      byte *data);

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_write_track()
 *
 * Description:   Writes a track to a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0x4.
 */

extern os_error *xscsifsdiscop_write_track (bits flags,
      filecore_disc_address disc_addr,
      byte const *data);
extern void scsifsdiscop_write_track (bits flags,
      filecore_disc_address disc_addr,
      byte const *data);

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_format_track()
 *
 * Description:   Formats a track of a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                format - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0x4, R3 = 0x0.
 */

extern os_error *xscsifsdiscop_format_track (bits flags,
      filecore_disc_address disc_addr,
      filecore_track_format const *format);
extern void scsifsdiscop_format_track (bits flags,
      filecore_disc_address disc_addr,
      filecore_track_format const *format);

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_seek()
 *
 * Description:   Seeks to a disc location
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0x5.
 */

extern os_error *xscsifsdiscop_seek (bits flags,
      filecore_disc_address disc_addr);
extern void scsifsdiscop_seek (bits flags,
      filecore_disc_address disc_addr);

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_restore()
 *
 * Description:   Does a restore operation for a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0x6.
 */

extern os_error *xscsifsdiscop_restore (bits flags,
      filecore_disc_address disc_addr);
extern void scsifsdiscop_restore (bits flags,
      filecore_disc_address disc_addr);

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_read_sectors_via_cache()
 *
 * Description:   Reads sectors of a disc using the RMA cache
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                cache_handle - value of R6 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unread - value of R4 on exit (X version only)
 *                cache_handle_out - value of R6 on exit
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0x9.
 */

extern os_error *xscsifsdiscop_read_sectors_via_cache (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      int cache_handle,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *unread,
      int *cache_handle_out);
extern int scsifsdiscop_read_sectors_via_cache (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      int cache_handle,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *cache_handle_out);

/* ------------------------------------------------------------------------
 * Function:      scsifsdiscop_specify()
 *
 * Description:   Does a specify operation on a hard disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x40980 with R1 |= 0xF.
 */

extern os_error *xscsifsdiscop_specify (bits flags,
      filecore_disc_address disc_addr);
extern void scsifsdiscop_specify (bits flags,
      filecore_disc_address disc_addr);

/* ------------------------------------------------------------------------
 * Function:      scsifs_drives()
 *
 * Description:   Returns information on SCSIFS' drives
 *
 * Output:        default_drive - value of R0 on exit
 *                floppy_count - value of R1 on exit
 *                hard_disc_count - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40982.
 */

extern os_error *xscsifs_drives (int *default_drive,
      int *floppy_count,
      int *hard_disc_count);
extern void scsifs_drives (int *default_drive,
      int *floppy_count,
      int *hard_disc_count);

/* ------------------------------------------------------------------------
 * Function:      scsifs_free_space()
 *
 * Description:   Returns information on a disc's free space
 *
 * Input:         disc_name - value of R0 on entry
 *
 * Output:        free - value of R0 on exit (X version only)
 *                max - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40983.
 */

extern os_error *xscsifs_free_space (char const *disc_name,
      int *free,
      int *max);
extern int scsifs_free_space (char const *disc_name,
      int *max);

/* ------------------------------------------------------------------------
 * Function:      scsifs_describe_disc()
 *
 * Description:   Returns a disc record describing a disc's shape and
 *                format
 *
 * Input:         disc_name - value of R0 on entry
 *                disc - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40985.
 */

extern os_error *xscsifs_describe_disc (char const *disc_name,
      filecore_disc *disc);
__swi (0x40985) void scsifs_describe_disc (char const *disc_name,
      filecore_disc *disc);

/* ------------------------------------------------------------------------
 * Function:      scsifs_test_ready()
 *
 * Description:   Tests whether a drive is ready
 *
 * Input:         drive_no - value of R1 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40986.
 */

extern os_error *xscsifs_test_ready (int drive_no,
      scsifs_drive_status *status);
extern scsifs_drive_status scsifs_test_ready (int drive_no);

/* ------------------------------------------------------------------------
 * Function:      scsifs_test_mounted()
 *
 * Description:   Determines which devices are currently mounted
 *
 * Output:        flags - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40987.
 */

extern os_error *xscsifs_test_mounted (bits *flags);
__swi (0x40987) bits scsifs_test_mounted (void);

/* ------------------------------------------------------------------------
 * Function:      scsifs_free_space64()
 *
 * Description:   Returns 64-bit information on a disc's free space - needs
 *                FileCore 2.94+ or RISC O S 3.6+
 *
 * Input:         disc_name - value of R0 on entry
 *
 * Output:        free_lo - value of R0 on exit
 *                free_hi - value of R1 on exit
 *                max - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40992.
 */

extern os_error *xscsifs_free_space64 (char const *disc_name,
      bits *free_lo,
      int *free_hi,
      int *max);
extern void scsifs_free_space64 (char const *disc_name,
      bits *free_lo,
      int *free_hi,
      int *max);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
