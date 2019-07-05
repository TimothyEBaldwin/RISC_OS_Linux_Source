#ifndef pipefs_H
#define pipefs_H

/* C header file for PipeFS
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 9 Aug 1994
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
#undef  UpCall_SleepNoMore
#define UpCall_SleepNoMore                      0x7

/************************
 * Constant definitions *
 ************************/
#define error_PIPE_FS_NO_BLOCKING               0x12F00u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      upcall_sleep_no_more()
 *
 * Description:   Informs the TaskWindow module that an open pipe has been
 *                closed or deleted
 *
 * Input:         pollword - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x7.
 */

extern os_error *xupcall_sleep_no_more (int *pollword);
extern void upcall_sleep_no_more (int *pollword);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
