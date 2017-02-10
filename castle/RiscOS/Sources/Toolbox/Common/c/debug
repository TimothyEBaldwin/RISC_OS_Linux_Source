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
/* File:    debug.c
 * Purpose: debugging routines for the Toolbox
 * Author:  Stewart Brodie
 * History: 19-Apr-00: SNB:   rewritten to use DebugLib
 *
 */
#include <stdarg.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>

#include "debug.h"

#ifndef DEBUGLIB
#  define DEBUGLIB 1
#endif

#undef debug_output

#include "DebugLib/DebugLib.h"

void debug_dump (void *start, int length)
{
  (void) start;
  (void) length;
  ddumpbuf("", start, length, 0);
}

void debug_set_var_name (char *var_name)
{
  static int init_done = 0;
  if (!init_done++) {
    char sysvar[64];
    size_t length = strcspn(var_name, "$");

    if (length >= sizeof(sysvar)) length = 62;
    strncpy(sysvar, var_name, length);
    sysvar[length] = '\0';
    debug_initialise(sysvar, NULL, NULL);
  }
}


void _common_debug_output (char *allow, char *string, ...)
{
  va_list ap;

  va_start(ap, string);
  dvprintf((allow, string, ap));
  va_end(ap);
}
