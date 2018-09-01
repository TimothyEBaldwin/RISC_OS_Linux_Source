#ifndef windowsupportexternal_H
#define windowsupportexternal_H

/* C header file for WindowSupportExternal
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:39 2007
 * Simon Middleton, Uniqueway Ltd; Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 June 1995
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

#ifndef window_H
#include "oslib/window.h"
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
#undef  Window_SupportExternal
#define Window_SupportExternal                  0x82887
#undef  XWindow_SupportExternal
#define XWindow_SupportExternal                 0xA2887
#undef  WindowSupportExternal_CreateIcon
#define WindowSupportExternal_CreateIcon        0x0
#undef  WindowSupportExternal_CreateObject
#define WindowSupportExternal_CreateObject      0x2
#undef  WindowSupportExternal_CreateGadget
#define WindowSupportExternal_CreateGadget      0x3
#undef  WindowSupportExternal_Alloc
#define WindowSupportExternal_Alloc             0x4
#undef  WindowSupportExternal_Free
#define WindowSupportExternal_Free              0x5
#undef  WindowSupportExternal_Realloc
#define WindowSupportExternal_Realloc           0x6

/************************
 * Constant definitions *
 ************************/
#define windowsupportexternal_HANDLER_ADD       1
#define windowsupportexternal_HANDLER_REMOVE    2
#define windowsupportexternal_HANDLER_FADE      3
#define windowsupportexternal_HANDLER_METHOD    4
#define windowsupportexternal_HANDLER_CLICK     6
#define windowsupportexternal_HANDLER_PLOT      9
#define windowsupportexternal_HANDLER_SET_FOCUS 10
#define windowsupportexternal_HANDLER_MOVE      11
#define windowsupportexternal_HANDLER_POST_ADD  12

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      windowsupportexternal_create_icon()
 *
 * Description:   Creates an icon, handling window module plotting mode
 *
 * Input:         flags - value of R0 on entry
 *                icon - value of R2 on entry
 *
 * Output:        i - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x82887 with R1 = 0x0.
 */

extern os_error *xwindowsupportexternal_create_icon (bits flags,
      wimp_icon_create const *icon,
      wimp_i *i);
extern wimp_i windowsupportexternal_create_icon (bits flags,
      wimp_icon_create const *icon);

/* ------------------------------------------------------------------------
 * Function:      windowsupportexternal_create_object()
 *
 * Description:   Creates an object, handling window module plotting mode
 *
 * Input:         flags - value of R0 on entry
 *                id - value of R2 on entry
 *
 * Output:        obj - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x82887 with R1 = 0x2.
 */

extern os_error *xwindowsupportexternal_create_object (toolbox_create_flags flags,
      toolbox_id id,
      toolbox_o *obj);
extern toolbox_o windowsupportexternal_create_object (toolbox_create_flags flags,
      toolbox_id id);

/* ------------------------------------------------------------------------
 * Function:      windowsupportexternal_create_gadget()
 *
 * Description:   Creates a gadget
 *
 * Input:         flags - value of R0 on entry
 *                obj - value of R2 on entry
 *                gadget - value of R3 on entry
 *                tag - value of R4 on entry
 *
 * Output:        cmp - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x82887 with R1 = 0x3.
 */

extern os_error *xwindowsupportexternal_create_gadget (bits flags,
      toolbox_o obj,
      gadget_object const *gadget,
      int tag,
      toolbox_c *cmp);
extern toolbox_c windowsupportexternal_create_gadget (bits flags,
      toolbox_o obj,
      gadget_object const *gadget,
      int tag);

/* ------------------------------------------------------------------------
 * Function:      windowsupportexternal_alloc()
 *
 * Description:   Allocates memory via window module
 *
 * Input:         flags - value of R0 on entry
 *                size - value of R2 on entry
 *
 * Output:        data - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x82887 with R1 = 0x4.
 */

extern os_error *xwindowsupportexternal_alloc (bits flags,
      int size,
      void **data);
extern void *windowsupportexternal_alloc (bits flags,
      int size);

/* ------------------------------------------------------------------------
 * Function:      windowsupportexternal_free()
 *
 * Description:   Frees memory via window module
 *
 * Input:         flags - value of R0 on entry
 *                data - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x82887 with R1 = 0x5.
 */

extern os_error *xwindowsupportexternal_free (bits flags,
      void *data);
extern void windowsupportexternal_free (bits flags,
      void *data);

/* ------------------------------------------------------------------------
 * Function:      windowsupportexternal_realloc()
 *
 * Description:   Extends memory allocated via window module
 *
 * Input:         flags - value of R0 on entry
 *                data - value of R2 on entry
 *                size_increase - value of R3 on entry
 *
 * Output:        data_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x82887 with R1 = 0x6.
 */

extern os_error *xwindowsupportexternal_realloc (bits flags,
      void *data,
      int size_increase,
      void **data_out);
extern void *windowsupportexternal_realloc (bits flags,
      void *data,
      int size_increase);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
