#ifndef shell_H
#define shell_H

/* C header file for Shell
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:29 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 Jun 1995
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
#undef  Shell_Create
#define Shell_Create                            0x405C0
#undef  XShell_Create
#define XShell_Create                           0x605C0
#undef  Shell_Destroy
#define Shell_Destroy                           0x405C1
#undef  XShell_Destroy
#define XShell_Destroy                          0x605C1

/************************
 * Constant definitions *
 ************************/
#define error_SHELL_CREATION                    0x900u
      /*Cannot create a new shell*/
#define error_SHELL_REMOVAL                     0x901u
      /*Cannot remove current shell*/

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
