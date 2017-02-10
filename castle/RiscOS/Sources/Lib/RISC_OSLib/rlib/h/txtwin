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

/* Title:   txtwin.h
 * Purpose: control of multiple windows on Text objects.
 *
 */

#ifndef __txtwin_h
#define __txtwin_h

#ifndef __txt_h
#include "txt.h"
#endif

/* A Text can support multiple windows. When the Text is updated, all
 * of the windows are updated in step. All of the windows have the same
 * title information. 
 *
 */

/* ----------------------------- txtwin_new --------------------------------
 * Description:   Creates an extra window on a given text object.
 *
 * Parameters:    txt t -- the text to have window added to it.
 * Returns:       void.
 * Other Info:    The created window will be in the same style as for 
 *                txt_new(), with the same title information. The window 
 *                will be made visible.
 *
 */
 
void txtwin_new(txt t);


/* --------------------------------- txtwin_number -------------------------
 * Description:   Informs caller of the number of windows currently on a
 *                given text.
 *
 * Parameters:    txt t -- the text.
 * Returns:       The number of windows currently on "t".
 * Other Info:    none.
 *
 */

int txtwin_number(txt t);


/* -------------------------------- txtwin_dispose -------------------------
 * Description:   Removes a window, previously on "t".
 *
 * Parameters:    txt t -- the text.
 * Returns:       void.
 * Other Info:    This call will have no effect if there is only one window
 *                on "t".
 *
 */

void txtwin_dispose(txt t);


/* --------------------------- txtwin_setcurrentwindow ---------------------
 * Description:    Ensures that the last window to which the last event was
 *                 delivered, is the current window on a given text
 *
 * Parameters:     txt t -- the text.
 * Returns:        void.
 * Other Info:     Call this when constructing menus, since the same menu
 *                 structure is attached to each window on the same text
 *                 object.
 *
 */

void txtwin_setcurrentwindow(txt t);

#endif

/* end txtwin.h */
