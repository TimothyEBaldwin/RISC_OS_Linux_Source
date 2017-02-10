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
x
        MOV     ip, sp
        STMFD   sp!, {a1,a2,v1,v2,v3,fp,ip,lr,pc}
        SUB     fp, ip, #4
        CMPS    sp, sl
        BLLT    |x$stack_overflow|
        MOV     v1, a2
        MOV     v2, #0
        MOV     a2, #1
        STR     a2, [sp, #-56]!
        ADD     a2, sp, #40
        STR     a1, [sp, #8]
        STR     a2, [sp, #4]
        STR     v2, [sp, #12]
        MOV     a3, sp
        MOV     a2, sp
        MOV     a1, #332
        ADD     a1, a1, #&80000
        BL      |_kernel_swi|
        CMPS    a1, #0
        BNE     |L0000e8.J19.x|
        B       |L0000e0.J8.x|
|L000060.J7.x|
        STR     v2, [sp, #0]
        STR     v2, [sp, #12]
        STR     v2, [sp, #16]
        MOV     a3, sp
        MOV     a2, sp
        MOV     a1, #67
        ADD     a1, a1, #1792
        ADD     a1, a1, #&40000
        BL      |_kernel_swi|
        CMPS    a1, #0
        BNE     |L0000e8.J19.x|
        STMFA   sp, {v1,v2}
        STR     v2, [sp, #12]
        STR     v2, [sp, #16]
        MOV     a3, sp
        MOV     a2, sp
        MOV     a1, #134
        ADD     a1, a1, #&40000
        BL      |_kernel_swi|
        CMPS    a1, #0
        BNE     |L0000e8.J19.x|
        ADD     a1, sp, #40
        STR     a1, [sp, #4]
        MOV     a3, sp
        MOV     a2, sp
        MOV     a1, #77
        ADD     a1, a1, #256
        ADD     a1, a1, #&80000
        BL      |_kernel_swi|
        CMPS    a1, #0
        BNE     |L0000e8.J19.x|
        LDR     v3, [sp, #0]
|L0000e0.J8.x|
        CMPS    v3, #0
        BNE     |L000060.J7.x|
|L0000e8.J19.x|
        LDMEA   fp, {v1,v2,v3,fp,sp,pc}^
