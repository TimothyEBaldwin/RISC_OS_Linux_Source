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
/* Title:   globals.c
 * Purpose: global variables for the Iconbar module
 * Author:  IDJ
 * History: 16-Sep-93: IDJ: created
 *
 */


#include "const.h"
#include "macros.h"
#include "debug.h"
#include "mem.h"
#include "messages.h"
#include "twimp.h"

#include "objects/toolbox.h"
#include "objects/iconbar.h"

#include "globals.h"


EventInterest   messages_of_interest[] =
                {{wimp_MHELP_REQUEST , 0},
                 {-1                 , -1}
                };

EventInterest   events_of_interest[] = 
                {{wimp_EBUT          , 0},
                 {-1                 , -1}
                };

EventInterest   toolbox_events_of_interest[] = 
                {{Iconbar_SelectAboutToBeShown,  Iconbar_ObjectClass},
                 {Iconbar_AdjustAboutToBeShown,  Iconbar_ObjectClass},
                 {                          -1,                   -1}
                };



