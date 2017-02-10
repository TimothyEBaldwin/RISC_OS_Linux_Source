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
/* File:    file.c                                                        */
/* Purpose: Routines for the File output method.                          */
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
#include "globals.h"
#include "file.h"

/* -------------------------------------- LOCAL VARIABLES --------------------------------------- */

static FILE *debug_file_pointer = NULL;          /* File pointer */

/**********************/
/* Exported functions */


/************************************************************************/
/* debug_file_init                                                      */
/*                                                                      */
/* Function to initialise File Debugging                                */
/*                                                                      */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    TRUE or FALSE.                                           */
/*                                                                      */
/************************************************************************/
bool debug_file_init (void)
{
  char *fname;

  if (debug_file_pointer == NULL)
  {
    /* Device currently not initialised */
    if (strlen (debug_current_options.filename) == 0)
    {
      /* No filename specified at startup, so save in WimpScrap */
      fname = "<Wimp$ScrapDir>.DebugLib";
    }
    else
    {
      /* Filename specified in debug_initialise() so use it */
      fname = debug_current_options.filename;
    }

    debug_file_pointer = fopen (fname, "a");
  }

  return true;
}


/************************************************************************/
/* debug_file_output                                                    */
/*                                                                      */
/* Function is the output routine for file debug                        */
/*                                                                      */
/* Parameters: buffer   - text to output.                               */
/*                                                                      */
/* Returns:    void.                                                    */
/*                                                                      */
/************************************************************************/
void debug_file_output (const char *buffer, size_t len)
{
  if (debug_file_pointer)
  {
    fwrite (buffer, sizeof (char), len, debug_file_pointer);
    if (debug_current_options.unbuffered_files == true)
      fflush (debug_file_pointer);
  }
}


/************************************************************************/
/* debug_file_quit                                                      */
/*                                                                      */
/* Function to terminate  File Debugging                                */
/*                                                                      */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    void                                                     */
/*                                                                      */
/************************************************************************/
void debug_file_quit (void)
{
  if (debug_file_pointer)
  {
    fclose (debug_file_pointer);
    debug_file_pointer = NULL;
  }
}
