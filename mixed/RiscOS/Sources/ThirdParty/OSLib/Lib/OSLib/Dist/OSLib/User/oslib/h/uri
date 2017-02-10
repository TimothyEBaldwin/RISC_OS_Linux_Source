#ifndef uri_H
#define uri_H

/* C header file for URI
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
 * Tom Hughes, tom@compton.nu, 27 Mar 1999
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

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  URI_Version
#define URI_Version                             0x4E380
#undef  XURI_Version
#define XURI_Version                            0x6E380
#undef  URI_Dispatch
#define URI_Dispatch                            0x4E381
#undef  XURI_Dispatch
#define XURI_Dispatch                           0x6E381
#undef  URI_RequestURISize
#define URI_RequestURISize                      0x4E382
#undef  XURI_RequestURISize
#define XURI_RequestURISize                     0x6E382
#undef  URI_RequestURI
#define URI_RequestURI                          0x4E382
#undef  XURI_RequestURI
#define XURI_RequestURI                         0x6E382
#undef  URI_InvalidateURI
#define URI_InvalidateURI                       0x4E383
#undef  XURI_InvalidateURI
#define XURI_InvalidateURI                      0x6E383
#undef  Service_URI
#define Service_URI                             0xA7
#undef  Service_URIHandlerStarted
#define Service_URIHandlerStarted               0x0
#undef  Service_URIHandlerDying
#define Service_URIHandlerDying                 0x1
#undef  Service_URIProcess
#define Service_URIProcess                      0x2
#undef  Service_URIReturnResult
#define Service_URIReturnResult                 0x3

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct uri_h_                           *uri_h;
      /*Abstract type for URI handles*/
typedef struct uri_message_handler_started      uri_message_handler_started;
typedef struct uri_message_handler_dying        uri_message_handler_dying;
typedef struct uri_message_process              uri_message_process;
typedef struct uri_message_return_result        uri_message_return_result;
typedef struct uri_message_process_ack          uri_message_process_ack;
typedef struct uri_full_message_handler_started uri_full_message_handler_started;
typedef struct uri_full_message_handler_dying   uri_full_message_handler_dying;
typedef struct uri_full_message_process         uri_full_message_process;
typedef struct uri_full_message_return_result   uri_full_message_return_result;
typedef struct uri_full_message_process_ack     uri_full_message_process_ack;

/********************
 * Type definitions *
 ********************/
typedef bits uri_process_flags;

typedef bits uri_return_result_flags;

struct uri_message_handler_started
   {  bits flags;
   };

struct uri_message_handler_dying
   {  bits flags;
   };

struct uri_message_process
   {  uri_process_flags flags;
      char *uri;
      uri_h handle;
   };

struct uri_message_return_result
   {  uri_return_result_flags flags;
      uri_h handle;
   };

struct uri_message_process_ack
   {  uri_process_flags flags;
      char *uri;
      uri_h handle;
   };

struct uri_full_message_handler_started
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
   };

struct uri_full_message_handler_dying
   {  wimp_MESSAGE_HEADER_MEMBERS
      bits flags;
   };

struct uri_full_message_process
   {  wimp_MESSAGE_HEADER_MEMBERS
      uri_process_flags flags;
      char *uri;
      uri_h handle;
   };

struct uri_full_message_return_result
   {  wimp_MESSAGE_HEADER_MEMBERS
      uri_return_result_flags flags;
      uri_h handle;
   };

struct uri_full_message_process_ack
   {  wimp_MESSAGE_HEADER_MEMBERS
      uri_process_flags flags;
      char *uri;
      uri_h handle;
   };

typedef bits uri_dispatch_flags;

typedef bits uri_dispatch_result_flags;

/************************
 * Constant definitions *
 ************************/
#define uri_FILE_TYPE                           0xF91u
#define message_URI_HANDLER_STARTED             0x4E380u
#define message_URI_HANDLER_DYING               0x4E381u
#define message_URI_PROCESS                     0x4E382u
#define message_URI_RETURN_RESULT               0x4E383u
#define message_URI_PROCESS_ACK                 0x4E384u
#define uri_PROCESS_CHECK_ONLY                  ((uri_process_flags) 0x1u)
#define uri_RETURN_RESULT_NOT_CLAIMED           ((uri_return_result_flags) 0x1u)
#define uri_DISPATCH_INFORM_CALLER              ((uri_dispatch_flags) 0x1u)
#define uri_DISPATCH_CHECK_ONLY                 ((uri_dispatch_flags) 0x2u)
#define uri_DISPATCH_NO_EXTERNAL_STARTUP        ((uri_dispatch_flags) 0x4u)
#define uri_DISPATCH_REQUEST_REJECTED           ((uri_dispatch_result_flags) 0x1u)
#define error_URI_NO_MEMORY                     0x810A01u
      /*There was insufficient memory to complete an operation*/
#define error_URI_BAD_URI                       0x810A02u
      /*An empty URI string was supplied*/
#define error_URI_BAD_HANDLE                    0x810A03u
      /*A bad URI handle was supplied*/
#define error_URI_BAD_FILE                      0x810A04u
      /*An error occurred accessing a URI file*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      uri_version()
 *
 * Description:   Returns the current version of the URI handler module
 *
 * Input:         flags - value of R0 on entry
 *
 * Output:        version - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4E380.
 */

extern os_error *xuri_version (bits flags,
      int *version);
__swi (0x4E380) int uri_version (bits flags);

/* ------------------------------------------------------------------------
 * Function:      uri_dispatch()
 *
 * Description:   Dispatches a URI to an appropriate application for
 *                handling
 *
 * Input:         flags - value of R0 on entry
 *                uri - value of R1 on entry
 *                source_task - value of R2 on entry
 *
 * Output:        flags_out - value of R0 on exit
 *                handler_task - value of R2 on exit
 *                handle - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4E381.
 */

extern os_error *xuri_dispatch (uri_dispatch_flags flags,
      char const *uri,
      wimp_t source_task,
      uri_dispatch_result_flags *flags_out,
      wimp_t *handler_task,
      uri_h *handle);
extern uri_h uri_dispatch (uri_dispatch_flags flags,
      char const *uri,
      wimp_t source_task,
      uri_dispatch_result_flags *flags_out,
      wimp_t *handler_task);

/* ------------------------------------------------------------------------
 * Function:      uri_request_uri_size()
 *
 * Description:   Finds the size of the buffer needed for a URI
 *
 * Input:         flags - value of R0 on entry
 *                handle - value of R3 on entry
 *
 * Output:        buffer_size - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4E382 with R1 = 0x0.
 */

extern os_error *xuri_request_uri_size (bits flags,
      uri_h handle,
      int *buffer_size);
extern int uri_request_uri_size (bits flags,
      uri_h handle);

/* ------------------------------------------------------------------------
 * Function:      uri_request_uri()
 *
 * Description:   Requests a copy of the text of a URI
 *
 * Input:         flags - value of R0 on entry
 *                buffer - value of R1 on entry
 *                buffer_size - value of R2 on entry
 *                handle - value of R3 on entry
 *
 * Output:        length - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4E382.
 */

extern os_error *xuri_request_uri (bits flags,
      char *buffer,
      int buffer_size,
      uri_h handle,
      int *length);
extern int uri_request_uri (bits flags,
      char *buffer,
      int buffer_size,
      uri_h handle);

/* ------------------------------------------------------------------------
 * Function:      uri_invalidate_uri()
 *
 * Description:   Marks a URI as invalid
 *
 * Input:         flags - value of R0 on entry
 *                handle - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x4E383.
 */

extern os_error *xuri_invalidate_uri (bits flags,
      uri_h handle);
extern void uri_invalidate_uri (bits flags,
      uri_h handle);

/* ------------------------------------------------------------------------
 * Function:      service_uri_handler_started()
 *
 * Description:   URI handler started
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x0, R1 = 0xA7.
 */

extern os_error *xservice_uri_handler_started (void);
extern void service_uri_handler_started (void);

/* ------------------------------------------------------------------------
 * Function:      service_uri_handler_dying()
 *
 * Description:   URI handler dying
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x1, R1 = 0xA7.
 */

extern os_error *xservice_uri_handler_dying (void);
extern void service_uri_handler_dying (void);

/* ------------------------------------------------------------------------
 * Function:      service_uri_process()
 *
 * Description:   Requests that a URI is processed or checked
 *
 * Input:         flags - value of R2 on entry
 *                uri - value of R3 on entry
 *                handle - value of R4 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x2, R1 = 0xA7.
 */

extern os_error *xservice_uri_process (uri_process_flags flags,
      char const *uri,
      uri_h handle,
      osbool *unclaimed);
extern osbool service_uri_process (uri_process_flags flags,
      char const *uri,
      uri_h handle);

/* ------------------------------------------------------------------------
 * Function:      service_uri_return_result()
 *
 * Description:   Returns the result of a URI dispatch
 *
 * Input:         flags - value of R2 on entry
 *                handle - value of R4 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x3, R1 = 0xA7, R3 = 0x0.
 */

extern os_error *xservice_uri_return_result (uri_return_result_flags flags,
      uri_h handle,
      osbool *unclaimed);
extern osbool service_uri_return_result (uri_return_result_flags flags,
      uri_h handle);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
