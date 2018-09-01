#ifndef writablefield_H
#define writablefield_H

/* C header file for WritableField
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:39 2007
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

#ifndef font_H
#include "oslib/font.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  WritableField_SetValue
#define WritableField_SetValue                  0x200
#undef  WritableField_GetValue
#define WritableField_GetValue                  0x201
#undef  WritableField_SetAllowable
#define WritableField_SetAllowable              0x202
#undef  WritableField_SetFont
#define WritableField_SetFont                   0x204

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct writablefield_gadget             writablefield_gadget;
typedef struct writablefield_object             writablefield_object;
typedef struct writablefield_action_value_changed writablefield_action_value_changed;
typedef struct writablefield_action_value_changed_block writablefield_action_value_changed_block;

/********************
 * Type definitions *
 ********************/
struct writablefield_gadget
   {  toolbox_msg_reference text;
      int text_limit;
      toolbox_msg_reference allowable;
      int allowable_limit;
      toolbox_c prev;
      toolbox_c next;
   };

struct writablefield_object
   {  gadget_OBJECT_MEMBERS
      toolbox_msg_reference text;
      int text_limit;
      toolbox_msg_reference allowable;
      int allowable_limit;
      toolbox_c prev;
      toolbox_c next;
   };

/* ------------------------------------------------------------------------
 * Type:          writablefield_action_value_changed
 *
 * Description:   Prefer WritableField_ActionValueChangedBlock
 */

struct writablefield_action_value_changed
   {  char string [212];
   };

struct writablefield_action_value_changed_block
   {  toolbox_ACTION_HEADER_MEMBERS
      char string [212];
   };

/************************
 * Constant definitions *
 ************************/
#define class_WRITABLE_FIELD                    ((toolbox_class) 0x200u)
#define writablefield_GENERATE_USER_VALUE_CHANGED 0x1u
#define writablefield_GENERATE_SET_VALUE_CHANGED 0x2u
#define writablefield_RJUSTIFIED                0x4u
#define writablefield_HCENTRED                  0x8u
#define writablefield_CONCEAL_TEXT              0x10u
#define action_WRITABLE_FIELD_VALUE_CHANGED     0x82885u
#define writablefield_VALUE_TOO_LONG            0x1u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      writablefield_set_value()
 *
 * Description:   Calls reason code 512 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                writable_field - value of R3 on entry
 *                value - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x200.
 */

extern os_error *xwritablefield_set_value (bits flags,
      toolbox_o window,
      toolbox_c writable_field,
      char const *value);
extern void writablefield_set_value (bits flags,
      toolbox_o window,
      toolbox_c writable_field,
      char const *value);

/* ------------------------------------------------------------------------
 * Function:      writablefield_get_value()
 *
 * Description:   Calls reason code 513 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                writable_field - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x201.
 */

extern os_error *xwritablefield_get_value (bits flags,
      toolbox_o window,
      toolbox_c writable_field,
      char *buffer,
      int size,
      int *used);
extern int writablefield_get_value (bits flags,
      toolbox_o window,
      toolbox_c writable_field,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      writablefield_set_allowable()
 *
 * Description:   Calls reason code 514 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                writable_field - value of R3 on entry
 *                allowed - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x202.
 */

extern os_error *xwritablefield_set_allowable (bits flags,
      toolbox_o window,
      toolbox_c writable_field,
      char const *allowed);
extern void writablefield_set_allowable (bits flags,
      toolbox_o window,
      toolbox_c writable_field,
      char const *allowed);

/* ------------------------------------------------------------------------
 * Function:      writablefield_set_font()
 *
 * Description:   Calls reason code 516 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                writable_field - value of R3 on entry
 *                font_name - value of R4 on entry
 *                xsize - value of R5 on entry
 *                ysize - value of R6 on entry
 *
 * Other notes:   Before entry, R2 = 0x204.
 */

extern os_error *xwritablefield_set_font (bits flags,
      toolbox_o window,
      toolbox_c writable_field,
      char const *font_name,
      int xsize,
      int ysize);
extern void writablefield_set_font (bits flags,
      toolbox_o window,
      toolbox_c writable_field,
      char const *font_name,
      int xsize,
      int ysize);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
