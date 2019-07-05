#ifndef iconbar_H
#define iconbar_H

/* C header file for Iconbar
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
#undef  Iconbar_ClassSWI
#define Iconbar_ClassSWI                        0x82900
#undef  XIconbar_ClassSWI
#define XIconbar_ClassSWI                       0xA2900
#undef  Iconbar_PostFilter
#define Iconbar_PostFilter                      0x82901
#undef  XIconbar_PostFilter
#define XIconbar_PostFilter                     0xA2901
#undef  Iconbar_PreFilter
#define Iconbar_PreFilter                       0x82902
#undef  XIconbar_PreFilter
#define XIconbar_PreFilter                      0xA2902
#undef  Iconbar_GetIconHandle
#define Iconbar_GetIconHandle                   0x0
#undef  Iconbar_SetMenu
#define Iconbar_SetMenu                         0x1
#undef  Iconbar_GetMenu
#define Iconbar_GetMenu                         0x2
#undef  Iconbar_SetAction
#define Iconbar_SetAction                       0x3
#undef  Iconbar_GetAction
#define Iconbar_GetAction                       0x4
#undef  Iconbar_SetShow
#define Iconbar_SetShow                         0x5
#undef  Iconbar_GetShow
#define Iconbar_GetShow                         0x6
#undef  Iconbar_SetHelpMessage
#define Iconbar_SetHelpMessage                  0x7
#undef  Iconbar_GetHelpMessage
#define Iconbar_GetHelpMessage                  0x8
#undef  Iconbar_SetText
#define Iconbar_SetText                         0x9
#undef  Iconbar_GetText
#define Iconbar_GetText                         0xA
#undef  Iconbar_SetSprite
#define Iconbar_SetSprite                       0xB
#undef  Iconbar_GetSprite
#define Iconbar_GetSprite                       0xC

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct iconbar_object                   iconbar_object;
typedef struct iconbar_object_template          iconbar_object_template;
typedef struct iconbar_action_about_to_be_shown iconbar_action_about_to_be_shown;
typedef struct iconbar_action_select_about_to_be_shown iconbar_action_select_about_to_be_shown;
typedef struct iconbar_action_adjust_about_to_be_shown iconbar_action_adjust_about_to_be_shown;
typedef struct iconbar_action_select_about_to_be_shown_block iconbar_action_select_about_to_be_shown_block;
typedef struct iconbar_action_adjust_about_to_be_shown_block iconbar_action_adjust_about_to_be_shown_block;

/********************
 * Type definitions *
 ********************/
typedef bits iconbar_flags;

/* ------------------------------------------------------------------------
 * Type:          iconbar_object
 *
 * Description:   Structure to describe Object for in-memory construction - referenced from Toolbox_Template
 */

struct iconbar_object
   {  iconbar_flags flags;
      int position;
      int priority;
      toolbox_string_reference sprite_name;
      int sprite_limit;
      toolbox_msg_reference text;
      int text_limit;
      toolbox_string_reference menu;
      bits select_action;
      bits adjust_action;
      toolbox_string_reference select_show;
      toolbox_string_reference adjust_show;
      toolbox_msg_reference help_message;
      int help_limit;
   };

struct iconbar_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      iconbar_flags objectflags;
      int position;
      int priority;
      toolbox_string_reference sprite_name;
      int sprite_limit;
      toolbox_msg_reference text;
      int text_limit;
      toolbox_string_reference menu;
      bits select_action;
      bits adjust_action;
      toolbox_string_reference select_show;
      toolbox_string_reference adjust_show;
      toolbox_msg_reference help_message;
      int help_limit;
   };

typedef toolbox_full iconbar_full;

typedef toolbox_action_header_base iconbar_action_clicked_block;

/* ------------------------------------------------------------------------
 * Type:          iconbar_action_about_to_be_shown
 *
 * Description:   Prefer Iconbar_ActionSelectAboutToBeShownBlock; Iconbar_ActionAdjustAboutToBeShownBlock
 */

struct iconbar_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         iconbar_full full;
      }
      position;
   };

struct iconbar_action_select_about_to_be_shown
   {  toolbox_o o;
   };

struct iconbar_action_adjust_about_to_be_shown
   {  toolbox_o o;
   };

struct iconbar_action_select_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_o o;
   };

struct iconbar_action_adjust_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_o o;
   };

typedef bits iconbar_set_button;

/************************
 * Constant definitions *
 ************************/
#define class_ICONBAR                           ((toolbox_class) 0x82900u)
#define error_ICONBAR_ALLOC_FAILED              0x80AB01u
#define error_ICONBAR_SHORT_BUFFER              0x80AB02u
#define error_ICONBAR_BAD_OBJECT_VERSION        0x80AB03u
#define error_ICONBAR_BAD_FLAGS                 0x80AB04u
#define error_ICONBAR_NO_SUCH_TASK              0x80AB11u
#define error_ICONBAR_NO_SUCH_METHOD            0x80AB12u
#define error_ICONBAR_NO_SUCH_MISC_OP_METHOD    0x80AB13u
#define error_ICONBAR_WRONG_SHOW_TYPE           0x80AB14u
#define error_ICONBAR_NO_TEXT                   0x80AB20u
#define error_ICONBAR_TASKS_ACTIVE              0x80AB21u
#define iconbar_GENERATE_SELECT_ABOUT_TO_BE_SHOWN ((iconbar_flags) 0x1u)
#define iconbar_GENERATE_ADJUST_ABOUT_TO_BE_SHOWN ((iconbar_flags) 0x2u)
#define iconbar_SELECT_IS_MENU                  ((iconbar_flags) 0x4u)
#define iconbar_ADJUST_IS_MENU                  ((iconbar_flags) 0x8u)
#define iconbar_HAS_TEXT                        ((iconbar_flags) 0x10u)
      /*Reserved bit - not settable by client*/
#define iconbar_GENERATE_SELECT_CLICKED         ((iconbar_flags) 0x20u)
#define iconbar_GENERATE_ADJUST_CLICKED         ((iconbar_flags) 0x40u)
#define iconbar_SHOW_SELECT_CENTERED            ((iconbar_flags) 0x80u)
#define iconbar_SHOW_ADJUST_CENTERED            ((iconbar_flags) 0x100u)
#define iconbar_SHOW_SELECT_AT_POINTER          ((iconbar_flags) 0x200u)
#define iconbar_SHOW_ADJUST_AT_POINTER          ((iconbar_flags) 0x400u)
#define action_ICONBAR_CLICKED                  0x82900u
#define action_ICONBAR_SELECT_ABOUT_TO_BE_SHOWN 0x82901u
#define action_ICONBAR_ADJUST_ABOUT_TO_BE_SHOWN 0x82902u
#define iconbar_SELECT                          ((iconbar_set_button) 0x1u)
#define iconbar_ADJUST                          ((iconbar_set_button) 0x2u)
#define iconbar_CLICKED_ADJUST                  0x1u
#define iconbar_CLICKED_SELECT                  0x4u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      iconbar_get_icon_handle()
 *
 * Description:   Gets the icon handle for the iconbar object
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *
 * Output:        i - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x0.
 */

extern os_error *xiconbar_get_icon_handle (bits flags,
      toolbox_o iconbar,
      wimp_i *i);
extern wimp_i iconbar_get_icon_handle (bits flags,
      toolbox_o iconbar);

/* ------------------------------------------------------------------------
 * Function:      iconbar_set_menu()
 *
 * Description:   Sets the menu which will be displayed when MENU is
 *                clicked over iconbar object
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *                menu - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x1.
 */

extern os_error *xiconbar_set_menu (bits flags,
      toolbox_o iconbar,
      toolbox_o menu);
extern void iconbar_set_menu (bits flags,
      toolbox_o iconbar,
      toolbox_o menu);

/* ------------------------------------------------------------------------
 * Function:      iconbar_get_menu()
 *
 * Description:   Gets the menu which will be displayed when MENU is
 *                clicked over iconbar
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *
 * Output:        menu - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x2.
 */

extern os_error *xiconbar_get_menu (bits flags,
      toolbox_o iconbar,
      toolbox_o *menu);
extern toolbox_o iconbar_get_menu (bits flags,
      toolbox_o iconbar);

/* ------------------------------------------------------------------------
 * Function:      iconbar_set_action()
 *
 * Description:   Sets actions that will be raised when SELECT/ADJUST are
 *                clicked on iconbar
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *                select_action - value of R3 on entry
 *                adjust_action - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x3.
 */

extern os_error *xiconbar_set_action (iconbar_set_button flags,
      toolbox_o iconbar,
      bits select_action,
      bits adjust_action);
extern void iconbar_set_action (iconbar_set_button flags,
      toolbox_o iconbar,
      bits select_action,
      bits adjust_action);

/* ------------------------------------------------------------------------
 * Function:      iconbar_get_action()
 *
 * Description:   Calls reason code 4 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *
 * Output:        select_action - value of R0 on exit
 *                adjust_action - value of R1 on exit
 *
 * Other notes:   Before entry, R2 = 0x4.
 */

extern os_error *xiconbar_get_action (bits flags,
      toolbox_o iconbar,
      int *select_action,
      int *adjust_action);
extern void iconbar_get_action (bits flags,
      toolbox_o iconbar,
      int *select_action,
      int *adjust_action);

/* ------------------------------------------------------------------------
 * Function:      iconbar_set_show()
 *
 * Description:   Sets objects to be shown which SELECT/ADJUST are clicked
 *                on iconbar
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *                select - value of R3 on entry
 *                adjust - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x5.
 */

extern os_error *xiconbar_set_show (iconbar_set_button flags,
      toolbox_o iconbar,
      toolbox_o select,
      toolbox_o adjust);
extern void iconbar_set_show (iconbar_set_button flags,
      toolbox_o iconbar,
      toolbox_o select,
      toolbox_o adjust);

/* ------------------------------------------------------------------------
 * Function:      iconbar_get_show()
 *
 * Description:   Gets the objects that will be shown when SELECT/ADJUST
 *                are clicked on iconbar
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *
 * Output:        select - value of R0 on exit
 *                adjust - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x6.
 */

extern os_error *xiconbar_get_show (bits flags,
      toolbox_o iconbar,
      toolbox_o *select,
      toolbox_o *adjust);
extern void iconbar_get_show (bits flags,
      toolbox_o iconbar,
      toolbox_o *select,
      toolbox_o *adjust);

/* ------------------------------------------------------------------------
 * Function:      iconbar_set_help_message()
 *
 * Description:   Sets the iconbar objects interactive help message
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *                help_message - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x7.
 */

extern os_error *xiconbar_set_help_message (bits flags,
      toolbox_o iconbar,
      char const *help_message);
extern void iconbar_set_help_message (bits flags,
      toolbox_o iconbar,
      char const *help_message);

/* ------------------------------------------------------------------------
 * Function:      iconbar_get_help_message()
 *
 * Description:   Gets the iconbar objects interactive help message
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x8.
 */

extern os_error *xiconbar_get_help_message (bits flags,
      toolbox_o iconbar,
      char *buffer,
      int size,
      int *used);
extern int iconbar_get_help_message (bits flags,
      toolbox_o iconbar,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      iconbar_set_text()
 *
 * Description:   Sets the text string that will be used for text & sprite
 *                iconbar objects
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *                text - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x9.
 */

extern os_error *xiconbar_set_text (bits flags,
      toolbox_o iconbar,
      char const *text);
extern void iconbar_set_text (bits flags,
      toolbox_o iconbar,
      char const *text);

/* ------------------------------------------------------------------------
 * Function:      iconbar_get_text()
 *
 * Description:   Gets the text string that will be used for text & sprite
 *                iconbar objects
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0xA.
 */

extern os_error *xiconbar_get_text (bits flags,
      toolbox_o iconbar,
      char *buffer,
      int size,
      int *used);
extern int iconbar_get_text (bits flags,
      toolbox_o iconbar,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      iconbar_set_sprite()
 *
 * Description:   Sets the sprite to be used for the iconbar object
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *                sprite_name - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0xB.
 */

extern os_error *xiconbar_set_sprite (bits flags,
      toolbox_o iconbar,
      char const *sprite_name);
extern void iconbar_set_sprite (bits flags,
      toolbox_o iconbar,
      char const *sprite_name);

/* ------------------------------------------------------------------------
 * Function:      iconbar_get_sprite()
 *
 * Description:   Gets the sprite that is used for the iconbar object
 *
 * Input:         flags - value of R0 on entry
 *                iconbar - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0xC.
 */

extern os_error *xiconbar_get_sprite (bits flags,
      toolbox_o iconbar,
      char *buffer,
      int size,
      int *used);
extern int iconbar_get_sprite (bits flags,
      toolbox_o iconbar,
      char *buffer,
      int size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
