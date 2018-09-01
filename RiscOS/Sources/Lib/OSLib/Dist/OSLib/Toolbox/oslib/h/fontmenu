#ifndef fontmenu_H
#define fontmenu_H

/* C header file for FontMenu
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

#ifndef menu_H
#include "oslib/menu.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  FontMenu_ClassSWI
#define FontMenu_ClassSWI                       0x82A40
#undef  XFontMenu_ClassSWI
#define XFontMenu_ClassSWI                      0xA2A40
#undef  FontMenu_PostFilter
#define FontMenu_PostFilter                     0x82A41
#undef  XFontMenu_PostFilter
#define XFontMenu_PostFilter                    0xA2A41
#undef  FontMenu_PreFilter
#define FontMenu_PreFilter                      0x82A42
#undef  XFontMenu_PreFilter
#define XFontMenu_PreFilter                     0xA2A42
#undef  FontMenu_SetFont
#define FontMenu_SetFont                        0x0
#undef  FontMenu_GetFont
#define FontMenu_GetFont                        0x1

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct fontmenu_object                  fontmenu_object;
typedef struct fontmenu_object_template         fontmenu_object_template;
typedef struct fontmenu_action_about_to_be_shown fontmenu_action_about_to_be_shown;
typedef struct fontmenu_action_about_to_be_shown_block fontmenu_action_about_to_be_shown_block;
typedef struct fontmenu_action_selection        fontmenu_action_selection;
typedef struct fontmenu_action_selection_block  fontmenu_action_selection_block;

/********************
 * Type definitions *
 ********************/
typedef bits fontmenu_flags;

/* ------------------------------------------------------------------------
 * Type:          fontmenu_object
 *
 * Description:   Structure to describe Object for in-memory construction - referenced from Toolbox_Template
 */

struct fontmenu_object
   {  fontmenu_flags flags;
      toolbox_string_reference ticked_font;
   };

struct fontmenu_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      fontmenu_flags objectflags;
      toolbox_string_reference ticked_font;
   };

typedef os_coord fontmenu_full;

/* ------------------------------------------------------------------------
 * Type:          fontmenu_action_about_to_be_shown
 *
 * Description:   Prefer FontMenu_ActionAboutToBeShownBlock
 */

struct fontmenu_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         fontmenu_full full;
      }
      position;
   };

struct fontmenu_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         fontmenu_full full;
      }
      position;
   };

typedef toolbox_action_header_base fontmenu_action_has_been_hidden_block;

typedef toolbox_action_header_base fontmenu_action_dialogue_completed_block;
      /*Prefer FontMenu_ActionHasBeenHiddenBlock*/

/* ------------------------------------------------------------------------
 * Type:          fontmenu_action_selection
 *
 * Description:   Prefer FontMenu_ActionSelectionBlock
 */

struct fontmenu_action_selection
   {  char font_identifier [212];
   };

struct fontmenu_action_selection_block
   {  toolbox_ACTION_HEADER_MEMBERS
      char font_identifier [212];
   };

/************************
 * Constant definitions *
 ************************/
#define class_FONT_MENU                         ((toolbox_class) 0x82A40u)
#define fontmenu_GENERATE_ABOUT_TO_BE_SHOWN     ((fontmenu_flags) 0x1u)
#define fontmenu_GENERATE_DIALOGUE_COMPLETED    ((fontmenu_flags) 0x2u)
#define fontmenu_GENERATE_HAS_BEEN_HIDDEN       ((fontmenu_flags) 0x2u)
#define fontmenu_INCLUDE_SYSTEM_FONT            ((fontmenu_flags) 0x4u)
#define action_FONT_MENU_ABOUT_TO_BE_SHOWN      0x82A40u
#define action_FONT_MENU_DIALOGUE_COMPLETED     0x82A41u
#define action_FONT_MENU_HAS_BEEN_HIDDEN        0x82A41u
#define action_FONT_MENU_SELECTION              0x82A42u
#define error_FONT_MENU_TASKS_ACTIVE            0x80B000u
#define error_FONT_MENU_ALLOC_FAILED            0x80B001u
#define error_FONT_MENU_SHORT_BUFFER            0x80B002u
#define error_FONT_MENU_NO_SUCH_TASK            0x80B011u
#define error_FONT_MENU_NO_SUCH_METHOD          0x80B012u
#define error_FONT_MENU_NO_SUCH_MISC_OP_METHOD  0x80B013u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      fontmenu_set_font()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_menu - value of R1 on entry
 *                font_identifier - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xfontmenu_set_font (bits flags,
      toolbox_o font_menu,
      char const *font_identifier);
extern void fontmenu_set_font (bits flags,
      toolbox_o font_menu,
      char const *font_identifier);

/* ------------------------------------------------------------------------
 * Function:      fontmenu_get_font()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_menu - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x1.
 */

extern os_error *xfontmenu_get_font (bits flags,
      toolbox_o font_menu,
      char *buffer,
      int size,
      int *used);
extern int fontmenu_get_font (bits flags,
      toolbox_o font_menu,
      char *buffer,
      int size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
