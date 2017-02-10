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
15/01/1998	BJGA	Changed cmos struct (default field no longer required)
			Added cmos_xxx_FILE macros

\**************************************************************************/

#ifndef __cmos_h
#define __cmos_h

/* Macros */

#define cmos_SAVED_FILE		"<Choices$Write>.CMOS"
#define cmos_DEFAULT_FILE	"Choices:ResetCMOS"

/* Types */

typedef	struct { int cmosbyte;
		 int cmosbit;
		 int cmoslength; } cmos;

/* Prototypes */

extern int cmos_default (cmos item, void *messages);
extern int cmos_read (cmos item, void *messages);
extern void cmos_write (cmos item, int value);

#endif
