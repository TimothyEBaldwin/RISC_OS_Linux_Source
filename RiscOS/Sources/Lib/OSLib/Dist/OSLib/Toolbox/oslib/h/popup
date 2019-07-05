#ifndef popup_H
#define popup_H

/* C header file for PopUp
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
#undef  PopUp_SetMenu
#define PopUp_SetMenu                           0x2C0
#undef  PopUp_GetMenu
#define PopUp_GetMenu                           0x2C1

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct popup_gadget                     popup_gadget;
typedef struct popup_object                     popup_object;
typedef struct popup_action_about_to_be_shown   popup_action_about_to_be_shown;
typedef struct popup_action_about_to_be_shown_block popup_action_about_to_be_shown_block;

/********************
 * Type definitions *
 ********************/
struct popup_gadget
   {  toolbox_string_reference menu_name;
   };

struct popup_object
   {  gadget_OBJECT_MEMBERS
      toolbox_string_reference menu_name;
   };

typedef os_coord popup_full;

/* ------------------------------------------------------------------------
 * Type:          popup_action_about_to_be_shown
 *
 * Description:   Prefer PopUp_ActionAboutToBeShownBlock
 */

struct popup_action_about_to_be_shown
   {  toolbox_o menu;
   };

struct popup_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_o menu;
   };

/************************
 * Constant definitions *
 ************************/
#define class_POP_UP                            ((toolbox_class) 0x2C0u)
#define popup_GENERATE_ABOUT_TO_BE_SHOWN        ((gadget_flags) 0x1u)
#define action_POP_UP_ABOUT_TO_BE_SHOWN         0x8288Bu

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      popup_set_menu()
 *
 * Description:   Calls reason code 704 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                popup - value of R3 on entry
 *                menu - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x2C0.
 */

extern os_error *xpopup_set_menu (bits flags,
      toolbox_o window,
      toolbox_c popup,
      toolbox_o menu);
extern void popup_set_menu (bits flags,
      toolbox_o window,
      toolbox_c popup,
      toolbox_o menu);

/* ------------------------------------------------------------------------
 * Function:      popup_get_menu()
 *
 * Description:   Calls reason code 705 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                popup - value of R3 on entry
 *
 * Output:        menu - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x2C1.
 */

extern os_error *xpopup_get_menu (bits flags,
      toolbox_o window,
      toolbox_c popup,
      toolbox_o *menu);
extern toolbox_o popup_get_menu (bits flags,
      toolbox_o window,
      toolbox_c popup);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
