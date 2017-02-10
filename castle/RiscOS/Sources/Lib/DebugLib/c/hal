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
/* File:    hal.c                                                         */
/* Purpose: Routines for the HAL output method.                           */
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
#include "hal.h"
#include "globals.h"
#include "Global/HALEntries.h"


/**********************/
/* Exported functions */


/************************************************************************/
/* debug_hal_init                                                       */
/*                                                                      */
/* Function to initialise HAL debug output                              */
/*                                                                      */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    true or false.                                           */
/*                                                                      */
/************************************************************************/
bool debug_hal_init (void)
{
  /* Check that the HAL_DebugTX entry point exists. OS_Hardware should return an error if it doesn't, but we'll check for a null pointer just in case. */
  void *ptr;
  if (_swix(OS_Hardware, _INR(8,9)|_OUT(0), 1, EntryNo_HAL_DebugTX, &ptr) || !ptr)
    return false;
  return true;
}


/************************************************************************/
/* debug_hal_output                                                     */
/*                                                                      */
/* Function outputs the data from the library to the HAL                */
/*                                                                      */
/* Parameters: buffer   - text to output.                               */
/*                                                                      */
/* Returns:    void.                                                    */
/*                                                                      */
/************************************************************************/
void debug_hal_output (const char *buffer, size_t len)
{
  size_t count;

  for (count = 0; count < len; count++)
  {
    _swix (OS_Hardware, _IN(0)|_INR(8,9), (int) buffer[count], 0, EntryNo_HAL_DebugTX);
  }
}
