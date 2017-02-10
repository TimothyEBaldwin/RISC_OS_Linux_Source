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
; Title:   s.wclosedown
; Purpose: wimp close down
; Author:  NK
; History: 31-Aug-94: NK : Created
;

; APCS compliant, a1-a4 (R0-R3) may be corrupted

; to save stacking, use a4 as a temporary link register
; unless we know the SWI will corrupt it.

XWimp_closedown        * &600dd

        EXPORT  |wimp_close_down|

        AREA    |C$$Code|, CODE, READONLY

        GET     hdr.apcs


; returns kernel_oserror
wimp_close_down
        MOV     r3,lr
        LDR     r1,=&4b534154
        SWI     XWimp_closedown
        MOVVC   r0,#0
        MOVRet  r3

        END

