#ifndef zapfontmenu_H
#define zapfontmenu_H

/* C header file for ZapFontMenu
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Christian Ludlam, <chris@recoil.org>, 22-Apr-05
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
#undef  ZapFontMenu_ClassSWI
#define ZapFontMenu_ClassSWI                    0x100300
#undef  XZapFontMenu_ClassSWI
#define XZapFontMenu_ClassSWI                   0x120300
#undef  ZapFontMenu_PostFilter
#define ZapFontMenu_PostFilter                  0x100301
#undef  XZapFontMenu_PostFilter
#define XZapFontMenu_PostFilter                 0x120301
#undef  ZapFontMenu_PreFilter
#define ZapFontMenu_PreFilter                   0x100302
#undef  XZapFontMenu_PreFilter
#define XZapFontMenu_PreFilter                  0x120302
#undef  ZapFontMenu_SetFont
#define ZapFontMenu_SetFont                     0x0
#undef  ZapFontMenu_GetFont
#define ZapFontMenu_GetFont                     0x1
#undef  ZapFontMenu_SetSystemAvailable
#define ZapFontMenu_SetSystemAvailable          0x2
#undef  ZapFontMenu_GetSystemAvailable
#define ZapFontMenu_GetSystemAvailable          0x3

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct zapfontmenu_object               zapfontmenu_object;
typedef struct zapfontmenu_object_template      zapfontmenu_object_template;
typedef struct zapfontmenu_action_about_to_be_shown zapfontmenu_action_about_to_be_shown;
typedef struct zapfontmenu_action_about_to_be_shown_block zapfontmenu_action_about_to_be_shown_block;
typedef struct zapfontmenu_action_selection     zapfontmenu_action_selection;
typedef struct zapfontmenu_action_selection_block zapfontmenu_action_selection_block;

/********************
 * Type definitions *
 ********************/
typedef bits zapfontmenu_flags;

/* ------------------------------------------------------------------------
 * Type:          zapfontmenu_object
 *
 * Description:   Structure to describe Object for in-memory construction - referenced from Toolbox_Template
 */

struct zapfontmenu_object
   {  zapfontmenu_flags flags;
      toolbox_string_reference ticked_font;
   };

struct zapfontmenu_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      zapfontmenu_flags objectflags;
      toolbox_string_reference ticked_font;
   };

typedef os_coord zapfontmenu_full;

/* ------------------------------------------------------------------------
 * Type:          zapfontmenu_action_about_to_be_shown
 *
 * Description:   Prefer ZapFontMenu_ActionAboutToBeShownBlock
 */

struct zapfontmenu_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         zapfontmenu_full full;
      }
      position;
   };

struct zapfontmenu_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         zapfontmenu_full full;
      }
      position;
   };

typedef toolbox_action_header_base zapfontmenu_action_has_been_hidden_block;

typedef toolbox_action_header_base zapfontmenu_action_dialogue_completed_block;
      /*Prefer ZapFontMenu_ActionHasBeenHiddenBlock*/

/* ------------------------------------------------------------------------
 * Type:          zapfontmenu_action_selection
 *
 * Description:   Prefer ZapFontMenu_ActionSelectionBlock
 */

struct zapfontmenu_action_selection
   {  char identifier [212];
   };

struct zapfontmenu_action_selection_block
   {  toolbox_ACTION_HEADER_MEMBERS
      char identifier [212];
   };

/************************
 * Constant definitions *
 ************************/
#define class_ZAP_FONT_MENU                     ((toolbox_class) 0x100300u)
#define zapfontmenu_GENERATE_ABOUT_TO_BE_SHOWN  ((zapfontmenu_flags) 0x1u)
#define zapfontmenu_GENERATE_HAS_BEEN_HIDDEN    ((zapfontmenu_flags) 0x2u)
#define zapfontmenu_INCLUDE_SYSTEM_FONT         ((zapfontmenu_flags) 0x4u)
#define zapfontmenu_ENCODING_MENU               ((zapfontmenu_flags) 0x8u)
#define zapfontmenu_ENCODING_SELECTION          0x1u
#define action_ZAP_FONT_MENU_ABOUT_TO_BE_SHOWN  0x100300u
#define action_ZAP_FONT_MENU_HAS_BEEN_HIDDEN    0x100301u
#define action_ZAP_FONT_MENU_SELECTION          0x100302u
#define error_ZAP_FONT_MENU_TASKS_ACTIVE        0x81D440u
#define error_ZAP_FONT_MENU_ALLOC_FAILED        0x81D441u
#define error_ZAP_FONT_MENU_SHORT_BUFFER        0x81D442u
#define error_ZAP_FONT_MENU_NO_SUCH_TASK        0x81D443u
#define error_ZAP_FONT_MENU_NO_SUCH_METHOD      0x81D444u
#define error_ZAP_FONT_MENU_NO_SUCH_MISC_OP_METHOD 0x81D445u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      zapfontmenu_set_font()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_menu - value of R1 on entry
 *                font_identifier - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xzapfontmenu_set_font (bits flags,
      toolbox_o font_menu,
      char const *font_identifier);
extern void zapfontmenu_set_font (bits flags,
      toolbox_o font_menu,
      char const *font_identifier);

/* ------------------------------------------------------------------------
 * Function:      zapfontmenu_get_font()
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

extern os_error *xzapfontmenu_get_font (bits flags,
      toolbox_o font_menu,
      char *buffer,
      int size,
      int *used);
extern int zapfontmenu_get_font (bits flags,
      toolbox_o font_menu,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      zapfontmenu_set_system_available()
 *
 * Description:   Calls reason code 2 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_menu - value of R1 on entry
 *                available - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x2.
 */

extern os_error *xzapfontmenu_set_system_available (bits flags,
      toolbox_o font_menu,
      osbool available);
extern void zapfontmenu_set_system_available (bits flags,
      toolbox_o font_menu,
      osbool available);

/* ------------------------------------------------------------------------
 * Function:      zapfontmenu_get_system_available()
 *
 * Description:   Calls reason code 3 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_menu - value of R1 on entry
 *
 * Output:        available - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x3.
 */

extern os_error *xzapfontmenu_get_system_available (bits flags,
      toolbox_o font_menu,
      osbool *available);
extern osbool zapfontmenu_get_system_available (bits flags,
      toolbox_o font_menu);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
