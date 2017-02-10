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
 * Title:   visdelay.h
 * Purpose: Visual indication of some delay
 *
 */

#ifndef __visdelay_h
#define __visdelay_h

/* ----------------------------- visdelay_begin ----------------------------
 * Description:   Change pointer to show user there will be some delay
 *                (currently the RISC OS hourglass).
 *
 * Parameters:    void
 * Returns:       void.
 * Other Info:    Under RISC OS hourglass will only appear if the delay
 *                is longer than 1/3 sec.
 *
 */

void visdelay_begin(void);


/* -------------------------- visdelay_percent -----------------------------
 * Description:   Indicates to user that delay is p percent complete.
 * 
 * Parameters:    int p -- percentage complete
 * Returns:       void.
 * Other Info:    none.
 *
 */

void visdelay_percent(int p);


/* --------------------------- visdelay_end --------------------------------
 * Decsription:   Remove indication of delay.
 *
 * Parameters:    void
 * Returns:       void.
 * Other Info:    none.
 *
 */

void visdelay_end(void);


/* --------------------------- visdelay_init -------------------------------
 * Description:   Initialise ready for visdelay functions.
 *
 * Parameters:    void
 * Returns:       void.
 * Other Info:    none.
 *
 */

void visdelay_init(void);

#endif

/* end visdelay.h */
