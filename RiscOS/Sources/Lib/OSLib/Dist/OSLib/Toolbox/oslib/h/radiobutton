#ifndef radiobutton_H
#define radiobutton_H

/* C header file for RadioButton
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
#undef  RadioButton_SetLabel
#define RadioButton_SetLabel                    0x180
#undef  RadioButton_GetLabel
#define RadioButton_GetLabel                    0x181
#undef  RadioButton_SetAction
#define RadioButton_SetAction                   0x182
#undef  RadioButton_GetAction
#define RadioButton_GetAction                   0x183
#undef  RadioButton_SetState
#define RadioButton_SetState                    0x184
#undef  RadioButton_GetState
#define RadioButton_GetState                    0x185

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct radiobutton_gadget               radiobutton_gadget;
typedef struct radiobutton_object               radiobutton_object;
typedef struct radiobutton_action_state_changed radiobutton_action_state_changed;
typedef struct radiobutton_action_state_changed_block radiobutton_action_state_changed_block;

/********************
 * Type definitions *
 ********************/
struct radiobutton_gadget
   {  int group;
      toolbox_msg_reference label;
      int label_limit;
      bits action;
   };

struct radiobutton_object
   {  gadget_OBJECT_MEMBERS
      int group;
      toolbox_msg_reference label;
      int label_limit;
      bits action;
   };

/* ------------------------------------------------------------------------
 * Type:          radiobutton_action_state_changed
 *
 * Description:   Prefer RadioButton_ActionStateChangedBlock
 */

struct radiobutton_action_state_changed
   {  osbool on;
      toolbox_c previous_on;
   };

struct radiobutton_action_state_changed_block
   {  toolbox_ACTION_HEADER_MEMBERS
      osbool on;
      toolbox_c previous_on;
   };

/************************
 * Constant definitions *
 ************************/
#define class_RADIO_BUTTON                      ((toolbox_class) 0x180u)
#define radiobutton_GENERATE_STATE_CHANGED      ((gadget_flags) 0x1u)
#define radiobutton_GENERATE_SET_STATE_CHANGED  ((gadget_flags) 0x2u)
#define radiobutton_ON                          ((gadget_flags) 0x4u)
#define action_RADIO_BUTTON_STATE_CHANGED       0x82883u
#define radiobutton_STATE_CHANGED_ADJUST        0x1u
#define radiobutton_STATE_CHANGED_SELECT        0x4u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      radiobutton_set_label()
 *
 * Description:   sets the label text for the specified radio button
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                radio_button - value of R3 on entry
 *                label - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x180.
 */

extern os_error *xradiobutton_set_label (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      char const *label);
extern void radiobutton_set_label (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      char const *label);

/* ------------------------------------------------------------------------
 * Function:      radiobutton_get_label()
 *
 * Description:   Gets the label text for the specified radio button
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                radio_button - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Calls SWI 0x44EC6 with R2 = 0x181.
 */

extern os_error *xradiobutton_get_label (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      char *buffer,
      int size,
      int *used);
extern int radiobutton_get_label (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      radiobutton_set_action()
 *
 * Description:   Calls reason code 386 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                radio_button - value of R3 on entry
 *                action - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x182.
 */

extern os_error *xradiobutton_set_action (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      bits action);
extern void radiobutton_set_action (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      bits action);

/* ------------------------------------------------------------------------
 * Function:      radiobutton_get_action()
 *
 * Description:   Calls reason code 387 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                radio_button - value of R3 on entry
 *
 * Output:        action - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x183.
 */

extern os_error *xradiobutton_get_action (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      bits *action);
extern bits radiobutton_get_action (bits flags,
      toolbox_o window,
      toolbox_c radio_button);

/* ------------------------------------------------------------------------
 * Function:      radiobutton_set_state()
 *
 * Description:   Calls reason code 388 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                radio_button - value of R3 on entry
 *                on - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x184.
 */

extern os_error *xradiobutton_set_state (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      osbool on);
extern void radiobutton_set_state (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      osbool on);

/* ------------------------------------------------------------------------
 * Function:      radiobutton_get_state()
 *
 * Description:   Calls reason code 389 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                radio_button - value of R3 on entry
 *
 * Output:        on - value of R0 on exit (X version only)
 *                on_button - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x185.
 */

extern os_error *xradiobutton_get_state (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      osbool *on,
      toolbox_c *on_button);
extern osbool radiobutton_get_state (bits flags,
      toolbox_o window,
      toolbox_c radio_button,
      toolbox_c *on_button);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
