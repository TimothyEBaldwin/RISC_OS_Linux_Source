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
 * Author:  Ian Johnson
 * History: 16-Sep-93: IDJ:   created
 *
 */

#include "debug.h"

#include "swis.h"
#include "kernel.h"
#include <stdarg.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>

#define HostFS_HostVDU   0x40100
#define HostFS_TubeVDU   0x40101
#define HostFS_WriteC    0x40102

static char output_buffer[256];
static char var_val[256] = "";
static char debug_var[256] = "";

static void host_out (char *format, ...);


void debug_dump (void *start, int length) {

   _kernel_swi_regs   regs;
   char               buffer[256];
   char              *address = start;

   regs.r[0] = (int)"Hex$Dump";
   regs.r[1] = (int)buffer;
   regs.r[2] = 255;
   regs.r[3] = 0;
   regs.r[4] = 3;

   _kernel_swi (OS_ReadVarVal, &regs, &regs);

   if (regs.r[2] == 0) return;
   {
       int            i, j, k, rows, columns;
       int            colour, word;
       char          *ptr,
                      chr;
       enum           { black, red, green, yellow, blue, magenta, cyan, white } colours;
       char           col[8][]   = { "\x011\x00", "\x011\x01", "\x011\x02", "\x011\x03",
                                     "\x011\x04", "\x011\x05", "\x011\x06", "\x011\x07"};

       buffer[regs.r[2]] = '\0'; /* set correct terminator for end of string */
       colour = (int) strstr (buffer, "colour");
       word   = (int) strstr (buffer, "word");
       if ((ptr = strstr (buffer,"R")) == NULL)
          rows = 24;
       else
          sscanf (ptr+1, "%d", &rows);
       if (rows<3) rows = 3;

       if ((ptr = strstr (buffer,"C")) == NULL)
          columns = 16;
       else
          sscanf (ptr+1, "%d", &columns);
       if (columns<4) columns = 4;

       ptr = address;

       while (ptr < address+length) {
          host_out ("\n\r%sAddress  ",colour?col[white]:"");
          for (j=0;j<columns;j += word?4:1)
             if (word)
                host_out ("    %02x   ",(((int)ptr+j) & 0xff));
             else
                host_out (" %02x",(((int)ptr+j) & 0xff));
          host_out ("  Characters\n\r");
          for (i=0;i<rows-2;i++) {
             host_out ("%s%08x%s ",colour?col[cyan]:"",(int)ptr,colour?col[red]:"");
             for (j=0;j<columns;j += word?4:1) {
                if (ptr+j >= address+length) break;
                if (word)
                   host_out (" %08x",*((int *)(ptr+j)));
                else
                   host_out (" %02x",*(ptr+j));
            }
             if (j < columns)
                for (k=0;k<columns-j;k += word?4:1)
                   host_out (word?"         ":"   ");
             host_out ("  %s",colour?col[magenta]:"");
             for (j=0;j<columns;j++) {
                if (ptr+j >= address+length) break;
                chr = *(ptr+j);
                host_out ("%s%c%s",(chr<32?(colour?col[white]:""):""),(chr<32?'.':chr),(chr<32?(colour?col[magenta]:""):""));
             }
             ptr += j;
             host_out ("\n\r");
             if (ptr >= address+length) break;
          }
       }
   host_out ("\x014");
   }
}

void host_out (char *format, ...) {

   va_list args;
   char *ptr, buffer[1024];
   _kernel_swi_regs regs;

   va_start (args, format);

   vsprintf (buffer, format, args);

   ptr = buffer;

   while (*ptr != '\0') {
      regs.r[0] = *ptr;
      _kernel_swi (HostFS_WriteC, &regs, &regs);
      ptr++;
   }
   va_end (args);
}


extern void debug_set_var_name (char *var_name)
{
    strcpy (debug_var, var_name);
}


extern void debug_output (char *allow, char *string, ...)
{
    /*
     * Function to output the given variable list down the tube.  String is a
     * printf format string.  String is only printed if the given allow string
     * appears in the system variable debug_var
     *
     */

    _kernel_swi_regs regs;
    _kernel_oserror *e;
    va_list args;
    char *p;

    va_start(args, string);

    regs.r[0] = (int)debug_var;
    regs.r[1] = (int)var_val;
    regs.r[2] = 255;
    regs.r[3] = 0;
    regs.r[4] = 3;

    _kernel_swi (OS_ReadVarVal, &regs, &regs);
    var_val[regs.r[2]] = '\0';

    if ((strstr (var_val, allow) != NULL) || !strcmp (allow, "force"))
    {
        vsprintf (output_buffer, string, args);

        for (p = output_buffer; *p != '\0'; p++)
        {
            if ((*p >= ' ' && *p <= '~') || *p == '\n')
                regs.r[0] = (int)*p;
            else
                regs.r[0] = '*';
            _kernel_swi (HostFS_WriteC, &regs, &regs);
            if (*p == '\n')
            {
                regs.r[0] = '\r';
                _kernel_swi (HostFS_WriteC, &regs, &regs);
            }
        }
    }

    va_end(args);
}
