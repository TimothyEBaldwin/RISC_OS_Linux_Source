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
; > s.MsgTrans

;---------------------------------------------------------------------------
; MsgTrans_OpenFile
;
;       Out:    r0 -> message file block
;
;       Open our messages file.
;
MsgTrans_OpenFile
        Entry   "r1-r2"

        ADR     r0, message_block
        LDR     lr, flags
        TST     lr, #f_messagesopen
        EXIT    NE

        ADR     r1, message_file_name2
        MOV     r2, #0
        SWI     XMessageTrans_OpenFile

        ADRVS   r0, message_block
        ADRVS   r1, message_file_name
        MOVVS   r2, #0
        SWIVS   XMessageTrans_OpenFile

        LDRVC   lr, flags
        ORRVC   lr, lr, #f_messagesopen
        STRVC   lr, flags

        EXIT


;---------------------------------------------------------------------------
; MsgTrans_CloseFile
;
;       Close our messages file.
;
MsgTrans_CloseFile
        Entry   "r0,r1"

        ADR     r0, message_block
        LDR     r1, flags
        TST     r1, #f_messagesopen
        BICNE   r1, r1, #f_messagesopen
        STRNE   r1, flags
        SWINE   XMessageTrans_CloseFile

        EXIT


;---------------------------------------------------------------------------
; MsgTrans_ErrorLookup
;       In:     r0 -> token error block
;               r4-r7 -> optional parameters
;       Out:    r0 -> translated error block
;
;       Lookup an error in our messages file.
;
MsgTrans_ErrorLookup
        Entry   "r0-r2"

        CLRV
        BL      MsgTrans_OpenFile
        MOVVC   r1, r0
        LDRVC   r0, [sp]
        MOVVC   r2, #0
        SWIVC   XMessageTrans_ErrorLookup
        STR     r0, [sp]

        EXIT


;---------------------------------------------------------------------------
; MsgTrans_Lookup
;
;       In:     r1 -> token
;               r2 -> buffer (or 0)
;               r3 = size of buffer (if r2 non-zero)
;               r4-r7 = parameters
;       Out:    r2 -> translated string
;               r3 = size of result before terminator
;
;       Look up the given token in our messages file.
;
MsgTrans_Lookup
        Entry   "r0"

        CLRV
        BL      MsgTrans_OpenFile
        SWIVC   XMessageTrans_Lookup
        STRVS   r0, [sp]

        EXIT

message_file_name2
        DCB     "FilterManager:Messages",0
        ALIGN

message_file_name
        DCB     "Resources:$.Resources.FilterMgr.Messages",0
        ALIGN


        LNK     s.PreFilter
