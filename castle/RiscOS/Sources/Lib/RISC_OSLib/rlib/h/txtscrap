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
 * Title: txtscrap.h
 * Purpose: Coordinate a unique txt selection among many txt objects.
 *
 */

# ifndef __txtscrap_h
# define __txtscrap_h

# ifndef __txt_h
# include "txt.h"
# endif

/**************************** INTERFACE FUNCTIONS *************************/


/* --------------------------- txtscrap_setselect --------------------------
 * Description:   Calls txt_setselect(t, from, to) and remembers t.
 *                If another txt object currently holds the selection
 *                then this is first cleared.
 *
 * Parameters:    txt t -- text object
 *                txt_index from -- array index of start of selection
 *                txt_index to -- array index of end of selection
 *                (i.e. first character not in the selection).
 *
 * Returns:       void.
 * Other Info:    If "from" >= "to" then the selection will be unset, and
 *                t will not be remembered as holding the current selection.
 *                A txt must not be destroyed while still holding the
 *                selection, please clear the selection first.
 *
 */

void txtscrap_setselect(txt t, txt_index from, txt_index to);


/* -------------------------- txtscrap_selectowner -------------------------
 * Description:   Returns the current holder of the selection.
 *
 * Parameters:    void.
 *
 * Returns:       The txt that currently holds the selection, or 0 if none.
 * Other Info:    none.
 *
 */

txt  txtscrap_selectowner(void);

# endif

/* end scrap.h */


