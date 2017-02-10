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
;
 [ HALDebug
; No initialisation; assumes the serial
; port is already set up

; in: lr-> string to TX
DebugHALPrint
        Push    "a1-a4,v1"
        MOV     v1, lr
10      LDRB    a1, [v1], #1
        TEQ     a1, #0
        BEQ     %FT20
        BL      DebugTX
        B       %BT10
20      ADD     v1, v1, #3
        BIC     lr, v1, #3
        Pull    "a1-a4,v1"
        MOV     pc, lr

DebugHALPrintReg ; Output number on top of stack to the serial port
        Push    "a1-a4,v1-v4,lr"
        LDR     v2, [sp,#9*4]
        ADR     v3, hextab
        MOV     v4, #8
10      LDRB    a1, [v3, v2, LSR #28]
        bl	DebugTX
        MOV     v2, v2, LSL #4
        SUBS    v4, v4, #1
        BNE     %BT10
        MOV     a1, #13
        bl	DebugTX
        MOV     a1, #10
        bl	DebugTX

        Pull    "a1-a4,v1-v4,lr"
        ADD     sp, sp, #4
        MOV     pc, lr

DebugHALPrintRegNCR ; Output number on top of stack to the serial port, no CR
        Push    "a1-a4,v1-v4,lr"
        LDR     v2, [sp,#9*4]
        ADR     v3, hextab
        MOV     v4, #8
10      LDRB    a1, [v3, v2, LSR #28]
        bl	DebugTX
        MOV     v2, v2, LSL #4
        SUBS    v4, v4, #1
        BNE     %BT10
        MOV     a1, #&20
        bl	DebugTX

        Pull    "a1-a4,v1-v4,lr"
        ADD     sp, sp, #4
        MOV     pc, lr

hextab  DCB "0123456789abcdef"

DebugHALPrintB	; output number at TOS as a hex byte
        Push    "a1-a4,v1-v4,lr"
        LDR     v2, [sp,#9*4]
        ADR     v3, hextab
        MOV     v4, #2
        mov	v2, v2, lsl #24
10      LDRB    a1, [v3, v2, LSR #28]
        bl	DebugTX
        MOV     v2, v2, LSL #4
        SUBS    v4, v4, #1
        BNE     %BT10
        MOV     a1, #&20
        bl	DebugTX

        Pull    "a1-a4,v1-v4,lr"
        ADD     sp, sp, #4
        MOV     pc, lr

DebugTX
       stmfd    r13!,{r0-r3,r8,r9,lr}
       mov      r8,#0
       mov      r9, #86   ; HAL_DebugTX
       SWI      XOS_Hardware
       ldmfd    r13!,{r0-r3,r8,r9,pc}


 ]
       END
