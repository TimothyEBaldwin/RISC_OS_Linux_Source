#ifndef cdfsfiler_H
#define cdfsfiler_H

/* C header file for CDFSFiler
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:54 2007
 * Tom Hughes, tom@compton.nu, 29 June 2003
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

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct cdfsfiler_message_open_player    cdfsfiler_message_open_player;
typedef struct cdfsfiler_full_message_open_player cdfsfiler_full_message_open_player;

/********************
 * Type definitions *
 ********************/
struct cdfsfiler_message_open_player
   {  int drive_number;
      bits flags;
   };

struct cdfsfiler_full_message_open_player
   {  wimp_MESSAGE_HEADER_MEMBERS
      int drive_number;
      bits flags;
   };

/************************
 * Constant definitions *
 ************************/
#define message_CDFS_FILER_OPEN_PLAYER          0x4BE00u

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
