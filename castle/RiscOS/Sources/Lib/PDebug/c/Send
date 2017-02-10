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
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <time.h>

#include "Desk/OSBuffer.h"
#include "Desk/Debug.h"
#include "Desk/Error2.h"
#include "Desk/Str.h"

#undef PDebug_DEBUG
#define	PDebug_DEBUG
#include "PDebug.h"

#include "VersionNum"

static const char pdebug_version_string[] = Module_FullVersion;

static char                 buffer[ 1024];
static Desk_osbuffer_block  *outputbuffer = NULL;
static FILE                 *outputfile = NULL;


const char *PDebug_Version (void)
{
  return pdebug_version_string;
}


void PDebug_Init (void)
{
  Desk_Error2_Init_JumpSig ();
  if (outputbuffer)
    Desk_OSBuffer_Final (outputbuffer);

  outputbuffer = Desk_OSBuffer_Init (3);
  outputfile = fopen ("devices:$.parallel", "w");

  if (!outputfile)
    Desk_Error2_HandleText ("Couldn't open 'parallel:'");
  Desk_Debug_Printf (Desk_error_PLACE "outputbuffer=0x%p\n", outputbuffer);
}

Desk_os_error *PDebug_XInit (void)
{
  Desk_Error2_TryCatch
  (
    PDebug_Init();
    ,
    return Desk_Error2_ConvertToOS2();
  )
  return NULL;
}


// Not turning IRQs off at the moment - probably need IRQs on in order
//to send data to parallel port.
#if 0

  #define IRQ_PRE                                               \
    {                                                           \
    int old_irqs_disabled = PDebug__DisableInterrupts ();       \
    {

  #define IRQ_POST                                              \
    }                                                           \
    if (!old_irqs_disabled)                                     \
        PDebug__EnableInterrupts();                             \
    }

#else
  #define IRQ_PRE
  #define IRQ_POST
#endif


void PDebug_Print (const void *data, int datasize)
{
  IRQ_PRE

  if (outputbuffer)
  {
    int numleft;
    char *s = (char *) data;

    // Loop until all data has been sent.
    do
    {
      numleft = Desk_OSBuffer_InsertBlock (outputbuffer, s, datasize);
      if (_kernel_irqs_disabled ())
        break;  // Data not sent if IRQs are off, so we would
                // end up looping forever.

      s += (datasize-numleft);        // Skip over data that was sent.
      datasize = numleft;
    }
    while (numleft);
  }

  IRQ_POST
}


int PDebug_VPrintf (const char *fmt, va_list va)
{
  int n;

  IRQ_PRE

  n = vsprintf (buffer, fmt, va);
  PDebug_Print (buffer, strlen (buffer));

  IRQ_POST

  return n;
}



int PDebug_Printf (const char * fmt, ...)
{
  int n;
  va_list va;

  IRQ_PRE

  va_start (va, fmt);
  n = PDebug_VPrintf (fmt, va);
  va_end (va);

  IRQ_POST

  return n;
}

int PDebug_FPrintf (FILE *dummy, const char *fmt, ...)
{
  int n;
  va_list va;

  IRQ_PRE

  va_start (va, fmt);
  n = PDebug_VPrintf (fmt, va);
  va_end (va);

  IRQ_POST

  return n;

  Desk_UNUSED (dummy);
}

void PDebug_Final (void)
{
  Desk_Error2_Init_JumpSig();
  if (outputfile)
    fclose(outputfile);
  if (outputbuffer)
    Desk_OSBuffer_Final( outputbuffer);
  outputbuffer = NULL;
  outputfile = NULL;
}


Desk_os_error *PDebug_XFinal (void)
{
  Desk_Error2_TryCatch
  (
    PDebug_Final();
    ,
    return Desk_Error2_ConvertToOS2();
  )
  return NULL;
}
