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
/* Title:   delete.c
 * Purpose: delete an Iconbar Object
 * Author:  IDJ
 * History: 7-Oct-93:  IDJ: created
 *          25-Jul-94: IDJ: fixed delete bug which tried to free help_message and valid_string
 *
 */


#include <stdio.h>
#include <stdlib.h>
#include "kernel.h"
#include "swis.h"

#include "const.h"
#include "macros.h"
#include "debug.h"
#include "mem.h"
#include "messages.h"

#include "objects/toolbox.h"
#include "objects/iconbar.h"

#include "object.h"
#include "task.h"

#include "delete.h"


extern _kernel_oserror *delete_object (_kernel_swi_regs *r, TaskDescriptor *t)
{

    /*
     * request to delete an object
     * R0 = 1
     * R1 = Object ID
     * R2 = internal handle returned when Object was created
     * R3 = wimp task handle of caller (use to identify task descriptor)
     * R4 -> user regs R0-R9
     *       R0  =  flags
     *       R1  =  Object ID
     */

    /*
     * The Toolbox has already checked that this is not just a delete
     * call for a shared Object.
     * We delete Object from the list of Objects for this
     * task.
     * If recursive delete is requested then we also call Toolbox_Delete
     * for any Objects "attached" to this Object.
     */

    /*
     * For an Iconbar Object, we first try to hide the Object.
     * Then we delete any attached objects (menus, select_show, adjust_show).
     * Then we remove the object data structure from the task's list.
     */

    _kernel_swi_regs *user_regs    = (_kernel_swi_regs *)r->r[4];
    int               flags        = user_regs->r[0];
    Object           *iconbar_icon = (Object *)r->r[2];


    DEBUG debug_output ("delete", "I:Delete iconbar object -- ID 0x%x, flags 0x%x\n", r->r[1], user_regs->r[0]);

    /*
     * Hide the Object first.
     */

    _swix (Toolbox_HideObject, _INR(0,1), 0, r->r[1]);


    /*
     * delete attached objects (if recursive)
     */

    if (!(flags & Toolbox_DeleteObject_DontRecurse))
    {
        if (iconbar_icon->menu != 0)
            _swix (Toolbox_DeleteObject, _INR(0,1), flags, iconbar_icon->menu);

        if (iconbar_icon->select_show != 0)
            _swix (Toolbox_DeleteObject, _INR(0,1), flags, iconbar_icon->select_show);

        if (iconbar_icon->adjust_show != 0)
            _swix (Toolbox_DeleteObject, _INR(0,1), flags, iconbar_icon->adjust_show);
    }


    /*
     * remove from task's object list
     */

    if (iconbar_icon->prev != NULL)
        iconbar_icon->prev->next = iconbar_icon->next;
    if (iconbar_icon->next != NULL)
        iconbar_icon->next->prev = iconbar_icon->prev;

    if (t->object_list == iconbar_icon)
        t->object_list = iconbar_icon->next;


    /*
     * and free up memory
     */

    mem_free (iconbar_icon, "iconbar delete");


    return NULL;
}

