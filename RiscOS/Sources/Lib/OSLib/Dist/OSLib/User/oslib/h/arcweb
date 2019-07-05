#ifndef arcweb_H
#define arcweb_H

/* C header file for Arcweb
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Tom Hughes, tom@compton.nu, 28 Mar 1999
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
typedef struct arcweb_h_                        *arcweb_h;
      /*Abstract type for Arcweb request handles*/
typedef union  arcweb_url                       arcweb_url;
typedef struct arcweb_expiry                    arcweb_expiry;
typedef struct arcweb_message_fetch_request     arcweb_message_fetch_request;
typedef struct arcweb_message_fetch_done        arcweb_message_fetch_done;
typedef struct arcweb_message_render_request    arcweb_message_render_request;
typedef struct arcweb_message_render_done       arcweb_message_render_done;
typedef struct arcweb_message_post_request      arcweb_message_post_request;
typedef struct arcweb_message_post_done         arcweb_message_post_done;
typedef struct arcweb_message_email_request     arcweb_message_email_request;
typedef struct arcweb_message_email_done        arcweb_message_email_done;
typedef struct arcweb_message_image_size        arcweb_message_image_size;
typedef struct arcweb_message_image_complete    arcweb_message_image_complete;
typedef struct arcweb_message_xfer_control      arcweb_message_xfer_control;
typedef struct arcweb_message_xfer_control_ack  arcweb_message_xfer_control_ack;
typedef struct arcweb_message_expire            arcweb_message_expire;
typedef struct arcweb_message_abort_request     arcweb_message_abort_request;
typedef struct arcweb_message_transfer_status   arcweb_message_transfer_status;
typedef struct arcweb_message_configure         arcweb_message_configure;
typedef struct arcweb_message_external_launch   arcweb_message_external_launch;
typedef struct arcweb_message_launch_done       arcweb_message_launch_done;
typedef struct arcweb_message_web_browser       arcweb_message_web_browser;
typedef struct arcweb_message_colour_selection  arcweb_message_colour_selection;
typedef struct arcweb_message_permanent_move    arcweb_message_permanent_move;
typedef struct arcweb_full_message_fetch_request arcweb_full_message_fetch_request;
typedef struct arcweb_full_message_fetch_done   arcweb_full_message_fetch_done;
typedef struct arcweb_full_message_render_request arcweb_full_message_render_request;
typedef struct arcweb_full_message_render_done  arcweb_full_message_render_done;
typedef struct arcweb_full_message_post_request arcweb_full_message_post_request;
typedef struct arcweb_full_message_post_done    arcweb_full_message_post_done;
typedef struct arcweb_full_message_email_request arcweb_full_message_email_request;
typedef struct arcweb_full_message_email_done   arcweb_full_message_email_done;
typedef struct arcweb_full_message_image_size   arcweb_full_message_image_size;
typedef struct arcweb_full_message_image_complete arcweb_full_message_image_complete;
typedef struct arcweb_full_message_xfer_control arcweb_full_message_xfer_control;
typedef struct arcweb_full_message_xfer_control_ack arcweb_full_message_xfer_control_ack;
typedef struct arcweb_full_message_expire       arcweb_full_message_expire;
typedef struct arcweb_full_message_abort_request arcweb_full_message_abort_request;
typedef struct arcweb_full_message_transfer_status arcweb_full_message_transfer_status;
typedef struct arcweb_full_message_configure    arcweb_full_message_configure;
typedef struct arcweb_full_message_external_launch arcweb_full_message_external_launch;
typedef struct arcweb_full_message_launch_done  arcweb_full_message_launch_done;
typedef struct arcweb_full_message_web_browser  arcweb_full_message_web_browser;
typedef struct arcweb_full_message_colour_selection arcweb_full_message_colour_selection;
typedef struct arcweb_full_message_permanent_move arcweb_full_message_permanent_move;

/********************
 * Type definitions *
 ********************/
union arcweb_url
   {  os_fw url_file_w;
      char url [200];
   };

struct arcweb_expiry
   {  int use_given_expiry;
      int use_default_expiry;
      os_date_and_time date;
      char reserved [3];
      int response_code;
      char mime_type [208];
   };

struct arcweb_message_fetch_request
   {  arcweb_h handle;
      bits flags;
      int source_file;
      arcweb_url url;
   };

struct arcweb_message_fetch_done
   {  arcweb_h handle;
      bits flags;
      union
      {  arcweb_expiry expiry;
         char error [228];
      }
      result;
   };

struct arcweb_message_render_request
   {  arcweb_h handle;
      bits flags;
      int source_file;
      int temporary_file;
      int diagram_file;
      int link_file;
      int file_header_size;
      char file_header [208];
   };

struct arcweb_message_render_done
   {  arcweb_h handle;
      bits flags;
      union
      {  os_coord size;
         char error [228];
      }
      result;
   };

struct arcweb_message_post_request
   {  arcweb_h handle;
      bits flags;
      int source_file;
      int form_file;
      arcweb_url url;
   };

struct arcweb_message_post_done
   {  arcweb_h handle;
      bits flags;
      union
      {  arcweb_expiry expiry;
         char error [228];
      }
      result;
   };

struct arcweb_message_email_request
   {  arcweb_h handle;
      bits flags;
      int form_file;
   };

struct arcweb_message_email_done
   {  arcweb_h handle;
      bits flags;
      char error [228];
   };

struct arcweb_message_image_size
   {  arcweb_h handle;
      bits flags;
      int renderer_handle;
      os_coord size;
   };

struct arcweb_message_image_complete
   {  arcweb_h handle;
      bits flags;
      int renderer_handle;
   };

struct arcweb_message_xfer_control
   {  arcweb_h handle;
      bits flags;
      int source_file;
      arcweb_url url;
   };

struct arcweb_message_xfer_control_ack
   {  arcweb_h handle;
      bits flags;
      char error [228];
   };

struct arcweb_message_expire
   {  arcweb_h handle;
      bits flags;
      arcweb_url url;
   };

struct arcweb_message_abort_request
   {  arcweb_h handle;
      int reserved;
      char reason [228];
   };

struct arcweb_message_transfer_status
   {  arcweb_h handle;
      int reserved;
      bits flags;
      int transmit_total;
      int transmit_current;
      int receive_total;
      int receive_current;
      char message [208];
   };

struct arcweb_message_configure
   {  int reserved [2];
      char application [228];
   };

struct arcweb_message_external_launch
   {  arcweb_h handle;
      bits flags;
      arcweb_url url;
   };

struct arcweb_message_launch_done
   {  arcweb_h handle;
      bits flags;
      char error [228];
   };

struct arcweb_message_web_browser
   {  int reserved [2];
      char browser [228];
   };

struct arcweb_message_colour_selection
   {  int reserved [2];
      os_colour background;
      os_colour normal;
      os_colour link;
      os_colour vlink;
      os_colour alink;
      os_colour no_images;
   };

struct arcweb_message_permanent_move
   {  int reserved [2];
      char *from;
      int from_size;
      char *to;
      int to_size;
   };

struct arcweb_full_message_fetch_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      int source_file;
      arcweb_url url;
   };

struct arcweb_full_message_fetch_done
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      union
      {  arcweb_expiry expiry;
         char error [228];
      }
      result;
   };

struct arcweb_full_message_render_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      int source_file;
      int temporary_file;
      int diagram_file;
      int link_file;
      int file_header_size;
      char file_header [208];
   };

struct arcweb_full_message_render_done
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      union
      {  os_coord size;
         char error [228];
      }
      result;
   };

struct arcweb_full_message_post_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      int source_file;
      int form_file;
      arcweb_url url;
   };

struct arcweb_full_message_post_done
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      union
      {  arcweb_expiry expiry;
         char error [228];
      }
      result;
   };

struct arcweb_full_message_email_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      int form_file;
   };

struct arcweb_full_message_email_done
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      char error [228];
   };

struct arcweb_full_message_image_size
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      int renderer_handle;
      os_coord image_coords;
   };

struct arcweb_full_message_image_complete
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      int renderer_handle;
   };

struct arcweb_full_message_xfer_control
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      int source_file;
      arcweb_url url;
   };

struct arcweb_full_message_xfer_control_ack
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      char error [228];
   };

struct arcweb_full_message_expire
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      arcweb_url url;
   };

struct arcweb_full_message_abort_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      int reserved;
      char reason [228];
   };

struct arcweb_full_message_transfer_status
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      int reserved;
      bits flags;
      int transmit_total;
      int transmit_current;
      int receive_total;
      int receive_current;
      char message [208];
   };

struct arcweb_full_message_configure
   {  wimp_MESSAGE_HEADER_MEMBERS
      int reserved [2];
      char application [228];
   };

struct arcweb_full_message_external_launch
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      arcweb_url url;
   };

struct arcweb_full_message_launch_done
   {  wimp_MESSAGE_HEADER_MEMBERS
      arcweb_h handle;
      bits flags;
      char error [228];
   };

struct arcweb_full_message_web_browser
   {  wimp_MESSAGE_HEADER_MEMBERS
      int reserved [2];
      char browser [228];
   };

struct arcweb_full_message_colour_selection
   {  wimp_MESSAGE_HEADER_MEMBERS
      int reserved [2];
      os_colour background;
      os_colour normal;
      os_colour link;
      os_colour vlink;
      os_colour alink;
      os_colour no_images;
   };

struct arcweb_full_message_permanent_move
   {  wimp_MESSAGE_HEADER_MEMBERS
      int reserved [2];
      char *from;
      int from_size;
      char *to;
      int to_size;
   };

/************************
 * Constant definitions *
 ************************/
#define message_ARCWEB_FETCH_REQUEST            0x4A240u
#define message_ARCWEB_FETCH_DONE               0x4A241u
#define message_ARCWEB_RENDER_REQUEST           0x4A242u
#define message_ARCWEB_RENDER_DONE              0x4A243u
#define message_ARCWEB_POST_REQUEST             0x4A244u
#define message_ARCWEB_POST_DONE                0x4A245u
#define message_ARCWEB_EMAIL_REQUEST            0x4A246u
#define message_ARCWEB_EMAIL_DONE               0x4A247u
#define message_ARCWEB_IMAGE_SIZE               0x4A250u
#define message_ARCWEB_IMAGE_COMPLETE           0x4A251u
#define message_ARCWEB_XFER_CONTROL             0x4A252u
#define message_ARCWEB_XFER_CONTROL_ACK         0x4A253u
#define message_ARCWEB_QUIT                     0x4A260u
#define message_ARCWEB_EXPIRE                   0x4A261u
#define message_ARCWEB_ABORT_REQUEST            0x4A262u
#define message_ARCWEB_TRANSFER_STATUS          0x4A263u
#define message_ARCWEB_CONFIGURE                0x4A264u
#define message_ARCWEB_EXTERNAL_LAUNCH          0x4A265u
#define message_ARCWEB_LAUNCH_DONE              0x4A266u
#define message_ARCWEB_WEB_BROWSER              0x4A267u
#define message_ARCWEB_COLOUR_SELECTED          0x4A268u
#define message_ARCWEB_PERMANENT_MOVE           0x4A269u
#define arcweb_DOCUMENT_FETCH                   0x1u
#define arcweb_LOCAL_LAUNCH                     0x2u
#define arcweb_FAST_IMAGES                      0x4u
#define arcweb_POST_WAS_PUT                     0x8u
#define arcweb_IMAGES_DISABLED                  0x10u
#define arcweb_XFER_CONTROL                     0x20u
#define arcweb_REFERER_AVAILABLE                0x80u
#define arcweb_FORCING_IMAGES                   0x100u
#define arcweb_PUT                              0x200u
#define arcweb_MAKE_DIRECTORY                   0x400u
#define arcweb_REMOVE_DIRECTORY                 0x800u
#define arcweb_REMOVE                           0x1000u
#define arcweb_RENAME                           0x2000u
#define arcweb_EXTENDED_TYPE                    0x10000u
#define arcweb_TYPE_MASK                        0x1FFFFu
#define arcweb_LOAD_TO_DISC                     0x80000u
#define arcweb_RELOAD                           0x100000u
#define arcweb_EMAIL_COMPLETE                   0x200000u
#define arcweb_EXTENDED_URL                     0x400000u
#define arcweb_INHIBIT_DISPLAY                  0x800000u
#define arcweb_ERROR_HANDLED                    0x1000000u
#define arcweb_IMAGE_FETCH                      0x2000000u
#define arcweb_CLOSE_PREVIOUS                   0x4000000u
#define arcweb_URL_CHANGED                      0x8000000u
#define arcweb_WANT_SYMLINK                     0x10000000u
#define arcweb_INHIBIT_RENDER                   0x20000000u
#define arcweb_TYPE_KNOWN                       0x40000000u
#define arcweb_ERROR                            0x80000000u
#define arcweb_PLAIN_TEXT                       0x10000u
#define arcweb_HTML                             0x10001u
#define arcweb_IMAGE                            0x10002u
#define arcweb_AUDIO                            0x10003u
#define arcweb_VIDEO                            0x10004u
#define arcweb_BINARY                           0x10005u
#define arcweb_IMAGE_JPEG                       0x10100u
#define arcweb_IMAGE_GIF                        0x10101u
#define arcweb_IMAGE_JFIF                       0x10102u
#define arcweb_IMAGE_BMP                        0x10103u
#define arcweb_IMAGE_XBM                        0x10104u
#define arcweb_IMAGE_CLEAR                      0x10105u
#define arcweb_IMAGE_TIFF                       0x10106u
#define arcweb_IMAGE_PNG                        0x10107u
#define arcweb_VIDEO_MPEG                       0x10200u
#define arcweb_VIDEO_ARMOVIE                    0x10201u
#define arcweb_AUDIO_MISC                       0x10300u
#define arcweb_AUDIO_SIMPLE                     0x10301u
#define arcweb_AUDIO_AIFF                       0x10302u
#define arcweb_UNKNOWN                          0x1FFFFu
#define arcweb_XMIT_RUNNING                     0x1u
#define arcweb_RECV_RUNNING                     0x2u
#define arcweb_XMIT_COMPLETE                    0x4u
#define arcweb_RECV_COMPLETE                    0x8u
#define arcweb_MISC_RUNNING                     0x10u

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
