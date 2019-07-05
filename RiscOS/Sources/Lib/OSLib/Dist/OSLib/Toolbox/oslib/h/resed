#ifndef resed_H
#define resed_H

/* C header file for ResEd
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:39 2007
 * Christian Ludlam, <chris@recoil.org>, 25 Apr 2005
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

#ifndef toolbox_H
#include "oslib/toolbox.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct resed_d_                         *resed_d;
      /*Abstract type for Document IDs*/
typedef struct resed_o_                         *resed_o;
      /*Abstract type for Object IDs*/
typedef struct resed_message_object_load        resed_message_object_load;
typedef struct resed_message_object_loaded      resed_message_object_loaded;
typedef struct resed_message_object_sending     resed_message_object_sending;
typedef struct resed_message_object_send        resed_message_object_send;
typedef struct resed_message_object_renamed     resed_message_object_renamed;
typedef struct resed_message_object_deleted     resed_message_object_deleted;
typedef struct resed_message_object_modified    resed_message_object_modified;
typedef struct resed_message_object_closed      resed_message_object_closed;
typedef struct resed_message_sprites_changed    resed_message_sprites_changed;
typedef struct resed_message_object_name_request resed_message_object_name_request;
typedef struct resed_message_object_name        resed_message_object_name;
typedef struct resed_message_keycut_details     resed_message_keycut_details;
typedef struct resed_full_message_object_load   resed_full_message_object_load;
typedef struct resed_full_message_object_loaded resed_full_message_object_loaded;
typedef struct resed_full_message_object_sending resed_full_message_object_sending;
typedef struct resed_full_message_object_send   resed_full_message_object_send;
typedef struct resed_full_message_object_renamed resed_full_message_object_renamed;
typedef struct resed_full_message_object_deleted resed_full_message_object_deleted;
typedef struct resed_full_message_object_modified resed_full_message_object_modified;
typedef struct resed_full_message_object_closed resed_full_message_object_closed;
typedef struct resed_full_message_sprites_changed resed_full_message_sprites_changed;
typedef struct resed_full_message_object_name_request resed_full_message_object_name_request;
typedef struct resed_full_message_object_name   resed_full_message_object_name;
typedef struct resed_full_message_keycut_details resed_full_message_keycut_details;

/********************
 * Type definitions *
 ********************/
typedef bits resed_object_load_flags;

typedef bits resed_object_loaded_flags;

typedef bits resed_object_sending_flags;

typedef bits resed_object_send_flags;

typedef bits resed_keycut_details_flags;

typedef int resed_error;

struct resed_message_object_load
   {  resed_object_load_flags flags;
      resed_d doc_id;
      resed_o obj_id;
      toolbox_class obj_class;
      int version;
      byte *address;
      int obj_size;
      char name [208];
   };

struct resed_message_object_loaded
   {  resed_object_loaded_flags flags;
      resed_d doc_id;
      resed_o obj_id;
      resed_error error;
   };

struct resed_message_object_sending
   {  resed_object_sending_flags flags;
      resed_d doc_id;
      resed_o obj_id;
      byte *address;
      int obj_size;
      resed_error error;
   };

struct resed_message_object_send
   {  resed_object_send_flags flags;
      resed_d doc_id;
      resed_o obj_id;
   };

struct resed_message_object_renamed
   {  bits flags;
      resed_d doc_id;
      resed_o obj_id;
      char new_name [224];
   };

struct resed_message_object_deleted
   {  bits flags;
      resed_d doc_id;
      resed_o obj_id;
   };

struct resed_message_object_modified
   {  bits flags;
      resed_d doc_id;
      resed_o obj_id;
   };

struct resed_message_object_closed
   {  bits flags;
      resed_d doc_id;
      resed_o obj_id;
   };

struct resed_message_sprites_changed
   {  bits flags;
   };

struct resed_message_object_name_request
   {  bits flags;
      resed_d doc_id;
      resed_o obj_id;
      wimp_w window;
      wimp_i icon;
   };

struct resed_message_object_name
   {  bits flags;
      resed_d doc_id;
      resed_o obj_id;
      wimp_w window;
      wimp_i icon;
      toolbox_class obj_class;
      char name [212];
   };

struct resed_message_keycut_details
   {  resed_keycut_details_flags flags;
      wimp_t shell;
      wimp_w window;
      wimp_key_no key;
      toolbox_action key_action;
      char names [216];
   };

struct resed_full_message_object_load
   {  wimp_MESSAGE_HEADER_MEMBERS
      resed_object_load_flags flags;
      resed_d doc_id;
      resed_o obj_id;
      toolbox_class obj_class;
      int version;
      byte *address;
      int obj_size;
      char name [208];
   };

struct resed_full_message_object_loaded
   {  wimp_MESSAGE_HEADER_MEMBERS
      resed_object_loaded_flags flags;
      resed_d doc_id;
      resed_o obj_id;
      resed_error error;
   };

struct resed_full_message_object_sending
   {  wimp_MESSAGE_HEADER_MEMBERS
      resed_object_sending_flags flags;
      resed_d doc_id;
      resed_o obj_id;
      byte *address;
      int obj_size;
      resed_error error;
   };

struct resed_full_message_object_send
   {  wimp_MESSAGE_HEADER_MEMBERS
      resed_object_send_flags flags;
      resed_d doc_id;
      resed_o obj_id;
   };

struct resed_full_message_object_renamed
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      resed_d doc_id;
      resed_o obj_id;
      char new_name [224];
   };

struct resed_full_message_object_deleted
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      resed_d doc_id;
      resed_o obj_id;
   };

struct resed_full_message_object_modified
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      resed_d doc_id;
      resed_o obj_id;
   };

struct resed_full_message_object_closed
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      resed_d doc_id;
      resed_o obj_id;
   };

struct resed_full_message_sprites_changed
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
   };

struct resed_full_message_object_name_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      resed_d doc_id;
      resed_o obj_id;
      wimp_w window;
      wimp_i icon;
   };

struct resed_full_message_object_name
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      resed_d doc_id;
      resed_o obj_id;
      wimp_w window;
      wimp_i icon;
      toolbox_class obj_class;
      char name [212];
   };

struct resed_full_message_keycut_details
   {  wimp_MESSAGE_HEADER_MEMBERS
      resed_keycut_details_flags flags;
      wimp_t shell;
      wimp_w window;
      wimp_key_no key;
      toolbox_action key_action;
      char names [216];
   };

/************************
 * Constant definitions *
 ************************/
#define message_RESED_OBJECT_LOAD               0x83340u
#define message_RESED_OBJECT_LOADED             0x83341u
#define message_RESED_OBJECT_SEND               0x83342u
#define message_RESED_OBJECT_SENDING            0x83343u
#define message_RESED_OBJECT_RENAMED            0x83344u
#define message_RESED_OBJECT_DELETED            0x83345u
#define message_RESED_OBJECT_MODIFIED           0x83346u
#define message_RESED_OBJECT_CLOSED             0x83347u
#define message_RESED_SPRITES_CHANGED           0x83348u
#define message_RESED_OBJECT_NAME_REQUEST       0x83349u
#define message_RESED_OBJECT_NAME               0x8334Au
#define message_RESED_KEYCUT_DETAILS            0x8334Bu
#define resed_FORCE_LOAD                        ((resed_object_load_flags) 0x1u)
#define resed_LOAD_FAILED                       ((resed_object_loaded_flags) 0x1u)
#define resed_CANNOT_SEND                       ((resed_object_sending_flags) 0x1u)
#define resed_DELETE_AFTER_SEND                 ((resed_object_send_flags) 0x1u)
#define resed_KEYCUT_RAISES_EVENT               ((resed_keycut_details_flags) 0x1u)
#define resed_KEYCUT_SHOWS_OBJECT               ((resed_keycut_details_flags) 0x2u)
#define resed_KEYCUT_SHOWS_TRANSIENT            ((resed_keycut_details_flags) 0x4u)
#define resed_ERROR_NO_MEMORY                   ((resed_error) 0x0u)
#define resed_ERROR_UK_VERSION                  ((resed_error) 0x1u)
      /*object_load message*/
#define resed_ERROR_UK_OBJECT                   ((resed_error) 0x1u)
      /*object_sending message*/
#define resed_ERROR_CORRUPT_DATA                ((resed_error) 0x2u)
#define resed_ERROR_NON_FATAL_INTERNAL_ERROR    ((resed_error) 0x3u)
#define resed_ERROR_FATAL_INTERNAL_ERROR        ((resed_error) 0x4u)

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
