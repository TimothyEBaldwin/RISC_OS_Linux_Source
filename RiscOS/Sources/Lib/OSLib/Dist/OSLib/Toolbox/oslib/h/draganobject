#ifndef draganobject_H
#define draganobject_H

/* C header file for DragAnObject
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:37 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 18 Jan 1995
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  DragAnObject_Start
#define DragAnObject_Start                      0x49C40
#undef  XDragAnObject_Start
#define XDragAnObject_Start                     0x69C40
#undef  DragAnObject_Stop
#define DragAnObject_Stop                       0x49C41
#undef  XDragAnObject_Stop
#define XDragAnObject_Stop                      0x69C41

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct draganobject_function_           *draganobject_function;

/************************
 * Constant definitions *
 ************************/
#define draganobject_HPOS_LEFT                  0x0u
#define draganobject_HPOS_CENTRE                0x1u
#define draganobject_HPOS_RIGHT                 0x2u
#define draganobject_VPOS_BOTTOM                0x0u
#define draganobject_VPOS_CENTRE                0x4u
#define draganobject_VPOS_TOP                   0x8u
#define draganobject_NO_BOUND                   0x0u
#define draganobject_BOUND_TO_WINDOW            0x10u
#define draganobject_GIVEN_BBOX                 0x20u
#define draganobject_BOUND_OBJECT               0x0u
#define draganobject_BOUND_POINTER              0x40u
#define draganobject_DROP_SHADOW                0x80u
#define draganobject_NO_DITHER                  0x100u
#define draganobject_SWI_FUNCTION               0x0u
#define draganobject_CALL_FUNCTION              0x10000u
#define draganobject_FUNCTION_SVC               0x20000u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      draganobject_start()
 *
 * Description:   Takes a copy of an object and starts a Wimp drag
 *
 * Input:         flags - value of R0 on entry
 *                function - value of R1 on entry
 *                register_block - value of R2 on entry
 *                box - value of R3 on entry
 *                bbox - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x49C40.
 */

extern os_error *xdraganobject_start (bits flags,
      draganobject_function function,
      os_register_block const *register_block,
      os_box const *box,
      os_box const *bbox);
extern void draganobject_start (bits flags,
      draganobject_function function,
      os_register_block const *register_block,
      os_box const *box,
      os_box const *bbox);

/* ------------------------------------------------------------------------
 * Function:      draganobject_stop()
 *
 * Description:   Terminates any current drag operation, and releases
 *                workspace
 *
 * Other notes:   Calls SWI 0x49C41.
 */

extern os_error *xdraganobject_stop (void);
__swi (0x49C41) void draganobject_stop (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
