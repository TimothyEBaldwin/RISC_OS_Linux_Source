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
 * Purpose: global variables for the Window module
 * Author:  IDJ
 * History: 17-Jan-94: IDJ: created
 *
 */


#include "const.h"
#include "macros.h"
#include "debug.h"
#include "mem.h"
#include "string32.h"
#include "messages.h"

#include "objects/toolbox.h"
#include "objects/window.h"
#include "objects/menu.h"

#include "globals.h"

#include "kernel.h"


EventInterest   messages_of_interest[] =
                {{wimp_MHELP_REQUEST ,  0},
                 {wimp_MMENU_WARNING ,  0},
                 {wimp_MMENUS_DELETED,  0},
                 {-1                 , -1}
                };

EventInterest   events_of_interest[] = 
                {{wimp_EREDRAW        ,  0},
                 {wimp_EOPEN          ,  0},
                 {wimp_ECLOSE         ,  0},
                 {wimp_EPTR_LEAVE     ,  0},
                 {wimp_EPTR_ENTER     ,  0},
                 {wimp_EBUT           ,  0},
                 {wimp_EKEY           ,  0},
                 {wimp_EUSER_DRAG      ,  0},
                 {wimp_ESCROLL        ,  0},
                 {wimp_ELOSE_CARET    ,  0},
                 {wimp_EGAIN_CARET    ,  0},
                 {wimp_ESEND          ,  0},
                 {wimp_ESEND_WANT_ACK ,  0},
                 {-1                 ,  -1}
                };

EventInterest   toolbox_events_of_interest[] = 
                {{Window_AboutToBeShown       ,   Window_ObjectClass}, 
                 {Adjuster_Clicked            ,   Window_ObjectClass}, 
                 {Slider_ValueChanged         ,   Window_ObjectClass}, 
                 {WritableField_ValueChanged  ,   Window_ObjectClass}, 
                 {PopUp_AboutToBeShown        ,   Window_ObjectClass},
                 {StringSet_AboutToBeShown    ,   Window_ObjectClass},
                 {Menu_Selection              ,   Menu_ObjectClass},

                 {                          -1,                   -1}
                };



