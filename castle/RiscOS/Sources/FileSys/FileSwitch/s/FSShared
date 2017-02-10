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
        SUBT    > Sources.FSShared

SharedCodeStart ROUT

; Make sure these are consistent with those used in OSUtils

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r0 = open mode
;       r1 -> filename

; Out   VC: r0 = r1 = handle
;       VS: r0 -> error (FilingSystemError or 'NotFound')

OpenFileWithWinge Entry

        ORR     r0, r0, #open_nodir + open_mustopen
        SWI     XOS_Find
        MOVVC   r1, r0
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SetErrorEscape ; This is for utility command and should NOT go BL CopyError !

        ADR     r0, ErrorBlock_Escape
 [ No26bitCode
        SETV
        MOV     pc, lr
 |
        ORRS    pc, lr, #V_bit
 ]

ErrorBlock_Escape
        DCD     ErrorNumber_Escape
        DCB     "Escape", 0
        ALIGN

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SkipOverNameAndSpaces EntryS

        BL      SkipToSpace

10      LDRB    r0, [r1], #1
        CMP     r0, #space      ; Leave r1 -> ~space
        BEQ     %BT10
        SUB     r1, r1, #1
        EXITS                   ; r0 = first ~space

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SkipToSpace Entry "r0"

10      LDRB    r0, [r1], #1
        CMP     r0, #delete
        CMPNE   r0, #space      ; Leave r1 -> space or CtrlChar
        BHI     %BT10
        SUB     r1, r1, #1
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r0 = number to print
;       r1 = 0 -> strip spaces
;            1 -> print leading spaces for field of 4

; Number gets printed RJ in a field of 4 if possible, or more as necessary

PrintR0Decimal Entry "r0-r3"

        SUB     sp, sp, #16
        MOV     r3, r1                  ; Save flag
        MOV     r1, sp
        MOV     r2, #16
        SWI     XOS_BinaryToDecimal     ; Ignore any errors from this
        CMP     r3, #0                  ; Doing spaces ?
        RSBNES  r3, r2, #4              ; How many spaces do we need ?
        BLE     %FT10

05      SWI     XOS_WriteI+" "          ; But errors in here are bad
        BVS     %FT99
        SUBS    r3, r3, #1
        BNE     %BT05

10      LDRB    r0, [r1], #1
        SWI     XOS_WriteC
        BVS     %FT99
        SUBS    r2, r2, #1
        BNE     %BT10

99      ADD     sp, sp, #16
        STRVS   r0, [sp]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Shared output routines; present in OS version

HexR0LongWord
        Push    "R0, lr"
        MOV     R0, R0, ROR #16
        BL      HexR0Word
        MOVVC   R0, R0, ROR #32-16
        BLVC    HexR0Word
        STRVS   R0, [sp]
        Pull    "R0, PC"

HexR0Word
        Push    "R0, lr"
        MOV     R0, R0, ROR #8
        BL      HexR0Byte
        MOVVC   R0, R0, ROR #32-8
        BLVC    HexR0Byte
        STRVS   R0, [sp]
        Pull    "R0, PC"

HexR0Byte
        Push    "R0, lr"
        MOV     R0, R0, ROR #4
        BL      HexR0Nibble
        MOVVC   R0, R0, ROR #32-4
        BLVC    HexR0Nibble
        STRVS   R0, [sp]
        Pull    "R0, PC"

HexR0Nibble
        Push    "R0, lr"
        AND     R0, R0, #15
        CMP     R0, #10
        ADDCC   R0, R0, #"0"
        ADDCS   R0, R0, #"A"-10
        SWI     XOS_WriteC
        STRVS   R0, [sp]
        Pull    "R0, PC"

FileSwitch_ModuleEnd

        END
