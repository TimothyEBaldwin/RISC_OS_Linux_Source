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
/* Title:   main.c
 * Purpose: main file of toolaction module
 * Author:  SJM
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "swis.h"

#include "os.h"
#include "resourcefs.h"

#include "ToolActionHdr.h"
#include "messages.h"
#include "objmodule.h"
#include "utils.h"

#include "toolact.h"

#ifndef ROM
extern int Resources(void); /* From resgen */
#endif

#undef  Service_WindowModuleStarting
#define Service_WindowModuleStarting            0x82881
#undef  Service_WindowModuleDying
#define Service_WindowModuleDying               0x82882

/* ++++++++++++++++++++++++++++++++ finalisation code +++++++++++++++++++++++++++++++ */

_kernel_oserror *toolaction_final (int fatal, int podule, void *pw)
{
    _kernel_oserror *e;

    e = messages_file_close();
#ifndef ROM
    if (!e) e = objmodule_deregister_resources(Resources());
#endif

    toolaction_de_register(ToolAction_ToolAction);

    return e;

    NOT_USED(fatal);
    NOT_USED(podule);
    NOT_USED(pw);
}

/* ++++++++++++++++++++++++++++++++ initialisation code +++++++++++++++++++++++++++++++ */

_kernel_oserror *toolaction_init(const char *cmd_tail, int podule_base, void *pw)
{
    os_error *e = NULL;

#ifndef ROM
    e = (os_error *)objmodule_register_resources(Resources());
#endif
    if (!e)
    {
        e = (os_error *)messages_file_open("Resources:$.Resources.ToolAction.Messages");
        if (!e)
        {
            e = toolaction_register(ToolAction_ToolAction);
            if (e) messages_file_close();
        }
#ifndef ROM
        if (e) objmodule_deregister_resources(Resources());
#endif
    }

    return (_kernel_oserror *)e;

    NOT_USED(cmd_tail);
    NOT_USED(podule_base);
    NOT_USED(pw);
}

/* +++++++++++++++++++++++++++++++++ service handler code ++++++++++++++++++++++++++++++ */

void toolaction_services(int service_number, _kernel_swi_regs *r, void *pw)
{
    switch (service_number)
    {
        case Service_WindowModuleStarting:
            toolaction_register(ToolAction_ToolAction);
            break;

#ifndef ROM
        case Service_ResourceFSStarting:
            (*(void (*)(int, void *, void *, void *))r->r[2])(Resources(), 0, 0, (void *)r->r[3]);
            break;
#endif
    }
    NOT_USED(r);
    NOT_USED(pw);
}

/* ++++++++++++++++++++++++++++++++++++++ SWI code +++++++++++++++++++++++++++++++++++++ */

_kernel_oserror *toolaction_SWI_handler(int swi_no, _kernel_swi_regs *r, void *pw)
{
    _kernel_oserror *e;

    switch (swi_no)
    {
        case ToolAction_ToolAction - ToolAction_00:
            e = (_kernel_oserror *)toolaction_swi_handler((os_register_block *)r);
            break;

        default:
            return error_BAD_SWI;
    }

    NOT_USED(pw);
    return e;
}

/* eof main.c */

