#ifndef ramfs_H
#define ramfs_H

/* C header file for RamFS
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 12 May 1995
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
#undef  RamFS_DiscOp
#define RamFS_DiscOp                            0x40780
#undef  XRamFS_DiscOp
#define XRamFS_DiscOp                           0x60780
#undef  RamFSDiscOp_Verify
#define RamFSDiscOp_Verify                      0x0
#undef  RamFSDiscOp_ReadSectors
#define RamFSDiscOp_ReadSectors                 0x1
#undef  RamFSDiscOp_WriteSectors
#define RamFSDiscOp_WriteSectors                0x2
#undef  RamFSDiscOp_ReadTrack
#define RamFSDiscOp_ReadTrack                   0x3
#undef  RamFSDiscOp_ReadId
#define RamFSDiscOp_ReadId                      0x3
#undef  RamFSDiscOp_WriteTrack
#define RamFSDiscOp_WriteTrack                  0x4
#undef  RamFSDiscOp_FormatTrack
#define RamFSDiscOp_FormatTrack                 0x4
#undef  RamFSDiscOp_Seek
#define RamFSDiscOp_Seek                        0x5
#undef  RamFSDiscOp_Restore
#define RamFSDiscOp_Restore                     0x6
#undef  RamFSDiscOp_StepIn
#define RamFSDiscOp_StepIn                      0x7
#undef  RamFSDiscOp_StepOut
#define RamFSDiscOp_StepOut                     0x8
#undef  RamFSDiscOp_ReadSectorsViaCache
#define RamFSDiscOp_ReadSectorsViaCache         0x9
#undef  RamFSDiscOp_Specify
#define RamFSDiscOp_Specify                     0xF
#undef  RamFS_Drives
#define RamFS_Drives                            0x40782
#undef  XRamFS_Drives
#define XRamFS_Drives                           0x60782
#undef  RamFS_FreeSpace
#define RamFS_FreeSpace                         0x40783
#undef  XRamFS_FreeSpace
#define XRamFS_FreeSpace                        0x60783
#undef  RamFS_DescribeDisc
#define RamFS_DescribeDisc                      0x40785
#undef  XRamFS_DescribeDisc
#define XRamFS_DescribeDisc                     0x60785

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_verify()
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
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x0.
 */

extern os_error *xramfsdiscop_verify (bits flags,
      filecore_disc_address disc_addr,
      int size,
      filecore_disc_address *next_disc_addr,
      int *unverified);
extern int ramfsdiscop_verify (bits flags,
      filecore_disc_address disc_addr,
      int size,
      filecore_disc_address *next_disc_addr);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_read_sectors()
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
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x1.
 */

extern os_error *xramfsdiscop_read_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *unread);
extern int ramfsdiscop_read_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      filecore_disc_address *next_disc_addr,
      byte **next_data);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_write_sectors()
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
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x2.
 */

extern os_error *xramfsdiscop_write_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte const *data,
      int size,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *unwritten);
extern int ramfsdiscop_write_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte const *data,
      int size,
      filecore_disc_address *next_disc_addr,
      byte **next_data);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_read_track()
 *
 * Description:   Reads a track from a floppy disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x3.
 */

extern os_error *xramfsdiscop_read_track (bits flags,
      filecore_disc_address disc_addr,
      byte *data);
extern void ramfsdiscop_read_track (bits flags,
      filecore_disc_address disc_addr,
      byte *data);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_read_id()
 *
 * Description:   Reads a hard disc ID
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x3.
 */

extern os_error *xramfsdiscop_read_id (bits flags,
      filecore_disc_address disc_addr,
      byte *data);
extern void ramfsdiscop_read_id (bits flags,
      filecore_disc_address disc_addr,
      byte *data);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_write_track()
 *
 * Description:   Writes a track to a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x4.
 */

extern os_error *xramfsdiscop_write_track (bits flags,
      filecore_disc_address disc_addr,
      byte const *data);
extern void ramfsdiscop_write_track (bits flags,
      filecore_disc_address disc_addr,
      byte const *data);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_format_track()
 *
 * Description:   Formats a track of a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                track_format - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x4, R3 = 0x0.
 */

extern os_error *xramfsdiscop_format_track (bits flags,
      filecore_disc_address disc_addr,
      filecore_track_format const *track_format);
extern void ramfsdiscop_format_track (bits flags,
      filecore_disc_address disc_addr,
      filecore_track_format const *track_format);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_seek()
 *
 * Description:   Seeks to a disc location
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x5.
 */

extern os_error *xramfsdiscop_seek (bits flags,
      filecore_disc_address disc_addr);
extern void ramfsdiscop_seek (bits flags,
      filecore_disc_address disc_addr);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_restore()
 *
 * Description:   Does a restore operation for a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x6.
 */

extern os_error *xramfsdiscop_restore (bits flags,
      filecore_disc_address disc_addr);
extern void ramfsdiscop_restore (bits flags,
      filecore_disc_address disc_addr);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_step_in()
 *
 * Description:   Steps a floppy disc in one track
 *
 * Input:         flags - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x7.
 */

extern os_error *xramfsdiscop_step_in (bits flags);
extern void ramfsdiscop_step_in (bits flags);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_step_out()
 *
 * Description:   Steps a floppy disc out one track
 *
 * Input:         flags - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x8.
 */

extern os_error *xramfsdiscop_step_out (bits flags);
extern void ramfsdiscop_step_out (bits flags);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_read_sectors_via_cache()
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
 * Other notes:   Calls SWI 0x40780 with R1 |= 0x9.
 */

extern os_error *xramfsdiscop_read_sectors_via_cache (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      int cache_handle,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *unread,
      int *cache_handle_out);
extern int ramfsdiscop_read_sectors_via_cache (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      int cache_handle,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *cache_handle_out);

/* ------------------------------------------------------------------------
 * Function:      ramfsdiscop_specify()
 *
 * Description:   Does a specify operation on a hard disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x40780 with R1 |= 0xF.
 */

extern os_error *xramfsdiscop_specify (bits flags,
      filecore_disc_address disc_addr);
extern void ramfsdiscop_specify (bits flags,
      filecore_disc_address disc_addr);

/* ------------------------------------------------------------------------
 * Function:      ramfs_drives()
 *
 * Description:   Returns information on RamFS' drives
 *
 * Output:        default_drive - value of R0 on exit
 *                floppy_count - value of R1 on exit
 *                hard_disc_count - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40782.
 */

extern os_error *xramfs_drives (int *default_drive,
      int *floppy_count,
      int *hard_disc_count);
extern void ramfs_drives (int *default_drive,
      int *floppy_count,
      int *hard_disc_count);

/* ------------------------------------------------------------------------
 * Function:      ramfs_free_space()
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
 * Other notes:   Calls SWI 0x40783.
 */

extern os_error *xramfs_free_space (char const *disc_name,
      int *free,
      int *max);
extern int ramfs_free_space (char const *disc_name,
      int *max);

/* ------------------------------------------------------------------------
 * Function:      ramfs_describe_disc()
 *
 * Description:   Returns a disc record describing a disc's shape and
 *                format
 *
 * Input:         disc_name - value of R0 on entry
 *                disc - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40785.
 */

extern os_error *xramfs_describe_disc (char const *disc_name,
      filecore_disc *disc);
__swi (0x40785) void ramfs_describe_disc (char const *disc_name,
      filecore_disc *disc);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
