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
; > Sources.Tail

 [ international

;---------------------------------------------------------------------------
; MsgTrans_OpenFile
;
;       Open our messages file.
;
MsgTrans_OpenFile
        Entry   "r0-r2"

        ADR     r0, message_file_block
        ADR     r1, message_filename
        MOV     r2, #0
        SWI     XMessageTrans_OpenFile
        MOVVC   r0, #-1
        STRVC   r0, message_file_open
        STRVS   r0, [sp]

        EXIT

;---------------------------------------------------------------------------
; MsgTrans_Lookup
;       In:     r1 -> token
;               r2 -> buffer
;               r3 = buffer size
;               r4-r7 -> optional parameters
;       Out:    r0,r1 corrupted
;               r2 -> result string
;               r3 = size of result string before terminator
;
;       Lookup a message in our messages file.
;
MsgTrans_Lookup
        Entry

        LDR     r0, message_file_open
        TEQ     r0, #0
        BLEQ    MsgTrans_OpenFile
        EXIT    VS

        ADR     r0, message_file_block
        SWI     XMessageTrans_Lookup

        EXIT

message_filename
        DCB     "Resources:$.Resources.SerMouse.Messages",0
                ALIGN

 ]

;---------------------------------------------------------------------------
;       Neil's debugging routines.
;
      [ debug
        InsertNDRDebugRoutines
      ]

        END
