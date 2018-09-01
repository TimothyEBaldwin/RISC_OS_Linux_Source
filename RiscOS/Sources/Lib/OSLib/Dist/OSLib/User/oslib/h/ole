#ifndef ole_H
#define ole_H

/* C header file for OLE
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
typedef struct ole_s_                           *ole_s;
      /*Abstract type for session handles*/
typedef struct ole_file_changed_tag_            *ole_file_changed_tag;
      /*Discriminates between the types of file change message*/
typedef struct ole_close_session_tag_           *ole_close_session_tag;
      /*Discriminates between the types of close session message*/
typedef struct ole_message_file_changed         ole_message_file_changed;
typedef struct ole_message_open_session         ole_message_open_session;
typedef struct ole_message_close_session        ole_message_close_session;
typedef struct ole_full_message_file_changed    ole_full_message_file_changed;
typedef struct ole_full_message_open_session    ole_full_message_open_session;
typedef struct ole_full_message_close_session   ole_full_message_close_session;

/********************
 * Type definitions *
 ********************/
struct ole_message_file_changed
   {  ole_file_changed_tag tag;
      ole_s session_handle;
      char file_name [228];
   };

struct ole_message_open_session
   {  char name [16];
      wimp_w w;
      os_coord pos;
      int format;
      ole_s session_handle;
      bits file_type;
      char file_name [196];
   };

struct ole_message_close_session
   {  ole_close_session_tag tag;
      ole_s session_handle;
   };

struct ole_full_message_file_changed
   {  wimp_MESSAGE_HEADER_MEMBERS
      ole_file_changed_tag tag;
      ole_s session_handle;
      char file_name [228];
   };

struct ole_full_message_open_session
   {  wimp_MESSAGE_HEADER_MEMBERS
      char name [16];
      wimp_w w;
      os_coord pos;
      int format;
      ole_s session_handle;
      bits file_type;
      char file_name [196];
   };

struct ole_full_message_close_session
   {  wimp_MESSAGE_HEADER_MEMBERS
      ole_close_session_tag tag;
      ole_s session_handle;
   };

/************************
 * Constant definitions *
 ************************/
#define message_OLE_FILE_CHANGED                0x80E1Eu
#define message_OLE_OPEN_SESSION                0x80E21u
#define message_OLE_OPEN_SESSION_ACK            0x80E22u
#define message_OLE_CLOSE_SESSION               0x80E23u
#define ole_ALL_SESSIONS                        ((ole_s) 0xFFFFFFFFu)
#define ole_FILE_NAME_CHANGED                   ((ole_file_changed_tag) 0x0u)
#define ole_FILE_CONTENT_CHANGED                ((ole_file_changed_tag) 0x1u)

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
