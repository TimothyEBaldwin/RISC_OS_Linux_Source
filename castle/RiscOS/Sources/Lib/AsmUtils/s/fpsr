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
; Title:   s.fpsr
; Purpose: Allows floating point status register to be manipulated
; Authors: KJB, ADH
; History: 20-Apr-98: Created
;          10-Feb-00: Imported to AsmUtils
;

; Read/write the FPSR. Lots of useful definitions are in fpsr.h.

        AREA    |asmutils$fpsr$$Code|,CODE,READONLY,PIC

        GET     hdr:ListOpts
        GET     hdr:Macros
        GET     hdr:System
        GET     hdr:Machine.<Machine>
        GET     hdr:APCS.<APCS>

        EXPORT  fpsr_manipulate

; unsigned int fpsr_manipulate(unsigned int eor, unsigned int mask);

fpsr_manipulate
        RFS     a3
        BIC     a4, a3, a2
        EOR     a4, a4, a1
        WFS     a4

        MOV     a1,a3

        Return  ,LinkNotStacked
        END
