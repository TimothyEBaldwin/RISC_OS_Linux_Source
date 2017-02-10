#ifndef messagetrans_H
#define messagetrans_H

/* C header file for MessageTrans
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:28 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 18 May 1995
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
#undef  MessageTrans_FileInfo
#define MessageTrans_FileInfo                   0x41500
#undef  XMessageTrans_FileInfo
#define XMessageTrans_FileInfo                  0x61500
#undef  MessageTrans_OpenFile
#define MessageTrans_OpenFile                   0x41501
#undef  XMessageTrans_OpenFile
#define XMessageTrans_OpenFile                  0x61501
#undef  MessageTrans_Lookup
#define MessageTrans_Lookup                     0x41502
#undef  XMessageTrans_Lookup
#define XMessageTrans_Lookup                    0x61502
#undef  MessageTrans_MakeMenus
#define MessageTrans_MakeMenus                  0x41503
#undef  XMessageTrans_MakeMenus
#define XMessageTrans_MakeMenus                 0x61503
#undef  MessageTrans_CloseFile
#define MessageTrans_CloseFile                  0x41504
#undef  XMessageTrans_CloseFile
#define XMessageTrans_CloseFile                 0x61504
#undef  MessageTrans_EnumerateTokens
#define MessageTrans_EnumerateTokens            0x41505
#undef  XMessageTrans_EnumerateTokens
#define XMessageTrans_EnumerateTokens           0x61505
#undef  MessageTrans_ErrorLookup
#define MessageTrans_ErrorLookup                0x41506
#undef  XMessageTrans_ErrorLookup
#define XMessageTrans_ErrorLookup               0x61506
#undef  MessageTrans_GSLookup
#define MessageTrans_GSLookup                   0x41507
#undef  XMessageTrans_GSLookup
#define XMessageTrans_GSLookup                  0x61507
#undef  MessageTrans_CopyError
#define MessageTrans_CopyError                  0x41508
#undef  XMessageTrans_CopyError
#define XMessageTrans_CopyError                 0x61508
#undef  MessageTrans_Dictionary
#define MessageTrans_Dictionary                 0x41509
#undef  XMessageTrans_Dictionary
#define XMessageTrans_Dictionary                0x61509
#undef  Service_MessageFileClosed
#define Service_MessageFileClosed               0x5E

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct messagetrans_control_block       messagetrans_control_block;

/********************
 * Type definitions *
 ********************/
struct messagetrans_control_block
   {  int cb [4];
   };

typedef bits messagetrans_file_flags;

/************************
 * Constant definitions *
 ************************/
#define messagetrans_DIRECT_ACCESS              ((messagetrans_file_flags) 0x1u)
#define error_MESSAGE_TRANS_SYNTAX              0xAC0u
#define error_MESSAGE_TRANS_FILE_OPEN           0xAC1u
#define error_MESSAGE_TRANS_TOKEN_NOT_FOUND     0xAC2u
#define error_MESSAGE_TRANS_RECURSE             0xAC3u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      messagetrans_file_info()
 *
 * Description:   Gives information about a message file
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        flags - value of R0 on exit
 *                size - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x41500.
 */

extern os_error *xmessagetrans_file_info (char const *file_name,
      messagetrans_file_flags *flags,
      int *size);
extern void messagetrans_file_info (char const *file_name,
      messagetrans_file_flags *flags,
      int *size);

/* ------------------------------------------------------------------------
 * Function:      messagetrans_open_file()
 *
 * Description:   Opens a message file
 *
 * Input:         cb - value of R0 on entry
 *                file_name - value of R1 on entry
 *                buffer - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x41501.
 */

extern os_error *xmessagetrans_open_file (messagetrans_control_block *cb,
      char const *file_name,
      char *buffer);
__swi (0x41501) void messagetrans_open_file (messagetrans_control_block *cb,
      char const *file_name,
      char *buffer);

/* ------------------------------------------------------------------------
 * Function:      messagetrans_lookup()
 *
 * Description:   Translates a message token into a string
 *
 * Input:         cb - value of R0 on entry
 *                token - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *                arg0 - value of R4 on entry
 *                arg1 - value of R5 on entry
 *                arg2 - value of R6 on entry
 *                arg3 - value of R7 on entry
 *
 * Output:        result - value of R2 on exit (X version only)
 *                used - value of R3 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41502.
 */

extern os_error *xmessagetrans_lookup (messagetrans_control_block const *cb,
      char const *token,
      char *buffer,
      int size,
      char const *arg0,
      char const *arg1,
      char const *arg2,
      char const *arg3,
      char **result,
      int *used);
extern char *messagetrans_lookup (messagetrans_control_block const *cb,
      char const *token,
      char *buffer,
      int size,
      char const *arg0,
      char const *arg1,
      char const *arg2,
      char const *arg3,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      messagetrans_make_menus()
 *
 * Description:   Sets up a menu structure from a definition containing
 *                references to tokens
 *
 * Input:         cb - value of R0 on entry
 *                menus - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        used - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41503.
 */

extern os_error *xmessagetrans_make_menus (messagetrans_control_block const *cb,
      byte const *menus,
      char *buffer,
      int size,
      int *used);
extern int messagetrans_make_menus (messagetrans_control_block const *cb,
      byte const *menus,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      messagetrans_close_file()
 *
 * Description:   Closes a message file
 *
 * Input:         cb - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x41504.
 */

extern os_error *xmessagetrans_close_file (messagetrans_control_block const *cb);
__swi (0x41504) void messagetrans_close_file (messagetrans_control_block const *cb);

/* ------------------------------------------------------------------------
 * Function:      messagetrans_enumerate_tokens()
 *
 * Description:   Enumerates tokens that match a wildcarded token
 *
 * Input:         cb - value of R0 on entry
 *                token - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *                context - value of R4 on entry
 *
 * Output:        more - value of R2 on exit (X version only)
 *                used - value of R3 on exit
 *                context_out - value of R4 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41505.
 */

extern os_error *xmessagetrans_enumerate_tokens (messagetrans_control_block const *cb,
      char const *token,
      char *buffer,
      int size,
      int context,
      osbool *more,
      int *used,
      int *context_out);
extern osbool messagetrans_enumerate_tokens (messagetrans_control_block const *cb,
      char const *token,
      char *buffer,
      int size,
      int context,
      int *used,
      int *context_out);

/* ------------------------------------------------------------------------
 * Function:      messagetrans_error_lookup()
 *
 * Description:   Translates a message token within an error block
 *
 * Input:         error - value of R0 on entry
 *                cb - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *                arg0 - value of R4 on entry
 *                arg1 - value of R5 on entry
 *                arg2 - value of R6 on entry
 *                arg3 - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x41506.
 */

extern os_error *xmessagetrans_error_lookup (os_error const *error,
      messagetrans_control_block const *cb,
      os_error *buffer,
      int size,
      char const *arg0,
      char const *arg1,
      char const *arg2,
      char const *arg3);
extern void messagetrans_error_lookup (os_error const *error,
      messagetrans_control_block const *cb,
      os_error *buffer,
      int size,
      char const *arg0,
      char const *arg1,
      char const *arg2,
      char const *arg3);

/* ------------------------------------------------------------------------
 * Function:      messagetrans_gs_lookup()
 *
 * Description:   Translates a message token into a string and calls
 *                OS_GSTrans
 *
 * Input:         cb - value of R0 on entry
 *                token - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *                arg0 - value of R4 on entry
 *                arg1 - value of R5 on entry
 *                arg2 - value of R6 on entry
 *                arg3 - value of R7 on entry
 *
 * Output:        result - value of R2 on exit (X version only)
 *                used - value of R3 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41507.
 */

extern os_error *xmessagetrans_gs_lookup (messagetrans_control_block const *cb,
      char const *token,
      char *buffer,
      int size,
      char const *arg0,
      char const *arg1,
      char const *arg2,
      char const *arg3,
      char **result,
      int *used);
extern char *messagetrans_gs_lookup (messagetrans_control_block const *cb,
      char const *token,
      char *buffer,
      int size,
      char const *arg0,
      char const *arg1,
      char const *arg2,
      char const *arg3,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      messagetrans_copy_error()
 *
 * Description:   Copies an error into one of the MessageTrans internal
 *                buffers
 *
 * Input:         error - value of R0 on entry
 *
 * Output:        copy - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41508.
 */

extern os_error *xmessagetrans_copy_error (os_error const *error,
      os_error **copy);
__swi (0x41508) os_error *messagetrans_copy_error (os_error const *error);

/* ------------------------------------------------------------------------
 * Function:      messagetrans_dictionary()
 *
 * Description:   Returns a pointer to MessageTrans's internal dictionary
 *
 * Output:        dictionary - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41509.
 */

extern os_error *xmessagetrans_dictionary (byte **dictionary);
__swi (0x41509) byte *messagetrans_dictionary (void);

/* ------------------------------------------------------------------------
 * Function:      service_message_file_closed()
 *
 * Description:   Message files have been closed
 *
 * Input:         cb - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x5E.
 */

extern os_error *xservice_message_file_closed (messagetrans_control_block const *cb);
extern void service_message_file_closed (messagetrans_control_block const *cb);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
