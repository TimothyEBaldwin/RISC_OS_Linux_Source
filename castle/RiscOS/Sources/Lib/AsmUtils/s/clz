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
; Count leading/trailing zeros/ones without using the CLZ instruction
; Copyright (C) 2004 Castle Technology Ltd
; Author: Ben Avison

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:APCS.<APCS>

        AREA    |Asm$$Code|, CODE, READONLY

        EXPORT  |clz|
        EXPORT  |ctz|
        EXPORT  |clo|
        EXPORT  |cto|

|clz|
        ORRS    a4, a1, a1, LSR #1
        MOVEQ   a1, #32
        ORRNE   a1, a4, a4, LSR #2
        Return  , LinkNotStacked, EQ
        ORR     a1, a1, a1, LSR #4
        LDR     a2, =&06C9C57D
        ORR     a1, a1, a1, LSR #8
        ADR     a3, table
        ORR     a1, a1, a1, LSR #16
        MLAS    a1, a2, a1, a2
        LDRNEB  a1, [a3, a1, LSR #27]
        Return  , LinkNotStacked

|ctz|
        SUBS    a4, a1, #1
        MOVCC   a1, #32
        Return  , LinkNotStacked, CC
        LDR     a2, =&06C9C57D
        BIC     a1, a1, a4
        MUL     a1, a2, a1
        ADR     a3, table
        LDRB    a1, [a3, a1, LSR #27]
        RSB     a1, a1, #32
        Return  , LinkNotStacked

|clo|
        ANDS    a4, a1, a1, ASR #1
        MOVPL   a1, #0
        ANDMI   a1, a4, a4, ASR #2
        Return  , LinkNotStacked, PL
        AND     a1, a1, a1, ASR #4
        LDR     a2, =&06C9C57D
        AND     a1, a1, a1, ASR #8
        ADR     a3, table
        AND     a1, a1, a1, ASR #16
        RSB     a1, a1, #0
        MUL     a1, a2, a1
        LDRB    a1, [a3, a1, LSR #27]
        Return  , LinkNotStacked

|cto|
        ADDS    a4, a1, #1
        MOVEQ   a1, #32
        Return  , LinkNotStacked, EQ
        LDR     a2, =&06C9C57D
        BIC     a1, a4, a1
        MUL     a1, a2, a1
        ADR     a3, table
        LDRB    a1, [a3, a1, LSR #27]
        RSB     a1, a1, #32
        Return  , LinkNotStacked

table
        = 32, 31, 14, 30, 22, 13, 29, 19,  2, 21, 12, 10, 25, 28, 18,  8
        =  1, 15, 23, 20,  3, 11, 26,  9, 16, 24,  4, 27, 17,  5,  6,  7

        END
