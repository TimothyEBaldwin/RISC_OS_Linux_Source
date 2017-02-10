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
FE_INVALID      * &01
FE_DIVBYZERO    * &02
FE_OVERFLOW     * &04
FE_UNDERFLOW    * &08
FE_INEXACT      * &10
FE_ALL_EXCEPT   * &1F

FE_TONEAREST    * 0

FE_Trap_pos     * 16
FE_Flag_pos     * 0

FE_DFL_ENV      * 0

FE_Default_FPSR * (FE_INVALID+FE_DIVBYZERO+FE_OVERFLOW) :SHL: FE_Trap_pos

        GET objmacs.s

        CodeArea

; int feclearexcept(int excepts)
        Function feclearexcept, leaf
        RFS     ip
        AND     a2, a1, #FE_ALL_EXCEPT
        BIC     ip, ip, a2
        WFS     ip
        BIC     a1, a1, #FE_ALL_EXCEPT
        Return  ,,LinkNotStacked

; int fegetexceptflag(fexcept_t *flagp, int excepts)
        Function fegetexceptflag, leaf
        RFS     ip
        AND     a3, a2, #FE_ALL_EXCEPT
        AND     ip, ip, a3
        STR     ip, [a1]
        BIC     a1, a2, #FE_ALL_EXCEPT
        Return  ,,LinkNotStacked

; int fesetexceptflag(const fexcept_t *flagp, int excepts)
        Function fesetexceptflag, leaf
        RFS     ip
        LDR     a1, [a1]
        AND     a3, a2, #FE_ALL_EXCEPT
        AND     a1, a1, a3
        BIC     ip, ip, a3
        ORR     ip, ip, a1
        WFS     ip
        BIC     a1, a2, #FE_ALL_EXCEPT
        Return  ,,LinkNotStacked

; int fetestexcept(int excepts);
        Function fetestexcept, leaf
        RFS     ip
        AND     a1, a1, #FE_ALL_EXCEPT
        AND     a1, ip, a1
        Return  ,,LinkNotStacked

; int fegetround(void)
        Function fegetround, leaf
        MOV     a1, #FE_TONEAREST
        Return  ,,LinkNotStacked

; int fesetround(int round)
        Function fesetround, leaf
        EOR     a1, a1, #FE_TONEAREST
        Return  ,,LinkNotStacked

;int fegetenv(fenv_t *envp)
        Function fegetenv, leaf
        RFS     ip
        STR     ip, [a1]
        Return  ,,LinkNotStacked

; int feholdexcept(fenv_t *envp)
        Function feholdexcept, leaf
        RFS     ip
        STR     ip, [a1]
        BIC     ip, ip, #FE_ALL_EXCEPT :SHL: FE_Flag_pos
        BIC     ip, ip, #FE_ALL_EXCEPT :SHL: FE_Trap_pos
        WFS     ip
        MOV     a1, #0
        Return  ,,LinkNotStacked

; int fesetenv(const fenv_t *envp)
        Function fesetenv, leaf
        TEQ     a1, #FE_DFL_ENV
        LDRNE   ip, [a1]
        MOVEQ   ip, #&00070000
        WFS     ip
        RFS     a1
        EOR     a1, a1, ip
        BIC     a1, a1, #&FF000000
        Return  ,,LinkNotStacked

; int feupdateenv(const fenv_t *envp)
        Function feupdateenv, leaf
        TEQ     a1, #FE_DFL_ENV
        LDRNE   ip, [a1]
        MOVEQ   ip, #&00070000
        RFS     a4                      ; read current status
        WFS     ip                      ; write new status
        RFS     a3                      ; check we wrote it successfully
        EOR     a3, a3, ip
        BICS    a1, a3, #&FF000000
        Return  ,,LinkNotStacked, NE    ; return nonzero if not
        AND     a1, a4, #FE_ALL_EXCEPT  ; a1 := previous exceptions
        ; fall through

; int feraiseexcept(int excepts)
        Function feraiseexcept, leaf
        ; Yuck. No easy way to do this. We need five sums that
        ; will generate each exception in turn.
        TST     a1, #FE_INVALID
        MVFNES  f0, #0
        DVFNES  f0, f0, #0
        TST     a1, #FE_DIVBYZERO
        MVFNES  f0, #1
        DVFNES  f0, f0, #0
        TST     a1, #FE_OVERFLOW
        LDFNES  f0, Huge
        MUFNES  f0, f0, #2              ; also generates inexact (allowed)
        BICNE   a1, a1, #FE_INEXACT
        TST     a1, #FE_UNDERFLOW
        LDFNES  f0, Tiny
        MUFNES  f0, f0, #0.5            ; also generates inexact (allowed)
        BICNE   a1, a1, #FE_INEXACT
        TST     a1, #FE_INEXACT
        LDFNES  f0, TwoToTwentyEight
        ADFNES  f0, f0, #1
        BIC     a1, a1, #FE_ALL_EXCEPT
        Return  ,,LinkNotStacked

TwoToTwentyEight
        DCD     &4D800000               ; 1.0 x 2^28
Tiny
        DCD     &00000001               ; smallest (subnormal) single
Huge
        DCD     &7F7FFFFF               ; largest single

        END
