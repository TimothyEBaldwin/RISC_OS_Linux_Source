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
; > Trace

; Some extra tracing routines by Jonathan. All preserve all registers and
; all flags

; HostFS_WriteC * &40102

;---------------------------------------------------------------------------
trace_char ROUT

; R0 = character to trace

        EntryS  "R0, R1, R2"

        CMP     R0, #32
        BLT     |trace_char: nonprintable character|
        CMP     R0, #127
        BGE     |trace_char: nonprintable character|

|trace_char: printable character|
        ;write character
        SWI     HostFS_WriteC
        ;if it's a backslash, write it again
        CMP     R0, #"\\"
        SWIEQ   HostFS_WriteC
        B       |trace_char: exit|

|trace_char: nonprintable character|
        CMP     R0, #:CHR: 10
        BNE     |trace_char: control character|

|trace_char: linefeed|
        SWI     HostFS_WriteC

        MOV     R0, #:CHR: 13
        SWI     HostFS_WriteC

        B       |trace_char: exit|

|trace_char: control character|
        ;save the character

        MOV     R1, R0
        ADR     R2, |trace_char: digits|

; R1 = character to trace
; R2 -> representation table

        MOV     R0, #"\\"
        SWI     HostFS_WriteC

        MOV     R0, #"x"
        SWI     HostFS_WriteC

        ;trace top nybble
        MOV     R0, R1, LSR #4
        LDRB    R0, [R2, R0]
        SWI     HostFS_WriteC

        ;trace bottom nybble
        AND     R0, R1, #&F
        LDRB    R0, [R2, R0]
        SWI     HostFS_WriteC

|trace_char: exit|
        EXITS

|trace_char: digits|
        =     "0123456789ABCDEF"
        ALIGN
;---------------------------------------------------------------------------
trace_string ROUT

; R0 -> string to trace

        EntryS  "R0, R1"

        MOV     R1, R0
; R1 -> string to trace

        B       |trace_string: end loop|
|trace_string: start loop|
        BL      trace_char
        ADD     R1, R1, #1
|trace_string: end loop|
        LDRB    R0, [R1]
        CMP     R0, #:CHR: 0
        BNE     |trace_string: start loop|

        EXITS
;---------------------------------------------------------------------------
trace_decimal ROUT

; R0 = integer to trace

        EntryS  "R0, R1, R2"

        SUB     SP, SP, #16
        MOV     R1, SP
        MOV     R2, #15
        SWI     OS_ConvertInteger4

        ;trace it
        BL      trace_string
        ADD     SP, SP, #16

        EXIT
;---------------------------------------------------------------------------
trace_hex ROUT

; R0 = integer to trace

        Push    "R0, R1, R2, LR"

        SUB     SP, SP, #16
        MOV     R1, SP
        MOV     R2, #15
        SWI     OS_ConvertHex8

        ;trace it
        BL      trace_string
        ADD     SP, SP, #16

        Pull    "R0, R1, R2, PC",, ^
;---------------------------------------------------------------------------
trace_nl ROUT

        EntryS  "R0"

        MOV     R0, #:CHR: 10
        BL      trace_char

        EXITS

        END
