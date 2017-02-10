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
; s.SWIS

Free_SWIdecode
        Push    "R0-R2,R9,LR"

        LDR     r12,[R12]                       ; wsptr --> workspace
        CMP     R11,#1
        BGT     badswi

        WritePSRc SVC_mode,R10,,R9              ; re-enable interrupts
        CMP     R11,#1
        BNE     SWIFree_Register                ; Free_Register
        BL      RemoveEntry                     ; Free_DeRegister
swireturn
        STRVS   r0, [sp]
        ORRVS   r9, r9, #V_bit
        RestPSR r9
        Pull    "R0-R2,R9,PC"
badswi
        ADD     sp, sp, #4
        ADR     R0,ErrorBlock_ModuleBadSWI
        ADRL    R1, Title
        BL      LookupError
        Pull    "R1-R2,R9,PC"

        MakeErrorBlock ModuleBadSWI

;;Free_Register
;;In:
;;   R0 = FS number
;;   R1 = Address to call
;;   R2 = R12 value.
;;
SWIFree_Register        ROUT

        MOV     r1,r0
        LDR     r0,[sp,#1*4]
        BL      AddEntry
        B       swireturn

        LNK     s.Tail


