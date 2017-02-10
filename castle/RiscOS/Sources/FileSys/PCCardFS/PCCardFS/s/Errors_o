; This source code in this file is licensed to You by Castle Technology
; Limited ("Castle") and its licensors on contractual terms and conditions
; ("Licence") which entitle you freely to modify and/or to distribute this
; source code subject to Your compliance with the terms of the Licence.
; 
; This source code has been made available to You without any warranties
; whatsoever. Consequently, Your use, modification and distribution of this
; source code is entirely at Your own risk and neither Castle, its licensors
; nor any other person who has contributed to this source code shall be
; liable to You for any loss or damage which You may suffer as a result of
; Your use, modification or distribution of this source code.
; 
; Full details of Your rights and obligations are set out in the Licence.
; You should have received a copy of the Licence with this source code file.
; If You have not received a copy, the text of the Licence is available
; online at www.castle-technology.co.uk/riscosbaselicence.htm
; 

;*****************************************************************************************
;***                                                                                   ***
;***  Error.s                                                                          ***
;***                                                                                   ***
;***  Application:   PCCardFS Module                                                   ***
;***  Version:       0.01                                                              ***
;***                                                                                   ***
;***  By:            Neil Critchell, Acorn Computers Ltd.                              ***
;***  Date:          25th October 1993                                                 ***
;***                                                                                   ***
;***                                                                                   ***
;***  Purpose:       Contains the error block (messages) used by the PCCardFS module.  ***
;***                 Only contains the default values, and pointer table.              ***
;***                                                                                   ***
;***                                                                                   ***
;***  History:       0.01 25th October 1993 - Original version                         ***
;***                                                                                   ***
;***                                                                                   ***
;*****************************************************************************************




;*****************************************************************************************
;***                                                                                   ***
;***    Constants                                                                      ***
;***                                                                                   ***
;*****************************************************************************************

ERROR_BASE                      EQU     &808B00
    



;*****************************************************************************************
;***                                                                                   ***
;***    Export global symbols                                                          ***
;***                                                                                   ***
;*****************************************************************************************

        EXPORT  PCCardFS_Errors





;*****************************************************************************************
;***                                                                                   ***
;***    Importted global symbols                                                       ***
;***                                                                                   ***
;*****************************************************************************************








;*****************************************************************************************
;***                                                                                   ***
;***    Area name C$$code advisable as wanted to link with C output                    ***
;***                                                                                   ***
;*****************************************************************************************


        AREA    |C$$code|, CODE, READONLY









;*****************************************************************************************
;***                                                                                   ***
;***    Area name C$$data, ie the DATA area                                            ***
;***                                                                                   ***
;*****************************************************************************************

        AREA    |C$$data|, DATA


        ALIGN

PCCardFS_Errors
        DCD     PCCardFS_ErrorMessage0
        DCD     PCCardFS_ErrorMessage1
        DCD     PCCardFS_ErrorMessage2
        DCD     PCCardFS_ErrorMessage3
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage
        DCD     PCMCIA_SupCodeErrorNoMessage



        ALIGN
PCCardFS_ErrorMessage0
        DCD     (ERROR_BASE + &00)
                = "PCCardFS initialisation failed, not enough RMA.", 0

        ALIGN
PCCardFS_ErrorMessage1
        DCD     (ERROR_BASE + &01)
                = "MessageTrans failure.", 0
        

        ALIGN
PCCardFS_ErrorMessage2
        DCD     (ERROR_BASE + &02)
                = "", 0

        ALIGN
PCCardFS_ErrorMessage3
        DCD     (ERROR_BASE + &03)
                = "", 0








        ALIGN
PCMCIA_SupCodeErrorNoMessage
        DCD     (ERROR_BASE + &FF)
                = "", 0





        END


