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
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r1 -> user block to put template
;       r2 -> core to put indirected icons for template
;       r3 -> end of this core
;       r5 -> name of relevant entry

load_template Entry , 16                ; 16 bytes of stack for name
        MOV     lr, sp
        Push    "r1, r2"
        MOV     r1, lr
        MOV     r2, r5
        BL      strcpy
        MOV     r5, r1                  ; And use this one instead
        Pull    "r1, r2"

 [ fonthack
        wsaddr  r4, fontrefarray
 |
        MOV     r4, #-1
 ]
        MOV     r6, #0
 [ debug
 DREG r1, "read template to ",cc
 DREG r2, ", ind icons to ",cc
 DREG r3, ", end ",cc
 DSTRING r5, ", template name "
 ]
        SWI     XWimp_LoadTemplate
        EXIT    VS

        CMP     r6, #0
        ADREQ   r0, ErrorBlock_Filer_NoTemplate
        BLEQ    LookupError
        EXIT

        MakeErrorBlock  Filer_NoTemplate

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Called at startup and on mode change

SetForThisMode Entry "r0-r4"

        MOV     r0, #VduExt_XEigFactor
        MOV     r1, #VduExt_YEigFactor
        MOV     r2, #VduExt_XWindLimit
        MOV     r3, #VduExt_YWindLimit
        MOV     r4, #-1
        Push    "r0-r4"
        MOV     r0, sp
        MOV     r1, sp
        SWI     XOS_ReadVduVariables
        Pull    "r0-r4"

        MOV     r14, #1                 ; Compute size of a pixel in OS units
        MOV     r0, r14, LSL r0
        MOV     r1, r14, LSL r1

        MUL     r2, r0, r2
        STR     r2, xwindsize
        MUL     r3, r1, r3
        STR     r3, ywindsize
 [ debug
 DREG r2, "x windsize = ",,Integer
 DREG r3, "y windsize = ",,Integer
 ]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; messagetrans_lookup
; In:   r0 -> token to look up
; Out:  r0 -> message looked up (or token if lookup failed)
;
messagetrans_lookup
        EntryS  "r0-r3"
        MOV     r1, r0
        ADR     r0, messagetrans_struct
        MOV     r2, #0
        SWI     XMessageTrans_Lookup
        STRVC   r2, [sp, #Proc_RegOffset]
        EXITS

        END
