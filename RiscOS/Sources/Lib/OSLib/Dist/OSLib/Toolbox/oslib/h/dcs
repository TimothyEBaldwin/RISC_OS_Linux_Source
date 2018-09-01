#ifndef dcs_H
#define dcs_H

/* C header file for DCS
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
#undef  DCS_ClassSWI
#define DCS_ClassSWI                            0x82A80
#undef  XDCS_ClassSWI
#define XDCS_ClassSWI                           0xA2A80
#undef  DCS_PostFilter
#define DCS_PostFilter                          0x82A81
#undef  XDCS_PostFilter
#define XDCS_PostFilter                         0xA2A81
#undef  DCS_PreFilter
#define DCS_PreFilter                           0x82A82
#undef  XDCS_PreFilter
#define XDCS_PreFilter                          0xA2A82
#undef  DCS_GetWindowId
#define DCS_GetWindowId                         0x0
#undef  DCS_SetMessage
#define DCS_SetMessage                          0x1
#undef  DCS_GetMessage
#define DCS_GetMessage                          0x2
#undef  DCS_SetTitle
#define DCS_SetTitle                            0x3
#undef  DCS_GetTitle
#define DCS_GetTitle                            0x4

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct dcs_object                       dcs_object;
typedef struct dcs_object_template              dcs_object_template;
typedef struct dcs_action_about_to_be_shown     dcs_action_about_to_be_shown;
typedef struct dcs_action_about_to_be_shown_block dcs_action_about_to_be_shown_block;

/********************
 * Type definitions *
 ********************/
typedef bits dcs_flags;

/* ------------------------------------------------------------------------
 * Type:          dcs_object
 *
 * Description:   Structure to describe Object for in-memory construction - to be referenced from Toolbox_Template
 */

struct dcs_object
   {  dcs_flags flags;
      toolbox_msg_reference title;
      int title_limit;
      toolbox_msg_reference message;
      int message_limit;
      toolbox_string_reference alternative_window_name;
   };

struct dcs_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      dcs_flags objectflags;
      toolbox_msg_reference title;
      int title_limit;
      toolbox_msg_reference message;
      int message_limit;
      toolbox_string_reference alternative_window_name;
   };

typedef toolbox_full dcs_full;

/* ------------------------------------------------------------------------
 * Type:          dcs_action_about_to_be_shown
 *
 * Description:   Prefer DCS_ActionAboutToBeShownBlock
 */

struct dcs_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         dcs_full full;
      }
      position;
   };

struct dcs_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         dcs_full full;
      }
      position;
   };

typedef toolbox_action_header_base dcs_action_discard_block;

typedef toolbox_action_header_base dcs_action_save_block;

typedef toolbox_action_header_base dcs_action_dialogue_completed_block;

typedef toolbox_action_header_base dcs_action_cancel_block;

/************************
 * Constant definitions *
 ************************/
#define class_DCS                               ((toolbox_class) 0x82A80u)
#define dcs_GENERATE_ABOUT_TO_BE_SHOWN          ((dcs_flags) 0x1u)
#define dcs_GENERATE_DIALOGUE_COMPLETED         ((dcs_flags) 0x2u)
#define action_DCS_ABOUT_TO_BE_SHOWN            0x82A80u
#define action_DCS_DISCARD                      0x82A81u
#define action_DCS_SAVE                         0x82A82u
#define action_DCS_DIALOGUE_COMPLETED           0x82A83u
#define action_DCS_CANCEL                       0x82A84u
#define error_DCS_ALLOC_FAILED                  0x80B101u
#define error_DCS_TASKS_ACTIVE                  0x80B102u
#define dcs_FILE_ICON                           ((toolbox_c) 0x82A800u)
#define dcs_DISCARD                             ((toolbox_c) 0x82A801u)
#define dcs_CANCEL                              ((toolbox_c) 0x82A802u)
#define dcs_SAVE                                ((toolbox_c) 0x82A803u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      dcs_get_window_id()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                dcs - value of R1 on entry
 *
 * Output:        window - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xdcs_get_window_id (bits flags,
      toolbox_o dcs,
      toolbox_o *window);
extern toolbox_o dcs_get_window_id (bits flags,
      toolbox_o dcs);

/* ------------------------------------------------------------------------
 * Function:      dcs_set_message()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                dcs - value of R1 on entry
 *                message - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x1.
 */

extern os_error *xdcs_set_message (bits flags,
      toolbox_o dcs,
      char const *message);
extern void dcs_set_message (bits flags,
      toolbox_o dcs,
      char const *message);

/* ------------------------------------------------------------------------
 * Function:      dcs_get_message()
 *
 * Description:   Calls reason code 2 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                dcs - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x2.
 */

extern os_error *xdcs_get_message (bits flags,
      toolbox_o dcs,
      char *buffer,
      int size,
      int *used);
extern int dcs_get_message (bits flags,
      toolbox_o dcs,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      dcs_set_title()
 *
 * Description:   Calls reason code 3 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                dcs - value of R1 on entry
 *                title - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x3.
 */

extern os_error *xdcs_set_title (bits flags,
      toolbox_o dcs,
      char const *title);
extern void dcs_set_title (bits flags,
      toolbox_o dcs,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      dcs_get_title()
 *
 * Description:   Calls reason code 4 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                dcs - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x4.
 */

extern os_error *xdcs_get_title (bits flags,
      toolbox_o dcs,
      char *buffer,
      int size,
      int *used);
extern int dcs_get_title (bits flags,
      toolbox_o dcs,
      char *buffer,
      int size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
