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
 * Title:   txtopt.h
 * Purpose: setting/reading the name used for setting text editing options
 * 
 */

#ifndef __txtopt_h
#define __txtopt_h


/* ----------------------------- txtopt_set_name ---------------------------
 * Description:   Set the name used as a system variable for setting text
 *                editing options
 *
 * Parameters:    char *name -- the name to be prepended to $Options to form
 *                              the system variable name.
 * Returns:       void.
 * Other Info:    If this function is not called before using any of the
 *                txt and txtedit functions, the system variable name
 *                defaults to Edit$Options.
 *                eg. txtopt_set_name("MyEdit") sets the system variable name
 *                to MyEdit$Options
 *
 */

void txtopt_set_name(char *name);


/* ---------------------------- txtopt_get_name ----------------------------
 * Description:   Get a pointer to the name currently prepended to $Options
 *                to form a system variable for use in setting text editing
 *                options.
 *
 * Parameters:    void.
 * Returns:       pointer to name
 * Other Info:    If no name has been set, this will point to "Edit".
 *                eg. assuming option name is currently MyEdit$Options
 *                then txtopt_get_name will return a pointer to the string
 *                "MyEdit".
 *
 */

char *txtopt_get_name(void);

#endif
