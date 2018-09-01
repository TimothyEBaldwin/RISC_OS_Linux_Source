#ifndef textarea_H
#define textarea_H

/* C header file for TextArea
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:38 2007
 * Tom Hughes, tom@compton.nu, 14 Mar 1999
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
#undef  TextArea_GetState
#define TextArea_GetState                       0x4018
#undef  TextArea_SetState
#define TextArea_SetState                       0x4019
#undef  TextArea_SetText
#define TextArea_SetText                        0x401A
#undef  TextArea_GetTextSize
#define TextArea_GetTextSize                    0x401B
#undef  TextArea_GetText
#define TextArea_GetText                        0x401B
#undef  TextArea_InsertText
#define TextArea_InsertText                     0x401C
#undef  TextArea_ReplaceText
#define TextArea_ReplaceText                    0x401D
#undef  TextArea_GetSelection
#define TextArea_GetSelection                   0x401E
#undef  TextArea_GetSelectionTextSize
#define TextArea_GetSelectionTextSize           0x401E
#undef  TextArea_GetSelectionText
#define TextArea_GetSelectionText               0x401E
#undef  TextArea_SetSelection
#define TextArea_SetSelection                   0x401F
#undef  TextArea_SetFont
#define TextArea_SetFont                        0x4020
#undef  TextArea_SetColour
#define TextArea_SetColour                      0x4021
#undef  TextArea_GetColour
#define TextArea_GetColour                      0x4022
#undef  TextArea_SetTextBorder
#define TextArea_SetTextBorder                  0x4023

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct textarea_gadget                  textarea_gadget;
typedef struct textarea_object                  textarea_object;
typedef union  textarea_colour                  textarea_colour;

/********************
 * Type definitions *
 ********************/
struct textarea_gadget
   {  int type;
      int event;
      toolbox_msg_reference text;
      os_colour foreground;
      os_colour background;
   };

struct textarea_object
   {  gadget_OBJECT_MEMBERS
      int type;
      int event;
      toolbox_msg_reference text;
      os_colour foreground;
      os_colour background;
   };

typedef bits textarea_state;

typedef bits textarea_get_selection_flags;

typedef bits textarea_set_colour_flags;

union textarea_colour
   {  os_colour real;
      wimp_colour desktop;
   };

/************************
 * Constant definitions *
 ************************/
#define class_TEXT_AREA                         ((toolbox_class) 0x4018u)
#define textarea_STATE_HAS_VERTICAL_SCROLLBAR   ((textarea_state) 0x1u)
#define textarea_STATE_HAS_HORIZONTAL_SCROLLBAR ((textarea_state) 0x2u)
#define textarea_STATE_WORDWRAPPING_ENABLED     ((textarea_state) 0x4u)
#define textarea_ALLOW_SELECTION                ((textarea_state) 0x8u)
#define textarea_ALLOW_SAVE                     ((textarea_state) 0x10u)
#define textarea_ALLOW_LOAD                     ((textarea_state) 0x20u)
#define textarea_CLIPBOARD                      ((textarea_state) 0x40u)
#define textarea_AUTO_SCROLL                    ((textarea_state) 0x80u)
#define textarea_GET_SELECTION_RETURN_TEXT      ((textarea_get_selection_flags) 0x1u)
#define textarea_SET_COLOUR_DESKTOP             ((textarea_set_colour_flags) 0x1u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      textarea_get_state()
 *
 * Description:   Reads the state of the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *
 * Output:        state - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4018.
 */

extern os_error *xtextarea_get_state (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      textarea_state *state);
extern textarea_state textarea_get_state (bits flags,
      toolbox_o window,
      toolbox_c text_area);

/* ------------------------------------------------------------------------
 * Function:      textarea_set_state()
 *
 * Description:   Sets the state of the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *                state - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4019.
 */

extern os_error *xtextarea_set_state (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      textarea_state state);
extern void textarea_set_state (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      textarea_state state);

/* ------------------------------------------------------------------------
 * Function:      textarea_set_text()
 *
 * Description:   Sets the text displayed in the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *                text - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401A.
 */

extern os_error *xtextarea_set_text (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      char const *text);
extern void textarea_set_text (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      char const *text);

/* ------------------------------------------------------------------------
 * Function:      textarea_get_text_size()
 *
 * Description:   Reads size of text displayed in the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *
 * Output:        buffer_size - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401B, R4 = 0x0.
 */

extern os_error *xtextarea_get_text_size (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      int *buffer_size);
extern int textarea_get_text_size (bits flags,
      toolbox_o window,
      toolbox_c text_area);

/* ------------------------------------------------------------------------
 * Function:      textarea_get_text()
 *
 * Description:   Reads the text displayed in the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *                buffer - value of R4 on entry
 *                buffer_size - value of R5 on entry
 *
 * Output:        length - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401B.
 */

extern os_error *xtextarea_get_text (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      char *buffer,
      int buffer_size,
      int *length);
extern int textarea_get_text (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      char *buffer,
      int buffer_size);

/* ------------------------------------------------------------------------
 * Function:      textarea_insert_text()
 *
 * Description:   Inserts text into the text displayed in the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *                insert_at - value of R4 on entry
 *                text - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401C.
 */

extern os_error *xtextarea_insert_text (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      int insert_at,
      char const *text);
extern void textarea_insert_text (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      int insert_at,
      char const *text);

/* ------------------------------------------------------------------------
 * Function:      textarea_replace_text()
 *
 * Description:   Replaces a portion of the text displayed in the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *                start - value of R4 on entry
 *                end - value of R5 on entry
 *                text - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401D.
 */

extern os_error *xtextarea_replace_text (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      int start,
      int end,
      char const *text);
extern void textarea_replace_text (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      int start,
      int end,
      char const *text);

/* ------------------------------------------------------------------------
 * Function:      textarea_get_selection()
 *
 * Description:   Gets the selection details for the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *
 * Output:        start - value of R4 on exit
 *                end - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401E.
 */

extern os_error *xtextarea_get_selection (textarea_get_selection_flags flags,
      toolbox_o window,
      toolbox_c text_area,
      int *start,
      int *end);
extern void textarea_get_selection (textarea_get_selection_flags flags,
      toolbox_o window,
      toolbox_c text_area,
      int *start,
      int *end);

/* ------------------------------------------------------------------------
 * Function:      textarea_get_selection_text_size()
 *
 * Description:   Gets the size of the selected text for the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *
 * Output:        buffer_size - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x1, R2 = 0x401E, R4 = 0x0.
 */

extern os_error *xtextarea_get_selection_text_size (textarea_get_selection_flags flags,
      toolbox_o window,
      toolbox_c text_area,
      int *buffer_size);
extern int textarea_get_selection_text_size (textarea_get_selection_flags flags,
      toolbox_o window,
      toolbox_c text_area);

/* ------------------------------------------------------------------------
 * Function:      textarea_get_selection_text()
 *
 * Description:   Gets the selected text for the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *                buffer - value of R4 on entry
 *                buffer_size - value of R5 on entry
 *
 * Output:        length - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x1, R2 = 0x401E.
 */

extern os_error *xtextarea_get_selection_text (textarea_get_selection_flags flags,
      toolbox_o window,
      toolbox_c text_area,
      char *buffer,
      int buffer_size,
      int *length);
extern int textarea_get_selection_text (textarea_get_selection_flags flags,
      toolbox_o window,
      toolbox_c text_area,
      char *buffer,
      int buffer_size);

/* ------------------------------------------------------------------------
 * Function:      textarea_set_selection()
 *
 * Description:   Sets the selection details for the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *                start - value of R4 on entry
 *                end - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401F.
 */

extern os_error *xtextarea_set_selection (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      int start,
      int end);
extern void textarea_set_selection (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      int start,
      int end);

/* ------------------------------------------------------------------------
 * Function:      textarea_set_font()
 *
 * Description:   Sets the font details for the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *                font_name - value of R4 on entry
 *                width - value of R5 on entry
 *                height - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4020.
 */

extern os_error *xtextarea_set_font (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      char const *font_name,
      int width,
      int height);
extern void textarea_set_font (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      char const *font_name,
      int width,
      int height);

/* ------------------------------------------------------------------------
 * Function:      textarea_set_colour()
 *
 * Description:   Sets the foreground and background colours of the
 *                TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *                foreground - value of R4 on entry
 *                background - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4021.
 */

extern os_error *xtextarea_set_colour (textarea_set_colour_flags flags,
      toolbox_o window,
      toolbox_c text_area,
      textarea_colour foreground,
      textarea_colour background);
extern void textarea_set_colour (textarea_set_colour_flags flags,
      toolbox_o window,
      toolbox_c text_area,
      textarea_colour foreground,
      textarea_colour background);

/* ------------------------------------------------------------------------
 * Function:      textarea_get_colour()
 *
 * Description:   Gets the foreground and background colours of the
 *                TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *
 * Output:        foreground - value of R0 on exit
 *                background - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4022.
 */

extern os_error *xtextarea_get_colour (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      os_colour *foreground,
      os_colour *background);
extern void textarea_get_colour (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      os_colour *foreground,
      os_colour *background);

/* ------------------------------------------------------------------------
 * Function:      textarea_set_text_border()
 *
 * Description:   Sets the border width of the TextArea
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                text_area - value of R3 on entry
 *                border_size - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4023.
 */

extern os_error *xtextarea_set_text_border (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      int border_size);
extern void textarea_set_text_border (bits flags,
      toolbox_o window,
      toolbox_c text_area,
      int border_size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
