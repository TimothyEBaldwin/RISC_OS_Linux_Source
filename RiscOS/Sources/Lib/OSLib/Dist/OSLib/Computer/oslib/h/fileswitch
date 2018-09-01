#ifndef fileswitch_H
#define fileswitch_H

/* C header file for FileSwitch
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  OS_BGet
#define OS_BGet                                 0xA
#undef  XOS_BGet
#define XOS_BGet                                0x2000A
#undef  OS_BGetW
#define OS_BGetW                                0xA
#undef  XOS_BGetW
#define XOS_BGetW                               0x2000A
#undef  BGetV
#define BGetV                                   0xA
#undef  BGetVW
#define BGetVW                                  0xA
#undef  OS_BPut
#define OS_BPut                                 0xB
#undef  XOS_BPut
#define XOS_BPut                                0x2000B
#undef  OS_BPutW
#define OS_BPutW                                0xB
#undef  XOS_BPutW
#define XOS_BPutW                               0x2000B
#undef  BPutV
#define BPutV                                   0xB
#undef  BPutVW
#define BPutVW                                  0xB
#undef  Service_StartUpFS
#define Service_StartUpFS                       0x12
#undef  Service_FSRedeclare
#define Service_FSRedeclare                     0x40
#undef  Service_CloseFile
#define Service_CloseFile                       0x68

/************************************
 * Structure and union declarations *
 ************************************/
typedef union  fileswitch_info_words            fileswitch_info_words;

/********************
 * Type definitions *
 ********************/
typedef byte fileswitch_fs_no;

typedef bits fileswitch_fs_info;

typedef bits fileswitch_fs_extra_info;

typedef int fileswitch_object_type;

typedef bits fileswitch_attr;

union fileswitch_info_words
   {  os_date_and_time date_and_time;
      struct
      {  bits exec_addr;
         bits load_addr;
      }
      addrs;
   };

/************************
 * Constant definitions *
 ************************/
#define error_FILE_SWITCH_NO_CLAIM              0x400u
      /*Unable to claim FileSwitch workspace*/
#define error_BAD_FS_CONTROL_REASON             0x401u
      /*Bad FSControl call*/
#define error_BAD_OS_FILE_REASON                0x402u
      /*Bad OSFile call*/
#define error_BAD_OS_ARGS_REASON                0x403u
      /*Bad OSArgs call*/
#define error_BAD_OSGBPB_REASON                 0x404u
      /*Bad OSGBPB call*/
#define error_BAD_MODE_FOR_OS_FIND              0x405u
      /*Bad mode for OSFind*/
#define error_NO_ROOM_FOR_TRANSIENT             0x406u
      /*No room to run transient*/
#define error_EXEC_ADDR_NOT_IN_CODE             0x407u
      /*Execution address not within code*/
#define error_EXEC_ADDR_TOO_LOW                 0x408u
      /*Code runs too low*/
#define error_UNKNOWN_ACTION_TYPE               0x409u
      /*No run action for this file type*/
#define error_TOO_MANY_LEVELS                   0x40Au
      /*Too many levels*/
#define error_NO_SELECTED_FILING_SYSTEM         0x40Bu
      /*No selected filing system*/
#define error_CANT_REMOVE_FS_BY_NUMBER          0x40Cu
      /*Can't remove filing system by number*/
#define error_UNALIGNED_FS_ENTRY                0x40Du
      /*Unaligned filing system entry point*/
#define error_UNSUPPORTED_FS_ENTRY              0x40Eu
      /*Filing system does not support this operation*/
#define error_FS_NOT_SPECIAL                    0x40Fu
      /*Filing system does not support special fields*/
#define error_CORE_NOT_READABLE                 0x410u
      /*No readable memory at this address*/
#define error_CORE_NOT_WRITEABLE                0x411u
      /*No writable memory at this address*/
#define error_BAD_BUFFER_SIZE_FOR_STREAM        0x412u
      /*Bad buffer size*/
#define error_NOT_OPEN_FOR_READING              0x413u
      /*Not open for reading*/
#define error_NOT_ENOUGH_STACK_FOR_FS_ENTRY     0x414u
      /*Not enough stack to call filing system*/
#define error_NOTHING_TO_COPY                   0x415u
      /*Nothing to copy*/
#define error_NOTHING_TO_DELETE                 0x416u
      /*Nothing to delete*/
#define error_FILE_SWITCH_CANT_BE_KILLED_WHILST_THREADED 0x417u
      /*FileSwitch can not be killed whilst it is threaded*/
#define error_INVALID_ERROR_BLOCK               0x418u
      /*Invalid error block*/
#define error_FS_FILE_TOO_BIG                   0x419u
      /*File too big , Clashed with ROMFS FileTooBig*/
#define error_CANT_RM_FASTER_FILE_SWITCH        0x41Au
      /*Can't RMFaster FileSwitch*/
#define error_INCONSISTENT_HANDLE_SET           0x41Bu
      /*Inconsistent handle set*/
#define error_IS_AFILE                          0x41Cu
      /*Object is a file*/
#define error_BAD_FILE_TYPE                     0x41Du
      /*Bad file type*/
#define error_LIBRARY_SOMEWHERE_ELSE            0x41Eu
      /*The library is somewhere else*/
#define error_PATH_IS_SELF_CONTRADICTORY        0x41Fu
      /*Path is self contradictory*/
#define error_WASNT_DOLLAR_AFTER_DISC           0x420u
      /*Disc was specified, but absolute wasn't $*/
#define error_NOT_ENOUGH_MEMORY_FOR_WILDCARD_RESOLUTION 0x421u
      /*Not enough memory for wildcard resolution*/
#define error_NOT_ENOUGH_STACK_FOR_WILDCARD_RESOLUTION 0x422u
      /*Not enough stack for wildcard resolution*/
#define error_DIR_WANTED_FILE_FOUND             0x423u
      /*Directory wanted, but file found*/
#define error_NOT_FOUND                         0x424u
      /*File Not found*/
#define error_MULTIPART_PATH_USED               0x425u
      /*Path variable had multiple entries and was used for a write operation*/
#define error_RECURSIVE_PATH                    0x426u
      /*One of the path variables used refers to itself*/
#define error_MULTI_FS_DOES_NOT_SUPPORT_GBPB11  0x427u
      /*The OS_GBPB 11 call is not supported by image filing systems*/
#define error_FILE_SWITCH_DATA_LOST             0x428u
      /*Data lost, &4AC , Consistent with ADFS*/
#define error_TOO_MANY_ERROR_LOOKUPS            0x429u
      /*Too many error lookups happening at once - recursion assumed*/
#define error_MESSAGE_FILE_BUSY                 0x42Au
      /*FileSwitch message file busy*/
#define error_PARTITION_BUSY                    0x42Bu
      /*Partition not ready*/
#define fileswitch_FS_NUMBER_NONE               ((fileswitch_fs_no) 0x0u)
#define fileswitch_FS_NUMBER_ROMFS              ((fileswitch_fs_no) 0x3u)
#define fileswitch_FS_NUMBER_NETFS              ((fileswitch_fs_no) 0x5u)
#define fileswitch_FS_NUMBER_ADFS               ((fileswitch_fs_no) 0x8u)
#define fileswitch_FS_NUMBER_NETPRINT           ((fileswitch_fs_no) 0xCu)
#define fileswitch_FS_NUMBER_NULL               ((fileswitch_fs_no) 0xDu)
#define fileswitch_FS_NUMBER_PRINTER            ((fileswitch_fs_no) 0xEu)
#define fileswitch_FS_NUMBER_SERIAL             ((fileswitch_fs_no) 0xFu)
#define fileswitch_FS_NUMBER_VDU                ((fileswitch_fs_no) 0x11u)
#define fileswitch_FS_NUMBER_RAWVDU             ((fileswitch_fs_no) 0x12u)
#define fileswitch_FS_NUMBER_KBD                ((fileswitch_fs_no) 0x13u)
#define fileswitch_FS_NUMBER_RAWKBD             ((fileswitch_fs_no) 0x14u)
#define fileswitch_FS_NUMBER_DESKFS             ((fileswitch_fs_no) 0x15u)
#define fileswitch_FS_NUMBER_RAMFS              ((fileswitch_fs_no) 0x17u)
#define fileswitch_FS_NUMBER_RISCIXFS           ((fileswitch_fs_no) 0x18u)
#define fileswitch_FS_NUMBER_STREAMER           ((fileswitch_fs_no) 0x19u)
#define fileswitch_FS_NUMBER_SCSIFS             ((fileswitch_fs_no) 0x1Au)
#define fileswitch_FS_NUMBER_DIGITISER          ((fileswitch_fs_no) 0x1Bu)
#define fileswitch_FS_NUMBER_SCANNER            ((fileswitch_fs_no) 0x1Cu)
#define fileswitch_FS_NUMBER_MULTIFS            ((fileswitch_fs_no) 0x1Du)
#define fileswitch_FS_NUMBER_NFS                ((fileswitch_fs_no) 0x21u)
#define fileswitch_FS_NUMBER_CDFS               ((fileswitch_fs_no) 0x25u)
#define fileswitch_FS_NUMBER_DOSFS              ((fileswitch_fs_no) 0x2Bu)
#define fileswitch_FS_NUMBER_RESOURCEFS         ((fileswitch_fs_no) 0x2Eu)
#define fileswitch_FS_NUMBER_PIPEFS             ((fileswitch_fs_no) 0x2Fu)
#define fileswitch_FS_NUMBER_DEVICEFS           ((fileswitch_fs_no) 0x35u)
#define fileswitch_FS_NUMBER_PARALLEL           ((fileswitch_fs_no) 0x36u)
#define fileswitch_FS_NUMBER_SPARKFS            ((fileswitch_fs_no) 0x42u)
#define fileswitch_FS_NUMBER_PCCARDFS           ((fileswitch_fs_no) 0x59u)
#define fileswitch_FS_NUMBER_MEMFS              ((fileswitch_fs_no) 0x5Bu)
#define fileswitch_FS_NUMBER_SHAREFS            ((fileswitch_fs_no) 0x63u)
#define fileswitch_FS_NUMBER_LANMAN             ((fileswitch_fs_no) 0x66u)
#define fileswitch_FS_NUMBER_OMNIPRINT          ((fileswitch_fs_no) 0x68u)
#define fileswitch_FS_NUMBER_RSDFS              ((fileswitch_fs_no) 0x6Cu)
#define fileswitch_FS_NUMBER                    ((fileswitch_fs_info) 0xFFu)
#define fileswitch_FS_OPEN_FILE_LIMIT           ((fileswitch_fs_info) 0xFF00u)
#define fileswitch_FS_READ_ONLY                 ((fileswitch_fs_info) 0x10000u)
#define fileswitch_HAS_EXTRA_FLAGS              ((fileswitch_fs_info) 0x20000u)
#define fileswitch_NO_FILE_ENTRIES              ((fileswitch_fs_info) 0x40000u)
#define fileswitch_NO_SAVE_ENTRY                ((fileswitch_fs_info) 0x80000u)
#define fileswitch_NO_LOAD_ENTRY                ((fileswitch_fs_info) 0x100000u)
#define fileswitch_IMPLICIT_DIRECTORIES         ((fileswitch_fs_info) 0x200000u)
#define fileswitch_NEEDS_URD_AND_LIB            ((fileswitch_fs_info) 0x400000u)
#define fileswitch_SUPPORTS_IMAGE               ((fileswitch_fs_info) 0x800000u)
#define fileswitch_RESERVED                     ((fileswitch_fs_info) 0x1000000u)
#define fileswitch_SUPPORTS_FILE_INFO           ((fileswitch_fs_info) 0x2000000u)
#define fileswitch_SUPPORTS_STAMP_NAMED         ((fileswitch_fs_info) 0x4000000u)
#define fileswitch_NEEDS_FLUSH                  ((fileswitch_fs_info) 0x8000000u)
#define fileswitch_NEEDS_CREATE                 ((fileswitch_fs_info) 0x10000000u)
#define fileswitch_SUPPORTS_EMPTY_NAMES         ((fileswitch_fs_info) 0x20000000u)
#define fileswitch_INTERACTIVE                  ((fileswitch_fs_info) 0x40000000u)
#define fileswitch_SUPPORTS_SPECIAL             ((fileswitch_fs_info) 0x80000000u)
#define fileswitch_SUPPORTS_DIR_CHANGE          ((fileswitch_fs_extra_info) 0x1u)
#define fileswitch_NEEDS_CAT                    ((fileswitch_fs_extra_info) 0x2u)
#define fileswitch_NEEDS_EX                     ((fileswitch_fs_extra_info) 0x4u)
#define fileswitch_SUPPORTS_IO_CTL              ((fileswitch_fs_extra_info) 0x8u)
      /*RISC O S 4+*/
#define fileswitch_NOT_FOUND                    ((fileswitch_object_type) 0x0u)
#define fileswitch_IS_FILE                      ((fileswitch_object_type) 0x1u)
#define fileswitch_IS_DIR                       ((fileswitch_object_type) 0x2u)
#define fileswitch_IS_IMAGE                     ((fileswitch_object_type) 0x3u)
#define fileswitch_ATTR_OWNER_READ              ((fileswitch_attr) 0x1u)
#define fileswitch_ATTR_OWNER_WRITE             ((fileswitch_attr) 0x2u)
#define fileswitch_ATTR_OWNER_SPECIAL           ((fileswitch_attr) 0x4u)
#define fileswitch_ATTR_OWNER_LOCKED            ((fileswitch_attr) 0x8u)
#define fileswitch_ATTR_WORLD_READ              ((fileswitch_attr) 0x10u)
#define fileswitch_ATTR_WORLD_WRITE             ((fileswitch_attr) 0x20u)
#define fileswitch_ATTR_WORLD_SPECIAL           ((fileswitch_attr) 0x40u)
#define fileswitch_ATTR_WORLD_LOCKED            ((fileswitch_attr) 0x80u)
#define error_NOT_SUPPORTED                     0xF8u
      /*Bad operation on ...:*/
#define error_FS_WRITE_ONLY                     0xFAu
      /*...: is a write only filing system*/
#define error_FS_READ_ONLY                      0xFCu
      /*...: is a read only filing system*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      os_bget()
 *
 * Description:   Reads a byte from an open file - prefer OS_BGetW
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        c - value of R0 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0xA.
 */

extern os_error *xos_bget (os_f file,
      char *c,
      bits *psr);
extern bits os_bget (os_f file,
      char *c);

/* ------------------------------------------------------------------------
 * Function:      os_bgetw()
 *
 * Description:   Reads a byte from an open file. Uses 32-bit file handle
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        c - value of R0 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0xA.
 */

extern os_error *xos_bgetw (os_fw file,
      char *c,
      bits *psr);
extern bits os_bgetw (os_fw file,
      char *c);

/* ------------------------------------------------------------------------
 * Function:      bgetv()
 *
 * Description:   OS_BGet vector
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        c - value of R0 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0xA.
 */

extern os_error *xbgetv (os_f file,
      char *c,
      bits *psr);
extern bits bgetv (os_f file,
      char *c);

/* ------------------------------------------------------------------------
 * Function:      bgetvw()
 *
 * Description:   OS_BGet vector
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        c - value of R0 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0xA.
 */

extern os_error *xbgetvw (os_fw file,
      char *c,
      bits *psr);
extern bits bgetvw (os_fw file,
      char *c);

/* ------------------------------------------------------------------------
 * Function:      os_bput()
 *
 * Description:   Writes a byte to an open file Prefer OS_BPutW
 *
 * Input:         c - value of R0 on entry
 *                file - value of R1 on entry
 *
 * Other notes:   Calls SWI 0xB.
 */

extern os_error *xos_bput (char c,
      os_f file);
__swi (0xB) void os_bput (char c,
      os_f file);

/* ------------------------------------------------------------------------
 * Function:      os_bputw()
 *
 * Description:   Writes a byte to an open file. Uses 32-bit file handle
 *
 * Input:         c - value of R0 on entry
 *                file - value of R1 on entry
 *
 * Other notes:   Calls SWI 0xB.
 */

extern os_error *xos_bputw (char c,
      os_fw file);
__swi (0xB) void os_bputw (char c,
      os_fw file);

/* ------------------------------------------------------------------------
 * Function:      bputv()
 *
 * Description:   OS_BPut vector - prefer BPutVW
 *
 * Input:         c - value of R0 on entry
 *                file - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0xB.
 */

extern os_error *xbputv (char c,
      os_f file);
extern void bputv (char c,
      os_f file);

/* ------------------------------------------------------------------------
 * Function:      bputvw()
 *
 * Description:   OS_BPut vector. Uses 32-bit file handle
 *
 * Input:         c - value of R0 on entry
 *                file - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0xB.
 */

extern os_error *xbputvw (char c,
      os_fw file);
extern void bputvw (char c,
      os_fw file);

/* ------------------------------------------------------------------------
 * Function:      service_start_up_fs()
 *
 * Description:   Start up filing system - not RISC OS 3.5+
 *
 * Input:         fs_no - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x12.
 */

extern os_error *xservice_start_up_fs (fileswitch_fs_no fs_no);
extern void service_start_up_fs (fileswitch_fs_no fs_no);

/* ------------------------------------------------------------------------
 * Function:      service_fs_redeclare()
 *
 * Description:   Filing system reinitialise
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x40.
 */

extern os_error *xservice_fs_redeclare (void);
extern void service_fs_redeclare (void);

/* ------------------------------------------------------------------------
 * Function:      service_close_file()
 *
 * Description:   Close an object, and any children of that object
 *
 * Input:         file_name - value of R2 on entry
 *                count - value of R3 on entry
 *
 * Output:        count_out - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x68.
 */

extern os_error *xservice_close_file (char const *file_name,
      int count,
      int *count_out);
extern void service_close_file (char const *file_name,
      int count,
      int *count_out);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#ifndef fileswch32_H
#include "oslib/fileswch32.h"
#endif

#endif
