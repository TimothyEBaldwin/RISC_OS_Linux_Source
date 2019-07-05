#ifndef menu_H
#define menu_H

/* C header file for Menu
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
#undef  Menu_ClassSWI
#define Menu_ClassSWI                           0x828C0
#undef  XMenu_ClassSWI
#define XMenu_ClassSWI                          0xA28C0
#undef  Menu_PostFilter
#define Menu_PostFilter                         0x828C1
#undef  XMenu_PostFilter
#define XMenu_PostFilter                        0xA28C1
#undef  Menu_PreFilter
#define Menu_PreFilter                          0x828C2
#undef  XMenu_PreFilter
#define XMenu_PreFilter                         0xA28C2
#undef  Menu_UpdateTree
#define Menu_UpdateTree                         0x828C3
#undef  XMenu_UpdateTree
#define XMenu_UpdateTree                        0xA28C3
#undef  Menu_SetTick
#define Menu_SetTick                            0x0
#undef  Menu_GetTick
#define Menu_GetTick                            0x1
#undef  Menu_SetFade
#define Menu_SetFade                            0x2
#undef  Menu_GetFade
#define Menu_GetFade                            0x3
#undef  Menu_SetEntryText
#define Menu_SetEntryText                       0x4
#undef  Menu_GetEntryText
#define Menu_GetEntryText                       0x5
#undef  Menu_SetEntrySprite
#define Menu_SetEntrySprite                     0x6
#undef  Menu_GetEntrySprite
#define Menu_GetEntrySprite                     0x7
#undef  Menu_SetSubMenuShow
#define Menu_SetSubMenuShow                     0x8
#undef  Menu_GetSubMenuShow
#define Menu_GetSubMenuShow                     0x9
#undef  Menu_SetSubMenuAction
#define Menu_SetSubMenuAction                   0xA
#undef  Menu_GetSubMenuAction
#define Menu_GetSubMenuAction                   0xB
#undef  Menu_SetClickShow
#define Menu_SetClickShow                       0xC
#undef  Menu_GetClickShow
#define Menu_GetClickShow                       0xD
#undef  Menu_SetClickAction
#define Menu_SetClickAction                     0xE
#undef  Menu_GetClickAction
#define Menu_GetClickAction                     0xF
#undef  Menu_SetHelpMessage
#define Menu_SetHelpMessage                     0x10
#undef  Menu_GetHelpMessage
#define Menu_GetHelpMessage                     0x11
#undef  Menu_SetEntryHelpMessage
#define Menu_SetEntryHelpMessage                0x12
#undef  Menu_GetEntryHelpMessage
#define Menu_GetEntryHelpMessage                0x13
#undef  Menu_AddEntry
#define Menu_AddEntry                           0x14
#undef  Menu_RemoveEntry
#define Menu_RemoveEntry                        0x15
#undef  Menu_GetHeight
#define Menu_GetHeight                          0x16
#undef  Menu_GetWidth
#define Menu_GetWidth                           0x17
#undef  Menu_SetTitle
#define Menu_SetTitle                           0x18
#undef  Menu_GetTitle
#define Menu_GetTitle                           0x19

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct menu_entry_object                menu_entry_object;
typedef struct menu_object                      menu_object;
typedef struct menu_object_base                 menu_object_base;
typedef struct menu_object_template             menu_object_template;
typedef struct menu_object_template_base        menu_object_template_base;
typedef struct menu_action_about_to_be_shown_block menu_action_about_to_be_shown_block;
typedef struct menu_action_about_to_be_shown    menu_action_about_to_be_shown;
typedef struct menu_action_sub_menu             menu_action_sub_menu;
typedef struct menu_action_sub_menu_block       menu_action_sub_menu_block;

/********************
 * Type definitions *
 ********************/
typedef bits menu_flags;

typedef bits menu_entry_flags;

struct menu_entry_object
   {  menu_entry_flags flags;
      toolbox_c cmp;
      toolbox_msg_reference text;
      int text_limit;
      toolbox_string_reference click_object_name;
      toolbox_string_reference sub_menu_object_name;
      bits sub_menu_action;
      bits click_action;
      toolbox_msg_reference help;
      int help_limit;
   };

/* ------------------------------------------------------------------------
 * Type:          menu_object
 *
 * Description:   Structure to describe Object for in-memory construction - referenced from Toolbox_Template
 */

#define menu_OBJECT_MEMBERS \
   menu_flags flags; \
   toolbox_msg_reference title; \
   int title_limit; \
   toolbox_msg_reference help; \
   int help_limit; \
   bits show_action; \
   bits hide_action; \
   int entry_count;

/* Base menu_object structure without variable part */
struct menu_object_base
   {  menu_OBJECT_MEMBERS
   };

/* legacy structure */
struct menu_object
   {  menu_OBJECT_MEMBERS
      menu_entry_object entries [UNKNOWN];
   };

#define menu_OBJECT(N) \
   struct \
      {  menu_OBJECT_MEMBERS \
         menu_entry_object entries [N]; \
      }

#define menu_SIZEOF_OBJECT(N) \
   (offsetof (menu_object, entries) + \
         (N)*sizeof ((menu_object *) NULL)->entries)

#define menu_OBJECT_TEMPLATE_MEMBERS \
   toolbox_RESOURCE_FILE_OBJECT_MEMBERS \
   menu_flags objectflags; \
   toolbox_msg_reference title; \
   int title_limit; \
   toolbox_msg_reference help; \
   int help_limit; \
   bits show_action; \
   bits hide_action; \
   int entry_count;

/* Base menu_object_template structure without variable part */
struct menu_object_template_base
   {  menu_OBJECT_TEMPLATE_MEMBERS
   };

/* legacy structure */
struct menu_object_template
   {  menu_OBJECT_TEMPLATE_MEMBERS
      menu_entry_object entries [UNKNOWN];
   };

#define menu_OBJECT_TEMPLATE(N) \
   struct \
      {  menu_OBJECT_TEMPLATE_MEMBERS \
         menu_entry_object entries [N]; \
      }

#define menu_SIZEOF_OBJECT_TEMPLATE(N) \
   (offsetof (menu_object_template, entries) + \
         (N)*sizeof ((menu_object_template *) NULL)->entries)

typedef os_coord menu_full;

struct menu_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         menu_full full;
      }
      position;
   };

/* ------------------------------------------------------------------------
 * Type:          menu_action_about_to_be_shown
 *
 * Description:   Prefer Menu_ActionAboutToBeShownBlock
 */

struct menu_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         menu_full full;
      }
      position;
   };

typedef toolbox_action_header_base menu_action_has_been_hidden_block;
      /*Prefer Menu_ActionDialogueCompletedBlock*/

typedef toolbox_action_header_base menu_action_dialogue_completed_block;

/* ------------------------------------------------------------------------
 * Type:          menu_action_sub_menu
 *
 * Description:   Prefer Menu_ActionSubMenuBlock
 */

struct menu_action_sub_menu
   {  os_coord pos;
   };

struct menu_action_sub_menu_block
   {  toolbox_ACTION_HEADER_MEMBERS
      os_coord pos;
   };

typedef toolbox_action_header_base menu_action_selection_block;

typedef bits menu_show_flags;

typedef bits menu_add_flags;

typedef toolbox_c menu_add_at;

/************************
 * Constant definitions *
 ************************/
#define class_MENU                              ((toolbox_class) 0x828C0u)
#define menu_GENERATE_ABOUT_TO_BE_SHOWN         ((menu_flags) 0x1u)
#define menu_GENERATE_DIALOGUE_COMPLETED        ((menu_flags) 0x2u)
#define menu_GENERATE_HAS_BEEN_HIDDEN           ((menu_flags) 0x2u)
#define menu_ENTRY_TICKED                       ((menu_entry_flags) 0x1u)
#define menu_ENTRY_SEPARATE                     ((menu_entry_flags) 0x2u)
#define menu_ENTRY_FADED                        ((menu_entry_flags) 0x100u)
#define menu_ENTRY_IS_SPRITE                    ((menu_entry_flags) 0x200u)
#define menu_ENTRY_SUB_MENU                     ((menu_entry_flags) 0x400u)
#define menu_ENTRY_GENERATE_SUB_MENU_ACTION     ((menu_entry_flags) 0x800u)
#define menu_ENTRY_IS_MENU                      ((menu_entry_flags) 0x1000u)
#define action_MENU_ABOUT_TO_BE_SHOWN           0x828C0u
#define action_MENU_DIALOGUE_COMPLETED          0x828C1u
#define action_MENU_HAS_BEEN_HIDDEN             0x828C1u
#define action_MENU_SUB_MENU                    0x828C2u
#define action_MENU_SELECTION                   0x828C3u
#define error_MENU_TASKS_ACTIVE                 0x80AA00u
#define error_MENU_ALLOC_FAILED                 0x80AA01u
#define error_MENU_SHORT_BUFFER                 0x80AA02u
#define error_MENU_NO_SUCH_TASK                 0x80AA11u
#define error_MENU_NO_SUCH_METHOD               0x80AA12u
#define error_MENU_NO_SUCH_MISC_OP_METHOD       0x80AA13u
#define error_MENU_NO_SUCH_COMPONENT            0x80AA14u
#define error_MENU_SPRITE_NOT_TEXT              0x80AA21u
#define error_MENU_TEXT_NOT_SPRITE              0x80AA22u
#define error_MENU_NO_TOP_MENU                  0x80AA31u
#define error_MENU_UNKNOWN_SUB_MENU             0x80AA32u
#define error_MENU_NO_SPRITE_NAME               0x80AA33u
#define menu_SHOW_PERSISTENT                    ((menu_show_flags) 0x0u)
#define menu_SHOW_TRANSIENT                     ((menu_show_flags) 0x1u)
#define menu_ADD_BEFORE                         ((menu_add_flags) 0x1u)
#define menu_ADD_AT_START                       ((menu_add_at) 0xFFFFFFFFu)
#define menu_ADD_AT_END                         ((menu_add_at) 0xFFFFFFFEu)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      menu_update_tree()
 *
 * Description:   Calls SWI 0x828C3
 *
 * Input:         flags - value of R0 on entry
 */

extern os_error *xmenu_update_tree (bits flags);
__swi (0x828C3) void menu_update_tree (bits flags);

/* ------------------------------------------------------------------------
 * Function:      menu_set_tick()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                tick - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xmenu_set_tick (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      osbool tick);
extern void menu_set_tick (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      osbool tick);

/* ------------------------------------------------------------------------
 * Function:      menu_get_tick()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *
 * Output:        tick - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x1.
 */

extern os_error *xmenu_get_tick (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      osbool *tick);
extern osbool menu_get_tick (bits flags,
      toolbox_o menu,
      toolbox_c entry);

/* ------------------------------------------------------------------------
 * Function:      menu_set_fade()
 *
 * Description:   Calls reason code 2 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                fade - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x2.
 */

extern os_error *xmenu_set_fade (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      osbool fade);
extern void menu_set_fade (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      osbool fade);

/* ------------------------------------------------------------------------
 * Function:      menu_get_fade()
 *
 * Description:   Calls reason code 3 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *
 * Output:        fade - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x3.
 */

extern os_error *xmenu_get_fade (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      osbool *fade);
extern osbool menu_get_fade (bits flags,
      toolbox_o menu,
      toolbox_c entry);

/* ------------------------------------------------------------------------
 * Function:      menu_set_entry_text()
 *
 * Description:   Calls reason code 4 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                text - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x4.
 */

extern os_error *xmenu_set_entry_text (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char const *text);
extern void menu_set_entry_text (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char const *text);

/* ------------------------------------------------------------------------
 * Function:      menu_get_entry_text()
 *
 * Description:   Calls reason code 5 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x5.
 */

extern os_error *xmenu_get_entry_text (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char *buffer,
      int size,
      int *used);
extern int menu_get_entry_text (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      menu_set_entry_sprite()
 *
 * Description:   Calls reason code 6 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                sprite_name - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x6.
 */

extern os_error *xmenu_set_entry_sprite (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char const *sprite_name);
extern void menu_set_entry_sprite (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char const *sprite_name);

/* ------------------------------------------------------------------------
 * Function:      menu_get_entry_sprite()
 *
 * Description:   Calls reason code 7 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x7.
 */

extern os_error *xmenu_get_entry_sprite (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char *buffer,
      int size,
      int *used);
extern int menu_get_entry_sprite (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      menu_set_sub_menu_show()
 *
 * Description:   Calls reason code 8 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                sub_menu - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x8.
 */

extern os_error *xmenu_set_sub_menu_show (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      toolbox_o sub_menu);
extern void menu_set_sub_menu_show (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      toolbox_o sub_menu);

/* ------------------------------------------------------------------------
 * Function:      menu_get_sub_menu_show()
 *
 * Description:   Calls reason code 9 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *
 * Output:        sub_menu - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x9.
 */

extern os_error *xmenu_get_sub_menu_show (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      toolbox_o *sub_menu);
extern toolbox_o menu_get_sub_menu_show (bits flags,
      toolbox_o menu,
      toolbox_c entry);

/* ------------------------------------------------------------------------
 * Function:      menu_set_sub_menu_action()
 *
 * Description:   Calls reason code 10 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                action - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0xA.
 */

extern os_error *xmenu_set_sub_menu_action (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      bits action);
extern void menu_set_sub_menu_action (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      bits action);

/* ------------------------------------------------------------------------
 * Function:      menu_get_sub_menu_action()
 *
 * Description:   Calls reason code 11 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *
 * Output:        action - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0xB.
 */

extern os_error *xmenu_get_sub_menu_action (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      bits *action);
extern bits menu_get_sub_menu_action (bits flags,
      toolbox_o menu,
      toolbox_c entry);

/* ------------------------------------------------------------------------
 * Function:      menu_set_click_show()
 *
 * Description:   Calls reason code 12 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                show - value of R4 on entry
 *                show_flags - value of R5 on entry
 *
 * Other notes:   Before entry, R2 = 0xC.
 */

extern os_error *xmenu_set_click_show (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      toolbox_o show,
      menu_show_flags show_flags);
extern void menu_set_click_show (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      toolbox_o show,
      menu_show_flags show_flags);

/* ------------------------------------------------------------------------
 * Function:      menu_get_click_show()
 *
 * Description:   Calls reason code 13 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *
 * Output:        show - value of R0 on exit (X version only)
 *                show_flags - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0xD.
 */

extern os_error *xmenu_get_click_show (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      toolbox_o *show,
      menu_show_flags *show_flags);
extern toolbox_o menu_get_click_show (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      menu_show_flags *show_flags);

/* ------------------------------------------------------------------------
 * Function:      menu_set_click_action()
 *
 * Description:   Calls reason code 14 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                action - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0xE.
 */

extern os_error *xmenu_set_click_action (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      bits action);
extern void menu_set_click_action (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      bits action);

/* ------------------------------------------------------------------------
 * Function:      menu_get_click_action()
 *
 * Description:   Calls reason code 15 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *
 * Output:        action - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0xF.
 */

extern os_error *xmenu_get_click_action (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      bits *action);
extern bits menu_get_click_action (bits flags,
      toolbox_o menu,
      toolbox_c entry);

/* ------------------------------------------------------------------------
 * Function:      menu_set_help_message()
 *
 * Description:   Calls reason code 16 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                help - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x10.
 */

extern os_error *xmenu_set_help_message (bits flags,
      toolbox_o menu,
      char const *help);
extern void menu_set_help_message (bits flags,
      toolbox_o menu,
      char const *help);

/* ------------------------------------------------------------------------
 * Function:      menu_get_help_message()
 *
 * Description:   Calls reason code 17 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x11.
 */

extern os_error *xmenu_get_help_message (bits flags,
      toolbox_o menu,
      char *buffer,
      int size,
      int *used);
extern int menu_get_help_message (bits flags,
      toolbox_o menu,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      menu_set_entry_help_message()
 *
 * Description:   Calls reason code 18 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                help - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x12.
 */

extern os_error *xmenu_set_entry_help_message (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char const *help);
extern void menu_set_entry_help_message (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char const *help);

/* ------------------------------------------------------------------------
 * Function:      menu_get_entry_help_message()
 *
 * Description:   Calls reason code 19 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x13.
 */

extern os_error *xmenu_get_entry_help_message (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char *buffer,
      int size,
      int *used);
extern int menu_get_entry_help_message (bits flags,
      toolbox_o menu,
      toolbox_c entry,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      menu_add_entry()
 *
 * Description:   Calls reason code 20 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                at - value of R3 on entry
 *                entry - value of R4 on entry
 *
 * Output:        entry_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x14.
 */

extern os_error *xmenu_add_entry (menu_add_flags flags,
      toolbox_o menu,
      menu_add_at at,
      menu_entry_object const *entry,
      toolbox_c *entry_out);
extern toolbox_c menu_add_entry (menu_add_flags flags,
      toolbox_o menu,
      menu_add_at at,
      menu_entry_object const *entry);

/* ------------------------------------------------------------------------
 * Function:      menu_remove_entry()
 *
 * Description:   Calls reason code 21 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                entry - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x15.
 */

extern os_error *xmenu_remove_entry (bits flags,
      toolbox_o menu,
      toolbox_c entry);
extern void menu_remove_entry (bits flags,
      toolbox_o menu,
      toolbox_c entry);

/* ------------------------------------------------------------------------
 * Function:      menu_get_height()
 *
 * Description:   Calls reason code 22 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *
 * Output:        height - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x16.
 */

extern os_error *xmenu_get_height (bits flags,
      toolbox_o menu,
      int *height);
extern int menu_get_height (bits flags,
      toolbox_o menu);

/* ------------------------------------------------------------------------
 * Function:      menu_get_width()
 *
 * Description:   Calls reason code 23 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *
 * Output:        width - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x17.
 */

extern os_error *xmenu_get_width (bits flags,
      toolbox_o menu,
      int *width);
extern int menu_get_width (bits flags,
      toolbox_o menu);

/* ------------------------------------------------------------------------
 * Function:      menu_set_title()
 *
 * Description:   Calls reason code 24 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                title - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x18.
 */

extern os_error *xmenu_set_title (bits flags,
      toolbox_o menu,
      char const *title);
extern void menu_set_title (bits flags,
      toolbox_o menu,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      menu_get_title()
 *
 * Description:   Calls reason code 25 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                menu - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x19.
 */

extern os_error *xmenu_get_title (bits flags,
      toolbox_o menu,
      char *buffer,
      int size,
      int *used);
extern int menu_get_title (bits flags,
      toolbox_o menu,
      char *buffer,
      int size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
