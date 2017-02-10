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
/***  Error.h                                                                          ***/
/***                                                                                   ***/
/***  Application:   PCCardFS                                                          ***/
/***  Version:       0.01                                                              ***/
/***                                                                                   ***/
/***  By:            Neil Critchell, Acorn Computers Ltd.                              ***/
/***  Date:          22nd July 1993                                                    ***/
/***                                                                                   ***/
/***  Purpose:       Contains definitions for the Error.c code module.                 ***/
/***                 And the error code definitions.                                   ***/
/***                                                                                   ***/
/***  History:       0.01 22nd July 1993 - Original version                            ***/
/***                                                                                   ***/
/***                                                                                   ***/
/*****************************************************************************************/

/*****************************************************************************************/
/***                                                                                   ***/
/***   Error Code Definitions                                                          ***/
/***                                                                                   ***/
/*****************************************************************************************/
#define  ERROR_BASE                                     0x808B00
#define  NO_ERROR                                       0xFFFFFFFF

#define  ERROR__NO_RMA                                  0x00
#define  ERROR__MESSAGE_TRANS                           0x01
#define  ERROR__NOT_READY                               0x02
#define  ERROR__SWI_UNKNOWN                             0x03

#define  ERROR__FILECORE_ERROR                          0x19
#define  HIGHEST_ERROR_NUMBER                           0x20

#define  ERROR_MESSAGE_TOKEN_STRING                     "ERR%02d:"


/*****************************************************************************************/
/***                                                                                   ***/
/***   FileCore Error Code Definitions                                                 ***/
/***                                                                                   ***/
/*****************************************************************************************/
#define  ERROR__FILECORE__DRIVE_UNKNOWN                 0xAC
#define  ERROR__FILECORE__DISC_PROTECTED                0xC9
#define  ERROR__FILECORE__DRIVE_EMPTY                   0xD3
#define  ERROR__FILECORE__DISC_NOT_PRESENT              0xD5


/*****************************************************************************************/
/***                                                                                   ***/
/***   Function definitions                                                            ***/
/***                                                                                   ***/
/*****************************************************************************************/
_kernel_oserror        *SetError(PCCardFS_ErrorCode);
