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
; ->Error

;***************************************************************************
PutByte
;***************************************************************************

        PushAllWithReturnFrame

        Debug   fs,"Put byte"
        
        ; Fall through

;*************************************************************************
SaveFile     ; also deals with other write operations
;*************************************************************************

        MOV     r0, #ERROR_WRITETOCD
        ; Fall through




;---------------------------------------------------------------------------------------------
; Every error that occurs should end up here
;---------------------------------------------------------------------------------------------

ErrorExit

;----------------------------------------------------------------------------------
; If r0 < 0 THEN it indicates one of my errors that I must fetch using MessageTrans
; Requirements:
;              r0  =  negative error number
;              r12 -> workspace
;              r13 -> FD stack
;----------------------------------------------------------------------------------

        CMP     r0,#-26
        BLO     error_riscos2
        ; Error pointers are still valid in most of the top half of memory!


        RSB     r3, r0, #0
        ADR     r0, TempArea

        ; Build error number and message tag
        LDR     r2, =CDFS_ErrorBlock - 1
        ADD     r2, r2, r3

        ADD     r3, r3, #"a" - 1
        MOV     r3, r3, LSL #8
        ORR     r3, r3, #"e"

        ; Error number, Token - 'e?'<null>
        STMIA   r0, { r2, r3 }

;----------------------------------------------------------------------------------
; Get error message from message file
;----------------------------------------------------------------------------------

        ADR     r1, message_block
        MOV     r2, #0
        SWI     XMessageTrans_ErrorLookup

        SETV
        PullAllFromFrameAndExit AL, 1

error_riscos2

;***********************
; This is a trap to change 'Bad Mode' into a decent error message
;***********************

        ; Bad mode = Audio disc

        LDR     R1, [ R0 ]              ; R1 = error number
        LDR     R2, =CDFSDRIVERERROR__WRONG_DATA_MODE
        TEQ     R1, R2

        MOVEQ   r0, #ERROR_AUDIODISC
        BEQ     ErrorExit

        SETV
        PullAllFromFrameAndExit AL, 1

        LTORG

        END
