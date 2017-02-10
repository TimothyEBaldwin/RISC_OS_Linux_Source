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
 * Title  : werr.h
 * Purpose: provide error reporting in wimp programs
 *  
 */

#ifndef __werr_h
#define __werr_h

/* ----------------------------------- werr --------------------------------
 * Description:   Display a (possibly fatal) error message in a pop-up 
 *                dialogue box.
 * 
 * Parameters:    int fatal -- non-zero indicates fatal error
 *                char *format -- printf-style format string
 *                ... -- variable arg list of message to be printed
 * Returns:       void.
 * Other Info:    Program exits if fatal is non-zero
 *                Pointer is restricted to displayed dialogue box to stop 
 *                user continuing until he has clicked on "OK" buton.
 *                The message should be divided into at most three lines,
 *                each of 40 characters or less.
 * 
 */

void werr(int fatal, char* format, ...);

#endif

/* end werr.h */
