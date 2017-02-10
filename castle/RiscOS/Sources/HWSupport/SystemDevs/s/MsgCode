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

; Message file handling code.


; OSS Translate an error block, with one substituted parameter.

; In:   r0 -> Error block containing the token
;       r1 -> %0 parameter to substitute

; Out:  r0 -> Translated error block or another error (token no found etc.)
;       All other registers preserved, V always set, other flags undefined

copy_error_one Entry "r2-r7"
        BL      open_message_file               ; Ensure file is open
        EXIT    VS                              ; Return the error

        MOV     r4, r1                          ; Move input %0
        ADR     r1, message_file_block          ; Messages file handle
        MOV     r2, #0                          ; Use MessageTrans buffer
        MOV     r5, #0                          ; No %1
        MOV     r6, #0                          ; No %2
        MOV     r7, #0                          ; No %3
        SWI     XMessageTrans_ErrorLookup       ; Always sets the V flag

        MOV     r1, r4                          ; Preserve input r1
        EXIT


message_filename
        DCB     "Resources:$.Resources.SystemDevs.Messages", 0
        ALIGN


; OSS Open the messages file if it is closed.

open_message_file Entry "r0-r2"
        LDR     r1 , message_file_open
        CMP     r1, #0                          ; Check the open flag (and V:=0)
        EXIT    NE                              ; Return - it is open

        ADR     r0, message_file_block          ; Messages file handle
        ADR     r1, message_filename            ; Messages filename
        MOV     r2, #0                          ; Buffer in RMA/access direct
        SWI     XMessageTrans_OpenFile
        STRVS   r0, [sp]                        ; Return the error
        EXIT    VS

        MOV     r1, #1
        STR     r1, message_file_open           ; Flag the file as open
        EXIT

        END
