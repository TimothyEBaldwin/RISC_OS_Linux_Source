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
; irqs.s
;
; The code from this source file has been taken from the ANC interrupt
; management code and from ART interrupt management code.
;
; See irqs.h for interface details
;
; NOTE:  Counter-intuitively, irqs_on matches restore_irqs and NOT
;        ensure_irqs_on.
;

        GET   Hdr:ListOpts
        GET   Hdr:Macros
        GET   Hdr:System
        GET   Hdr:APCS.<APCS>
        GET   Hdr:CPU.Arch

        EXPORT  irqs_off
        EXPORT  irqs_on

        EXPORT  ensure_irqs_off
        EXPORT  ensure_irqs_on
        EXPORT  restore_irqs

        GBLS    cond
        
        AREA    |AsmUtils$irqs$$Code|, CODE, READONLY, PIC

; ensure_irqs_off/ irqs_off:  Disable IRQs, returning a value
; suitable for passing to restore_irqs/irqs_on.
ensure_irqs_off
irqs_off
    [ NoARMv6
      [ :LNOT: (No32bitCode :LOR: No26bitCode)
        ; 32 or 26 bit selected at run time
        ; The 26 bit case preserves flags, so works with APCS-R (and APCS-32)
        TEQ     pc, pc
cond    SETS    "NE"
      |  
cond    SETS    "AL"
      ]
      [ :LNOT: No26bitCode
        AND$cond   r0, lr, #I_bit
        ORR$cond.S pc, lr, #I_bit
      ]
      [ :LNOT: No32bitCode
        MRS     r0, CPSR
        ORR     r1, r0, #I32_bit        ; set IRQs
        TEQ     r0, r1                  ; any change?
        MSRNE   CPSR_c, r1              ; disable IRQs if enabled before
        AND     r0, r0, #I32_bit        ; return previous state of bit
        Return  ,LinkNotStacked
      ]
    |
        ; Skipping the CPS is faster if we know IRQs are already off, although
        ; it does put us at the mercy of branch prediction.
        MRS     r0, CPSR
        ANDS    r0, r0, #I32_bit
        Return  ,LinkNotStacked,NE
        CPSID   i
        Return  ,LinkNotStacked
    ]

; restore_irqs/irqs_on:  Re-enable IRQs if they were enabled prior to
; the earlier call to ensure_irqs_off/ensure_irqs_on/irqs_off
restore_irqs
irqs_on
      [ :LNOT: (No32bitCode :LOR: No26bitCode)
        ; 32 or 26 bit selected at run time
        ; The 26 bit case preserves flags, so works with APCS-R (and APCS-32)
        TEQ     pc, pc
cond    SETS    "NE"
      |  
cond    SETS    "AL"
      ]
      [ :LNOT: No26bitCode
        BIC$cond   lr, lr, #I_bit
        ORR$cond.S pc, lr, r0
      ]
      [ :LNOT: No32bitCode
        MRS     r1, CPSR                ; obtain current PSR
        BIC     r2, r1, #I32_bit        ; clear IRQ bit
        ORR     r2, r2, r0              ; restore state from parameter
        TEQ     r1, r2                  ; changed?
        MSRNE   CPSR_c, r2              ; update PSR if it has changed
        Return  ,LinkNotStacked
      ]

; ensure_irqs_on:  Enable IRQs, returning a value
; suitable for passing to restore_irqs/irqs_on
ensure_irqs_on
    [ NoARMv6
      [ :LNOT: (No32bitCode :LOR: No26bitCode)
        ; 32 or 26 bit selected at run time
        ; The 26 bit case preserves flags, so works with APCS-R (and APCS-32)
        TEQ     pc, pc
cond    SETS    "NE"
      |  
cond    SETS    "AL"
      ]
      [ :LNOT: No26bitCode
        AND$cond   r0, lr, #I_bit
        BIC$cond.S pc, lr, #I_bit
      ]
      [ :LNOT: No32bitCode
        MRS     r0, CPSR
        BIC     r1, r0, #I32_bit        ; enable IRQs
        TEQ     r0, r1                  ; any change?
        MSRNE   CPSR_c, r1              ; enable IRQs if disabled before
        AND     r0, r0, #I32_bit        ; return previous state of bit
        Return  ,LinkNotStacked
      ]
    |
        ; Skipping the CPS is faster if we know IRQs are already on, although
        ; it does put us at the mercy of branch prediction.
        MRS     r0, CPSR
        ANDS    r0, r0, #I32_bit
        Return  ,LinkNotStacked,EQ
        CPSIE   i
        Return  ,LinkNotStacked
    ]

        END
