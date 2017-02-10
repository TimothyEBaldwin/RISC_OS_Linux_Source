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
/*****************************************************************************************/
/***                                                                                   ***/
/***  Services.c                                                                       ***/
/***                                                                                   ***/
/***  Application:   PCCardFS Module                                                   ***/
/***  Version:       0.01                                                              ***/
/***                                                                                   ***/
/***  By:            Neil Critchell, Acorn Computers Ltd.                              ***/
/***  Date:          25th October 1993                                                 ***/
/***                                                                                   ***/
/***  Purpose:       Contains the code to handle various system Services Calls.        ***/
/***                                                                                   ***/
/***  History:       0.01 25th October 1993 - Original version                         ***/
/***                                                                                   ***/
/*****************************************************************************************/

/*****************************************************************************************/
/***                                                                                   ***/
/***  Routines:-                                                                       ***/
/***    PCMCIASupCode_ServiceHandler()                                                 ***/
/***                                                                                   ***/
/*****************************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"

#include "Defs.h"
#include "Misc.h"
#include "Structs.h"
#include "Variables.h"
#include "Services.h"
#include "Resources.h"

#include "Debug.h"



/*****************************************************************************************/
/***                                                                                   ***/
/***  PCCardFS_ServiceHandler(service, registers, pw)                                  ***/
/***                                                                                   ***/
/***  This routine is the service calls entry point, each claimed service will pass    ***/
/***  through here, when the Service is issued. This routine then dispatches to the    ***/
/***  relevant routines.                                                               ***/
/***                                                                                   ***/
/***  Return:                                                                          ***/
/***    NULL pointer, if installed succesfully.                                        ***/
/***    ErrorBlock, if an error occured.                                               ***/
/***                                                                                   ***/
/*****************************************************************************************/
void PCCardFS_ServiceHandler(int service, _kernel_swi_regs *registers, void *pw)
    {
    _kernel_oserror            *error = NULL;
    _kernel_swi_regs            regs;

    switch(service) {
        case SERVICE__RESOURCEFS_STARTED:
            #if Debug == TRUE
                DebugMessage("cK", "service call &%X \"ResourceFS Started\".\n\n", service);
            #endif
            error = InitialiseResources();
            break;

        case SERVICE__PCMCIA:
            #if Debug == TRUE
                DebugMessage("cK", "Erk! Svc call PCMCIA seen\n");
            #endif
            if(registers ->r[0] == __SVC__SLOT_CHANGED) {
                #if Debug == TRUE
                    DebugMessage("cK", "Wooeee! it's a Slot Changed message an'all\n");
                #endif
                Sequence[registers->r[2]]++;
                strcpy(BootRunString, "Run PCCardFS::X.$.!Boot");
                BootRunString[14] = (registers->r[2] + 48); /** Cnv num -> ASCII **/

                /** Erk! Best check the card is incoming & not outgoing!!! **/
                regs.r[0] = 0;
                regs.r[1] = registers ->r[2];
                if(_kernel_swi(PCMCIA_FSOp, &regs, &regs) == NULL) {
                    if((regs.r[2] == PARTITION_STATUS__DRIVER) || (regs.r[2] == PARTITION_STATUS__DRIVERATTR)) {
                        #if Debug == TRUE
                            DebugMessage("cK", "String being passed to OS_CLI is %s\n",BootRunString);
                        #endif
                        regs.r[0] = (int)Boot_Callback;
                        regs.r[1] = (int)Private_Word;
                        _kernel_swi(OS_AddCallBack, &regs, &regs);
                    }
                }
            }
            break;

        default:
            #if Debug == TRUE
                DebugMessage("cK", "Bah, it's an unknown service call :-(\n");
            #endif
            break;
    }
}
