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

; extern os_error *swi (int swinum, ...)
; usage: swi (swinum, R0, 33, R1, "foo", END)
; usage: swi (swinum, NONX, R0, 33, R1, "foo", END)
; usage: swi (swinum, R0, 33, R1, "foo", OUT, R0, &var0, R4, &var4, END)
; usage: swi (swinum, R0, 33, R1, "foo", OUT, R0, &var0, CARRY, &carry, END)

;mjs changes to use OS_CallASWI
                GET     Hdr:ListOpts
                GET     Hdr:APCS.<APCS>

                GBLL    ZEROREGS
ZEROREGS        SETL    {TRUE}                  ; If true, unspecified args default to zero.

F_END           *       20
F_OUT           *       21
F_CARRY         *       22
F_NONX          *       23

SWIMASK         *       &ff000000
SWIXBIT         *       &00020000

XOS_CallASWI    *       &2006f

                AREA    |C$$code|, CODE, READONLY

                EXPORT  swi

swi             MOV     ip, sp                          ; APCS entry
                STMFD   sp!, {r1-r3}                    ; varargs preparation
                STMFD   sp!, {r4-r9, fp, ip, lr, pc}    ; APCS entry
                SUB     fp, ip, #16                     ; APCS entry

                ADD     lr, fp, #4              ; point to first varargs argument

                BIC     r4, r0, #SWIMASK        ; build SWI number ...
                ORR     r4, r4, #SWIXBIT

        [ ZEROREGS
                MOV     r0, #0                  ; extend stack with zeros
                MOV     r1, #10                 ; room for 10 registers
clear           STR     r0, [sp, #-4]!
                SUBS    r1, r1, #1
                BNE     clear
        |
                SUB     sp, sp, #40             ; registers contain junk by default
        ]

collect         LDR     r0, [lr], #4            ; get next arg

                TEQ     r0, #F_NONX             ; is it "no X bit"?
                BICEQ   r4, r4, #SWIXBIT        ; yes, clear X bit
                BEQ     collect

                TEQ     r0, #F_END              ; if it's END
                SUBEQ   lr, lr, #4              ; then back up so we see it again...
                TEQNE   r0, #F_OUT              ; stop collecting if it's END or OUT,

; XXX assume r0 now holds valid register number

                LDRNE   r1, [lr], #4            ; ... get the argument...
                STRNE   r1, [sp, r0, LSL #2]    ; ... and put it in the array

                BNE     collect                 ; continue

                MOV     r0, sp                  ; save address of register table
                STMFD   sp!,{r10,lr}
                MOV     r10,r4
                LDMIA   r0, {r0-r9}             ; get the registers
                SWI     XOS_CallASWI

                LDMFD   sp!,{r10,lr}
                STMIA   sp, {r0-r9}             ; save the results back

                MOVVC   r0, #0                  ; if no error, return zero (otherwise return r0)
                MOVCC   r1, #0                  ; set r1 to 1 or 0 as carry flag
                MOVCS   r1, #1

scatter         LDR     r2, [lr], #4            ; get the next argument
                TEQ     r2, #F_END              ; is it END?
                BEQ     finished
                TEQ     r2, #F_CARRY            ; is it carry?
                MOVEQ   r2, r1                  ; yes, use the carry flag
                LDRNE   r2, [sp, r2, LSL #2]    ; no, so get [r2] register's value back
                LDR     r3, [lr], #4            ; get address of user's variable
                STR     r2, [r3]                ; store the value there
                B       scatter

finished
                Return  "r4-r9", fpbased        ; APCS exit

                END
