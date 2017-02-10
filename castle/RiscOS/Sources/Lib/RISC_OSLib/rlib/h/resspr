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
 * Title:   resspr.h
 * Purpose: Access to sprite resources
 *
 */

# ifndef __resspr_h
# define __resspr_h

# ifndef __sprite_h
# include "sprite.h"
# endif

/* ----------------------------- resspr_init -------------------------------
 * Description:   Initialises, ready for calls to resspr functions.
 *
 * Parameters:    void
 * Returns:       void.
 * Other Info:    call before using any resspr functions and before using
 *                template_init() !! This function reads in your sprites.
 *
 */

void resspr_init(void);


/* ----------------------------- resspr_readfile ---------------------------
 * Description:   Read in sprite file and initialise, ready for calls to
 *                resspr functions.
 *
 * Parameters:    char *name -- the name of the sprite file to be read.
 * Returns:       void.
 * Other Info:    call before using any resspr functions and before using
 *                template_init() !! This function reads in your sprites.
 *
 */

#define resspr_readfile(s) resspr_init()


/* ------------------------------ resspr_area ------------------------------
 * Description:   Return pointer to sprite area being used.
 *
 * Parameters:    void
 * Returns:       pointer to sprite area being used.
 * Other Info:    useful for passing params to functions like baricon which
 *                expect to be told sprite area to use.
 *
 */

sprite_area *resspr_area(void); 

#endif

/* end of resspr.h */
