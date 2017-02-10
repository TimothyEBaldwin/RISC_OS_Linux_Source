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
/* File:    tracker.c                                                     */
/* Purpose: Routines for the Tracker output method.                       */
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
#include "globals.h"
#include "tracker.h"

/* -------------------------------------- LOCAL VARIABLES --------------------------------------- */

static int tracker_window_handle = -1;

/**********************/
/* Exported functions */


/************************************************************************/
/* debug_tracker_init                                                   */
/*                                                                      */
/* Function to initialise Tracker                                       */
/*                                                                      */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    true or false.                                           */
/*                                                                      */
/************************************************************************/
bool debug_tracker_init (void)
{
  bool ret = true;

  /* Only do something if we're not intialised */
  if (tracker_window_handle == -1)
  {
    /* Check if the Tracker module is loaded */
    if (debug_misc_ensure_module ("Tracker") == true)
    {
      _swix (Tracker_Open, _INR(0,3) | _OUT(0), debug_current_options.taskname, 132, 500, 1,
             &tracker_window_handle);
      ret = true;
    }
    else
      ret = false;
  }
  return ret;
}


/************************************************************************/
/* debug_tracker_output                                                 */
/*                                                                      */
/* Function is the output routine for !Tracker.                         */
/*                                                                      */
/* Parameters: buffer   - text to output.                               */
/*                                                                      */
/* Returns:    void.                                                    */
/*                                                                      */
/************************************************************************/
void debug_tracker_output (const char *buffer, size_t len)
{
  /* Only do something if we _are_ initialised */
  if (tracker_window_handle != -1)
  {
    char *out;

    out = malloc (len+1);
    if (out)
    {
      memcpy (out, buffer, len);
      out[len] = '\0';

      _swix (Tracker_WriteS, _INR(0,1), tracker_window_handle, out);

      free (out);
    }
  }
}


/************************************************************************/
/* debug_tracker_quit                                                   */
/*                                                                      */
/* Function to terminate  Tracker                                       */
/*                                                                      */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    void         .                                           */
/*                                                                      */
/************************************************************************/
void debug_tracker_quit (void)
{
  /* Only do something if we _are_ initialised */
  if (tracker_window_handle != -1)
  {
    _swix (Tracker_Close, _IN(0), tracker_window_handle);
    tracker_window_handle = -1;
  }
}
