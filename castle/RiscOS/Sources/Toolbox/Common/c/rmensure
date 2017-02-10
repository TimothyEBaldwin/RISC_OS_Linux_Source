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
/* File:    rmensure.c
 * Purpose: ensuring a module is loaded
 * Author:  IDJ
 * History: 24-Jun-94: IDJ: created
 *          02-Dec-96: KJB: modified ROM conditional - RAM modules still need
 *                          to use rmensure in TinyStubs
 */


#include <stdio.h>
#include "kernel.h"
#include "swis.h"

#include "rmensure.h"
#include "macros.h"

_kernel_oserror *rmensure (char *module_name, char *file_name, char *module_version)
{
#if defined(ROM) && !defined(BUILDING_TINYSTUBS)
    IGNORE(module_area);
    IGNORE(file_name);
    IGNORE(module_version);

    return NULL;
#else
    _kernel_oserror *e;
    char command[256];

    /*
     * see if the module is there at all!
     */

    sprintf (command, "RMEnsure %s %s RMLoad System:Modules.%s", module_name,
                                module_version, file_name);

    if ((e = _swix (OS_CLI, _IN(0), command)) != NULL)
        return e;

    sprintf (command, "RMEnsure %s %s", module_name, module_version);

    return _swix (OS_CLI, _IN(0), command);
#endif
}
