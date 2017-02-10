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

/**************************************************************************/
/* File:    syslog.c                                                      */
/* Debug to local SysLog module                                           */
/**************************************************************************/

#include "include.h"
#include "globals.h"
#include "misc.h"
#include "syslog.h"

#define SysLog_LogMessage   0x4c880
#define SysLog_LogUnstamped 0x4c884
#define SysLog_LogComplete  0x4c88d
#define SysLog_IRQMode      0x4c88e

static const char* s_logname  = "DebugLib";
static int         s_priority = 64;
static char*       s_line_pos = 0;
static char*       s_line_end = 0;
static char        s_line[80];

static void output_line(void)
{
  if (s_line_pos && !_swix(SysLog_IRQMode, _IN(0), 1))
  {
    *s_line_pos = 0;
    _swix(SysLog_LogUnstamped, _INR(0,2), s_logname, s_line, s_priority);
    s_line_pos = s_line;
    _swix(SysLog_IRQMode, _IN(0), 1);
  }
}

bool debug_syslog_init (void)
{
  s_line_pos = s_line;
  s_line_end = s_line + sizeof(s_line) - 1;
  return true;
}

void debug_syslog_output (const char *buffer, size_t len)
{
  const char* buffer_end = buffer + len;
  if (!s_line_pos) return;
  while (buffer!=buffer_end)
  {
    char ch = *buffer++;
    if (ch=='\n' || s_line_pos==s_line_end)
    {
      output_line();
    }
    else
    {
      if (ch<32) ch = '.';
      *s_line_pos++ = ch;
    }
  }
}

void debug_syslog_quit (void)
{
  output_line();
  _swix(SysLog_LogComplete, _IN(0), s_logname);
}
