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
#ifndef PDebug_DEBUG
	#define	PDebug_DEBUG
#endif

#include <string.h>

#include "Desk/Error2.h"
#include "Desk/Str.h"

#include "CMHGHead.h"

#include "PDebug/PDebug.h"


_kernel_oserror *SWIHandler (int swi_no, _kernel_swi_regs *r, void *pw)
{
  _kernel_oserror *e = NULL;

  Desk_Error2_Try
  {
    if (0);

    else if (swi_no == PDebugM_Send - PDebugM_00)
    {
      if (r->r[0] != 0)
        Desk_Error2_HandleTextf ("Bad r0 passed to PDebugM_Send, 0x%08x", r->r[0]);
      PDebug_Print ((void*) r->r[1], r->r[2]);
    }

    else if (swi_no == PDebugM_Print - PDebugM_00)
    {
      char *string;
      int len;

      if (r->r[0] != 0)
        Desk_Error2_HandleTextf ("Bad r0 passed to PDebugM_Print, 0x%08x", r->r[0]);

      string = (char*) r->r[1];
      len = Desk_strlencr (string);

      Desk_Debug_Printf (Desk_error_PLACE "PDebugM_Print sending '%s'\n", string);
      PDebug_Print (string, len);
    }

    else if (swi_no == PDebugM_Printf - PDebugM_00)
    {
      if (r->r[0] != 0)
        Desk_Error2_HandleTextf ("Bad r0 passed to PDebugM_Printf, 0x%08x", r->r[0]);
      PDebug_Printf ((char*) r->r[1], r->r[2], r->r[3], r->r[4], r->r[5], r->r[6], r->r[7], r->r[8], r->r[9]);
    }

    else
      e = error_BAD_SWI;
  }

  Desk_Error2_Catch
  {
    return Desk_Error2_ConvertToOS2();
  }

  Desk_Error2_EndCatch

  return e;

  Desk_UNUSED( pw);
}



_kernel_oserror *CmdHandler (const char *arg_string, int argc, int cmd_no, void *pw)
{
  char tmp[400];
  int i=0;

  Desk_Error2_Try
  {
    switch (cmd_no)
    {
      case 0:
        /* Properly NULL terminate the string */
        do
        {
          tmp[i] = arg_string[i];
          i++;
        }
        while ((arg_string[i] != 13) && (i < 398));
        tmp[i++] = '\n';
        tmp[i] = '\0';

        /* Then print it out */
        PDebug_Print (tmp, strlen (tmp));
        break;
    }
  }

  Desk_Error2_Catch
  {
    return Desk_Error2_ConvertToOS2();
  }

  Desk_Error2_EndCatch

  return NULL;
  Desk_UNUSED (argc);
  Desk_UNUSED (pw);
}


_kernel_oserror *ModuleInit (const char *cmd_tail, int podule_base, void *pw)
{
  Desk_Debug_Printf ("");
  return PDebug_XInit ();
  Desk_UNUSED (cmd_tail);
  Desk_UNUSED (podule_base);
  Desk_UNUSED (pw);
}


_kernel_oserror *ModuleFinal (int fatal, int podule, void *pw)
{
  PDebug_XFinal ();
  return NULL;
  Desk_UNUSED (fatal);
  Desk_UNUSED (podule);
  Desk_UNUSED (pw);
}
