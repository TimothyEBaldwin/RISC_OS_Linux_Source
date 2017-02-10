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
/***  Services.h                                                                       ***/
/***                                                                                   ***/
/***  Application:   PCCardFS Code Module                                              ***/
/***  Version:       0.01                                                              ***/
/***                                                                                   ***/
/***  By:            Neil Critchell, Acorn Computers Ltd.                              ***/
/***  Date:          25th October 1993                                                 ***/
/***                                                                                   ***/
/***  Purpose:       Contains definitions for the Srevices.c code module.              ***/
/***                                                                                   ***/
/***  History:       0.01 25th October 1993 - Original version                         ***/
/***                                                                                   ***/
/*****************************************************************************************/

/*****************************************************************************************/
/***                                                                                   ***/
/***   Service call definitions                                                        ***/
/***                                                                                   ***/
/*****************************************************************************************/
#define  SERVICE__RESOURCEFS_STARTED            0x59

#define  SERVICE__PCMCIA                        0x9C
#define  __SVC__MANAGER_STARTED                 0x01
#define  __SVC__MANAGER_FINISHED                0x02
#define  __SVC__HARDWARE_STARTED                0x03
#define  __SVC__HARDWARE_FINISHED               0x04
#define  __SVC__PCCARD_STARTED                  0x05
#define  __SVC__PCCARD_FINISHED                 0x06
#define  __SVC__SLOT_CHANGED                    0x07


/*****************************************************************************************/
/***                                                                                   ***/
/***   Function definitions                                                            ***/
/***                                                                                   ***/
/*****************************************************************************************/
void            PCCardFS_ServiceHandler(int, _kernel_swi_regs *, void *);
