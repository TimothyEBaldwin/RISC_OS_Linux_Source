#ifndef filecore_H
#define filecore_H

/* C header file for FileCore
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:52 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 21 Aug 1995
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
#undef  FileCore_DiscOp
#define FileCore_DiscOp                         0x40540
#undef  XFileCore_DiscOp
#define XFileCore_DiscOp                        0x60540
#undef  FileCoreDiscOp_Verify
#define FileCoreDiscOp_Verify                   0x0
#undef  FileCoreDiscOp_ReadSectors
#define FileCoreDiscOp_ReadSectors              0x1
#undef  FileCoreDiscOp_WriteSectors
#define FileCoreDiscOp_WriteSectors             0x2
#undef  FileCoreDiscOp_ReadTrack
#define FileCoreDiscOp_ReadTrack                0x3
#undef  FileCoreDiscOp_ReadId
#define FileCoreDiscOp_ReadId                   0x3
#undef  FileCoreDiscOp_WriteTrack
#define FileCoreDiscOp_WriteTrack               0x4
#undef  FileCoreDiscOp_FormatTrack
#define FileCoreDiscOp_FormatTrack              0x4
#undef  FileCoreDiscOp_Seek
#define FileCoreDiscOp_Seek                     0x5
#undef  FileCoreDiscOp_Restore
#define FileCoreDiscOp_Restore                  0x6
#undef  FileCoreDiscOp_StepIn
#define FileCoreDiscOp_StepIn                   0x7
#undef  FileCoreDiscOp_StepOut
#define FileCoreDiscOp_StepOut                  0x8
#undef  FileCoreDiscOp_ReadSectorsViaCache
#define FileCoreDiscOp_ReadSectorsViaCache      0x9
#undef  FileCoreDiscOp_Specify
#define FileCoreDiscOp_Specify                  0xF
#undef  FileCore_Create
#define FileCore_Create                         0x40541
#undef  XFileCore_Create
#define XFileCore_Create                        0x60541
#undef  FileCore_Drives
#define FileCore_Drives                         0x40542
#undef  XFileCore_Drives
#define XFileCore_Drives                        0x60542
#undef  FileCore_FreeSpace
#define FileCore_FreeSpace                      0x40543
#undef  XFileCore_FreeSpace
#define XFileCore_FreeSpace                     0x60543
#undef  FileCore_FloppyStructure
#define FileCore_FloppyStructure                0x40544
#undef  XFileCore_FloppyStructure
#define XFileCore_FloppyStructure               0x60544
#undef  FileCore_DescribeDisc
#define FileCore_DescribeDisc                   0x40545
#undef  XFileCore_DescribeDisc
#define XFileCore_DescribeDisc                  0x60545
#undef  FileCore_DiscardReadSectorsCache
#define FileCore_DiscardReadSectorsCache        0x40546
#undef  XFileCore_DiscardReadSectorsCache
#define XFileCore_DiscardReadSectorsCache       0x60546
#undef  FileCore_DiscFormat
#define FileCore_DiscFormat                     0x40547
#undef  XFileCore_DiscFormat
#define XFileCore_DiscFormat                    0x60547
#undef  FileCore_LayoutStructure
#define FileCore_LayoutStructure                0x40548
#undef  XFileCore_LayoutStructure
#define XFileCore_LayoutStructure               0x60548
#undef  FileCore_LayoutStructureW
#define FileCore_LayoutStructureW               0x40548
#undef  XFileCore_LayoutStructureW
#define XFileCore_LayoutStructureW              0x60548
#undef  FileCore_MiscOp
#define FileCore_MiscOp                         0x40549
#undef  XFileCore_MiscOp
#define XFileCore_MiscOp                        0x60549
#undef  FileCoreMiscOp_Mount
#define FileCoreMiscOp_Mount                    0x0
#undef  FileCoreMiscOp_PollChanged
#define FileCoreMiscOp_PollChanged              0x1
#undef  FileCoreMiscOp_LockDrive
#define FileCoreMiscOp_LockDrive                0x2
#undef  FileCoreMiscOp_UnlockDrive
#define FileCoreMiscOp_UnlockDrive              0x3
#undef  FileCoreMiscOp_PollPeriod
#define FileCoreMiscOp_PollPeriod               0x4
#undef  FileCoreMiscOp_EjectDisc
#define FileCoreMiscOp_EjectDisc                0x5
#undef  FileCoreMiscOp_ReadInfo
#define FileCoreMiscOp_ReadInfo                 0x6
#undef  FileCoreMiscOp_DriveStatus
#define FileCoreMiscOp_DriveStatus              0x7
#undef  FileCore_SectorOp
#define FileCore_SectorOp                       0x4054A
#undef  XFileCore_SectorOp
#define XFileCore_SectorOp                      0x6054A
#undef  FileCoreSectorOp_Verify
#define FileCoreSectorOp_Verify                 0x0
#undef  FileCoreSectorOp_ReadSectors
#define FileCoreSectorOp_ReadSectors            0x1
#undef  FileCoreSectorOp_WriteSectors
#define FileCoreSectorOp_WriteSectors           0x2
#undef  FileCoreSectorOp_ReadTrack
#define FileCoreSectorOp_ReadTrack              0x3
#undef  FileCoreSectorOp_ReadId
#define FileCoreSectorOp_ReadId                 0x3
#undef  FileCoreSectorOp_WriteTrack
#define FileCoreSectorOp_WriteTrack             0x4
#undef  FileCoreSectorOp_FormatTrack
#define FileCoreSectorOp_FormatTrack            0x4
#undef  FileCoreSectorOp_Seek
#define FileCoreSectorOp_Seek                   0x5
#undef  FileCoreSectorOp_Restore
#define FileCoreSectorOp_Restore                0x6
#undef  FileCoreSectorOp_StepIn
#define FileCoreSectorOp_StepIn                 0x7
#undef  FileCoreSectorOp_StepOut
#define FileCoreSectorOp_StepOut                0x8
#undef  FileCoreSectorOp_ReadSectorsViaCache
#define FileCoreSectorOp_ReadSectorsViaCache    0x9
#undef  FileCoreSectorOp_Specify
#define FileCoreSectorOp_Specify                0xF
#undef  FileCore_FreeSpace64
#define FileCore_FreeSpace64                    0x4054B
#undef  XFileCore_FreeSpace64
#define XFileCore_FreeSpace64                   0x6054B
#undef  FileCore_DiscOp64
#define FileCore_DiscOp64                       0x4054C
#undef  XFileCore_DiscOp64
#define XFileCore_DiscOp64                      0x6054C
#undef  FileCoreDiscOp64_Verify
#define FileCoreDiscOp64_Verify                 0x0
#undef  FileCoreDiscOp64_ReadSectors
#define FileCoreDiscOp64_ReadSectors            0x1
#undef  FileCoreDiscOp64_WriteSectors
#define FileCoreDiscOp64_WriteSectors           0x2
#undef  FileCoreDiscOp64_ReadTrack
#define FileCoreDiscOp64_ReadTrack              0x3
#undef  FileCoreDiscOp64_ReadId
#define FileCoreDiscOp64_ReadId                 0x3
#undef  FileCoreDiscOp64_WriteTrack
#define FileCoreDiscOp64_WriteTrack             0x4
#undef  FileCoreDiscOp64_FormatTrack
#define FileCoreDiscOp64_FormatTrack            0x4
#undef  FileCoreDiscOp64_Seek
#define FileCoreDiscOp64_Seek                   0x5
#undef  FileCoreDiscOp64_Restore
#define FileCoreDiscOp64_Restore                0x6
#undef  FileCoreDiscOp64_StepIn
#define FileCoreDiscOp64_StepIn                 0x7
#undef  FileCoreDiscOp64_StepOut
#define FileCoreDiscOp64_StepOut                0x8
#undef  FileCoreDiscOp64_ReadSectorsViaCache
#define FileCoreDiscOp64_ReadSectorsViaCache    0x9
#undef  FileCoreDiscOp64_Specify
#define FileCoreDiscOp64_Specify                0xF
#undef  FileCore_Features
#define FileCore_Features                       0x4054D
#undef  XFileCore_Features
#define XFileCore_Features                      0x6054D
#undef  Service_IdentifyDisc
#define Service_IdentifyDisc                    0x69

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct filecore_descriptor              filecore_descriptor;
typedef struct filecore_disc                    filecore_disc;
typedef struct filecore_disc_address64          filecore_disc_address64;
typedef struct filecore_format                  filecore_format;
typedef struct filecore_track_format            filecore_track_format;
typedef struct filecore_track_format_base       filecore_track_format_base;
typedef struct filecore_defect_list             filecore_defect_list;
typedef struct filecore_defect_list_base        filecore_defect_list_base;
typedef struct filecore_info                    filecore_info;

/********************
 * Type definitions *
 ********************/
struct filecore_descriptor
   {  byte flags [3];
      fileswitch_fs_no fs_no;
      int title_offset;
      int boot_text_offset;
      int disc_op_offset;
      int misc_op_offset;
   };

struct filecore_disc
   {  byte log2secsize;
      byte secspertrack;
      byte heads;
      byte density;
      byte idlen;
      byte log2bpmb;
      byte skew;
      byte bootoption;
      byte lowsector;
      byte nzones;
      short zone_spare;
      int root;
      int disc_size;
      short disc_id;
      char disc_name [10];
      int disctype;
      int disc_size_hi;
      byte share_size;
      byte big_flag;
      byte reserved [22];
   };

typedef bits filecore_disc_address;

typedef bits filecore_sector_disc_address;

struct filecore_disc_address64
   {  byte drive;
      byte reserved [3];
      int offset_low;
      int offset_high;
   };

struct filecore_format
   {  int sector_size;
      int gap1_side0;
      int gap1_side1;
      int gap3;
      byte secspertrack;
      byte density;
      byte options;
      byte lowsector;
      byte interleave;
      byte side_skew;
      byte track_skew;
      byte sector_fill;
      int track_count;
      byte reserved [36];
   };

#define filecore_TRACK_FORMAT_MEMBERS \
   int sector_size; \
   int gap1_side0; \
   int gap1_side1; \
   int gap3; \
   byte secspertrack; \
   byte density; \
   byte options; \
   byte sector_fill; \
   int track_count; \
   byte reserved [12];

/* Base filecore_track_format structure without variable part */
struct filecore_track_format_base
   {  filecore_TRACK_FORMAT_MEMBERS
   };

/* legacy structure */
struct filecore_track_format
   {  filecore_TRACK_FORMAT_MEMBERS
      bits sectors [UNKNOWN];
   };

#define filecore_TRACK_FORMAT(N) \
   struct \
      {  filecore_TRACK_FORMAT_MEMBERS \
         bits sectors [N]; \
      }

#define filecore_SIZEOF_TRACK_FORMAT(N) \
   (offsetof (filecore_track_format, sectors) + \
         (N)*sizeof ((filecore_track_format *) NULL)->sectors)

struct filecore_defect_list
   {  int defect [UNKNOWN];
   };

#define filecore_DEFECT_LIST(N) \
   struct \
      {  int defect [N]; \
      }

#define filecore_SIZEOF_DEFECT_LIST(N) \
   ((N)*sizeof ((filecore_defect_list *) NULL)->defect)

struct filecore_info
   {  byte flags [3];
      fileswitch_fs_no fs_no;
      char *title;
      char *boot_text;
      void *disc_op;
      void *misc_op;
   };

typedef bits filecore_feature_flags;

/************************
 * Constant definitions *
 ************************/
#define filecore_HARD_DISCS_NEED_FIQ            0x1u
#define filecore_FLOPPIES_NEED_FIQ              0x2u
#define filecore_ADDRESS_BY_SECTOR              0x4u
#define filecore_USE_SCRATCH_FOR_TEMPORARY      0x8u
#define filecore_HARD_DISCS_CAN_MOUNT           0x10u
#define filecore_HARD_DISCS_CAN_POLL_CHANGE     0x20u
#define filecore_FLOPPIES_CAN_EJECT             0x40u
#define filecore_HARD_DISCS_CAN_EJECT           0x80u
#define filecore_SUPPORTS_READ_DRIVE_FLAGS      0x100u
      /*RISC O S 3.6+*/
#define filecore_USE_SECTOR_ADDRESSING          0x200u
      /*RISC O S 3.6+*/
#define filecore_RETURNS_NEW_STYLE_ERRORS       0x400u
      /*RISC O S 5+*/
#define filecore_LOW_SECTOR_SEQUENCE_SIDES      0x40u
#define filecore_LOW_SECTOR_DOUBLE_STEP         0x80u
#define filecore_DISC_ADDRESS_OFFSET            0x1FFFFFFFu
#define filecore_DISC_ADDRESS_DRIVE             0xE0000000u
#define filecore_DISC_ADDRESS_OFFSET_SHIFT      0
#define filecore_DISC_ADDRESS_DRIVE_SHIFT       29
#define filecore_DISC_OP_GIVEN_ALTERNATIVE_DEFECT_LIST 0x10u
#define filecore_DISC_OP_GIVEN_SECTOR_LIST      0x20u
#define filecore_DISC_OP_IGNORE_ESCAPE          0x40u
#define filecore_DISC_OP_IGNORE_TIMEOUT         0x80u
#define filecore_DISC_OP_ALTERNATIVE_RECORD     0xFFFFFF00u
#define filecore_DISC_OP_ALTERNATIVE_RECORD_SHIFT 6
#define filecore_CREATE_FLOPPY_COUNT            0xFFu
#define filecore_CREATE_FLOPPY_COUNT_SHIFT      0
#define filecore_CREATE_HARD_DISC_COUNT         0xFF00u
#define filecore_CREATE_HARD_DISC_COUNT_SHIFT   8
#define filecore_CREATE_DEFAULT_DRIVE           0xFF0000u
#define filecore_CREATE_DEFAULT_DRIVE_SHIFT     16
#define filecore_CREATE_NO_DIR_STATE            0x40000000u
#define filecore_FLOPPY_OLD_STRUCTURE           0x80u
#define filecore_FLOPPY_OLD_MAP                 0x100u
#define filecore_FORMATL                        128
#define filecore_FORMATD                        129
#define filecore_FORMATE                        130
#define filecore_FORMATF                        131
#define filecore_POLL_NOT_CHANGED               0x1u
#define filecore_POLL_MAY_BE_CHANGED            0x2u
#define filecore_POLL_CHANGED                   0x4u
#define filecore_POLL_EMPTY                     0x8u
#define filecore_POLL_READY                     0x10u
#define filecore_POLL_FORTY_TRACK               0x20u
#define filecore_POLL_EMPTY_WORKS               0x40u
#define filecore_POLL_CHANGED_WORKS             0x80u
#define filecore_POLL_HIGH_DENSITY              0x100u
#define filecore_POLL_DENSITY_SENSE_WORKS       0x200u
#define filecore_POLL_READY_WORKS               0x400u
#define filecore_FEATURE_NEW_STYLE_ERRORS       ((filecore_feature_flags) 0x1u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_verify()
 *
 * Description:   Verifies a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                size - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                unverified - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x0.
 */

extern os_error *xfilecorediscop_verify (bits flags,
      filecore_disc_address disc_addr,
      int size,
      void *instance,
      filecore_disc_address *next_disc_addr,
      int *unverified);
extern int filecorediscop_verify (bits flags,
      filecore_disc_address disc_addr,
      int size,
      void *instance,
      filecore_disc_address *next_disc_addr);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_read_sectors()
 *
 * Description:   Reads sectors from a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unread - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x1.
 */

extern os_error *xfilecorediscop_read_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      void *instance,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *unread);
extern int filecorediscop_read_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      void *instance,
      filecore_disc_address *next_disc_addr,
      byte **next_data);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_write_sectors()
 *
 * Description:   Writes sectors to a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unwritten - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x2.
 */

extern os_error *xfilecorediscop_write_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte const *data,
      int size,
      void *instance,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *unwritten);
extern int filecorediscop_write_sectors (bits flags,
      filecore_disc_address disc_addr,
      byte const *data,
      int size,
      void *instance,
      filecore_disc_address *next_disc_addr,
      byte **next_data);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_read_track()
 *
 * Description:   Reads a track from a floppy disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x3.
 */

extern os_error *xfilecorediscop_read_track (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      void *instance);
extern void filecorediscop_read_track (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_read_id()
 *
 * Description:   Reads a hard disc ID
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x3.
 */

extern os_error *xfilecorediscop_read_id (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      void *instance);
extern void filecorediscop_read_id (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_write_track()
 *
 * Description:   Writes a track to a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x4.
 */

extern os_error *xfilecorediscop_write_track (bits flags,
      filecore_disc_address disc_addr,
      byte const *data,
      void *instance);
extern void filecorediscop_write_track (bits flags,
      filecore_disc_address disc_addr,
      byte const *data,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_format_track()
 *
 * Description:   Formats a track of a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                track_format - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x4, R3 = 0x0.
 */

extern os_error *xfilecorediscop_format_track (bits flags,
      filecore_disc_address disc_addr,
      filecore_track_format const *track_format,
      void *instance);
extern void filecorediscop_format_track (bits flags,
      filecore_disc_address disc_addr,
      filecore_track_format const *track_format,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_seek()
 *
 * Description:   Seeks to a disc location
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x5.
 */

extern os_error *xfilecorediscop_seek (bits flags,
      filecore_disc_address disc_addr,
      void *instance);
extern void filecorediscop_seek (bits flags,
      filecore_disc_address disc_addr,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_restore()
 *
 * Description:   Does a restore operation for a disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x6.
 */

extern os_error *xfilecorediscop_restore (bits flags,
      filecore_disc_address disc_addr,
      void *instance);
extern void filecorediscop_restore (bits flags,
      filecore_disc_address disc_addr,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_step_in()
 *
 * Description:   Steps a floppy disc in one track
 *
 * Input:         flags - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x7.
 */

extern os_error *xfilecorediscop_step_in (bits flags,
      void *instance);
extern void filecorediscop_step_in (bits flags,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_step_out()
 *
 * Description:   Steps a floppy disc out one track
 *
 * Input:         flags - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x8.
 */

extern os_error *xfilecorediscop_step_out (bits flags,
      void *instance);
extern void filecorediscop_step_out (bits flags,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_read_sectors_via_cache()
 *
 * Description:   Reads sectors of a disc using the RMA cache
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                cache_handle - value of R6 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unread - value of R4 on exit (X version only)
 *                cache_handle_out - value of R6 on exit
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0x9.
 */

extern os_error *xfilecorediscop_read_sectors_via_cache (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      int cache_handle,
      void *instance,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *unread,
      int *cache_handle_out);
extern int filecorediscop_read_sectors_via_cache (bits flags,
      filecore_disc_address disc_addr,
      byte *data,
      int size,
      int cache_handle,
      void *instance,
      filecore_disc_address *next_disc_addr,
      byte **next_data,
      int *cache_handle_out);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop_specify()
 *
 * Description:   Does a specify operation on a hard disc
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40540 with R1 |= 0xF.
 */

extern os_error *xfilecorediscop_specify (bits flags,
      filecore_disc_address disc_addr,
      void *instance);
extern void filecorediscop_specify (bits flags,
      filecore_disc_address disc_addr,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecore_create()
 *
 * Description:   Creates a new instantiation of an ADFS-like filing system
 *
 * Input:         descriptor - value of R0 on entry
 *                module_base - value of R1 on entry
 *                word - value of R2 on entry
 *                options - value of R3 on entry
 *                dir_cache_size - value of R4 on entry
 *                file_cache_buffer_count - value of R5 on entry
 *                map_sizes - value of R6 on entry
 *
 * Output:        instance - value of R0 on exit
 *                floppy_done - value of R1 on exit
 *                hard_disc_done - value of R2 on exit
 *                release_fiq - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x40541.
 */

extern os_error *xfilecore_create (filecore_descriptor const *descriptor,
      byte const *module_base,
      byte *word,
      bits options,
      int dir_cache_size,
      int file_cache_buffer_count,
      bits map_sizes,
      void **instance,
      void **floppy_done,
      void **hard_disc_done,
      void **release_fiq);
extern void filecore_create (filecore_descriptor const *descriptor,
      byte const *module_base,
      byte *word,
      bits options,
      int dir_cache_size,
      int file_cache_buffer_count,
      bits map_sizes,
      void **instance,
      void **floppy_done,
      void **hard_disc_done,
      void **release_fiq);

/* ------------------------------------------------------------------------
 * Function:      filecore_drives()
 *
 * Description:   Returns information on a filing system's drives
 *
 * Input:         instance - value of R8 on entry
 *
 * Output:        default_drive - value of R0 on exit
 *                floppy_count - value of R1 on exit
 *                hard_disc_count - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40542.
 */

extern os_error *xfilecore_drives (void *instance,
      int *default_drive,
      int *floppy_count,
      int *hard_disc_count);
extern void filecore_drives (void *instance,
      int *default_drive,
      int *floppy_count,
      int *hard_disc_count);

/* ------------------------------------------------------------------------
 * Function:      filecore_free_space()
 *
 * Description:   Returns information on a disc's free space
 *
 * Input:         disc_name - value of R0 on entry
 *                instance - value of R8 on entry
 *
 * Output:        free - value of R0 on exit (X version only)
 *                max - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40543.
 */

extern os_error *xfilecore_free_space (char const *disc_name,
      void *instance,
      int *free,
      int *max);
extern int filecore_free_space (char const *disc_name,
      void *instance,
      int *max);

/* ------------------------------------------------------------------------
 * Function:      filecore_floppy_structure()
 *
 * Description:   Creates a RAM image of a floppy disc map and root
 *                directory entry
 *
 * Input:         buffer - value of R0 on entry
 *                disc - value of R1 on entry
 *                flags - value of R2 on entry
 *                defect_list - value of R3 on entry
 *
 * Output:        used - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40544.
 */

extern os_error *xfilecore_floppy_structure (byte *buffer,
      filecore_disc const *disc,
      bits flags,
      filecore_defect_list const *defect_list,
      int *used);
extern int filecore_floppy_structure (byte *buffer,
      filecore_disc const *disc,
      bits flags,
      filecore_defect_list const *defect_list);

/* ------------------------------------------------------------------------
 * Function:      filecore_describe_disc()
 *
 * Description:   Returns a disc record describing a disc's shape and
 *                format
 *
 * Input:         disc_name - value of R0 on entry
 *                disc - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40545.
 */

extern os_error *xfilecore_describe_disc (char const *disc_name,
      filecore_disc *disc,
      void *instance);
extern void filecore_describe_disc (char const *disc_name,
      filecore_disc *disc,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecore_discard_read_sectors_cache()
 *
 * Description:   Discards the cache of read sectors created by
 *                FileCoreDiscOp_ReadSectorsViaCache
 *
 * Input:         cache_handle - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x40546.
 */

extern os_error *xfilecore_discard_read_sectors_cache (int cache_handle);
extern void filecore_discard_read_sectors_cache (int cache_handle);

/* ------------------------------------------------------------------------
 * Function:      filecore_disc_format()
 *
 * Description:   Fills in a disc format structure with parameters for the
 *                specified format
 *
 * Input:         buffer - value of R0 on entry
 *                vet_format_swi - value of R1 on entry
 *                vet_format_handle - value of R2 on entry
 *                format - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40547.
 */

extern os_error *xfilecore_disc_format (filecore_format *buffer,
      int vet_format_swi,
      int vet_format_handle,
      int format);
__swi (0x40547) void filecore_disc_format (filecore_format *buffer,
      int vet_format_swi,
      int vet_format_handle,
      int format);

/* ------------------------------------------------------------------------
 * Function:      filecore_layout_structure()
 *
 * Description:   Lays out into the specified file a set of structures for
 *                its format. Prefer FileCore_LayoutStructureW
 *
 * Input:         disc - value of R0 on entry
 *                defect_list - value of R1 on entry
 *                disc_name - value of R2 on entry
 *                image_file - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40548.
 */

extern os_error *xfilecore_layout_structure (filecore_disc const *disc,
      filecore_defect_list const *defect_list,
      char const *disc_name,
      os_f image_file);
__swi (0x40548) void filecore_layout_structure (filecore_disc const *disc,
      filecore_defect_list const *defect_list,
      char const *disc_name,
      os_f image_file);

/* ------------------------------------------------------------------------
 * Function:      filecore_layout_structurew()
 *
 * Description:   Lays out into the specified file a set of structures for
 *                its format. Uses 32-bit file handle
 *
 * Input:         disc - value of R0 on entry
 *                defect_list - value of R1 on entry
 *                disc_name - value of R2 on entry
 *                image_file - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40548.
 */

extern os_error *xfilecore_layout_structurew (filecore_disc const *disc,
      filecore_defect_list const *defect_list,
      char const *disc_name,
      os_fw image_file);
__swi (0x40548) void filecore_layout_structurew (filecore_disc const *disc,
      filecore_defect_list const *defect_list,
      char const *disc_name,
      os_fw image_file);

/* ------------------------------------------------------------------------
 * Function:      filecoremiscop_mount()
 *
 * Description:   Mounts a disc, reading in the data asked for
 *
 * Input:         drive_no - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *                disc - value of R5 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40549 with R0 = 0x0.
 */

extern os_error *xfilecoremiscop_mount (int drive_no,
      filecore_disc_address disc_addr,
      byte *buffer,
      int size,
      filecore_disc *disc,
      void *instance);
extern void filecoremiscop_mount (int drive_no,
      filecore_disc_address disc_addr,
      byte *buffer,
      int size,
      filecore_disc *disc,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoremiscop_poll_changed()
 *
 * Description:   Polls the sequence number for a drive
 *
 * Input:         drive_no - value of R1 on entry
 *                sequence_no - value of R2 on entry
 *                instance - value of R8 on entry
 *
 * Output:        sequence_no_out - value of R2 on exit
 *                result - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x40549 with R0 = 0x1.
 */

extern os_error *xfilecoremiscop_poll_changed (int drive_no,
      int sequence_no,
      void *instance,
      int *sequence_no_out,
      bits *result);
extern void filecoremiscop_poll_changed (int drive_no,
      int sequence_no,
      void *instance,
      int *sequence_no_out,
      bits *result);

/* ------------------------------------------------------------------------
 * Function:      filecoremiscop_lock_drive()
 *
 * Description:   Locks a disc in a floppy drive
 *
 * Input:         drive_no - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40549 with R0 = 0x2.
 */

extern os_error *xfilecoremiscop_lock_drive (int drive_no,
      void *instance);
extern void filecoremiscop_lock_drive (int drive_no,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoremiscop_unlock_drive()
 *
 * Description:   Unlocks a disc in a floppy drive
 *
 * Input:         drive_no - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40549 with R0 = 0x3.
 */

extern os_error *xfilecoremiscop_unlock_drive (int drive_no,
      void *instance);
extern void filecoremiscop_unlock_drive (int drive_no,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoremiscop_poll_period()
 *
 * Description:   Informs FileCore of the minimum period between polling
 *                for disc insertion
 *
 * Input:         disc_name - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Output:        poll_period - value of R5 on exit
 *                media_type - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x40549 with R0 = 0x4.
 */

extern os_error *xfilecoremiscop_poll_period (char const *disc_name,
      void *instance,
      int *poll_period,
      char **media_type);
extern void filecoremiscop_poll_period (char const *disc_name,
      void *instance,
      int *poll_period,
      char **media_type);

/* ------------------------------------------------------------------------
 * Function:      filecoremiscop_eject_disc()
 *
 * Description:   Power-ejects the disc in the specified drive
 *
 * Input:         drive_no - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x40549 with R0 = 0x5.
 */

extern os_error *xfilecoremiscop_eject_disc (int drive_no,
      void *instance);
extern void filecoremiscop_eject_disc (int drive_no,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoremiscop_read_info()
 *
 * Description:   Reads information on the specified FileCore filing system
 *                - RISC O S 3.6+
 *
 * Input:         instance - value of R8 on entry
 *
 * Output:        info - value of R0 on exit
 *
 * Other notes:   Calls SWI 0x40549 with R0 = 0x6.
 */

extern os_error *xfilecoremiscop_read_info (void *instance,
      filecore_info **info);
extern void filecoremiscop_read_info (void *instance,
      filecore_info **info);

/* ------------------------------------------------------------------------
 * Function:      filecoremiscop_drive_status()
 *
 * Description:   Returns the status of a given drive - RISC O S 3.6+
 *
 * Input:         drive_no - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Output:        locked - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40549 with R0 = 0x7.
 */

extern os_error *xfilecoremiscop_drive_status (int drive_no,
      void *instance,
      osbool *locked);
extern osbool filecoremiscop_drive_status (int drive_no,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_verify()
 *
 * Description:   Verifies a disc - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                size - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                unverified - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x0.
 */

extern os_error *xfilecoresectorop_verify (bits flags,
      filecore_sector_disc_address disc_addr,
      int size,
      void *instance,
      filecore_sector_disc_address *next_disc_addr,
      int *unverified);
extern int filecoresectorop_verify (bits flags,
      filecore_sector_disc_address disc_addr,
      int size,
      void *instance,
      filecore_sector_disc_address *next_disc_addr);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_read_sectors()
 *
 * Description:   Reads sectors from a disc - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unread - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x1.
 */

extern os_error *xfilecoresectorop_read_sectors (bits flags,
      filecore_sector_disc_address disc_addr,
      byte *data,
      int size,
      void *instance,
      filecore_sector_disc_address *next_disc_addr,
      byte **next_data,
      int *unread);
extern int filecoresectorop_read_sectors (bits flags,
      filecore_sector_disc_address disc_addr,
      byte *data,
      int size,
      void *instance,
      filecore_sector_disc_address *next_disc_addr,
      byte **next_data);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_write_sectors()
 *
 * Description:   Writes sectors to a disc - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unwritten - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x2.
 */

extern os_error *xfilecoresectorop_write_sectors (bits flags,
      filecore_sector_disc_address disc_addr,
      byte const *data,
      int size,
      void *instance,
      filecore_sector_disc_address *next_disc_addr,
      byte **next_data,
      int *unwritten);
extern int filecoresectorop_write_sectors (bits flags,
      filecore_sector_disc_address disc_addr,
      byte const *data,
      int size,
      void *instance,
      filecore_sector_disc_address *next_disc_addr,
      byte **next_data);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_read_track()
 *
 * Description:   Reads a track from a floppy disc - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x3.
 */

extern os_error *xfilecoresectorop_read_track (bits flags,
      filecore_sector_disc_address disc_addr,
      byte *data,
      void *instance);
extern void filecoresectorop_read_track (bits flags,
      filecore_sector_disc_address disc_addr,
      byte *data,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_read_id()
 *
 * Description:   Reads a hard disc ID - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x3.
 */

extern os_error *xfilecoresectorop_read_id (bits flags,
      filecore_sector_disc_address disc_addr,
      byte *data,
      void *instance);
extern void filecoresectorop_read_id (bits flags,
      filecore_sector_disc_address disc_addr,
      byte *data,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_write_track()
 *
 * Description:   Writes a track to a disc - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x4.
 */

extern os_error *xfilecoresectorop_write_track (bits flags,
      filecore_sector_disc_address disc_addr,
      byte const *data,
      void *instance);
extern void filecoresectorop_write_track (bits flags,
      filecore_sector_disc_address disc_addr,
      byte const *data,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_format_track()
 *
 * Description:   Formats a track of a disc - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                track_format - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x4, R3 = 0x0.
 */

extern os_error *xfilecoresectorop_format_track (bits flags,
      filecore_sector_disc_address disc_addr,
      filecore_track_format const *track_format,
      void *instance);
extern void filecoresectorop_format_track (bits flags,
      filecore_sector_disc_address disc_addr,
      filecore_track_format const *track_format,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_seek()
 *
 * Description:   Seeks to a disc location - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x5.
 */

extern os_error *xfilecoresectorop_seek (bits flags,
      filecore_sector_disc_address disc_addr,
      void *instance);
extern void filecoresectorop_seek (bits flags,
      filecore_sector_disc_address disc_addr,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_restore()
 *
 * Description:   Does a restore operation for a disc - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x6.
 */

extern os_error *xfilecoresectorop_restore (bits flags,
      filecore_sector_disc_address disc_addr,
      void *instance);
extern void filecoresectorop_restore (bits flags,
      filecore_sector_disc_address disc_addr,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_step_in()
 *
 * Description:   Steps a floppy disc in one track - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x7.
 */

extern os_error *xfilecoresectorop_step_in (bits flags,
      void *instance);
extern void filecoresectorop_step_in (bits flags,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_step_out()
 *
 * Description:   Steps a floppy disc out one track - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x8.
 */

extern os_error *xfilecoresectorop_step_out (bits flags,
      void *instance);
extern void filecoresectorop_step_out (bits flags,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_read_sectors_via_cache()
 *
 * Description:   Reads sectors of a disc using the RMA cache - RISC O S
 *                3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                cache_handle - value of R6 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unread - value of R4 on exit (X version only)
 *                cache_handle_out - value of R6 on exit
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0x9.
 */

extern os_error *xfilecoresectorop_read_sectors_via_cache (bits flags,
      filecore_sector_disc_address disc_addr,
      byte *data,
      int size,
      int cache_handle,
      void *instance,
      filecore_sector_disc_address *next_disc_addr,
      byte **next_data,
      int *unread,
      int *cache_handle_out);
extern int filecoresectorop_read_sectors_via_cache (bits flags,
      filecore_sector_disc_address disc_addr,
      byte *data,
      int size,
      int cache_handle,
      void *instance,
      filecore_sector_disc_address *next_disc_addr,
      byte **next_data,
      int *cache_handle_out);

/* ------------------------------------------------------------------------
 * Function:      filecoresectorop_specify()
 *
 * Description:   Does a specify operation on a hard disc - RISC O S 3.6+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054A with R1 |= 0xF.
 */

extern os_error *xfilecoresectorop_specify (bits flags,
      filecore_sector_disc_address disc_addr,
      void *instance);
extern void filecoresectorop_specify (bits flags,
      filecore_sector_disc_address disc_addr,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecore_free_space64()
 *
 * Description:   Returns 64-bit information on a disc's free space - RISC
 *                O S 3.6+
 *
 * Input:         disc_name - value of R0 on entry
 *                instance - value of R8 on entry
 *
 * Output:        free_lo - value of R0 on exit
 *                free_hi - value of R1 on exit
 *                max - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x4054B.
 */

extern os_error *xfilecore_free_space64 (char const *disc_name,
      void *instance,
      bits *free_lo,
      int *free_hi,
      int *max);
extern void filecore_free_space64 (char const *disc_name,
      void *instance,
      bits *free_lo,
      int *free_hi,
      int *max);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_verify()
 *
 * Description:   Verifies a disc - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                size - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                unverified - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x0.
 */

extern os_error *xfilecorediscop64_verify (bits flags,
      filecore_disc_address64 *disc_addr,
      int size,
      void *instance,
      filecore_disc_address64 **next_disc_addr,
      int *unverified);
extern int filecorediscop64_verify (bits flags,
      filecore_disc_address64 *disc_addr,
      int size,
      void *instance,
      filecore_disc_address64 **next_disc_addr);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_read_sectors()
 *
 * Description:   Reads sectors from a disc - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unread - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x1.
 */

extern os_error *xfilecorediscop64_read_sectors (bits flags,
      filecore_disc_address64 *disc_addr,
      byte *data,
      int size,
      void *instance,
      filecore_disc_address64 **next_disc_addr,
      byte **next_data,
      int *unread);
extern int filecorediscop64_read_sectors (bits flags,
      filecore_disc_address64 *disc_addr,
      byte *data,
      int size,
      void *instance,
      filecore_disc_address64 **next_disc_addr,
      byte **next_data);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_write_sectors()
 *
 * Description:   Writes sectors to a disc - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unwritten - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x2.
 */

extern os_error *xfilecorediscop64_write_sectors (bits flags,
      filecore_disc_address64 *disc_addr,
      byte const *data,
      int size,
      void *instance,
      filecore_disc_address64 **next_disc_addr,
      byte **next_data,
      int *unwritten);
extern int filecorediscop64_write_sectors (bits flags,
      filecore_disc_address64 *disc_addr,
      byte const *data,
      int size,
      void *instance,
      filecore_disc_address64 **next_disc_addr,
      byte **next_data);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_read_track()
 *
 * Description:   Reads a track from a floppy disc - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x3.
 */

extern os_error *xfilecorediscop64_read_track (bits flags,
      filecore_disc_address64 const *disc_addr,
      byte *data,
      void *instance);
extern void filecorediscop64_read_track (bits flags,
      filecore_disc_address64 const *disc_addr,
      byte *data,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_read_id()
 *
 * Description:   Reads a hard disc ID - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x3.
 */

extern os_error *xfilecorediscop64_read_id (bits flags,
      filecore_disc_address64 const *disc_addr,
      byte *data,
      void *instance);
extern void filecorediscop64_read_id (bits flags,
      filecore_disc_address64 const *disc_addr,
      byte *data,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_write_track()
 *
 * Description:   Writes a track to a disc - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x4.
 */

extern os_error *xfilecorediscop64_write_track (bits flags,
      filecore_disc_address64 const *disc_addr,
      byte const *data,
      void *instance);
extern void filecorediscop64_write_track (bits flags,
      filecore_disc_address64 const *disc_addr,
      byte const *data,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_format_track()
 *
 * Description:   Formats a track of a disc - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                track_format - value of R4 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x4, R3 = 0x0.
 */

extern os_error *xfilecorediscop64_format_track (bits flags,
      filecore_disc_address64 const *disc_addr,
      filecore_track_format const *track_format,
      void *instance);
extern void filecorediscop64_format_track (bits flags,
      filecore_disc_address64 const *disc_addr,
      filecore_track_format const *track_format,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_seek()
 *
 * Description:   Seeks to a disc location - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x5.
 */

extern os_error *xfilecorediscop64_seek (bits flags,
      filecore_disc_address64 const *disc_addr,
      void *instance);
extern void filecorediscop64_seek (bits flags,
      filecore_disc_address64 const *disc_addr,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_restore()
 *
 * Description:   Does a restore operation for a disc - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x6.
 */

extern os_error *xfilecorediscop64_restore (bits flags,
      filecore_disc_address64 const *disc_addr,
      void *instance);
extern void filecorediscop64_restore (bits flags,
      filecore_disc_address64 const *disc_addr,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_step_in()
 *
 * Description:   Steps a floppy disc in one track - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x7.
 */

extern os_error *xfilecorediscop64_step_in (bits flags,
      void *instance);
extern void filecorediscop64_step_in (bits flags,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_step_out()
 *
 * Description:   Steps a floppy disc out one track - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x8.
 */

extern os_error *xfilecorediscop64_step_out (bits flags,
      void *instance);
extern void filecorediscop64_step_out (bits flags,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_read_sectors_via_cache()
 *
 * Description:   Reads sectors of a disc using the RMA cache - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                cache_handle - value of R6 on entry
 *                instance - value of R8 on entry
 *
 * Output:        next_disc_addr - value of R2 on exit
 *                next_data - value of R3 on exit
 *                unread - value of R4 on exit (X version only)
 *                cache_handle_out - value of R6 on exit
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0x9.
 */

extern os_error *xfilecorediscop64_read_sectors_via_cache (bits flags,
      filecore_disc_address64 *disc_addr,
      byte *data,
      int size,
      int cache_handle,
      void *instance,
      filecore_disc_address64 **next_disc_addr,
      byte **next_data,
      int *unread,
      int *cache_handle_out);
extern int filecorediscop64_read_sectors_via_cache (bits flags,
      filecore_disc_address64 *disc_addr,
      byte *data,
      int size,
      int cache_handle,
      void *instance,
      filecore_disc_address64 **next_disc_addr,
      byte **next_data,
      int *cache_handle_out);

/* ------------------------------------------------------------------------
 * Function:      filecorediscop64_specify()
 *
 * Description:   Does a specify operation on a hard disc - RISC O S 5+
 *
 * Input:         flags - value of R1 on entry
 *                disc_addr - value of R2 on entry
 *                instance - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x4054C with R1 |= 0xF.
 */

extern os_error *xfilecorediscop64_specify (bits flags,
      filecore_disc_address64 const *disc_addr,
      void *instance);
extern void filecorediscop64_specify (bits flags,
      filecore_disc_address64 const *disc_addr,
      void *instance);

/* ------------------------------------------------------------------------
 * Function:      filecore_features()
 *
 * Description:   Returns FileCore feature flags - RISC O S 5+
 *
 * Output:        features - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4054D.
 */

extern os_error *xfilecore_features (filecore_feature_flags *features);
__swi (0x4054D) filecore_feature_flags filecore_features (void);

/* ------------------------------------------------------------------------
 * Function:      service_identify_disc()
 *
 * Description:   Identifies disc format
 *
 * Input:         format_name - value of R2 on entry
 *                size - value of R3 on entry
 *                disc - value of R5 on entry
 *                cache_handle - value of R6 on entry
 *                instance - value of R8 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                file_type - value of R2 on exit
 *                cache_handle_out - value of R6 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x69.
 */

extern os_error *xservice_identify_disc (char *format_name,
      int size,
      filecore_disc const *disc,
      int cache_handle,
      void *instance,
      osbool *unclaimed,
      bits *file_type,
      int *cache_handle_out);
extern osbool service_identify_disc (char *format_name,
      int size,
      filecore_disc const *disc,
      int cache_handle,
      void *instance,
      bits *file_type,
      int *cache_handle_out);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#ifndef filecore32_H
#include "oslib/filecore32.h"
#endif

#endif
