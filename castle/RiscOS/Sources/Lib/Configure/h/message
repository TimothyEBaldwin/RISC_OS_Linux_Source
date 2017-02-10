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
/******	message.h *********************************************************\

Project:	Ursula (RISC OS for Risc PC II)
Component:	Modular Configure
Purpose:	Message macros shared between multiple Configure plug-ins

History:
Date		Who	Change
----------------------------------------------------------------------------
08/12/1997	BJGA	Split from Common
			Added these headers
16/01/1998	BJGA	Added #includes
20/01/1998	BJGA	Removed #include "misc.h" - prevents use of this file in Installer

\**************************************************************************/

#ifndef __message_h
#define __message_h

/* CLib */
#include "swis.h"

/* Macros */

#define message_lookup_buffer(buf,mfd,str) \
  (*((buf) + _swi (MessageTrans_Lookup, _INR(0,7)|_RETURN(3), (int) &(mfd), (int) (str), (int) (buf), sizeof (buf) - 1, NULL, NULL, NULL, NULL)) = (char) 0)

#define message_lookup_direct(mfd,str) \
  ((char *) _swi (MessageTrans_Lookup, _INR(0,2)|_RETURN(2), (int) &(mfd), (int) (str), 0))

#define message_error(mfd,errb) \
  (throw ((_kernel_oserror *) _swix (MessageTrans_ErrorLookup, _INR(0,7)|_RETURN(0), (int) &(errb), (int) &(mfd), 0, 0, 0, 0, 0, 0)))

#endif
