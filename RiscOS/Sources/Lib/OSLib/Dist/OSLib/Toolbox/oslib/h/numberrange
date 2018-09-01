#ifndef numberrange_H
#define numberrange_H

/* C header file for NumberRange
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

#ifndef gadget_H
#include "oslib/gadget.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  NumberRange_SetValue
#define NumberRange_SetValue                    0x340
#undef  NumberRange_GetValue
#define NumberRange_GetValue                    0x341
#undef  NumberRange_SetBounds
#define NumberRange_SetBounds                   0x342
#undef  NumberRange_GetBounds
#define NumberRange_GetBounds                   0x343
#undef  NumberRange_GetComponents
#define NumberRange_GetComponents               0x344

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct numberrange_gadget               numberrange_gadget;
typedef struct numberrange_object               numberrange_object;
typedef struct numberrange_action_value_changed numberrange_action_value_changed;
typedef struct numberrange_action_value_changed_block numberrange_action_value_changed_block;

/********************
 * Type definitions *
 ********************/
struct numberrange_gadget
   {  int lower_bound;
      int upper_bound;
      int step_size;
      int initial_value;
      int precision;
      toolbox_c prev;
      toolbox_c next;
      int display_length;
   };

struct numberrange_object
   {  gadget_OBJECT_MEMBERS
      int lower_bound;
      int upper_bound;
      int step_size;
      int initial_value;
      int precision;
      toolbox_c prev;
      toolbox_c next;
      int display_length;
   };

typedef bits numberrange_bounds_flags;

/* ------------------------------------------------------------------------
 * Type:          numberrange_action_value_changed
 *
 * Description:   Prefer NumberRange_ActionValueChangedBlock
 */

struct numberrange_action_value_changed
   {  int new_value;
   };

struct numberrange_action_value_changed_block
   {  toolbox_ACTION_HEADER_MEMBERS
      int new_value;
   };

/************************
 * Constant definitions *
 ************************/
#define class_NUMBER_RANGE                      ((toolbox_class) 0x340u)
#define numberrange_GENERATE_VALUE_CHANGED      ((gadget_flags) 0x1u)
#define numberrange_WRITABLE                    ((gadget_flags) 0x4u)
#define numberrange_HAS_NUMERICAL_DISPLAY       ((gadget_flags) 0x8u)
#define numberrange_ADJUSTERS                   ((gadget_flags) 0x10u)
#define numberrange_SLIDER_TYPE                 ((gadget_flags) 0xE0u)
#define numberrange_SLIDER_TYPE_SHIFT           5
#define numberrange_SLIDER_TYPE_NONE            0
#define numberrange_SLIDER_TYPE_RIGHT           1
#define numberrange_SLIDER_TYPE_LEFT            2
#define numberrange_RJUSTIFIED                  ((gadget_flags) 0x100u)
#define numberrange_HCENTRED                    ((gadget_flags) 0x200u)
#define numberrange_KNOB_COLOUR                 ((gadget_flags) 0xF000u)
#define numberrange_KNOB_COLOUR_SHIFT           12
#define numberrange_WELL_COLOUR                 ((gadget_flags) 0xF0000u)
#define numberrange_WELL_COLOUR_SHIFT           16
#define numberrange_GET_NUMERICAL_FIELD         0x1u
#define numberrange_GET_LEFT_ADJUSTER           0x2u
#define numberrange_GET_RIGHT_ADJUSTER          0x4u
#define numberrange_GET_SLIDER                  0x8u
#define numberrange_BOUND_LOWER                 ((numberrange_bounds_flags) 0x1u)
#define numberrange_BOUND_UPPER                 ((numberrange_bounds_flags) 0x2u)
#define numberrange_BOUND_STEP                  ((numberrange_bounds_flags) 0x4u)
#define numberrange_BOUND_PRECISION             ((numberrange_bounds_flags) 0x8u)
#define action_NUMBER_RANGE_VALUE_CHANGED       0x8288Du

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      numberrange_set_value()
 *
 * Description:   Calls reason code 832 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                number_range - value of R3 on entry
 *                value - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x340.
 */

extern os_error *xnumberrange_set_value (bits flags,
      toolbox_o window,
      toolbox_c number_range,
      int value);
extern void numberrange_set_value (bits flags,
      toolbox_o window,
      toolbox_c number_range,
      int value);

/* ------------------------------------------------------------------------
 * Function:      numberrange_get_value()
 *
 * Description:   Calls reason code 833 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                number_range - value of R3 on entry
 *
 * Output:        value - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x341.
 */

extern os_error *xnumberrange_get_value (bits flags,
      toolbox_o window,
      toolbox_c number_range,
      int *value);
extern int numberrange_get_value (bits flags,
      toolbox_o window,
      toolbox_c number_range);

/* ------------------------------------------------------------------------
 * Function:      numberrange_set_bounds()
 *
 * Description:   Calls reason code 834 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                number_range - value of R3 on entry
 *                lower_bound - value of R4 on entry
 *                upper_bound - value of R5 on entry
 *                step_size - value of R6 on entry
 *                precision - value of R7 on entry
 *
 * Other notes:   Before entry, R2 = 0x342.
 */

extern os_error *xnumberrange_set_bounds (numberrange_bounds_flags flags,
      toolbox_o window,
      toolbox_c number_range,
      int lower_bound,
      int upper_bound,
      int step_size,
      int precision);
extern void numberrange_set_bounds (numberrange_bounds_flags flags,
      toolbox_o window,
      toolbox_c number_range,
      int lower_bound,
      int upper_bound,
      int step_size,
      int precision);

/* ------------------------------------------------------------------------
 * Function:      numberrange_get_bounds()
 *
 * Description:   Calls reason code 835 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                number_range - value of R3 on entry
 *
 * Output:        lower_bound - value of R0 on exit
 *                upper_bound - value of R1 on exit
 *                step_size - value of R2 on exit
 *                precision - value of R3 on exit
 *
 * Other notes:   Before entry, R2 = 0x343.
 */

extern os_error *xnumberrange_get_bounds (numberrange_bounds_flags flags,
      toolbox_o window,
      toolbox_c number_range,
      int *lower_bound,
      int *upper_bound,
      int *step_size,
      int *precision);
extern void numberrange_get_bounds (numberrange_bounds_flags flags,
      toolbox_o window,
      toolbox_c number_range,
      int *lower_bound,
      int *upper_bound,
      int *step_size,
      int *precision);

/* ------------------------------------------------------------------------
 * Function:      numberrange_get_components()
 *
 * Description:   Calls reason code 836 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                number_range - value of R3 on entry
 *
 * Output:        numeric_field - value of R0 on exit
 *                down - value of R1 on exit
 *                up - value of R2 on exit
 *                slider - value of R3 on exit
 *
 * Other notes:   Before entry, R2 = 0x344.
 */

extern os_error *xnumberrange_get_components (bits flags,
      toolbox_o window,
      toolbox_c number_range,
      toolbox_c *numeric_field,
      toolbox_c *down,
      toolbox_c *up,
      toolbox_c *slider);
extern void numberrange_get_components (bits flags,
      toolbox_o window,
      toolbox_c number_range,
      toolbox_c *numeric_field,
      toolbox_c *down,
      toolbox_c *up,
      toolbox_c *slider);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
