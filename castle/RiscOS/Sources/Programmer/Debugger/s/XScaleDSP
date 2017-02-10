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
; File:    XScaleDSP.s
; Purpose: Disassembly of the XScale DSP instruction set

      [ XScaleDSP
XScaleDSPInstruction

        ; arrive here with cccc 11oo xxxx xxxx xxxx 0000 xxxx xxxx
        ; where oo <> 11

      [ WarnXScaleDSP
        MOV     r14, #Mistake_XScaleDSP
        STR     r14, Mistake
      ]

        AND     r2, r4, #&FE:SHL:20     ; 7 bit compare
        TEQ     r2, #2_11000100:SHL:20
        TSTEQ   r4, #2_11111000
        BEQ     XScaleMARMRA

        AND     r2, r4, #&FF:SHL:20     ; 8 bit compare
        TEQ     r2, #2_11100010:SHL:20
        BNE     Undefined
        TestBit 4
        BEQ     Undefined

XScaleMIA ROUT

        ; arrive here with cccc 1110 0010 xxxx xxxx 0000 xxx1 xxxx
        ; arrive here with cccc 1110 0010 oooo ssss 0000 aaa1 mmmm
        ;
        ; MIA<PH|BB|BT|TB|TT>{cond} acc,Rm,Rs
        ;
        ; where cccc = condition
        ;       oooo = Operation
        ;        aaa = Accumulator
        ;       mmmm = Rm
        ;       ssss = Rs

        AddStr  MiaTAB
        ANDS    r2, r4, #15:SHL:16      ; opcode_3
        BEQ     %FT10                   ; MIA
        TEQ     r2, #8:SHL:16
        AddChar "P",EQ
        AddChar "H",EQ
        BEQ     %FT10
        CMP     r2, #12:SHL:16
      [ WarnXScaleDSP
        MOVCC   r14, #Mistake_Unpred
        STRCC   r14, Mistake            ; All other values of opcode_3
      ]
        BCC     %FT10
        TestBit 17,"T","B"
        TestBit 16,"T","B"
10
        BL      Conditions
        BL      Tab
        MOV     r5, r4, LSR #5
        BL      XScaleAcc
        MOV     r5, r4
        BL      Comma_Dis_Register
        MOV     r5, r4, LSR #12
        BL      Comma_Dis_Register

        ORR     r2, r5, r4, LSL #4      ; R's now adjacent
        ADD     r2, r2, #&11            ; Look for carry out
        TST     r2, #15
        TSTNE   r2, #15:SHL:4
        MOVEQ   r14, #Mistake_R15       ; Either using PC
        STREQ   r14, Mistake
        B       InstructionEnd

XScaleMARMRA ROUT

        ; arrive here with cccc 1100 010x xxxx xxxx 0000 0000 0xxx
        ; format is        cccc 1100 010d hhhh llll 0000 0000 0aaa
        ;
        ; MAR{cond} acc,RdLo,RdHi
        ; MRA{cond} RdLo,RdHi,acc
        ;
        ; where cccc = condition
        ;        aaa = Accumulator
        ;          d = Direction
        ;       hhhh = RdHi
        ;       llll = RdLo

        TestStr 20,MraTAB,MarTAB,conds
        BL      Tab

        TestBit 20

        MOVEQ   r5, r4                  ; MAR
        BLEQ    XScaleAcc               ; MAR
        MOV     r5, r4, LSR #12
        BLEQ    Comma_Dis_Register      ; MAR
        BLNE    Dis_Register            ; MRA
        MOV     r5, r4, LSR #16
        BL      Comma_Dis_Register
        BLNE    AddComma
        MOVNE   r5, r4                  ; MRA
        BLNE    XScaleAcc               ; MRA
        BEQ     %FT10                   ; MAR

        EOR     r2, r4, r4, LSL #4
        TST     r2, #15:SHL:16
        MOVEQ   r14, #Mistake_RdLoRdHi  ; MRA with RdLo=RdHi
        STREQ   r14, Mistake
10
        ADD     r2, r4, #&11:SHL:12     ; Look for carry out
        TST     r2, #15:SHL:12
        TSTNE   r2, #15:SHL:16
        MOVEQ   r14, #Mistake_R15       ; Either using PC
        STREQ   r14, Mistake
        B       InstructionEnd

MiaTAB  DCB "MIA",0
MraTAB  DCB "MRA",0
MarTAB  DCB "MAR",0
AccTAB  DCB "acc",0
        ALIGN

XScaleAcc Entry "r8"                    ; Preserves flags
        AddStr AccTAB
        AND    r8, r5, #7
        BL     StoreDecimal
        EXIT
                           
      ]
        END
