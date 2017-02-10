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
/***  Swi.h                                                                            ***/
/***                                                                                   ***/
/***  Application:   PCCardFS Module                                                   ***/
/***  Version:       0.01                                                              ***/
/***                                                                                   ***/
/***  By:            Neil Critchell, Acorn Computers Ltd.                              ***/
/***  Date:          25th October 1993                                                 ***/
/***                                                                                   ***/
/***  Purpose:       Contains definitions for the Swi.c code module.                   ***/
/***                                                                                   ***/
/***  History:       0.01 25th October 1993 - Original version                         ***/
/***                                                                                   ***/
/*****************************************************************************************/

/*****************************************************************************************/
/***                                                                                   ***/
/***   SWI definitions                                                                 ***/
/***                                                                                   ***/
/*****************************************************************************************/
#define  SWI__PCCARDFS__DISCOP                          0
         #define  DISCOP__VERIFY                                0
         #define  DISCOP__READSEC                               1
         #define  DISCOP__WRITESEC                              2
         #define  DISCOP__SEEK                                  5
         #define  DISCOP__RESTORE                               6
#define  SWI__PCCARDFS__VERSION                         1
#define  SWI__PCCARDFS__DRIVES                          2
#define  SWI__PCCARDFS__FREESPACE                       3

#define  SWI__PCCARDFS__DESCRIBEDISC                    5

#define  SWI__PCCARDFS__MISCOP                          9
         #define  MISCOP__MOUNT                                 0
         #define  MISCOP__POLLCHANGED                           1
         #define  MISCOP__LOCKDRIVE                             2
         #define  MISCOP__UNLOCKDRIVE                           3



/*****************************************************************************************/
/***                                                                                   ***/
/***   Function definitions                                                            ***/
/***                                                                                   ***/
/*****************************************************************************************/
_kernel_oserror                *PCCardFS_SwiHandler(int, _kernel_swi_regs *, void *);

PCCardFS_ErrorCode              SWI__PCCardFS_Version(_kernel_swi_regs *);
PCCardFS_ErrorCode              SWI__PCCardFS_DiscOp(_kernel_swi_regs *);
PCCardFS_ErrorCode              SWI__PCCardFS_Drives(_kernel_swi_regs *);
PCCardFS_ErrorCode              SWI__PCCardFS_DescribeDisc(_kernel_swi_regs *);
PCCardFS_ErrorCode              SWI__PCCardFS_FreeSpace(_kernel_swi_regs *);
