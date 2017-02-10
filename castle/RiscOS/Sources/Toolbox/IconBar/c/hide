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
/* Title:   hide.c
 * Purpose: hide a Iconbar Object
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
#include "messages.h"

#include "objects/toolbox.h"
#include "objects/iconbar.h"

#include "object.h"
#include "task.h"
#include "globals.h"

#include "hide.h"

extern _kernel_oserror *hide_object (_kernel_swi_regs *r, TaskDescriptor *t)
{

    /*
     * request to hide an Iconbar object
     * R0 = 4
     * R1 = Object ID
     * R2 = internal handle returned when Object was created
     * R3 = wimp task handle of caller (use to identify task descriptor)
     * R4 -> user regs R0-R9
     *      R0 =  flags
     *      R1 =  Object ID
     *
     */

    Object          *iconbar_icon = (Object *)r->r[2];
    _kernel_oserror *e;

    /*
     * Remove the object from view.  For efficiency, we should stop expressing
     * interest in any events which can't happen whilst the Object is
     * hidden.
     * For an Iconbar Object, "hide" means "delete the wimp icon from iconbar".
     * For efficiency, we also remove our filter for Wimp events.
     *
     */

    IGNORE(t);

    if (!(iconbar_icon->state & object_SHOWING))
        return NULL;

    if ((e = _swix (Wimp_DeleteIcon, _BLOCK(1),
                       wimp_ICONBAR,
                       iconbar_icon->wimp_icon_handle
                   )) != NULL)
        return e;

    iconbar_icon->state &= ~object_SHOWING;

    /* de-register interest in events here */

    if ((e = _swix (Toolbox_RegisterPostFilter, _INR(0,4),
                        Toolbox_RegisterPostFilter_Remove,
                        Iconbar_PostFilter,
                        iconbar_icon,
                        Toolbox_RegisterPostFilter_WimpEvent,
                        events_of_interest
                    )) != NULL)
        return e;

   if ((e = _swix (Toolbox_RegisterPostFilter, _INR(0,4),
                        Toolbox_RegisterPostFilter_Remove,
                        Iconbar_PostFilter,
                        iconbar_icon,
                        Toolbox_RegisterPostFilter_WimpMessage,
                        messages_of_interest
                    )) != NULL)
        return e;

   if ((e = _swix (Toolbox_RegisterPostFilter, _INR(0,4),
                        Toolbox_RegisterPostFilter_Remove,
                        Iconbar_PostFilter,
                        iconbar_icon,
                        Toolbox_RegisterPostFilter_ToolboxEvent,
                        toolbox_events_of_interest
                    )) != NULL)
        return e;

    t->nshowing--;

    return NULL;
}

