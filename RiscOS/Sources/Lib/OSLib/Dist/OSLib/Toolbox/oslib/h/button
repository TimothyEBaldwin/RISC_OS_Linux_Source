#ifndef button_H
#define button_H

/* C header file for Button
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

#ifndef gadget_H
#include "oslib/gadget.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Button_GetFlags
#define Button_GetFlags                         0x3C0
#undef  Button_SetFlags
#define Button_SetFlags                         0x3C1
#undef  Button_SetValue
#define Button_SetValue                         0x3C2
#undef  Button_GetValue
#define Button_GetValue                         0x3C3
#undef  Button_SetValidation
#define Button_SetValidation                    0x3C4
#undef  Button_GetValidation
#define Button_GetValidation                    0x3C5
#undef  Button_SetFont
#define Button_SetFont                          0x3C6

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct button_gadget                    button_gadget;
typedef struct button_object                    button_object;

/********************
 * Type definitions *
 ********************/
struct button_gadget
   {  bits flags;
      toolbox_msg_reference value;
      int value_limit;
      toolbox_string_reference validation;
      int validation_limit;
   };

struct button_object
   {  gadget_OBJECT_MEMBERS
      bits button_flags;
      toolbox_msg_reference value;
      int value_limit;
      toolbox_string_reference validation;
      int validation_limit;
   };

/************************
 * Constant definitions *
 ************************/
#define class_BUTTON                            ((toolbox_class) 0x3C0u)
#define button_TASK_SPRITE_AREA                 0x1u
#define button_ALLOW_MENU_CLICKS                0x2u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      button_get_flags()
 *
 * Description:   Calls reason code 960 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                button - value of R3 on entry
 *
 * Output:        icon_flags - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x3C0.
 */

extern os_error *xbutton_get_flags (bits flags,
      toolbox_o window,
      toolbox_c button,
      bits *icon_flags);
extern bits button_get_flags (bits flags,
      toolbox_o window,
      toolbox_c button);

/* ------------------------------------------------------------------------
 * Function:      button_set_flags()
 *
 * Description:   Calls reason code 961 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                button - value of R3 on entry
 *                clear_word - value of R4 on entry
 *                eor_word - value of R5 on entry
 *
 * Other notes:   Before entry, R2 = 0x3C1.
 */

extern os_error *xbutton_set_flags (bits flags,
      toolbox_o window,
      toolbox_c button,
      int clear_word,
      int eor_word);
extern void button_set_flags (bits flags,
      toolbox_o window,
      toolbox_c button,
      int clear_word,
      int eor_word);

/* ------------------------------------------------------------------------
 * Function:      button_set_value()
 *
 * Description:   Calls reason code 962 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                button - value of R3 on entry
 *                value - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x3C2.
 */

extern os_error *xbutton_set_value (bits flags,
      toolbox_o window,
      toolbox_c button,
      char const *value);
extern void button_set_value (bits flags,
      toolbox_o window,
      toolbox_c button,
      char const *value);

/* ------------------------------------------------------------------------
 * Function:      button_get_value()
 *
 * Description:   Calls reason code 963 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                button - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x3C3.
 */

extern os_error *xbutton_get_value (bits flags,
      toolbox_o window,
      toolbox_c button,
      char *buffer,
      int size,
      int *used);
extern int button_get_value (bits flags,
      toolbox_o window,
      toolbox_c button,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      button_set_validation()
 *
 * Description:   Calls reason code 964 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                button - value of R3 on entry
 *                validation - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x3C4.
 */

extern os_error *xbutton_set_validation (bits flags,
      toolbox_o window,
      toolbox_c button,
      char const *validation);
extern void button_set_validation (bits flags,
      toolbox_o window,
      toolbox_c button,
      char const *validation);

/* ------------------------------------------------------------------------
 * Function:      button_get_validation()
 *
 * Description:   Calls reason code 965 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                button - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x3C5.
 */

extern os_error *xbutton_get_validation (bits flags,
      toolbox_o window,
      toolbox_c button,
      char *buffer,
      int size,
      int *used);
extern int button_get_validation (bits flags,
      toolbox_o window,
      toolbox_c button,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      button_set_font()
 *
 * Description:   Calls reason code 966 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                button - value of R3 on entry
 *                font_name - value of R4 on entry
 *                xsize - value of R5 on entry
 *                ysize - value of R6 on entry
 *
 * Other notes:   Before entry, R2 = 0x3C6.
 */

extern os_error *xbutton_set_font (bits flags,
      toolbox_o window,
      toolbox_c button,
      char const *font_name,
      int xsize,
      int ysize);
extern void button_set_font (bits flags,
      toolbox_o window,
      toolbox_c button,
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
