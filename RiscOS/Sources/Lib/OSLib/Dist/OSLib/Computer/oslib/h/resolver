#ifndef resolver_H
#define resolver_H

/* C header file for Resolver
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Tom Hughes, tom@compton.nu, 21 Sep 2002
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

#ifndef socket_H
#include "oslib/socket.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Resolver_GetHostByName
#define Resolver_GetHostByName                  0x46000
#undef  XResolver_GetHostByName
#define XResolver_GetHostByName                 0x66000

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct resolver_host_details            resolver_host_details;

/********************
 * Type definitions *
 ********************/
struct resolver_host_details
   {  char *name;
      char **aliases;
      socket_af address_type;
      int address_size;
      byte **addresses;
   };

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      resolver_get_host_by_name()
 *
 * Description:   Lookup a hostname string (single-tasking)
 *
 * Input:         host_name - value of R1 on entry
 *
 * Output:        host_details - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x46000.
 */

extern os_error *xresolver_get_host_by_name (char const *host_name,
      resolver_host_details **host_details);
extern resolver_host_details *resolver_get_host_by_name (char const *host_name);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
