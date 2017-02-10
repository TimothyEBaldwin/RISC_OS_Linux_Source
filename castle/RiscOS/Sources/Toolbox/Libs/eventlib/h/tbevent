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
/* Title:   tbevent.c
 * Purpose: dispatching toolbox events.
 * Author:  IDJ
 * History: 19-Jun-94: IDJ: created
 *          01-Apr-97: KJB/ADH: added call to deregister all handlers for a given object ID
 *          18-Feb-02: BJGA: added finalisation
 *
 */


#ifndef __tbevent_h
#define __tbevent_h

#ifndef __wimp_h
#include "wimp.h"
#endif

#ifndef __toolbox_h
#include "toolbox.h"
#endif

#ifndef __event_h
#include "event.h"
#endif

/* ------------------------------------ dispatching toolbox events -------------------------------- */

extern _kernel_oserror *tbevent_dispatch (WimpPollBlock *poll_block, IdBlock *id_block);



/* -------------------------- registering handlers for toolbox events ------------------------------ */

extern _kernel_oserror *tbevent_register_toolbox_handler (int object_id, int event_code, ToolboxEventHandler *handler, void *handle);



/* --------------------------- deregistering toolbox event handlers --------------------------------- */

extern _kernel_oserror *tbevent_deregister_toolbox_handler (int object_id, int event_code, ToolboxEventHandler *handler, void *handle);
extern _kernel_oserror *tbevent_deregister_toolbox_handlers_for_object (int object_id);


/* --------------------------------------------- finalisation -------------------------------------- */

extern _kernel_oserror *tbevent_finalise (void);

#endif
