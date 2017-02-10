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
/***  Structs.h                                                                        ***/
/***                                                                                   ***/
/***  Application:   PCCardFS Module                                                   ***/
/***  Version:       0.01                                                              ***/
/***                                                                                   ***/
/***  By:            Neil Critchell, Acorn Computers Ltd.                              ***/
/***  Date:          25th October 1993                                                 ***/
/***                                                                                   ***/
/***  Purpose:       Contains the 'C' structre definitions used throughout the         ***/
/***                 SCSI Driver moudles code.                                         ***/
/***                                                                                   ***/
/***  History:       0.01 25th October 1993 - Original version                         ***/
/***                                                                                   ***/
/*****************************************************************************************/

/*****************************************************************************************/
/***                                                                                   ***/
/***   Memory Pointer Definitions                                                      ***/
/***                                                                                   ***/
/*****************************************************************************************/
#define  MEMORY_PTR                     char *
#define  MEMORY_PTR__INT                int *



/*****************************************************************************************/
/***                                                                                   ***/
/***   Error Information Definitions                                                   ***/
/***                                                                                   ***/
/*****************************************************************************************/
#define  PCCardFS_ErrorCode         int

typedef struct
         {
         int                            ErrorNumber;
         char                           ErrorMessage[128];
         } ERROR_MESSAGE;



/*****************************************************************************************/
/***                                                                                   ***/
/***   Filing System Header                                                            ***/
/***                                                                                   ***/
/*****************************************************************************************/
typedef struct
         {
         int                            Flags_and_FS_Number;
         int                            Title;
         int                            Boot_Text;
         int                            DiscOp_Routines;
         int                            MiscOp_Routines;
         } FS_HEADER;
