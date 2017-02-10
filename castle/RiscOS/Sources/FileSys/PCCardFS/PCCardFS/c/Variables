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
/***  Variables.c                                                                      ***/
/***                                                                                   ***/
/***  Application:   PCCardFS Module                                                   ***/
/***  Version:       0.01                                                              ***/
/***                                                                                   ***/
/***  By:            Neil Critchell, Acorn Computers Ltd.                              ***/
/***  Date:          25th October 1993                                                 ***/
/***                                                                                   ***/
/***  Purpose:       Contains external variables used throughout this module.          ***/
/***                                                                                   ***/
/***  History:       0.01 25th October 1993 - Original version                         ***/
/***                                                                                   ***/
/*****************************************************************************************/
#include <stdio.h>
#include "kernel.h"

#include "Defs.h"
#include "Structs.h"


/*****************************************************************************************/
/***                                                                                   ***/
/***    Module initialisation variables                                                ***/
/***                                                                                   ***/
/*****************************************************************************************/
int                             Resources_Loaded = FALSE;
int                             Message_FileDescriptor[4];
_kernel_oserror                 KernErrorBlock;
MEMORY_PTR                      Claimed_Messages;
int                             Claimed_Messages_Size = 0;

void                           *Private_Word;



/*****************************************************************************************/
/***                                                                                   ***/
/***    Filing System specific variables                                               ***/
/***                                                                                   ***/
/*****************************************************************************************/
FS_HEADER                       FS_Header;
int                             PCCardFS_InstancePrivateWord;
unsigned int                    Sequence[MAX_DRIVES];
int                             Emptyness;

char                            BootRunString[24];


/*****************************************************************************************/
/***                                                                                   ***/
/***    Misc variables                                                                 ***/
/***                                                                                   ***/
/*****************************************************************************************/
int                             Rand_Number;
int                             FileCoreError;


/*****************************************************************************************/
/***                                                                                   ***/
/***   Memory Workspace Locations                                                      ***/
/***                                                                                   ***/
/*****************************************************************************************/
MEMORY_PTR                      Workspace = NULL;


