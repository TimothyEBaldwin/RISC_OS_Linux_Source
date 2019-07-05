#ifndef colourdbox_H
#define colourdbox_H

/* C header file for ColourDbox
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:37 2007
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

#ifndef colourpicker_H
#include "oslib/colourpicker.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  ColourDbox_ClassSWI
#define ColourDbox_ClassSWI                     0x829C0
#undef  XColourDbox_ClassSWI
#define XColourDbox_ClassSWI                    0xA29C0
#undef  ColourDbox_PostFilter
#define ColourDbox_PostFilter                   0x829C1
#undef  XColourDbox_PostFilter
#define XColourDbox_PostFilter                  0xA29C1
#undef  ColourDbox_PreFilter
#define ColourDbox_PreFilter                    0x829C2
#undef  XColourDbox_PreFilter
#define XColourDbox_PreFilter                   0xA29C2
#undef  ColourDbox_GetWimpHandle
#define ColourDbox_GetWimpHandle                0x0
#undef  ColourDbox_GetDialogueHandle
#define ColourDbox_GetDialogueHandle            0x1
#undef  ColourDbox_SetColour
#define ColourDbox_SetColour                    0x2
#undef  ColourDbox_GetColour
#define ColourDbox_GetColour                    0x3
#undef  ColourDbox_SetColourModel
#define ColourDbox_SetColourModel               0x4
#undef  ColourDbox_GetColourModel
#define ColourDbox_GetColourModel               0x5
#undef  ColourDbox_SetNoneAvailable
#define ColourDbox_SetNoneAvailable             0x6
#undef  ColourDbox_GetNoneAvailable
#define ColourDbox_GetNoneAvailable             0x7

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct colourdbox_object                colourdbox_object;
typedef struct colourdbox_object_template       colourdbox_object_template;
typedef struct colourdbox_action_about_to_be_shown colourdbox_action_about_to_be_shown;
typedef struct colourdbox_action_about_to_be_shown_block colourdbox_action_about_to_be_shown_block;
typedef struct colourdbox_action_colour_selected_block colourdbox_action_colour_selected_block;
typedef struct colourdbox_colour_model          colourdbox_colour_model;
typedef struct colourdbox_colour_model_base     colourdbox_colour_model_base;
typedef struct colourdbox_action_dialogue_completed colourdbox_action_dialogue_completed;
typedef struct colourdbox_action_colour_selected colourdbox_action_colour_selected;

/********************
 * Type definitions *
 ********************/
typedef bits colourdbox_flags;

typedef bits colourdbox_colour_flags;

/* ------------------------------------------------------------------------
 * Type:          colourdbox_object
 *
 * Description:   Structure to describe Object for in-memory construction - referenced from Toolbox_Template
 */

struct colourdbox_object
   {  colourdbox_flags flags;
      toolbox_msg_reference title;
      int title_limit;
      os_colour colour;
   };

struct colourdbox_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      colourdbox_flags objectflags;
      toolbox_msg_reference title;
      int title_limit;
      os_colour colour;
   };

typedef toolbox_full colourdbox_full;

struct colourdbox_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         colourdbox_full full;
      }
      position;
   };

struct colourdbox_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         colourdbox_full full;
      }
      position;
   };

typedef toolbox_action_header_base colourdbox_action_dialogue_completed_block;

struct colourdbox_action_colour_selected_block
   {  toolbox_ACTION_HEADER_MEMBERS
      os_colour colour;
      int block_size;
      int info [50];
   };

#define colourdbox_COLOUR_MODEL_MEMBERS \
   int size;

/* Base colourdbox_colour_model structure without variable part */
struct colourdbox_colour_model_base
   {  colourdbox_COLOUR_MODEL_MEMBERS
   };

/* legacy structure */
struct colourdbox_colour_model
   {  colourdbox_COLOUR_MODEL_MEMBERS
      int info [UNKNOWN];
   };

#define colourdbox_COLOUR_MODEL(N) \
   struct \
      {  colourdbox_COLOUR_MODEL_MEMBERS \
         int info [N]; \
      }

#define colourdbox_SIZEOF_COLOUR_MODEL(N) \
   (offsetof (colourdbox_colour_model, info) + \
         (N)*sizeof ((colourdbox_colour_model *) NULL)->info)

typedef bits colourdbox_dialogue_completed_flags;

struct colourdbox_action_dialogue_completed
   {  colourdbox_dialogue_completed_flags flags;
   };

struct colourdbox_action_colour_selected
   {  os_colour colour;
      int size;
      int info [50];
   };

/************************
 * Constant definitions *
 ************************/
#define class_COLOUR_DBOX                       ((toolbox_class) 0x829C0u)
#define error_COLOUR_DBOX_TASKS_ACTIVE          0x80AE00u
#define error_COLOUR_DBOX_ALLOC_FAILED          0x80AE01u
#define error_COLOUR_DBOX_SHORT_BUFFER          0x80AE02u
#define error_COLOUR_DBOX_NO_SUCH_TASK          0x80AE11u
#define error_COLOUR_DBOX_NO_SUCH_METHOD        0x80AE12u
#define error_COLOUR_DBOX_NO_SUCH_MISC_OP_METHOD 0x80AE13u
#define colourdbox_GENERATE_ABOUT_TO_BE_SHOWN   ((colourdbox_flags) 0x1u)
#define colourdbox_GENERATE_DIALOGUE_COMPLETED  ((colourdbox_flags) 0x2u)
#define colourdbox_INCLUDE_NONE_BUTTON          ((colourdbox_flags) 0x4u)
#define colourdbox_SELECT_NONE_BUTTON           ((colourdbox_flags) 0x8u)
#define colourdbox_COLOUR_TRANSPARENT           ((colourdbox_colour_flags) 0x1u)
#define action_COLOUR_DBOX_ABOUT_TO_BE_SHOWN    0x829C0u
#define action_COLOUR_DBOX_DIALOGUE_COMPLETED   0x829C1u
#define action_COLOUR_DBOX_COLOUR_SELECTED      0x829C2u
#define colourdbox_DIALOGUE_COMPLETED_COLOUR_CHOICE ((colourdbox_dialogue_completed_flags) 0x1u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      colourdbox_get_wimp_handle()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                colour_dbox - value of R1 on entry
 *
 * Output:        w - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xcolourdbox_get_wimp_handle (bits flags,
      toolbox_o colour_dbox,
      wimp_w *w);
extern wimp_w colourdbox_get_wimp_handle (bits flags,
      toolbox_o colour_dbox);

/* ------------------------------------------------------------------------
 * Function:      colourdbox_get_dialogue_handle()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                colour_dbox - value of R1 on entry
 *
 * Output:        d - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x1.
 */

extern os_error *xcolourdbox_get_dialogue_handle (bits flags,
      toolbox_o colour_dbox,
      colourpicker_d *d);
extern colourpicker_d colourdbox_get_dialogue_handle (bits flags,
      toolbox_o colour_dbox);

/* ------------------------------------------------------------------------
 * Function:      colourdbox_set_colour()
 *
 * Description:   Calls reason code 2 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                colour_dbox - value of R1 on entry
 *                colour - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x2.
 */

extern os_error *xcolourdbox_set_colour (colourdbox_colour_flags flags,
      toolbox_o colour_dbox,
      colourpicker_colour const *colour);
extern void colourdbox_set_colour (colourdbox_colour_flags flags,
      toolbox_o colour_dbox,
      colourpicker_colour const *colour);

/* ------------------------------------------------------------------------
 * Function:      colourdbox_get_colour()
 *
 * Description:   Calls reason code 3 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                colour_dbox - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        flags_out - value of R0 on exit
 *                used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x3.
 */

extern os_error *xcolourdbox_get_colour (bits flags,
      toolbox_o colour_dbox,
      colourpicker_colour *buffer,
      int size,
      colourdbox_colour_flags *flags_out,
      int *used);
extern int colourdbox_get_colour (bits flags,
      toolbox_o colour_dbox,
      colourpicker_colour *buffer,
      int size,
      colourdbox_colour_flags *flags_out);

/* ------------------------------------------------------------------------
 * Function:      colourdbox_set_colour_model()
 *
 * Description:   Calls reason code 4 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                colour_dbox - value of R1 on entry
 *                model - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x4.
 */

extern os_error *xcolourdbox_set_colour_model (bits flags,
      toolbox_o colour_dbox,
      colourdbox_colour_model const *model);
extern void colourdbox_set_colour_model (bits flags,
      toolbox_o colour_dbox,
      colourdbox_colour_model const *model);

/* ------------------------------------------------------------------------
 * Function:      colourdbox_get_colour_model()
 *
 * Description:   Calls reason code 5 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                colour_dbox - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x5.
 */

extern os_error *xcolourdbox_get_colour_model (bits flags,
      toolbox_o colour_dbox,
      colourdbox_colour_model *buffer,
      int size,
      int *used);
extern int colourdbox_get_colour_model (bits flags,
      toolbox_o colour_dbox,
      colourdbox_colour_model *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      colourdbox_set_none_available()
 *
 * Description:   Sets whether a 'None' option appears in the specified
 *                ColourDbox
 *
 * Input:         flags - value of R0 on entry
 *                colour_dbox - value of R1 on entry
 *                none - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x6.
 */

extern os_error *xcolourdbox_set_none_available (bits flags,
      toolbox_o colour_dbox,
      osbool none);
extern void colourdbox_set_none_available (bits flags,
      toolbox_o colour_dbox,
      osbool none);

/* ------------------------------------------------------------------------
 * Function:      colourdbox_get_none_available()
 *
 * Description:   Gets whether the 'None' option is available for the
 *                specified ColourDbox
 *
 * Input:         flags - value of R0 on entry
 *                colour_dbox - value of R1 on entry
 *
 * Output:        none - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x7.
 */

extern os_error *xcolourdbox_get_none_available (bits flags,
      toolbox_o colour_dbox,
      osbool *none);
extern osbool colourdbox_get_none_available (bits flags,
      toolbox_o colour_dbox);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
