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
; >MsgCode

        TTL     "Message file handling code"

; CopyError
; ---------
; Translate an error block, with no substituted parameter.
; Entry: R0 = error block containing the token
; Exit : R0 = translated error block or another error (token no found etc.)
;        VS
CopyError
        Entry   "r1-r7"
        MOV     r4, #0
        B       %FT10
        
; CopyErrorOne
; ------------
; Translate an error block, with one substituted parameter.
; Entry: R0 = error block containing the token
;        R1 = %0 parameter to substitute
; Exit : R0 = translated error block or another error (token no found etc.)
;        VS
CopyErrorOne
        ALTENTRY
        MOV     r4, r1                          ; Move input %0
10
        BL      OpenMsgFile                     ; Ensure file is open
        EXIT    VS                              ; Return the error

        ADR     r1, MsgFileBlock                ; Messages file handle
        MOV     r2, #0                          ; Use MessageTrans buffer
        MOV     r5, #0                          ; No %1
        MOV     r6, #0                          ; No %2
        MOV     r7, #0                          ; No %3
        SWI     XMessageTrans_ErrorLookup       ; Always sets the V flag
        EXIT

ScsiMsgFileName
        DCB     "Resources:$.Resources.SCSIFS.Messages", 0
        ALIGN

; OpenMsgFile
; -----------
; Open the messages file if it is closed.
; Entry: nothing
; Exit : R0 = pointer to error block if VS
OpenMsgFile
        Entry   "r0-r2"
        LDR     r1, MsgFileOpen
        TEQ     r1, #0                          ; Check the open flag
        EXIT    NE                              ; Return - it is open

        ADR     r0, MsgFileBlock                ; Messages file handle
        ADR     r1, ScsiMsgFileName             ; Messages filename
        MOV     r2, #0                          ; Buffer in RMA/access direct
        SWI     XMessageTrans_OpenFile
        STRVS   r0, [sp]                        ; Return the error
        EXIT    VS

        MOV     r1, #1
        STR     r1, MsgFileOpen                 ; Flag the file as open
        EXIT

      [ standalone
MsgFileReg
        Entry   "r0"
        ADR     r0, MsgFileResArea
        SWI     XResourceFS_RegisterFiles
        EXIT

MsgFileDereg
        Entry   "r0"
        ADR     r0, MsgFileResArea
        SWI     XResourceFS_DeregisterFiles
        EXIT

MsgFileResArea
	ResourceFile	$MergedMsgs, Resources.SCSIFS.Messages
        DCD     0
      ]

        LNK     ScsiFs50.s
