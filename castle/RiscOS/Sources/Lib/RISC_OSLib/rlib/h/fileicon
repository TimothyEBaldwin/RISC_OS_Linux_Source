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

/*
 * Title:   fileicon.h
 * Purpose: general display of a file icon in a window.
 *
 */

# ifndef __fileicon_h
# define __fileicon_h

# ifndef __wimp_h 
# include "wimp.h"
# endif

/* ------------------------------ fileicon ---------------------------------
 * Description:   Display an icon representing a file, in a given window
 *
 * Parameters:    wimp_w -- the given window's handle
 *                wimp_i -- an existing icon
 *                int filetype -- RISC OS file type (eg. 0x0ffe)
 * Returns:       void.
 * Other Info:    If you want a file icon in a dialogue box then pass that
 *                dialogue box's window handle through first parameter,
 *                    eg fileicon((wimp_w)dbox_syshandle(d),........)
 *                The second parameter is the icon number of the required
 *                icon, within the template set up using FormEd
 *                For an example see the fileInfo template for !Edit.
 *
 */ 
 
void fileicon(wimp_w, wimp_i, int filetype);

#endif

/* end fileicon.h */


