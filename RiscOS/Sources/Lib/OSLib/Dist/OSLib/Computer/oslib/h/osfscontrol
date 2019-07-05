#ifndef osfscontrol_H
#define osfscontrol_H

/* C header file for OSFSControl
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 5 Sept 1995
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
#undef  OS_FSControl
#define OS_FSControl                            0x29
#undef  XOS_FSControl
#define XOS_FSControl                           0x20029
#undef  OSFSControl_Dir
#define OSFSControl_Dir                         0x0
#undef  OSFSControl_Lib
#define OSFSControl_Lib                         0x1
#undef  OSFSControl_StartApplication
#define OSFSControl_StartApplication            0x2
#undef  OSFSControl_Run
#define OSFSControl_Run                         0x4
#undef  OSFSControl_Cat
#define OSFSControl_Cat                         0x5
#undef  OSFSControl_Ex
#define OSFSControl_Ex                          0x6
#undef  OSFSControl_LCat
#define OSFSControl_LCat                        0x7
#undef  OSFSControl_LEx
#define OSFSControl_LEx                         0x8
#undef  OSFSControl_Info
#define OSFSControl_Info                        0x9
#undef  OSFSControl_Opt
#define OSFSControl_Opt                         0xA
#undef  OSFSControl_SetTemporaryFS
#define OSFSControl_SetTemporaryFS              0xB
#undef  OSFSControl_AddFS
#define OSFSControl_AddFS                       0xC
#undef  OSFSControl_LookupFS
#define OSFSControl_LookupFS                    0xD
#undef  OSFSControl_SelectFS
#define OSFSControl_SelectFS                    0xE
#undef  OSFSControl_BootFromFS
#define OSFSControl_BootFromFS                  0xF
#undef  OSFSControl_RemoveFS
#define OSFSControl_RemoveFS                    0x10
#undef  OSFSControl_AddSecondaryFS
#define OSFSControl_AddSecondaryFS              0x11
#undef  OSFSControl_ReadFileType
#define OSFSControl_ReadFileType                0x12
#undef  OSFSControl_RestoreCurrent
#define OSFSControl_RestoreCurrent              0x13
#undef  OSFSControl_ReadModuleBase
#define OSFSControl_ReadModuleBase              0x14
#undef  OSFSControl_ReadFSHandle
#define OSFSControl_ReadFSHandle                0x15
#undef  OSFSControl_ReadFSHandleW
#define OSFSControl_ReadFSHandleW               0x15
#undef  OSFSControl_Shut
#define OSFSControl_Shut                        0x16
#undef  OSFSControl_Shutdown
#define OSFSControl_Shutdown                    0x17
#undef  OSFSControl_Access
#define OSFSControl_Access                      0x18
#undef  OSFSControl_Rename
#define OSFSControl_Rename                      0x19
#undef  OSFSControl_Copy
#define OSFSControl_Copy                        0x1A
#undef  OSFSControl_Wipe
#define OSFSControl_Wipe                        0x1B
#undef  OSFSControl_Count
#define OSFSControl_Count                       0x1C
#undef  OSFSControl_ReadSecondaryFS
#define OSFSControl_ReadSecondaryFS             0x1E
#undef  OSFSControl_FileTypeFromString
#define OSFSControl_FileTypeFromString          0x1F
#undef  OSFSControl_FileInfo
#define OSFSControl_FileInfo                    0x20
#undef  OSFSControl_ReadFSName
#define OSFSControl_ReadFSName                  0x21
#undef  OSFSControl_RegisterImageFS
#define OSFSControl_RegisterImageFS             0x23
#undef  OSFSControl_DeregisterImageFS
#define OSFSControl_DeregisterImageFS           0x24
#undef  OSFSControl_CanonicalisePath
#define OSFSControl_CanonicalisePath            0x25
#undef  OSFSControl_InfoToFileType
#define OSFSControl_InfoToFileType              0x26
#undef  OSFSControl_URD
#define OSFSControl_URD                         0x27
#undef  OSFSControl_Back
#define OSFSControl_Back                        0x28
#undef  OSFSControl_DefectList
#define OSFSControl_DefectList                  0x29
#undef  OSFSControl_AddDefect
#define OSFSControl_AddDefect                   0x2A
#undef  OSFSControl_NoDir
#define OSFSControl_NoDir                       0x2B
#undef  OSFSControl_NoURD
#define OSFSControl_NoURD                       0x2C
#undef  OSFSControl_NoLib
#define OSFSControl_NoLib                       0x2D
#undef  OSFSControl_UsedSpaceMap
#define OSFSControl_UsedSpaceMap                0x2E
#undef  OSFSControl_ReadBootOption
#define OSFSControl_ReadBootOption              0x2F
#undef  OSFSControl_WriteBootOption
#define OSFSControl_WriteBootOption             0x30
#undef  OSFSControl_FreeSpace
#define OSFSControl_FreeSpace                   0x31
#undef  OSFSControl_NameDisc
#define OSFSControl_NameDisc                    0x32
#undef  OSFSControl_StampImage
#define OSFSControl_StampImage                  0x33
#undef  OSFSControl_ObjectAtOffset
#define OSFSControl_ObjectAtOffset              0x34
#undef  OSFSControl_SetDir
#define OSFSControl_SetDir                      0x35
#undef  OSFSControl_ReadDir
#define OSFSControl_ReadDir                     0x36
#undef  OSFSControl_FreeSpace64
#define OSFSControl_FreeSpace64                 0x37
#undef  OSFSControl_DefectList64
#define OSFSControl_DefectList64                0x38
#undef  OSFSControl_AddDefect64
#define OSFSControl_AddDefect64                 0x39
#undef  FSCV
#define FSCV                                    0xF
#undef  UpCall_MediaNotPresent
#define UpCall_MediaNotPresent                  0x1
#undef  UpCall_MediaNotKnown
#define UpCall_MediaNotKnown                    0x2
#undef  UpCallFSControl_SetArgsSize
#define UpCallFSControl_SetArgsSize             0x200
#undef  UpCallFSControl_SetArgsSizeW
#define UpCallFSControl_SetArgsSizeW            0x200
#undef  UpCallFSControl_Rename
#define UpCallFSControl_Rename                  0x208
#undef  UpCallFSControl_SetAttrString
#define UpCallFSControl_SetAttrString           0x209
#undef  UpCall_MediaSearchEnd
#define UpCall_MediaSearchEnd                   0x4
#undef  UpCall_NewApplication
#define UpCall_NewApplication                   0x100

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct osfscontrol_id_                  *osfscontrol_id;
      /*Should be union of fs_no and string, but that's inconvenient since you can't project into unions by cast*/
typedef struct osfscontrol_fs_info_block        osfscontrol_fs_info_block;
typedef struct osfscontrol_descriptor           osfscontrol_descriptor;

/********************
 * Type definitions *
 ********************/
struct osfscontrol_fs_info_block
   {  int name_offset;
      int banner_offset;
      int open_offset;
      int get_bytes;
      int put_bytes;
      int args_offset;
      int close_offset;
      int file_offset;
      fileswitch_fs_info info;
      int func_offset;
      int gbpb_offset;
      fileswitch_fs_extra_info extra_info;
   };

typedef bits osfscontrol_copy_flags;

struct osfscontrol_descriptor
   {  byte *addr;
      int size;
   };

typedef bits osfscontrol_wipe_flags;

typedef bits osfscontrol_count_flags;

typedef int osfscontrol_object_kind;

typedef int osfscontrol_special_dir;

/************************
 * Constant definitions *
 ************************/
#define osfscontrol_OPT_RESTORE_DEFAULT         0
#define osfscontrol_OPT_MESSAGE_LEVEL           1
#define osfscontrol_OPT_BOOT_ACTION             4
#define osfscontrol_COPY_RECURSE                ((osfscontrol_copy_flags) 0x1u)
#define osfscontrol_COPY_FORCE                  ((osfscontrol_copy_flags) 0x2u)
#define osfscontrol_COPY_GIVEN_TIMES            ((osfscontrol_copy_flags) 0x4u)
#define osfscontrol_COPY_CONFIRM                ((osfscontrol_copy_flags) 0x8u)
#define osfscontrol_COPY_VERBOSE                ((osfscontrol_copy_flags) 0x10u)
#define osfscontrol_COPY_QUICK                  ((osfscontrol_copy_flags) 0x20u)
#define osfscontrol_COPY_PROMPT                 ((osfscontrol_copy_flags) 0x40u)
#define osfscontrol_COPY_DELETE                 ((osfscontrol_copy_flags) 0x80u)
#define osfscontrol_COPY_ALLOW_PRINT            ((osfscontrol_copy_flags) 0x100u)
#define osfscontrol_COPY_NO_ATTRIBUTES          ((osfscontrol_copy_flags) 0x200u)
#define osfscontrol_COPY_STAMP                  ((osfscontrol_copy_flags) 0x400u)
#define osfscontrol_COPY_STRUCTURE              ((osfscontrol_copy_flags) 0x800u)
#define osfscontrol_COPY_NEWER                  ((osfscontrol_copy_flags) 0x1000u)
#define osfscontrol_COPY_GIVEN_DESCRIPTOR       ((osfscontrol_copy_flags) 0x2000u)
#define osfscontrol_COPY_LOOK                   ((osfscontrol_copy_flags) 0x4000u)
#define osfscontrol_WIPE_RECURSE                ((osfscontrol_wipe_flags) 0x1u)
#define osfscontrol_WIPE_FORCE                  ((osfscontrol_wipe_flags) 0x2u)
#define osfscontrol_WIPE_GIVEN_TIMES            ((osfscontrol_wipe_flags) 0x4u)
#define osfscontrol_WIPE_CONFIRM                ((osfscontrol_wipe_flags) 0x8u)
#define osfscontrol_WIPE_VERBOSE                ((osfscontrol_wipe_flags) 0x10u)
#define osfscontrol_WIPE_ALLOW_PRINT            ((osfscontrol_wipe_flags) 0x100u)
#define osfscontrol_COUNT_RECURSE               ((osfscontrol_count_flags) 0x1u)
#define osfscontrol_COUNT_GIVEN_TIMES           ((osfscontrol_count_flags) 0x4u)
#define osfscontrol_COUNT_CONFIRM               ((osfscontrol_count_flags) 0x8u)
#define osfscontrol_COUNT_VERBOSE               ((osfscontrol_count_flags) 0x10u)
#define osfscontrol_COUNT_ALLOW_PRINT           ((osfscontrol_count_flags) 0x100u)
#define osfscontrol_KIND_FREE                   ((osfscontrol_object_kind) 0x0u)
#define osfscontrol_KIND_ALLOCATED              ((osfscontrol_object_kind) 0x1u)
#define osfscontrol_KIND_FOUND                  ((osfscontrol_object_kind) 0x2u)
#define osfscontrol_KIND_SHARABLE               ((osfscontrol_object_kind) 0x3u)
#define osfscontrol_DIR_CSD                     ((osfscontrol_special_dir) 0x0u)
#define osfscontrol_DIR_PSD                     ((osfscontrol_special_dir) 0x1u)
#define osfscontrol_DIR_URD                     ((osfscontrol_special_dir) 0x2u)
#define osfscontrol_DIR_LIB                     ((osfscontrol_special_dir) 0x3u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_dir()
 *
 * Description:   Sets the current directory (CSD) and (optionally) filing
 *                system
 *
 * Input:         dir_names - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x0.
 */

extern os_error *xosfscontrol_dir (char const *dir_names);
extern void osfscontrol_dir (char const *dir_names);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_lib()
 *
 * Description:   Sets the library directory (Lib)
 *
 * Input:         dir_names - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x1.
 */

extern os_error *xosfscontrol_lib (char const *dir_names);
extern void osfscontrol_lib (char const *dir_names);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_start_application()
 *
 * Description:   Informs RISC OS and the current application that a new
 *                application is starting
 *
 * Input:         tail - value of R1 on entry
 *                cao - value of R2 on entry
 *                command - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x2.
 */

extern os_error *xosfscontrol_start_application (char const *tail,
      byte *cao,
      char const *command);
extern void osfscontrol_start_application (char const *tail,
      byte *cao,
      char const *command);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_run()
 *
 * Description:   Runs a file
 *
 * Input:         file_names - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x4.
 */

extern os_error *xosfscontrol_run (char const *file_names);
extern void osfscontrol_run (char const *file_names);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_cat()
 *
 * Description:   Catalogues a directory
 *
 * Input:         dir_names - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x5.
 */

extern os_error *xosfscontrol_cat (char const *dir_names);
extern void osfscontrol_cat (char const *dir_names);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_ex()
 *
 * Description:   Examines a directory
 *
 * Input:         dir_names - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x6.
 */

extern os_error *xosfscontrol_ex (char const *dir_names);
extern void osfscontrol_ex (char const *dir_names);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_lcat()
 *
 * Description:   Catalogues the library directory
 *
 * Input:         dir_names - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x7.
 */

extern os_error *xosfscontrol_lcat (char const *dir_names);
extern void osfscontrol_lcat (char const *dir_names);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_lex()
 *
 * Description:   Examines the library directory
 *
 * Input:         dir_names - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x8.
 */

extern os_error *xosfscontrol_lex (char const *dir_names);
extern void osfscontrol_lex (char const *dir_names);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_info()
 *
 * Description:   Examines objects
 *
 * Input:         file_names - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x9.
 */

extern os_error *xosfscontrol_info (char const *file_names);
extern void osfscontrol_info (char const *file_names);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_opt()
 *
 * Description:   Sets filing system options - prefer
 *                OSFSControl_WriteBootOption
 *
 * Input:         opt - value of R1 on entry
 *                value - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0xA.
 */

extern os_error *xosfscontrol_opt (int opt,
      int value);
extern void osfscontrol_opt (int opt,
      int value);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_set_temporary_fs()
 *
 * Description:   Sets the temporary filing system from a named prefix
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        file_name_out - value of R1 on exit
 *                old_fs_no - value of R2 on exit (X version only)
 *                special - value of R3 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0xB.
 */

extern os_error *xosfscontrol_set_temporary_fs (char const *file_name,
      char **file_name_out,
      fileswitch_fs_no *old_fs_no,
      char **special);
extern fileswitch_fs_no osfscontrol_set_temporary_fs (char const *file_name,
      char **file_name_out,
      char **special);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_add_fs()
 *
 * Description:   Adds a filing system
 *
 * Input:         module - value of R1 on entry
 *                fs_info_offset - value of R2 on entry
 *                workspace - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0xC.
 */

extern os_error *xosfscontrol_add_fs (byte const *module,
      int fs_info_offset,
      void *workspace);
extern void osfscontrol_add_fs (byte const *module,
      int fs_info_offset,
      void *workspace);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_lookup_fs()
 *
 * Description:   Checks for the presence of a filing system
 *
 * Input:         fs_no_or_name - value of R1 on entry
 *                control_terminated - value of R2 on entry
 *
 * Output:        fs_no_out - value of R1 on exit
 *                fs_found - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0xD.
 */

extern os_error *xosfscontrol_lookup_fs (osfscontrol_id fs_no_or_name,
      osbool control_terminated,
      fileswitch_fs_no *fs_no_out,
      osbool *fs_found);
extern osbool osfscontrol_lookup_fs (osfscontrol_id fs_no_or_name,
      osbool control_terminated,
      fileswitch_fs_no *fs_no_out);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_select_fs()
 *
 * Description:   Switches the current and temporary filing systems to the
 *                one specified
 *
 * Input:         fs_no_or_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0xE.
 */

extern os_error *xosfscontrol_select_fs (osfscontrol_id fs_no_or_name);
extern void osfscontrol_select_fs (osfscontrol_id fs_no_or_name);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_boot_from_fs()
 *
 * Description:   Boots off the currently selected filing system
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0xF.
 */

extern os_error *xosfscontrol_boot_from_fs (void);
extern void osfscontrol_boot_from_fs (void);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_remove_fs()
 *
 * Description:   Removes a filing system
 *
 * Input:         fs_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x10.
 */

extern os_error *xosfscontrol_remove_fs (char const *fs_name);
extern void osfscontrol_remove_fs (char const *fs_name);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_add_secondary_fs()
 *
 * Description:   Adds a secondary module
 *
 * Input:         fs_name - value of R1 on entry
 *                secondary_name - value of R2 on entry
 *                workspace - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x11.
 */

extern os_error *xosfscontrol_add_secondary_fs (char const *fs_name,
      char const *secondary_name,
      void *workspace);
extern void osfscontrol_add_secondary_fs (char const *fs_name,
      char const *secondary_name,
      void *workspace);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_read_file_type()
 *
 * Description:   Decodes a file type into text
 *
 * Input:         file_type - value of R2 on entry
 *
 * Output:        name1 - value of R2 on exit
 *                name2 - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x12.
 */

extern os_error *xosfscontrol_read_file_type (bits file_type,
      bits *name1,
      bits *name2);
extern void osfscontrol_read_file_type (bits file_type,
      bits *name1,
      bits *name2);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_restore_current()
 *
 * Description:   Restore the current filing system after
 *                OSFSControl_SetTemporaryFS
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x13.
 */

extern os_error *xosfscontrol_restore_current (void);
extern void osfscontrol_restore_current (void);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_read_module_base()
 *
 * Description:   Reads location of primary module for temporary filing
 *                system
 *
 * Output:        module - value of R1 on exit
 *                workspace - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x14.
 */

extern os_error *xosfscontrol_read_module_base (byte **module,
      void **workspace);
extern void osfscontrol_read_module_base (byte **module,
      void **workspace);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_read_fs_handle()
 *
 * Description:   Returns a filing system file handle. Prefer
 *                OSFSControl_ReadFSHandleW
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        fs_handle - value of R1 on exit (X version only)
 *                info_word - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x15.
 */

extern os_error *xosfscontrol_read_fs_handle (os_f file,
      int *fs_handle,
      int *info_word);
extern int osfscontrol_read_fs_handle (os_f file,
      int *info_word);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_read_fs_handlew()
 *
 * Description:   Returns a filing system file handle. Uses 32-bit file
 *                handle.
 *
 * Input:         file - value of R1 on entry
 *
 * Output:        fs_handle - value of R1 on exit (X version only)
 *                info_word - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x15.
 */

extern os_error *xosfscontrol_read_fs_handlew (os_fw file,
      int *fs_handle,
      int *info_word);
extern int osfscontrol_read_fs_handlew (os_fw file,
      int *info_word);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_shut()
 *
 * Description:   Closes all open files on all filing systems
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x16.
 */

extern os_error *xosfscontrol_shut (void);
extern void osfscontrol_shut (void);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_shutdown()
 *
 * Description:   Shuts down all filing systems
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x17.
 */

extern os_error *xosfscontrol_shutdown (void);
extern void osfscontrol_shutdown (void);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_access()
 *
 * Description:   Sets the attributes of objects
 *
 * Input:         file_names - value of R1 on entry
 *                access - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x18.
 */

extern os_error *xosfscontrol_access (char const *file_names,
      char const *access);
extern void osfscontrol_access (char const *file_names,
      char const *access);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_rename()
 *
 * Description:   Renames objects
 *
 * Input:         file_name - value of R1 on entry
 *                new_file_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x19.
 */

extern os_error *xosfscontrol_rename (char const *file_name,
      char const *new_file_name);
extern void osfscontrol_rename (char const *file_name,
      char const *new_file_name);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_copy()
 *
 * Description:   Copies objects
 *
 * Input:         from - value of R1 on entry
 *                to - value of R2 on entry
 *                flags - value of R3 on entry
 *                start_load - value of R4 on entry
 *                start_exec - value of R5 on entry
 *                end_load - value of R6 on entry
 *                end_exec - value of R7 on entry
 *                descriptor - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x1A.
 */

extern os_error *xosfscontrol_copy (char const *from,
      char const *to,
      osfscontrol_copy_flags flags,
      bits start_load,
      bits start_exec,
      bits end_load,
      bits end_exec,
      osfscontrol_descriptor const *descriptor);
extern void osfscontrol_copy (char const *from,
      char const *to,
      osfscontrol_copy_flags flags,
      bits start_load,
      bits start_exec,
      bits end_load,
      bits end_exec,
      osfscontrol_descriptor const *descriptor);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_wipe()
 *
 * Description:   Wipes objects
 *
 * Input:         file_names - value of R1 on entry
 *                flags - value of R3 on entry
 *                start_load - value of R4 on entry
 *                start_exec - value of R5 on entry
 *                end_load - value of R6 on entry
 *                end_exec - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x1B.
 */

extern os_error *xosfscontrol_wipe (char const *file_names,
      osfscontrol_wipe_flags flags,
      bits start_load,
      bits start_exec,
      bits end_load,
      bits end_exec);
extern void osfscontrol_wipe (char const *file_names,
      osfscontrol_wipe_flags flags,
      bits start_load,
      bits start_exec,
      bits end_load,
      bits end_exec);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_count()
 *
 * Description:   Counts objects
 *
 * Input:         file_names - value of R1 on entry
 *                flags - value of R3 on entry
 *                start_load - value of R4 on entry
 *                start_exec - value of R5 on entry
 *                end_load - value of R6 on entry
 *                end_exec - value of R7 on entry
 *
 * Output:        byte_count - value of R2 on exit (X version only)
 *                file_count - value of R3 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x1C.
 */

extern os_error *xosfscontrol_count (char const *file_names,
      osfscontrol_count_flags flags,
      bits start_load,
      bits start_exec,
      bits end_load,
      bits end_exec,
      int *byte_count,
      int *file_count);
extern int osfscontrol_count (char const *file_names,
      osfscontrol_count_flags flags,
      bits start_load,
      bits start_exec,
      bits end_load,
      bits end_exec,
      int *file_count);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_read_secondary_fs()
 *
 * Description:   Reads location of secondary module for temporary filing
 *                system
 *
 * Output:        module - value of R1 on exit
 *                workspace - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x1E.
 */

extern os_error *xosfscontrol_read_secondary_fs (byte **module,
      void **workspace);
extern void osfscontrol_read_secondary_fs (byte **module,
      void **workspace);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_file_type_from_string()
 *
 * Description:   Converts a string giving a file type to a number
 *
 * Input:         file_type_name - value of R1 on entry
 *
 * Output:        file_type - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x1F.
 */

extern os_error *xosfscontrol_file_type_from_string (char const *file_type_name,
      bits *file_type);
extern bits osfscontrol_file_type_from_string (char const *file_type_name);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_file_info()
 *
 * Description:   Outputs a list of object names and information
 *
 * Input:         file_names - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x20.
 */

extern os_error *xosfscontrol_file_info (char const *file_names);
extern void osfscontrol_file_info (char const *file_names);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_read_fs_name()
 *
 * Description:   Converts a filing system number to a filing system name
 *
 * Input:         fs_no - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x21.
 */

extern os_error *xosfscontrol_read_fs_name (fileswitch_fs_no fs_no,
      char *buffer,
      int size);
extern void osfscontrol_read_fs_name (fileswitch_fs_no fs_no,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_register_image_fs()
 *
 * Description:   Adds an image filing system
 *
 * Input:         module - value of R1 on entry
 *                fs_info_offset - value of R2 on entry
 *                workspace - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x23.
 */

extern os_error *xosfscontrol_register_image_fs (byte const *module,
      int fs_info_offset,
      void *workspace);
extern void osfscontrol_register_image_fs (byte const *module,
      int fs_info_offset,
      void *workspace);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_deregister_image_fs()
 *
 * Description:   Removes an image filing system
 *
 * Input:         file_type - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x24.
 */

extern os_error *xosfscontrol_deregister_image_fs (bits file_type);
extern void osfscontrol_deregister_image_fs (bits file_type);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_canonicalise_path()
 *
 * Description:   Converts a path name to a canonical form
 *
 * Input:         path_name - value of R1 on entry
 *                buffer - value of R2 on entry
 *                var - value of R3 on entry
 *                path - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        spare - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x25.
 */

extern os_error *xosfscontrol_canonicalise_path (char const *path_name,
      char *buffer,
      char const *var,
      char const *path,
      int size,
      int *spare);
extern int osfscontrol_canonicalise_path (char const *path_name,
      char *buffer,
      char const *var,
      char const *path,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_info_to_file_type()
 *
 * Description:   Converts file information to an object's file type
 *
 * Input:         file_name - value of R1 on entry
 *                load_addr - value of R2 on entry
 *                exec_addr - value of R3 on entry
 *                size - value of R4 on entry
 *                attr - value of R5 on entry
 *                obj_type - value of R6 on entry
 *
 * Output:        file_type - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x26.
 */

extern os_error *xosfscontrol_info_to_file_type (char const *file_name,
      bits load_addr,
      bits exec_addr,
      int size,
      fileswitch_attr attr,
      fileswitch_object_type obj_type,
      bits *file_type);
extern bits osfscontrol_info_to_file_type (char const *file_name,
      bits load_addr,
      bits exec_addr,
      int size,
      fileswitch_attr attr,
      fileswitch_object_type obj_type);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_urd()
 *
 * Description:   Sets the user root directory (URD)
 *
 * Input:         dir_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x27.
 */

extern os_error *xosfscontrol_urd (char const *dir_name);
extern void osfscontrol_urd (char const *dir_name);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_back()
 *
 * Description:   Exchanges the current and previous (PSD) directories
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x28.
 */

extern os_error *xosfscontrol_back (void);
extern void osfscontrol_back (void);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_defect_list()
 *
 * Description:   Returns the defect list for an image
 *
 * Input:         image_name - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x29.
 */

extern os_error *xosfscontrol_defect_list (char const *image_name,
      byte *buffer,
      int size);
extern void osfscontrol_defect_list (char const *image_name,
      byte *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_add_defect()
 *
 * Description:   Maps out a defect from an image
 *
 * Input:         image_name - value of R1 on entry
 *                offset - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x2A.
 */

extern os_error *xosfscontrol_add_defect (char const *image_name,
      int offset);
extern void osfscontrol_add_defect (char const *image_name,
      int offset);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_no_dir()
 *
 * Description:   Unsets the current directory (CSD)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x2B.
 */

extern os_error *xosfscontrol_no_dir (void);
extern void osfscontrol_no_dir (void);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_no_urd()
 *
 * Description:   Unsets the user root directory (URD)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x2C.
 */

extern os_error *xosfscontrol_no_urd (void);
extern void osfscontrol_no_urd (void);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_no_lib()
 *
 * Description:   Unsets the library directory (Lib)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x2D.
 */

extern os_error *xosfscontrol_no_lib (void);
extern void osfscontrol_no_lib (void);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_used_space_map()
 *
 * Description:   Returns an image file's used space map
 *
 * Input:         image_name - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x2E.
 */

extern os_error *xosfscontrol_used_space_map (char const *image_name,
      byte *buffer,
      int size);
extern void osfscontrol_used_space_map (char const *image_name,
      byte *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_read_boot_option()
 *
 * Description:   Reads the boot option of the disc or image file that
 *                holds a specified object
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        boot_option - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x2F.
 */

extern os_error *xosfscontrol_read_boot_option (char const *file_name,
      int *boot_option);
extern int osfscontrol_read_boot_option (char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_write_boot_option()
 *
 * Description:   Writes the boot option of the disc or image file that
 *                holds a specified object
 *
 * Input:         file_name - value of R1 on entry
 *                boot_option - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x30.
 */

extern os_error *xosfscontrol_write_boot_option (char const *file_name,
      int boot_option);
extern void osfscontrol_write_boot_option (char const *file_name,
      int boot_option);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_free_space()
 *
 * Description:   Reads the free space on the disc or image file that holds
 *                a specified object
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        free - value of R0 on exit (X version only)
 *                max - value of R1 on exit
 *                size - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x31.
 */

extern os_error *xosfscontrol_free_space (char const *file_name,
      int *free,
      int *max,
      int *size);
extern int osfscontrol_free_space (char const *file_name,
      int *max,
      int *size);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_name_disc()
 *
 * Description:   Names the disc or image file that holds a specified
 *                object
 *
 * Input:         file_name - value of R1 on entry
 *                disc_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x32.
 */

extern os_error *xosfscontrol_name_disc (char const *file_name,
      char const *disc_name);
extern void osfscontrol_name_disc (char const *file_name,
      char const *disc_name);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_stamp_image()
 *
 * Description:   Used by a handler of discs to request that an image stamp
 *                be updated
 *
 * Input:         file_name - value of R1 on entry
 *                stamp_now - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x33.
 */

extern os_error *xosfscontrol_stamp_image (char const *file_name,
      osbool stamp_now);
extern void osfscontrol_stamp_image (char const *file_name,
      osbool stamp_now);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_object_at_offset()
 *
 * Description:   Finds the name and kind of an object that uses a
 *                particular offset within an image
 *
 * Input:         file_name - value of R1 on entry
 *                offset - value of R2 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        obj_kind - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x34.
 */

extern os_error *xosfscontrol_object_at_offset (char const *file_name,
      int offset,
      char *buffer,
      int size,
      osfscontrol_object_kind *obj_kind);
extern osfscontrol_object_kind osfscontrol_object_at_offset (char const *file_name,
      int offset,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_set_dir()
 *
 * Description:   Sets a specified directory to a given path without
 *                verification
 *
 * Input:         path - value of R1 on entry
 *                dir - value of R2 on entry
 *                fs_name - value of R3 on entry
 *                special - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x35.
 */

extern os_error *xosfscontrol_set_dir (char const *path,
      osfscontrol_special_dir dir,
      char const *fs_name,
      char const *special);
extern void osfscontrol_set_dir (char const *path,
      osfscontrol_special_dir dir,
      char const *fs_name,
      char const *special);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_read_dir()
 *
 * Description:   Reads the path of a specified directory
 *
 * Input:         buffer - value of R1 on entry
 *                dir - value of R2 on entry
 *                fs_name - value of R3 on entry
 *                size - value of R5 on entry
 *
 * Output:        spare - value of R5 on exit (X version only)
 *                special - value of R6 on exit
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x36.
 */

extern os_error *xosfscontrol_read_dir (char *buffer,
      osfscontrol_special_dir dir,
      char const *fs_name,
      int size,
      int *spare,
      char **special);
extern int osfscontrol_read_dir (char *buffer,
      osfscontrol_special_dir dir,
      char const *fs_name,
      int size,
      char **special);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_free_space64()
 *
 * Description:   Reads the 64-bit free space on the disc or image file
 *                that holds a specified object - RISC O S 3.6+
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        free_lo - value of R0 on exit
 *                free_hi - value of R1 on exit
 *                max - value of R2 on exit
 *                disc_size_lo - value of R3 on exit
 *                disc_size_hi - value of R4 on exit
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x37.
 */

extern os_error *xosfscontrol_free_space64 (char const *file_name,
      bits *free_lo,
      int *free_hi,
      int *max,
      bits *disc_size_lo,
      bits *disc_size_hi);
extern void osfscontrol_free_space64 (char const *file_name,
      bits *free_lo,
      int *free_hi,
      int *max,
      bits *disc_size_lo,
      bits *disc_size_hi);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_defect_list64()
 *
 * Description:   Returns the 64-bit defect list for an image - RISC O S
 *                3.6+
 *
 * Input:         image_name - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x38.
 */

extern os_error *xosfscontrol_defect_list64 (char const *image_name,
      byte *buffer,
      int size);
extern void osfscontrol_defect_list64 (char const *image_name,
      byte *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osfscontrol_add_defect64()
 *
 * Description:   Maps out a 64-bit defect from an image - RISC O S 3.6+
 *
 * Input:         image_name - value of R1 on entry
 *                offset_lo - value of R2 on entry
 *                offset_hi - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x29 with R0 = 0x39.
 */

extern os_error *xosfscontrol_add_defect64 (char const *image_name,
      bits offset_lo,
      int offset_hi);
extern void osfscontrol_add_defect64 (char const *image_name,
      bits offset_lo,
      int offset_hi);

/* ------------------------------------------------------------------------
 * Function:      upcall_media_not_present()
 *
 * Description:   Warns your program that a filing medium is not present
 *
 * Input:         fs_no - value of R1 on entry
 *                media_name - value of R2 on entry
 *                device_no - value of R3 on entry
 *                iteration_count - value of R4 on entry
 *                timeout - value of R5 on entry
 *                media_type - value of R6 on entry
 *
 * Output:        changed - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x1.
 */

extern os_error *xupcall_media_not_present (fileswitch_fs_no fs_no,
      char const *media_name,
      int device_no,
      int iteration_count,
      int timeout,
      char const *media_type,
      int *changed);
extern int upcall_media_not_present (fileswitch_fs_no fs_no,
      char const *media_name,
      int device_no,
      int iteration_count,
      int timeout,
      char const *media_type);

/* ------------------------------------------------------------------------
 * Function:      upcall_media_not_known()
 *
 * Description:   Warns your program that a filing medium is not known
 *
 * Input:         fs_no - value of R1 on entry
 *                media_name - value of R2 on entry
 *                device_no - value of R3 on entry
 *                iteration_count - value of R4 on entry
 *                timeout - value of R5 on entry
 *                media_type - value of R6 on entry
 *
 * Output:        changed - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x2.
 */

extern os_error *xupcall_media_not_known (fileswitch_fs_no fs_no,
      char const *media_name,
      int device_no,
      int iteration_count,
      int timeout,
      char const *media_type,
      int *changed);
extern int upcall_media_not_known (fileswitch_fs_no fs_no,
      char const *media_name,
      int device_no,
      int iteration_count,
      int timeout,
      char const *media_type);

/* ------------------------------------------------------------------------
 * Function:      upcallfscontrol_set_args_size()
 *
 * Description:   Warns your program that a file's size is being ensured.
 *                Prefer UpCallFSControl_SetArgsSizeW
 *
 * Input:         f - value of R1 on entry
 *                size - value of R2 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x200.
 */

extern os_error *xupcallfscontrol_set_args_size (os_f f,
      int size,
      fileswitch_fs_info fs_info);
extern void upcallfscontrol_set_args_size (os_f f,
      int size,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcallfscontrol_set_args_sizew()
 *
 * Description:   Warns your program that a file's size is being ensured.
 *                Uses 32-bit file handle.
 *
 * Input:         f - value of R1 on entry
 *                size - value of R2 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x200.
 */

extern os_error *xupcallfscontrol_set_args_sizew (os_fw f,
      int size,
      fileswitch_fs_info fs_info);
extern void upcallfscontrol_set_args_sizew (os_fw f,
      int size,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcallfscontrol_rename()
 *
 * Description:   Warns your program that a file is being renamed
 *
 * Input:         file_name - value of R1 on entry
 *                new_file_name - value of R2 on entry
 *                special - value of R6 on entry
 *                new_special - value of R7 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x208.
 */

extern os_error *xupcallfscontrol_rename (char const *file_name,
      char const *new_file_name,
      char const *special,
      char const *new_special,
      fileswitch_fs_info fs_info);
extern void upcallfscontrol_rename (char const *file_name,
      char const *new_file_name,
      char const *special,
      char const *new_special,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcallfscontrol_set_attr_string()
 *
 * Description:   Warns your program that a file's attributes are being set
 *
 * Input:         file_name - value of R1 on entry
 *                attr - value of R2 on entry
 *                special - value of R6 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x209.
 */

extern os_error *xupcallfscontrol_set_attr_string (char const *file_name,
      char const *attr,
      char const *special,
      fileswitch_fs_info fs_info);
extern void upcallfscontrol_set_attr_string (char const *file_name,
      char const *attr,
      char const *special,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcall_media_search_end()
 *
 * Description:   Informs your program that a missing filing medium has
 *                been supplied, or that an operation involving one has
 *                been cancelled
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x4.
 */

extern os_error *xupcall_media_search_end (void);
extern void upcall_media_search_end (void);

/* ------------------------------------------------------------------------
 * Function:      upcall_new_application()
 *
 * Description:   Warns your program that a new application is going to be
 *                started
 *
 * Input:         cao - value of R2 on entry
 *
 * Output:        started - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x100.
 */

extern os_error *xupcall_new_application (byte *cao,
      osbool *started);
extern osbool upcall_new_application (byte *cao);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#ifndef osfsctrl32_H
#include "oslib/osfsctrl32.h"
#endif

#endif
