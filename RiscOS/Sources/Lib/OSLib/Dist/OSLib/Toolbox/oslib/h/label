#ifndef label_H
#define label_H

/* C header file for Label
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

#ifndef gadget_H
#include "oslib/gadget.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct label_gadget                     label_gadget;
typedef struct label_object                     label_object;

/********************
 * Type definitions *
 ********************/
struct label_gadget
   {  toolbox_msg_reference label;
   };

struct label_object
   {  gadget_OBJECT_MEMBERS
      toolbox_msg_reference label;
   };

/************************
 * Constant definitions *
 ************************/
#define class_LABEL                             ((toolbox_class) 0x140u)
#define label_NO_BOX                            0x1u
#define label_RJUSTIFIED                        0x2u
#define label_HCENTRED                          0x4u

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
