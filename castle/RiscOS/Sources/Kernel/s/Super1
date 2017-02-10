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
        TTL    => Super1

CliDPrompt    =  "CLI$$Prompt",0
DefaultPrompt = "*"
        ALIGN

StartSuper ; Start entry for UtilModule
        BL      DEFHAN                  ; set error handler in case spooling
      [ International                   ; We are in USR mode and have no stack ...
        LDR     R0,=ZeroPage+KernelMessagesBlock+4
        ADR     R1,%FT11
        MOV     R2,#0
        SWI     XMessageTrans_Lookup
        MOVVS   R2,R1
01
        LDRB    R0,[R2],#1
        CMP     R0,#31
        BLT     %FT02
        SWI     OS_WriteC
        B       %BT01
02      SWI     OS_NewLine
        SWI     OS_NewLine
        B       CLILOP
11
        =       "Supervisor",0
        ALIGN
      |
        SWI     OS_WriteS
        =       "Supervisor",10,13,10,13,0
        ALIGN
        B       CLILOP
      ]


CLIEXIT BL      DEFHN2                  ; restore all our world

GOSUPV
        WritePSRc 0, R0
        BL      DEFHAN                  ; including error handler!

CLILOP ROUT

        ADR     R0, CliDPrompt          ; try looking it up
        LDR     R1, =GeneralMOSBuffer
        MOV     R2, #?GeneralMOSBuffer
        MOV     R3, #0
        MOV     R4, #VarType_Expanded
        SWI     XOS_ReadVarVal
        ADRVS   r1, DefaultPrompt       ; gnot gthere or gnaff
        MOVVS   r2, #1
        MOV     r0, r1
        MOV     r1, r2
        SWI     OS_WriteN
        LDR     R0, =GeneralMOSBuffer
        LDR     R1, =?GeneralMOSBuffer-1
        MOV     R2, #" "
        MOV     R3, #255
        MOV     R4, #0
        SWI     OS_ReadLine32
        BCS     ESCAPE
        MOV     lr, pc                  ; construct lr for wallies to return to
        SWI     XOS_CLI
        BVC     CLILOP

        SWI     XOS_NewLine
        BL      PrintError
        B       CLILOP

        LTORG

ESCAPE  MOV     R0, #&7E
        SWI     OS_Byte                 ; May yield error
      [ International
        SWI     XOS_EnterOS             ; GO into SVC mode to get some stack
        SWI     OS_NewLine
        BVS     %FT01
        BL      WriteS_Translated
        =       "Escape:Escape",10,13,0
        ALIGN
01
        WritePSRc 0, R0                 ; Back to user mode.
      |
        SWI     OS_WriteS
        =       10,13, "Escape", 10,13, 0
        ALIGN
      ]
        B       CLILOP

        END
