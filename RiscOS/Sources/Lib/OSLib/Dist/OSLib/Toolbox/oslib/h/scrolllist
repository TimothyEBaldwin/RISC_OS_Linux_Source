#ifndef scrolllist_H
#define scrolllist_H

/* C header file for ScrollList
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:38 2007
 * Tom Hughes, tom@compton.nu, 29 Mar 1999
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

#ifndef osspriteop_H
#include "oslib/osspriteop.h"
#endif

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#ifndef toolbox_H
#include "oslib/toolbox.h"
#endif

#ifndef gadget_H
#include "oslib/gadget.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  ScrollList_GetState
#define ScrollList_GetState                     0x401A
#undef  ScrollList_SetState
#define ScrollList_SetState                     0x401B
#undef  ScrollList_AddItem
#define ScrollList_AddItem                      0x401C
#undef  ScrollList_DeleteItems
#define ScrollList_DeleteItems                  0x401D
#undef  ScrollList_SelectItem
#define ScrollList_SelectItem                   0x401E
#undef  ScrollList_DeselectItem
#define ScrollList_DeselectItem                 0x401F
#undef  ScrollList_GetSelected
#define ScrollList_GetSelected                  0x4020
#undef  ScrollList_MakeVisible
#define ScrollList_MakeVisible                  0x4021
#undef  ScrollList_SetColour
#define ScrollList_SetColour                    0x4022
#undef  ScrollList_GetColour
#define ScrollList_GetColour                    0x4023
#undef  ScrollList_SetFont
#define ScrollList_SetFont                      0x4024
#undef  ScrollList_GetItemText
#define ScrollList_GetItemText                  0x4025
#undef  ScrollList_CountItems
#define ScrollList_CountItems                   0x4026
#undef  ScrollList_SetItemText
#define ScrollList_SetItemText                  0x4027

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct scrolllist_gadget                scrolllist_gadget;
typedef struct scrolllist_object                scrolllist_object;
typedef struct scrolllist_selection             scrolllist_selection;
typedef struct scrolllist_action_selection      scrolllist_action_selection;
typedef struct scrolllist_action_selection_block scrolllist_action_selection_block;
typedef union  scrolllist_colour                scrolllist_colour;

/********************
 * Type definitions *
 ********************/
struct scrolllist_gadget
   {  int event;
      os_colour foreground;
      os_colour background;
   };

struct scrolllist_object
   {  gadget_OBJECT_MEMBERS
      int event;
      os_colour foreground;
      os_colour background;
   };

/* ------------------------------------------------------------------------
 * Type:          scrolllist_selection
 *
 * Description:   Prefer ScrollList_ActionSelectionBlock
 */

struct scrolllist_selection
   {  bits flags;
      int item;
   };

/* ------------------------------------------------------------------------
 * Type:          scrolllist_action_selection
 *
 * Description:   Prefer ScrollList_ActionSelectionBlock
 */

struct scrolllist_action_selection
   {  bits flags;
      int item;
   };

struct scrolllist_action_selection_block
   {  toolbox_ACTION_HEADER_MEMBERS
      bits objectflags;
      int item;
   };

typedef bits scrolllist_state;

typedef bits scrolllist_add_item_flags;

typedef bits scrolllist_select_item_flags;

typedef bits scrolllist_set_colour_flags;

union scrolllist_colour
   {  os_colour real;
      wimp_colour desktop;
   };

/************************
 * Constant definitions *
 ************************/
#define class_SCROLL_LIST                       ((toolbox_class) 0x401Au)
#define action_SCROLL_LIST_SELECTION            0x140181u
#define scrolllist_STATE_ALLOW_MULTIPLE_SELECTIONS ((scrolllist_state) 0x1u)
#define scrolllist_ADD_ITEM_SPRITE_INFO         ((scrolllist_add_item_flags) 0x3u)
#define scrolllist_ADD_ITEM_SPRITE_INFO_SHIFT   0
#define scrolllist_ADD_ITEM_SPRITE_INFO_SYSTEM_SPRITE_NAME 0
#define scrolllist_ADD_ITEM_SPRITE_INFO_USER_SPRITE_NAME 1
#define scrolllist_ADD_ITEM_SPRITE_INFO_USER_SPRITE_POINTER 2
#define scrolllist_ADD_ITEM_PLOT_SPRITE_HALF_SIZE ((scrolllist_add_item_flags) 0x4u)
#define scrolllist_SELECT_ITEM_UNIQUE           ((scrolllist_select_item_flags) 0x1u)
#define scrolllist_SET_COLOUR_DESKTOP           ((scrolllist_set_colour_flags) 0x1u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      scrolllist_get_state()
 *
 * Description:   Reads the state of the ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *
 * Output:        state - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401A.
 */

extern os_error *xscrolllist_get_state (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      scrolllist_state *state);
extern scrolllist_state scrolllist_get_state (bits flags,
      toolbox_o window,
      toolbox_c scroll_list);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_set_state()
 *
 * Description:   Sets the state of the ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                state - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401B.
 */

extern os_error *xscrolllist_set_state (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      scrolllist_state state);
extern void scrolllist_set_state (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      scrolllist_state state);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_add_item()
 *
 * Description:   Add an item to the ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                text - value of R4 on entry
 *                area - value of R5 on entry
 *                id - value of R6 on entry
 *                index - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401C.
 */

extern os_error *xscrolllist_add_item (scrolllist_add_item_flags flags,
      toolbox_o window,
      toolbox_c scroll_list,
      char const *text,
      osspriteop_area const *area,
      osspriteop_id id,
      int index);
extern void scrolllist_add_item (scrolllist_add_item_flags flags,
      toolbox_o window,
      toolbox_c scroll_list,
      char const *text,
      osspriteop_area const *area,
      osspriteop_id id,
      int index);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_delete_items()
 *
 * Description:   Deletes a range of items from the ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                start_index - value of R4 on entry
 *                end_index - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401D.
 */

extern os_error *xscrolllist_delete_items (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int start_index,
      int end_index);
extern void scrolllist_delete_items (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int start_index,
      int end_index);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_select_item()
 *
 * Description:   Selects an item in the ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                index - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401E.
 */

extern os_error *xscrolllist_select_item (scrolllist_select_item_flags flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int index);
extern void scrolllist_select_item (scrolllist_select_item_flags flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int index);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_deselect_item()
 *
 * Description:   Deselects an item in the ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                index - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401F.
 */

extern os_error *xscrolllist_deselect_item (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int index);
extern void scrolllist_deselect_item (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int index);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_get_selected()
 *
 * Description:   Returns the selected item(s) in the ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                offset - value of R4 on entry
 *
 * Output:        new_offset - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4020.
 */

extern os_error *xscrolllist_get_selected (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int offset,
      int *new_offset);
extern int scrolllist_get_selected (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int offset);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_make_visible()
 *
 * Description:   Ensures that index is in the visible section of the
 *                ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                index - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4021.
 */

extern os_error *xscrolllist_make_visible (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int index);
extern void scrolllist_make_visible (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int index);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_set_colour()
 *
 * Description:   Sets the foreground and background colours of the
 *                ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                foreground - value of R4 on entry
 *                background - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4022.
 */

extern os_error *xscrolllist_set_colour (scrolllist_set_colour_flags flags,
      toolbox_o window,
      toolbox_c scroll_list,
      scrolllist_colour foreground,
      scrolllist_colour background);
extern void scrolllist_set_colour (scrolllist_set_colour_flags flags,
      toolbox_o window,
      toolbox_c scroll_list,
      scrolllist_colour foreground,
      scrolllist_colour background);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_get_colour()
 *
 * Description:   Gets the foreground and background colours of the
 *                ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *
 * Output:        foreground - value of R0 on exit
 *                background - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4023.
 */

extern os_error *xscrolllist_get_colour (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      os_colour *foreground,
      os_colour *background);
extern void scrolllist_get_colour (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      os_colour *foreground,
      os_colour *background);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_set_font()
 *
 * Description:   Sets the font details for the ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                font_name - value of R4 on entry
 *                width - value of R5 on entry
 *                height - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4024.
 */

extern os_error *xscrolllist_set_font (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      char const *font_name,
      int width,
      int height);
extern void scrolllist_set_font (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      char const *font_name,
      int width,
      int height);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_get_item_text()
 *
 * Description:   Gets the text of a ScrollList entry
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                buffer - value of R4 on entry
 *                buffer_size - value of R5 on entry
 *                index - value of R6 on entry
 *
 * Output:        size - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4025.
 */

extern os_error *xscrolllist_get_item_text (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      char *buffer,
      int buffer_size,
      int index,
      int *size);
extern int scrolllist_get_item_text (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      char *buffer,
      int buffer_size,
      int index);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_count_items()
 *
 * Description:   Returns the number of items in the ScrollList
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *
 * Output:        items - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4026.
 */

extern os_error *xscrolllist_count_items (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      int *items);
extern int scrolllist_count_items (bits flags,
      toolbox_o window,
      toolbox_c scroll_list);

/* ------------------------------------------------------------------------
 * Function:      scrolllist_set_item_text()
 *
 * Description:   Sets the text of a ScrollList entry
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_list - value of R3 on entry
 *                text - value of R4 on entry
 *                index - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4027.
 */

extern os_error *xscrolllist_set_item_text (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      char const *text,
      int index);
extern void scrolllist_set_item_text (bits flags,
      toolbox_o window,
      toolbox_c scroll_list,
      char const *text,
      int index);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
