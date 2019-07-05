#ifndef osfile_H
#define osfile_H

/* C header file for OSFile
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

#ifndef fileswitch_H
#include "oslib/fileswitch.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  OS_File
#define OS_File                                 0x8
#undef  XOS_File
#define XOS_File                                0x20008
#undef  OSFile_SaveStamped
#define OSFile_SaveStamped                      0xA
#undef  OSFile_Write
#define OSFile_Write                            0x1
#undef  OSFile_WriteLoad
#define OSFile_WriteLoad                        0x2
#undef  OSFile_WriteExec
#define OSFile_WriteExec                        0x3
#undef  OSFile_WriteAttr
#define OSFile_WriteAttr                        0x4
#undef  OSFile_Stamp
#define OSFile_Stamp                            0x9
#undef  OSFile_SetType
#define OSFile_SetType                          0x12
#undef  OSFile_Delete
#define OSFile_Delete                           0x6
#undef  OSFile_CreateStamped
#define OSFile_CreateStamped                    0xB
#undef  OSFile_CreateDir
#define OSFile_CreateDir                        0x8
#undef  OSFile_LoadStamped
#define OSFile_LoadStamped                      0xFF
#undef  OSFile_LoadStampedPath
#define OSFile_LoadStampedPath                  0xC
#undef  OSFile_LoadStampedPathVar
#define OSFile_LoadStampedPathVar               0xE
#undef  OSFile_LoadStampedNoPath
#define OSFile_LoadStampedNoPath                0x10
#undef  OSFile_MakeError
#define OSFile_MakeError                        0x13
#undef  OSFile_ReadStamped
#define OSFile_ReadStamped                      0x14
#undef  OSFile_ReadStampedPath
#define OSFile_ReadStampedPath                  0x15
#undef  OSFile_ReadStampedPathVar
#define OSFile_ReadStampedPathVar               0x16
#undef  OSFile_ReadStampedNoPath
#define OSFile_ReadStampedNoPath                0x17
#undef  OSFile_ReadBlockSize
#define OSFile_ReadBlockSize                    0x18
#undef  OSFile_Save
#define OSFile_Save                             0x0
#undef  OSFile_Read
#define OSFile_Read                             0x5
#undef  OSFile_ReadPath
#define OSFile_ReadPath                         0xD
#undef  OSFile_ReadPathVar
#define OSFile_ReadPathVar                      0xF
#undef  OSFile_ReadNoPath
#define OSFile_ReadNoPath                       0x11
#undef  OSFile_Create
#define OSFile_Create                           0x7
#undef  OSFile_Load
#define OSFile_Load                             0xFF
#undef  OSFile_LoadPath
#define OSFile_LoadPath                         0xC
#undef  OSFile_LoadPathVar
#define OSFile_LoadPathVar                      0xE
#undef  OSFile_LoadNoPath
#define OSFile_LoadNoPath                       0x10
#undef  FileV
#define FileV                                   0x8
#undef  UpCallFile_Save
#define UpCallFile_Save                         0x0
#undef  UpCallFile_SetArgs
#define UpCallFile_SetArgs                      0x1
#undef  UpCallFile_SetLoadAddr
#define UpCallFile_SetLoadAddr                  0x2
#undef  UpCallFile_SetExecAddr
#define UpCallFile_SetExecAddr                  0x3
#undef  UpCallFile_SetAttr
#define UpCallFile_SetAttr                      0x4
#undef  UpCallFile_Delete
#define UpCallFile_Delete                       0x6
#undef  UpCallFile_Create
#define UpCallFile_Create                       0x7
#undef  UpCallFile_CreateDir
#define UpCallFile_CreateDir                    0x8

/************************
 * Constant definitions *
 ************************/
#define osfile_NOT_FOUND                        ((fileswitch_object_type) 0x0u)
#define osfile_IS_FILE                          ((fileswitch_object_type) 0x1u)
#define osfile_IS_DIR                           ((fileswitch_object_type) 0x2u)
#define osfile_IS_IMAGE                         ((fileswitch_object_type) 0x3u)
#define osfile_FILE_TYPE                        0xFFF00u
#define osfile_FILE_TYPE_SHIFT                  8
#define osfile_TYPE_DRAW                        0xAFFu
#define osfile_TYPE_BBCROM                      0xBBCu
#define osfile_TYPE_CODE                        0xF95u
#define osfile_TYPE_RESOURCE                    0xFAEu
#define osfile_TYPE_DOS_DISC                    0xFC8u
#define osfile_TYPE_DEVICE                      0xFCCu
#define osfile_TYPE_CACHE                       0xFCFu
#define osfile_TYPE_TASK_EXEC                   0xFD6u
#define osfile_TYPE_TASK_OBEY                   0xFD7u
#define osfile_TYPE_DOS                         0xFE4u
#define osfile_TYPE_DESKTOP                     0xFEAu
#define osfile_TYPE_OBEY                        0xFEBu
#define osfile_TYPE_TEMPLATE                    0xFECu
#define osfile_TYPE_PALETTE                     0xFEDu
#define osfile_TYPE_CONFIG                      0xFF2u
#define osfile_TYPE_PRINTOUT                    0xFF4u
#define osfile_TYPE_POSTSCRIPT                  0xFF5u
#define osfile_TYPE_FONT                        0xFF6u
#define osfile_TYPE_BBC_FONT                    0xFF7u
#define osfile_TYPE_ABSOLUTE                    0xFF8u
#define osfile_TYPE_SPRITE                      0xFF9u
#define osfile_TYPE_MODULE                      0xFFAu
#define osfile_TYPE_BASIC                       0xFFBu
#define osfile_TYPE_UTILITY                     0xFFCu
#define osfile_TYPE_DATA                        0xFFDu
#define osfile_TYPE_COMMAND                     0xFFEu
#define osfile_TYPE_TEXT                        0xFFFu
#define osfile_TYPE_DIR                         0x1000u
#define osfile_TYPE_APPLICATION                 0x2000u
#define osfile_TYPE_UNTYPED                     0xFFFFFFFFu

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      osfile_save_stamped()
 *
 * Description:   Calls OS_File 10 to save a block of memory as a file
 *
 * Input:         file_name - value of R1 on entry
 *                file_type - value of R2 on entry
 *                data - value of R4 on entry
 *                end - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0xA.
 */

extern os_error *xosfile_save_stamped (char const *file_name,
      bits file_type,
      byte const *data,
      byte const *end);
extern void osfile_save_stamped (char const *file_name,
      bits file_type,
      byte const *data,
      byte const *end);

/* ------------------------------------------------------------------------
 * Function:      osfile_write()
 *
 * Description:   Calls OS_File 1 to write the load and execution addresses
 *                and attributes for an object
 *
 * Input:         file_name - value of R1 on entry
 *                load_addr - value of R2 on entry
 *                exec_addr - value of R3 on entry
 *                attr - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x1.
 */

extern os_error *xosfile_write (char const *file_name,
      bits load_addr,
      bits exec_addr,
      fileswitch_attr attr);
extern void osfile_write (char const *file_name,
      bits load_addr,
      bits exec_addr,
      fileswitch_attr attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_write_load()
 *
 * Description:   Calls OS_File 2 to write the load address for an object
 *
 * Input:         file_name - value of R1 on entry
 *                load_addr - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x2.
 */

extern os_error *xosfile_write_load (char const *file_name,
      bits load_addr);
extern void osfile_write_load (char const *file_name,
      bits load_addr);

/* ------------------------------------------------------------------------
 * Function:      osfile_write_exec()
 *
 * Description:   Calls OS_File 3 to write the execution address for an
 *                object
 *
 * Input:         file_name - value of R1 on entry
 *                exec_addr - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x3.
 */

extern os_error *xosfile_write_exec (char const *file_name,
      bits exec_addr);
extern void osfile_write_exec (char const *file_name,
      bits exec_addr);

/* ------------------------------------------------------------------------
 * Function:      osfile_write_attr()
 *
 * Description:   Calls OS_File 4 to write the attributes for an object
 *
 * Input:         file_name - value of R1 on entry
 *                attr - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x4.
 */

extern os_error *xosfile_write_attr (char const *file_name,
      fileswitch_attr attr);
extern void osfile_write_attr (char const *file_name,
      fileswitch_attr attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_stamp()
 *
 * Description:   Calls OS_File 9 to write the date stamp for an object
 *
 * Input:         file_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x9.
 */

extern os_error *xosfile_stamp (char const *file_name);
extern void osfile_stamp (char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      osfile_set_type()
 *
 * Description:   Calls OS_File 18 to write the file type for an object
 *
 * Input:         file_name - value of R1 on entry
 *                file_type - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x12.
 */

extern os_error *xosfile_set_type (char const *file_name,
      bits file_type);
extern void osfile_set_type (char const *file_name,
      bits file_type);

/* ------------------------------------------------------------------------
 * Function:      osfile_delete()
 *
 * Description:   Calls OS_File 6 to delete an object
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x6.
 */

extern os_error *xosfile_delete (char const *file_name,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_delete (char const *file_name,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_create_stamped()
 *
 * Description:   Calls OS_File to create an empty file
 *
 * Input:         file_name - value of R1 on entry
 *                file_type - value of R2 on entry
 *                size - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0xB, R4 = 0x0.
 */

extern os_error *xosfile_create_stamped (char const *file_name,
      bits file_type,
      int size);
extern void osfile_create_stamped (char const *file_name,
      bits file_type,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osfile_create_dir()
 *
 * Description:   Calls OS_File 8 to create a directory
 *
 * Input:         dir_name - value of R1 on entry
 *                entry_count - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x8.
 */

extern os_error *xosfile_create_dir (char const *dir_name,
      int entry_count);
extern void osfile_create_dir (char const *dir_name,
      int entry_count);

/* ------------------------------------------------------------------------
 * Function:      osfile_load_stamped()
 *
 * Description:   Calls OS_File 255 to load a file using the directory list
 *                in File$Path
 *
 * Input:         file_name - value of R1 on entry
 *                addr - value of R2 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0xFF, R3 = 0x0.
 */

extern os_error *xosfile_load_stamped (char const *file_name,
      byte *addr,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_load_stamped (char const *file_name,
      byte *addr,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_load_stamped_path()
 *
 * Description:   Calls OS_File 12 to load a file using a specified
 *                directory list
 *
 * Input:         file_name - value of R1 on entry
 *                addr - value of R2 on entry
 *                path - value of R4 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0xC, R3 = 0x0.
 */

extern os_error *xosfile_load_stamped_path (char const *file_name,
      byte *addr,
      char const *path,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_load_stamped_path (char const *file_name,
      byte *addr,
      char const *path,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_load_stamped_path_var()
 *
 * Description:   Calls OS_File 14 to load a file using the directory list
 *                in a specified variable
 *
 * Input:         file_name - value of R1 on entry
 *                addr - value of R2 on entry
 *                var - value of R4 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0xE, R3 = 0x0.
 */

extern os_error *xosfile_load_stamped_path_var (char const *file_name,
      byte *addr,
      char const *var,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_load_stamped_path_var (char const *file_name,
      byte *addr,
      char const *var,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_load_stamped_no_path()
 *
 * Description:   Calls OS_File 16 to load a file
 *
 * Input:         file_name - value of R1 on entry
 *                addr - value of R2 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x10, R3 = 0x0.
 */

extern os_error *xosfile_load_stamped_no_path (char const *file_name,
      byte *addr,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_load_stamped_no_path (char const *file_name,
      byte *addr,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_make_error()
 *
 * Description:   Calls OS_File 19 to generate an error message
 *
 * Input:         file_name - value of R1 on entry
 *                obj_type - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x13.
 */

extern os_error *xosfile_make_error (char const *file_name,
      fileswitch_object_type obj_type);
extern void osfile_make_error (char const *file_name,
      fileswitch_object_type obj_type);

/* ------------------------------------------------------------------------
 * Function:      osfile_read_stamped()
 *
 * Description:   Calls OS_File 20 to read catalogue information and file
 *                type for an object using the directory list in File$Path
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *                file_type - value of R6 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x14.
 */

extern os_error *xosfile_read_stamped (char const *file_name,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr,
      bits *file_type);
extern fileswitch_object_type osfile_read_stamped (char const *file_name,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr,
      bits *file_type);

/* ------------------------------------------------------------------------
 * Function:      osfile_read_stamped_path()
 *
 * Description:   Calls OS_File 21 to read catalogue information and file
 *                type for an object using a specified directory list
 *
 * Input:         file_name - value of R1 on entry
 *                path - value of R4 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *                file_type - value of R6 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x15.
 */

extern os_error *xosfile_read_stamped_path (char const *file_name,
      char const *path,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr,
      bits *file_type);
extern fileswitch_object_type osfile_read_stamped_path (char const *file_name,
      char const *path,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr,
      bits *file_type);

/* ------------------------------------------------------------------------
 * Function:      osfile_read_stamped_path_var()
 *
 * Description:   Calls OS_File 22 to read catalogue information and file
 *                type for an object using the directory list in a
 *                specified variable
 *
 * Input:         file_name - value of R1 on entry
 *                var - value of R4 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *                file_type - value of R6 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x16.
 */

extern os_error *xosfile_read_stamped_path_var (char const *file_name,
      char const *var,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr,
      bits *file_type);
extern fileswitch_object_type osfile_read_stamped_path_var (char const *file_name,
      char const *var,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr,
      bits *file_type);

/* ------------------------------------------------------------------------
 * Function:      osfile_read_stamped_no_path()
 *
 * Description:   Calls OS_File 23 to read catalogue information and file
 *                type for an object
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *                file_type - value of R6 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x17.
 */

extern os_error *xosfile_read_stamped_no_path (char const *file_name,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr,
      bits *file_type);
extern fileswitch_object_type osfile_read_stamped_no_path (char const *file_name,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr,
      bits *file_type);

/* ------------------------------------------------------------------------
 * Function:      osfile_read_block_size()
 *
 * Description:   Calls OS_File 24 to read the natural block size of a file
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        block_size - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x18.
 */

extern os_error *xosfile_read_block_size (char const *file_name,
      int *block_size);
extern int osfile_read_block_size (char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      osfile_save()
 *
 * Description:   Calls OS_File 0 to save a block of memory as an untyped
 *                file - prefer OSFile_SaveStamped
 *
 * Input:         file_name - value of R1 on entry
 *                load_addr - value of R2 on entry
 *                exec_addr - value of R3 on entry
 *                data - value of R4 on entry
 *                end - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x0.
 */

extern os_error *xosfile_save (char const *file_name,
      bits load_addr,
      bits exec_addr,
      byte const *data,
      byte const *end);
extern void osfile_save (char const *file_name,
      bits load_addr,
      bits exec_addr,
      byte const *data,
      byte const *end);

/* ------------------------------------------------------------------------
 * Function:      osfile_read()
 *
 * Description:   Calls OS_File 5 to read catalogue information for an
 *                object using the directory list in File$Path - prefer
 *                OSFile_ReadStamped
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x5.
 */

extern os_error *xosfile_read (char const *file_name,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_read (char const *file_name,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_read_path()
 *
 * Description:   Calls OS_File 13 to read catalogue information for an
 *                object using a specified directory list - prefer
 *                OSFile_ReadStampedPath
 *
 * Input:         file_name - value of R1 on entry
 *                path - value of R4 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0xD.
 */

extern os_error *xosfile_read_path (char const *file_name,
      char const *path,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_read_path (char const *file_name,
      char const *path,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_read_path_var()
 *
 * Description:   Calls OS_File 15 to read catalogue information for an
 *                object using the directory list in a specified variable -
 *                prefer OSFile_ReadStampedPathVar
 *
 * Input:         file_name - value of R1 on entry
 *                var - value of R4 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0xF.
 */

extern os_error *xosfile_read_path_var (char const *file_name,
      char const *var,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_read_path_var (char const *file_name,
      char const *var,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_read_no_path()
 *
 * Description:   Calls OS_File 17 to read catalogue information for an
 *                object - prefer OSFile_ReadStampedNoPath
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x11.
 */

extern os_error *xosfile_read_no_path (char const *file_name,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_read_no_path (char const *file_name,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_create()
 *
 * Description:   Calls OS_File 7 to create an empty untyped file - prefer
 *                OSFile_CreateStamped
 *
 * Input:         file_name - value of R1 on entry
 *                load_addr - value of R2 on entry
 *                exec_addr - value of R3 on entry
 *                size - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x7, R4 = 0x0.
 */

extern os_error *xosfile_create (char const *file_name,
      bits load_addr,
      bits exec_addr,
      int size);
extern void osfile_create (char const *file_name,
      bits load_addr,
      bits exec_addr,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osfile_load()
 *
 * Description:   Calls OS_File 8 to load an untyped file using the
 *                directory list in File$Path - prefer OSFile_LoadStamped
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0xFF, R3 = 0x1.
 */

extern os_error *xosfile_load (char const *file_name,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_load (char const *file_name,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_load_path()
 *
 * Description:   Calls OS_File 12 to load an untyped file using a
 *                specified directory list - prefer OSFile_LoadStampedPath
 *
 * Input:         file_name - value of R1 on entry
 *                path - value of R4 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0xC, R3 = 0x1.
 */

extern os_error *xosfile_load_path (char const *file_name,
      char const *path,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_load_path (char const *file_name,
      char const *path,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_load_path_var()
 *
 * Description:   Calls OS_File 14 to load an untyped file using the
 *                directory list in a specified variable - prefer
 *                OSFile_LoadStampedPathVar
 *
 * Input:         file_name - value of R1 on entry
 *                var - value of R4 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0xE, R3 = 0x1.
 */

extern os_error *xosfile_load_path_var (char const *file_name,
      char const *var,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_load_path_var (char const *file_name,
      char const *var,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      osfile_load_no_path()
 *
 * Description:   Calls OS_File 16 to load an untyped file - prefer
 *                OSFile_LoadStampedNoPath
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        obj_type - value of R0 on exit (X version only)
 *                load_addr - value of R2 on exit
 *                exec_addr - value of R3 on exit
 *                size - value of R4 on exit
 *                attr - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8 with R0 = 0x10, R3 = 0x1.
 */

extern os_error *xosfile_load_no_path (char const *file_name,
      fileswitch_object_type *obj_type,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);
extern fileswitch_object_type osfile_load_no_path (char const *file_name,
      bits *load_addr,
      bits *exec_addr,
      int *size,
      fileswitch_attr *attr);

/* ------------------------------------------------------------------------
 * Function:      upcallfile_save()
 *
 * Description:   Warns your program that a file is being saved
 *
 * Input:         file_name - value of R1 on entry
 *                load_addr - value of R2 on entry
 *                exec_addr - value of R3 on entry
 *                data - value of R4 on entry
 *                end - value of R5 on entry
 *                special - value of R6 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x0.
 */

extern os_error *xupcallfile_save (char const *file_name,
      bits load_addr,
      bits exec_addr,
      byte const *data,
      byte const *end,
      char const *special,
      fileswitch_fs_info fs_info);
extern void upcallfile_save (char const *file_name,
      bits load_addr,
      bits exec_addr,
      byte const *data,
      byte const *end,
      char const *special,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcallfile_set_args()
 *
 * Description:   Warns your program that a file's catalogue information is
 *                being written
 *
 * Input:         file_name - value of R1 on entry
 *                load_addr - value of R2 on entry
 *                exec_addr - value of R3 on entry
 *                attr - value of R5 on entry
 *                special - value of R6 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x1.
 */

extern os_error *xupcallfile_set_args (char const *file_name,
      bits load_addr,
      bits exec_addr,
      fileswitch_attr attr,
      char const *special,
      fileswitch_fs_info fs_info);
extern void upcallfile_set_args (char const *file_name,
      bits load_addr,
      bits exec_addr,
      fileswitch_attr attr,
      char const *special,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcallfile_set_load_addr()
 *
 * Description:   Warns your program that a file's load address is being
 *                written
 *
 * Input:         file_name - value of R1 on entry
 *                load_addr - value of R2 on entry
 *                special - value of R6 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x2.
 */

extern os_error *xupcallfile_set_load_addr (char const *file_name,
      bits load_addr,
      char const *special,
      fileswitch_fs_info fs_info);
extern void upcallfile_set_load_addr (char const *file_name,
      bits load_addr,
      char const *special,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcallfile_set_exec_addr()
 *
 * Description:   Warns your program that a file's execution address is
 *                being written
 *
 * Input:         file_name - value of R1 on entry
 *                exec_addr - value of R3 on entry
 *                special - value of R6 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x3.
 */

extern os_error *xupcallfile_set_exec_addr (char const *file_name,
      bits exec_addr,
      char const *special,
      fileswitch_fs_info fs_info);
extern void upcallfile_set_exec_addr (char const *file_name,
      bits exec_addr,
      char const *special,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcallfile_set_attr()
 *
 * Description:   Warns your program that a file's attributes are being
 *                written
 *
 * Input:         file_name - value of R1 on entry
 *                attr - value of R5 on entry
 *                special - value of R6 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x4.
 */

extern os_error *xupcallfile_set_attr (char const *file_name,
      fileswitch_attr attr,
      char const *special,
      fileswitch_fs_info fs_info);
extern void upcallfile_set_attr (char const *file_name,
      fileswitch_attr attr,
      char const *special,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcallfile_delete()
 *
 * Description:   Warns your program that a file is being deleted
 *
 * Input:         file_name - value of R1 on entry
 *                special - value of R6 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x6.
 */

extern os_error *xupcallfile_delete (char const *file_name,
      char const *special,
      fileswitch_fs_info fs_info);
extern void upcallfile_delete (char const *file_name,
      char const *special,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcallfile_create()
 *
 * Description:   Warns your program that a file is being created
 *
 * Input:         file_name - value of R1 on entry
 *                load_addr - value of R2 on entry
 *                exec_addr - value of R3 on entry
 *                data - value of R4 on entry
 *                end - value of R5 on entry
 *                special - value of R6 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x7.
 */

extern os_error *xupcallfile_create (char const *file_name,
      bits load_addr,
      bits exec_addr,
      byte const *data,
      byte const *end,
      char const *special,
      fileswitch_fs_info fs_info);
extern void upcallfile_create (char const *file_name,
      bits load_addr,
      bits exec_addr,
      byte const *data,
      byte const *end,
      char const *special,
      fileswitch_fs_info fs_info);

/* ------------------------------------------------------------------------
 * Function:      upcallfile_create_dir()
 *
 * Description:   Warns your program that a directory is being created
 *
 * Input:         file_name - value of R1 on entry
 *                load_addr - value of R2 on entry
 *                exec_addr - value of R3 on entry
 *                entry_count - value of R4 on entry
 *                special - value of R6 on entry
 *                fs_info - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x3, R9 = 0x8.
 */

extern os_error *xupcallfile_create_dir (char const *file_name,
      bits load_addr,
      bits exec_addr,
      int entry_count,
      char const *special,
      fileswitch_fs_info fs_info);
extern void upcallfile_create_dir (char const *file_name,
      bits load_addr,
      bits exec_addr,
      int entry_count,
      char const *special,
      fileswitch_fs_info fs_info);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
