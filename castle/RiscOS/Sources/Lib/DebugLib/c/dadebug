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
/* File:    dadebug.c                                                     */
/* Purpose: Routines for the DADebug output method.                       */
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
#include "misc.h"
#include "dadebug.h"
#include "Global/SWIs.h"

#define DADebug_GetWriteCAddress (DADebugSWI_Base + 0)

static void (*DADWriteC) (char);

/**********************/
/* Exported functions */


/************************************************************************/
/* debug_dadebug_init                                                   */
/*                                                                      */
/* Function to initialise DADebug module                                */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    TRUE or FALSE.                                           */
/*                                                                      */
/************************************************************************/
bool debug_dadebug_init (void)
{
  /* Check if the DADebug module is loaded */
  if (debug_misc_ensure_module ("DADebug") == true)
  {
    if (_swix (DADebug_GetWriteCAddress, _OUT(0), &DADWriteC) == 0)
    {
      return true;
    }
  }
  return false;
}


/************************************************************************/
/* debug_dadebug_output                                                 */
/*                                                                      */
/* Function outputs the data from the library to the DADebug module.    */
/*                                                                      */
/* Parameters: buffer - text to output.                                 */
/*                                                                      */
/* Returns:    void.                                                    */
/*                                                                      */
/************************************************************************/
void debug_dadebug_output (const char *buffer, size_t len)
{
  size_t count;

  for (count = 0; count < len; count++)
  {
    /* Check to see if \n is the next character. If so, prefix it with a CR */
    if (buffer[count] == '\n')
    {
      DADWriteC ('\r');
    }
    
    DADWriteC (buffer[count]);
  }
}
