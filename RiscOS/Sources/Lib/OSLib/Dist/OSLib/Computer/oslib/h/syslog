#ifndef syslog_H
#define syslog_H

/* C header file for SysLog
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:54 2007
 * Tom Hughes, tom@compton.nu, 22 Sep 2002
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
#undef  SysLog_LogMessage
#define SysLog_LogMessage                       0x4C880
#undef  XSysLog_LogMessage
#define XSysLog_LogMessage                      0x6C880
#undef  SysLog_LogMessageByHandle
#define SysLog_LogMessageByHandle               0x4C880
#undef  XSysLog_LogMessageByHandle
#define XSysLog_LogMessageByHandle              0x6C880
#undef  SysLog_GetLogLevel
#define SysLog_GetLogLevel                      0x4C881
#undef  XSysLog_GetLogLevel
#define XSysLog_GetLogLevel                     0x6C881
#undef  SysLog_GetLogLevelByHandle
#define SysLog_GetLogLevelByHandle              0x4C881
#undef  XSysLog_GetLogLevelByHandle
#define XSysLog_GetLogLevelByHandle             0x6C881
#undef  SysLog_FlushLog
#define SysLog_FlushLog                         0x4C882
#undef  XSysLog_FlushLog
#define XSysLog_FlushLog                        0x6C882
#undef  SysLog_FlushLogByHandle
#define SysLog_FlushLogByHandle                 0x4C882
#undef  XSysLog_FlushLogByHandle
#define XSysLog_FlushLogByHandle                0x6C882
#undef  SysLog_SetLogLevel
#define SysLog_SetLogLevel                      0x4C883
#undef  XSysLog_SetLogLevel
#define XSysLog_SetLogLevel                     0x6C883
#undef  SysLog_SetLogLevelByHandle
#define SysLog_SetLogLevelByHandle              0x4C883
#undef  XSysLog_SetLogLevelByHandle
#define XSysLog_SetLogLevelByHandle             0x6C883
#undef  SysLog_LogUnstamped
#define SysLog_LogUnstamped                     0x4C884
#undef  XSysLog_LogUnstamped
#define XSysLog_LogUnstamped                    0x6C884
#undef  SysLog_LogUnstampedByHandle
#define SysLog_LogUnstampedByHandle             0x4C884
#undef  XSysLog_LogUnstampedByHandle
#define XSysLog_LogUnstampedByHandle            0x6C884
#undef  SysLog_Indent
#define SysLog_Indent                           0x4C885
#undef  XSysLog_Indent
#define XSysLog_Indent                          0x6C885
#undef  SysLog_IndentByHandle
#define SysLog_IndentByHandle                   0x4C885
#undef  XSysLog_IndentByHandle
#define XSysLog_IndentByHandle                  0x6C885
#undef  SysLog_UnIndent
#define SysLog_UnIndent                         0x4C886
#undef  XSysLog_UnIndent
#define XSysLog_UnIndent                        0x6C886
#undef  SysLog_UnIndentByHandle
#define SysLog_UnIndentByHandle                 0x4C886
#undef  XSysLog_UnIndentByHandle
#define XSysLog_UnIndentByHandle                0x6C886
#undef  SysLog_NoIndent
#define SysLog_NoIndent                         0x4C887
#undef  XSysLog_NoIndent
#define XSysLog_NoIndent                        0x6C887
#undef  SysLog_NoIndentByHandle
#define SysLog_NoIndentByHandle                 0x4C887
#undef  XSysLog_NoIndentByHandle
#define XSysLog_NoIndentByHandle                0x6C887
#undef  SysLog_OpenSessionLog
#define SysLog_OpenSessionLog                   0x4C888
#undef  XSysLog_OpenSessionLog
#define XSysLog_OpenSessionLog                  0x6C888
#undef  SysLog_OpenSessionLogByHandle
#define SysLog_OpenSessionLogByHandle           0x4C888
#undef  XSysLog_OpenSessionLogByHandle
#define XSysLog_OpenSessionLogByHandle          0x6C888
#undef  SysLog_CloseSessionLog
#define SysLog_CloseSessionLog                  0x4C889
#undef  XSysLog_CloseSessionLog
#define XSysLog_CloseSessionLog                 0x6C889
#undef  SysLog_CloseSessionLogByHandle
#define SysLog_CloseSessionLogByHandle          0x4C889
#undef  XSysLog_CloseSessionLogByHandle
#define XSysLog_CloseSessionLogByHandle         0x6C889
#undef  SysLog_LogData
#define SysLog_LogData                          0x4C88A
#undef  XSysLog_LogData
#define XSysLog_LogData                         0x6C88A
#undef  SysLog_LogDataByHandle
#define SysLog_LogDataByHandle                  0x4C88A
#undef  XSysLog_LogDataByHandle
#define XSysLog_LogDataByHandle                 0x6C88A
#undef  SysLog_ReadErrorMessage
#define SysLog_ReadErrorMessage                 0x4C88C
#undef  XSysLog_ReadErrorMessage
#define XSysLog_ReadErrorMessage                0x6C88C
#undef  SysLog_LogComplete
#define SysLog_LogComplete                      0x4C88D
#undef  XSysLog_LogComplete
#define XSysLog_LogComplete                     0x6C88D
#undef  SysLog_LogCompleteByHandle
#define SysLog_LogCompleteByHandle              0x4C88D
#undef  XSysLog_LogCompleteByHandle
#define XSysLog_LogCompleteByHandle             0x6C88D

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      syslog_log_message()
 *
 * Description:   Log a message in a named system log or session log
 *
 * Input:         name_or_handle - value of R0 on entry
 *                message - value of R1 on entry
 *                priority - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x4C880.
 */

extern os_error *xsyslog_log_message (char const *name_or_handle,
      char const *message,
      int priority);
__swi (0x4C880) void syslog_log_message (char const *name_or_handle,
      char const *message,
      int priority);

/* ------------------------------------------------------------------------
 * Function:      syslog_log_message_by_handle()
 *
 * Description:   Log a message in a session log
 *
 * Input:         handle - value of R0 on entry
 *                message - value of R1 on entry
 *                priority - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x4C880.
 */

extern os_error *xsyslog_log_message_by_handle (bits handle,
      char const *message,
      int priority);
__swi (0x4C880) void syslog_log_message_by_handle (bits handle,
      char const *message,
      int priority);

/* ------------------------------------------------------------------------
 * Function:      syslog_get_log_level()
 *
 * Description:   Read the current logging level for a particular log
 *
 * Input:         name_or_handle - value of R0 on entry
 *
 * Output:        priority - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4C881.
 */

extern os_error *xsyslog_get_log_level (char const *name_or_handle,
      int *priority);
__swi (0x4C881) int syslog_get_log_level (char const *name_or_handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_get_log_level_by_handle()
 *
 * Description:   Read the current logging level for a particular session
 *                log
 *
 * Input:         handle - value of R0 on entry
 *
 * Output:        priority - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4C881.
 */

extern os_error *xsyslog_get_log_level_by_handle (bits handle,
      int *priority);
__swi (0x4C881) int syslog_get_log_level_by_handle (bits handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_flush_log()
 *
 * Description:   Writes any cached data from memory to the logs and closes
 *                the files
 *
 * Input:         name_or_handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C882.
 */

extern os_error *xsyslog_flush_log (char const *name_or_handle);
__swi (0x4C882) void syslog_flush_log (char const *name_or_handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_flush_log_by_handle()
 *
 * Description:   Writes any cached data from memory to the logs and closes
 *                the files
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C882.
 */

extern os_error *xsyslog_flush_log_by_handle (bits handle);
__swi (0x4C882) void syslog_flush_log_by_handle (bits handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_set_log_level()
 *
 * Description:   Set the current logging level for a particular log
 *
 * Input:         name_or_handle - value of R0 on entry
 *                priority - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4C883.
 */

extern os_error *xsyslog_set_log_level (char const *name_or_handle,
      int priority);
__swi (0x4C883) void syslog_set_log_level (char const *name_or_handle,
      int priority);

/* ------------------------------------------------------------------------
 * Function:      syslog_set_log_level_by_handle()
 *
 * Description:   Set the current logging level for a particular log
 *
 * Input:         handle - value of R0 on entry
 *                priority - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4C883.
 */

extern os_error *xsyslog_set_log_level_by_handle (bits handle,
      int priority);
__swi (0x4C883) void syslog_set_log_level_by_handle (bits handle,
      int priority);

/* ------------------------------------------------------------------------
 * Function:      syslog_log_unstamped()
 *
 * Description:   Log a message in a named system log or session log
 *                without stamping it with the time and date
 *
 * Input:         name_or_handle - value of R0 on entry
 *                message - value of R1 on entry
 *                priority - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x4C884.
 */

extern os_error *xsyslog_log_unstamped (char const *name_or_handle,
      char const *message,
      int priority);
__swi (0x4C884) void syslog_log_unstamped (char const *name_or_handle,
      char const *message,
      int priority);

/* ------------------------------------------------------------------------
 * Function:      syslog_log_unstamped_by_handle()
 *
 * Description:   Log a message in a session log without stamping it with
 *                the time and date
 *
 * Input:         handle - value of R0 on entry
 *                message - value of R1 on entry
 *                priority - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x4C884.
 */

extern os_error *xsyslog_log_unstamped_by_handle (bits handle,
      char const *message,
      int priority);
__swi (0x4C884) void syslog_log_unstamped_by_handle (bits handle,
      char const *message,
      int priority);

/* ------------------------------------------------------------------------
 * Function:      syslog_indent()
 *
 * Description:   Increases the indentation for a log
 *
 * Input:         name_or_handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C885.
 */

extern os_error *xsyslog_indent (char const *name_or_handle);
__swi (0x4C885) void syslog_indent (char const *name_or_handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_indent_by_handle()
 *
 * Description:   Increases the indentation for a log
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C885.
 */

extern os_error *xsyslog_indent_by_handle (bits handle);
__swi (0x4C885) void syslog_indent_by_handle (bits handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_un_indent()
 *
 * Description:   Decreases the indentation for a log
 *
 * Input:         name_or_handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C886.
 */

extern os_error *xsyslog_un_indent (char const *name_or_handle);
__swi (0x4C886) void syslog_un_indent (char const *name_or_handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_un_indent_by_handle()
 *
 * Description:   Decreases the indentation for a log
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C886.
 */

extern os_error *xsyslog_un_indent_by_handle (bits handle);
__swi (0x4C886) void syslog_un_indent_by_handle (bits handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_no_indent()
 *
 * Description:   Resets the indentation for a log
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C887.
 */

extern os_error *xsyslog_no_indent (char const *handle);
__swi (0x4C887) void syslog_no_indent (char const *handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_no_indent_by_handle()
 *
 * Description:   Resets the indentation for a log
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C887.
 */

extern os_error *xsyslog_no_indent_by_handle (bits handle);
__swi (0x4C887) void syslog_no_indent_by_handle (bits handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_open_session_log()
 *
 * Description:   Open a session log file with a particular priority -
 *                Prefer SysLog_OpenSessionLogByHandle
 *
 * Input:         name - value of R0 on entry
 *                priority - value of R1 on entry
 *
 * Output:        handle - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4C888.
 */

extern os_error *xsyslog_open_session_log (char const *name,
      int priority,
      char **handle);
__swi (0x4C888) char *syslog_open_session_log (char const *name,
      int priority);

/* ------------------------------------------------------------------------
 * Function:      syslog_open_session_log_by_handle()
 *
 * Description:   Open a session log file with a particular priority
 *
 * Input:         name - value of R0 on entry
 *                priority - value of R1 on entry
 *
 * Output:        handle - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4C888.
 */

extern os_error *xsyslog_open_session_log_by_handle (char const *name,
      int priority,
      bits *handle);
__swi (0x4C888) bits syslog_open_session_log_by_handle (char const *name,
      int priority);

/* ------------------------------------------------------------------------
 * Function:      syslog_close_session_log()
 *
 * Description:   Close a session log and append it's date to the mail log
 *                - Prefer SysLog_CloseSessionLogByHandle
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C889.
 */

extern os_error *xsyslog_close_session_log (char const *handle);
__swi (0x4C889) void syslog_close_session_log (char const *handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_close_session_log_by_handle()
 *
 * Description:   Close a session log and append it's date to the mail log
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C889.
 */

extern os_error *xsyslog_close_session_log_by_handle (bits handle);
__swi (0x4C889) void syslog_close_session_log_by_handle (bits handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_log_data()
 *
 * Description:   Log a block of data as a hex dump
 *
 * Input:         name_or_handle - value of R0 on entry
 *                priority - value of R1 on entry
 *                data - value of R2 on entry
 *                data_size - value of R3 on entry
 *                base_address - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4C88A.
 */

extern os_error *xsyslog_log_data (char const *name_or_handle,
      int priority,
      byte const *data,
      int data_size,
      byte const *base_address);
extern void syslog_log_data (char const *name_or_handle,
      int priority,
      byte const *data,
      int data_size,
      byte const *base_address);

/* ------------------------------------------------------------------------
 * Function:      syslog_log_data_by_handle()
 *
 * Description:   Log a block of data as a hex dump
 *
 * Input:         handle - value of R0 on entry
 *                priority - value of R1 on entry
 *                data - value of R2 on entry
 *                data_size - value of R3 on entry
 *                base_address - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4C88A.
 */

extern os_error *xsyslog_log_data_by_handle (bits handle,
      int priority,
      byte const *data,
      int data_size,
      byte const *base_address);
extern void syslog_log_data_by_handle (bits handle,
      int priority,
      byte const *data,
      int data_size,
      byte const *base_address);

/* ------------------------------------------------------------------------
 * Function:      syslog_read_error_message()
 *
 * Description:   Decodes the errors returned by the stack
 *
 * Input:         error_number - value of R0 on entry
 *
 * Output:        error_message - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4C88C.
 */

extern os_error *xsyslog_read_error_message (int error_number,
      char **error_message);
__swi (0x4C88C) char *syslog_read_error_message (int error_number);

/* ------------------------------------------------------------------------
 * Function:      syslog_log_complete()
 *
 * Description:   Flushes the names log and deallocates the space set aside
 *                for it
 *
 * Input:         name_or_handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C88D.
 */

extern os_error *xsyslog_log_complete (char const *name_or_handle);
__swi (0x4C88D) void syslog_log_complete (char const *name_or_handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_log_complete_by_handle()
 *
 * Description:   Flushes the names log and deallocates the space set aside
 *                for it
 *
 * Input:         handle - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4C88D.
 */

extern os_error *xsyslog_log_complete_by_handle (bits handle);
__swi (0x4C88D) void syslog_log_complete_by_handle (bits handle);

/* ------------------------------------------------------------------------
 * Function:      syslog_irq_mode()
 *
 *
 * Input:         flag - value of R0 on entry
 */

extern os_error *xsyslog_irq_mode (osbool flag);
__swi (0x4C88E) void syslog_irq_mode (osbool flag);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
