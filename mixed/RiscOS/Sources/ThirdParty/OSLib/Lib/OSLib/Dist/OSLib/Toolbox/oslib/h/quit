#ifndef quit_H
#define quit_H

/* C header file for Quit
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Quit_ClassSWI
#define Quit_ClassSWI                           0x82A90
#undef  XQuit_ClassSWI
#define XQuit_ClassSWI                          0xA2A90
#undef  Quit_PostFilter
#define Quit_PostFilter                         0x82A91
#undef  XQuit_PostFilter
#define XQuit_PostFilter                        0xA2A91
#undef  Quit_PreFilter
#define Quit_PreFilter                          0x82A92
#undef  XQuit_PreFilter
#define XQuit_PreFilter                         0xA2A92
#undef  Quit_GetWindowID
#define Quit_GetWindowID                        0x0
#undef  Quit_SetMessage
#define Quit_SetMessage                         0x1
#undef  Quit_GetMessage
#define Quit_GetMessage                         0x2
#undef  Quit_SetTitle
#define Quit_SetTitle                           0x3
#undef  Quit_GetTitle
#define Quit_GetTitle                           0x4

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct quit_object                      quit_object;
typedef struct quit_object_template             quit_object_template;
typedef struct quit_action_about_to_be_shown    quit_action_about_to_be_shown;
typedef struct quit_action_about_to_be_shown_block quit_action_about_to_be_shown_block;

/********************
 * Type definitions *
 ********************/
typedef bits quit_flags;

/* ------------------------------------------------------------------------
 * Type:          quit_object
 *
 * Description:   Structure to describe Object for in-memory construction - referenced from Toolbox_Template
 */

struct quit_object
   {  quit_flags flags;
      toolbox_msg_reference title;
      int title_limit;
      toolbox_msg_reference message;
      int message_limit;
      toolbox_string_reference alternative_window_name;
   };

struct quit_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      quit_flags objectflags;
      toolbox_msg_reference title;
      int title_limit;
      toolbox_msg_reference message;
      int message_limit;
      toolbox_string_reference alternative_window_name;
   };

typedef os_coord quit_full;

/* ------------------------------------------------------------------------
 * Type:          quit_action_about_to_be_shown
 *
 * Description:   Prefer Quit_ActionAboutToBeShownBlock
 */

struct quit_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         quit_full full;
      }
      position;
   };

struct quit_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         quit_full full;
      }
      position;
   };

typedef toolbox_action_header_base quit_action_quit_block;

typedef toolbox_action_header_base quit_action_dialogue_completed_block;

typedef toolbox_action_header_base quit_action_cancel_block;

/************************
 * Constant definitions *
 ************************/
#define class_QUIT                              ((toolbox_class) 0x82A90u)
#define quit_GENERATE_ABOUT_TO_BE_SHOWN         ((quit_flags) 0x1u)
#define quit_GENERATE_DIALOGUE_COMPLETED        ((quit_flags) 0x2u)
#define quit_FILE_TYPE_ICON                     ((toolbox_c) 0x82A900u)
#define quit_QUIT                               ((toolbox_c) 0x82A901u)
#define quit_CANCEL                             ((toolbox_c) 0x82A902u)
#define action_QUIT_ABOUT_TO_BE_SHOWN           0x82A90u
#define action_QUIT_QUIT                        0x82A91u
#define action_QUIT_DIALOGUE_COMPLETED          0x82A92u
#define action_QUIT_CANCEL                      0x82A93u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      quit_get_window_id()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                quit - value of R1 on entry
 *
 * Output:        window - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xquit_get_window_id (bits flags,
      toolbox_o quit,
      toolbox_o *window);
extern toolbox_o quit_get_window_id (bits flags,
      toolbox_o quit);

/* ------------------------------------------------------------------------
 * Function:      quit_set_message()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                quit - value of R1 on entry
 *                message - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x1.
 */

extern os_error *xquit_set_message (bits flags,
      toolbox_o quit,
      char const *message);
extern void quit_set_message (bits flags,
      toolbox_o quit,
      char const *message);

/* ------------------------------------------------------------------------
 * Function:      quit_get_message()
 *
 * Description:   Calls reason code 2 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                quit - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x2.
 */

extern os_error *xquit_get_message (bits flags,
      toolbox_o quit,
      char *buffer,
      int size,
      int *used);
extern int quit_get_message (bits flags,
      toolbox_o quit,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      quit_set_title()
 *
 * Description:   Calls reason code 3 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                quit - value of R1 on entry
 *                title - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x3.
 */

extern os_error *xquit_set_title (bits flags,
      toolbox_o quit,
      char const *title);
extern void quit_set_title (bits flags,
      toolbox_o quit,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      quit_get_title()
 *
 * Description:   Calls reason code 4 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                quit - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x4.
 */

extern os_error *xquit_get_title (bits flags,
      toolbox_o quit,
      char *buffer,
      int size,
      int *used);
extern int quit_get_title (bits flags,
      toolbox_o quit,
      char *buffer,
      int size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
