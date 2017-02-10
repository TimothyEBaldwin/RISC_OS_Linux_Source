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
r0      RN      0
r1      RN      1

Start   SWI     &40104
        CMP     r0, #-1
        SWINE   0
        MOV     r0, #126
        SWI     6               ; OS_Byte
        TEQ     r1, #&ff
        BNE     Start
        ADR     r0, EscapeError
        SWI     43              ; OS_GenerateError

EscapeError
        DCD     17
        DCB     "Escape",0

        END
