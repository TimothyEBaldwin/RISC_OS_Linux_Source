#ifndef fontdbox_H
#define fontdbox_H

/* C header file for FontDbox
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
#undef  FontDbox_ClassSWI
#define FontDbox_ClassSWI                       0x82A00
#undef  XFontDbox_ClassSWI
#define XFontDbox_ClassSWI                      0xA2A00
#undef  FontDbox_PostFilter
#define FontDbox_PostFilter                     0x82A01
#undef  XFontDbox_PostFilter
#define XFontDbox_PostFilter                    0xA2A01
#undef  FontDbox_PreFilter
#define FontDbox_PreFilter                      0x82A02
#undef  XFontDbox_PreFilter
#define XFontDbox_PreFilter                     0xA2A02
#undef  FontDbox_GetWindowId
#define FontDbox_GetWindowId                    0x0
#undef  FontDbox_SetFont
#define FontDbox_SetFont                        0x1
#undef  FontDbox_GetFont
#define FontDbox_GetFont                        0x2
#undef  FontDbox_SetSize
#define FontDbox_SetSize                        0x3
#undef  FontDbox_GetSize
#define FontDbox_GetSize                        0x4
#undef  FontDbox_SetTryString
#define FontDbox_SetTryString                   0x5
#undef  FontDbox_GetTryString
#define FontDbox_GetTryString                   0x6
#undef  FontDbox_SetTitle
#define FontDbox_SetTitle                       0x7
#undef  FontDbox_GetTitle
#define FontDbox_GetTitle                       0x8

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct fontdbox_font                    fontdbox_font;
typedef struct fontdbox_object                  fontdbox_object;
typedef struct fontdbox_object_template         fontdbox_object_template;
typedef struct fontdbox_action_about_to_be_shown fontdbox_action_about_to_be_shown;
typedef struct fontdbox_action_about_to_be_shown_block fontdbox_action_about_to_be_shown_block;
typedef struct fontdbox_action_apply_font       fontdbox_action_apply_font;
typedef struct fontdbox_action_apply_font_block fontdbox_action_apply_font_block;

/********************
 * Type definitions *
 ********************/
typedef bits fontdbox_flags;

struct fontdbox_font
   {  toolbox_string_reference font;
      int height;
      int aspect;
   };

/* ------------------------------------------------------------------------
 * Type:          fontdbox_object
 *
 * Description:   Structure to describe FontDbox Object for in-memory construction - to be referenced from Toolbox_Template
 */

struct fontdbox_object
   {  fontdbox_flags flags;
      toolbox_msg_reference title;
      int title_limit;
      fontdbox_font initial;
      toolbox_msg_reference try_string;
      toolbox_string_reference alternative_window_name;
   };

struct fontdbox_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      fontdbox_flags objectflags;
      toolbox_msg_reference title;
      int title_limit;
      fontdbox_font initial;
      toolbox_msg_reference try_string;
      toolbox_string_reference alternative_window_name;
   };

typedef toolbox_full fontdbox_full;

/* ------------------------------------------------------------------------
 * Type:          fontdbox_action_about_to_be_shown
 *
 * Description:   Prefer FontDbox_ActionAboutToBeShownBlock
 */

struct fontdbox_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         fontdbox_full full;
      }
      position;
   };

struct fontdbox_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         fontdbox_full full;
      }
      position;
   };

typedef toolbox_action_header_base fontdbox_action_dialogue_completed_block;

/* ------------------------------------------------------------------------
 * Type:          fontdbox_action_apply_font
 *
 * Description:   Prefer FontDbox_ActionApplyFontBlock
 */

struct fontdbox_action_apply_font
   {  int height;
      int aspect;
      char font [204];
   };

struct fontdbox_action_apply_font_block
   {  toolbox_ACTION_HEADER_MEMBERS
      int height;
      int aspect;
      char font [204];
   };

/************************
 * Constant definitions *
 ************************/
#define class_FONT_DBOX                         ((toolbox_class) 0x82A00u)
#define fontdbox_SET_HEIGHT                     0x1u
#define fontdbox_SET_ASPECT                     0x2u
#define fontdbox_GENERATE_ABOUT_TO_BE_SHOWN     ((fontdbox_flags) 0x1u)
#define fontdbox_GENERATE_DIALOGUE_COMPLETED    ((fontdbox_flags) 0x2u)
#define fontdbox_INCLUDE_SYSTEM_FONT            ((fontdbox_flags) 0x4u)
#define fontdbox_APPLY                          ((toolbox_c) 0x82A0000u)
#define fontdbox_CANCEL                         ((toolbox_c) 0x82A0001u)
#define fontdbox_TRY                            ((toolbox_c) 0x82A0002u)
#define fontdbox_TRY_STRING                     ((toolbox_c) 0x82A0003u)
#define fontdbox_ASPECT_RATIO                   ((toolbox_c) 0x82A0004u)
#define fontdbox_HEIGHT                         ((toolbox_c) 0x82A0005u)
#define fontdbox_STANDARD_SIZE0                 ((toolbox_c) 0x82A0006u)
#define fontdbox_STANDARD_SIZE1                 ((toolbox_c) 0x82A0007u)
#define fontdbox_STANDARD_SIZE2                 ((toolbox_c) 0x82A0008u)
#define fontdbox_STANDARD_SIZE3                 ((toolbox_c) 0x82A0009u)
#define fontdbox_STANDARD_SIZE4                 ((toolbox_c) 0x82A000Au)
#define fontdbox_STANDARD_SIZE5                 ((toolbox_c) 0x82A000Bu)
#define fontdbox_STANDARD_SIZE6                 ((toolbox_c) 0x82A000Cu)
#define fontdbox_STANDARD_SIZE7                 ((toolbox_c) 0x82A000Du)
#define fontdbox_STANDARD_SIZE8                 ((toolbox_c) 0x82A000Eu)
#define fontdbox_STANDARD_SIZE9                 ((toolbox_c) 0x82A000Fu)
#define fontdbox_STYLE                          ((toolbox_c) 0x82A0010u)
#define fontdbox_WEIGHT                         ((toolbox_c) 0x82A0011u)
#define fontdbox_FONT                           ((toolbox_c) 0x82A0012u)
#define action_FONT_DBOX_ABOUT_TO_BE_SHOWN      0x82A00u
#define action_FONT_DBOX_DIALOGUE_COMPLETED     0x82A01u
#define action_FONT_DBOX_APPLY_FONT             0x82A02u
#define error_FONT_DBOX_TASKS_ACTIVE            0x80AF00u
#define error_FONT_DBOX_ALLOC_FAILED            0x80AF01u
#define error_FONT_DBOX_SHORT_BUFFER            0x80AF02u
#define error_FONT_DBOX_NO_SUCH_TASK            0x80AF11u
#define error_FONT_DBOX_NO_SUCH_METHOD          0x80AF12u
#define error_FONT_DBOX_NO_SUCH_MISC_OP_METHOD  0x80AF13u
#define error_FONT_DBOX_NO_SUCH_FONT            0x80AF14u
#define error_FONT_DBOX_NO_FONTS                0x80AF21u
#define error_FONT_DBOX_OUT_OF_MESSAGE_SPACE    0x80AF31u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      fontdbox_get_window_id()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_dbox - value of R1 on entry
 *
 * Output:        window - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xfontdbox_get_window_id (bits flags,
      toolbox_o font_dbox,
      toolbox_o *window);
extern toolbox_o fontdbox_get_window_id (bits flags,
      toolbox_o font_dbox);

/* ------------------------------------------------------------------------
 * Function:      fontdbox_set_font()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_dbox - value of R1 on entry
 *                font_identifier - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x1.
 */

extern os_error *xfontdbox_set_font (bits flags,
      toolbox_o font_dbox,
      char const *font_identifier);
extern void fontdbox_set_font (bits flags,
      toolbox_o font_dbox,
      char const *font_identifier);

/* ------------------------------------------------------------------------
 * Function:      fontdbox_get_font()
 *
 * Description:   Calls reason code 2 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_dbox - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x2.
 */

extern os_error *xfontdbox_get_font (bits flags,
      toolbox_o font_dbox,
      char *buffer,
      int size,
      int *used);
extern int fontdbox_get_font (bits flags,
      toolbox_o font_dbox,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      fontdbox_set_size()
 *
 * Description:   Calls reason code 3 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_dbox - value of R1 on entry
 *                height - value of R3 on entry
 *                aspect - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x3.
 */

extern os_error *xfontdbox_set_size (bits flags,
      toolbox_o font_dbox,
      int height,
      int aspect);
extern void fontdbox_set_size (bits flags,
      toolbox_o font_dbox,
      int height,
      int aspect);

/* ------------------------------------------------------------------------
 * Function:      fontdbox_get_size()
 *
 * Description:   Calls reason code 4 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_dbox - value of R1 on entry
 *
 * Output:        height - value of R0 on exit
 *                aspect - value of R1 on exit
 *
 * Other notes:   Before entry, R2 = 0x4.
 */

extern os_error *xfontdbox_get_size (bits flags,
      toolbox_o font_dbox,
      int *height,
      int *aspect);
extern void fontdbox_get_size (bits flags,
      toolbox_o font_dbox,
      int *height,
      int *aspect);

/* ------------------------------------------------------------------------
 * Function:      fontdbox_set_try_string()
 *
 * Description:   Calls reason code 5 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_dbox - value of R1 on entry
 *                try_string - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x5.
 */

extern os_error *xfontdbox_set_try_string (bits flags,
      toolbox_o font_dbox,
      char const *try_string);
extern void fontdbox_set_try_string (bits flags,
      toolbox_o font_dbox,
      char const *try_string);

/* ------------------------------------------------------------------------
 * Function:      fontdbox_get_try_string()
 *
 * Description:   Calls reason code 6 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_dbox - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x6.
 */

extern os_error *xfontdbox_get_try_string (bits flags,
      toolbox_o font_dbox,
      char *buffer,
      int size,
      int *used);
extern int fontdbox_get_try_string (bits flags,
      toolbox_o font_dbox,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      fontdbox_set_title()
 *
 * Description:   Calls reason code 7 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_dbox - value of R1 on entry
 *                title - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x7.
 */

extern os_error *xfontdbox_set_title (bits flags,
      toolbox_o font_dbox,
      char const *title);
extern void fontdbox_set_title (bits flags,
      toolbox_o font_dbox,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      fontdbox_get_title()
 *
 * Description:   Calls reason code 8 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                font_dbox - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x8.
 */

extern os_error *xfontdbox_get_title (bits flags,
      toolbox_o font_dbox,
      char *buffer,
      int size,
      int *used);
extern int fontdbox_get_title (bits flags,
      toolbox_o font_dbox,
      char *buffer,
      int size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
