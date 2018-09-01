#ifndef url_H
#define url_H

/* C header file for URL
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  URL_Register
#define URL_Register                            0x83E00
#undef  XURL_Register
#define XURL_Register                           0xA3E00
#undef  URL_GetURL
#define URL_GetURL                              0x83E01
#undef  XURL_GetURL
#define XURL_GetURL                             0xA3E01
#undef  URL_Status
#define URL_Status                              0x83E02
#undef  XURL_Status
#define XURL_Status                             0xA3E02
#undef  URL_ReadData
#define URL_ReadData                            0x83E03
#undef  XURL_ReadData
#define XURL_ReadData                           0xA3E03
#undef  URL_SetProxy
#define URL_SetProxy                            0x83E04
#undef  XURL_SetProxy
#define XURL_SetProxy                           0xA3E04
#undef  URL_SetProxy_Enable
#define URL_SetProxy_Enable                     0x0
#undef  URL_SetProxy_Disable
#define URL_SetProxy_Disable                    0x1
#undef  URL_Stop
#define URL_Stop                                0x83E05
#undef  XURL_Stop
#define XURL_Stop                               0xA3E05
#undef  URL_Deregister
#define URL_Deregister                          0x83E06
#undef  XURL_Deregister
#define XURL_Deregister                         0xA3E06
#undef  URL_ParseURL
#define URL_ParseURL                            0x83E07
#undef  XURL_ParseURL
#define XURL_ParseURL                           0xA3E07
#undef  URLParseURL_ReturnLengths
#define URLParseURL_ReturnLengths               0x0
#undef  URLParseURL_ReturnData
#define URLParseURL_ReturnData                  0x1
#undef  URLParseURL_ComposeFromComponents
#define URLParseURL_ComposeFromComponents       0x2
#undef  URLParseURL_QuickResolve
#define URLParseURL_QuickResolve                0x3
#undef  URL_EnumerateSchemes
#define URL_EnumerateSchemes                    0x83E08
#undef  XURL_EnumerateSchemes
#define XURL_EnumerateSchemes                   0xA3E08
#undef  URL_EnumerateProxies
#define URL_EnumerateProxies                    0x83E09
#undef  XURL_EnumerateProxies
#define XURL_EnumerateProxies                   0xA3E09
#undef  URL_ProtocolRegister
#define URL_ProtocolRegister                    0x83E20
#undef  XURL_ProtocolRegister
#define XURL_ProtocolRegister                   0xA3E20
#undef  URL_ProtocolDeregister
#define URL_ProtocolDeregister                  0x83E21
#undef  XURL_ProtocolDeregister
#define XURL_ProtocolDeregister                 0xA3E21
#undef  Service_URLModule
#define Service_URLModule                       0x83E00
#undef  Service_URLModuleStarted
#define Service_URLModuleStarted                0x0
#undef  Service_URLModuleDying
#define Service_URLModuleDying                  0x1
#undef  Service_URLProtocolModule
#define Service_URLProtocolModule               0x83E01
#undef  Service_URLProtocolModuleStarted
#define Service_URLProtocolModuleStarted        0x0
#undef  Service_URLProtocolModuleDying
#define Service_URLProtocolModuleDying          0x1

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct url_s_                           *url_s;
      /*Abstract type for session identifers*/
typedef struct url_components                   url_components;
typedef struct url_component_sizes              url_component_sizes;

/********************
 * Type definitions *
 ********************/
typedef bits url_get_url_flags;

typedef bits url_parse_url_flags;

typedef bits url_method;

typedef int url_method_code;

typedef bits url_method_flags;

typedef bits url_fetch_status;

struct url_components
   {  char *full_url;
      char *scheme;
      char *host;
      char *port;
      char *user;
      char *password;
      char *account;
      char *path;
      char *query;
      char *fragment;
   };

struct url_component_sizes
   {  int full_url;
      int scheme;
      int host;
      int port;
      int user;
      int password;
      int account;
      int path;
      int query;
      int fragment;
   };

typedef bits url_protocol_register_flags;

typedef bits url_protocol_flags;

/************************
 * Constant definitions *
 ************************/
#define url_ALL_SESSIONS                        ((url_s) 0x0u)
#define url_GET_URL_USER_AGENT_SUPPLIED         ((url_get_url_flags) 0x1u)
#define url_GET_URL_DATA_LENGTH_SUPPLIED        ((url_get_url_flags) 0x2u)
#define url_PARSE_URL_DATA_LENGTH_SUPPLIED      ((url_parse_url_flags) 0x1u)
#define url_PARSE_URL_ESCAPE_CONTROL_CHARS      ((url_parse_url_flags) 0x2u)
#define url_METHOD_CODE                         ((url_method) 0xFFu)
#define url_METHOD_CODE_SHIFT                   8
#define url_METHOD_FLAGS                        ((url_method) 0xFF00u)
#define url_METHOD_FLAGS_SHIFT                  16
#define url_GET                                 ((url_method_code) 0x1u)
      /*Get an object*/
#define url_HEAD                                ((url_method_code) 0x2u)
      /*Get entity headers*/
#define url_OPTIONS                             ((url_method_code) 0x3u)
      /*Get server options*/
#define url_POST                                ((url_method_code) 0x4u)
      /*HTTP POST*/
#define url_TRACE                               ((url_method_code) 0x5u)
      /*HTTP TRACE*/
#define url_PUT                                 ((url_method_code) 0x8u)
      /*Store an object*/
#define url_DELETE                              ((url_method_code) 0xCu)
      /*Delete an object*/
#define url_RETR                                ((url_method_code) 0x1u)
      /*Get an object*/
#define url_LIST                                ((url_method_code) 0x1u)
      /*Get a directory listing*/
#define url_STOR                                ((url_method_code) 0x8u)
      /*Store an object*/
#define url_MKD                                 ((url_method_code) 0x9u)
      /*Create a directory*/
#define url_RMD                                 ((url_method_code) 0xAu)
      /*Remove a directory*/
#define url_RNFR                                ((url_method_code) 0xBu)
      /*Rename an object (original name)*/
#define url_RNTO                                ((url_method_code) 0xBu)
      /*Rename an object (new name)*/
#define url_DELE                                ((url_method_code) 0xCu)
      /*Delete an object*/
#define url_STOU                                ((url_method_code) 0xDu)
      /*Store an object with a unique name*/
#define url_CONNECTED                           ((url_fetch_status) 0x1u)
#define url_SENT_REQUEST                        ((url_fetch_status) 0x2u)
#define url_SENT_DATA                           ((url_fetch_status) 0x4u)
#define url_RESPONSE_RECEIVED                   ((url_fetch_status) 0x8u)
#define url_TRANSFER_IN_PROGRESS                ((url_fetch_status) 0x10u)
#define url_ALL_DATA_RECEIVED                   ((url_fetch_status) 0x20u)
#define url_TRANSFER_ABORTED                    ((url_fetch_status) 0x40u)
#define url_HAS_PROTOCOL_FLAGS                  ((url_protocol_register_flags) 0x1u)
#define url_HAS_DEFAULT_PORT                    ((url_protocol_register_flags) 0x2u)
#define url_NON_UNIX_PATH                       ((url_protocol_flags) 0x1u)
#define url_DONT_PARSE                          ((url_protocol_flags) 0x2u)
#define url_ALLOW_USERNAME                      ((url_protocol_flags) 0x4u)
#define url_ALLOW_HASH_IN_HOSTNAME              ((url_protocol_flags) 0x8u)
#define url_NO_HOSTNAME                         ((url_protocol_flags) 0x10u)
#define url_REMOVE_LEADING_UP_COMPONENTS        ((url_protocol_flags) 0x20u)
#define error_URL_BAD_SESSION                   0x80DE00u
      /*Bad session handle passed to URL fetcher*/
#define error_URL_NO_MEMORY                     0x80DE01u
      /*Out of memory*/
#define error_URL_NO_FETCHER                    0x80DE02u
      /*No fetcher could be found*/
#define error_URL_UNKNOWN_SWI                   0x80DE03u
      /*Protocol module returned an unknown SWI error*/
#define error_URL_BAD_FETCH                     0x80DE04u
      /*Fetch already started in this session*/
#define error_URL_FETCH_FINISHED                0x80DE05u
      /*Fetch already finished*/
#define error_URL_PROTOCOL_CLAIMED              0x80DE06u
      /*Protocol already claimed*/
#define error_URL_NO_FETCH                      0x80DE07u
      /*No fetch in progress*/
#define error_URL_BAD_MESSAGE                   0x80DE08u
      /*Message not found in messages file*/
#define error_URL_NOT_PARSEABLE                 0x80DE0Au
      /*URL could not be parsed*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      url_register()
 *
 * Description:   Initialises a client session with the URL module
 *
 * Input:         flags - value of R0 on entry
 *
 * Output:        session - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E00.
 */

extern os_error *xurl_register (bits flags,
      url_s *session);
extern url_s url_register (bits flags);

/* ------------------------------------------------------------------------
 * Function:      url_get_url()
 *
 * Description:   Instigates the transfer of data to or from a server
 *
 * Input:         flags - value of R0 on entry
 *                session - value of R1 on entry
 *                method - value of R2 on entry
 *                url - value of R3 on entry
 *                data - value of R4 on entry
 *                data_length - value of R5 on entry
 *                user_agent - value of R6 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E01.
 */

extern os_error *xurl_get_url (url_get_url_flags flags,
      url_s session,
      url_method method,
      char const *url,
      byte const *data,
      int data_length,
      char const *user_agent,
      url_fetch_status *status);
extern url_fetch_status url_get_url (url_get_url_flags flags,
      url_s session,
      url_method method,
      char const *url,
      byte const *data,
      int data_length,
      char const *user_agent);

/* ------------------------------------------------------------------------
 * Function:      url_status()
 *
 * Description:   Checks the status of a URL fetch
 *
 * Input:         flags - value of R0 on entry
 *                session - value of R1 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *                response_code - value of R2 on exit
 *                bytes_read - value of R3 on exit
 *                total_size - value of R4 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E02.
 */

extern os_error *xurl_status (bits flags,
      url_s session,
      url_fetch_status *status,
      bits *response_code,
      int *bytes_read,
      int *total_size);
extern url_fetch_status url_status (bits flags,
      url_s session,
      bits *response_code,
      int *bytes_read,
      int *total_size);

/* ------------------------------------------------------------------------
 * Function:      url_read_data()
 *
 * Description:   Reads data from a URL fetch
 *
 * Input:         flags - value of R0 on entry
 *                session - value of R1 on entry
 *                buffer - value of R2 on entry
 *                buffer_size - value of R3 on entry
 *
 * Output:        status - value of R0 on exit
 *                bytes_read - value of R4 on exit (X version only)
 *                bytes_remaining - value of R5 on exit
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E03.
 */

extern os_error *xurl_read_data (bits flags,
      url_s session,
      byte *buffer,
      int buffer_size,
      url_fetch_status *status,
      int *bytes_read,
      int *bytes_remaining);
extern int url_read_data (bits flags,
      url_s session,
      byte *buffer,
      int buffer_size,
      url_fetch_status *status,
      int *bytes_remaining);

/* ------------------------------------------------------------------------
 * Function:      url_set_proxy__enable()
 *
 * Description:   Enables use of a proxy for URL fetches
 *
 * Input:         flags - value of R0 on entry
 *                session - value of R1 on entry
 *                proxy_url - value of R2 on entry
 *                scheme - value of R3 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E04 with R4 = 0x0.
 */

extern os_error *xurl_set_proxy__enable (bits flags,
      url_s session,
      char const *proxy_url,
      char const *scheme,
      url_fetch_status *status);
extern url_fetch_status url_set_proxy__enable (bits flags,
      url_s session,
      char const *proxy_url,
      char const *scheme);

/* ------------------------------------------------------------------------
 * Function:      url_set_proxy__disable()
 *
 * Description:   Disables use of a proxy for URL fetches
 *
 * Input:         flags - value of R0 on entry
 *                session - value of R1 on entry
 *                proxy_url - value of R2 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E04 with R4 = 0x1.
 */

extern os_error *xurl_set_proxy__disable (bits flags,
      url_s session,
      char const *proxy_url,
      url_fetch_status *status);
extern url_fetch_status url_set_proxy__disable (bits flags,
      url_s session,
      char const *proxy_url);

/* ------------------------------------------------------------------------
 * Function:      url_stop()
 *
 * Description:   Aborts a URL fetch
 *
 * Input:         flags - value of R0 on entry
 *                session - value of R1 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E05.
 */

extern os_error *xurl_stop (bits flags,
      url_s session,
      url_fetch_status *status);
extern url_fetch_status url_stop (bits flags,
      url_s session);

/* ------------------------------------------------------------------------
 * Function:      url_deregister()
 *
 * Description:   Terminates a client session with the URL module
 *
 * Input:         flags - value of R0 on entry
 *                session - value of R1 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E06.
 */

extern os_error *xurl_deregister (bits flags,
      url_s session,
      url_fetch_status *status);
extern url_fetch_status url_deregister (bits flags,
      url_s session);

/* ------------------------------------------------------------------------
 * Function:      urlparseurl_return_lengths()
 *
 * Description:   Returns the space needed for each component of a URL
 *
 * Input:         flags - value of R0 on entry
 *                base_url - value of R2 on entry
 *                relative_url - value of R3 on entry
 *                block - value of R4 on entry
 *                block_size - value of R5 on entry
 *
 * Output:        flags_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E07 with R1 = 0x0.
 */

extern os_error *xurlparseurl_return_lengths (url_parse_url_flags flags,
      char const *base_url,
      char const *relative_url,
      url_component_sizes *block,
      int block_size,
      bits *flags_out);
extern bits urlparseurl_return_lengths (url_parse_url_flags flags,
      char const *base_url,
      char const *relative_url,
      url_component_sizes *block,
      int block_size);

/* ------------------------------------------------------------------------
 * Function:      urlparseurl_return_data()
 *
 * Description:   Returns the components of a URL
 *
 * Input:         flags - value of R0 on entry
 *                base_url - value of R2 on entry
 *                relative_url - value of R3 on entry
 *                block - value of R4 on entry
 *                block_size - value of R5 on entry
 *
 * Output:        flags_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E07 with R1 = 0x1.
 */

extern os_error *xurlparseurl_return_data (url_parse_url_flags flags,
      char const *base_url,
      char const *relative_url,
      url_components const *block,
      int block_size,
      bits *flags_out);
extern bits urlparseurl_return_data (url_parse_url_flags flags,
      char const *base_url,
      char const *relative_url,
      url_components const *block,
      int block_size);

/* ------------------------------------------------------------------------
 * Function:      urlparseurl_compose_from_components()
 *
 * Description:   Builds a URL from its components
 *
 * Input:         flags - value of R0 on entry
 *                block - value of R4 on entry
 *                block_size - value of R5 on entry
 *
 * Output:        flags_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E07 with R1 = 0x2, R2 = 0x0, R3 = 0x0.
 */

extern os_error *xurlparseurl_compose_from_components (url_parse_url_flags flags,
      url_components const *block,
      int block_size,
      bits *flags_out);
extern bits urlparseurl_compose_from_components (url_parse_url_flags flags,
      url_components const *block,
      int block_size);

/* ------------------------------------------------------------------------
 * Function:      urlparseurl_quick_resolve()
 *
 * Description:   Resolves a relative URL
 *
 * Input:         flags - value of R0 on entry
 *                base_url - value of R2 on entry
 *                relative_url - value of R3 on entry
 *                url_buffer - value of R4 on entry
 *                url_buffer_size - value of R5 on entry
 *
 * Output:        flags_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E07 with R1 = 0x3.
 */

extern os_error *xurlparseurl_quick_resolve (url_parse_url_flags flags,
      char const *base_url,
      char const *relative_url,
      char *url_buffer,
      int url_buffer_size,
      bits *flags_out);
extern bits urlparseurl_quick_resolve (url_parse_url_flags flags,
      char const *base_url,
      char const *relative_url,
      char *url_buffer,
      int url_buffer_size);

/* ------------------------------------------------------------------------
 * Function:      url_enumerate_schemes()
 *
 * Description:   Enumerates the URL schemes known to the URL module
 *
 * Input:         flags - value of R0 on entry
 *                context - value of R1 on entry
 *
 * Output:        status - value of R0 on exit
 *                context_out - value of R1 on exit (X version only)
 *                scheme - value of R2 on exit
 *                description - value of R3 on exit
 *                swi_base - value of R4 on exit
 *                version - value of R5 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E08.
 */

extern os_error *xurl_enumerate_schemes (bits flags,
      bits context,
      bits *status,
      bits *context_out,
      char **scheme,
      char **description,
      bits *swi_base,
      bits *version);
extern bits url_enumerate_schemes (bits flags,
      bits context,
      bits *status,
      char **scheme,
      char **description,
      bits *swi_base,
      bits *version);

/* ------------------------------------------------------------------------
 * Function:      url_enumerate_proxies()
 *
 * Description:   Enumerates proxies known to the URL module
 *
 * Input:         flags - value of R0 on entry
 *                session - value of R1 on entry
 *                context - value of R2 on entry
 *
 * Output:        status - value of R0 on exit
 *                context_out - value of R2 on exit (X version only)
 *                scheme - value of R3 on exit
 *                proxy_url - value of R4 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E09.
 */

extern os_error *xurl_enumerate_proxies (bits flags,
      url_s session,
      bits context,
      bits *status,
      bits *context_out,
      char **scheme,
      char **proxy_url);
extern bits url_enumerate_proxies (bits flags,
      url_s session,
      bits context,
      bits *status,
      char **scheme,
      char **proxy_url);

/* ------------------------------------------------------------------------
 * Function:      url_protocol_register()
 *
 * Description:   Registers a protocol with the URL fetcher module
 *
 * Input:         flags - value of R0 on entry
 *                swi_base - value of R1 on entry
 *                scheme - value of R2 on entry
 *                version - value of R3 on entry
 *                name - value of R4 on entry
 *                protocol_flags - value of R5 on entry
 *                default_port - value of R6 on entry
 *
 * Output:        flags_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E20.
 */

extern os_error *xurl_protocol_register (url_protocol_register_flags flags,
      bits swi_base,
      char const *scheme,
      bits version,
      char const *name,
      url_protocol_flags protocol_flags,
      bits default_port,
      int *flags_out);
extern int url_protocol_register (url_protocol_register_flags flags,
      bits swi_base,
      char const *scheme,
      bits version,
      char const *name,
      url_protocol_flags protocol_flags,
      bits default_port);

/* ------------------------------------------------------------------------
 * Function:      url_protocol_deregister()
 *
 * Description:   Deregisters a protocol with the URL fetcher module
 *
 * Input:         flags - value of R0 on entry
 *                swi_base - value of R1 on entry
 *
 * Output:        flags_out - value of R0 on exit
 *                sessions_affected - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x83E21.
 */

extern os_error *xurl_protocol_deregister (bits flags,
      bits swi_base,
      bits *flags_out,
      bits *sessions_affected);
extern bits url_protocol_deregister (bits flags,
      bits swi_base,
      bits *flags_out);

/* ------------------------------------------------------------------------
 * Function:      service_url_module()
 *
 * Description:   Informs URL protocol modules of URL module events
 *
 * Input:         reason_code - value of R0 on entry
 *                version - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x83E00.
 */

extern os_error *xservice_url_module (bits reason_code,
      bits version);
extern void service_url_module (bits reason_code,
      bits version);

/* ------------------------------------------------------------------------
 * Function:      service_url_module_started()
 *
 * Description:   Informs URL protocol modules that the URL module has
 *                started
 *
 * Input:         version - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x0, R1 = 0x83E00.
 */

extern os_error *xservice_url_module_started (bits version);
extern void service_url_module_started (bits version);

/* ------------------------------------------------------------------------
 * Function:      service_url_module_dying()
 *
 * Description:   Informs URL protocol modules that the URL module is dying
 *
 * Input:         version - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x1, R1 = 0x83E00.
 */

extern os_error *xservice_url_module_dying (bits version);
extern void service_url_module_dying (bits version);

/* ------------------------------------------------------------------------
 * Function:      service_url_protocol_module()
 *
 * Description:   Informs interested parties of URL protocol module events
 *
 * Input:         reason_code - value of R0 on entry
 *                scheme - value of R2 on entry
 *                swi_base - value of R3 on entry
 *                description - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x83E01.
 */

extern os_error *xservice_url_protocol_module (bits reason_code,
      char const *scheme,
      bits swi_base,
      char const *description);
extern void service_url_protocol_module (bits reason_code,
      char const *scheme,
      bits swi_base,
      char const *description);

/* ------------------------------------------------------------------------
 * Function:      service_url_protocol_module_started()
 *
 * Description:   Informs interested parties that a new URL protocol module
 *                has started
 *
 * Input:         scheme - value of R2 on entry
 *                swi_base - value of R3 on entry
 *                description - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x0, R1 = 0x83E01.
 */

extern os_error *xservice_url_protocol_module_started (char const *scheme,
      bits swi_base,
      char const *description);
extern void service_url_protocol_module_started (char const *scheme,
      bits swi_base,
      char const *description);

/* ------------------------------------------------------------------------
 * Function:      service_url_protocol_module_dying()
 *
 * Description:   Informs interested parties that a URL protocol module is
 *                dying
 *
 * Input:         scheme - value of R2 on entry
 *                swi_base - value of R3 on entry
 *                description - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x30 with R0 = 0x1, R1 = 0x83E01.
 */

extern os_error *xservice_url_protocol_module_dying (char const *scheme,
      bits swi_base,
      char const *description);
extern void service_url_protocol_module_dying (char const *scheme,
      bits swi_base,
      char const *description);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
