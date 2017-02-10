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
/* File:    event.c
 * Purpose: Generating Toolbox Events
 * Author:  Ian Johnson
 * History: 22-Sep-93: IDJ:   created
 *
 */


#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"
#include "swis.h"

#include "const.h"
#include "macros.h"
#include "debug.h"
#include "mem.h"
#include "twimp.h"
#include "messages.h"
#include "objects/toolbox.h"

#include "globals.h"

#include "task.h"

#include "event.h"


extern _kernel_oserror *event_raise_toolbox_event (_kernel_swi_regs *r)
{

    /*
     *    Entry:
     *           R0  =  flags
     *           R1  =  Object ID
     *           R2  =  Component ID
     *           R3  -> Toolbox Event block (as defined above)
     *     Exit:
     *           R1-R9 preserved
     *
     */

    wimp_Message     msg;
    ToolboxEvent    *event = (ToolboxEvent *)r->r[3];
    _kernel_oserror *e;
    _kernel_swi_regs regs;

    /*
     * We actually send ourselves a Wimp message (for which we always register interest)
     * containing the details of the Toolbox event.  This gets seen by the postfilter
     * which turns it into a Toolbox_Event event.
     * Note: the unique reference number for the Toolbox Event is in fact the Wimp
     * message reference (guaranteed unique)
     *
     */

    DEBUG mem_chk(r, CHECK_NONZERO);
    DEBUG debug_output ("raise", "T:Raise Toolbox Event R1 (0x%x) R2 (0x%x) event code 0x%x\n", r->r[1], r->r[2], event->hdr.event_code);


    msg.hdr.size = (offsetof(wimp_Message, data.toolbox_event_msg.event) + event->hdr.size + 3) &~ 3;
    msg.hdr.your_ref = 0;                          /* originator */
    msg.hdr.action = wimp_MTOOLBOX_EVENT;           /* unseen by client */
    msg.data.toolbox_event_msg.self = (ObjectID)r->r[1];
    msg.data.toolbox_event_msg.component = r->r[2];
    memcpy (&msg.data.toolbox_event_msg.event, event,
            MIN(event->hdr.size, sizeof msg.data.toolbox_event_msg.event));
    if (msg.hdr.size > sizeof msg) msg.hdr.size = sizeof msg;

    DEBUG debug_output ("raise", "T:Event size %d (0x%x)\n", event->hdr.size, event->hdr.size);

    regs.r[0] = wimp_ESEND;
    regs.r[1] = (int)&msg;
    regs.r[2] = task->info.wimp_handle;   /* send to self */

    if ((e = _kernel_swi (Wimp_SendMessage, &regs, &regs)) != NULL)
        return e;

    DEBUG debug_output ("raise", "T:Wimp message sent - my_ref 0x%x", msg.hdr.my_ref);

    return NULL;
}

