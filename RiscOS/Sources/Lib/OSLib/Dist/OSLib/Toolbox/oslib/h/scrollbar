#ifndef scrollbar_H
#define scrollbar_H

/* C header file for Scrollbar
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
#undef  Scrollbar_GetState
#define Scrollbar_GetState                      0x401B
#undef  Scrollbar_SetState
#define Scrollbar_SetState                      0x401C
#undef  Scrollbar_SetBounds
#define Scrollbar_SetBounds                     0x401D
#undef  Scrollbar_SetLowerBound
#define Scrollbar_SetLowerBound                 0x1
#undef  Scrollbar_SetUpperBound
#define Scrollbar_SetUpperBound                 0x2
#undef  Scrollbar_SetVisibleLength
#define Scrollbar_SetVisibleLength              0x4
#undef  Scrollbar_GetBounds
#define Scrollbar_GetBounds                     0x401E
#undef  Scrollbar_GetLowerBound
#define Scrollbar_GetLowerBound                 0x1
#undef  Scrollbar_GetUpperBound
#define Scrollbar_GetUpperBound                 0x2
#undef  Scrollbar_GetVisibleLength
#define Scrollbar_GetVisibleLength              0x4
#undef  Scrollbar_SetValue
#define Scrollbar_SetValue                      0x401F
#undef  Scrollbar_GetValue
#define Scrollbar_GetValue                      0x4020
#undef  Scrollbar_SetIncrements
#define Scrollbar_SetIncrements                 0x4021
#undef  Scrollbar_SetLineIncrement
#define Scrollbar_SetLineIncrement              0x1
#undef  Scrollbar_SetPageIncrement
#define Scrollbar_SetPageIncrement              0x2
#undef  Scrollbar_GetIncrements
#define Scrollbar_GetIncrements                 0x4022
#undef  Scrollbar_GetLineIncrement
#define Scrollbar_GetLineIncrement              0x1
#undef  Scrollbar_GetPageIncrement
#define Scrollbar_GetPageIncrement              0x2
#undef  Scrollbar_SetEvent
#define Scrollbar_SetEvent                      0x4023
#undef  Scrollbar_GetEvent
#define Scrollbar_GetEvent                      0x4024

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct scrollbar_gadget                 scrollbar_gadget;
typedef struct scrollbar_object                 scrollbar_object;
typedef struct scrollbar_position_changed       scrollbar_position_changed;
typedef struct scrollbar_action_position_changed scrollbar_action_position_changed;
typedef struct scrollbar_action_position_changed_block scrollbar_action_position_changed_block;

/********************
 * Type definitions *
 ********************/
struct scrollbar_gadget
   {  int type;
      int event;
      int lower_bound;
      int upper_bound;
      int value;
      int visible_length;
      int line_increment;
      int page_increment;
   };

struct scrollbar_object
   {  gadget_OBJECT_MEMBERS
      int type;
      int event;
      int lower_bound;
      int upper_bound;
      int value;
      int visible_length;
      int line_increment;
      int page_increment;
   };

/* ------------------------------------------------------------------------
 * Type:          scrollbar_position_changed
 *
 * Description:   Deprecated - use Scrollbar_ActionPositionChanged
 */

struct scrollbar_position_changed
   {  bits new_position;
      int direction;
   };

/* ------------------------------------------------------------------------
 * Type:          scrollbar_action_position_changed
 *
 * Description:   Prefer Scrollbar_ActionPositionChangedBlock
 */

struct scrollbar_action_position_changed
   {  bits new_position;
      int direction;
   };

struct scrollbar_action_position_changed_block
   {  toolbox_ACTION_HEADER_MEMBERS
      bits new_position;
      int direction;
   };

typedef bits scrollbar_state;

typedef bits scrollbar_bounds_flags;

typedef bits scrollbar_increments_flags;

/************************
 * Constant definitions *
 ************************/
#define class_SCROLLBAR                         ((toolbox_class) 0x401Bu)
#define action_SCROLLBAR_POSITION_CHANGED       0x140183u
#define scrollbar_HAS_VERTICAL_SCROLLBAR        ((scrollbar_state) 0x1u)
#define scrollbar_HAS_HORIZONTAL_SCROLLBAR      ((scrollbar_state) 0x2u)
#define scrollbar_BOUNDS_LOWER                  ((scrollbar_bounds_flags) 0x1u)
#define scrollbar_BOUNDS_UPPER                  ((scrollbar_bounds_flags) 0x2u)
#define scrollbar_BOUNDS_VISIBLE_LENGTH         ((scrollbar_bounds_flags) 0x4u)
#define scrollbar_INCREMENTS_LINE               ((scrollbar_increments_flags) 0x1u)
#define scrollbar_INCREMENTS_PAGE               ((scrollbar_increments_flags) 0x2u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      scrollbar_get_state()
 *
 * Description:   Reads the state of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *
 * Output:        state - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401B.
 */

extern os_error *xscrollbar_get_state (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      scrollbar_state *state);
extern scrollbar_state scrollbar_get_state (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_set_state()
 *
 * Description:   Sets the state of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *                state - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401C.
 */

extern os_error *xscrollbar_set_state (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      scrollbar_state state);
extern void scrollbar_set_state (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      scrollbar_state state);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_set_bounds()
 *
 * Description:   Sets the bounds of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *                lower_bound - value of R4 on entry
 *                upper_bound - value of R5 on entry
 *                visible_length - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401D.
 */

extern os_error *xscrollbar_set_bounds (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int lower_bound,
      int upper_bound,
      int visible_length);
extern void scrollbar_set_bounds (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int lower_bound,
      int upper_bound,
      int visible_length);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_set_lower_bound()
 *
 * Description:   Set the lower bound of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *                lower_bound - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x1, R2 = 0x401D.
 */

extern os_error *xscrollbar_set_lower_bound (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int lower_bound);
extern void scrollbar_set_lower_bound (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int lower_bound);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_set_upper_bound()
 *
 * Description:   Sets the upper bound of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *                upper_bound - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x2, R2 = 0x401D.
 */

extern os_error *xscrollbar_set_upper_bound (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int upper_bound);
extern void scrollbar_set_upper_bound (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int upper_bound);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_set_visible_length()
 *
 * Description:   Sets the visible length of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *                visible_length - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x4, R2 = 0x401D.
 */

extern os_error *xscrollbar_set_visible_length (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int visible_length);
extern void scrollbar_set_visible_length (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int visible_length);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_get_bounds()
 *
 * Description:   Gets the bounds of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *
 * Output:        lower_bound - value of R0 on exit
 *                upper_bound - value of R1 on exit
 *                visible_length - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401E.
 */

extern os_error *xscrollbar_get_bounds (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int *lower_bound,
      int *upper_bound,
      int *visible_length);
extern void scrollbar_get_bounds (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int *lower_bound,
      int *upper_bound,
      int *visible_length);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_get_lower_bound()
 *
 * Description:   Gets the lower bound of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *
 * Output:        lower_bound - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x1, R2 = 0x401E.
 */

extern os_error *xscrollbar_get_lower_bound (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int *lower_bound);
extern int scrollbar_get_lower_bound (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_get_upper_bound()
 *
 * Description:   Gets the upper bound of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *
 * Output:        upper_bound - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x2, R2 = 0x401E.
 */

extern os_error *xscrollbar_get_upper_bound (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int *upper_bound);
extern int scrollbar_get_upper_bound (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_get_visible_length()
 *
 * Description:   Gets the visible length of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *
 * Output:        visible_length - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x4, R2 = 0x401E.
 */

extern os_error *xscrollbar_get_visible_length (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int *visible_length);
extern int scrollbar_get_visible_length (scrollbar_bounds_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_set_value()
 *
 * Description:   Sets the value of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *                value - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x401F.
 */

extern os_error *xscrollbar_set_value (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int value);
extern void scrollbar_set_value (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int value);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_get_value()
 *
 * Description:   Gets the value of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *
 * Output:        value - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4020.
 */

extern os_error *xscrollbar_get_value (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int *value);
extern int scrollbar_get_value (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_set_increments()
 *
 * Description:   Sets the increments of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *                line_increment - value of R4 on entry
 *                page_increment - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4021.
 */

extern os_error *xscrollbar_set_increments (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int line_increment,
      int page_increment);
extern void scrollbar_set_increments (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int line_increment,
      int page_increment);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_set_line_increment()
 *
 * Description:   Sets the line increment of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *                line_increment - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x1, R2 = 0x4021.
 */

extern os_error *xscrollbar_set_line_increment (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int line_increment);
extern void scrollbar_set_line_increment (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int line_increment);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_set_page_increment()
 *
 * Description:   Sets the page increment of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *                page_increment - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x2, R2 = 0x4021.
 */

extern os_error *xscrollbar_set_page_increment (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int page_increment);
extern void scrollbar_set_page_increment (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int page_increment);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_get_increments()
 *
 * Description:   Gets the increments of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *
 * Output:        line_increment - value of R0 on exit
 *                page_increment - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4022.
 */

extern os_error *xscrollbar_get_increments (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int *line_increment,
      int *page_increment);
extern void scrollbar_get_increments (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int *line_increment,
      int *page_increment);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_get_line_increment()
 *
 * Description:   Gets the line increment of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *
 * Output:        line_increment - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x1, R2 = 0x4022.
 */

extern os_error *xscrollbar_get_line_increment (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int *line_increment);
extern int scrollbar_get_line_increment (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_get_page_increment()
 *
 * Description:   Gets the page increment of the Scrollbar
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *
 * Output:        page_increment - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R0 |= 0x2, R2 = 0x4022.
 */

extern os_error *xscrollbar_get_page_increment (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      int *page_increment);
extern int scrollbar_get_page_increment (scrollbar_increments_flags flags,
      toolbox_o window,
      toolbox_c scroll_bar);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_set_event()
 *
 * Description:   Sets the toolbox event for when a Scrollbar changes
 *                position
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *                event_code - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4023.
 */

extern os_error *xscrollbar_set_event (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      bits event_code);
extern void scrollbar_set_event (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      bits event_code);

/* ------------------------------------------------------------------------
 * Function:      scrollbar_get_event()
 *
 * Description:   Gets the toolbox event for when a Scrollbar changes
 *                position
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                scroll_bar - value of R3 on entry
 *
 * Output:        event_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x4024.
 */

extern os_error *xscrollbar_get_event (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar,
      bits *event_code);
extern bits scrollbar_get_event (bits flags,
      toolbox_o window,
      toolbox_c scroll_bar);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
