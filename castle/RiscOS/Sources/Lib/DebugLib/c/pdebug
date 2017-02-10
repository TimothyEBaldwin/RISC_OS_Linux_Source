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
/* File:    pdebug.c                                                      */
/* Purpose: Routines for the PDebug output method.                        */
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

#include "include.h"

#include "PDebug/PDebug.h"              /* PDebug by JSmith */

#include "globals.h"
#include "misc.h"
#include "pdebug.h"

/* -------------------------------------- LOCAL VARIABLES --------------------------------------- */

static bool pdebug_error = false;
static bool debug_pdebug_using_module = false;

/**********************/
/* Exported functions */


/************************************************************************/
/* debug_pdebug_init                                                    */
/*                                                                      */
/* Function to initialise Parallel Debugging.                           */
/*                                                                      */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    true or false.                                           */
/*                                                                      */
/************************************************************************/
bool debug_pdebug_init (void)
{
  _kernel_oserror *er;

  if (debug_misc_ensure_module ("PDebugM") != true)
  {
    er = PDebug_XInit ();
    if (er != NULL)
    {
      _swix(OS_WriteI + 7, 0);
      _kernel_setenv ("PDebug$Error", er->errmess);
      pdebug_error = true;
    }
    else
      pdebug_error = false;

    debug_pdebug_using_module = false;
  }
  else
    debug_pdebug_using_module = true;

  return true;
}


/************************************************************************/
/* debug_pdebug_output                                                  */
/*                                                                      */
/* Function is the output routine for !PDebug.                          */
/*                                                                      */
/* Parameters: buffer   - text to output.                               */
/*                                                                      */
/* Returns:    void.                                                    */
/*                                                                      */
/************************************************************************/
void debug_pdebug_output (const char *buffer, size_t len)
{
  if (pdebug_error == true)
    return;

  if (debug_pdebug_using_module != true)
    PDebug_Print (buffer, len);
  else
    _swix (PDebugM_Send, _INR(0,2), 0u, buffer, len);
}


/************************************************************************/
/* debug_pdebug_quit                                                    */
/*                                                                      */
/* Function to terminate  Parallel Debugging.                           */
/*                                                                      */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    void                                                     */
/*                                                                      */
/************************************************************************/
void debug_pdebug_quit (void)
{
  if (debug_pdebug_using_module != true)
    PDebug_XFinal ();
  pdebug_error = false;
}
