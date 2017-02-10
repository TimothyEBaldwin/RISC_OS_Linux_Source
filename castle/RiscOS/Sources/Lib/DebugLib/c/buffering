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
/* File:    buffering.c                                                   */
/* Purpose: Buffered output control for DebugLib.                         */
/*                                                                        */
/* Copyright [1999-2001] Pace Micro Technology PLC.  All rights reserved. */
/*                                                                        */
/* The copyright in this material is owned by Pace Micro Technology PLC   */
/* ("Pace").  This material is regarded as a highly confidential trade    */
/* secret of Pace.  It may not be reproduced, used, sold or in any        */
/* other way exploited or transferred to any third party without the      */
/* prior written permission of Pace.                                      */
/**************************************************************************/


/* -------------------------------------- LIBRARY IMPORTS --------------------------------------- */

#ifdef MemCheck_MEMCHECK
  #include "MemCheck:MemCheck.h"
#endif

#include "include.h"
#include "debug.h"
#include "globals.h"
#include "buffering.h"

/* ---------------------------------- PRE-PROCESSOR DIRECTIVES ---------------------------------- */

#define DebugBuffer_DA_Name "DebugLib Buffer"

/* -------------------------------------- GLOBAL VARIABLES -------------------------------------- */

DebugBufferStatus debug_buff_status;

/* --------------------------------------- LOCAL VARIABLES -------------------------------------- */

static _kernel_oserror global_er;

/* ----------------------------------------- FUNCTIONS ------------------------------------------ */


/*******************/
/* Local functions */


/************************************************************************/
/* debug_buffer_terminate                                               */
/*                                                                      */
/* Function will close the dynamic area down.                           */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    void.                                                    */
/*                                                                      */
/************************************************************************/
static void debug_buffer_terminate(void)
{
  _kernel_swi_regs	 regs;
  _kernel_oserror	*er;

  if (debug_buff_status.da != FALSE)
  {
    regs.r[0] = 1;
    regs.r[1] = debug_buff_status.da;

    er = _kernel_swi(OS_DynamicArea, &regs, &regs);

    if (er != NULL)
      printf("Message: %s\n", er->errmess);

    #ifdef MemCheck_MEMCHECK
      MemCheck_UnRegisterMiscBlock (debug_buff_status.base);
    #endif
  }
  debug_buff_status.da = FALSE;
  debug_buff_status.enabled = FALSE;
  debug_buff_status.base = NULL;
  debug_buff_status.head = NULL;
}


/************************************************************************/
/* debug_output_buffer_on                                               */
/*                                                                      */
/* Function enables buffering of output in DebugLib.  This is stored in */
/* a dynamic area until such times as the user calls                    */
/* debug_output_buffer_off().                                           */
/*                                                                      */
/* Parameters: flags    - flags word - set to 0.                        */
/*             nbytes   - size of Dynamic Area to create.               */
/*                                                                      */
/* Returns:    _kernel_oserror for error, else NULL.                    */
/*                                                                      */
/************************************************************************/
_kernel_oserror *debug_output_buffer_on(int flags, int nbytes)
{
  _kernel_oserror	*er = NULL;
  _kernel_oserror	*er_ptr = NULL;
  _kernel_swi_regs	 regs;

  IGNORE(flags);

  atexit(debug_buffer_terminate);

  regs.r[0] = 0;
  regs.r[1] = -1;
  regs.r[2] = nbytes;
  regs.r[3] = -1;
  regs.r[4] = 1<<7;
  regs.r[5] = nbytes;
  regs.r[6] = 0;
  regs.r[7] = 0;
  regs.r[8] = (int) DebugBuffer_DA_Name;

  er = _kernel_swi(OS_DynamicArea, &regs, &regs);

  if (er != NULL)
  {
    global_er.errnum = er->errnum;
    strcpy(global_er.errmess, er->errmess);
    er_ptr = &global_er;
    return er_ptr;
  }
  else
  {
    #ifdef MemCheck_MEMCHECK
      MemCheck_RegisterMiscBlock ((void *)regs.r[3], nbytes);
    #endif
    debug_buff_status.da = regs.r[1];
    debug_buff_status.enabled = TRUE;
    debug_buff_status.size = nbytes;
    debug_buff_status.base = (char *) regs.r[3];
    debug_buff_status.base[0] = '\0';
    return NULL;
  }
}


/************************************************************************/
/* debug_output_buffer_off                                              */
/*                                                                      */
/* Function turns off buffering of output.                              */
/*                                                                      */
/* Parameters: flags   - not used.                                      */
/*             device  - DebugLib stream to use to output the buffer,   */
/*                       and all data from this point on.               */
/* Returns:    void.                                                    */
/*                                                                      */
/************************************************************************/
void debug_output_buffer_off(int flags, debug_device device)
{
  /* Set enabled to FALSE so that debug_output_device & debug_output will do
   * something
   */
  debug_buff_status.enabled = FALSE;

  /* If bit in the flags word is set, we just want to output the debug to
     the current device */
  if (flags & DebugLib_OutputBufferOff_Flag_UseCurrentDevice)
    device = debug_current_options.device;

  /* Set the debug device */
  debug_set_device (device);

  debug_output (0, "", debug_current_options.device, debug_buff_status.base);

  /* Now that everything has been output, terminate the buffer */
  debug_buffer_terminate();
}


/************************************************************************/
/* debug_buffer_startup                                                 */
/*                                                                      */
/* Function prepares the buffering code.                                */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    void.                                                    */
/*                                                                      */
/************************************************************************/
void debug_buffer_startup(void)
{
  debug_buff_status.da = FALSE;
  debug_buff_status.enabled = FALSE;
  debug_buff_status.size = FALSE;
  debug_buff_status.base = NULL;
  debug_buff_status.head = NULL;
}


/************************************************************************/
/* debug_buffer_stream                                                  */
/*                                                                      */
/* Function buffers the text passed in into the setup dynamic area.     */
/*                                                                      */
/* Parameters: stream.                                                  */
/*                                                                      */
/* Returns:    TRUE or FALSE                                            */
/*                                                                      */
/************************************************************************/
int debug_buffer_stream(const char *stream)
{
  if ((strlen(stream) + strlen(debug_buff_status.base)) < debug_buff_status.size)
  {
    strcat(debug_buff_status.base, stream);
    return TRUE;
  }
  else
  {
    return FALSE;
  }
}
