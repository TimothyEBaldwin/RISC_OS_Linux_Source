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
; > DrawMod.sources.DrInter

;------------------------------------------------------------------------------
;
; Draw internationalisation support routines
;
;------------------------------------------------------------------------------

message_filename
        DCB     "Resources:$.Resources.DrawMod.Messages", 0
        ALIGN

open_messagefile Entry r0-r2
        LDR     r0, MessageFile_Open
        CMP     r0, #0
        EXIT    NE
        ADR     R0, MessageFile_Block
        ADR     R1, message_filename
        MOV     r2, #0
        SWI     XMessageTrans_OpenFile
        STRVS   r0, [sp]
        EXIT    VS
        MOV     r0, #1
        STR     r0, MessageFile_Open
        EXIT

CopyError Entry r1-r7
        BL      open_messagefile
        EXIT    VS
        ADR     R1, MessageFile_Block
        MOV     R2, #0
        ADRL    R4, title
        MOV     R5, #0
        MOV     R6, #0
        MOV     R7, #0
        SWI     XMessageTrans_ErrorLookup
        EXIT

        END
