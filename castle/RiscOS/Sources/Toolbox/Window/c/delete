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
 * Purpose: delete a Window Object
 * Author:  IDJ
 * History: 7-Oct-93: IDJ: created
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
#include "string32.h"
#include "messages.h"

#include "objects/toolbox.h"
#include "objects/window.h"

#include "object.h"
#include "task.h"
#include "gadgets.h"
#include "events.h"
#include "show.h"

#include "delete.h"


extern int WIMP_VERSION_NUMBER;

extern void delete_all_keyboard_shortcuts(WindowInternal *window)
{
    int k;

    if (window->num_keyboard_shortcuts > 0 && window->keyboard_shortcuts != NULL)
    {
        for (k = 0; k < window->num_keyboard_shortcuts; k++)
        {
            /*
             * if object is attached to shortcut, then delete it
             */

            if (window->keyboard_shortcuts[k].key_show != NULL)
                _swix (Toolbox_DeleteObject, _INR(0,1), 0,
                             window->keyboard_shortcuts[k].key_show);
        }
        if (window->keyboard_shortcuts != NULL) {
           mem_free (window->keyboard_shortcuts, "deleted keyboard shortcuts");
           window->keyboard_shortcuts = NULL;
        }
        window->num_keyboard_shortcuts = 0;
    }
}

extern _kernel_oserror *delete_object (_kernel_swi_regs *r, TaskDescriptor *t)
{

    /*
     * request to delete an object
     * R0 = 1
     * R1 = Object ID
     * R2 = internal handle returned when Object was created
     * R3 = wimp task handle of caller (use to identify task descriptor)
     * R4 -> user regs R0-R9
     *      R0 = flags
     *           bit 0 set => do not recursively delete the object
     *      R1 = Object ID
     */

    /*
     * The Toolbox has already checked that this is not just a delete
     * call for a shared Object.
     * We delete Object from the list of Objects for this
     * task.
     * If recursive delete is requested then we also call Toolbox_Delete
     * for any Objects "attached" to this Object.
     */

    _kernel_swi_regs *user_regs    = (_kernel_swi_regs *)r->r[4];
    int               flags        = user_regs->r[0];
    WindowInternal   *window       = (WindowInternal *)r->r[2], *win;
    wimp_PointerInfo  info;

    DEBUG debug_output ("delete", "Delete window object -- ID %x, flags %x\n", r->r[1], user_regs->r[0]);

    /* check to see if this object really exists ! */

    for (win = t->object_list; win != NULL; win = win->next) {
        if (win == window) break;
    }

    if (!win) {
        DEBUG debug_output ("delete", "tried to delete non existant window object -- ID %x, flags %x\n", r->r[1], user_regs->r[0]);
        return NULL;
    }

    /*
     * first hide the window
     */

    _swix (Toolbox_HideObject, _INR(0,1), 0, user_regs->r[1]);


    /*
     * delete attached objects (if recursive)
     */

    if (!(flags & Toolbox_DeleteObject_DontRecurse))
    {
        int k;

        if (window->menu != 0)
            _swix (Toolbox_DeleteObject, _INR(0,1), 0, window->menu);

        /* delete toolbars */

        for (k=0; k<4;k++)
        {
            if (*(&(window->ibl)+k))
               _swix (Toolbox_DeleteObject, _INR(0,1), 0, *(&(window->ibl)+k));
        }

        delete_all_keyboard_shortcuts(window);
    }

    /*
     * delete gadgets
     */

    gadgets_remove_all (window,flags & Toolbox_DeleteObject_DontRecurse);

    /* can't lose fonts as we don't know how many times they were found
       for this window */

    wimp_get_pointer_info(&info);
    if (window->wimp_window_handle == info.window_handle)
        events_pointer_leaving_window(window);

    /*
     * delete the actual window
     */

    if (WIMP_VERSION_NUMBER < 350)
       _swix(0x82d01, _IN(0), window->wimp_window_handle);

    /* Conditional deletion is part of fix for PAN-01317 */
    if ((window->state & WindowInternalFlags_PreventHideDelete) == 0) {
        wimp_delete_window ((wimp_DeleteWindow *) &window->wimp_window_handle);
    }


    /*
     * remove from task's object list
     */

    if (window->prev != NULL)
        window->prev->next = window->next;
    if (window->next != NULL)
        window->next->prev = window->prev;

    if (t->object_list == window)
        t->object_list = window->next;


    /*
     * and free up memory
     */

    if (window->keyboard_shortcuts != NULL)
        mem_free (window->keyboard_shortcuts, "window delete (keybd shorts)");

    if (window->icon_mappings != NULL)
        mem_free (window->icon_mappings, "window delete (icon mappings)");

    mem_free (window, "window delete");


    return NULL;
}

