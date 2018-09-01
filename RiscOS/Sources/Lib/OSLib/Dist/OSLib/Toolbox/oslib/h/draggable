#ifndef draggable_H
#define draggable_H

/* C header file for Draggable
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

#ifndef window_H
#include "oslib/window.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Draggable_SetSprite
#define Draggable_SetSprite                     0x280
#undef  Draggable_GetSprite
#define Draggable_GetSprite                     0x281
#undef  Draggable_SetText
#define Draggable_SetText                       0x282
#undef  Draggable_GetText
#define Draggable_GetText                       0x283
#undef  Draggable_SetState
#define Draggable_SetState                      0x284
#undef  Draggable_GetState
#define Draggable_GetState                      0x285

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct draggable_gadget                 draggable_gadget;
typedef struct draggable_object                 draggable_object;
typedef struct draggable_action_drag_ended      draggable_action_drag_ended;
typedef struct draggable_action_drag_ended_block draggable_action_drag_ended_block;

/********************
 * Type definitions *
 ********************/
struct draggable_gadget
   {  toolbox_msg_reference text;
      int text_limit;
      toolbox_string_reference sprite_name;
      int sprite_limit;
   };

struct draggable_object
   {  gadget_OBJECT_MEMBERS
      toolbox_msg_reference text;
      int text_limit;
      toolbox_string_reference sprite_name;
      int sprite_limit;
   };

/* ------------------------------------------------------------------------
 * Type:          draggable_action_drag_ended
 *
 * Description:   Prefer Draggable_ActionDragEndedBlock
 */

struct draggable_action_drag_ended
   {  union
      {  struct
         {  wimp_w w;
            wimp_i i;
         }
         wimp;
         struct
         {  toolbox_o o;
            toolbox_c c;
         }
         toolbox;
      }
      ids;
      os_coord pos;
   };

typedef toolbox_action_header_base draggable_action_drag_started_block;

struct draggable_action_drag_ended_block
   {  toolbox_ACTION_HEADER_MEMBERS
      union
      {  struct
         {  wimp_w w;
            wimp_i i;
         }
         wimp;
         struct
         {  toolbox_o o;
            toolbox_c c;
         }
         toolbox;
      }
      ids;
      os_coord pos;
   };

/************************
 * Constant definitions *
 ************************/
#define class_DRAGGABLE                         ((toolbox_class) 0x280u)
#define draggable_GENERATE_DRAG_STARTED         ((gadget_flags) 0x1u)
#define draggable_SPRITE                        ((gadget_flags) 0x2u)
#define draggable_TEXT                          ((gadget_flags) 0x4u)
#define draggable_TYPE                          ((gadget_flags) 0x38u)
#define draggable_TYPE_SHIFT                    3
#define draggable_TYPE_DRAG                     0x0u
#define draggable_TYPE_CLICK_DRAG               0x1u
#define draggable_TYPE_CLICK_DOUBLE_DRAG        0x2u
#define draggable_USE_TOOLBOX_IDS               ((gadget_flags) 0x40u)
#define draggable_DROP_SHADOW                   ((gadget_flags) 0x80u)
#define draggable_NO_DITHER                     ((gadget_flags) 0x100u)
#define action_DRAGGABLE_DRAG_STARTED           0x82887u
#define action_DRAGGABLE_DRAG_ENDED             0x82888u
#define draggable_DRAG_STARTED_ADJUST           0x1u
#define draggable_DRAG_STARTED_SELECT           0x4u
#define draggable_DRAG_STARTED_SHIFT            0x8u
#define draggable_DRAG_STARTED_CTRL             0x10u
#define draggable_DRAG_ENDED_TOOLBOX_IDS        0x1u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      draggable_set_sprite()
 *
 * Description:   Calls reason code 640 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                draggable - value of R3 on entry
 *                sprite_name - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x280.
 */

extern os_error *xdraggable_set_sprite (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      char const *sprite_name);
extern void draggable_set_sprite (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      char const *sprite_name);

/* ------------------------------------------------------------------------
 * Function:      draggable_get_sprite()
 *
 * Description:   Calls reason code 641 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                draggable - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x281.
 */

extern os_error *xdraggable_get_sprite (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      char *buffer,
      int size,
      int *used);
extern int draggable_get_sprite (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      draggable_set_text()
 *
 * Description:   Calls reason code 642 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                draggable - value of R3 on entry
 *                text - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x282.
 */

extern os_error *xdraggable_set_text (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      char const *text);
extern void draggable_set_text (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      char const *text);

/* ------------------------------------------------------------------------
 * Function:      draggable_get_text()
 *
 * Description:   Calls reason code 643 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                draggable - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *
 * Output:        used - value of R5 on exit (X version only)
 *
 * Returns:       R5 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x283.
 */

extern os_error *xdraggable_get_text (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      char *buffer,
      int size,
      int *used);
extern int draggable_get_text (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      draggable_set_state()
 *
 * Description:   Calls reason code 644 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                draggable - value of R3 on entry
 *                state - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x284.
 */

extern os_error *xdraggable_set_state (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      int state);
extern void draggable_set_state (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      int state);

/* ------------------------------------------------------------------------
 * Function:      draggable_get_state()
 *
 * Description:   Calls reason code 645 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 *                draggable - value of R3 on entry
 *
 * Output:        state - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x285.
 */

extern os_error *xdraggable_get_state (bits flags,
      toolbox_o window,
      toolbox_c draggable,
      int *state);
extern int draggable_get_state (bits flags,
      toolbox_o window,
      toolbox_c draggable);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
