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
; Kernel utility library

; void *memset(void *s, int c, size_t n) -------------------------------------------------

        ROUT
memset
        TEQ     a3, #0                                  ; return immediately if zero bytes
        MOVEQ   pc, lr

        ADD     a1, a1, a3
        TST     a1, #3                                  ; check for unaligned end
        BNE     %FT80
05      SUBS    a3, a3, #32                             ; if at least 32, do 32 at a time
        BLO     %FT50

        Push    "v1-v5"
        AND     a2, a2, #&FF
        ORR     a2, a2, a2, LSL #8
        ORR     a2, a2, a2, LSL #16
        MOV     a4, a2
        MOV     v1, a2
        MOV     v2, a2
        MOV     v3, a2
        MOV     v4, a2
        MOV     v5, a2
        MOV     ip, a2
10      STMDB   a1!, {a2,a4,v1,v2,v3,v4,v5,ip}
        SUBS    a3, a3, #32
        BHS     %BT10
        Pull    "v1-v5"

50      ADDS    a3, a3, #32-4                           ; if at least 4, do 4 at a time
        BMI     %FT70
60      STR     a2, [a1, #-4]!
        SUBS    a3, a3, #4
        BPL     %BT60

70      ADDS    a3, a3, #4
        MOVEQ   pc, lr

80      STRB    a2, [a1, #-1]!                          ; byte at a time until finished or
        SUBS    a3, a3, #1                              ; aligned (if at end, will finish)
        MOVEQ   pc, lr
        TST     a1, #3
        BNE     %BT80
        B       %BT05

; unsigned __rt_udiv(unsigned divisor, unsigned dividend) --------------------------------
        ROUT
|__rt_udiv|
; Unsigned divide of a2 by a1: returns quotient in a1, remainder in a2
; Destroys a3 and ip only

        MOV     a3, #0
        RSBS    ip, a1, a2, LSR #3
        BCC     u_sh2
        RSBS    ip, a1, a2, LSR #8
        BCC     u_sh7
        MOV     a1, a1, LSL #8
        ORR     a3, a3, #&FF000000
        RSBS    ip, a1, a2, LSR #4
        BCC     u_sh3
        RSBS    ip, a1, a2, LSR #8
        BCC     u_sh7
        MOV     a1, a1, LSL #8
        ORR     a3, a3, #&00FF0000
        RSBS    ip, a1, a2, LSR #8
        MOVCS   a1, a1, LSL #8
        ORRCS   a3, a3, #&0000FF00
        RSBS    ip, a1, a2, LSR #4
        BCC     u_sh3
        RSBS    ip, a1, #0
        BCS     dividebyzero
u_loop  MOVCS   a1, a1, LSR #8
u_sh7   RSBS    ip, a1, a2, LSR #7
        SUBCS   a2, a2, a1, LSL #7
        ADC     a3, a3, a3
u_sh6   RSBS    ip, a1, a2, LSR #6
        SUBCS   a2, a2, a1, LSL #6
        ADC     a3, a3, a3
u_sh5   RSBS    ip, a1, a2, LSR #5
        SUBCS   a2, a2, a1, LSL #5
        ADC     a3, a3, a3
u_sh4   RSBS    ip, a1, a2, LSR #4
        SUBCS   a2, a2, a1, LSL #4
        ADC     a3, a3, a3
u_sh3   RSBS    ip, a1, a2, LSR #3
        SUBCS   a2, a2, a1, LSL #3
        ADC     a3, a3, a3
u_sh2   RSBS    ip, a1, a2, LSR #2
        SUBCS   a2, a2, a1, LSL #2
        ADC     a3, a3, a3
u_sh1   RSBS    ip, a1, a2, LSR #1
        SUBCS   a2, a2, a1, LSL #1
        ADC     a3, a3, a3
u_sh0   RSBS    ip, a1, a2
        SUBCS   a2, a2, a1
        ADCS    a3, a3, a3
        BCS     u_loop
        MOV     a1, a3
        MOV     pc, lr

dividebyzero
        B       dividebyzero

        END
