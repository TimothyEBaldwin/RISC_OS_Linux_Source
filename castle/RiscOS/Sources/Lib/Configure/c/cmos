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
/******	cmos.h ************************************************************\

Project:	Ursula (RISC OS for Risc PC II)
Component:	Modular Configure
Purpose:	CMOS routines shared between multiple Configure plug-ins

History:
Date		Who	Change
----------------------------------------------------------------------------
08/12/1997	BJGA	Split from Common
			Added these headers
15/01/1998	BJGA	cmos_default now reads from cmos_DEFAULT_FILE

\**************************************************************************/

/* CLib */
#include <stdio.h>
#include "kernel.h"
#include "swis.h"
/* local headers */
#include "cmos.h"  /* includes prototypes for this file */
#include "misc.h"

/******	cmos_default() ****************************************************\

Purpose:	Returns the default setting for this CMOS item
		(This way, just the one bit of code is required for reflecting
		the current and default settings in the window)
In:		Item specifier, MFD for message file in which to find Err_NoDefCMOS token
Out:		Value

\**************************************************************************/

int cmos_default (cmos item, void *messages)
{
  static const _kernel_oserror err_nodefcmos = { 0, "Err_NoDefCMOS" };
  FILE *defaults;
  int byte;

  defaults = fopen (cmos_DEFAULT_FILE, "rb");
  if (defaults == NULL) {
    /* No file, ask the Kernel what it would use */
    if (_swix (OS_NVMemory, _INR(0,1)|_OUT(2), 6, item.cmosbyte, &byte) != NULL) {
      /* Kernel doesn't support that OS_NVMemory reason, throw an error */
      throw ((_kernel_oserror *) _swix (MessageTrans_ErrorLookup, _INR(0,7)|_RETURN(0),
          (int) &err_nodefcmos, (int) messages, 0, 0, 0, 0, 0, 0)); /* can't use message_error() */
    }
  }
  else {
    fseek (defaults, item.cmosbyte, SEEK_SET);
    byte = fgetc (defaults);
    fclose (defaults);
  }

  return (byte >> item.cmosbit) & ((1u << item.cmoslength) -1);
}

/******	cmos_read() *******************************************************\

Purpose:	Returns the current setting for this CMOS item
		(This way, just the one bit of code is required for reflecting
		the current and default settings in the window)
In:		Item specifier
Out:		Value

\**************************************************************************/

int cmos_read (cmos item, void *messages /* unused */)  /* note these calls will not span byte boundaries */
{
  (void)messages;
  return ((_swi (OS_Byte, _INR(0,1)|_RETURN(2), 161, item.cmosbyte)) >> item.cmosbit) & ((1u << item.cmoslength) -1);
}

/******	cmos_write() ******************************************************\

Purpose:	Sets the value of a CMOS item
In:		Item specifier, new value

\**************************************************************************/

void cmos_write (cmos item, int value)  /* note these calls will not span byte boundaries */
{
  int byte, ovalue;
  byte = _swi (OS_Byte, _INR(0,1)|_RETURN(2), 161, item.cmosbyte);
  ovalue = (byte >> item.cmosbit) & ((1u << item.cmoslength) -1);
  if (value != ovalue) {
    byte &= ~( ((1u << item.cmoslength) -1) << item.cmosbit ); /* clear the old bit(s) */
    value &= ((1u << item.cmoslength) -1);                     /* force new value into range */
    byte += value << item.cmosbit;
    _swi (OS_Byte, _INR(0,2), 162, item.cmosbyte, byte);
  }
}
