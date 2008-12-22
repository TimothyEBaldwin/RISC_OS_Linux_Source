#ifndef stronghelp_H
#define stronghelp_H

/* C header file for StrongHelp
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Tom Hughes, tom@compton.nu, 9 Apr 1999
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

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct stronghelp_message_command       stronghelp_message_command;
typedef struct stronghelp_message_command_failed stronghelp_message_command_failed;
typedef struct stronghelp_full_message_command  stronghelp_full_message_command;
typedef struct stronghelp_full_message_command_failed stronghelp_full_message_command_failed;

/********************
 * Type definitions *
 ********************/
struct stronghelp_message_command
   {  char command [236];
   };

struct stronghelp_message_command_failed
   {  char command [236];
   };

struct stronghelp_full_message_command
   {  wimp_MESSAGE_HEADER_MEMBERS
      char command [236];
   };

struct stronghelp_full_message_command_failed
   {  wimp_MESSAGE_HEADER_MEMBERS
      char command [236];
   };

/************************
 * Constant definitions *
 ************************/
#define message_STRONG_HELP_COMMAND             0x43B00u
#define message_STRONG_HELP_COMMAND_FAILED      0x43B01u

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
