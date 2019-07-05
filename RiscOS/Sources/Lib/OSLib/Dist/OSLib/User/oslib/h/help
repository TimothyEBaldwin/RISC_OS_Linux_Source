#ifndef help_H
#define help_H

/* C header file for Help
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 12 June 1995
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
typedef struct help_message_request             help_message_request;
typedef struct help_message_reply               help_message_reply;
typedef struct help_message_enable              help_message_enable;
typedef struct help_full_message_request        help_full_message_request;
typedef struct help_full_message_reply          help_full_message_reply;
typedef struct help_full_message_enable         help_full_message_enable;

/********************
 * Type definitions *
 ********************/
typedef bits help_flags;

/* ------------------------------------------------------------------------
 * Type:          help_message_request
 *
 * Description:   message type to request help from an application
 *
 * Fields:        pos - mouse coordinates
 *                buttons - mouse button state
 *                w - window handle
 *                i - icon handle
 */

struct help_message_request
   {  os_coord pos;
      wimp_mouse_state buttons;
      wimp_w w;
      wimp_i i;
   };

/* ------------------------------------------------------------------------
 * Type:          help_message_reply
 *
 * Description:   message type to reply with help text
 *
 * Fields:        reply - help message, 0-terminated
 */

struct help_message_reply
   {  char reply [236];
   };

/* ------------------------------------------------------------------------
 * Type:          help_message_enable
 *
 * Description:   message type to switch help on and off - RISC O S 4+
 */

struct help_message_enable
   {  help_flags flags;
   };

/* ------------------------------------------------------------------------
 * Type:          help_full_message_request
 *
 * Description:   message type to request help from an application
 *
 * Fields:        pos - mouse coordinates
 *                buttons - mouse button state
 *                w - window handle
 *                i - icon handle
 */

struct help_full_message_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      os_coord pos;
      wimp_mouse_state buttons;
      wimp_w w;
      wimp_i i;
   };

/* ------------------------------------------------------------------------
 * Type:          help_full_message_reply
 *
 * Description:   message type to reply with help text
 *
 * Fields:        reply - help message, 0-terminated
 */

struct help_full_message_reply
   {  wimp_MESSAGE_HEADER_MEMBERS
      char reply [236];
   };

/* ------------------------------------------------------------------------
 * Type:          help_full_message_enable
 *
 * Description:   message type to switch help on and off - RISC O S 4+
 */

struct help_full_message_enable
   {  wimp_MESSAGE_HEADER_MEMBERS
      help_flags flags;
   };

/************************
 * Constant definitions *
 ************************/
#define message_HELP_REQUEST                    0x502u
#define message_HELP_REPLY                      0x503u
#define message_HELP_ENABLE                     0x504u
      /*RISC O S 4+*/
#define help_DISABLE                            ((help_flags) 0x1u)
#define help_READ_CONFIGURATION                 ((help_flags) 0x2u)

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
