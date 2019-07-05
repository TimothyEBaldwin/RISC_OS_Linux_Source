#ifndef plugin_H
#define plugin_H

/* C header file for PlugIn
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Tom Hughes, tom@compton.nu, 18 Apr 1999
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
typedef struct plugin_p_                        *plugin_p;
      /*Abstract type for plug-in instance handles*/
typedef struct plugin_b_                        *plugin_b;
      /*Abstract type for browser instance handles*/
typedef struct plugin_s_                        *plugin_s;
      /*Abstract type for plug-in stream instance handles*/
typedef struct plugin_bs_                       *plugin_bs;
      /*Abstract type for browser stream instance handles*/
typedef struct plugin_message_open              plugin_message_open;
typedef struct plugin_message_opening           plugin_message_opening;
typedef struct plugin_message_close             plugin_message_close;
typedef struct plugin_message_closed            plugin_message_closed;
typedef struct plugin_message_reshape           plugin_message_reshape;
typedef struct plugin_message_reshape_request   plugin_message_reshape_request;
typedef struct plugin_message_focus             plugin_message_focus;
typedef struct plugin_message_unlock            plugin_message_unlock;
typedef struct plugin_message_stream_new        plugin_message_stream_new;
typedef struct plugin_message_stream_destroy    plugin_message_stream_destroy;
typedef struct plugin_message_stream_write      plugin_message_stream_write;
typedef struct plugin_message_stream_written    plugin_message_stream_written;
typedef struct plugin_message_stream_as_file    plugin_message_stream_as_file;
typedef struct plugin_message_url_access        plugin_message_url_access;
typedef struct plugin_message_notify            plugin_message_notify;
typedef struct plugin_message_status            plugin_message_status;
typedef struct plugin_message_busy              plugin_message_busy;
typedef struct plugin_message_action            plugin_message_action;
typedef struct plugin_message_abort             plugin_message_abort;
typedef struct plugin_full_message_open         plugin_full_message_open;
typedef struct plugin_full_message_opening      plugin_full_message_opening;
typedef struct plugin_full_message_close        plugin_full_message_close;
typedef struct plugin_full_message_closed       plugin_full_message_closed;
typedef struct plugin_full_message_reshape      plugin_full_message_reshape;
typedef struct plugin_full_message_reshape_request plugin_full_message_reshape_request;
typedef struct plugin_full_message_focus        plugin_full_message_focus;
typedef struct plugin_full_message_unlock       plugin_full_message_unlock;
typedef struct plugin_full_message_stream_new   plugin_full_message_stream_new;
typedef struct plugin_full_message_stream_destroy plugin_full_message_stream_destroy;
typedef struct plugin_full_message_stream_write plugin_full_message_stream_write;
typedef struct plugin_full_message_stream_written plugin_full_message_stream_written;
typedef struct plugin_full_message_stream_as_file plugin_full_message_stream_as_file;
typedef struct plugin_full_message_url_access   plugin_full_message_url_access;
typedef struct plugin_full_message_notify       plugin_full_message_notify;
typedef struct plugin_full_message_status       plugin_full_message_status;
typedef struct plugin_full_message_busy         plugin_full_message_busy;
typedef struct plugin_full_message_action       plugin_full_message_action;
typedef struct plugin_full_message_abort        plugin_full_message_abort;

/********************
 * Type definitions *
 ********************/
typedef int plugin_notify_data;

typedef bits plugin_open_flags;

typedef bits plugin_opening_flags;

typedef bits plugin_close_flags;

typedef bits plugin_closed_flags;

typedef bits plugin_stream_new_flags;

typedef bits plugin_stream_write_flags;

typedef bits plugin_url_access_flags;

typedef bits plugin_busy_flags;

typedef int plugin_stream_destroy_reason;

typedef int plugin_notify_reason;

typedef int plugin_state;

struct plugin_message_open
   {  plugin_open_flags flags;
      bits reserved;
      plugin_b browser;
      wimp_w parent_window;
      os_box bbox;
      bits file_type;
      os_string_value filename;
   };

struct plugin_message_opening
   {  plugin_opening_flags flags;
      plugin_p plugin;
      plugin_b browser;
   };

struct plugin_message_close
   {  plugin_close_flags flags;
      plugin_p plugin;
      plugin_b browser;
   };

struct plugin_message_closed
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
      bits error_number;
      char error_text [220];
   };

struct plugin_message_reshape
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
      wimp_w parent_window;
      os_box bbox;
   };

struct plugin_message_reshape_request
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
      os_coord size;
   };

struct plugin_message_focus
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
   };

struct plugin_message_unlock
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
      os_string_value url;
   };

struct plugin_message_stream_new
   {  plugin_stream_new_flags flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_s stream;
      plugin_bs browser_stream;
      os_string_value url;
      int end;
      int last_modified_date;
      plugin_notify_data notify_data;
      os_string_value mime_type;
      os_string_value target_window;
   };

struct plugin_message_stream_destroy
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_s stream;
      plugin_bs browser_stream;
      os_string_value url;
      int end;
      int last_modified_date;
      plugin_notify_data notify_data;
      plugin_stream_destroy_reason reason;
   };

struct plugin_message_stream_write
   {  plugin_stream_write_flags flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_s stream;
      plugin_bs browser_stream;
      os_string_value url;
      int end;
      int last_modified_date;
      plugin_notify_data notify_data;
      int offset;
      int length;
      byte *data;
   };

struct plugin_message_stream_written
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_s stream;
      plugin_bs browser_stream;
      os_string_value url;
      int end;
      int last_modified_date;
      plugin_notify_data notify_data;
      int length;
   };

struct plugin_message_stream_as_file
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_s stream;
      plugin_bs browser_stream;
      os_string_value url;
      int end;
      int last_modified_date;
      plugin_notify_data notify_data;
      os_string_value filename;
   };

struct plugin_message_url_access
   {  plugin_url_access_flags flags;
      plugin_p plugin;
      plugin_b browser;
      os_string_value url;
      os_string_value target_window;
      plugin_notify_data notify_data;
      int length;
      os_string_value filename_or_data;
   };

struct plugin_message_notify
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
      os_string_value url;
      plugin_notify_reason reason;
      plugin_notify_data notify_data;
   };

struct plugin_message_status
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
      os_string_value message;
   };

struct plugin_message_busy
   {  plugin_busy_flags flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_state new_state;
   };

struct plugin_message_action
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_state new_state;
   };

struct plugin_message_abort
   {  bits flags;
      plugin_p plugin;
      plugin_b browser;
   };

struct plugin_full_message_open
   {  wimp_MESSAGE_HEADER_MEMBERS
      plugin_open_flags flags;
      bits reserved;
      plugin_b browser;
      wimp_w parent_window;
      os_box bbox;
      bits file_type;
      os_string_value filename;
   };

struct plugin_full_message_opening
   {  wimp_MESSAGE_HEADER_MEMBERS
      plugin_opening_flags flags;
      plugin_p plugin;
      plugin_b browser;
   };

struct plugin_full_message_close
   {  wimp_MESSAGE_HEADER_MEMBERS
      plugin_close_flags flags;
      plugin_p plugin;
      plugin_b browser;
   };

struct plugin_full_message_closed
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
      bits error_number;
      char error_text [220];
   };

struct plugin_full_message_reshape
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
      wimp_w parent_window;
      os_box bbox;
   };

struct plugin_full_message_reshape_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
      os_coord shape;
   };

struct plugin_full_message_focus
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
   };

struct plugin_full_message_unlock
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
      os_string_value url;
   };

struct plugin_full_message_stream_new
   {  wimp_MESSAGE_HEADER_MEMBERS
      plugin_stream_new_flags flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_s stream;
      plugin_bs browser_stream;
      os_string_value url;
      int end;
      int last_modified_date;
      plugin_notify_data notify_data;
      os_string_value mime_type;
      os_string_value target_window;
   };

struct plugin_full_message_stream_destroy
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_s stream;
      plugin_bs browser_stream;
      os_string_value url;
      int end;
      int last_modified_date;
      plugin_notify_data notify_data;
      plugin_stream_destroy_reason reason;
   };

struct plugin_full_message_stream_write
   {  wimp_MESSAGE_HEADER_MEMBERS
      plugin_stream_write_flags flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_s stream;
      plugin_bs browser_stream;
      os_string_value url;
      int end;
      int last_modified_date;
      plugin_notify_data notify_data;
      int offset;
      int length;
      byte *data;
   };

struct plugin_full_message_stream_written
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_s stream;
      plugin_bs browser_stream;
      os_string_value url;
      int end;
      int last_modified_date;
      plugin_notify_data notify_data;
      int length;
   };

struct plugin_full_message_stream_as_file
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_s stream;
      plugin_bs browser_stream;
      os_string_value url;
      int end;
      int last_modified_date;
      plugin_notify_data notify_data;
      os_string_value filename;
   };

struct plugin_full_message_url_access
   {  wimp_MESSAGE_HEADER_MEMBERS
      plugin_url_access_flags flags;
      plugin_p plugin;
      plugin_b browser;
      os_string_value url;
      os_string_value target_window;
      plugin_notify_data notify_data;
      int length;
      os_string_value filename_or_data;
   };

struct plugin_full_message_notify
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
      os_string_value url;
      plugin_notify_reason reason;
      plugin_notify_data notify_data;
   };

struct plugin_full_message_status
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
      os_string_value message;
   };

struct plugin_full_message_busy
   {  wimp_MESSAGE_HEADER_MEMBERS
      plugin_busy_flags flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_state new_state;
   };

struct plugin_full_message_action
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
      plugin_state new_state;
   };

struct plugin_full_message_abort
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
      plugin_p plugin;
      plugin_b browser;
   };

/************************
 * Constant definitions *
 ************************/
#define message_PLUG_IN_OPEN                    0x4D540u
#define message_PLUG_IN_OPENING                 0x4D541u
#define message_PLUG_IN_CLOSE                   0x4D542u
#define message_PLUG_IN_CLOSED                  0x4D543u
#define message_PLUG_IN_RESHAPE                 0x4D544u
#define message_PLUG_IN_RESHAPE_REQUEST         0x4D545u
#define message_PLUG_IN_FOCUS                   0x4D546u
#define message_PLUG_IN_UNLOCK                  0x4D547u
#define message_PLUG_IN_STREAM_NEW              0x4D548u
#define message_PLUG_IN_STREAM_DESTROY          0x4D549u
#define message_PLUG_IN_STREAM_WRITE            0x4D54Au
#define message_PLUG_IN_STREAM_WRITTEN          0x4D54Bu
#define message_PLUG_IN_STREAM_AS_FILE          0x4D54Cu
#define message_PLUG_IN_URL_ACCESS              0x4D54Du
#define message_PLUG_IN_NOTIFY                  0x4D54Eu
#define message_PLUG_IN_STATUS                  0x4D54Fu
#define message_PLUG_IN_BUSY                    0x4D550u
#define message_PLUG_IN_ACTION                  0x4D551u
#define message_PLUG_IN_ABORT                   0x4D552u
#define plugin_OPEN_AS_HELPER                   ((plugin_open_flags) 0x1u)
#define plugin_OPENING_ACCEPTS_INPUT_FOCUS      ((plugin_opening_flags) 0x1u)
#define plugin_OPENING_WANTS_CODE_FETCHING      ((plugin_opening_flags) 0x2u)
#define plugin_OPENING_WANTS_DATA_FETCHING      ((plugin_opening_flags) 0x4u)
#define plugin_OPENING_WILL_DELETE_PARAMETERS   ((plugin_opening_flags) 0x8u)
#define plugin_OPENING_STILL_BUSY               ((plugin_opening_flags) 0x10u)
#define plugin_OPENING_SUPPORTS_EXTENDED_ACTIONS ((plugin_opening_flags) 0x20u)
#define plugin_OPENING_HAS_HELPER_WINDOW        ((plugin_opening_flags) 0x40u)
#define plugin_CLOSE_REQUEST_EXIT               ((plugin_close_flags) 0x1u)
#define plugin_CLOSED_WILL_EXIT                 ((plugin_closed_flags) 0x1u)
#define plugin_CLOSED_SELF_INITIATED            ((plugin_closed_flags) 0x2u)
#define plugin_CLOSED_WITH_ERROR                ((plugin_closed_flags) 0x4u)
#define plugin_STREAM_NEW_TYPE                  ((plugin_stream_new_flags) 0xFu)
#define plugin_STREAM_NEW_TYPE_SHIFT            0
#define plugin_STREAM_NEW_TYPE_NORMAL           0
#define plugin_STREAM_NEW_TYPE_SEEK_ONLY        1
#define plugin_STREAM_NEW_TYPE_AS_FILE          2
#define plugin_STREAM_NEW_TYPE_AS_FILE_ONLY     3
#define plugin_STREAM_NEW_SEEKABLE              ((plugin_stream_new_flags) 0x10u)
#define plugin_STREAM_WRITE_DATA_TYPE           ((plugin_stream_write_flags) 0xFu)
#define plugin_STREAM_WRITE_DATA_TYPE_SHIFT     0
#define plugin_STREAM_WRITE_DATA_TYPE_STRING    0
#define plugin_STREAM_WRITE_DATA_TYPE_ANCHOR    1
#define plugin_STREAM_WRITE_DATA_TYPE_FILE_HANDLE 2
#define plugin_URL_ACCESS_NOTIFY_COMPLETION     ((plugin_url_access_flags) 0x1u)
#define plugin_URL_ACCESS_USE_POST              ((plugin_url_access_flags) 0x2u)
#define plugin_URL_ACCESS_POST_FILE             ((plugin_url_access_flags) 0x4u)
#define plugin_BUSY_IS_BUSY                     ((plugin_busy_flags) 0x1u)
#define plugin_BUSY_HAS_NEW_STATE               ((plugin_busy_flags) 0x2u)
#define plugin_STREAM_DESTROY_FINISHED          ((plugin_stream_destroy_reason) 0x0u)
#define plugin_STREAM_DESTROY_ERROR             ((plugin_stream_destroy_reason) 0x1u)
#define plugin_STREAM_DESTROY_USER_REQUEST      ((plugin_stream_destroy_reason) 0x2u)
#define plugin_NOTIFY_FINISHED                  ((plugin_notify_reason) 0x0u)
#define plugin_NOTIFY_ERROR                     ((plugin_notify_reason) 0x1u)
#define plugin_NOTIFY_USER_REQUEST              ((plugin_notify_reason) 0x2u)
#define plugin_STATE_STOP                       ((plugin_state) 0x0u)
#define plugin_STATE_PLAY                       ((plugin_state) 0x1u)
#define plugin_STATE_PAUSE                      ((plugin_state) 0x2u)
#define plugin_STATE_FAST_FORWARD               ((plugin_state) 0x3u)
#define plugin_STATE_REWIND                     ((plugin_state) 0x4u)
#define plugin_STATE_RECORD                     ((plugin_state) 0x5u)
#define plugin_STATE_MUTE                       ((plugin_state) 0x6u)
#define plugin_STATE_UN_MUTE                    ((plugin_state) 0x7u)

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
