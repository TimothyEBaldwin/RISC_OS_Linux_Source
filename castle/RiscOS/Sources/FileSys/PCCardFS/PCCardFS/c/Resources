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
/***  Resources.c                                                                      ***/
/***                                                                                   ***/
/***  Application:   PCMCIA_Drv Module                                                 ***/
/***  Version:       0.01                                                              ***/
/***                                                                                   ***/
/***  By:            Neil Critchell, Acorn Computers Ltd.                              ***/
/***  Date:          15th July 1993                                                    ***/
/***                                                                                   ***/
/***  Purpose:       Contains all the code manupulate the resource data.               ***/
/***                                                                                   ***/
/***  History:       0.01 28th June 1993 - Original version                            ***/
/***                                                                                   ***/
/*****************************************************************************************/

/*****************************************************************************************/
/***                                                                                   ***/
/***  Routines:-                                                                       ***/
/***    InitialiseResources()                                                          ***/
/***                                                                                   ***/
/*****************************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"

#include "Defs.h"
#include "Structs.h"
#include "Resources.h"
#include "error.h"
#include "variables.h"

#include "Debug.h"


/*****************************************************************************************/
/***                                                                                   ***/
/***  Static variables defined for this code module.                                   ***/
/***                                                                                   ***/
/*****************************************************************************************/
static char             Messages[] = "Resources:$.Resources.PCCardFS.Messages";


/*****************************************************************************************/
/***                                                                                   ***/
/***  InitialiseResources()                                                            ***/
/***                                                                                   ***/
/***  Attempts to open the Message's resource file and create the error table. If the  ***/
/***  file can not be located, then no error is returned, however the rest of the      ***/
/***  driver will not be allowed to function.                                          ***/
/***                                                                                   ***/
/***    1) Obtain path variable to use.                                                ***/
/***    2) Attempt to open the file.                                                   ***/
/***    3) Allocate memory, and create error messages.                                 ***/
/***    4) Enable driver functionality.                                                ***/
/***                                                                                   ***/
/***  Return:                                                                          ***/
/***    NO_ERROR, if no error occured.                                                 ***/
/***    ErrorCode, if an error occured (ie no more memory etc).                        ***/
/***                                                                                   ***/
/*****************************************************************************************/
_kernel_oserror *InitialiseResources(void)
    {
    _kernel_swi_regs            callregs;


    #if Debug == TRUE
        DebugMessage("cK", "Initialise Resources called\n");
    #endif

    /*************************************************************************************/
    /***  First of all, check that the messages file is resident in memory.            ***/
    /*************************************************************************************/
    callregs.r[1] = (int)Messages;
    if(_kernel_swi(MessageTrans_FileInfo, &callregs, & callregs) != NULL) return((_kernel_oserror *)callregs.r[0]);

    #if Debug == TRUE
        DebugMessage("cK", "Message fileinfo swi returned &%08X and &%08X.\n", callregs.r[0], callregs.r[2]);
    #endif

    if(callregs.r[0] & 1) { /** Yup, the message file is in memory... **/
        /*************************************************************************************/
        /***  Get MessageTrans to open up the message file for us.                         ***/
        /*************************************************************************************/
        callregs.r[0] = (int)Message_FileDescriptor;
        callregs.r[1] = (int)Messages;
        callregs.r[2] = 0;
        if(_kernel_swi(MessageTrans_OpenFile, &callregs, &callregs) != NULL) return((_kernel_oserror *)callregs.r[0]);
        else Resources_Loaded = TRUE; /** Flag that message file is open for bizness **/
    }
    return(NULL);
}
