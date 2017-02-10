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
 * Title: akbd.h
 * Purpose: Access to keyboard under the Wimp.
 *
 */

/* Standard key codes produced by Wimp, for special keys. */

#ifndef __akbd_h
#define __akbd_h

#define akbd_Fn (256 + 128)
#define akbd_Sh (16)
#define akbd_Ctl (32)
#define akbd_TabK (akbd_Fn + 10)
#define akbd_EndK (akbd_Fn + 11)
#define akbd_CopyK akbd_EndK /* Same position on Archimedes */
#define akbd_LeftK (akbd_Fn + 12)
#define akbd_RightK (akbd_Fn + 13)
#define akbd_DownK (akbd_Fn + 14)
#define akbd_UpK (akbd_Fn + 15)
#define akbd_Fn10 (0x1CA)
#define akbd_Fn11 (0x1CB)
#define akbd_Fn12 (0x1CC)
#define akbd_InsertK (0x1CD)
#define akbd_PrintK (akbd_Fn+0)
#define akbd_PageUpK (akbd_Sh+akbd_UpK)
#define akbd_PageDownK (akbd_Sh+akbd_DownK)
#define akbd_LeftFlagK (0x1C0) /* Windows logo key */
#define akbd_RightFlagK (0x1D0) /* Windows logo key */
#define akbd_MenuK (0x1C1) /* Windows menu key */

/* ----------------------------- akbd_pollsh ----------------------------
 * Description:  Checks if SHIFT key is depressed.
 *               
 * Parameters:   none
 * Returns:      1 if SHIFT depressed, 0 otherwise.
 * Other Info:   none.
 */

int akbd_pollsh(void); 


/* ---------------------------- akbd_pollctl ----------------------------
 * Description:   Checks if CTRL key is depressed.
 *
 * Parameters:    none
 * Returns:       1 if CTRL key depressed, 0 otherwise.
 * Other Info:    none.
 */

int akbd_pollctl(void);


/* --------------------------- akbd_pollkey -----------------------------
 * Description:   Checks if user has typed ahead.
 *
 * Parameters:    int *keycode -- value of key pressed
 * Returns:       1 if user has typed ahead
 *                Also passes value of key back through keycode.
 * Other Info:    Function keys appear as values > 256 (produced by wimp)
 *                See #defines above, for such values.
 */

int akbd_pollkey(int *keycode);

#endif


/* end akbd.h */
