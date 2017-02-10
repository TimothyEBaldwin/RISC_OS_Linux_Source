#ifndef osmodule_H
#define osmodule_H

/* C header file for OSModule
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:28 2007
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
#undef  OS_Module
#define OS_Module                               0x1E
#undef  XOS_Module
#define XOS_Module                              0x2001E
#undef  OSModule_Run
#define OSModule_Run                            0x0
#undef  OSModule_Load
#define OSModule_Load                           0x1
#undef  OSModule_Enter
#define OSModule_Enter                          0x2
#undef  OSModule_Reinit
#define OSModule_Reinit                         0x3
#undef  OSModule_Kill
#define OSModule_Kill                           0x4
#undef  OSModule_Info
#define OSModule_Info                           0x5
#undef  OSModule_Alloc
#define OSModule_Alloc                          0x6
#undef  OSModule_Free
#define OSModule_Free                           0x7
#undef  OSModule_Tidy
#define OSModule_Tidy                           0x8
#undef  OSModule_Clear
#define OSModule_Clear                          0x9
#undef  OSModule_AddArea
#define OSModule_AddArea                        0xA
#undef  OSModule_CopyArea
#define OSModule_CopyArea                       0xB
#undef  OSModule_Enumerate
#define OSModule_Enumerate                      0xC
#undef  OSModule_Realloc
#define OSModule_Realloc                        0xD
#undef  OSModule_Instantiate
#define OSModule_Instantiate                    0xE
#undef  OSModule_Rename
#define OSModule_Rename                         0xF
#undef  OSModule_Prefer
#define OSModule_Prefer                         0x10
#undef  OSModule_AddPoduleArea
#define OSModule_AddPoduleArea                  0x11
#undef  OSModule_Lookup
#define OSModule_Lookup                         0x12
#undef  OSModule_EnumerateROM
#define OSModule_EnumerateROM                   0x13
#undef  OSModule_EnumerateROMWithInfo
#define OSModule_EnumerateROMWithInfo           0x14
#undef  Service_UKCommand
#define Service_UKCommand                       0x4
#undef  Service_Error
#define Service_Error                           0x6
#undef  Service_UKByte
#define Service_UKByte                          0x7
#undef  Service_UKWord
#define Service_UKWord                          0x8
#undef  Service_Help
#define Service_Help                            0x9
#undef  Service_UKConfig
#define Service_UKConfig                        0x28
#undef  Service_UKStatus
#define Service_UKStatus                        0x29
#undef  Service_NewApplication
#define Service_NewApplication                  0x2A
#undef  Service_LookupFileType
#define Service_LookupFileType                  0x42
#undef  Service_PostInit
#define Service_PostInit                        0x73
#undef  Service_SyntaxError
#define Service_SyntaxError                     0x8C
#undef  Service_ModulePostInit
#define Service_ModulePostInit                  0xDA
#undef  Service_ModulePostFinal
#define Service_ModulePostFinal                 0xDB

/********************
 * Type definitions *
 ********************/
typedef int osmodule_section_no;

typedef int osmodule_status;

typedef bits osmodule_info_flags;

typedef bits osmodule_flags;

/************************
 * Constant definitions *
 ************************/
#define osmodule_ENTRY_START                    0
      /*Offset to start entry point*/
#define osmodule_ENTRY_INIT                     4
      /*Offset to initialisation entry point*/
#define osmodule_ENTRY_DIE                      8
      /*Offset to termination entry point*/
#define osmodule_ENTRY_SERVICE                  12
      /*Offset to service entry point*/
#define osmodule_ENTRY_TITLE                    16
      /*Offset to title*/
#define osmodule_ENTRY_HELP                     20
      /*Offset to help*/
#define osmodule_ENTRY_TABLE                    24
      /*Offset to help table*/
#define osmodule_ENTRY_SWI_CHUNK                28
      /*Offset to SWI chunk number*/
#define osmodule_ENTRY_SWI_ENTRY                32
      /*Offset to SWI entry point*/
#define osmodule_ENTRY_NAME_TABLE               36
      /*Offset to SWI name table*/
#define osmodule_ENTRY_NAME_CODE                40
      /*Offset to SWI name code*/
#define osmodule_ENTRY_MESSAGE_FILE             44
      /*Offset to messages file name - RISC O S 3.6+*/
#define osmodule_ENTRY_FLAGS_OFFSET             48
      /*Offset to flag word(s)*/
#define osmodule_SWI_CHUNK_SIZE                 64
#define osmodule_SWI_SYSTEM_BASE                262144
#define osmodule_SWI_APPLICATION_BASE           524288
#define osmodule_SWI_USER_BASE                  786432
#define osmodule_SECTION_SYSTEM                 ((osmodule_section_no) 0xFFFFFFFFu)
#define osmodule_SECTION_CARD0                  ((osmodule_section_no) 0x0u)
#define osmodule_SECTION_CARD1                  ((osmodule_section_no) 0x1u)
#define osmodule_SECTION_CARD2                  ((osmodule_section_no) 0x2u)
#define osmodule_SECTION_CARD3                  ((osmodule_section_no) 0x3u)
#define osmodule_SECTION_ROM1                   ((osmodule_section_no) 0xFFFFFFFEu)
#define osmodule_SECTION_ROM2                   ((osmodule_section_no) 0xFFFFFFFDu)
#define osmodule_SECTION_ROM3                   ((osmodule_section_no) 0xFFFFFFFCu)
#define osmodule_SECTION_ROM4                   ((osmodule_section_no) 0xFFFFFFFBu)
#define osmodule_STATUS_UNPLUGGED               ((osmodule_status) 0xFFFFFFFFu)
#define osmodule_STATUS_DORMANT                 ((osmodule_status) 0x0u)
#define osmodule_STATUS_ACTIVE                  ((osmodule_status) 0x1u)
#define osmodule_STATUS_RUNNING                 ((osmodule_status) 0x2u)
#define osmodule_INFO_FS_COMMAND                ((osmodule_info_flags) 0x80u)
#define osmodule_INFO_CONFIGURATION             ((osmodule_info_flags) 0x40u)
#define osmodule_INFO_HELP                      ((osmodule_info_flags) 0x20u)
#define osmodule_INFO_LOOKUP_STRINGS            ((osmodule_info_flags) 0x10u)
      /*RISC O S 3.6+*/
#define osmodule_32_BIT_COMPATIBLE              ((osmodule_flags) 0x1u)
#define error_MODULE_NOT_MOD                    0x100u
#define error_MODULE_MH_NO_ROOM                 0x101u
#define error_MODULE_RM_NOT_FOUND               0x102u
#define error_MODULE_CANT_KILL                  0x103u
#define error_MODULE_CANT_KILL2                 0x103u
#define error_MODULE_WIMP_CANT_KILL             0x104u
#define error_MODULE_BAD_MODULE_REASON          0x105u
#define error_MODULE_BAD_DYNAMIC_AREA           0x105u
#define error_MODULE_RM_NOT_FOUND_IN_ROM        0x106u
#define error_MODULE_MODULE_POSTFIX             0x107u
#define error_MODULE_NO_MORE_MODULES            0x108u
#define error_MODULE_NO_MORE_INCARNATIONS       0x109u
#define error_MODULE_POSTFIX_NEEDED             0x109u
#define error_MODULE_INCARNATION_EXISTS         0x10Bu
#define error_MODULE_INCARNATION_NOT_FOUND      0x10Cu
#define error_MODULE_CHUNK_NOT_RM               0x10Du
#define error_MODULE_BAD_RM_HEADER_FIELD        0x10Eu
#define error_MODULE_MODULE_TOO_OLD             0x10Fu
#define error_MODULE_MODULE_BAD_SWI             0x110u
#define error_MODULE_MODULE_IN_USE              0x111u
#define error_MODULE_BAD_FILING_SYSTEM_OPERATION 0x112u
#define error_MODULE_FILING_SYSTEM_READ_ONLY    0x113u
#define error_MODULE_NOT_ADIR                   0x114u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      osmodule_run()
 *
 * Description:   Loads, initialises and enters a module
 *
 * Input:         tail - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x0.
 */

extern os_error *xosmodule_run (char const *tail);
extern void osmodule_run (char const *tail);

/* ------------------------------------------------------------------------
 * Function:      osmodule_load()
 *
 * Description:   Loads a module
 *
 * Input:         tail - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x1.
 */

extern os_error *xosmodule_load (char const *tail);
extern void osmodule_load (char const *tail);

/* ------------------------------------------------------------------------
 * Function:      osmodule_enter()
 *
 * Description:   Enters a module
 *
 * Input:         module_name - value of R1 on entry
 *                args - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x2.
 */

extern os_error *xosmodule_enter (char const *module_name,
      char const *args);
extern void osmodule_enter (char const *module_name,
      char const *args);

/* ------------------------------------------------------------------------
 * Function:      osmodule_reinit()
 *
 * Description:   Reloads a module
 *
 * Input:         tail - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x3.
 */

extern os_error *xosmodule_reinit (char const *tail);
extern void osmodule_reinit (char const *tail);

/* ------------------------------------------------------------------------
 * Function:      osmodule_kill()
 *
 * Description:   Deletes a module
 *
 * Input:         module_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x4.
 */

extern os_error *xosmodule_kill (char const *module_name);
extern void osmodule_kill (char const *module_name);

/* ------------------------------------------------------------------------
 * Function:      osmodule_info()
 *
 * Description:   Describes the RMA
 *
 * Output:        max - value of R2 on exit
 *                free - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x5.
 */

extern os_error *xosmodule_info (int *max,
      int *free);
extern int osmodule_info (int *max);

/* ------------------------------------------------------------------------
 * Function:      osmodule_alloc()
 *
 * Description:   Claims a block of workspace in the RMA
 *
 * Input:         size - value of R3 on entry
 *
 * Output:        blk - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x6.
 */

extern os_error *xosmodule_alloc (int size,
      void **blk);
extern void *osmodule_alloc (int size);

/* ------------------------------------------------------------------------
 * Function:      osmodule_free()
 *
 * Description:   Frees a block of workspace in the RMA
 *
 * Input:         blk - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x7.
 */

extern os_error *xosmodule_free (void *blk);
extern void osmodule_free (void *blk);

/* ------------------------------------------------------------------------
 * Function:      osmodule_tidy()
 *
 * Description:   Tidies modules
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x8.
 */

extern os_error *xosmodule_tidy (void);
extern void osmodule_tidy (void);

/* ------------------------------------------------------------------------
 * Function:      osmodule_clear()
 *
 * Description:   Clears all modules
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x9.
 */

extern os_error *xosmodule_clear (void);
extern void osmodule_clear (void);

/* ------------------------------------------------------------------------
 * Function:      osmodule_add_area()
 *
 * Description:   Inserts a module from memory
 *
 * Input:         module - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0xA.
 */

extern os_error *xosmodule_add_area (byte const *module);
extern void osmodule_add_area (byte const *module);

/* ------------------------------------------------------------------------
 * Function:      osmodule_copy_area()
 *
 * Description:   Inserts a module from memory and moves it into the RMA
 *
 * Input:         module - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0xB.
 */

extern os_error *xosmodule_copy_area (byte const *module,
      int size);
extern void osmodule_copy_area (byte const *module,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osmodule_enumerate()
 *
 * Description:   Extracts module information
 *
 * Input:         module_no - value of R1 on entry
 *                instance_no - value of R2 on entry
 *
 * Output:        module_no_out - value of R1 on exit (X version only)
 *                instance_no_out - value of R2 on exit
 *                module - value of R3 on exit
 *                workspace - value of R4 on exit
 *                postfix - value of R5 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0xC.
 */

extern os_error *xosmodule_enumerate (int module_no,
      int instance_no,
      int *module_no_out,
      int *instance_no_out,
      byte **module,
      void **workspace,
      char **postfix);
extern int osmodule_enumerate (int module_no,
      int instance_no,
      int *instance_no_out,
      byte **module,
      void **workspace,
      char **postfix);

/* ------------------------------------------------------------------------
 * Function:      osmodule_realloc()
 *
 * Description:   Extends a block of workspace in the RMA by a given size
 *
 * Input:         blk - value of R2 on entry
 *                size_increase - value of R3 on entry
 *
 * Output:        blk_out - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0xD.
 */

extern os_error *xosmodule_realloc (void *blk,
      int size_increase,
      void **blk_out);
extern void *osmodule_realloc (void *blk,
      int size_increase);

/* ------------------------------------------------------------------------
 * Function:      osmodule_instantiate()
 *
 * Description:   Creates a new instance of a module
 *
 * Input:         instance_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0xE.
 */

extern os_error *xosmodule_instantiate (char const *instance_name);
extern void osmodule_instantiate (char const *instance_name);

/* ------------------------------------------------------------------------
 * Function:      osmodule_rename()
 *
 * Description:   Renames an instance of a module
 *
 * Input:         old_name - value of R1 on entry
 *                new_postfix - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0xF.
 */

extern os_error *xosmodule_rename (char const *old_name,
      char const *new_postfix);
extern void osmodule_rename (char const *old_name,
      char const *new_postfix);

/* ------------------------------------------------------------------------
 * Function:      osmodule_prefer()
 *
 * Description:   Selects the preferred instance of a particular module
 *
 * Input:         instance_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x10.
 */

extern os_error *xosmodule_prefer (char const *instance_name);
extern void osmodule_prefer (char const *instance_name);

/* ------------------------------------------------------------------------
 * Function:      osmodule_add_podule_area()
 *
 * Description:   Adds an expansion card module
 *
 * Input:         environment - value of R1 on entry
 *                chunk - value of R2 on entry
 *                rom_section - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x11.
 */

extern os_error *xosmodule_add_podule_area (char const *environment,
      int chunk,
      osmodule_section_no rom_section);
extern void osmodule_add_podule_area (char const *environment,
      int chunk,
      osmodule_section_no rom_section);

/* ------------------------------------------------------------------------
 * Function:      osmodule_lookup()
 *
 * Description:   Looks up a module name
 *
 * Input:         module_name - value of R1 on entry
 *
 * Output:        module_no - value of R1 on exit (X version only)
 *                instance_no - value of R2 on exit
 *                module - value of R3 on exit
 *                workspace - value of R4 on exit
 *                postfix - value of R5 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x12.
 */

extern os_error *xosmodule_lookup (char const *module_name,
      int *module_no,
      int *instance_no,
      byte **module,
      void **workspace,
      char **postfix);
extern int osmodule_lookup (char const *module_name,
      int *instance_no,
      byte **module,
      void **workspace,
      char **postfix);

/* ------------------------------------------------------------------------
 * Function:      osmodule_enumerate_rom()
 *
 * Description:   Enumerates ROM modules
 *
 * Input:         module_no - value of R1 on entry
 *                section - value of R2 on entry
 *
 * Output:        module_no_out - value of R1 on exit (X version only)
 *                section_out - value of R2 on exit
 *                module_name - value of R3 on exit
 *                status - value of R4 on exit
 *                chunk_no - value of R5 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x13.
 */

extern os_error *xosmodule_enumerate_rom (int module_no,
      osmodule_section_no section,
      int *module_no_out,
      int *section_out,
      char **module_name,
      osmodule_status *status,
      int *chunk_no);
extern int osmodule_enumerate_rom (int module_no,
      osmodule_section_no section,
      int *section_out,
      char **module_name,
      osmodule_status *status,
      int *chunk_no);

/* ------------------------------------------------------------------------
 * Function:      osmodule_enumerate_rom_with_info()
 *
 * Description:   Enumerates ROM modules with version
 *
 * Input:         module_no - value of R1 on entry
 *                section - value of R2 on entry
 *
 * Output:        module_no_out - value of R1 on exit (X version only)
 *                section_out - value of R2 on exit
 *                module_name - value of R3 on exit
 *                status - value of R4 on exit
 *                chunk_no - value of R5 on exit
 *                bcd_version - value of R6 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1E with R0 = 0x14.
 */

extern os_error *xosmodule_enumerate_rom_with_info (int module_no,
      osmodule_section_no section,
      int *module_no_out,
      int *section_out,
      char **module_name,
      osmodule_status *status,
      int *chunk_no,
      int *bcd_version);
extern int osmodule_enumerate_rom_with_info (int module_no,
      osmodule_section_no section,
      int *section_out,
      char **module_name,
      osmodule_status *status,
      int *chunk_no,
      int *bcd_version);

/* ------------------------------------------------------------------------
 * Function:      service_uk_command()
 *
 * Description:   Unknown command
 *
 * Input:         command - value of R0 on entry
 *
 * Output:        error - value of R0 on exit
 *                unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x4.
 */

extern os_error *xservice_uk_command (char const *command,
      os_error **error,
      osbool *unclaimed);
extern osbool service_uk_command (char const *command,
      os_error **error);

/* ------------------------------------------------------------------------
 * Function:      service_error()
 *
 * Description:   An error has occurred
 *
 * Input:         error - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x6.
 */

extern os_error *xservice_error (os_error const *error);
extern void service_error (os_error const *error);

/* ------------------------------------------------------------------------
 * Function:      service_uk_byte()
 *
 * Description:   Unknown OS_Byte
 *
 * Input:         byte - value of R2 on entry
 *                arg0 - value of R3 on entry
 *                arg1 - value of R4 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                res0 - value of R2 on exit
 *                res1 - value of R3 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x7.
 */

extern os_error *xservice_uk_byte (int byte,
      int arg0,
      int arg1,
      osbool *unclaimed,
      int *res0,
      int *res1);
extern osbool service_uk_byte (int byte,
      int arg0,
      int arg1,
      int *res0,
      int *res1);

/* ------------------------------------------------------------------------
 * Function:      service_uk_word()
 *
 * Description:   Unknown OS_Word
 *
 * Input:         word - value of R2 on entry
 *                block - value of R3 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x8.
 */

extern os_error *xservice_uk_word (int word,
      byte const *block,
      osbool *unclaimed);
extern osbool service_uk_word (int word,
      byte const *block);

/* ------------------------------------------------------------------------
 * Function:      service_help()
 *
 * Description:   *Help has been called
 *
 * Input:         command - value of R0 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x9.
 */

extern os_error *xservice_help (char const *command,
      osbool *unclaimed);
extern osbool service_help (char const *command);

/* ------------------------------------------------------------------------
 * Function:      service_uk_config()
 *
 * Description:   Unknown *Configure
 *
 * Input:         tail - value of R0 on entry
 *
 * Output:        error - value of R0 on exit
 *                unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x28.
 */

extern os_error *xservice_uk_config (char const *tail,
      os_error **error,
      osbool *unclaimed);
extern osbool service_uk_config (char const *tail,
      os_error **error);

/* ------------------------------------------------------------------------
 * Function:      service_uk_status()
 *
 * Description:   Unknown *Status
 *
 * Input:         tail - value of R0 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x29.
 */

extern os_error *xservice_uk_status (char const *tail,
      osbool *unclaimed);
extern osbool service_uk_status (char const *tail);

/* ------------------------------------------------------------------------
 * Function:      service_new_application()
 *
 * Description:   Application about to start
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x2A.
 */

extern os_error *xservice_new_application (osbool *unclaimed);
extern osbool service_new_application (void);

/* ------------------------------------------------------------------------
 * Function:      service_lookup_file_type()
 *
 * Description:   Look up file type
 *
 * Input:         file_type - value of R2 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                name1 - value of R2 on exit
 *                name2 - value of R3 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x42.
 */

extern os_error *xservice_lookup_file_type (bits file_type,
      osbool *unclaimed,
      bits *name1,
      bits *name2);
extern osbool service_lookup_file_type (bits file_type,
      bits *name1,
      bits *name2);

/* ------------------------------------------------------------------------
 * Function:      service_post_init()
 *
 * Description:   All modules have been initialised
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x73.
 */

extern os_error *xservice_post_init (void);
extern void service_post_init (void);

/* ------------------------------------------------------------------------
 * Function:      service_syntax_error()
 *
 * Description:   Syntax error translation
 *
 * Input:         offset - value of R2 on entry
 *                base - value of R3 on entry
 *                command - value of R4 on entry
 *
 * Output:        error - value of R0 on exit
 *                unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x8C.
 */

extern os_error *xservice_syntax_error (int const *offset,
      byte *base,
      char const *command,
      os_error **error,
      osbool *unclaimed);
extern osbool service_syntax_error (int const *offset,
      byte *base,
      char const *command,
      os_error **error);

/* ------------------------------------------------------------------------
 * Function:      service_module_post_init()
 *
 * Description:   A module has been succesfully initialised - RISC O S 5+
 *
 * Input:         module - value of R0 on entry
 *                title - value of R2 on entry
 *                postfix - value of R3 on entry
 *                bcd_version - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0xDA.
 */

extern os_error *xservice_module_post_init (byte const *module,
      char const *title,
      char const *postfix,
      int bcd_version);
extern void service_module_post_init (byte const *module,
      char const *title,
      char const *postfix,
      int bcd_version);

/* ------------------------------------------------------------------------
 * Function:      service_module_post_final()
 *
 * Description:   A module has been succesfully finalised - RISC O S 5+
 *
 * Input:         module - value of R0 on entry
 *                title - value of R2 on entry
 *                postfix - value of R3 on entry
 *                bcd_version - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0xDB.
 */

extern os_error *xservice_module_post_final (byte const *module,
      char const *title,
      char const *postfix,
      int bcd_version);
extern void service_module_post_final (byte const *module,
      char const *title,
      char const *postfix,
      int bcd_version);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
