#ifndef scale_H
#define scale_H

/* C header file for Scale
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
#undef  Scale_ClassSWI
#define Scale_ClassSWI                          0x82C00
#undef  XScale_ClassSWI
#define XScale_ClassSWI                         0xA2C00
#undef  Scale_PostFilter
#define Scale_PostFilter                        0x82C01
#undef  XScale_PostFilter
#define XScale_PostFilter                       0xA2C01
#undef  Scale_PreFilter
#define Scale_PreFilter                         0x82C02
#undef  XScale_PreFilter
#define XScale_PreFilter                        0xA2C02
#undef  Scale_GetWindowID
#define Scale_GetWindowID                       0x0
#undef  Scale_SetValue
#define Scale_SetValue                          0x1
#undef  Scale_GetValue
#define Scale_GetValue                          0x2
#undef  Scale_SetBounds
#define Scale_SetBounds                         0x3
#undef  Scale_GetBounds
#define Scale_GetBounds                         0x4
#undef  Scale_SetTitle
#define Scale_SetTitle                          0x5
#undef  Scale_GetTitle
#define Scale_GetTitle                          0x6

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct scale_object                     scale_object;
typedef struct scale_object_template            scale_object_template;
typedef struct scale_action_about_to_be_shown   scale_action_about_to_be_shown;
typedef struct scale_action_apply_factor        scale_action_apply_factor;
typedef struct scale_action_about_to_be_shown_block scale_action_about_to_be_shown_block;
typedef struct scale_action_apply_factor_block  scale_action_apply_factor_block;

/********************
 * Type definitions *
 ********************/
typedef bits scale_flags;

/* ------------------------------------------------------------------------
 * Type:          scale_object
 *
 * Description:   Structure to describe Object for in-memory construction - referenced from Toolbox_Template
 */

struct scale_object
   {  scale_flags flags;
      int lower_bound;
      int upper_bound;
      int step_size;
      toolbox_msg_reference title;
      int title_limit;
      toolbox_string_reference alternative_window_name;
      int std_value [4];
   };

struct scale_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      scale_flags objectflags;
      int lower_bound;
      int upper_bound;
      int step_size;
      toolbox_msg_reference title;
      int title_limit;
      toolbox_string_reference alternative_window_name;
      int std_value [4];
   };

typedef toolbox_full scale_full;

/* ------------------------------------------------------------------------
 * Type:          scale_action_about_to_be_shown
 *
 * Description:   Prefer Scale_ActionAboutToBeShownBlock
 */

struct scale_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         scale_full full;
      }
      position;
   };

/* ------------------------------------------------------------------------
 * Type:          scale_action_apply_factor
 *
 * Description:   Prefer Scale_ActionApplyFactorBlock
 */

struct scale_action_apply_factor
   {  int percent;
   };

struct scale_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         scale_full full;
      }
      position;
   };

typedef toolbox_action_header_base scale_action_dialogue_completed_block;

struct scale_action_apply_factor_block
   {  toolbox_ACTION_HEADER_MEMBERS
      int percent;
   };

/************************
 * Constant definitions *
 ************************/
#define class_SCALE                             ((toolbox_class) 0x82C00u)
#define scale_GENERATE_ABOUT_TO_BE_SHOWN        ((scale_flags) 0x1u)
#define scale_GENERATE_DIALOGUE_COMPLETED       ((scale_flags) 0x2u)
#define scale_INCLUDE_SCALE_TO_FIT              ((scale_flags) 0x4u)
#define scale_PERCENT                           ((toolbox_c) 0x82C000u)
#define scale_STD_VALUE0                        ((toolbox_c) 0x82C001u)
#define scale_STD_VALUE1                        ((toolbox_c) 0x82C002u)
#define scale_STD_VALUE2                        ((toolbox_c) 0x82C003u)
#define scale_STD_VALUE3                        ((toolbox_c) 0x82C004u)
#define scale_CANCEL                            ((toolbox_c) 0x82C005u)
#define scale_SCALE                             ((toolbox_c) 0x82C006u)
#define scale_PERCENT_LABEL                     ((toolbox_c) 0x82C007u)
#define scale_SCALE_LABEL                       ((toolbox_c) 0x82C008u)
#define scale_SCALE_TO_FIT                      ((toolbox_c) 0x82C009u)
#define action_SCALE_ABOUT_TO_BE_SHOWN          0x82C00u
#define action_SCALE_DIALOGUE_COMPLETED         0x82C01u
#define action_SCALE_APPLY_FACTOR               0x82C02u
#define error_SCALE_TASKS_ACTIVE                0x80B700u
#define error_SCALE_ALLOC_FAILED                0x80B701u
#define error_SCALE_SHORT_BUFFER                0x80B702u
#define error_SCALE_NO_SUCH_TASK                0x80B711u
#define error_SCALE_NO_SUCH_METHOD              0x80B712u
#define error_SCALE_NO_SUCH_MISC_OP_METHOD      0x80B713u
#define scale_SET_LOWER_BOUND                   0x1u
#define scale_SET_UPPER_BOUND                   0x2u
#define scale_SET_STEP_SIZE                     0x4u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      scale_get_window_id()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                scale - value of R1 on entry
 *
 * Output:        window - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xscale_get_window_id (bits flags,
      toolbox_o scale,
      toolbox_o *window);
extern toolbox_o scale_get_window_id (bits flags,
      toolbox_o scale);

/* ------------------------------------------------------------------------
 * Function:      scale_set_value()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                scale - value of R1 on entry
 *                value - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x1.
 */

extern os_error *xscale_set_value (bits flags,
      toolbox_o scale,
      int value);
extern void scale_set_value (bits flags,
      toolbox_o scale,
      int value);

/* ------------------------------------------------------------------------
 * Function:      scale_get_value()
 *
 * Description:   Calls reason code 2 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                scale - value of R1 on entry
 *
 * Output:        value - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x2.
 */

extern os_error *xscale_get_value (bits flags,
      toolbox_o scale,
      int *value);
extern int scale_get_value (bits flags,
      toolbox_o scale);

/* ------------------------------------------------------------------------
 * Function:      scale_set_bounds()
 *
 * Description:   Calls reason code 3 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                scale - value of R1 on entry
 *                lower_bound - value of R3 on entry
 *                upper_bound - value of R4 on entry
 *                step_size - value of R5 on entry
 *
 * Other notes:   Before entry, R2 = 0x3.
 */

extern os_error *xscale_set_bounds (bits flags,
      toolbox_o scale,
      int lower_bound,
      int upper_bound,
      int step_size);
extern void scale_set_bounds (bits flags,
      toolbox_o scale,
      int lower_bound,
      int upper_bound,
      int step_size);

/* ------------------------------------------------------------------------
 * Function:      scale_get_bounds()
 *
 * Description:   Calls reason code 4 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                scale - value of R1 on entry
 *
 * Output:        lower_bound - value of R0 on exit
 *                upper_bound - value of R1 on exit
 *                step_size - value of R2 on exit
 *
 * Other notes:   Before entry, R2 = 0x4.
 */

extern os_error *xscale_get_bounds (bits flags,
      toolbox_o scale,
      int *lower_bound,
      int *upper_bound,
      int *step_size);
extern void scale_get_bounds (bits flags,
      toolbox_o scale,
      int *lower_bound,
      int *upper_bound,
      int *step_size);

/* ------------------------------------------------------------------------
 * Function:      scale_set_title()
 *
 * Description:   Calls reason code 5 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                scale - value of R1 on entry
 *                title - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x5.
 */

extern os_error *xscale_set_title (bits flags,
      toolbox_o scale,
      char const *title);
extern void scale_set_title (bits flags,
      toolbox_o scale,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      scale_get_title()
 *
 * Description:   Calls reason code 6 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                scale - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x6.
 */

extern os_error *xscale_get_title (bits flags,
      toolbox_o scale,
      char *buffer,
      int size,
      int *used);
extern int scale_get_title (bits flags,
      toolbox_o scale,
      char *buffer,
      int size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
