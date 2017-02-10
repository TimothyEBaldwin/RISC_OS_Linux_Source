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
; escape.s
;
        GET   Hdr:ListOpts
        GET   Hdr:Macros
        GET   Hdr:System
        GET   Hdr:APCS.<APCS>

; extern unsigned int escape_check(void);
; extern unsigned int escape_check_ack(void);
; extern unsigned int escape_check_clear(void);

        AREA    |AsmUtils$escape1$$Code|, CODE, READONLY, PIC

        EXPORT  escape_check
escape_check
        FunctionEntry
        SWI     XOS_ReadEscapeState
        MOV     r0, #0
        ADC     r0, r0, r0
        Return

        AREA    |AsmUtils$escape2$$Code|, CODE, READONLY, PIC

        EXPORT  escape_check_clear
        EXPORT  escape_check_ack
escape_check_clear
        MOV     r0, #124
        B       escape_common
escape_check_ack
        MOV     r0, #126
escape_common
        FunctionEntry
        SWI     XOS_ReadEscapeState
        MOVS    r3, r3, RRX           ; C->R3:31, N=C
        SWIMI   XOS_Byte
        MOV     r0, r3, LSR #31
        Return

        END
