#ifndef basictrans_H
#define basictrans_H

/* C header file for BASICTrans
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:42 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 Apr 1994
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
#undef  BASICTrans_HELP
#define BASICTrans_HELP                         0x42C80
#undef  XBASICTrans_HELP
#define XBASICTrans_HELP                        0x62C80
#undef  BASICTrans_Error
#define BASICTrans_Error                        0x42C81
#undef  XBASICTrans_Error
#define XBASICTrans_Error                       0x62C81
#undef  BASICTrans_Message
#define BASICTrans_Message                      0x42C82
#undef  XBASICTrans_Message
#define XBASICTrans_Message                     0x62C82

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      basictrans_help()
 *
 * Description:   Interpret, translate if required, and print HELP messages
 *
 * Input:         help_text - value of R0 on entry
 *                prog_name - value of R1 on entry
 *                lexical_table - value of R2 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42C80.
 */

extern os_error *xbasictrans_help (char const *help_text,
      char const *prog_name,
      byte const *lexical_table,
      osbool *unclaimed);
extern osbool basictrans_help (char const *help_text,
      char const *prog_name,
      byte const *lexical_table);

/* ------------------------------------------------------------------------
 * Function:      basictrans_error()
 *
 * Description:   Copy translated error string to buffer
 *
 * Input:         error_no - value of R0 on entry
 *                error_buffer - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x42C81.
 */

extern os_error *xbasictrans_error (int error_no,
      char *error_buffer);
__swi (0x42C81) void basictrans_error (int error_no,
      char *error_buffer);

/* ------------------------------------------------------------------------
 * Function:      basictrans_message()
 *
 * Description:   Translate and print miscellaneous message
 *
 * Input:         message_no - value of R0 on entry
 *                arg0 - value of R1 on entry
 *                arg1 - value of R2 on entry
 *                arg2 - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x42C82.
 */

extern os_error *xbasictrans_message (int message_no,
      int arg0,
      int arg1,
      int arg2);
__swi (0x42C82) void basictrans_message (int message_no,
      int arg0,
      int arg1,
      int arg2);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
