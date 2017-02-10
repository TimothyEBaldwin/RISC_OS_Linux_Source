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
/* File:    serial.c                                                      */
/* Purpose: Routines for the Serial output method.                        */
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
#include "serial_lib.h"                 /* Local Dual Serial library */
#include "serial.h"
#include "globals.h"

#define Serial_Stream	"devices#baud%d;data8;stop1;noparity;rts;size1024;thres32:$.serial%d"
#define Serial1_Default	"devices#baud9600;data8;stop1;noparity;rts;size1024;thres32:$.serial1"


/* -------------------------------------- LOCAL VARIABLES --------------------------------------- */

static int serial_handle = 0;


/**********************/
/* Exported functions */


/************************************************************************/
/* debug_serial_init                                                    */
/*                                                                      */
/* Function to initialise Serial Port debugging.                        */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    true or false.                                           */
/*                                                                      */
/************************************************************************/
bool debug_serial_init (void)
{
  char *device_setup;

  if ((device_setup = malloc(strlen(Serial_Stream) + 25)) != NULL)
  {
    /* Setup device string */
    sprintf(device_setup, Serial_Stream, debug_current_options.serial_port_speed,
            debug_current_options.serial_port_number);

    serial_handle = debug_serial_lib_open_stream(device_setup, Serial_Output);

    free(device_setup);

    if (serial_handle == 0)
    {
      /* Failed to open socket */
      return false;
    }
    else
    {
      /* Serial device opened OK */
      return true;
    }
  }
  else
  {
    /* Malloc failed */
    return false;
  }
}


/************************************************************************/
/* debug_serial_output                                                  */
/*                                                                      */
/* Function outputs the data from the library to the serial port.       */
/*                                                                      */
/* Parameters: buffer - text to output.                                 */
/*                                                                      */
/* Returns:    void.                                                    */
/*                                                                      */
/************************************************************************/
void debug_serial_output (const char *buffer, size_t len)
{
  size_t count;

  for (count = 0; count < len; count++)
  {
    debug_serial_lib_write_byte(serial_handle, buffer[count]);

    if (buffer[count] == '\n')
    {
      if (debug_current_options.serial_lf == true)
      {
        debug_serial_lib_write_byte(serial_handle, '\r');
      }
    }
  }
}


/************************************************************************/
/* debug_serial_quit                                                    */
/*                                                                      */
/* Function to terminate  Serial.                                       */
/*                                                                      */
/*                                                                      */
/* Parameters: void.                                                    */
/*                                                                      */
/* Returns:    void                                                     */
/*                                                                      */
/************************************************************************/
void debug_serial_quit (void)
{
  debug_serial_lib_close_stream(serial_handle);
  serial_handle = 0;
}
