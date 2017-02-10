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

/* Title:       pointer.h 
 * Purpose:     Setting of the pointer shape
 *
 */

# ifndef __pointer_h
# define __pointer_h

# ifndef __sprite_h
# include "sprite.h"
# endif

# ifndef __os_h
# include "os.h"
# endif

# ifndef __wimp_h
# include "wimp.h"
# endif


/* -------------------------- pointer_set_shape ---------------------------
 * Description:   Sets pointer shape 2, to sprite, from sprite area
 * 
 * Parameters:    sprite_area* -- area where sprite is to be found
 *                sprite_id* -- identity of the sprite
 *                int, int -- active point for pointer
 * Returns:       possible error condition.
 * Other Info:    typical use is to change pointer shape on entering/leaving
 *                application window (appropriate events are returned from
 *                wimp_poll.
 *
 */

os_error *pointer_set_shape(sprite_area *, sprite_id *, int, int) ;


/* ------------------------- pointer_reset_shape ---------------------------
 * Description:   Resets pointer shape to shape 1.
 *
 * Parameters:    void
 * Returns:       void
 * Other Info:    Typically should be called when leaving application 
 *                window.
 *
 */

void pointer_reset_shape(void) ;

#endif

/* end pointer.h */
