#ifndef stringset_H
#define stringset_H

/* C header file for StringSet
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
#undef  StringSet_SetAvailable
#define StringSet_SetAvailable                  0x380
#undef  StringSet_SetSelected
#define StringSet_SetSelected                   0x382
#undef  StringSet_SetSelectedString
#define StringSet_SetSelectedString             0x0
#undef  StringSet_SetSelectedIndex
#define StringSet_SetSelectedIndex              0x1
#undef  StringSet_GetSelected
#define StringSet_GetSelected                   0x383
#undef  StringSet_GetSelectedString
#define StringSet_GetSelectedString             0x0
#undef  StringSet_GetSelectedIndex
#define StringSet_GetSelectedIndex              0x1
#undef  StringSet_SetAllowable
#define StringSet_SetAllowable                  0x384
#undef  StringSet_GetComponents
#define StringSet_GetComponents                 0x386

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct stringset_gadget                 stringset_gadget;
typedef struct stringset_object                 stringset_object;
typedef struct stringset_action_value_changed   stringset_action_value_changed;
typedef struct stringset_action_value_changed_block stringset_action_value_changed_block;

/********************
 * Type definitions *
 ********************/
struct stringset_gadget
   {  toolbox_msg_reference string_set;
      toolbox_msg_reference title;
      toolbox_msg_reference initial_selected_string;
      int selected_string_limit;
      toolbox_msg_reference allowable;
      int allowable_limit;
      toolbox_c prev;
      toolbox_c next;
   };

struct stringset_object
   {  gadget_OBJECT_MEMBERS
      toolbox_msg_reference string_set;
      toolbox_msg_reference title;
      toolbox_msg_reference initial_selected_string;
      int selected_string_limit;
      toolbox_msg_reference allowable;
      int allowable_limit;
      toolbox_c prev;
      toolbox_c next;
   };

/* ------------------------------------------------------------------------
 * Type:          stringset_action_value_changed
 *
 * Description:   Prefer StringSet_ActionValueChangedBlock
 */

struct stringset_action_value_changed
   {  char value [216];
   };

struct stringset_action_value_changed_block
   {  toolbox_ACTION_HEADER_MEMBERS
      char value [216];
   };

typedef toolbox_action_header_base stringset_action_about_to_be_shown_block;

/************************
 * Constant definitions *
 ************************/
#define class_STRING_SET                        ((toolbox_class) 0x380u)
#define stringset_GENERATE_USER_VALUE_CHANGED   ((gadget_flags) 0x1u)
#define stringset_GENERATE_SET_VALUE_CHANGED    ((gadget_flags) 0x2u)
#define stringset_WRITABLE                      ((gadget_flags) 0x4u)
#define stringset_GENERATE_ABOUT_TO_BE_SHOWN    ((gadget_flags) 0x8u)
#define stringset_NO_DISPLAY                    ((gadget_flags) 0x10u)
#define stringset_JUSTIFICATION                 ((gadget_flags) 0x60u)
#define stringset_JUSTIFICATION_SHIFT           5
#define stringset_JUSTIFICATION_LEFT            0x0u
#define stringset_JUSTIFICATION_RIGHT           0x1u
#define stringset_JUSTIFICATION_CENTRED         0x2u
#define stringset_GET_ALPHANUMERIC_FIELD        0x1u
#define stringset_GET_POP_UP_MENU               0x2u
#define action_STRING_SET_VALUE_CHANGED         0x8288Eu
#define action_STRING_SET_ABOUT_TO_BE_SHOWN     0x8288Fu
#define stringset_VALUE_TOO_LONG                0x1u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      stringset_set_available()
 *
 * Description:   Calls reason code 896 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                string_set - value of R3 on entry
 *                set - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x380.
 */

extern os_error *xstringset_set_available (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      char const *set);
extern void stringset_set_available (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      char const *set);

/* ------------------------------------------------------------------------
 * Function:      stringset_set_selected_string()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                string_set - value of R3 on entry
 *                selection - value of R4 on entry
 *
 * Other notes:   Before entry, R0 |= 0x0, R2 = 0x382.
 */

extern os_error *xstringset_set_selected_string (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      char const *selection);
extern void stringset_set_selected_string (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      char const *selection);

/* ------------------------------------------------------------------------
 * Function:      stringset_set_selected_index()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                string_set - value of R3 on entry
 *                index - value of R4 on entry
 *
 * Other notes:   Before entry, R0 |= 0x1, R2 = 0x382.
 */

extern os_error *xstringset_set_selected_index (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      int index);
extern void stringset_set_selected_index (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      int index);

/* ------------------------------------------------------------------------
 * Function:      stringset_get_selected_string()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                string_set - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Before entry, R0 |= 0x0, R2 = 0x383.
 */

extern os_error *xstringset_get_selected_string (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      char *buffer,
      int size,
      int *used);
extern int stringset_get_selected_string (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      stringset_get_selected_index()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                string_set - value of R3 on entry
 *
 * Output:        index - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R0 |= 0x1, R2 = 0x383.
 */

extern os_error *xstringset_get_selected_index (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      int *index);
extern int stringset_get_selected_index (bits flags,
      toolbox_o window,
      toolbox_c string_set);

/* ------------------------------------------------------------------------
 * Function:      stringset_set_allowable()
 *
 * Description:   Calls reason code 900 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                string_set - value of R3 on entry
 *                allowable - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x384.
 */

extern os_error *xstringset_set_allowable (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      char const *allowable);
extern void stringset_set_allowable (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      char const *allowable);

/* ------------------------------------------------------------------------
 * Function:      stringset_get_components()
 *
 * Description:   Calls reason code 902 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                string_set - value of R3 on entry
 *
 * Output:        alphanumeric_field - value of R0 on exit
 *                popup_menu - value of R1 on exit
 *
 * Other notes:   Before entry, R2 = 0x386.
 */

extern os_error *xstringset_get_components (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      toolbox_c *alphanumeric_field,
      toolbox_c *popup_menu);
extern void stringset_get_components (bits flags,
      toolbox_o window,
      toolbox_c string_set,
      toolbox_c *alphanumeric_field,
      toolbox_c *popup_menu);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
