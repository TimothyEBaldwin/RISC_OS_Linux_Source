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
 * Title:   dboxfile.h
 * Purpose: display of a dialogue box, for file name input.
 *
 */

#ifndef __dboxfile_h
#define __dboxfile_h

/* ------------------------------ dboxfile ---------------------------------
 * Description:   Displays dialogue box with message, input field, and 
 *                OK field and allows input of filename.
 *
 * Parameters:    char *message -- informative message to be displayed
 *                                 in dialogue box
 *                unsigned filetype -- OS-dependent type of file
 *                char *a -- default filename (initially) and also used
 *                           for user-typed filename
 *                int bufsiz -- size of "a"
 * Returns:       void.
 * Other Info:    The template for the dialogue box must be called
 *                "dboxfile_db".  Parameters correspond to the template's
 *                icon numbers as follows:
 *                     icon #0 -- OK button
 *                     icon #1 -- message
 *                     icon #2 -- filename
 *                Template should have the following icons:
 *                     icon #0 -- a text icon containing text "OK"
 *                                with button type "menu icon"
 *                     icon #1 -- an indirected text icon (possibly with
 *                                a default message) with button type
 *                                "never"
 *                     icon #2 -- an indirected text icon with button
 *                                type "writeable".
 *                See the "dboxfile_db" template used by !Edit for an
 *                example.
 *                Message must be of max length 20
 *                The char array pointed to by "a" will contain the typed-in
 *                file name of max length bufsize (if longer, truncated)
 *
 */
  
void dboxfile(char *message, unsigned filetype, char *a, int bufsize);

#endif

/* end of dboxfile.h */

