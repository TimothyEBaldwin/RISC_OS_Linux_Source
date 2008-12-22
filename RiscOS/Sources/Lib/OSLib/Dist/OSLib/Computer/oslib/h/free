#ifndef free_H
#define free_H

/* C header file for Free
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 30 May 1995
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

#ifndef fileswitch_H
#include "oslib/fileswitch.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Free_Register
#define Free_Register                           0x444C0
#undef  XFree_Register
#define XFree_Register                          0x644C0
#undef  Free_DeRegister
#define Free_DeRegister                         0x444C1
#undef  XFree_DeRegister
#define XFree_DeRegister                        0x644C1

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      free_register()
 *
 * Description:   Provides an interactive free space display for a filing
 *                system
 *
 * Input:         fs_no - value of R0 on entry
 *                fn - value of R1 on entry
 *                workspace - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x444C0.
 */

extern os_error *xfree_register (fileswitch_fs_no fs_no,
      void const *fn,
      void *workspace);
__swi (0x444C0) void free_register (fileswitch_fs_no fs_no,
      void const *fn,
      void *workspace);

/* ------------------------------------------------------------------------
 * Function:      free_de_register()
 *
 * Description:   Removes the filing system from the list of filing systems
 *                known by the Free module
 *
 * Input:         fs_no - value of R0 on entry
 *                fn - value of R1 on entry
 *                workspace - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x444C1.
 */

extern os_error *xfree_de_register (fileswitch_fs_no fs_no,
      void const *fn,
      void *workspace);
__swi (0x444C1) void free_de_register (fileswitch_fs_no fs_no,
      void const *fn,
      void *workspace);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
