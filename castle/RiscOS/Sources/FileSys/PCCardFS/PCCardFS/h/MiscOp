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
/***  MiscOp.h                                                                         ***/
/***                                                                                   ***/
/***  Application:   PCCardFS Module                                                   ***/
/***  Version:       0.01                                                              ***/
/***                                                                                   ***/
/***  By:            Neil Critchell, Acorn Computers Ltd.                              ***/
/***  Date:          25th October 1993                                                 ***/
/***                                                                                   ***/
/***  Purpose:       Contains definitions for the MiscOp.c code module.                ***/
/***                                                                                   ***/
/***  History:       0.01 25th October 1993 - Original version                         ***/
/***                                                                                   ***/
/*****************************************************************************************/

/*****************************************************************************************/
/***                                                                                   ***/
/***   MiscOp definitions                                                              ***/
/***                                                                                   ***/
/*****************************************************************************************/
#define  MISCOP__MOUNT                  0
#define  MISCOP__POLL_CHANGED           1
#define  MISCOP__LOCK                   2
#define  MISCOP__UNLOCK                 3

#define  LOG_SECTOR_SIZE__DR_OFFSET     0
#define  SECTORS_PER_TRACK__DR_OFFSET   1
#define  HEADS__DR_OFFSET               2
#define  DENSITY__DR_OFFSET             3
#define  LOW_SECTOR__DR_OFFSET          8
#define  ROOT_DIR__DR_OFFSET            12
#define  DISC_SIZE__DR_OFFSET           16

/*****************************************************************************************/
/***                                                                                   ***/
/***   Function definitions                                                            ***/
/***                                                                                   ***/
/*****************************************************************************************/
int                     PCCardFS_MiscOp(_kernel_swi_regs *);

int                     MiscOp__Mount(_kernel_swi_regs *);
void                    MiscOp__PollChanged(_kernel_swi_regs *);
void                    MiscOp__Lock(_kernel_swi_regs *);
void                    MiscOp__UnLock(_kernel_swi_regs *);
