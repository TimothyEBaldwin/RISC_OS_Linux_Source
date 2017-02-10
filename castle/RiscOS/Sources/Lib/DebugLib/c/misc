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
/* File:    misc.c                                                        */
/* Purpose: Routines for the file output method.                          */
/*                                                                        */
/* Copyright [1999-2001] Pace Micro Technology PLC.  All rights reserved. */
/*                                                                        */
/* The copyright in this material is owned by Pace Micro Technology PLC   */
/* ("Pace").  This material is regarded as a highly confidential trade    */
/* secret of Pace.  It may not be reproduced, used, sold or in any        */
/* other way exploited or transferred to any third party without the      */
/* prior written permission of Pace.                                      */
/**************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "kernel.h"
#include "swis.h"

#include "include.h"
#include "misc.h"


/* Duplicates a string.  Returns a pointer to a malloced copy of the
   string passed as the parameter. */
char *debug_misc_strdup (const char *to_copy)
{
  char *copy = NULL;
  int len;

  if (to_copy == NULL)
    return NULL;

  len = strlen (to_copy) + 1;

  copy = malloc (len);
  if (!copy)
    return NULL;

  return memcpy (copy, to_copy, len);
}


/* An OS_ReadVarVal veneer */
void debug_misc_getenv (const char *variable, char *buffer, int buffer_size,
                  int *nbytes)
{
  if (buffer == NULL)
  {
    _kernel_swi_regs r;

     r.r[0] = (int)variable;
     r.r[1] = NULL;
     r.r[2] = -1;
     r.r[3] = 0;
     r.r[4] = 0;

     _kernel_swi (OS_ReadVarVal, &r, &r);

     if (nbytes != NULL)
     {
       if (r.r[2] == 0)
         *nbytes = 0;
       else
       {
         *nbytes = ~r.r[2] + 1;
         internal_dprintf (("__DebugLib", "buf=NULL, nbytes=%d\n", *nbytes));
       }
     }
  }
  else
  {
    int len;

    _swix (OS_ReadVarVal, _INR(0,4) | _OUT(2),
           variable, buffer, buffer_size, 0, 0,
           &len);

    buffer[len] = '\0';

    if (nbytes != NULL)
    {
      *nbytes = len + 1;
      internal_dprintf (("__DebugLib", "buf!=NULL, nbytes=%d\n", *nbytes));
    }
  }
}


/* Version of debug_misc_getenv that mallocs its own space */
char *debug_misc_getenv_malloc (const char *variable)
{
  char *str;
  int len;

  debug_misc_getenv (variable, NULL, 0, &len);

  if (len == 0)
    return NULL;
  else
  {
    str = malloc (len);
    debug_misc_getenv (variable, str, len, &len);

    return str;
  }
}


/************************************************************************/
/* debug_misc_ensure_module                                             */
/*                                                                      */
/* Function checks to see if a module is loaded.  Stops debug output    */
/* going to unpredictable places.                                       */
/*                                                                      */
/* Parameters: name - Module name.                                      */
/*                                                                      */
/* Returns:    true or false.                                           */
/*                                                                      */
/************************************************************************/
bool debug_misc_ensure_module (const char *name)
{
  _kernel_oserror	*er;
  _kernel_swi_regs	regs;

  /* Check that module is present */
  regs.r[0] = 18;
  regs.r[1] = (int) name;

  er = _kernel_swi (OS_Module, &regs, &regs);

  if (er != NULL)
  {
    /* Module not present */
    return false;
  }
  else
  {
    /* Module present */
    return true;
  }
}
