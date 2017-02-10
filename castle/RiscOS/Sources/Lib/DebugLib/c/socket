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
/* File:    socket.c                                                      */
/* Purpose: Routines for the Socket output method.                        */
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
#include "socket.h"

/* -------------------------------------- LOCAL VARIABLES --------------------------------------- */

remote_debug_session *debug_remotedb_info = NULL;           /* RemoteDB handler */

/**********************/
/* Exported functions */


/************************************************************************/
/* debug_socket_init                                                    */
/*                                                                      */
/* Function to initialise RemoteDB                                      */
/*                                                                      */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    true or false.                                           */
/*                                                                      */
/************************************************************************/
bool debug_socket_init (void)
{
#ifndef NOSOCKETS
  if (debug_remotedb_info == NULL)
    remote_debug_open (debug_current_options.taskname, (&debug_remotedb_info));
  return true;
#else
  return true;
#endif
}


/************************************************************************/
/* debug_socket_output                                                  */
/*                                                                      */
/* Function is the output routine for !PDebug.                          */
/*                                                                      */
/* Parameters: buffer   - text to output.                               */
/*                                                                      */
/* Returns:    void.                                                    */
/*                                                                      */
/************************************************************************/
void debug_socket_output (const char *buffer, size_t len)
{
#ifndef NOSOCKETS
  if (debug_remotedb_info != NULL)
    remote_debug_print_line (1u, debug_remotedb_info, buffer, len);
#else
  IGNORE (buffer); IGNORE (len);
#endif
}


/************************************************************************/
/* debug_socket_quit                                                    */
/*                                                                      */
/* Function to terminate RemoteDB                                       */
/*                                                                      */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    void         .                                           */
/*                                                                      */
/************************************************************************/
void debug_socket_quit (void)
{
#ifndef NOSOCKETS
  if (debug_remotedb_info != NULL)
  {
    remote_debug_close (debug_remotedb_info);
    debug_remotedb_info = NULL;
  }
#endif
}
