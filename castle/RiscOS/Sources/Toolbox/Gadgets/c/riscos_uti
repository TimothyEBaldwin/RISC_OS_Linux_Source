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
/* Copyright (C) Acorn Computers Ltd 1994 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"
#include "swis.h"

#include "twimp.h"
#include "riscos_uti.h"

/* return contents of address, that may not be word aligned */
static char obj__name[16];

char *object_name(ObjectID id)
{
    if (_swix(Toolbox_GetTemplateName, _INR(0,3),
              0, id, obj__name, sizeof(obj__name)) != NULL) return NULL;

    return obj__name;
}

int is_object(ObjectID id,char *name)
{
    if (_swix(Toolbox_GetTemplateName, _INR(0,3),
              0, id, obj__name, sizeof(obj__name)) != NULL) return 1;

    return strcmp(obj__name, name);
}
