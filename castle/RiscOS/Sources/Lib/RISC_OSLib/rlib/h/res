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
 * Title:   res.h
 * Purpose: Access to resources
 *
 */

# ifndef __res_h
# define __res_h

# include <stdio.h>       /* 
                           * stdio.h checks if it's already been included
                           * so this is safe
                           */

/* -------------------------------- res_init ------------------------------
 * Description:   Initialises, ready for calling other res functions.
 *
 * Parameters:    const char *a -- your program name
 * Returns:       void.
 * Other Info:    call this before using any res functions
 *                (or before using any resspr functions!).
 *
 */

void res_init(const char *progname);


/* ------------------------------- res_findname ---------------------------
 * Description:   Creates full pathname for "resname" file.
 *
 * Parameters:    const char *resname -- name of one of your resource files
 *                char *buf -- buffer to put full pathname in
 * Returns:       TRUE always!!
 * Other Info:    full pathname is constructed as:
 *                             ProgramName:resname
 *                or if that doesn't exist:
 *                             <ProgramName$Dir>.resname
 *                where ProgramName has been set using res_init.
 *
 */

int res_findname(const char *resname, char *buf /*out*/);


/* ------------------------------- res_prefixnamewithpath -----------------
 * Description:   Creates full pathname for "resname" file.
 *
 * Parameters:    const char *resname -- name of one of your resource files
 *                char *buf -- buffer to put full pathname in
 * Returns:       TRUE always!!
 * Other Info:    full pathname is constructed as:
 *                             ProgramName:resname
 *                where ProgramName has been set using res_init.
 *
 */

int res_prefixnamewithpath(const char *resname, char *buf /*out*/);


/* ------------------------------- res_prefixnamewithdir ------------------
 * Description:   Creates full pathname for "resname" file.
 *
 * Parameters:    const char *resname -- name of one of your resource files
 *                char *buf -- buffer to put full pathname in
 * Returns:       TRUE always!!
 * Other Info:    full pathname is constructed as:
 *                             <ProgramName$Dir>.resname
 *                where ProgramName has been set using res_init.
 *
 */

int res_prefixnamewithdir(const char *resname, char *buf /*out*/);


/* -------------------------- res_openfile --------------------------------
 * Description:   opens a named resource file, in a given ANSI-style mode.
 *
 * Parameters:    const char *resname -- name of the resource file
 *                const char *mode -- usual ANSI open mode ("r", "w", etc)
 * Returns:       ANSI FILE pointer for opened file.
 * Other Info:    resname should be a "leafname" (a call to res_findname is
 *                made for you!).
 *
 */

FILE *res_openfile(const char *resname, const char *mode);

#endif

/* end of res.h */
