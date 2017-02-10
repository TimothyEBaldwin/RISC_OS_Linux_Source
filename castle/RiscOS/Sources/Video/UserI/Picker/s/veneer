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
; veneer.s - filter veneer

        GBLL    Trace
Trace   SETL    {FALSE}

        GBLL    Small_Stubs
Small_Stubs SETL {FALSE}

        GET     OS:Hdr.Types

        IMPORT  main_post_filter
        IMPORT  main_pre_filter

        AREA    |C$$code|, CODE, READONLY

;;;     ENTRY
;;;     IMPORT  |__module_header|

;---------------------------------------------------------------------------
        EXPORT  veneer_post_filter
veneer_post_filter
; Entry
;       A1 = event code for event about to be returned
;       A2 -> event block
;       A3 = task handle
;       IP -> task record (passed to Filter_RegisterPostFilter)
;       owner task paged in
;       SVC mode, interrupts enabled
; Exit
;       A1 = replacement event code, or -1 (none)
;       A2 -> (possibly modified) event block

        STMFD   SP!, {A2, A3, A4, V1, V2, V3, SL, FP, IP, LR}

        [       Trace
        SWI     XHostFS_HostVdu
        SWI     XOS_WriteS
        =       10, "s.veneer,36: veneer_post_filter", 13, 10, 0
        SWI     XHostFS_TubeVdu
        ]

        MOV     SL, SP, LSR #20
        MOV     SL, SL, ASL #20         ; SP_LWM
        LDMIA   SL, {V1, V2, V3}        ; save reloc modifiers
        MOV     A4, IP
; A4 -> task record
        LDR     IP, [IP, #8]
; IP -> module workspace (offsetof (dialogue_task_list, workspace) is 8)
        LDR     IP, [IP]
; IP -> static data
        [       Small_Stubs
        LDMIA   IP, {FP, IP, LR}        ; new relocation modifiers
        STMIA   SL, {FP, IP, LR}        ; set by module init
        |
        LDMIB   IP, {FP, IP}            ; new relocation modifiers
        STMIA   SL, {FP, IP}            ; set by module init
        ]

        ADD     SL, SL, #540            ; C magic

; A1 = event code for event about to be returned
; A2 -> event block
; A3 = task handle
; A4 = workspace pointer
        BL      main_post_filter
; A1 = replacement event code, or -1 (none)
; A2, A3, A4 corrupted

        SUB     SL, SL, #540            ; C magic
        STMIA   SL, {V1, V2, V3}        ; restore reloc modifiers

        LDMFD   SP!, {A2, A3, A4, V1, V2, V3, SL, FP, IP, PC}

;---------------------------------------------------------------------------
        EXPORT  veneer_pre_filter
veneer_pre_filter
; Entry
;       A1 = event mask
;       A2 -> event block
;       A3 = task handle
;       IP -> task record (passed to Filter_RegisterPreFilter)
;       owner task paged in
;       SVC mode, interrupts enabled
; Exit
;       A1 = replacement event mask

        STMFD   SP!, {A2, A3, A4, V1, V2, V3, SL, FP, IP, LR}

        [       Trace
        SWI     XHostFS_HostVdu
        SWI     XOS_WriteS
        =       10, "s.veneer,90: veneer_pre_filter", 13, 10, 0
        SWI     XHostFS_TubeVdu
        ]

        MOV     SL, SP, LSR #20
        MOV     SL, SL, ASL #20         ; SP_LWM
        LDMIA   SL, {V1, V2, V3}        ; save reloc modifiers
        MOV     A4, IP
; A4 -> task record
        LDR     IP, [IP, #8]
; IP -> module workspace (offsetof (dialogue_task_list, workspace) is 8)
        LDR     IP, [IP]
; IP -> static data
        [       Small_Stubs
        LDMIA   IP, {FP, IP, LR}        ; new relocation modifiers
        STMIA   SL, {FP, IP, LR}        ; set by module init
        |
        LDMIB   IP, {FP, IP}            ; new relocation modifiers
        STMIA   SL, {FP, IP}            ; set by module init
        ]

        ADD     SL, SL, #540            ; C magic

; A1 = event mask
; A2 -> event block
; A3 = task handle
; A4 = workspace pointer
        BL      main_pre_filter
; A1 = replacement event mask
; A2, A3, A4 corrupted

        SUB     SL, SL, #540            ; C magic
        STMIA   SL, {V1, V2, V3}        ; restore reloc modifiers
        LDMFD   SP!, {A2, A3, A4, V1, V2, V3, SL, FP, IP, PC}

        END
