#ifndef keyboardshortcut_H
#define keyboardshortcut_H

/* C header file for KeyboardShortcut
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:39 2007
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct keyboardshortcut_object          keyboardshortcut_object;

/********************
 * Type definitions *
 ********************/
typedef bits keyboardshortcut_flags;

struct keyboardshortcut_object
   {  keyboardshortcut_flags flags;
      int c;
      bits action;
      toolbox_string_reference name;
   };

/************************
 * Constant definitions *
 ************************/
#define keyboardshortcut_SHOW_AS_MENU           ((keyboardshortcut_flags) 0x1u)
#define keyboardshortcut_SHOW_AT_CENTRE         ((keyboardshortcut_flags) 0x2u)
#define keyboardshortcut_SHOW_AT_POINTER        ((keyboardshortcut_flags) 0x4u)

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
