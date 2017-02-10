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
/* Title:   object.h
 * Purpose: object list handling for the Iconbar module
 * Author:  IDJ
 * History: 11-Oct-93: IDJ: created
 *
 */


#ifndef __object_h
#define __object_h

#ifndef __toolbox_h
#include "objects.toolbox.h"
#endif

#ifndef __wimp_h
#include "twimp.h"
#endif

typedef struct object
{
        struct object  *next;
        struct object  *prev;
        int             state;
        int             flags;
        int             position;
        int             priority;
        char           *dummy1;             /* sprite name */
        int             max_sprite;
        char           *dummy2;             /* text */
        int             max_text_len;
        ObjectID        menu;
        int             select_event;
        int             adjust_event;
        ObjectID        select_show;
        ObjectID        adjust_show;
        char           *help_message;
        int             max_help;
        wimp_Icon       icon;
        ObjectID        id;
        int             wimp_icon_handle;

        /* string data is held here. Pointers from above, point here. */
        /* ordering is:
                 help_message,
                 icon.indirect_sprite.sprite.name (sprite only) 
              OR icon.indirect_text_and_sprite.buffer (sprite&text)
                 icon.indirect_text_and_sprite.valid_string 
        */

} Object;

/* iconbar object states */
#define object_SHOWING   0x00000001


#endif
