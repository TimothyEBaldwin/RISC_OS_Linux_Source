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
; osvarlen - length of a system variable variable
; originally written by Jonathan Coxhead, 15th Aug 1995

        GET     hdr:ListOpts
        GET     hdr:Macros
        GET     hdr:System
        GET     hdr:Machine.<Machine>
        GET     hdr:APCS.<APCS>

        AREA    |osvarlen$$code|, CODE, READONLY, PIC

        EXPORT  osvarlen
osvarlen ROUT
;Entry  R0 -> name of a variable
;       R1 = variable type (os_VARTYPE_EXPANDED or 0)
;Exit   R0 = length of variable value, or -1 if not found
        FunctionEntry "v1"
        MOV     R4, R1
        MOV     R3, #0
        MOV     R2, #1 << 31
        MOV     R1, #0
        SWI     XOS_ReadVarVal
        ;Ignore error
        MVN     R0, R2
        Return  "v1"

        END
