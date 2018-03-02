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
/* Title:   event.c
 * Purpose: event dispatching
 * Author:  IDJ
 * History: 19-Jun-94: IDJ: created
 *          01-Apr-97: KJB/ADH: added call to deregister all handlers for a given object ID
 *          10-Dec-97: EPW: added event_dispatch, so the app can call Wimp_Poll directly, then later dispatch the event
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"

#include "debug.h"

#include "types.h"

#include "event.h"

#include "wimpevent.h"
#include "tbevent.h"
#include "wimpmsg.h"


static IdBlock     *event__id_block = NULL;
static unsigned int event__mask     = Wimp_Poll_NullMask;

/* ------------------------------------- dispatching events ------------------------------------ */

static _kernel_oserror *dispatch (int event_code, WimpPollBlock *poll_block, IdBlock *id_block)
{
    if (event_code == 0x200)
        return tbevent_dispatch (poll_block, id_block);
    else if (event_code == Wimp_EUserMessage || event_code == Wimp_EUserMessageRecorded)
        return wimpmsg_dispatch (poll_block, id_block);
    else
        return wimpevent_dispatch (event_code, poll_block, id_block);
}


_kernel_oserror *event_dispatch (int event_code, WimpPollBlock *poll_block)
{
    /* Allow an app to dispatch an event after a wimp_poll manually.
     * This is mainly required by Java, but could be applicable to
     * other apps...
     */
    return dispatch(event_code, poll_block, event__id_block);
}


extern _kernel_oserror *event_poll (int *event_code, WimpPollBlock *poll_block, void *poll_word)
{
    /*
     * poll the wimp, and pass the event to the dispatcher
     */

    _kernel_swi_regs regs;
    _kernel_oserror *e;
    WimpPollBlock temp_block;

    if (!poll_block) poll_block = &temp_block;

    regs.r[0] = (int)event__mask;
    regs.r[1] = (int)poll_block;
    regs.r[3] = (int)poll_word;

    if ((e = _kernel_swi (Wimp_Poll, &regs, &regs)) != NULL)
        return e;

    if (event_code) *event_code = regs.r[0];

    e = dispatch (regs.r[0], poll_block, event__id_block);

    return e;
}


extern _kernel_oserror *event_poll_idle (int *event_code, WimpPollBlock *poll_block, unsigned int earliest, void *poll_word)
{
    /*
     * poll the wimp, and pass the event to the dispatcher
     */
    _kernel_swi_regs regs;
    _kernel_oserror *e;
    WimpPollBlock temp_block;

    if (!poll_block) poll_block = &temp_block;

    regs.r[0] = (int)event__mask;
    regs.r[1] = (int)poll_block;
    regs.r[2] = (int)earliest;
    regs.r[3] = (int)poll_word;

    if ((e = _kernel_swi (Wimp_PollIdle, &regs, &regs)) != NULL)
        return e;

    if (event_code) *event_code = regs.r[0];

    e = dispatch (regs.r[0], poll_block, event__id_block);

    return e;
}



/* ------------------------------------- registering/deregistering handlers ----------------------- */


/* wimp events */


_kernel_oserror *event_register_wimp_handler (int object_id, int event_code, WimpEventHandler handler, void *handle)
{
    return wimpevent_register_wimp_handler (object_id, event_code, handler, handle);
}

_kernel_oserror *event_deregister_wimp_handler (int object_id, int event_code, WimpEventHandler handler, void *handle)
{
    return wimpevent_deregister_wimp_handler (object_id, event_code, handler, handle);
}

_kernel_oserror *event_deregister_wimp_handlers_for_object (int object_id)
{
    return wimpevent_deregister_wimp_handlers_for_object(object_id);
}


/* toolbox events */

_kernel_oserror *event_register_toolbox_handler (int object_id, int event_code, ToolboxEventHandler handler, void *handle)
{
    return tbevent_register_toolbox_handler (object_id, event_code, handler, handle);
}


_kernel_oserror *event_deregister_toolbox_handler (int object_id, int event_code, ToolboxEventHandler handler, void *handle)
{
    return tbevent_deregister_toolbox_handler (object_id, event_code, handler, handle);
}

_kernel_oserror *event_deregister_toolbox_handlers_for_object (int object_id)
{
    return tbevent_deregister_toolbox_handlers_for_object(object_id);
}


/* wimp messages */

_kernel_oserror *event_register_message_handler (int msg_no, WimpMessageHandler handler, void *handle)
{
    return wimpmsg_register_message_handler (msg_no, handler, handle);
}


_kernel_oserror *event_deregister_message_handler (int msg_no, WimpMessageHandler handler, void *handle)
{
    return wimpmsg_deregister_message_handler (msg_no, handler, handle);
}



/* ------------------------------------- getting/setting poll mask -------------------------------- */

extern _kernel_oserror *event_set_mask (unsigned int mask)
{
    event__mask = mask;
    return NULL;
}

extern _kernel_oserror *event_get_mask (unsigned int *mask)
{
    if (mask != NULL)
        *mask = event__mask;
    return NULL;
}


/* ------------------------------------ initialisation/finalisation ----------------------------- */


extern _kernel_oserror *event_initialise (IdBlock *b)
{
    DEBUG debug_output ("event_initialise", "Initialising event system\n");

    if (b != NULL)
        event__id_block = b;

    return NULL;
}

extern _kernel_oserror *event_finalise (void)
{
    _kernel_oserror *e;

    e = wimpevent_finalise();
    if (e != NULL)
    {
        return e;
    }

    e = tbevent_finalise();
    if (e != NULL)
    {
        return e;
    }

    e = wimpmsg_finalise();
    if (e != NULL)
    {
        return e;
    }

    event__id_block = NULL;
    event__mask = Wimp_Poll_NullMask;

    return NULL;
}

