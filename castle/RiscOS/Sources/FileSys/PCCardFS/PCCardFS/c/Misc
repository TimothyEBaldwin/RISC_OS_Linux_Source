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
/***  Misc.c                                                                           ***/
/***                                                                                   ***/
/***  Application:   PCCardFS Code Module                                              ***/
/***  Version:       0.001                                                             ***/
/***                                                                                   ***/
/***  By:            Neil Critchell, Acorn Computers Ltd.                              ***/
/***  Date:          25th October 1993                                                 ***/
/***                                                                                   ***/
/***  Purpose:       Contains various misc routines, which are part of the main        ***/
/***                 code.                                                             ***/
/***                                                                                   ***/
/***  History:       0.01 25th October 1993 - Original version                         ***/
/***                                                                                   ***/
/*****************************************************************************************/

/*****************************************************************************************/
/***                                                                                   ***/
/***  Routines:-                                                                       ***/
/***    Initialise_FilingSystem()                                                      ***/
/***    Remove_FilingSystem()                                                          ***/
/***    Boot_CallbackHandler()                                                         ***/
/***    Generate_DiscName()                                                            ***/
/***                                                                                   ***/
/*****************************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "kernel.h"

#include "Defs.h"
#include "Structs.h"
#include "Variables.h"
#include "Misc.h"

#include "Debug.h"



/*****************************************************************************************/
/***                                                                                   ***/
/***  Initialise_FilingSystem()                                                        ***/
/***                                                                                   ***/
/***  This function attempts to initialise this module as an Instance of FileCore, and ***/
/***  thus make the filing system known to the operating system.                       ***/
/***                                                                                   ***/
/***  Performs:                                                                        ***/
/***    1) Call "FileCore_Create" to provide infromation about filing system.          ***/
/***                                                                                   ***/
/***  Return:                                                                          ***/
/***    NULL, Filing System installed.                                                 ***/
/***    ERROR_MASSAGE, pointer to error block, failure in initialising FS.             ***/
/***                                                                                   ***/
/*****************************************************************************************/
_kernel_oserror *Initialise_FilingSystem(void)
    {
    _kernel_swi_regs            reg;

    reg.r[0] = (int) &FS_Header;
    reg.r[1] = Image_Base;
    reg.r[2] = (int) Private_Word;              /* as obtained from module start-up code */
    reg.r[3] = NO_OF_FLOPPIES + (NO_OF_HDS << 8) + (DEFAULT_DRIVE << 16);
    reg.r[4] = 1024;                            /* suggested size of directory cache     */
    reg.r[5] = 0;                               /* No background transfers               */
    reg.r[6] = 4;                               /* ¿Que?                                 */

    if (_kernel_swi(FileCore_Create, &reg, &reg) == NULL)
        PCCardFS_InstancePrivateWord = reg.r[0];
    else {
        #if Debug == TRUE
            DebugMessage("cK", "   *****     PCCardFS filing system can not be initialised.    *****\n");
        #endif
    }

    return(NULL);
}



/*****************************************************************************************/
/***                                                                                   ***/
/***  Remove_FilingSystem()                                                            ***/
/***                                                                                   ***/
/***  This function attempts remove the filing system from FileCore.                   ***/
/***                                                                                   ***/
/***  Performs:                                                                        ***/
/***    1) Call "OS_FSControl" to provide to remove specific filing system.            ***/
/***                                                                                   ***/
/***  Return:                                                                          ***/
/***    NULL, Filing System installed.                                                 ***/
/***    ERROR_MASSAGE, pointer to error block, failure in initialising FS.             ***/
/***                                                                                   ***/
/*****************************************************************************************/
void Remove_FilingSystem(void)
    {
    _kernel_swi_regs            reg;

    reg.r[0] = DELETE;
    reg.r[1] = (int) FILECORE__FILING_SYSTEM_NAME;

    if (_kernel_swi(OS_Module, &reg, &reg) != NULL) {
        #if Debug == TRUE
            DebugMessage("cK", "Can not remove FS");
        #endif
    }
}



/*****************************************************************************************/
/***                                                                                   ***/
/***  Boot_CallbackHandler()                                                           ***/
/***                                                                                   ***/
/***  Executes the !Boot file on a driver partition via *Run                           ***/
/***                                                                                   ***/
/***  Return Value:                                                                    ***/
/***    None.                                                                          ***/
/***                                                                                   ***/
/*****************************************************************************************/
int Boot_CallbackHandler(_kernel_swi_regs *regs, void *pw)
    {
    _kernel_swi_regs    callregs;

    callregs.r[0] = (int)BootRunString;

    _kernel_swi(OS_CLI, &callregs, &callregs); /** give it a shove **/

    return(1);
}



/*****************************************************************************************/
/***                                                                                   ***/
/***  Generate_DiscName()                                                              ***/
/***                                                                                   ***/
/***  Generates an unique disc id, based upon the current date & time, into the string ***/
/***  which is passed in as a parameter. The disc name generated is in the form:       ***/
/***  HHMMSS_DAY.                                                                      ***/
/***                                                                                   ***/
/***  Return Value:                                                                    ***/
/***    None.                                                                          ***/
/***                                                                                   ***/
/*****************************************************************************************/
void Generate_DiscName(char *string)
    {
    struct tm   *timeptr;
    time_t       timenow;
    char         format[12] = "%H%M%S_%a\0";

    time(&timenow);
    timeptr = localtime(&timenow);
    strftime(string, 10, format, timeptr);

    #if Debug == TRUE
        DebugMessage("cK", "Generate_DiscName returns the string %s\n", string);
    #endif
}
