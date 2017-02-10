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
/*
 * Title:     txtopt.c
 * Purpose:   setting/reading option name
 * Author:    IDJ
 * History:
 *   21-Feb-90: IDJ: Created
 *   08-May-91: ECN: #ifndefed out unused ROM functions
 */

#include <stdlib.h>
#include <string.h>


#include "msgs.h"
#include "werr.h"
#include "txtopt.h"
#include "VerIntern/messages.h"

#ifndef TRUE
#define TRUE 1
#endif

static char *txtopt__option_name = "Edit";

#ifndef UROM
void txtopt_set_name(char *name)
{
    if ((txtopt__option_name = malloc(strlen(name)+1)) == 0)
        werr(TRUE, msgs_lookup(MSGS_txtopt1));
    strcpy(txtopt__option_name, name);
}
#endif

char *txtopt_get_name(void)
{
    return txtopt__option_name;
}

