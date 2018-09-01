#ifndef toolaction_H
#define toolaction_H

/* C header file for ToolAction
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:38 2007
 * Tony van der Hoff, tony@mk-net.demon.co.uk, 14 May 2001; OSLib V6.22
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
#undef  ToolAction_ToolAction
#define ToolAction_ToolAction                   0x140140
#undef  XToolAction_ToolAction
#define XToolAction_ToolAction                  0x160140
#undef  ToolAction_SetIdent
#define ToolAction_SetIdent                     0x140140
#undef  ToolAction_GetIdent
#define ToolAction_GetIdent                     0x140141
#undef  ToolAction_SetAction
#define ToolAction_SetAction                    0x140142
#undef  ToolAction_GetAction
#define ToolAction_GetAction                    0x140143
#undef  ToolAction_SetClickShow
#define ToolAction_SetClickShow                 0x140144
#undef  ToolAction_GetClickShow
#define ToolAction_GetClickShow                 0x140145
#undef  ToolAction_SetState
#define ToolAction_SetState                     0x140146
#undef  ToolAction_GetState
#define ToolAction_GetState                     0x140147

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct toolaction_gadget                toolaction_gadget;
typedef struct toolaction_object                toolaction_object;

/********************
 * Type definitions *
 ********************/
struct toolaction_gadget
   {  toolbox_string_reference off_text;
      int off_text_limit;
      toolbox_string_reference on_text;
      int on_text_limit;
      bits click_action;
      toolbox_string_reference select_show;
      bits adjust_action;
      toolbox_string_reference adjust_show;
      toolbox_string_reference fade_text;
      int fade_text_limit;
   };

struct toolaction_object
   {  gadget_OBJECT_MEMBERS
      toolbox_string_reference off_text;
      int off_text_limit;
      toolbox_string_reference on_text;
      int on_text_limit;
      bits click_action;
      toolbox_string_reference select_show;
      bits adjust_action;
      toolbox_string_reference adjust_show;
      toolbox_string_reference fade_text;
      int fade_text_limit;
   };

typedef bits toolaction_ident_flags;

/************************
 * Constant definitions *
 ************************/
#define class_TOOL_ACTION                       ((toolbox_class) 0x4014u)
#define error_TOOL_ACTION_OUT_OF_MEMORY         0x80E920u
#define error_TOOL_ACTION_CANT_CREATE_ICON      0x80E921u
#define error_TOOL_ACTION_CANT_CREATE_OBJECT    0x80E922u
#define toolaction_GENERATE_SELECT              ((gadget_flags) 0x1u)
#define toolaction_IS_TEXT                      ((gadget_flags) 0x2u)
#define toolaction_ON                           ((gadget_flags) 0x4u)
#define toolaction_AUTO_TOGGLE                  ((gadget_flags) 0x8u)
#define toolaction_NO_PRESSED_SPRITE            ((gadget_flags) 0x10u)
#define toolaction_AUTO_REPEAT                  ((gadget_flags) 0x20u)
#define toolaction_SHOW_TRANSIENT               ((gadget_flags) 0x40u)
#define toolaction_SHOW_AS_POP_UP               ((gadget_flags) 0x80u)
#define toolaction_HAS_FADE_SPRITE              ((gadget_flags) 0x100u)
#define action_TOOL_ACTION_SELECTED             0x140140u
#define toolaction_SELECTED_ADJUST              0x1u
#define toolaction_SELECTED_SELECT              0x4u
#define toolaction_IDENT_MASK                   ((toolaction_ident_flags) 0xFu)
#define toolaction_IDENT_OFF                    ((toolaction_ident_flags) 0x0u)
#define toolaction_IDENT_ON                     ((toolaction_ident_flags) 0x1u)
#define toolaction_IDENT_FADE                   ((toolaction_ident_flags) 0x2u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      toolaction_set_ident()
 *
 * Description:   Calls reason code 1311040 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                toolaction - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x140140.
 */

extern os_error *xtoolaction_set_ident (toolaction_ident_flags flags,
      toolbox_o window,
      toolbox_c toolaction);
extern void toolaction_set_ident (toolaction_ident_flags flags,
      toolbox_o window,
      toolbox_c toolaction);

/* ------------------------------------------------------------------------
 * Function:      toolaction_get_ident()
 *
 * Description:   Calls reason code 1311041 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                toolaction - value of R3 on entry
 *
 * Output:        ident - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x140141.
 */

extern os_error *xtoolaction_get_ident (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      toolaction_ident_flags *ident);
extern toolaction_ident_flags toolaction_get_ident (bits flags,
      toolbox_o window,
      toolbox_c toolaction);

/* ------------------------------------------------------------------------
 * Function:      toolaction_set_action()
 *
 * Description:   Calls reason code 1311042 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                toolaction - value of R3 on entry
 *                select_action - value of R4 on entry
 *                adjust_action - value of R5 on entry
 *
 * Other notes:   Before entry, R2 = 0x140142.
 */

extern os_error *xtoolaction_set_action (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      bits select_action,
      bits adjust_action);
extern void toolaction_set_action (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      bits select_action,
      bits adjust_action);

/* ------------------------------------------------------------------------
 * Function:      toolaction_get_action()
 *
 * Description:   Calls reason code 1311043 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                toolaction - value of R3 on entry
 *
 * Output:        select_action - value of R0 on exit
 *                adjust_action - value of R1 on exit
 *
 * Other notes:   Before entry, R2 = 0x140143.
 */

extern os_error *xtoolaction_get_action (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      bits *select_action,
      bits *adjust_action);
extern void toolaction_get_action (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      bits *select_action,
      bits *adjust_action);

/* ------------------------------------------------------------------------
 * Function:      toolaction_set_click_show()
 *
 * Description:   Calls reason code 1311044 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                toolaction - value of R3 on entry
 *                select_show_object - value of R4 on entry
 *                adjust_show_object - value of R5 on entry
 *
 * Other notes:   Before entry, R2 = 0x140144.
 */

extern os_error *xtoolaction_set_click_show (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      toolbox_o select_show_object,
      toolbox_o adjust_show_object);
extern void toolaction_set_click_show (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      toolbox_o select_show_object,
      toolbox_o adjust_show_object);

/* ------------------------------------------------------------------------
 * Function:      toolaction_get_click_show()
 *
 * Description:   Calls reason code 1311045 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                toolaction - value of R3 on entry
 *
 * Output:        select_show_object - value of R0 on exit
 *                adjust_show_object - value of R1 on exit
 *
 * Other notes:   Before entry, R2 = 0x140145.
 */

extern os_error *xtoolaction_get_click_show (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      toolbox_o *select_show_object,
      toolbox_o *adjust_show_object);
extern void toolaction_get_click_show (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      toolbox_o *select_show_object,
      toolbox_o *adjust_show_object);

/* ------------------------------------------------------------------------
 * Function:      toolaction_set_state()
 *
 * Description:   Calls reason code 1311046 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                toolaction - value of R3 on entry
 *                on - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x140146.
 */

extern os_error *xtoolaction_set_state (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      osbool on);
extern void toolaction_set_state (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      osbool on);

/* ------------------------------------------------------------------------
 * Function:      toolaction_get_state()
 *
 * Description:   Calls reason code 1311047 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                toolaction - value of R3 on entry
 *
 * Output:        on - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x140147.
 */

extern os_error *xtoolaction_get_state (bits flags,
      toolbox_o window,
      toolbox_c toolaction,
      osbool *on);
extern osbool toolaction_get_state (bits flags,
      toolbox_o window,
      toolbox_c toolaction);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
