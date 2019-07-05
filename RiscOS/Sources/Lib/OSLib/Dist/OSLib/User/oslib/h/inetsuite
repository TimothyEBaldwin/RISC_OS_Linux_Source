#ifndef inetsuite_H
#define inetsuite_H

/* C header file for InetSuite
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Tom Hughes, tom@compton.nu, 13 Mar 1999
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
typedef union  inetsuite_message_open_url       inetsuite_message_open_url;
typedef struct inetsuite_full_message_open_url_direct inetsuite_full_message_open_url_direct;
typedef struct inetsuite_full_message_open_url_indirect inetsuite_full_message_open_url_indirect;
typedef union  inetsuite_full_message_open_url  inetsuite_full_message_open_url;

/********************
 * Type definitions *
 ********************/
typedef bits inetsuite_open_url_flags;

union inetsuite_message_open_url
   {  char url [236];
      struct
      {  int tag;
         os_string_value url;
         inetsuite_open_url_flags flags;
         os_string_value body_file;
         os_string_value target;
         os_string_value body_mimetype;
      }
      indirect;
   };

struct inetsuite_full_message_open_url_direct
   {  wimp_MESSAGE_HEADER_MEMBERS
      char url [236];
   };

struct inetsuite_full_message_open_url_indirect
   {  int tag;
      os_string_value url;
      inetsuite_open_url_flags flags;
      os_string_value body_file;
      os_string_value target;
      os_string_value body_mimetype;
   };

union inetsuite_full_message_open_url
   {  inetsuite_full_message_open_url_direct direct;
      inetsuite_full_message_open_url_indirect indirect;
   };

/************************
 * Constant definitions *
 ************************/
#define message_INET_SUITE_OPEN_URL             0x4AF80u
#define inetsuite_USE_MIME_TYPE                 ((inetsuite_open_url_flags) 0x1u)

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
