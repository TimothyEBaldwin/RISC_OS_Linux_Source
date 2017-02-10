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
; Perform the specified CLI command and swallow any error. If there
; was an error, copy the error string into the system variable
; X$Error, unless X$Error is already set to something, in which case
; the error is ignored. Thus, a chain of X commands will return only
; the first error in X$Error.
;

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Proc

        AREA    |X$$Code|, CODE, READONLY, PIC

	Entry
X
        MOV     R0,R1
        SWI     XOS_CLI
        MOVVC   PC,R14
        ADD     R11,R0,#4
        ADR     R0,rcsysvar
        ADR     R1,zero
        MOV     R2,#1
        MOV     R3,#0
        MOV     R4,#0
        SWI     XOS_SetVarVal
        ADR     R0,xsysvar
        MOV     R1,R12
        MVN     R2,#0
        MOV     R3,#0
        MOV     R4,#0
        SWI     XOS_ReadVarVal
        TEQ     R2,#0
        CMNNE   R2,#1
        MOVNE   PC,R14
        MOV     R0,R11
        MOV     R1,R0
10
        LDRB    R2,[R0],#1
        TEQ     R2,#0
        BNE     %BT10
        SUB     R2,R0,R1
        ADR     R0,xsysvar
        MOV     R3,#0
        MOV     R4,#0
        SWI     XOS_SetVarVal
        MOV     PC,R14

xsysvar
        DCB     "X$Error", 0
rcsysvar
        DCB     "Sys$ReturnCode", 0
zero
        DCB     "0", 0
XVersionInfo
        DCB     "X 1.03 (03 Jul 2001)"
        ALIGN

        END

