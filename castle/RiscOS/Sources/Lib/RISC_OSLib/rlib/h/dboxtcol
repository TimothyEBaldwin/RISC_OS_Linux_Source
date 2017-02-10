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
/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the RISCOS library for writing applications in C for RISC OS. It may be  *
 * used freely in the creation of programs for Archimedes. It should be     *
 * used with Acorn's C Compiler Release 3 or later.                         *
 *                                                                          *
 ***************************************************************************/

/* Title:    dboxtcol.h
 * Purpose:  Display and entry of true colours
 * 
 */

#ifndef __dboxtcol_h
#define __dboxtcol_h

#ifndef BOOL
#define BOOL int
#define TRUE 1
#define FALSE 0
#endif

typedef int dboxtcol_colour ;  /* colour as BBGGRRxx */

typedef void (*dboxtcol_colourhandler)(dboxtcol_colour col, void *handle);

#define dboxtcol_Transparent (-1)

/* ----------------------------- dboxtcol ----------------------------------
 * Description:   Displays a dialogue box to allow the editing of a true
 *                colour value.
 *
 * Parameters:    dboxtcol_colour *colour -- colour to be edited
 *                BOOL allow_transparent  -- enables selection of a
 *                                           "see-through" colour
 *                char *name -- title to put in dialogue box.
 *                dboxtcol_colourhandler proc -- function to act on the
 *                                               colour change.
 *                void *handle -- this is the handle passed to "proc".
 * Returns:       TRUE if colour edited, user clicks OK.
 * Other Info:    The dialogue box to be used should be the same as that
 *                used by !Paint to edit the palette. If the user clicks
 *                Select on OK then the "proc" is called and the dialogue box
 *                is closed. If the user right-clicks on OK then the "proc"
 *                is called and the dialogue box stays on the screen. This
 *                allows the client of this function to use "proc" to, say,
 *                change a sprites palette to reflect the edited colour value
 *                and then to cause a redraw of the sprite. 
 *
 */

BOOL dboxtcol(dboxtcol_colour *colour /*inout*/, BOOL allow_transparent,
              char *name, dboxtcol_colourhandler proc, void *handle) ;

#endif

/* end dboxtcol.h */
