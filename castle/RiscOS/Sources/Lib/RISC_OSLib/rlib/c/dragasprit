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
/*
 * Title: c.dragasprit.c
 * Purpose: Dragging a sprite
 * Author: JSR
 * History:
 *   0.00 06-Nov-90 JSR created
 *        13-May-91 ECN turned of stack checking
 */

#include "os.h"

#include "dragasprit.h"

# ifndef DragASprite_Start
# define DragASprite_Start 0x42400
# define DragASprite_Stop  0x42401
# endif

#pragma -s1

extern os_error * dragasprite_start
(
        dragasprite_options     options,
        sprite_area             *area,
        char                    *name,
        wimp_box                *dragbox,
        wimp_box                *boundbox
)
{
        os_regset r;

        r.r[0] = (int)options;
        r.r[1] = (int)area;
        r.r[2] = (int)name;
        r.r[3] = (int)dragbox;
        r.r[4] = (int)boundbox;

        return os_swix( DragASprite_Start, &r );
}

extern os_error * dragasprite_stop
(
        void
)
{
        os_regset r;

        return os_swix( DragASprite_Stop, &r );
}

#pragma -s0
