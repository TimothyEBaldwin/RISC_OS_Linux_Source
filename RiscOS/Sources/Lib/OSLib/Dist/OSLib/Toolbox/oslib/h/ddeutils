#ifndef ddeutils_H
#define ddeutils_H

/* C header file for DDEUtils
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:37 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 8 Sept 1996
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
#undef  DDEUtils_Prefix
#define DDEUtils_Prefix                         0x42580
#undef  XDDEUtils_Prefix
#define XDDEUtils_Prefix                        0x62580
#undef  DDEUtils_SetCLSize
#define DDEUtils_SetCLSize                      0x42581
#undef  XDDEUtils_SetCLSize
#define XDDEUtils_SetCLSize                     0x62581
#undef  DDEUtils_SetCL
#define DDEUtils_SetCL                          0x42582
#undef  XDDEUtils_SetCL
#define XDDEUtils_SetCL                         0x62582
#undef  DDEUtils_GetCLSize
#define DDEUtils_GetCLSize                      0x42583
#undef  XDDEUtils_GetCLSize
#define XDDEUtils_GetCLSize                     0x62583
#undef  DDEUtils_GetCl
#define DDEUtils_GetCl                          0x42584
#undef  XDDEUtils_GetCl
#define XDDEUtils_GetCl                         0x62584
#undef  DDEUtils_ThrowbackRegister
#define DDEUtils_ThrowbackRegister              0x42585
#undef  XDDEUtils_ThrowbackRegister
#define XDDEUtils_ThrowbackRegister             0x62585
#undef  DDEUtils_ThrowbackUnRegister
#define DDEUtils_ThrowbackUnRegister            0x42586
#undef  XDDEUtils_ThrowbackUnRegister
#define XDDEUtils_ThrowbackUnRegister           0x62586
#undef  DDEUtils_ThrowbackStart
#define DDEUtils_ThrowbackStart                 0x42587
#undef  XDDEUtils_ThrowbackStart
#define XDDEUtils_ThrowbackStart                0x62587
#undef  DDEUtils_ThrowbackSend
#define DDEUtils_ThrowbackSend                  0x42588
#undef  XDDEUtils_ThrowbackSend
#define XDDEUtils_ThrowbackSend                 0x62588
#undef  DDEUtils_ThrowbackEnd
#define DDEUtils_ThrowbackEnd                   0x42589
#undef  XDDEUtils_ThrowbackEnd
#define XDDEUtils_ThrowbackEnd                  0x62589
#undef  DDEUtils_ReadPrefix
#define DDEUtils_ReadPrefix                     0x4258A
#undef  XDDEUtils_ReadPrefix
#define XDDEUtils_ReadPrefix                    0x6258A
#undef  DDEUtils_FlushCL
#define DDEUtils_FlushCL                        0x4258B
#undef  XDDEUtils_FlushCL
#define XDDEUtils_FlushCL                       0x6258B

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct ddeutils_message_processing_file ddeutils_message_processing_file;
typedef struct ddeutils_message_errors_in       ddeutils_message_errors_in;
typedef struct ddeutils_message_error_details   ddeutils_message_error_details;
typedef struct ddeutils_message_info_for_file   ddeutils_message_info_for_file;
typedef struct ddeutils_message_info_details    ddeutils_message_info_details;
typedef struct ddeutils_full_message_processing_file ddeutils_full_message_processing_file;
typedef struct ddeutils_full_message_errors_in  ddeutils_full_message_errors_in;
typedef struct ddeutils_full_message_error_details ddeutils_full_message_error_details;
typedef struct ddeutils_full_message_info_for_file ddeutils_full_message_info_for_file;
typedef struct ddeutils_full_message_info_details ddeutils_full_message_info_details;

/********************
 * Type definitions *
 ********************/
struct ddeutils_message_processing_file
   {  char file_name [236];
   };

struct ddeutils_message_errors_in
   {  char file_name [236];
   };

struct ddeutils_message_error_details
   {  int line_no;
      int severity;
      char message [228];
   };

struct ddeutils_message_info_for_file
   {  char file_name [236];
   };

struct ddeutils_message_info_details
   {  int line_no;
      int severity;
      char message [228];
   };

struct ddeutils_full_message_processing_file
   {  wimp_MESSAGE_HEADER_MEMBERS
      char file_name [236];
   };

struct ddeutils_full_message_errors_in
   {  wimp_MESSAGE_HEADER_MEMBERS
      char file_name [236];
   };

struct ddeutils_full_message_error_details
   {  wimp_MESSAGE_HEADER_MEMBERS
      int line_no;
      int severity;
      char message [228];
   };

struct ddeutils_full_message_info_for_file
   {  wimp_MESSAGE_HEADER_MEMBERS
      char file_name [236];
   };

struct ddeutils_full_message_info_details
   {  wimp_MESSAGE_HEADER_MEMBERS
      int line_no;
      int severity;
      char message [228];
   };

/************************
 * Constant definitions *
 ************************/
#define ddeutils_SEVERITY_WARNING               0
#define ddeutils_SEVERITY_ERROR                 1
#define ddeutils_SEVERITY_SERIOUS_ERROR         2
#define ddeutils_THROWBACK_PROCESSING           0
#define ddeutils_THROWBACK_ERROR_DETAILS        1
#define ddeutils_THROWBACK_INFO_DETAILS         2
#define error_DDE_UTILS_UNKNOWN_SWI             0x20600u
      /*Unknown DDEUtils SWI*/
#define error_DDE_UTILS_NO_CLI_BUFFER           0x20601u
      /*CLI buffer not set*/
#define error_DDE_UTILS_NOT_DESKTOP             0x20602u
      /*Throwback not available outside the desktop*/
#define error_DDE_UTILS_NO_TASK                 0x20603u
      /*No task registered for throwback*/
#define error_DDE_UTILS_ALREADY_REGISTERED      0x20604u
      /*Another task is registered for throwback*/
#define error_DDE_UTILS_NOT_REGISTERED          0x20605u
      /*Task not registered for throwback*/
#define message_DDE_UTILS_THROWBACK_START       0x42580u
#define message_DDE_UTILS_PROCESSING_FILE       0x42581u
#define message_DDE_UTILS_ERRORS_IN             0x42582u
#define message_DDE_UTILS_ERROR_DETAILS         0x42583u
#define message_DDE_UTILS_THROWBACK_END         0x42584u
#define message_DDE_UTILS_INFO_FOR_FILE         0x42585u
#define message_DDE_UTILS_INFO_DETAILS          0x42586u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      ddeutils_prefix()
 *
 * Description:   Sets a directory name to be prefixed to all relative file
 *                names used by this task
 *
 * Input:         dir_name - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x42580.
 */

extern os_error *xddeutils_prefix (char const *dir_name);
__swi (0x42580) void ddeutils_prefix (char const *dir_name);

/* ------------------------------------------------------------------------
 * Function:      ddeutils_set_cl_size()
 *
 * Description:   Allocates a buffer for an extended command line of the
 *                given size
 *
 * Input:         size - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x42581.
 */

extern os_error *xddeutils_set_cl_size (int size);
__swi (0x42581) void ddeutils_set_cl_size (int size);

/* ------------------------------------------------------------------------
 * Function:      ddeutils_set_cl()
 *
 * Description:   Copies a command line tail into the (previously
 *                allocated) extended command line buffer
 *
 * Input:         tail - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x42582.
 */

extern os_error *xddeutils_set_cl (char const *tail);
__swi (0x42582) void ddeutils_set_cl (char const *tail);

/* ------------------------------------------------------------------------
 * Function:      ddeutils_get_cl_size()
 *
 * Description:   Reads length of the extended command line
 *
 * Output:        size - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42583.
 */

extern os_error *xddeutils_get_cl_size (int *size);
__swi (0x42583) int ddeutils_get_cl_size (void);

/* ------------------------------------------------------------------------
 * Function:      ddeutils_get_cl()
 *
 * Description:   Fetches a program's extended command line
 *
 * Input:         tail - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x42584.
 */

extern os_error *xddeutils_get_cl (char *tail);
__swi (0x42584) void ddeutils_get_cl (char *tail);

/* ------------------------------------------------------------------------
 * Function:      ddeutils_throwback_register()
 *
 * Description:   Registers the task which will receive any throwback
 *                messages issued by the DDEUtils module
 *
 * Input:         task - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x42585.
 */

extern os_error *xddeutils_throwback_register (wimp_t task);
__swi (0x42585) void ddeutils_throwback_register (wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      ddeutils_throwback_un_register()
 *
 * Description:   Calls SWI 0x42586
 *
 * Input:         task - value of R0 on entry
 */

extern os_error *xddeutils_throwback_un_register (wimp_t task);
__swi (0x42586) void ddeutils_throwback_un_register (wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      ddeutils_throwback_start()
 *
 * Description:   Calls SWI 0x42587
 */

extern os_error *xddeutils_throwback_start (void);
__swi (0x42587) void ddeutils_throwback_start (void);

/* ------------------------------------------------------------------------
 * Function:      ddeutils_throwback_send()
 *
 * Description:   Calls SWI 0x42588
 *
 * Input:         reason - value of R0 on entry
 *                file_name - value of R2 on entry
 *                line_no - value of R3 on entry
 *                severity - value of R4 on entry
 *                message - value of R5 on entry
 */

extern os_error *xddeutils_throwback_send (int reason,
      char const *file_name,
      int line_no,
      int severity,
      char const *message);
extern void ddeutils_throwback_send (int reason,
      char const *file_name,
      int line_no,
      int severity,
      char const *message);

/* ------------------------------------------------------------------------
 * Function:      ddeutils_throwback_end()
 *
 * Description:   Calls SWI 0x42589
 */

extern os_error *xddeutils_throwback_end (void);
extern void ddeutils_throwback_end (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
