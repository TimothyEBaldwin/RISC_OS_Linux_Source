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
#ifndef main_H
#define main_H

/*main.h - header file for BootCommands*/

/*From OSLib*/
#ifndef os_H
   #include "os.h"
#endif

/*Some SWIs*/
#ifndef OS_NVMemory /* Not yet in OSLib */
#define OS_NVMemory      (0x000076)
#endif
#ifndef BootFX_BarUpdate /* Avoid import export circles */
#define BootFX_BarUpdate (0x059140)
#endif

/*Command numbers*/
#define main_ADD_APP       0
#define main_APP_SIZE      1
#define main_DO            2
#define main_IF_THERE      3
#define main_LOAD_CMOS     4
#define main_SAVE_CMOS     5
#define main_REPEAT        6
#define main_SAFE_LOGON    7
#define main_FREE_POOL     8
#define main_SHRINK_RMA    9
#define main_ADD_TO_RMA    10
#define main_APP_SLOT      11
#define main_X             12
#define main_COMMAND_COUNT 13

#define X_ENVVAR           "X$Error"
#define RES_APP_PATH       "Resources:$.Apps"
#define INITIALENTRYCOUNT  128 /* Initial number of REPEAT entries */ 
#define CMOSxseed          1

extern _kernel_oserror *main_initialise (char *, int, void *);

extern _kernel_oserror *main_terminate (bool, int, void *);

extern _kernel_oserror *main_command (const char *, int, int, void *);

#endif
