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
; Title:   s.wslotsize
; Purpose: wimp slot size
; Author:  NK
; History: 31-Aug-94: NK : Created
;

; APCS compliant, a1-a4 (R0-R3) may be corrupted

; to save stacking, use a4 as a temporary link register
; unless we know the SWI will corrupt it.

XWimp_slotsize  * &600ec

        EXPORT  |wimp_slot_size|

        AREA    |C$$Code|, CODE, READONLY

        GET     hdr.apcs


; returns kernel_oserror
wimp_slot_size
        STMFD   sp!,{r2,r4,lr}             ; swi corrupts r4
        SWI     XWimp_slotsize
        LDMRet  "r2,r4", VS
; r3 -> int *next
        TEQ     r3,#0
        STRNE   r1,[r3]
        LDMFD   sp!,{r3}
; r3 -> int *current
        TEQ     r3,#0
        STRNE   r0,[r3]
        LDR     r0,[sp,#8]              ; fith param was first word on stack
; r0 -> int *freepool
        TEQ     r0,#0
        STRNE   r2,[r0]
        MOV     r0,#0
        LDMRet  "r4"

        END

