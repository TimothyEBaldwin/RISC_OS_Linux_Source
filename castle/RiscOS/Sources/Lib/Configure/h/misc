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
/******	misc.h ************************************************************\

Project:	Ursula (RISC OS for Risc PC II)
Component:	Modular Configure
Purpose:	Misc routines shared between multiple Configure plug-ins

History:
Date		Who	Change
----------------------------------------------------------------------------
09/12/1997	BJGA	Split into Common, Cmos, Message & Str files
			Renamed functions to misc_foo convention
			Added these headers
02/02/1998	BJGA	Added PlugInSystem macros
19/06/1998	BJGA	Added #define Wimp_MChoicesChanged
26/06/1998	BJGA	Added #define Wimp_MUnfadingSCSIIcons

\**************************************************************************/

#ifndef __misc_h
#define __misc_h

/* CLib */
#include <stdio.h>
#include "kernel.h"
/* Toolbox */
#include "toolbox.h"
/* local headers */
#include "cmos.h"

/* Macros */

#define	min(x,y) (((x)<(y))?(x):(y))
#define	max(x,y) (((x)>(y))?(x):(y))

/* Constants */

#define ConfigureChunk			0x50D80

#define Wimp_MPlugInQuit		(ConfigureChunk+0x00)
#define Wimp_MPlugInQuitContinue	(ConfigureChunk+0x01)
#define Wimp_MPlugInQuitAbort		(ConfigureChunk+0x02)
#define Wimp_MOpenConfigWindow		(ConfigureChunk+0x03)
#define Wimp_MFSLockStateChangeRequest	(ConfigureChunk+0x04)
#define Wimp_MFSLockStateChangeConfirm	(ConfigureChunk+0x05)
#define Wimp_MFSLockStateChanged	(ConfigureChunk+0x06)
#define Wimp_MChoicesChanged		(ConfigureChunk+0x07)
#define Wimp_MUnfadingSCSIIcons		(ConfigureChunk+0x08)

#define PlugInSystem_Configure		(ConfigureChunk+0x3F)
#define PlugInSystem_Boot		(ConfigureChunk+0x3E)
#define PlugInSystem_Fonts		(ConfigureChunk+0x3D)

/* Prototypes */

extern void throw (_kernel_oserror *error);
extern void misc_parsearguments (int argc, char *argv[]);
extern void misc_openwindow (ObjectId window, BOOL atinitcoords);
extern void misc_shadecomponents (BOOL shade, ObjectId window, ComponentId min, ComponentId max);
extern void misc_applywimpflags (void);
extern BOOL misc_fileislocked (char *fname);
extern BOOL misc_fileisunreadable (char *fname);
extern BOOL misc_readline (char *line, int n, FILE *file);

#endif
