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
/******	misc.c ************************************************************\

Project:	Ursula (RISC OS for Risc PC II)
Component:	Modular Configure
Purpose:	Misc routines shared between multiple Configure plug-ins

History:
Date		Who	Change
----------------------------------------------------------------------------
09/12/1997	BJGA	Split into Common, Cmos, Message & Str files
			Renamed functions to misc_foo convention
			Added these headers
15/01/1998	BJGA	WimpFlags cmos struct altered to new format

\**************************************************************************/

/* CLib */
#include <stdio.h>
#include "swis.h"
/* Toolbox */
#include "wimplib.h"
#include "toolbox.h"
#include "window.h"
#include "gadgets.h"
/* local headers */
#include "misc.h"  /* includes prototypes for this file */
#include "cmos.h"
#include "message.h"
#include "str.h"

static const cmos wimpflags = { 0xC5, 0, 8 };
static int initial_left, initial_top;
static BOOL initial_specified = FALSE;

/******	throw() ***********************************************************\

Purpose:	Throws an error (to be picked up by the error handler)
In:		Error block, eg as returned from SWI veneer

\**************************************************************************/

void throw (_kernel_oserror *error)
{
  if (error != NULL) _swi (OS_GenerateError, _IN(0), (int) error);
}

/******	misc_parsearguments() *********************************************\

Purpose:	Decodes the command line
Note:		Details are stored in static global variables
In:		Command line details, as passed to main()

\**************************************************************************/

void misc_parsearguments (int argc, char *argv[])
{
  int arg;
  for (arg = 1; arg <= argc-3; arg++) {
    int t = _swi (Territory_Collate, _INR(0,3)|_RETURN(0), -1, (int) argv [arg], (int) "-openat", 1);
    if (t == 0) {
      initial_specified = TRUE;
      initial_left = _swi (OS_ReadUnsigned, _INR(0,1)|_RETURN(2), 1u<<31, (int) argv [arg+1]);
      initial_top = _swi (OS_ReadUnsigned, _INR(0,1)|_RETURN(2), 1u<<31, (int) argv [arg+2]);
    }
  }
}

/******	misc_openwindow() *************************************************\

Purpose:	Opens or re-opens a window at the front of the window stack
In:		window:		Toolbox window id
		atinitcoords:	Whether to open at coordinates from
				command line rather than current position

\**************************************************************************/

void misc_openwindow (ObjectId window, BOOL atinitcoords)
{
  WimpGetWindowStateBlock windowstate;
  WindowShowObjectBlock tboxpos;
  throw (window_get_wimp_handle (0, window, &windowstate.window_handle));
  throw (wimp_get_window_state (&windowstate));
  if (atinitcoords) {
    if (!initial_specified) { /* centre on screen */
      int dx = 1u << _swi (OS_ReadModeVariable, _INR(0,1)|_RETURN(2), -1, 4);
      int dy = 1u << _swi (OS_ReadModeVariable, _INR(0,1)|_RETURN(2), -1, 5);
      int xs = dx * (1 + _swi (OS_ReadModeVariable, _INR(0,1)|_RETURN(2), -1, 11));
      int ys = dy * (1 + _swi (OS_ReadModeVariable, _INR(0,1)|_RETURN(2), -1, 12));
      initial_left = (xs - windowstate.visible_area.xmax + windowstate.visible_area.xmin) / 2;
      initial_top = (ys + windowstate.visible_area.ymax - windowstate.visible_area.ymin) / 2;
    }
    tboxpos.visible_area.xmin = initial_left;
    tboxpos.visible_area.ymin = initial_top + windowstate.visible_area.ymin - windowstate.visible_area.ymax;
    tboxpos.visible_area.xmax = initial_left + windowstate.visible_area.xmax - windowstate.visible_area.xmin;
    tboxpos.visible_area.ymax = initial_top;
  }
  else {
    tboxpos.visible_area = windowstate.visible_area;
  }
  tboxpos.xscroll = windowstate.xscroll;
  tboxpos.yscroll = windowstate.yscroll;
  tboxpos.behind = -1;
  throw (toolbox_show_object (0, window, Toolbox_ShowObject_FullSpec, &tboxpos, NULL_ObjectId, NULL_ComponentId));
}

/******	misc_shadecomponents() ********************************************\

Purpose:	Shades or unshades a group of toolbox components
In:		shade:	Shade, rather than unshade
		others: toolbox object ID and component ID range

\**************************************************************************/

void misc_shadecomponents (BOOL shade, ObjectId window, ComponentId min, ComponentId max)
{
  ComponentId loop;
  unsigned int flags;
  for (loop = min; loop <= max; loop++) {
    throw (gadget_get_flags (0, window, loop, &flags));
    throw (gadget_set_flags (0, window, loop, (flags & ~Gadget_Faded) | (shade ? Gadget_Faded : 0)));
  }
}

/******	misc_applywimpflags() *********************************************\

Purpose:	Forces Wimp to take notice of current WimpFlags CMOS byte

\**************************************************************************/

void misc_applywimpflags (void)
{
  char buffer [256];
  sprintf (buffer, "Configure WimpFlags %i", cmos_read (wimpflags, NULL));
  _swi (OS_CLI, _IN(0), (int) buffer);
}

/******	misc_fileislocked() ***********************************************\

Purpose:	Returns whether a given file is locked
Notes:		Anything other than W~L for user permissions considered locked
		No attempt made to check world permissions when on a remote machine
In:		Filename
Out:		TRUE => file is present and locked (ie you can't write to it)

\**************************************************************************/

BOOL misc_fileislocked (char *fname)
{
  int type;
  int attr = _swi (OS_File, _INR(0,1)|_RETURN(5)|_OUT(0), 17, (int) fname, &type) & 10;
  			/* No error is generated above for file-not-found */
  return (type != 0) && (attr != 2);
}

/******	misc_fileisunreadable() *******************************************\

Purpose:	Returns whether a given file is readable
Notes:		Based solely upon user R permission
		No attempt made to check world permissions when on a remote machine
In:		Filename
Out:		TRUE => file is absent, or present and not readable (ie you can't read from it)

\**************************************************************************/

BOOL misc_fileisunreadable (char *fname)
{
  int type;
  int attr = _swi (OS_File, _INR(0,1)|_RETURN(5)|_OUT(0), 17, (int) fname, &type) & 1;
  			/* No error is generated above for file-not-found */
  return (type == 0) || (attr == 0);
}

/******	misc_readline() ***************************************************\

Purpose:	Like fgets, but skips Obey file comments
In:		Buffer pointer, size of buffer, file pointer
Out:		TRUE => line read successfully

\**************************************************************************/

BOOL misc_readline (char *line, int n, FILE *file)
{
  do {
    fgets (line, n, file); /* reads up to (n-1) characters */
    if (feof (file)) return FALSE; /* failure */
  } while (*line == '|');
  str_cpy (line, line); /* null-terminate */
  return TRUE; /* success */
}
