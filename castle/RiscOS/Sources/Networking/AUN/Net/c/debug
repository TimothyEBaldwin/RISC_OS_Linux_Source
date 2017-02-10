/* This source code in this file is licensed to You by Castle Technology
 * Limited ("Castle") and its licensors on contractual terms and conditions
 * ("Licence") which entitle you freely to modify and/or to distribute this
 * source code subject to Your compliance with the terms of the Licence.
 * 
 * This source code has been made available to You without any warranties
 * whatsoever. Consequently, Your use, modification and distribution of this
 * source code is entirely at Your own risk and neither Castle, its licensors
 * nor any other person who has contributed to this source code shall be
 * liable to You for any loss or damage which You may suffer as a result of
 * Your use, modification or distribution of this source code.
 * 
 * Full details of Your rights and obligations are set out in the Licence.
 * You should have received a copy of the Licence with this source code file.
 * If You have not received a copy, the text of the Licence is available
 * online at www.castle-technology.co.uk/riscosbaselicence.htm
 */
/* debug.c
 *
 * Author: Jem Davies (Cambridge Systems Design)
 *
 * Description
 * ===========
 * Debug routines
 *
 * Environment
 * ===========
 * Acorn RISC OS 3.11 or later.
 *
 * Compiler
 * ========
 * Acorn Archimedes C release 5.02 or later.
 *
 * Change record
 * =============
 *
 * JPD  Jem Davies (Cambridge Systems Design)
 *
 *
 * 31-Jan-95  11:27  JPD  Version 1.00
 * Created as a separate file.
 *
 * 06-Feb-95  12:39  JPD  Version 1.01
 * Added inlcude of debug.h.
 *
 *
 *
 **End of change record*
 */

#include <stdarg.h>

#include "kernel.h"
#include "swis.h"

#include "debug.h"


#ifdef DEBUG

/******************************************************************************/

#define HostFS_WriteC 0x40102
#define HostFS_Write0 0x40104

void hprintf(const char * format, ...)
{
   va_list ap;
   static char buf[256];
   char *p=buf;

   va_start(ap, format);
   vsprintf(buf, format, ap);
   va_end(ap);

#if 0
   _swix(HostFS_Write0, _IN(0), buf);
#else
   while (*p)
    _swix(HostFS_WriteC, _IN(0), *p++);
#endif

   return;

} /* hprintf() */

/******************************************************************************/

#endif

/* EOF debug.c */
