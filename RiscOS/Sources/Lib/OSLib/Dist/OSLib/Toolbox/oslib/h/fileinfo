#ifndef fileinfo_H
#define fileinfo_H

/* C header file for FileInfo
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:37 2007
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

#ifndef toolbox_H
#include "oslib/toolbox.h"
#endif

#ifndef window_H
#include "oslib/window.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  FileInfo_ClassSWI
#define FileInfo_ClassSWI                       0x82AC0
#undef  XFileInfo_ClassSWI
#define XFileInfo_ClassSWI                      0xA2AC0
#undef  FileInfo_PostFilter
#define FileInfo_PostFilter                     0x82AC1
#undef  XFileInfo_PostFilter
#define XFileInfo_PostFilter                    0xA2AC1
#undef  FileInfo_PreFilter
#define FileInfo_PreFilter                      0x82AC2
#undef  XFileInfo_PreFilter
#define XFileInfo_PreFilter                     0xA2AC2
#undef  FileInfo_GetWindowId
#define FileInfo_GetWindowId                    0x0
#undef  FileInfo_SetModified
#define FileInfo_SetModified                    0x1
#undef  FileInfo_GetModified
#define FileInfo_GetModified                    0x2
#undef  FileInfo_SetFileType
#define FileInfo_SetFileType                    0x3
#undef  FileInfo_GetFileType
#define FileInfo_GetFileType                    0x4
#undef  FileInfo_SetFileName
#define FileInfo_SetFileName                    0x5
#undef  FileInfo_GetFileName
#define FileInfo_GetFileName                    0x6
#undef  FileInfo_SetFileSize
#define FileInfo_SetFileSize                    0x7
#undef  FileInfo_GetFileSize
#define FileInfo_GetFileSize                    0x8
#undef  FileInfo_SetDate
#define FileInfo_SetDate                        0x9
#undef  FileInfo_GetDate
#define FileInfo_GetDate                        0xA
#undef  FileInfo_SetTitle
#define FileInfo_SetTitle                       0xB
#undef  FileInfo_GetTitle
#define FileInfo_GetTitle                       0xC

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct fileinfo_object                  fileinfo_object;
typedef struct fileinfo_object_template         fileinfo_object_template;
typedef struct fileinfo_action_about_to_be_shown fileinfo_action_about_to_be_shown;
typedef struct fileinfo_action_about_to_be_shown_block fileinfo_action_about_to_be_shown_block;

/********************
 * Type definitions *
 ********************/
typedef bits fileinfo_flags;

/* ------------------------------------------------------------------------
 * Type:          fileinfo_object
 *
 * Description:   Structure to describe Object for in-memory construction - to be referenced from Toolbox_Template
 */

struct fileinfo_object
   {  fileinfo_flags flags;
      toolbox_msg_reference title;
      int title_limit;
      osbool modified;
      bits file_type;
      toolbox_msg_reference file_name;
      int file_size;
      os_date_and_time date_and_time;
      byte reserved [3];
      toolbox_string_reference alternative_window_name;
   };

struct fileinfo_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      fileinfo_flags objectflags;
      toolbox_msg_reference title;
      int title_limit;
      osbool modified;
      bits file_type;
      toolbox_msg_reference file_name;
      int file_size;
      os_date_and_time date_and_time;
      byte reserved [3];
      toolbox_string_reference alternative_window_name;
   };

typedef toolbox_full fileinfo_full;

/* ------------------------------------------------------------------------
 * Type:          fileinfo_action_about_to_be_shown
 *
 * Description:   Prefer FileInfo_ActionAboutToBeShownBlock
 */

struct fileinfo_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         fileinfo_full full;
      }
      position;
   };

struct fileinfo_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         fileinfo_full full;
      }
      position;
   };

typedef toolbox_action_header_base fileinfo_action_dialogue_completed_block;

/************************
 * Constant definitions *
 ************************/
#define class_FILE_INFO                         ((toolbox_class) 0x82AC0u)
#define error_FILE_INFO_TASKS_ACTIVE            0x80B200u
#define error_FILE_INFO_ALLOC_FAILED            0x80B201u
#define error_FILE_INFO_SHORT_BUFFER            0x80B202u
#define error_FILE_INFO_NO_SUCH_TASK            0x80B211u
#define error_FILE_INFO_NO_SUCH_METHOD          0x80B212u
#define error_FILE_INFO_NO_SUCH_MISC_OP_METHOD  0x80B213u
#define fileinfo_GENERATE_ABOUT_TO_BE_SHOWN     ((fileinfo_flags) 0x1u)
#define fileinfo_GENERATE_DIALOGUE_COMPLETED    ((fileinfo_flags) 0x2u)
#define action_FILE_INFO_ABOUT_TO_BE_SHOWN      0x82AC0u
#define action_FILE_INFO_DIALOGUE_COMPLETED     0x82AC1u
#define fileinfo_DATE                           ((toolbox_c) 0x82AC01u)
#define fileinfo_FILE_SIZE                      ((toolbox_c) 0x82AC02u)
#define fileinfo_FILE_NAME                      ((toolbox_c) 0x82AC03u)
#define fileinfo_FILE_TYPE                      ((toolbox_c) 0x82AC04u)
#define fileinfo_MODIFIED                       ((toolbox_c) 0x82AC05u)
#define fileinfo_FILE_ICON                      ((toolbox_c) 0x82AC06u)
#define fileinfo_DATE_LABEL                     ((toolbox_c) 0x82AC07u)
#define fileinfo_FILE_SIZE_LABEL                ((toolbox_c) 0x82AC08u)
#define fileinfo_MODIFIED_LABEL                 ((toolbox_c) 0x82AC09u)
#define fileinfo_FILE_TYPE_LABEL                ((toolbox_c) 0x82AC0Au)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      fileinfo_get_window_id()
 *
 * Description:   Gets the underlying window object ID for the specified
 *                file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *
 * Output:        window - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x0.
 */

extern os_error *xfileinfo_get_window_id (bits flags,
      toolbox_o file_info,
      toolbox_o *window);
extern toolbox_o fileinfo_get_window_id (bits flags,
      toolbox_o file_info);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_set_modified()
 *
 * Description:   Sets the modified flag for the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *                modified - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x1.
 */

extern os_error *xfileinfo_set_modified (bits flags,
      toolbox_o file_info,
      osbool modified);
extern void fileinfo_set_modified (bits flags,
      toolbox_o file_info,
      osbool modified);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_get_modified()
 *
 * Description:   Gets the modified flag for the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *
 * Output:        modified - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x2.
 */

extern os_error *xfileinfo_get_modified (bits flags,
      toolbox_o file_info,
      osbool *modified);
extern osbool fileinfo_get_modified (bits flags,
      toolbox_o file_info);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_set_file_type()
 *
 * Description:   Sets the file type for the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *                file_type - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x3.
 */

extern os_error *xfileinfo_set_file_type (bits flags,
      toolbox_o file_info,
      bits file_type);
extern void fileinfo_set_file_type (bits flags,
      toolbox_o file_info,
      bits file_type);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_get_file_type()
 *
 * Description:   Gets the file type for the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *
 * Output:        file_type - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4.
 */

extern os_error *xfileinfo_get_file_type (bits flags,
      toolbox_o file_info,
      bits *file_type);
extern bits fileinfo_get_file_type (bits flags,
      toolbox_o file_info);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_set_file_name()
 *
 * Description:   Sets the file name for the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *                file_name - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x5.
 */

extern os_error *xfileinfo_set_file_name (bits flags,
      toolbox_o file_info,
      char const *file_name);
extern void fileinfo_set_file_name (bits flags,
      toolbox_o file_info,
      char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_get_file_name()
 *
 * Description:   Gets the file name from the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x6.
 */

extern os_error *xfileinfo_get_file_name (bits flags,
      toolbox_o file_info,
      char *buffer,
      int size,
      int *used);
extern int fileinfo_get_file_name (bits flags,
      toolbox_o file_info,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_set_file_size()
 *
 * Description:   Sets the file size for the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *                file_size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x7.
 */

extern os_error *xfileinfo_set_file_size (bits flags,
      toolbox_o file_info,
      int file_size);
extern void fileinfo_set_file_size (bits flags,
      toolbox_o file_info,
      int file_size);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_get_file_size()
 *
 * Description:   Gets the file size from the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *
 * Output:        file_size - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x8.
 */

extern os_error *xfileinfo_get_file_size (bits flags,
      toolbox_o file_info,
      int *file_size);
extern int fileinfo_get_file_size (bits flags,
      toolbox_o file_info);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_set_date()
 *
 * Description:   Sets the date and time for the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *                date_and_time - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x9.
 */

extern os_error *xfileinfo_set_date (bits flags,
      toolbox_o file_info,
      os_date_and_time const *date_and_time);
extern void fileinfo_set_date (bits flags,
      toolbox_o file_info,
      os_date_and_time const *date_and_time);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_get_date()
 *
 * Description:   Gets the date and time for the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *                date_and_time - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0xA.
 */

extern os_error *xfileinfo_get_date (bits flags,
      toolbox_o file_info,
      os_date_and_time *date_and_time);
extern void fileinfo_get_date (bits flags,
      toolbox_o file_info,
      os_date_and_time *date_and_time);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_set_title()
 *
 * Description:   Sets the title for the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *                title - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0xB.
 */

extern os_error *xfileinfo_set_title (bits flags,
      toolbox_o file_info,
      char const *title);
extern void fileinfo_set_title (bits flags,
      toolbox_o file_info,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      fileinfo_get_title()
 *
 * Description:   Gets the title from the specified file info object
 *
 * Input:         flags - value of R0 on entry
 *                file_info - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0xC.
 */

extern os_error *xfileinfo_get_title (bits flags,
      toolbox_o file_info,
      char *buffer,
      int size,
      int *used);
extern int fileinfo_get_title (bits flags,
      toolbox_o file_info,
      char *buffer,
      int size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
