#ifndef saveas_H
#define saveas_H

/* C header file for SaveAs
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:38 2007
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
#undef  SaveAs_ClassSWI
#define SaveAs_ClassSWI                         0x82BC0
#undef  XSaveAs_ClassSWI
#define XSaveAs_ClassSWI                        0xA2BC0
#undef  SaveAs_PostFilter
#define SaveAs_PostFilter                       0x82BC1
#undef  XSaveAs_PostFilter
#define XSaveAs_PostFilter                      0xA2BC1
#undef  SaveAs_PreFilter
#define SaveAs_PreFilter                        0x82BC2
#undef  XSaveAs_PreFilter
#define XSaveAs_PreFilter                       0xA2BC2
#undef  SaveAs_GetWindowID
#define SaveAs_GetWindowID                      0x0
#undef  SaveAs_SetTitle
#define SaveAs_SetTitle                         0x1
#undef  SaveAs_GetTitle
#define SaveAs_GetTitle                         0x2
#undef  SaveAs_SetFileName
#define SaveAs_SetFileName                      0x3
#undef  SaveAs_GetFileName
#define SaveAs_GetFileName                      0x4
#undef  SaveAs_SetFileType
#define SaveAs_SetFileType                      0x5
#undef  SaveAs_GetFileType
#define SaveAs_GetFileType                      0x6
#undef  SaveAs_SetFileSize
#define SaveAs_SetFileSize                      0x7
#undef  SaveAs_GetFileSize
#define SaveAs_GetFileSize                      0x8
#undef  SaveAs_SelectionAvailable
#define SaveAs_SelectionAvailable               0x9
#undef  SaveAs_SetDataAddress
#define SaveAs_SetDataAddress                   0xA
#undef  SaveAs_BufferFilled
#define SaveAs_BufferFilled                     0xB
#undef  SaveAs_FileSaveCompleted
#define SaveAs_FileSaveCompleted                0xC

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct saveas_object                    saveas_object;
typedef struct saveas_object_template           saveas_object_template;
typedef struct saveas_action_about_to_be_shown  saveas_action_about_to_be_shown;
typedef struct saveas_action_save_to_file       saveas_action_save_to_file;
typedef struct saveas_action_fill_buffer        saveas_action_fill_buffer;
typedef struct saveas_action_save_completed     saveas_action_save_completed;
typedef struct saveas_action_about_to_be_shown_block saveas_action_about_to_be_shown_block;
typedef struct saveas_action_save_to_file_block saveas_action_save_to_file_block;
typedef struct saveas_action_fill_buffer_block  saveas_action_fill_buffer_block;
typedef struct saveas_action_save_completed_block saveas_action_save_completed_block;

/********************
 * Type definitions *
 ********************/
typedef bits saveas_flags;

/* ------------------------------------------------------------------------
 * Type:          saveas_object
 *
 * Description:   Structure to describe Object for in-memory construction - referenced from Toolbox_Template
 */

struct saveas_object
   {  saveas_flags flags;
      toolbox_msg_reference file_name;
      bits file_type;
      toolbox_msg_reference title;
      int title_limit;
      toolbox_string_reference alternative_window_name;
   };

struct saveas_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      saveas_flags objectflags;
      toolbox_msg_reference file_name;
      bits file_type;
      toolbox_msg_reference title;
      int title_limit;
      toolbox_string_reference alternative_window_name;
   };

typedef toolbox_full saveas_full;

/* ------------------------------------------------------------------------
 * Type:          saveas_action_about_to_be_shown
 *
 * Description:   Prefer SaveAs_ActionAboutToBeShownBlock
 */

struct saveas_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         saveas_full full;
      }
      position;
   };

/* ------------------------------------------------------------------------
 * Type:          saveas_action_save_to_file
 *
 * Description:   Prefer SaveAs_ActionSaveToFileBlock
 */

struct saveas_action_save_to_file
   {  char file_name [212];
   };

/* ------------------------------------------------------------------------
 * Type:          saveas_action_fill_buffer
 *
 * Description:   Prefer SaveAs_ActionFillBufferBlock
 */

struct saveas_action_fill_buffer
   {  int size;
      byte *buffer;
      int size_saved;
   };

/* ------------------------------------------------------------------------
 * Type:          saveas_action_save_completed
 *
 * Description:   Prefer SaveAs_ActionSaveCompletedBlock
 */

struct saveas_action_save_completed
   {  bits ref;
      char file_name [208];
   };

struct saveas_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         saveas_full full;
      }
      position;
   };

typedef toolbox_action_header_base saveas_action_dialogue_completed_block;

struct saveas_action_save_to_file_block
   {  toolbox_ACTION_HEADER_MEMBERS
      char file_name [212];
   };

struct saveas_action_fill_buffer_block
   {  toolbox_ACTION_HEADER_MEMBERS
      int buffer_size;
      byte *buffer;
      int size_saved;
   };

struct saveas_action_save_completed_block
   {  toolbox_ACTION_HEADER_MEMBERS
      bits ref;
      char file_name [208];
   };

/************************
 * Constant definitions *
 ************************/
#define class_SAVE_AS                           ((toolbox_class) 0x82BC0u)
#define saveas_GENERATE_ABOUT_TO_BE_SHOWN       ((saveas_flags) 0x1u)
#define saveas_GENERATE_DIALOGUE_COMPLETED      ((saveas_flags) 0x2u)
#define saveas_NO_SELECTION_BUTTON              ((saveas_flags) 0x4u)
#define saveas_GIVEN_DATA                       ((saveas_flags) 0x8u)
#define saveas_CLIENT_SUPPORTS_RAM_TRANSFER     ((saveas_flags) 0x10u)
#define saveas_SAVE_SUCCESSFUL                  0x1u
#define saveas_SAVE_SELECTION                   0x1u
#define saveas_SAVE_SAFE                        0x2u
#define saveas_FILE_ICON                        ((toolbox_c) 0x82BC000u)
#define saveas_FILE_NAME                        ((toolbox_c) 0x82BC001u)
#define saveas_CANCEL                           ((toolbox_c) 0x82BC002u)
#define saveas_SAVE                             ((toolbox_c) 0x82BC003u)
#define saveas_SELECTION                        ((toolbox_c) 0x82BC004u)
#define action_SAVE_AS_ABOUT_TO_BE_SHOWN        0x82BC0u
#define action_SAVE_AS_DIALOGUE_COMPLETED       0x82BC1u
#define action_SAVE_AS_SAVE_TO_FILE             0x82BC2u
#define action_SAVE_AS_FILL_BUFFER              0x82BC3u
#define action_SAVE_AS_SAVE_COMPLETED           0x82BC4u
#define error_SAVE_AS_TASKS_ACTIVE              0x80B600u
#define error_SAVE_AS_ALLOC_FAILED              0x80B601u
#define error_SAVE_AS_SHORT_BUFFER              0x80B602u
#define error_SAVE_AS_FILE_NAME_TOO_LONG        0x80B603u
#define error_SAVE_AS_NO_SUCH_TASK              0x80B611u
#define error_SAVE_AS_NO_SUCH_METHOD            0x80B612u
#define error_SAVE_AS_NO_SUCH_MISC_OP_METHOD    0x80B613u
#define error_SAVE_AS_NOT_TYPE1                 0x80B621u
#define error_SAVE_AS_NOT_TYPE3                 0x80B623u
#define error_SAVE_AS_BUFFER_EXCEEDED           0x80B631u
#define error_SAVE_AS_DATA_ADDRESS_UNSET        0x80B641u
#define error_SAVE_AS_NOT_FULL_PATH             0x80B642u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      saveas_get_window_id()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *
 * Output:        window - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xsaveas_get_window_id (bits flags,
      toolbox_o save_as,
      toolbox_o *window);
extern toolbox_o saveas_get_window_id (bits flags,
      toolbox_o save_as);

/* ------------------------------------------------------------------------
 * Function:      saveas_set_title()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *                title - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x1.
 */

extern os_error *xsaveas_set_title (bits flags,
      toolbox_o save_as,
      char const *title);
extern void saveas_set_title (bits flags,
      toolbox_o save_as,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      saveas_get_title()
 *
 * Description:   Calls reason code 2 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x2.
 */

extern os_error *xsaveas_get_title (bits flags,
      toolbox_o save_as,
      char *buffer,
      int size,
      int *used);
extern int saveas_get_title (bits flags,
      toolbox_o save_as,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      saveas_set_file_name()
 *
 * Description:   Calls reason code 3 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *                file_name - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x3.
 */

extern os_error *xsaveas_set_file_name (bits flags,
      toolbox_o save_as,
      char const *file_name);
extern void saveas_set_file_name (bits flags,
      toolbox_o save_as,
      char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      saveas_get_file_name()
 *
 * Description:   Calls reason code 4 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x4.
 */

extern os_error *xsaveas_get_file_name (bits flags,
      toolbox_o save_as,
      char *buffer,
      int size,
      int *used);
extern int saveas_get_file_name (bits flags,
      toolbox_o save_as,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      saveas_set_file_type()
 *
 * Description:   Calls reason code 5 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *                file_type - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x5.
 */

extern os_error *xsaveas_set_file_type (bits flags,
      toolbox_o save_as,
      bits file_type);
extern void saveas_set_file_type (bits flags,
      toolbox_o save_as,
      bits file_type);

/* ------------------------------------------------------------------------
 * Function:      saveas_get_file_type()
 *
 * Description:   Calls reason code 6 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *
 * Output:        file_type - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x6.
 */

extern os_error *xsaveas_get_file_type (bits flags,
      toolbox_o save_as,
      bits *file_type);
extern bits saveas_get_file_type (bits flags,
      toolbox_o save_as);

/* ------------------------------------------------------------------------
 * Function:      saveas_set_file_size()
 *
 * Description:   Calls reason code 7 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *                file_size - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x7.
 */

extern os_error *xsaveas_set_file_size (bits flags,
      toolbox_o save_as,
      int file_size);
extern void saveas_set_file_size (bits flags,
      toolbox_o save_as,
      int file_size);

/* ------------------------------------------------------------------------
 * Function:      saveas_get_file_size()
 *
 * Description:   Calls reason code 8 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *
 * Output:        file_size - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x8.
 */

extern os_error *xsaveas_get_file_size (bits flags,
      toolbox_o save_as,
      int *file_size);
extern int saveas_get_file_size (bits flags,
      toolbox_o save_as);

/* ------------------------------------------------------------------------
 * Function:      saveas_selection_available()
 *
 * Description:   Calls reason code 9 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *                selection_available - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x9.
 */

extern os_error *xsaveas_selection_available (bits flags,
      toolbox_o save_as,
      osbool selection_available);
extern void saveas_selection_available (bits flags,
      toolbox_o save_as,
      osbool selection_available);

/* ------------------------------------------------------------------------
 * Function:      saveas_set_data_address()
 *
 * Description:   Calls reason code 10 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *                data - value of R3 on entry
 *                size - value of R4 on entry
 *                selection - value of R5 on entry
 *                selection_size - value of R6 on entry
 *
 * Other notes:   Before entry, R2 = 0xA.
 */

extern os_error *xsaveas_set_data_address (bits flags,
      toolbox_o save_as,
      byte *data,
      int size,
      byte *selection,
      int selection_size);
extern void saveas_set_data_address (bits flags,
      toolbox_o save_as,
      byte *data,
      int size,
      byte *selection,
      int selection_size);

/* ------------------------------------------------------------------------
 * Function:      saveas_buffer_filled()
 *
 * Description:   Calls reason code 11 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0xB.
 */

extern os_error *xsaveas_buffer_filled (bits flags,
      toolbox_o save_as,
      byte *buffer,
      int size);
extern void saveas_buffer_filled (bits flags,
      toolbox_o save_as,
      byte *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      saveas_file_save_completed()
 *
 * Description:   Calls reason code 12 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                save_as - value of R1 on entry
 *                file_name - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0xC.
 */

extern os_error *xsaveas_file_save_completed (bits flags,
      toolbox_o save_as,
      char const *file_name);
extern void saveas_file_save_completed (bits flags,
      toolbox_o save_as,
      char const *file_name);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
