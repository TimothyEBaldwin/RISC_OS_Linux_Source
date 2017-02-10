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
/* Title:   show.c
 * Purpose: show a Generic Object
 * Author:  IDJ
 * History: 7-Oct-93: IDJ: created
 *
 */


#include <stdio.h>
#include <stdlib.h>
#include "string.h"
#include "kernel.h"
#include "swis.h"

#include "const.h"
#include "macros.h"
#include "debug.h"
#include "mem.h"
#include "messages.h"

#include "objects/toolbox.h"
#include "objects/DCS.h"
#include "objects/quit.h"

#include "object.h"
#include "task.h"

#include "show.h"


_kernel_oserror *show_do_show(_kernel_swi_regs *r,Object *obj)
{
    _kernel_swi_regs regs;

    memcpy(&regs, (_kernel_swi_regs*) r->r[4], sizeof(regs));

    regs.r[1] = (int) obj->window;        /* id of window */

    return _kernel_swi(Toolbox_ShowObject,&regs,&regs);
}

extern _kernel_oserror *show_object (_kernel_swi_regs *r, TaskDescriptor *t,int class)
{

    /*
     * request to show an object
     * R0 = 3
     * R1 = Object ID
     * R2 = internal handle returned when Object was created
     * R3 = wimp task handle of caller (use to identify task descriptor)
     * R4 -> user regs R0-R9
     *      R0 =  flags
     *      R1 =  Object ID
     *      R2 =  "show type"
     *            0 => default place
     *            1 => R3 points to buffer with full data for showing
     *            2 => R3 points to buffer with coordinates
     *      R3 = 0
     *   OR R3 -> buffer giving Object-specific data for showing this
     *            Object
     *      R4 =  Parent Object ID
     *      R5 =  Parent Component ID
     */

    /*
     * Function to "display" an Object on the screen.  If R2 == 0, then
     * display in default place.
     * If Object has bit set to say warn before show, then we should just
     * send Toolbox Event, and wait for the next call to Wimp_Poll after
     * the event is delivered before the Object is actually shown
     * (ie catch it in the prefilter).
     *
     */

     _kernel_swi_regs new, *user_regs = USER_REGS(r);
     int coord[6];
     Object *obj = (Object *) r->r[2];
     IGNORE(t);

     if (class == DCS_ObjectClass && (user_regs->r[2] ==0)) {
     /* show DCS as default, ie. close to pointer */
        new = *user_regs;
        r->r[4] = (int) &new;
        _swix(Wimp_GetPointerInfo, _IN(1),&coord);

        coord[0] -= 60;
        coord[1] += 60;

        new.r[2] = Toolbox_ShowObject_TopLeft;
        new.r[3] = (int) &coord;

     }

     if (((class == DCS_ObjectClass ) && (obj->flags & DCS_GenerateAboutToBeShown)) ||
         ((class == Quit_ObjectClass ) && (obj->flags & Quit_GenerateAboutToBeShown))) {

         _kernel_swi_regs regs;
         DCSAboutToBeShownEvent event;
         int size=0;

         regs.r[0] =0;
         regs.r[1] = (int) obj->id;
         regs.r[2] = 0;
         regs.r[3] = (int) &event;

         event.hdr.size = sizeof(event);
         event.hdr.event_code = (class == DCS_ObjectClass ) ? DCS_AboutToBeShown : Quit_AboutToBeShown;
         event.hdr.flags = user_regs->r[0];
         event.r2 = user_regs->r[2];

         if (event.r2 == Toolbox_ShowObject_Default) size = 0;
         else if (event.r2 == Toolbox_ShowObject_TopLeft) size = 8;
         else if (event.r2 == Toolbox_ShowObject_FullSpec) size = sizeof(event.r3);

         memcpy(&event.r3, (void *) (user_regs->r[3]), size);

         return _kernel_swi(Toolbox_RaiseToolboxEvent,&regs,&regs);
     }
     else show_do_show(r,obj);

     return NULL;
}

