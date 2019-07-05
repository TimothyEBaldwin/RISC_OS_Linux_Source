; Assembler source for FPA support code and emulator
; ==================================================
; Routines to do transcendental functions - versions optimised for hardware.
;
; Copyright (C) Advanced RISC Machines Limited, 1992-7 (now named ARM Limited).
; All rights reserved.
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
;
;     * Redistributions of source code must retain the above copyright notice,
;       this list of conditions and the following disclaimer.
;     * Redistributions in binary form must reproduce the above copyright
;       notice, this list of conditions and the following disclaimer in the
;       documentation and/or other materials provided with the distribution.
;     * Neither the name of Advanced RISC Machines Limited nor ARM Limited nor
;       the names of its contributors may be used to endorse or promote
;       products derived from this software without specific prior written
;       permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; POSSIBILITY OF SUCH DAMAGE.

        [ :LNOT:NoTranscendentals       ;Scope: this entire source file

;===========================================================================

; These routines work on numbers in the standard internal format. See
; "src.fpadefs" for a description of this format.

;===========================================================================

; Generating rounding information for these operations is a rather suspect
; business, given the general lack of knowledge of how inaccurate they can
; be! But we do need to make some attempt, since the standard interfaces to
; arithmetic routines require rounding information to be returned. The
; general technique used is (a) start by dealing with any exact cases;
; (b) assuming the result is inexact, calculate it with the final operation
; being rounded to minus infinity or zero, depending on what we know about
; the sign at the time, and set the sticky bit to 1; (c) if we care about
; the round bit - i.e. if we're rounding to nearest in extended precision -
; determine the round bit by repeating the final calculation, rounding to
; nearest: if the answer is the same as the one we got before, the round bit
; is zero, and if it is different, the round bit is one.

;===========================================================================

; The following routine does MOD-style range reduction on a floating point
; value by the technique recommended in Cody & Waite, chapters 6, 8 and 9.
; The inputs are the floating point value to be range-reduced and the
; modulus for the range reduction; the outputs are the nearest integer to
; the quotient (value)/(modulus) and the remainder from this division. The
; tricky point about this is that the modulus is represented to higher than
; extended precision.
;   An error is returned if (value)/(quotient) overflows an integer: this
; generally implies that massive error in the result of the function being
; evaluated will occur. (A possible future improvement is to use the RMF
; function or something similar to do the range reduction in this case.)
;   The technique for achieving higher precision in the answer is as
; follows:
;
;   Let X be the value to be range-reduced, and M be the modulus of the
;   range-reduction. Represent M as the sum of two floating point values
;   M1 and M2, such that M1 is the more significant of the two and M1 times
;   any integer is exact. We also require an extended precision
;   approximation R of the reciprocal of M. Then the following sequence of
;   calculations is performed:
;
;     IF (X*R overflows an integer) THEN
;       Return error;
;     ELSE
;       N := X*R, rounded to nearest integer;
;       XN := FLOAT(N);
;       X := X - XN * M1;
;       X := X - XN * M2;
;       Return (N,X);
;     ENDIF
;
;   The key to this technique is that the calculation X - XN * M1 is
;   guaranteed to be exact: the product XN * M1 is exact, of the same sign
;   as X, and either zero or within a factor of 2 of the magnitude of X.
;   Because IEEE arithmetic has a guard bit, this is enough to guarantee
;   that the subtraction is exact. So the overall effect is that we get X -
;   XN * (M1+M2), rounded once only at the end of the calculation; since
;   M1+M2 can be more accurate than an extended precision number by the
;   number of significant bits in M1, we have reduced X by a number
;   represented to more than extended precision.
;
;   Note that, as observed in Cody & Waite, the more sophisticated
;   calculation X1 := INT(X), X2 := X - X1; X := ((X1-XN*M1) + X2) - XN*M2
;   is only required if the basic arithmetic routines do not use a guard
;   bit. The old emulator's use of this calculation is wasted effort!
;
; This procedure does *not* use the stack: this is essential to keep
; core_abort working.
;
; Entry: Rtmp points to a block of 3 floating point numbers in internal
;          format, with these three numbers being R, M1 and M2 in that
;          order;
;        Rtmp2 = return link;
;        F0 = X;
;        FPSR cumulative bits are clear;
;
; Exit:  If no error:
;          Rarith = N;
;          Rtmp corrupt;
;          F0 = new X;
;          F1 = floating point version of N;
;          F2-F4 corrupt;
;          FPSR cumulative bits are still clear, except possibly for
;            underflow and inexact;
;          EQ condition set.
;        If error:
;          Rtmp corrupt;
;          FPSR cumulative bits may be in any state;
;          NE condition set.

RangeRedByMod

; Get the three range-reduction parameters and do the limit check.

        LFM     F2,3,[Rtmp]     ;F2 := R, F3 := M1, F4 := M2

; Multiply by R and convert to an integer. If we get overflow during the
; multiplication or an invalid operation from the FIX, we've got an error
; and will fall through to the return.

        MUFE    F1,F0,F2
        FIX     Rarith,F1
        RFS     Rtmp
        TST     Rtmp,#IOC_bit+OFC_bit

; If no error, convert the integer back to a floating point number and do
; the multiplications and subtractions.

        FLTEQE  F1,Rarith
        MUFEQE  F2,F1,F3
        SUFEQE  F0,F0,F2
        MUFEQE  F2,F1,F4
        SUFEQE  F0,F0,F2

; Return.

        MOV     PC,Rtmp2

;===========================================================================

; Routine to evaluate a polynomial in the floating point number in F1,
; putting the answer in F2.
;   Note this routine does *not* use the stack: this is essential to keep
; core_abort working.
;
; Entry: Rtmp points to a list of polynomial coefficients, starting with
;          that of the highest power of F1 involved;
;        Rarith indicates how many coefficients there are (must be at least
;          two);
;        Rtmp2 is the return link;
;        F1 is the argument.
;
; Exit:  F2 is the result;
;        Rtmp, Rarith and F3 are corrupt.
;
; The value to be calculated is:
;   (...((coeff1 * F1 + coeff2) * F1 + coeff3)... + coeffN) * F1

PolynomialOfF1InF2

        LFM     F2,1,[Rtmp],#12
        SUB     Rarith,Rarith,#1

PolynomialOfF1InF2_Loop

        LFM     F3,1,[Rtmp],#12
        MUFE    F2,F2,F1
        ADFE    F2,F2,F3
        SUBS    Rarith,Rarith,#1
        BNE     PolynomialOfF1InF2_Loop

        MUFE    F2,F2,F1
        MOV     PC,Rtmp2

;===========================================================================

; Routine to evaluate a polynomial in the floating point number in F1,
; putting the answer in F4.
;   Note this routine does *not* use the stack: this is essential to keep
; core_abort working.
;
; Entry: Rtmp points to a list of polynomial coefficients, starting with
;          that of the highest power of F1 involved;
;        Rarith indicates how many coefficients there are (must be at least
;          one);
;        Rtmp2 is the return link;
;        F1 is the argument.
;
; Exit:  F4 is the result;
;        Rtmp, Rarith and F3 are corrupt.
;
; This differs from 'PolynomialOfF1InF2' above in that the polynomial
; calculated is:
;   (...((F1 + coeff1) * F1 + coeff2)... + coeff(N-1)) * F1 + coeffN

PolynomialOfF1InF4

        LFM     F3,1,[Rtmp],#12
        ADFE    F4,F1,F3
        SUBS    Rarith,Rarith,#1
        MOVEQ   PC,Rtmp2

PolynomialOfF1InF4_Loop

        LFM     F3,1,[Rtmp],#12
        MUFE    F4,F4,F1
        ADFE    F4,F4,F3
        SUBS    Rarith,Rarith,#1
        BNE     PolynomialOfF1InF4_Loop
        MOV     PC,Rtmp2

;===========================================================================

        [ DoIntegerPowers

Pow_Integer_Special

; The following code is placed out of normal sequence for addressability
; reasons.
;
; The following code evaluates POW and RPW instructions for the special case
; of raising to a small integer power. We know at this point that we're
; expected to calculate F0^F1, with F1 an integer in the range -2^16+1 to
; +2^16-1, F1 not zero, and with the sign of the result to be changed to the
; bottom bit of OP2mhi (which is necessarily 0 or 1).
;   If this calculation overflows or underflows, we will simply revert to
; the standard technique.
;
; Initialise the result in F2, put the integer power in Rtmp and its
; absolute value in Rtmp2.

        MVFE    F2,#1
        FIX     Rtmp,F1
        EORS    Rtmp2,Rtmp,Rtmp,ASR #32         ;Tricky ABS, to save an
        ADC     Rtmp2,Rtmp2,#0                  ; instruction

; Locate the top set bit in Rtmp2.

        MOV     Rarith,#1:SHL:15

Pow_Integer_Special_Loop1

        TST     Rtmp2,Rarith
        MOVEQ   Rarith,Rarith,LSR #1
        BEQ     Pow_Integer_Special_Loop1

; Split according to whether we've got to do divisions or multiplications.

        CMP     Rtmp,#0
        BLT     Pow_Integer_Special_DivideLoopEntry
        B       Pow_Integer_Special_MultiplyLoopEntry

; Evaluate by repeated multiplications.

Pow_Integer_Special_MultiplyLoop

        MUFE    F2,F2,F2
        TST     Rtmp2,Rarith,LSL #1
        MUFNEE  F2,F2,F0

Pow_Integer_Special_MultiplyLoopEntry

        MOVS    Rarith,Rarith,LSR #1
        BNE     Pow_Integer_Special_MultiplyLoop

; Do last multiplication, rounding towards zero and to nearest to get
; rounding information.

        MUFE    F3,F2,F2
        TST     Rtmp2,#1
        MUFEQEZ F2,F2,F2
        MUFNEEZ F2,F3,F0
        MUFNEE  F3,F3,F0
        B       Pow_Integer_Special_Common

; Evaluate by repeated divisions and multiplications.

Pow_Integer_Special_DivideLoop

        MUFE    F2,F2,F2
        TST     Rtmp2,Rarith,LSL #1
        DVFNEE  F2,F2,F0

Pow_Integer_Special_DivideLoopEntry

        MOVS    Rarith,Rarith,LSR #1
        BNE     Pow_Integer_Special_DivideLoop

; Do last multiplication/division, rounding towards zero and to nearest to
; get rounding information.

        MUFE    F3,F2,F2
        TST     Rtmp2,#1
        MUFEQEZ F2,F2,F2
        DVFNEEZ F2,F3,F0
        DVFNEE  F3,F3,F0

Pow_Integer_Special_Common

; If we've had overflow or underflow, re-evaluate by the standard technique.

        RFS     Rtmp
        TST     Rtmp,#OFC_bit+UFC_bit
        BNE     Pow_StandardCalc

; The result is in F2, with rounding information given by whether the
; calculation has been exact and whether F2 = F3.

        CMF     F2,F3
        MOVEQ   Rarith,#&40000000
        MOVNE   Rarith,#&C0000000
        TST     Rtmp,#IXC_bit
        MOVEQ   Rarith,#0
        MVFE    F0,F2
        B       Exp_GotAnswer

        ]

;===========================================================================

; The coefficients of the polynomials used to evaluate logarithms.

LgnLogA_PolyCoeffs
        DCD     &80003FFE,&CA20AD9A,&B5E946E9   ;a2
        DCD     &00004003,&83125100,&B57F6509   ;a1
        DCD     &80004005,&803FF895,&9DACD228   ;a0
LgnLogA_PolyEnd

LgnLogA_PolyLen EQU     (LgnLogA_PolyEnd - LgnLogA_PolyCoeffs)/12

LgnLogB_PolyCoeffs
        DCD     &80004004,&8EAC025B,&3E7076BB   ;b2
        DCD     &00004007,&9C041FD0,&A933EF60   ;b1
        DCD     &80004008,&C05FF4E0,&6C83BB96   ;b0
LgnLogB_PolyEnd

LgnLogB_PolyLen EQU     (LgnLogB_PolyEnd - LgnLogB_PolyCoeffs)/12

; LGN(2) to high precision. We make enough bits at the bottom of each part
; of it zero to allow exact multiplication by any exponent.

LgnTwo_HighPrec DCD     &00003FFE,&B17217F7,&D1CF0000
                DCD     &00003FCD,&F35793C0,&00000000

; Other constants used in calculating LGN/LOG.

SqrtHalf        DCD     &00003FFE,&B504F333,&F9DE6484   ;SQT(0.5)

LogOfE          DCD     &00003FFD,&DE5BD8A9,&37287195   ;LOG(e)

;===========================================================================

; The following routine calculates logarithms to base e and base 10. As
; usual for these routines, its entry point has two labels, one for the
; FPASC, the other for the FPE.
;   The value returned is either a numeric value plus associated rounding
; information, with the uncommon bit clear, or an infinity or NaN, with the
; uncommon bit set.
;   This routine will not work correctly with an input which is an
; unnormalised URD result, or an invalid internal format number.
;
; Uses standard monadic operation entry and exit conventions - see top of
; "src.core.arith" for details.

        [ FPEWanted
LgnLogFPE
        ]

        [ SCWanted
LgnLogSC
        ]

        CDebug3 3,"LgnLogSC/FPE: operand =",OP1sue,OP1mhi,OP1mlo

; Split uncommon values from common values.

        TST     OP1sue,#Uncommon_bit
        BNE     LgnLog_Uncommon

; Check for zero and produce a divide-by-zero error if found.

        ORRS    Rtmp,OP1mhi,OP1mlo
        BEQ     DivideByZero1

; If the operand is negative, we've got an invalid operation.

        TST     OP1sue,#Sign_bit
        MOVNE   Rtmp,#InvReas_LgnLogNeg
        ; Don't set Rarith - we don't care what the NaN's sign bit is
        BNE     InvalidOp1ForSDE

; Split out the number's exponent.

        AND     RNDexp,OP1sue,#ToExp_mask       ;Get biased exponent

LgnLog_Numeric

; We're taking the logarithm of a positive numeric value. Change the
; number's mantissa into a floating point number in the range 0.5 to 1, and
; rebias exponent relative to -1.

        MOV     OP1sue,#(EIExp_bias-1):AND:&FF00
        ORR     OP1sue,OP1sue,#(EIExp_bias-1):AND:&FF   ;Generate biased
        ASSERT  (EIExp_bias-1) < &10000                 ; exponent of -1
        SUB     RNDexp,RNDexp,OP1sue                    ;Re-bias exponent

; Make some registers available and transfer the mantissa to F0.

        STMFD   Rsp!,{LR}

        EnterRecursive 5,12,Rtmp2
        STMIA   Rtmp2,OP1regs
        LFM     F0,1,[Rtmp2]

; Look out for exact cases. If this is an LGN instruction, we merely have to
; test for equality with 1.0. If it is a LOG instruction, we have to check
; against the "exact powers of ten" table in $CoreDir.ldst.

        TST     Rins,#LOGnotLGN_bit
        BEQ     LgnLog_TestExactLgn

LgnLog_TestExactLog

; We'll produce a prospective answer from the exponent in RNDexp: experiment
; has shown that the function (19*(RNDexp+1)) >> 6 will correctly identify
; the only possible table entry in every case. Note that we know the
; exponent isn't enormous, so we don't need to worry about overflow during
; the calculations.

        ADD     Rtmp,RNDexp,#1
        ADD     Rtmp2,Rtmp,Rtmp,LSL #2  ;5*(RNDexp+1)
        RSB     Rtmp2,Rtmp,Rtmp2,LSL #2 ;19*(RNDexp+1)
        MOV     Rtmp2,Rtmp2,ASR #6      ;The potential power of 10.
        CMP     Rtmp2,#PowersOfTenTable_Size
        BCS     LgnLog_Inexact

; Load the prospective entry and see whether it is equal to the argument.

        ADRL    Rtmp,PowersOfTenTable
        ADD     Rtmp,Rtmp,Rtmp2,LSL #4
        LDMIA   Rtmp,{OP2mhi,OP2mlo,Rtmp}       ;Use whatever regs we've got!
        ASSERT  OP2mhi < OP2mlo
        ASSERT  OP2mlo < Rtmp
        TEQ     OP1mlo,Rtmp
        TEQEQ   OP1mhi,OP2mlo
        SUBEQ   OP2mhi,OP2mhi,RNDexp
        TEQEQ   OP1sue,OP2mhi
        BNE     LgnLog_Inexact

; It matches, so the answer is in Rtmp2.

        MOV     Rarith,#0
        FLTS    F1,Rtmp2
        B       LgnLog_GotAnswer

LgnLog_TestExactLgn

; This is easy - we just have to test for an argument of 1.

        CMP     RNDexp,#1
        CMFEQ   F0,#0.5
        MOVEQ   Rarith,#0
        MVFEQE  F1,#0
        BEQ     LgnLog_GotAnswer

LgnLog_Inexact

; The algorithm used in what follows comes from Cody & Waite, chapter 5,
; with some modifications to get some sort of rounding information.
;   We've currently got f in F0 and N in RNDexp.

        LDFE    F1,SqrtHalf
        CMF     F0,F1

; If in range 0.5 to SQT(0.5), decrement exponent and calculate ZNUM in F0.

        SUBLE   RNDexp,RNDexp,#1        ;LE is ?<=: "?" doesn't matter
        SUFLEE  F0,F0,#0.5

; Calculate ZDEN in F1 in both cases.

        MUFE    F1,F0,#0.5
        ADFE    F1,F1,#0.5

; If in range SQT(0.5) to 1.0, calculate ZNUM in F0. Note that due to the
; accuracy of IEEE arithmetic, we can simply subtract 1 in one go rather
; than subtracting 0.5 twice.

        SUFGTE  F0,F0,#1                ;GT is NOT(?<=): "?" doesn't matter

; Now determine z = ZNUM/ZDEN in F0 and w = z^2 in F1.

        DVFE    F0,F0,F1
        MUFE    F1,F0,F0

; Do the rational approximation. First calculate w * A(w).

        ADR     Rtmp,LgnLogA_PolyCoeffs ;Produce polynomial of w
        MOV     Rarith,#LgnLogA_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF2      ; link register

; Then B(w) and divide w*A(w) by B(w).

        ADR     Rtmp,LgnLogB_PolyCoeffs ;Produce polynomial of w
        MOV     Rarith,#LgnLogB_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF4      ; link register

        DVFE    F2,F2,F4

; The result of the rational approximation is now F0 + F0*F2. Perform this
; calculation, rounding to nearest (to minimise the error if we add anything
; further to the result).

        MUFE    F1,F2,F0
        ADFE    F1,F1,F0

; If the exponent in RNDexp is zero, we're not going to make any further
; adjustments to the result, so we should determine rounding information
; now if this is an LGN instruction.

        TEQ     RNDexp,#0
        BNE     LgnLog_AddNTimesConstant

        TST     Rins,#LOGnotLGN_bit
        BNE     LgnLog_AdjustForLog

        MUFEZ   F2,F2,F0
        ADFEZ   F0,F2,F0
        CMF     F1,F0
        MOVEQ   Rarith,#&40000000
        MOVNE   Rarith,#&C0000000
        MVFNEE  F1,F0
        B       LgnLog_GotAnswer

LgnLog_AddNTimesConstant

; We've got to add RNDexp times a high precision constant to the answer.

        CDebug1 4,"Adding LGN(2) times",RNDexp

        FLTE    F0,RNDexp

Tempa   SETA            :BASE:LgnTwo_HighPrec
        [ Tempa = 15
Tempa2    SETA            LgnTwo_HighPrec-({PC}+8)
        |
Tempa2    SETA            :INDEX:LgnTwo_HighPrec
        ]
        LFM     F2,2,[R$Tempa,#Tempa2]  ;F2 := high part of LGN(2)
                                        ;F3 := low part of LGN(2)

        MUFE    F2,F2,F0
        MUFE    F3,F3,F0

; We do this addition carefully, in order to get reasonable rounding
; information. Note that we know the value we're adding is larger in
; magnitude than F1: this allows us to determine the error involved
; accurately.

        ADFE    F0,F1,F2                ;First approximation
        SUFE    F2,F0,F2
        SUFE    F2,F2,F1                ;Error from addition
        ADFE    F2,F2,F3                ;Add in low part of addend to
                                        ; produce total error
        ADFE    F1,F0,F2                ;Make the answer

; If this is a LOG, move on to final calculation. Otherwise generate
; rounding information.

        TST     Rins,#LOGnotLGN_bit
        BNE     LgnLog_AdjustForLog

        ADFEZ   F0,F0,F2
        CMF     F1,F0
        MOVEQ   Rarith,#&40000000
        MOVNE   Rarith,#&C0000000
        MVFNEE  F1,F0
        B       LgnLog_GotAnswer

LgnLog_AdjustForLog

; Do the final multiplication for a LOG instruction. All LOGs have their
; rounding information determined here.

        MVFE    F2,F1
        LDFE    F0,LogOfE
        MUFEZ   F1,F0,F2

        MOV     Rarith,#&40000000
        TST     Rins,#Pr2_mask+RM_mask
        BNE     LgnLog_GotAnswer
        TST     Rins,#Pr1_mask
        MUFNEE  F0,F0,F2
        CMFNE   F0,F1
        MOVNE   Rarith,#&C0000000

LgnLog_GotAnswer

; Transfer the result in F1 back to OP1regs and exit the recursive region.

        ExitRecursive 5,12,Rtmp2,F1,OP1regs

; We know that the result will be common, so we need to split the sign from
; the exponent.

        AND     RNDexp,OP1sue,#ToExp_mask
        AND     OP1sue,OP1sue,#Sign_bit

; Then return.

        LDMFD   Rsp!,{PC}

LgnLog_Uncommon

; We have to deal with the LGN or LOG of an uncommon value. The cases are:
;
;   * The LGN or LOG of a signalling NaN is an invalid operation;
;
;   * The LGN or LOG of a quiet NaN is the NaN itself;
;
;   * The LGN or LOG of plus infinity is plus infinity;
;
;   * The LGN or LOG of minus infinity is an invalid operation;
;
;   * The LGN or LOG of an extended unnormalised zero gives a monadic
;     divide-by-zero exception;
;
;   * The LGN or LOG of a denormalised number or extended unnormalised
;     number can be determined by transforming it into a normalised number
;     (possibly with an out-of-range exponent), then using the standard
;     LGN/LOG code above.
;
; So the first thing we do is check for NaNs and infinities - if we find
; one, we'll generate the result by special case code. Note that we check
; for them together, since they have similar bit patterns.

        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op is NaN/inf)
        BMI     LgnLog_NaNInf

; Now if the operand is a zero, the result is a monadic divide-by-zero
; exception. We can detect zeros by the mantissa being all zero, since only
; zeros, some unnormalised URD results, extended unnormalised zeros and
; extended infinities have this property, we're assuming the operand is not
; a URD result and we've already dealt with extended infinities.

        ORRS    Rtmp,OP1mhi,OP1mlo
        BEQ     DivideByZero1

; The operand is now a denormalised number or extended unnormalised non-zero
; number. If it is negative, we've got an invalid operation exception.
; Otherwise, we now know that no invalid operation or divide-by-zero
; exception is going to occur, so we can convert it to a normalised number,
; possibly with a negative biased exponent. After doing the exponent and
; sign calculations, we then use the code above to complete the calculation.
;   The types of numbers that require converting are extended unnormalised
; numbers and denormalised numbers of all precisions. In the case of the
; extended denormalised and unnormalised numbers, this just requires us to
; normalise them; in the case of the single and double denormalised numbers,
; we need to clear their units bits and add 1 to their exponents before we
; normalise them.
;   At this stage, we can recognise that the numbers are single or double
; denormalised numbers simply by the fact that they have a units bit of 1:
; all other numbers with this property are NaNs or infinities and have
; been dealt with already.

        AND     RNDexp,OP1sue,#ToExp_mask ;Extract operand exponent

        TST     OP1sue,#Sign_bit
        MOVNE   Rtmp,#InvReas_LgnLogNeg
        ; Don't set Rarith - we don't care what the NaN's sign bit is
        BNE     InvalidOp1ForSDE

        STMFD   Rsp!,{LR}       ;We will have subroutine calls below

        TST     OP1mhi,#EIUnits_bit
        BICNE   OP1mhi,OP1mhi,#EIUnits_bit
        ADDNE   RNDexp,RNDexp,#1

        BL      NormaliseOp1            ;NB must be necessary, so no
                                        ; point in checking whether
                                        ; normalised

        LDMFD   Rsp!,{LR}
        B       LgnLog_Numeric

LgnLog_NaNInf

; The operand is a NaN or infinity. If it's a NaN, we use the standard
; rules for propagating NaNs. If an infinity, we've got an invalid operation
; if it is negative and a result equal to the standard plus infinity if it
; is positive.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1 ;Is operand a NaN?
        BNE     ConvertNaN1             ;Use standard exception/quiet NaN
                                        ; propagation code if so
        TST     OP1sue,#Sign_bit
        MOVNE   Rtmp,#InvReas_LgnLogNeg
        ; Don't set Rarith - we don't care what the NaN's sign bit is
        BNE     InvalidOp1ForSDE
        ADRL    OP1sue,Prototype_Infinity
        LDMIA   OP1sue,OP1regs
        MOV     PC,LR

;===========================================================================

; EXP range reduction parameters. (MOD-style range reduction, dividing by
; ln(2)).

Exp_RangeRedParams
        DCD     &00003FFF,&B8AA3B29,&5C17F0BC   ;1/ln(2) to extended prec.
        DCD     &00003FFE,&B1800000,&00000000   ;M1 = 0.693359375 exactly
        DCD     &80003FF2,&DE8082E3,&08654362   ;M2 = ln(2)-M1 to ext. prec.

; The coefficients of the polynomials used to evaluate EXP on the range
; -ln(2)/4 to ln(2)/4, used in turn to evaluate EXP in general.

ExpP_PolyCoeffs
        DCD     &00003FF1,&845A2157,&3490F106   ;2*p2
        DCD     &00003FF8,&F83A5F91,&50952C99   ;2*p1
ExpP_PolyEnd

ExpP_PolyLen    EQU     (ExpP_PolyEnd - ExpP_PolyCoeffs)/12

ExpQ_PolyCoeffs
        DCD     &00003FEB,&C99B1867,&2822A93E   ;2*q3
        DCD     &00003FF5,&A57862E1,&46A6FB39   ;2*q2
        DCD     &00003FFB,&E8B9428E,&FECFF592   ;2*q1
ExpQ_PolyEnd

ExpQ_PolyLen    EQU     (ExpQ_PolyEnd - ExpQ_PolyCoeffs)/12

; Other constants used in generating EXP.

TwoToMinus66    DCD     &00003FBD,&80000000,&00000000   ;2^(-66)

HalfMinusEps    DCD     &00003FFD,&FFFFFFFF,&FFFFFFFF   ;1/2-2^(-65)

;===========================================================================

; The following routine calculates the exponent function. As usual for these
; routines, its entry point has two labels, one for the FPASC, the other for
; the FPE.
;   The value returned is either a numeric value plus associated rounding
; information, with the uncommon bit clear, or an infinity or NaN, with the
; uncommon bit set.
;   This routine will not work correctly with an input which is an
; unnormalised URD result, or an invalid internal format number.
;
; Uses standard monadic operation entry and exit conventions - see top of
; "src.core.arith" for details.

        [ FPEWanted
ExpFPE
        ]

        [ SCWanted
ExpSC
        ]

        CDebug3 3,"ExpSC/FPE: operand =",OP1sue,OP1mhi,OP1mlo

; Split uncommon values from common values.

        TST     OP1sue,#Uncommon_bit
        BNE     Exp_Uncommon

Exp_Numeric

; We're doing an EXP on a numeric value. Unless it is a zero, we'll do this
; by some internal floating point calculations and the result is inexact.
;
; If it is a zero, the result is exactly EXP(0) = 1.

        ORRS    Rarith,OP1mhi,OP1mlo    ;Also sets rounding info if branch
        BEQ     Exp_Zero                ; taken

; Put the sign of the argument in OP2mlo - we will want it later in the case
; of massive overflow/underflow.

        MOV     OP2mlo,OP1sue

; Make some registers available and transfer the operand to F0.

        STMFD   Rsp!,{LR}

        EnterRecursive 5,12,Rtmp2
        STMIA   Rtmp2,OP1regs
        LFM     F0,1,[Rtmp2]

        MOV     OP2mhi,#0       ;Result is positive

Exp_PowEntryPoint               ;POW also uses this code from here on

; The algorithm used in what follows comes from Cody & Waite, chapter 6.
;
; We will use range reduction to transform the general EXP problem to that
; of taking a EXP on the range -ln(2)/2 to ln(2)/2, ending by adding an
; integer to the exponent.
;   If we get a quotient outside the range -2^16 to 2^16-1, we've definitely
; got massive overflow/underflow: all we have to do is produce some result
; that will cause this effect.

        ADR     Rtmp,Exp_RangeRedParams
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       RangeRedByMod           ; link register
        ADDEQ   Rtmp,Rarith,#1:SHL:16   ;If no overflow so far, check for
        MOVEQS  Rtmp,Rtmp,LSR #17       ; range -2^16 to 2^16-1
        BNE     Exp_MassiveOverUnderflow
        ADD     Rarith,Rarith,#1        ;Final exponent adjustment is the
        ORR     OP2mhi,OP2mhi,Rarith,LSL #1 ; quotient plus 1

; To avoid underflow problems, we separate out the case of F0 being very
; small. If it is sufficiently small that adding F0 + F0^2/2 + ... to 1 is
; not going to make any significant difference to 1, then the answer can be
; taken as being:
;
; * 1.0 with a round bit of 0 and a sticky bit of 1 if F0 is positive;
;
; * 1.0-epsilon with round and sticky bits both 1 if F0 is negative;
;
; This happens if ABS(F0 + F0^2/2 + F0^3/6 + ...) < 2^(-65), which will
; certainly happen if F0 < 2^(-66).

        LDFE    F1,TwoToMinus66
        ABSE    F2,F0
        CMF     F2,F1
        BLT     Exp_Small               ;LT is ?<: "?" doesn't matter

; From here on, we know the calculation will not underflow or overflow.
; Evaluate z = g^2 = F0^2, then the polynomial 2*Q(z) (See Cody & Waite).
; Since the base of IEEE arithmetic is 2, we don't need to counteract
; wobbling precision in the way suggested in Cody & Waite: I have therefore
; multiplied both these polynomials by 2 to make the code slightly cleaner.

        MUFE    F1,F0,F0                ;Produce square of argument

        ADR     Rtmp,ExpQ_PolyCoeffs    ;Produce polynomial of argument^2
        MOV     Rarith,#ExpQ_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF2      ; link register
        ADFE    F4,F2,#1                ;Add in 2*q0

; Now evaluate 2*g*P(z).

        ADR     Rtmp,ExpP_PolyCoeffs    ;Produce polynomial of argument^2
        MOV     Rarith,#ExpP_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF2      ; link register
        ADFE    F2,F2,#0.5              ;Add in 2*p0
        MUFE    F2,F2,F0                ;Multiply by g

; We're about to do the final calculation involved in producing the answer.
; At this point, we need to try to produce rounding information.

        SUFE    F4,F4,F2
        DVFE    F1,F2,F4
        ADFEZ   F0,F1,#0.5

; Now finish getting the rounding information.

        MOV     Rarith,#&40000000
        TST     Rins,#Pr2_mask+RM_mask
        BNE     Exp_GotAnswer
        TST     Rins,#Pr1_mask
        BEQ     Exp_GotAnswer
        ADFE    F1,F1,#0.5
        CMF     F0,F1
        MOVNE   Rarith,#&C0000000

Exp_GotAnswer

; Transfer the result in F0 back to OP1regs and exit the recursive region.

        ExitRecursive 5,12,Rtmp2,F0,OP1regs

; We know that the result will be common, so we need to split the sign from
; the exponent. Furthermore, an exponent adjustment and a sign are in
; OP2mhi.

        CDebug1 5,"Exit via Exp_GotAnswer, adjustment =",OP2mhi

        AND     RNDexp,OP1sue,#ToExp_mask
        ADD     RNDexp,RNDexp,OP2mhi,ASR #1
        MOV     OP1sue,OP2mhi,LSL #31
        ASSERT  Sign_pos = 31

; And return.

        LDMFD   Rsp!,{PC}

Exp_Small

; The argument lies within 2^(-66) of a multiple of ln(2), and OP2mhi
; indicates what multiple. If the argument is less than this multiple, we
; have a result of 1-epsilon with round and sticky bits both 1; otherwise,
; we have a result of 1.0 with round and sticky bits of 0 and 1
; respectively.
;
; However, the code above has incremented the power of 2 the final result
; will be multiplied by. We therefore need to produce *half* the desired
; results at this point.

        CMF     F0,#0
        MVFGEE  F0,#0.5                 ;GE is NOT(?<): "?" doesn't matter
        MOVGE   Rarith,#&40000000
        LDFLTE  F0,HalfMinusEps         ;LT is ?<: "?" doesn't matter
        MOVLT   Rarith,#&C0000000
        B       Exp_GotAnswer

Exp_MassiveOverUnderflow

; We've got massive overflow or underflow of the result, with the sign bit
; of OP2mlo indicating which. Produce a suitable result, with sign given by
; the bottom bit of OP2mhi.

        ExitRecursive 5,12,Rtmp2

        ADRL    OP1sue,ResultOf1
        LDMIA   OP1sue,{OP1sue,OP1mhi,OP1mlo}
        ORR     OP1sue,OP1sue,OP2mhi,LSL #31
        ASSERT  Sign_pos = 31
        MOV     RNDexp,#&100000         ;Assume massive overflow
        TST     OP2mlo,#Sign_bit
        RSBNE   RNDexp,RNDexp,#0        ;Convert to massive underflow
        MOV     Rarith,#&40000000       ;Inexact

        LDMFD   Rsp!,{PC}

Exp_Zero

; The argument is a zero, so the result is exactly 1. Note that Rarith has
; already been set up to contain the rounding information.

        [ CoreDebugging = 0
          ADR     OP1sue,ResultOf1
        |
          ADRL    OP1sue,ResultOf1
        ]
        LDMIA   OP1sue,{OP1sue,OP1mhi,OP1mlo,RNDexp}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < RNDexp
        MOV     PC,LR

Exp_Uncommon

; We have to deal with the EXP of an uncommon value. The cases are:
;
;   * The EXP of a signalling NaN is an invalid operation;
;
;   * The EXP of a quiet NaN is the NaN itself;
;
;   * The EXP of plus infinity is plus infinity;
;
;   * The EXP of minus infinity is +0 (exactly!);
;
;   * The EXP of an uncommon numeric value can be determined by the code
;     above;
;
; So the first thing we do is check for NaNs and infinities - if we don't
; find one, we'll use the code above. Note that we check for them together,
; since they have similar bit patterns.

        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op is NaN/inf)
        BPL     Exp_Numeric

; The operand is a NaN or infinity. If it's a NaN, we use the standard
; rules for propagating NaNs. If an infinity, we'll either produce a result
; of zero or one of plus infinity, depending on its sign.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1 ;Is operand a NaN?
        BNE     ConvertNaN1             ;Use standard exception/quiet NaN
                                        ; propagation code if so
        MOV     OP2mhi,#0

Exp_Infinity

        TST     OP1sue,#Sign_bit
        ADREQL  OP1sue,Prototype_Infinity
        LDMEQIA OP1sue,OP1regs
        MOVNE   OP1sue,#0
        MOVNE   OP1mhi,#0       ;Note we know OP1mlo is zero
        MOVNE   RNDexp,#0
        MOVNE   Rarith,#0
        ORR     OP1sue,OP1sue,OP2mhi,LSL #31
        ASSERT  Sign_pos = 31
        MOV     PC,LR

;===========================================================================

; The following routine calculates the power function, for POW and RPW
; instructions. As usual for these routines, its entry point has two labels,
; one for the FPASC, the other for the FPE.
;   The value returned is either a numeric value plus associated rounding
; information, with the uncommon bit clear, or an infinity or NaN, with the
; uncommon bit set.
;   This routine will not work correctly with an input which is an
; unnormalised URD result, or an invalid internal format number.
;
; Uses standard dyadic operation entry and exit conventions - see top of
; "src.core.arith" for details.
;
; Unlike most of the other routines in this file, this does not use the Cody
; & Waite recommended algorithm: instead, it uses the less accurate but much
; simpler formula POW(a,b) = EXP(b*LGN(a)). In addition, if the
; assembly-time variable "DoIntegerPowers" is set, special-case code is used
; when b is an integer.
;
; Check that "ZeroToTheZero" has a valid value:

        [ ZeroToTheZero <> "InvalidOp"
          ASSERT  (ZeroToTheZero = "One"):LOR:(ZeroToTheZero = "Zero")
        ]

        [ FPEWanted
PowFPE
        ]

        [ SCWanted
PowSC
        ]

        CDebug3 3,"PowSC/FPE: op1 =",OP1sue,OP1mhi,OP1mlo
        CDebug3 3,"           op2 =",OP2sue,OP2mhi,OP2mlo

; First make some registers available and transfer the operands to F0 and
; F1. This is where we do the swap for RPW - though note that we *don't*
; swap OP1regs with OP2regs: we need to keep these the right way around for
; trap-handling purposes.

        STMFD   Rsp!,{LR}

        EnterRecursive 5,12,Rtmp2

        TST     Rins,#RPWnotPOW_bit
        STMIA   Rtmp2,OP1regs
        LFMEQ   F0,1,[Rtmp2]
        LFMNE   F1,1,[Rtmp2]
        STMIA   Rtmp2,OP2regs
        LFMEQ   F1,1,[Rtmp2]
        LFMNE   F0,1,[Rtmp2]

; Split uncommon values from common values.

        TST     OP1sue,#Uncommon_bit
        TSTEQ   OP2sue,#Uncommon_bit
        BNE     Pow_Uncommon

Pow_NumericInf

; Here, we will deal with any power evaluation where both operands are
; numeric or infinities.
;
        [ DoIntegerPowers

; Round F1 to an integer and see whether this changes it.

        URDE    F2,F1
        NRME    F2,F2
        CMF     F1,F2
        BNE     Pow_NotInteger

; F1 is an integer. We now have the following cases:
;
; * if F0 is 1.0 or F1 is zero, the result is exact and equal to 1.0, except
;   for the possible special case of 0^0;
;
; * if F0 is -1.0, the result is exact and equal to 1.0 if F1 is even, -1.0
;   if F1 is odd;
;
; * if F0 is positive and not equal to 1.0, and F1 is non-zero, the result
;   is calculated in the normal way;
;
; * if F0 is negative and not equal to -1.0, and F1 is non-zero, we
;   calculate (-F0)^F1 in the normal way, then negate if F1 is odd;
;
; * if F0 is +0 and F1 is positive, the result is +0;
;
; * if F0 is -0 and F1 is positive, the result is +0 if F1 is even, -0 if F1
;   is odd;
;
; * if F0 is +0 and F1 is negative, the result is a divide-by-zero
;   exception, with prospective result +infinity;
;
; * if F0 is -0 and F1 is negative, the result is a divide-by-zero
;   exception, with propective result +infinity if F1 is even, -infinity if
;   F1 is odd;
;
; In all cases, we have a sign for the prospective result which is positive
; if F1 is even or F0 is positive, negative if F1 is odd and F0 is negative.
; Generate this sign in the bottom bit of Rtmp.

        TST     Rins,#RPWnotPOW_bit     ;Get actual sign of F0
        MOVEQ   Rtmp,OP1sue,LSR #31
        MOVNE   Rtmp,OP2sue,LSR #31
        ASSERT  Sign_pos = 31
        TST     Rtmp,#1                 ;If negative, check parity of F1
        MUFNEE  F2,F1,#0.5
        URDNEE  F3,F2
        NRMNEE  F3,F3
        CMFNE   F2,F3                   ;Gives NE if odd, EQ if even
        MOVEQ   Rtmp,#0

; Eliminate the "divide-by-zero" case and the "X^0 is +1" case.

        CMF     F1,#0
        BGT     Pow_Integer_NoExceptions        ;GT is NOT(?<=): "?" doesn't
                                                ; matter
        [ ZeroToTheZero = "One"
          BEQ     Pow_One_NoExceptions
        ]
        [ ZeroToTheZero = "Zero"
          BEQ     Pow_Integer_NoExceptions
        ]
        [ ZeroToTheZero = "InvalidOp"
          BNE     %f50
          CMF     F0,#0
          BNE     Pow_Integer_NoExceptions
          MOV     Rtmp,#InvReas_0PowNonpos
          B       RecoverRegs0To4AndInvalidOp1
50
        ]
        CMF     F0,#0
        BEQ     Pow_Integer_DivideByZero

Pow_Integer_NoExceptions

; We now know there are no exceptions, so we can take the absolute value of
; F0.

        CMF     F0,#0                   ;We're going to need the result of
        MNFLTE  F0,F0                   ; the comparison anyway, so save an
                                        ; instruction if positive

; Now the cases are simpler:
;
; * if F0 is 1.0, the result is exact and equal to 1.0;
;
; * if F0 is 0.0, the result is exact and equal to 0.0;
;
; * if F0 is not equal to 0.0 or 1.0, the result is calculated in the normal
;   way;
;
; Then negate the result if Rtmp = 1, leave it unchanged if Rtmp = 0.

        BEQ     Pow_Integer_Zero
        CMF     F0,#1
        BEQ     Pow_Integer_One

; If F1 is at most 2^16 in magnitude, we'll use a technique of repeated
; multiplication or division, to make the calculation more exact. Otherwise,
; we'll use the standard technique.

        MOV     OP2mhi,Rtmp             ;Juggle sign to a new register.
        ADR     Rtmp2,TwoToThe16th
        LDFE    F2,[Rtmp2]
        CMF     F2,F1
        CNFGT   F2,F1
        BGT     Pow_Integer_Special
        B       Pow_StandardCalc

Pow_Integer_One

; The argument is 1, so the result is 1 with Rtmp as sign.

        ExitRecursive 5,12,Rtmp2
        ADR     OP1sue,ResultOf1
        LDMIA   OP1sue,{OP1sue,OP1mhi,OP1mlo,RNDexp}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < RNDexp
        ORR     OP1sue,OP1sue,Rtmp,LSL #31
        ASSERT  Sign_pos = 31
        MOV     Rarith,#0               ;Result is exact
        LDMFD   Rsp!,{PC}

Pow_Integer_Zero

; The first argument is zero and the second is positive (or zero with
; ZeroToTheZero = "Zero"), so the result is 0 with Rtmp as sign.

        ExitRecursive 5,12,Rtmp2
        MOV     OP1sue,Rtmp,LSL #31
        MOV     OP1mhi,#0
        MOV     OP1mlo,#0
        MOV     RNDexp,#0
        MOV     Rarith,#0               ;Result is exact
        LDMFD   Rsp!,{PC}

Pow_Integer_DivideByZero

; The first argument is zero and the second is negative, so the result is a
; divide-by-zero exception. If the exception is untrapped, the result is an
; infinity with Rtmp as sign.

        ExitRecursive 5,12,Rtmp2

; Is the trap enabled? If so, we'll need to call the trap handler.

        TST     Rfpsr,#DZE_bit
        BNE     DivideByZero2Trap

; The trap is disabled, so we set the cumulative exception flag.

        ORR     Rfpsr,Rfpsr,#DZC_bit

; The correct result is an infinity, with sign equal to the bottom bit of
; Rtmp.

        ADRL    OP1sue,Prototype_Infinity
        LDMIA   OP1sue,OP1regs
        ORR     OP1sue,OP1sue,Rtmp,LSL #31
        ASSERT  Sign_pos = 31
        LDMFD   Rsp!,{PC}

Pow_NotInteger

        ]

; Either we don't do integer powers specially, or this isn't an integer
; power. So we now have the following cases:
;
; * if F0 is negative, we have an invalid operation;
;
; * if F0 is a zero and F1 is negative, we have an invalid operation;
;
; * if F0 is a zero and F1 is a zero, the result is controlled by the
;   "ZeroToTheZero" assembly time variable (if "DoIntegerPowers" is {TRUE},
;    this case is bound to have been dealt with above, so it is only needed
;    if "DoIntegerPowers" is {FALSE});
;
; * if F0 is a zero and F1 is positive, the result is exact and equal to F0;
;
; * if F0 is 1.0, or F0 is positive and F1 is zero, the result is exact and
;   equal to 1.0;
;
; * otherwise, the result is evaluated by POW(a,b) = EXP(b*LGN(a)) and is
;   inexact.

        CMF     F0,#0
        MOVLT   Rtmp,#InvReas_NegPowX           ;LT is ?<, but "?" doesn't
        BLT     RecoverRegs0To4AndInvalidOp1    ; matter
        BEQ     Pow_Zero

        CMF     F0,#1
        CMFNE   F1,#0
        BEQ     Pow_One

        MOV     OP2mhi,#0       ;Result is always positive

Pow_StandardCalc

; Now take the logarithm of the first argument and multiply by the second.

        LGNE    F0,F0
        MUFE    F0,F0,F1

; We'll branch into the EXP code to finish the job. However, we need to take
; care about exceptions. In particular, the multiplication above may have
; produced overflow or underflow. The normal EXP code will handle this OK as
; long as the result so far is not zero or infinity: if it is one of these,
; we need to be careful.
;   If the result is zero at this point, we know that underflow has occurred
; somewhere, since we've dealt with the cases of F0 being 1 or F1 being 0.
; So we can determine the correct result by lookong at the sign of the zero.
;   If the result is infinite at this point, there are two cases. Either one
; of the two operands was infinite, in which case we haven't had overflow so
; far, or they weren't, in which case we *have* had overflow. The latter
; case needs to be treated as massive overflow/underflow in the EXP
; calculation, the former as a genuine EXP(+/-infinity).
;   We're going to need the sign of the result in OP2mhi before we branch
; into the EXP code, since the EXP code expects it to be there.

        ADD     Rtmp,Rsp,#5*12+4        ;Address the transfer area
        SFM     F0,1,[Rtmp]
        LDR     OP2mlo,[Rtmp]           ;Get the sign

; Now check for overflow: if we've got it, we can use the EXP massive
; overflow/underflow code.

        RFS     Rtmp2
        TST     Rtmp2,#OFC_bit
        BNE     Exp_MassiveOverUnderflow

; Otherwise, use the correct part of the exponent code, depending on whether
; the current result is zero, infinite or something else.

        CMF     F0,#0
        BEQ     Pow_Small

        ADRL    Rtmp,Prototype_Infinity
        LDFE    F1,[Rtmp]
        CMF     F0,F1
        CNFNE   F0,F1
        BNE     Exp_PowEntryPoint

        ExitRecursive 5,12,Rtmp2
        LDMFD   Rsp!,{LR}
        MOV     OP1sue,OP2mlo           ;Put sign in right place
        B       Exp_Infinity

Pow_Small

; The argument we are taking the EXP of is so small that it has underflowed
; to zero. Nevertheless, it is not zero, and we can tell which side of zero
; it is from the sign of the zero.

        TST     OP2mlo,#Sign_bit
        MVFEQE  F0,#1                   ;If positive, result is 1 with
        MOVEQ   Rarith,#&40000000       ; round bit = 0, sticky bit 1
        LDFNEE  F0,OneMinusEps          ;If negative, result is 1-epsilon
        MOVNE   Rarith,#&C0000000       ; with round bit = sticky bit = 1
        B       Exp_GotAnswer

Pow_One

; The result of a POW or RPW is +1 exactly, because it is either 1^X or X^0.
; The only thing we must watch out for is that 1^(+/-infinity) and
; (+infinity)^0 are invalid operations instead.

        ADRL    Rtmp,Prototype_Infinity
        LDFE    F2,[Rtmp]
        CMF     F0,F2
        CMFNE   F1,F2
        CNFNE   F1,F2
        MOVEQ   Rtmp,#InvReas_BadInfPow
        BEQ     RecoverRegs0To4AndInvalidOp1

Pow_One_NoExceptions

        ExitRecursive 5,12,Rtmp2
        ADR     OP1sue,ResultOf1
        LDMIA   OP1sue,{OP1sue,OP1mhi,OP1mlo,RNDexp}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < RNDexp
        MOV     Rarith,#0               ;Result is exact
        LDMFD   Rsp!,{PC}

Pow_Zero

; The first operand to POW (or the second to RPW) is a zero. If the other
; operand is positive, the result is a zero of the same sign; if it is zero,
; the result is controlled by "ZeroToTheZero"; otherwise, we have an invalid
; operation.

        CMF     F1,#0
        [ (ZeroToTheZero = "One"):LAND::LNOT:DoIntegerPowers
          BEQ     Pow_One_NoExceptions
          MOVLT   Rtmp,#InvReas_0PowNonpos      ;LT is ?<, but "?" doesn't
          BLT     RecoverRegs0To4AndInvalidOp1  ; matter
        ]
        [ (ZeroToTheZero = "Zero"):LAND::LNOT:DoIntegerPowers
          MOVLT   Rtmp,#InvReas_0PowNonpos      ;LT is ?<, but "?" doesn't
          BLT     RecoverRegs0To4AndInvalidOp1  ; matter
        ]
        [ (ZeroToTheZero = "InvalidOp"):LOR:DoIntegerPowers
          MOVLE   Rtmp,#InvReas_0PowNonpos      ;LE is ?<=, but "?" doesn't
          BLE     RecoverRegs0To4AndInvalidOp1  ; matter
        ]

; We must take a little care at this point: we can't simply return F0,
; because it may contain an unnormalised zero. Instead, we recover F0 (to
; get the sign right), then force the exponent to zero.

        ExitRecursive 5,12,Rtmp2,F0,OP1regs
        AND     OP1sue,OP1sue,#Sign_bit
        MOV     RNDexp,#0
        MOV     Rarith,#0               ;Result is exact
        LDMFD   Rsp!,{PC}

Pow_Uncommon

; We have to deal with a POW where at least one operand is uncommon. The
; cases are:
;
; * If either operand is a signalling NaN, we have an invalid operation;
;
; * Otherwise, if either operand is a quiet NaN, the result is the quiet
;   NaN;
;
; * Otherwise, the POW can be determined by the code above. We do have to be
;   careful not regarding an infinite second operand of a POW or first
;   operand of a RPW as an integer, even though URD/NRM will leave it
;   unchanged.
;
; Start by testing both operands for NaNs or infinities.

        TNaNInf Rtmp2,OP2sue,OP2mhi             ;Rtmp2[31] := (op2 is NaN/inf)
        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op1 is NaN/inf)
        BMI     Pow_NaNInf1
        TST     Rtmp2,#TopBit                   ;Operand 2 a NaN or infinity?
        BEQ     Pow_NumericInf

; The second operand is a NaN or infinity, the first isn't. NaNs use the
; standard propagation code, infinities use the code above.

        ORRS    Rtmp,OP2mlo,OP2mhi,LSL #1 ;Operand 2 a NaN?
        [ DoIntegerPowers
          BNE     Pow_NaN2Only          ;Use standard exception/quiet NaN
                                        ; propagation code if so
          TST     Rins,#RPWnotPOW_bit
          BEQ     Pow_NotInteger
          B       Pow_NumericInf
Pow_NaN2Only
        |
          BEQ     Pow_NumericInf
        ]

        ExitRecursive 5,12,Rtmp2
        LDMFD   Rsp!,{LR}
        B       ConvertNaN2Of2

Pow_NaNInf1

; The first operand is a NaN or infinity, the second may be (the top bit of
; Rtmp2 indicates whether it is).

        TST     Rtmp2,#TopBit
        BEQ     Pow_NaNInf1Only

; Both operands are NaNs or infinities. If either operand is a NaN, the
; standard exception/NaN propagation rules apply. Otherwise, we use the code
; above.

        ORR     Rtmp,OP1mlo,OP1mhi,LSL #1 ;Test if both are infinities
        ORR     Rtmp,Rtmp,OP2mlo
        ORRS    Rtmp,Rtmp,OP2mhi,LSL #1
        [ DoIntegerPowers
          BEQ     Pow_NotInteger
        |
          BEQ     Pow_NumericInf
        ]

        ExitRecursive 5,12,Rtmp2
        LDMFD   Rsp!,{LR}
        B       ConvertNaNs

Pow_NaNInf1Only

; The first operand is a NaN or infinity, the second isn't. Use the standard
; exception/quiet NaN propagation code if its a NaN and the code above
; otherwise.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1 ;Is first operand a NaN?
        [ DoIntegerPowers
          BNE     Pow_NaN1Only          ;Use standard exception/quiet NaN
                                        ; propagation code if so
          TST     Rins,#RPWnotPOW_bit
          BNE     Pow_NotInteger
          B       Pow_NumericInf
Pow_NaN1Only
        |
          BEQ     Pow_NumericInf
        ]

        ExitRecursive 5,12,Rtmp2
        LDMFD   Rsp!,{LR}
        B       ConvertNaN1Of2

;===========================================================================

; The results of COS(+/-0), EXP(0) and POW(1,X), in sign/mantissa high/
; mantissa low/exponent form.

ResultOf1               DCD     &00000000,&80000000,&00000000,&00003FFF

; Two more constants.

OneMinusEps     DCD     &00003FFE,&FFFFFFFF,&FFFFFFFF   ;1-2^(-64)
TwoToThe16th    DCD     &0000400F,&80000000,&00000000   ;2^16

; SIN/COS range reduction parameters. (MOD-style range reduction, dividing
; by pi).

SinCos_RangeRedParams
        DCD     &00003FFD,&A2F9836E,&4E44152A   ;1/pi to extended precision
        DCD     &00004000,&C9100000,&00000000   ;M1 = 3.1416015625 exactly
        DCD     &80003FEE,&95777A5C,&F72CECE6   ;M2 = pi-M1 to ext. prec.

; The coefficients of the polynomial used to evaluate SIN on the range 0 to
; pi/2, used in turn to evaluate SIN and COS in general.

SinCos_PolyCoeffs
        DCD     &00003FCE,&C407FB4C,&9EFCA5FE   ;r8 in Cody & Waite
        DCD     &80003FD6,&D72106E0,&424CDF56   ;r7
        DCD     &00003FDE,&B091E343,&56A17FA8   ;r6
        DCD     &80003FE5,&D7322A5A,&EE055B44   ;r5
        DCD     &00003FEC,&B8EF1D29,&27831824   ;r4
        DCD     &80003FF2,&D00D00D0,&09F0D114   ;r3
        DCD     &00003FF8,&88888888,&88858061   ;r2
        DCD     &80003FFC,&AAAAAAAA,&AAAAA603   ;r1
SinCos_PolyEnd

SinCos_PolyLen  EQU     (SinCos_PolyEnd - SinCos_PolyCoeffs)/12

;===========================================================================

; The following routine calculates sines and cosines. As usual for these
; routines, its entry point has two labels, one for the FPASC, the other for
; the FPE.
;   The value returned is either a numeric value plus associated rounding
; information, with the uncommon bit clear, or an infinity or NaN, with the
; uncommon bit set.
;   This routine will not work correctly with an input which is an
; unnormalised URD result, or an invalid internal format number.
;
; Uses standard monadic operation entry and exit conventions - see top of
; "src.core.arith" for details.

        [ FPEWanted
SinCosFPE
        ]

        [ SCWanted
SinCosSC
        ]

        CDebug3 3,"SinCosSC/FPE: operand =",OP1sue,OP1mhi,OP1mlo

; Split uncommon values from common values.

        TST     OP1sue,#Uncommon_bit
        BNE     SinCos_Uncommon

SinCos_Numeric

; We're taking the SIN or COS of a numeric value. Unless it is a zero, we'll
; do this by some internal floating point calculations.
;
; If it is a zero, the result is exact and determined as a special case (in
; particular, we need to ensure that SIN(-0) = -0, SIN(+0) = +0).

        ORRS    Rarith,OP1mhi,OP1mlo
        BEQ     SinCos_Zero

; Make some registers available and transfer the operand to F0.

        STMFD   Rsp!,{LR}

        EnterRecursive 5,12,Rtmp2
        STMIA   Rtmp2,OP1regs
        LFM     F0,1,[Rtmp2]

; The algorithm used in what follows comes from Cody & Waite, chapter 8,
; minus a bug I believe it contains. Their flowchart suggests adding pi/2 to
; ABS(X) on entry for cosines, and also subtracting 0.5 from XN later for
; cosines. However, both the explanatory notes and some thought about the
; problem make it clear that one or the other should be done, but not both.
; For simplicity, I choose the option of adding pi/2, despite its somewhat
; lower accuracy.
;
; We will use range reduction to transform the general SIN/COS problem to
; that of taking a SIN on the range 0 to pi/2, then putting in the correct
; sign at the end. (This is a somewhat more severe range reduction than that
; given in Cody & Waite, but making certain the SIN argument is positive
; allows us to use the IEEE directed rounding modes to our benefit.)
;   We'll use the bottom bit of OP2mhi to keep track of the sign we will
; eventually want - to start with, this will be the wrong way up, i.e.
; bottom bit set means positive, bottom bit clear means negative.
;
; There's a slight bit of trickiness in this next piece of code. Depending
; on the setting of the AC bit, CS vs. CC is either NOT(?<) vs. ?<, or ?>=
; vs. NOT(?>=). But we know we don't have NaNs here, so we don't care what
; happens about the "?" case, and these agree otherwise.

        CMF     F0,#0
        ADC     OP2mhi,OP2mhi,OP2mhi    ;Make desired sign for SIN
        MNFLTE  F0,F0                   ;Quicker than ABSE if positive

        TST     Rins,#COSnotSIN_bit
        LDFNEE  F1,PiOver2
        ADFNEE  F0,F0,F1
        MOVNE   OP2mhi,#1               ;Make desired sign for COS

; Do the range reduction, branching to invalid operation routine if out of
; range.

        ADR     Rtmp,SinCos_RangeRedParams
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       RangeRedByMod           ; link register
        MOVNE   Rtmp,#InvReas_SinCosRange
        BNE     RecoverRegs0To4AndInvalidOp1

; Invert sign if the quotient from the range reduction is odd.

        EOR     OP2mhi,OP2mhi,Rarith

; Now break up the range-reduced value (in the range -pi/2 to pi/2) into its
; sign and magnitude, and incorporate the sign into the sign of the result.
; We'll also get the sign information the right way around at this point.

        CMF     F0,#0
        MNFLTE  F0,F0                   ;LT is ?<: "?" doesn't matter
        EORGE   OP2mhi,OP2mhi,#1        ;GE is NOT(?<): "?" doesn't matter

; To avoid underflow problems, we separate out the case of F0 being very
; small. If it is sufficiently small that subtracting F0^3/6 is going to
; make no significant difference to it, then we can take the answer as being
; F0 moved one step towards zero, with round and sticky bits of 1 and 1.
; This happens if F0^2/6 < 2^(-65), which will certainly happen if
; F0 < 2^(-32).

        LDFE    F1,TwoToMinus32
        CMF     F0,F1
        BLT     SinCos_Small            ;LT is ?<: "?" doesn't matter

; Evaluate the required polynomial.

        MUFE    F1,F0,F0                ;Produce square of argument

        ADR     Rtmp,SinCos_PolyCoeffs  ;Produce polynomial of argument^2
        MOV     Rarith,#SinCos_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF2      ; link register

; We're about to do the final calculation involved in producing the answer.
; At this point, we need to produce rounding information.
;   According to Cody & Waite, we now want a result of F0 * (F2 + 1.0),
; which is better evaluated as F0*F2 + F0 because it is more accurate.
;   We wish to produce answers rounded to minus infinity (or zero) and
; possibly to nearest as well to get the rounding information. The former is
; fairly easy, since we know F0 is positive and F2 negative.
;   Note that despite the fact that there are two roundings involved, the
; two answers will not differ by more than one unit in the last place. This
; is because F0*F2 is guaranteed to be smaller in magnitude than F0: the two
; products F0*F2 differ by at most one unit in the last place of a number
; smaller than F0, and when added to F0, the unrounded results are therefore
; guaranteed to lie in the same interval between two representable numbers
; (assuming each such interval includes both its endpoints).

        MUFEM   F1,F2,F0
        ADFEM   F1,F1,F0

; Now we complete the job of getting the rounding information.

        MOV     Rarith,#&40000000
        TST     Rins,#Pr2_mask+RM_mask
        BNE     SinCos_GotAnswer
        TST     Rins,#Pr1_mask
        MUFNEE  F2,F2,F0
        ADFNEE  F0,F2,F0
        CMFNE   F0,F1
        MOVNE   Rarith,#&C0000000

SinCos_GotAnswer

; Transfer the result in F1 back to OP1regs and exit the recursive region.

        ExitRecursive 5,12,Rtmp2,F1,OP1regs

; We know that the result will be positive and common, so OP1sue just
; contains its exponent. The sign is in the bottom bit of OP2mhi.

        MOV     RNDexp,OP1sue
        MOV     OP1sue,OP2mhi,LSL #31

; Then return.

        LDMFD   Rsp!,{PC}

SinCos_Small

; We need to construct the largest number less in magnitude than F0. This
; can be done by multiplying by (1-epsilon) = (1-2^(-64)) and rounding to
; zero. (There are probably some much faster ways, at least for the
; emulator, but this code should only be executed fairly rarely and space is
; more important than speed.)

        LDFE    F1,OneMinusEps
        MUFEZ   F1,F0,F1

; The result is closer to F0 than to F1, so the round and sticky bits are
; both 1.

        MOV     Rarith,#&C0000000

        B       SinCos_GotAnswer

SinCos_Zero

; The argument is a zero: the result is determined specially. It is always
; numeric and exact: note that the test which causes the code to branch here
; will have set up Rarith to be zero.

        TST     Rins,#COSnotSIN_bit
        BNE     SinCos_CosZero

SinCos_SinZero

; SIN of a zero is a zero of the same sign. We already know the mantissa and
; rounding information are zero.

        AND     OP1sue,OP1sue,#Sign_bit
        MOV     RNDexp,#0
        MOV     PC,LR

SinCos_CosZero

; COS of a zero is +1.0.

        ADR     OP1sue,ResultOf1
        LDMIA   OP1sue,{OP1sue,OP1mhi,OP1mlo,RNDexp}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < RNDexp
        MOV     PC,LR

SinCos_Uncommon

; We have to deal with the SIN or COS of an uncommon value. The cases are:
;
;   * The SIN or COS of a signalling NaN is an invalid operation;
;
;   * The SIN or COS of a quiet NaN is the NaN itself;
;
;   * The SIN or COS of an infinity is an invalid operation;
;
;   * The SIN or COS of an uncommon numeric value can be determined by the
;     code above;
;
; So the first thing we do is check for NaNs and infinities - if we don't
; find one, we'll use the code above. Note that we check for them together,
; since they have similar bit patterns.

        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op is NaN/inf)
        BPL     SinCos_Numeric

; The operand is a NaN or infinity. If it's a NaN, we use the standard
; rules for propagating NaNs. If an infinity, we've got an invalid
; operation.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1 ;Is operand a NaN?
        BNE     ConvertNaN1             ;Use standard exception/quiet NaN
                                        ; propagation code if so
        MOV     Rtmp,#InvReas_SinCosInf
        ; Don't set Rarith - we don't care what the NaN's sign bit is
        B       InvalidOp1ForSDE

;===========================================================================

; This shared piece of code recovers F0-F4 and the link register from the
; stack, then branches to InvalidOp1ForSDE. Note Rtmp contains the reason
; code for the invalid operation and must not be disturbed.

RecoverRegs0To4AndInvalidOp1

        ExitRecursive 5,12,Rtmp2
        LDMFD   Rsp!,{LR}
        ; Don't set Rarith - we don't care what the NaN's sign bit is
        B       InvalidOp1ForSDE

;===========================================================================

; The coefficients of the polynomials used to evaluate ASN on the range 0 to
; 0.5, used in turn to evaluate ASN and ACS in general.

AsnAcsP_PolyCoeffs
        DCD     &80003FFE,&B25DEDAF,&30F3242C   ;p5
        DCD     &00004002,&A270BB27,&61C93957   ;p4
        DCD     &80004004,&9EC1654D,&36D4F820   ;p3
        DCD     &00004004,&E4D539B0,&56A451AD   ;p2
        DCD     &80004003,&DAF2AD41,&D05311C4   ;p1
AsnAcsP_PolyEnd

AsnAcsP_PolyLen EQU     (AsnAcsP_PolyEnd - AsnAcsP_PolyCoeffs)/12

AsnAcsQ_PolyCoeffs
        DCD     &80004003,&BE974377,&CC30F9E6   ;q4
        DCD     &00004006,&96F3E4B2,&C8E37CBC   ;q3
        DCD     &80004007,&BEEE77E2,&B5423CF3   ;q2
        DCD     &00004007,&D0927880,&F5C2170B   ;q1
        DCD     &80004006,&A43601F1,&5C3E6196   ;q0
AsnAcsQ_PolyEnd

AsnAcsQ_PolyLen EQU     (AsnAcsQ_PolyEnd - AsnAcsQ_PolyCoeffs)/12

; Other constants used in the ASN and ACS routine.

PiOverTwo_HighPrec
        DCD     &00003FFF,&C90FDAA2,&2168C234
        DCD     &00003FBF,&C4C68000,&00000000

Pi_HighPrec
        DCD     &00004000,&C90FDAA2,&2168C234
        DCD     &00003FC0,&C4C68000,&00000000

; Some more constants.

PiOver2         DCD     &00003FFF,&C90FDAA2,&2168C235   ;pi/2

TwoToMinus32    DCD     &00003FDF,&80000000,&00000000   ;2^(-32)

;===========================================================================

; The following routine calculates arcsines and arccosines. As usual for
; these routines, its entry point has two labels, one for the FPASC/FPASC,
; the other for the FPE.
;   The value returned is either a numeric value plus associated rounding
; information, with the uncommon bit clear, or an infinity or NaN, with the
; uncommon bit set.
;   This routine will not work correctly with an input which is an
; unnormalised URD result, or an invalid internal format number.
;
; Uses standard monadic operation entry and exit conventions - see top of
; "src.core.arith" for details.

        [ FPEWanted
AsnAcsFPE
        ]

        [ SCWanted
AsnAcsSC
        ]

        CDebug3 3,"AsnAcsSC/FPE: operand =",OP1sue,OP1mhi,OP1mlo

; Split uncommon values from common values.

        TST     OP1sue,#Uncommon_bit
        BNE     AsnAcs_Uncommon

AsnAcs_Numeric

; We're taking the ASN or ACS of a numeric value. We will need to watch out
; for the following exact cases:
;
;   ASN(-0) = -0
;   ASN(+0) = +0
;   ACS(1)  = +0
;
; NOTE: it is arguable that it would be more in keeping with the spirit of
; the IEEE standard for ACS(1) to be -0 if the rounding mode is "to minus
; infinity". I've not implemented this, though it would be easy.
;
; Otherwise, the result will be inexact.
;
; We will deal with the first two cases at this point: the last one will be
; done later, since it involves a more complicated comparison.

        TST     Rins,#ACSnotASN_bit
        ORREQS  Rarith,OP1mhi,OP1mlo
        BEQ     AsnAcs_AsnZero

; Make some registers available and transfer the operand to F0.

        STMFD   Rsp!,{LR}

        EnterRecursive 5,12,Rtmp2
        STMIA   Rtmp2,OP1regs
        LFM     F0,1,[Rtmp2]

; The algorithm used in what follows comes from Cody & Waite, chapter 10,
; with some modifications (checks for exact cases, a different way of
; keeping track of what final adjustments need to be made to the result and
; a different way of performing the final adjustments, so as to get better
; rounding information).
;
; We're going to reduce the problem to that of taking an ASN on an argument
; in the range 0 to 0.5. The first step is to break the argument up into a
; sign (which we will keep, inverted, in the bottom bit of OP2mhi) and
; magnitude.
;
; There's a slight bit of trickiness in this next piece of code. Depending
; on the setting of the AC bit, CS vs. CC is either NOT(?<) vs. ?<, or ?>=
; vs. NOT(?>=). But we know we don't have NaNs here, so we don't care what
; happens about the "?" case, and these agree otherwise.

        CMF     F0,#0
        ADC     OP2mhi,OP2mhi,OP2mhi    ;Make desired sign for SIN
        MNFLTE  F0,F0                   ;Quicker than ABSE if positive

; Next, split according to whether the argument is in the range [0,0.5),
; [0.5,1.0), [1.0,1.0] or (1.0,+infinity).

        CMF     F0,#0.5
        BLT     AsnAcs_ZeroToHalf       ;LT is ?<: "?" doesn't matter
        CMF     F0,#1
        BLT     AsnAcs_HalfToOne        ;LT is ?<: "?" doesn't matter
        MOVGT   Rtmp,#InvReas_AsnAcsRange ;GT is NOT(?<=): "?" doesn't matter
        BGT     RecoverRegs0To4AndInvalidOp1

; The argument is exactly 1.0 in magnitude. If it is positive (bottom bit of
; OP2mhi set) and the operation is an ACS, we've got the exact special case
; of ACS(1.0).

        TST     Rins,#ACSnotASN_bit
        TSTNE   OP2mhi,#1
        BNE     AsnAcs_AcsOne

AsnAcs_HalfToOne

; The argument is in the range 0.5 to 1, so we've got to apply the special
; argument reduction described in Cody & Waite (g := (1-Y)/2; Y :=
; -2*SQT(g)). First, we'll determine how we're going to generate the final
; result:
;
;   Case       Cody & Waite variables    Final calculation
;   -----------------------------------------------------------------------
;   ASN(-ve)   FLAG = 0, i = 1, X < 0    -pi/2 - result
;   ASN(+ve)   FLAG = 0, i = 1, X >= 0   pi/2 + result
;   ACS(-ve)   FLAG = 1, i = 0, X < 0    pi + result
;   ACS(+ve)   FLAG = 1, i = 0, X >= 0   -result
;
; It turns out to be somewhat easier to change the argument reduction to be
; g := (1-Y)/2; Y := 2*SQT(g)). This has the effect of negating "result", so
; that the final calculation becomes:
;
;   Case       Cody & Waite variables    Final calculation
;   -----------------------------------------------------------------------
;   ASN(-ve)   FLAG = 0, i = 1, X < 0    -pi/2 + result
;   ASN(+ve)   FLAG = 0, i = 1, X >= 0   pi/2 - result
;   ACS(-ve)   FLAG = 1, i = 0, X < 0    pi - result
;   ACS(+ve)   FLAG = 1, i = 0, X >= 0   result
;
; We will produce a value in OP2mlo that describes the final adjustments to
; be made to the result. The change can be described in a word as follows:
;
; First stage of change: negate result so far if bit 31 is a 1, leave it
; unchanged if bit 31 is a 0.
;
; Second stage of change: leave result unchanged if bit 30 is a 0, otherwise
; add pi/2 if bit 30 is a 1 and bit 29 is a 0 and add pi if bit 30 is a 1
; and bit 29 is a 1. This is the point at which the final rounding
; information is determined.
;
; Third stage of change: negate the result so far if bit 28 is a 1, leave it
; unchanged if bit 28 is a 0.

        MOV     OP2mlo,#&D0000000
        TST     OP2mhi,#1
        MOVNE   OP2mlo,#&C0000000
        TST     Rins,#ACSnotASN_bit
        MOVNE   OP2mlo,#&E0000000
        TSTNE   OP2mhi,#1
        MOVNE   OP2mlo,#&00000000

; Now do the argument reduction described above. Note that we don't have to
; worry about underflow, since we know the following:
;
;   Original Y is 1 or <= 1-2^(-64);
;   so (1 - original Y) is 0 or >= 2^(-64);
;   so g is 0 or >= 2^(-65);
;   so SQT(g) is 0 or > 2^(-33);
;   so new Y is 0 or > 2^(-32).
;
; The limits on g and Y aren't quite as stringent as in the "0 to 0.5" case,
; but they are quite good enough to avoid underflow. (Note that we know the
; case Y=0, g=0 will give a result of 0.0/1.0 from the rational
; approximation - i.e. it won't cause problems.)

        RSFE    F1,F0,#1
        MUFE    F1,F1,#0.5
        SQTE    F0,F1
        ADFE    F0,F0,F0        ;Faster than MUFE F0,F0,#2

AsnAcs_RationalApprox

; Now we're ready to do the main rational approximation.
; Evaluate the polynomial g*P(g) (See Cody & Waite).

        ADR     Rtmp,AsnAcsP_PolyCoeffs ;Produce polynomial of g
        MOV     Rarith,#AsnAcsP_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF2      ; link register

; Then Q(g) and divide g*P(g) by Q(g).

        ADR     Rtmp,AsnAcsQ_PolyCoeffs ;Produce polynomial of g
        MOV     Rarith,#AsnAcsQ_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF4      ; link register

        DVFE    F2,F2,F4

; Do the first final adjustment at this point - i.e. negate the result if
; the top bit of OP2mlo is set.

        TST     OP2mlo,#&80000000
        MNFNEE  F0,F0

; The result of the rational approximation is now F0 + F0*F2. Perform this
; calculation, rounding to nearest (to minimise the error if we have to add
; pi or pi/2 to the result).

        MUFE    F1,F2,F0
        ADFE    F1,F1,F0

; Now do the second adjustment - i.e. add pi or pi/2, determining rounding
; information in the process, or just determine rounding information.

        MOVS    OP2mhi,OP2mlo,LSL #2    ;Bit 30 -> C, bit 29 -> N
        BCS     AsnAcs_AddAConstant

; We just have to determine rounding information in the second adjustment.
; This requires us to repeat the F0 + F0*F2 calculation, rounding to zero -
; note that we know F2 is positive, so F0*F2 is the same sign as F0. Also,
; it is less in magnitude than F0, so as in the SIN/COS calculations, we'll
; only get a discrepancy of 1 unit in the last place.

        MUFEZ   F2,F2,F0
        ADFEZ   F0,F2,F0

        CMF     F1,F0
        MOVEQ   Rarith,#&40000000
        MOVNE   Rarith,#&C0000000
        MVFNEE  F1,F0
        B       AsnAcs_LastNegate

AsnAcs_AddAConstant

; We've got to add pi or pi/2 - the N flag indicates which.

Tempa   SETA            :BASE:PiOverTwo_HighPrec
        [ Tempa = 15
Tempa2    SETA            PiOverTwo_HighPrec-({PC}+8)
        |
Tempa2    SETA            :INDEX:PiOverTwo_HighPrec
        ]
        LFMPL   F2,2,[R$Tempa,#Tempa2]  ;F2 := high part of pi/2
                                        ;F3 := low part of pi/2
Tempa   SETA            :BASE:Pi_HighPrec
        [ Tempa = 15
Tempa2    SETA            Pi_HighPrec-({PC}+8)
        |
Tempa2    SETA            :INDEX:Pi_HighPrec
        ]
        LFMMI   F2,2,[R$Tempa,#Tempa2]  ;F2 := high part of pi/2
                                        ;F3 := low part of pi/2

; We do this addition carefully, in order to get reasonable rounding
; information. Note that we know the value we're adding is larger in
; magnitude than F1: this allows us to determine the error involved
; accurately.

        ADFE    F0,F1,F2                ;First approximation
        SUFE    F2,F0,F2
        SUFE    F2,F2,F1                ;Error from addition
        ADFE    F2,F2,F3                ;Add in low part of addend to
                                        ; produce total error
        ADFEZ   F1,F0,F2                ;Make the answer

; Complete the generation of rounding information.

        MOV     Rarith,#&40000000
        TST     Rins,#Pr2_mask+RM_mask
        BNE     AsnAcs_LastNegate
        TST     Rins,#Pr1_mask
        ADFNEE  F0,F0,F2
        CMFNE   F0,F1
        MOVNE   Rarith,#&C0000000

AsnAcs_LastNegate

; Negate the answer if bit 28 of OP2mlo is set.

        TST     OP2mlo,#&10000000
        MNFNEE  F1,F1

AsnAcs_GotAnswer

; Transfer the result in F1 back to OP1regs and exit the recursive region.

        ExitRecursive 5,12,Rtmp2,F1,OP1regs

; We know that the result will be common, so we need to split the sign from
; the exponent.

        AND     RNDexp,OP1sue,#ToExp_mask
        AND     OP1sue,OP1sue,#Sign_bit

; Then return.

        LDMFD   Rsp!,{PC}

AsnAcs_ZeroToHalf

; The argument is in the range 0 to 0.5. First, we'll determine how we're
; going to generate the final result:
;
;   Case       Cody & Waite variables    Final calculation
;   -----------------------------------------------------------------------
;   ASN(-ve)   FLAG = 0, i = 0, X < 0    -result
;   ASN(+ve)   FLAG = 0, i = 0, X >= 0   result
;   ACS(-ve)   FLAG = 1, i = 1, X < 0    pi/2 + result
;   ACS(+ve)   FLAG = 1, i = 1, X >= 0   pi/2 - result
;
; We describe the final adjustments in the same way as in the "half to one"
; case above.

        MOV     OP2mlo,#&10000000
        TST     OP2mhi,#1
        MOVNE   OP2mlo,#&00000000
        TST     Rins,#ACSnotASN_bit
        MOVNE   OP2mlo,#&40000000
        TSTNE   OP2mhi,#1
        MOVNE   OP2mlo,#&C0000000

; Now we'll check whether the argument is so small that the true result is
; within one part in 2^(-65) of what we've got. If not, square the argument
; Y (in F0) to produce g (in F1), then branch to the main rational
; approximation code.

        LDFE    F1,TwoToMinus32
        CMF     F0,F1
        MUFGEE  F1,F0,F0                ;GE is NOT(?<): "?" doesn't matter
        BGE     AsnAcs_RationalApprox

; The argument is very small. The true result is very slightly bigger than
; the argument: we simply need to do the correct final adjustments and set
; the rounding information correctly.

        TST     OP2mlo,#&80000000
        MNFNEE  F0,F0

        MVFE    F1,F0

        MOVS    OP2mhi,OP2mlo,LSL #2    ;Bit 30 -> C, bit 29 -> N
        BCS     AsnAcs_AddAConstant

        MOV     Rarith,#&40000000
        B       AsnAcs_LastNegate

AsnAcs_AcsOne

; COS of one is exactly +0.

        MVFE    F1,#0
        MOV     Rarith,#0
        B       AsnAcs_GotAnswer

AsnAcs_AsnZero

; ASN of a zero is a zero of the same sign. We already know the mantissa and
; rounding information are zero.

        AND     OP1sue,OP1sue,#Sign_bit
        MOV     RNDexp,#0
        MOV     PC,LR

AsnAcs_Uncommon

; We have to deal with the ASN or ACS of an uncommon value. The cases are:
;
;   * The ASN or ACS of a signalling NaN is an invalid operation;
;
;   * The ASN or ACS of a quiet NaN is the NaN itself;
;
;   * The ASN or ACS of an infinity is an invalid operation;
;
;   * The ASN or ACS of an uncommon numeric value can be determined by the
;     code above;
;
; So the first thing we do is check for NaNs and infinities - if we don't
; find one, we'll use the code above. Note that we check for them together,
; since they have similar bit patterns.

        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op is NaN/inf)
        BPL     AsnAcs_Numeric

; The operand is a NaN or infinity. If it's a NaN, we use the standard
; rules for propagating NaNs. If an infinity, we've got an invalid
; operation.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1 ;Is operand a NaN?
        BNE     ConvertNaN1             ;Use standard exception/quiet NaN
                                        ; propagation code if so
        MOV     Rtmp,#InvReas_AsnAcsInf
        ; Don't set Rarith - we don't care what the NaN's sign bit is
        B       InvalidOp1ForSDE

;===========================================================================

; TAN range reduction parameters. (MOD-style range reduction, dividing by
; pi/2).

Tan_RangeRedParams
        DCD     &00003FFE,&A2F9836E,&4E44152A   ;2/pi to extended precision
        DCD     &00003FFF,&C9100000,&00000000   ;M1 = 1.57080078125 exactly
        DCD     &80003FED,&95777A5C,&F72CECE6   ;M2 = pi/2-M1 to ext. prec.

; The coefficients of the polynomials used to evaluate TAN on the range
; -pi/4 to pi/4, used in turn to evaluate TAN in general.

TanP_PolyCoeffs
        DCD     &80003FEF,&95D5B975,&16391DA8   ;p3
        DCD     &00003FF6,&E0741531,&DD56F650   ;p2
        DCD     &80003FFC,&8895AF2A,&6847FCD5   ;p1
TanP_PolyEnd

TanP_PolyLen    EQU     (TanP_PolyEnd - TanP_PolyCoeffs)/12

TanQ_PolyCoeffs
        DCD     &00003FEA,&85BBA783,&B3C748A9   ;q4
        DCD     &80003FF3,&A37B24C8,&4A42092E   ;q3
        DCD     &00003FF9,&D23CF50B,&F10ACA84   ;q2
        DCD     &80003FFD,&EEF5823F,&DECEA969   ;q1
TanQ_PolyEnd

TanQ_PolyLen    EQU     (TanQ_PolyEnd - TanQ_PolyCoeffs)/12

; Some constants used for very small values of the range-reduced argument to
; TAN.

Tan_Small_Constants
        DCD     &00000000,&80000000,&00000000   ;Minimum normalised number
        DCD     &00003FFE,&FFFFFFFF,&FFFFFFFF   ;1 - epsilon = 1 - 2^(-64)
        DCD     &00005FFF,&80000000,&00000000   ;2^(&2000)

;===========================================================================

; The following routine calculates tangents. As usual for these routines,
; its entry point has two labels, one for the FPASC, the other for the FPE.
;   The value returned is either a numeric value plus associated rounding
; information, with the uncommon bit clear, or an infinity or NaN, with the
; uncommon bit set.
;   This routine will not work correctly with an input which is an
; unnormalised URD result, or an invalid internal format number.
;
; Uses standard monadic operation entry and exit conventions - see top of
; "src.core.arith" for details.

        [ FPEWanted
TanFPE
        ]

        [ SCWanted
TanSC
        ]

        CDebug3 3,"TanSC/FPE: operand =",OP1sue,OP1mhi,OP1mlo

; Split uncommon values from common values.

        TST     OP1sue,#Uncommon_bit
        BNE     Tan_Uncommon

Tan_Numeric

; We're taking the tangent of a numeric value. Unless it is a zero, we'll do
; this by some internal floating point calculations.
;
; If it is a zero, the result is exact and determined as a special case (in
; particular, we need to ensure that TAN(-0) = -0, TAN(+0) = +0).

        ORRS    Rarith,OP1mhi,OP1mlo
        BEQ     Tan_Zero

; Make some registers available and transfer the operand to F0.

        STMFD   Rsp!,{LR}

        EnterRecursive 5,12,Rtmp2
        STMIA   Rtmp2,OP1regs
        LFM     F0,1,[Rtmp2]

; The algorithm used in what follows comes from Cody & Waite, chapter 9.
;
; We will use range reduction to transform the general TAN problem to that
; of taking a TAN on the range -pi/4 to pi/4, ending by calculating either
; the tangent or minus its reciprocal.
;   We'll use the bottom bit of OP2mhi to keep track of which final division
; option is wanted.

        ADR     Rtmp,Tan_RangeRedParams
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       RangeRedByMod           ; link register
        MOVNE   Rtmp,#InvReas_TanRange
        BNE     RecoverRegs0To4AndInvalidOp1
        MOV     OP2mhi,Rarith

; To avoid underflow problems, we separate out the case of F0 being very
; small. If it is sufficiently small that adding F0^3/3 is going to make no
; significant difference to it, then the answer can be taken as being F0
; with a round bit of 0 and a sticky bit of 1. This happens if
; F0^2/3 < 2^(-65), which will certainly happen if F0 < 2^(-32).

        LDFE    F1,TwoToMinus32_B
        ABSE    F2,F0
        CMF     F2,F1
        BLT     Tan_Small               ;LT is ?<: "?" doesn't matter

; From here on, we know the calculation will not underflow or overflow.
; Evaluate g = F0^2, then the polynomial XNUM = f*P(g) (See Cody & Waite).

        MUFE    F1,F0,F0                ;Produce square of argument

        ADR     Rtmp,TanP_PolyCoeffs    ;Produce polynomial of argument^2
        MOV     Rarith,#TanP_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF2      ; link register
        ADFE    F2,F2,#1                ;Add in p0 = 1.0

        MUFE    F4,F0,F2

; Now evaluate Q(g) to get XDEN in F2.

        ADR     Rtmp,TanQ_PolyCoeffs    ;Produce polynomial of argument^2
        MOV     Rarith,#TanQ_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF2      ; link register
        ADFE    F2,F2,#1                ;Add in q0 = 1.0

; We're about to do the final calculation involved in producing the answer.
; At this point, we need to try to produce rounding information.
;   According to Cody & Waite, we now want a result of F4/F2 if OP2mhi is
; even, -F2/F4 if OP2mhi is odd.

        TST     OP2mhi,#1
        DVFEQEM F0,F4,F2
        MNFNEE  F4,F4                   ;NB exact, so any rounding mode OK
        DVFNEEM F0,F2,F4

; Now finish getting the rounding information.

        MOV     Rarith,#&40000000
        TST     Rins,#Pr2_mask+RM_mask
        BNE     Tan_GotAnswer_NoMod
        TST     Rins,#Pr1_mask
        BEQ     Tan_GotAnswer_NoMod
        TST     OP2mhi,#1
        DVFEQE  F1,F4,F2
        DVFNEE  F1,F2,F4                ;Negation already done above
        CMF     F0,F1
        MOVNE   Rarith,#&C0000000

Tan_GotAnswer_NoMod

        MOV     OP2mhi,#0

Tan_GotAnswer

; Transfer the result in F0 back to OP1regs and exit the recursive region.

        ExitRecursive 5,12,Rtmp2,F0,OP1regs

; We know that the result will be common, so we need to split the sign from
; the exponent. Furthermore, an exponent adjustment is in OP2mhi.

        AND     RNDexp,OP1sue,#ToExp_mask
        ADD     RNDexp,RNDexp,OP2mhi
        AND     OP1sue,OP1sue,#Sign_bit

; And return.

        LDMFD   Rsp!,{PC}

Tan_Small

; The argument lies within 2^(-32) of a multiple of pi/2, and OP2mhi
; indicates what multiple. We have the following cases:
;
; (1) The argument lies within 2^(-32) of a multiple of pi. In this case,
;     the true result is slightly bigger in magnitude than the range-reduced
;     argument, but within 1 part in 2^(-65) of it. In this case, a result
;     equal to the range-reduced argument will do, with round and sticky
;     bits of 0 and 1 respectively.
;       If the range-reduced argument is less than the minimum normalised
;     number, we get the possibility of underflow. To deal with this, we
;     scale the calculations up, then apply a final correction to the
;     exponent of the result.
;
; (2) The argument lies within 2^(-32) of an odd multiple of pi/2. In this
;     case, the true result is slightly smaller in magnitude than
;     -1/(range-reduced argument), but within 1 part in 2^(-65) of it. So in
;     this case, we need to negate and reciprocate the range-reduced
;     argument, then drop it down to the next representable number by
;     multiplying by 1-2^(-64) and rounding towards zero. The round and
;     sticky bits are both 1.
;       If the range-reduced argument is less than the minimum normalised
;     number, we get the possibility of overflow. To deal with this, we
;     scale the calculations down, then apply a final correction to the
;     exponent of the result.
;
; Start getting the constants we may need into F2-F4.

Tempa   SETA            :BASE:Tan_Small_Constants
        [ Tempa = 15
Tempa2    SETA            Tan_Small_Constants-({PC}+8)
        |
Tempa2    SETA            :INDEX:Tan_Small_Constants
        ]
        LFM     F2,3,[R$Tempa,#Tempa2]  ;F2 := MinNorm
                                        ;F3 := 1 - epsilon
                                        ;F4 := 2^(&2000)
        ABSE    F1,F0

; Split into the two cases above.

        TST     OP2mhi,#1
        BNE     Tan_Small_NegateAndRecip

; Case (1) above applies.

        MOV     Rarith,#&40000000
        CMF     F1,F2
        BGE     Tan_GotAnswer_NoMod     ;GE is NOT(?<): "?" doesn't matter
        MUFE    F0,F0,F4
        MOV     OP2mhi,#&2000
        RSB     OP2mhi,OP2mhi,#0
        B       Tan_GotAnswer

Tan_Small_NegateAndRecip

; Case (2) above applies.

        MOV     Rarith,#&C0000000
        CMF     F1,F2
        MUFLTE  F0,F0,F4                ;LT is ?<: "?" doesn't matter
        MNFE    F0,F0                   ;Negate
        RDFE    F0,F0,#1                ;Reciprocate
        MUFEZ   F0,F0,F3                ;Drop to next representable number
        BGE     Tan_GotAnswer_NoMod     ;GE is NOT(?<): "?" doesn't matter
        MOV     OP2mhi,#&2000
        B       Tan_GotAnswer

Tan_Zero

; The argument is a zero: TAN of a zero is a zero of the same sign. We
; already know the mantissa is zero and that Rarith is 0 to indicate an
; exact result.

        AND     OP1sue,OP1sue,#Sign_bit
        MOV     RNDexp,#0
        MOV     PC,LR

Tan_Uncommon

; We have to deal with the TAN of an uncommon value. The cases are:
;
;   * The TAN of a signalling NaN is an invalid operation;
;
;   * The TAN of a quiet NaN is the NaN itself;
;
;   * The TAN of an infinity is an invalid operation;
;
;   * The TAN of an uncommon numeric value can be determined by the code
;     above;
;
; So the first thing we do is check for NaNs and infinities - if we don't
; find one, we'll use the code above. Note that we check for them together,
; since they have similar bit patterns.

        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op is NaN/inf)
        BPL     Tan_Numeric

; The operand is a NaN or infinity. If it's a NaN, we use the standard
; rules for propagating NaNs. If an infinity, we've got an invalid
; operation.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1 ;Is operand a NaN?
        BNE     ConvertNaN1             ;Use standard exception/quiet NaN
                                        ; propagation code if so
        MOV     Rtmp,#InvReas_TanInf
        ; Don't set Rarith - we don't care what the NaN's sign bit is
        B       InvalidOp1ForSDE

;===========================================================================

; The coefficients of the polynomials used to evaluate ATN on the range
; -(2-SQT(3)) to +(2-SQT(3)), used in turn to evaluate ATN and POL in
; general.

AtnPolP_PolyCoeffs
        DCD     &80003FFE,&D66BD6CD,&8C3DE934   ;p3
        DCD     &80004002,&87E9FAE4,&6B531A29   ;p2
        DCD     &80004003,&A40BFDCF,&15E65691   ;p1
        DCD     &80004002,&DB053288,&30E70EB4   ;p0
AtnPolP_PolyEnd

AtnPolP_PolyLen EQU     (AtnPolP_PolyEnd - AtnPolP_PolyCoeffs)/12

AtnPolQ_PolyCoeffs
        DCD     &00004002,&F0624F0A,&56388310   ;q3
        DCD     &00004004,&EE505190,&6D1EB4E8   ;q2
        DCD     &00004005,&AC509020,&5B6D243B   ;q1
        DCD     &00004004,&A443E5E6,&24AD4B90   ;q0
AtnPolQ_PolyEnd

AtnPolQ_PolyLen EQU     (AtnPolQ_PolyEnd - AtnPolQ_PolyCoeffs)/12

; Other constants used in the ATN/POL routine.

TwoToMinus32_B  DCD     &00003FDF,&80000000,&00000000   ;2^(-32)

OneMinusEps_B   DCD     &00003FFE,&FFFFFFFF,&FFFFFFFF   ;1-2^(-64)

TwoMinusSqrt3
        DCD     &00003FFD,&8930A2F4,&F66AB18A

; The table of multiples of pi/6 used in the final adjustments in the
; ATN/POL routine. It contains pi/6, pi/3, pi/2, pi/2, 2pi/3, 5pi/6, pi,
; each to high precision.

AtnPol_PiOver6Table

        DCD     &00003FFE,&860A91C1,&6B9B2C23   ;pi/6
        DCD     &00003FBC,&B766AAAA,&AAAAAAAB

        DCD     &00003FFF,&860A91C1,&6B9B2C23   ;pi/3
        DCD     &00003FBD,&B766AAAA,&AAAAAAAB

        DCD     &00003FFF,&C90FDAA2,&2168C234   ;pi/2
        DCD     &00003FBF,&C4C68000,&00000000

        DCD     &00003FFF,&C90FDAA2,&2168C234   ;pi/2
        DCD     &00003FBF,&C4C68000,&00000000

        DCD     &00004000,&860A91C1,&6B9B2C23   ;2pi/3
        DCD     &00003FBE,&B766AAAA,&AAAAAAAB

        DCD     &00004000,&A78D3631,&C681F72B   ;5pi/6
        DCD     &00003FC0,&D6ECD555,&55555555

        DCD     &00004000,&C90FDAA2,&2168C234   ;pi
        DCD     &00003FC0,&C4C68000,&00000000

;===========================================================================

; The following routines calculate arctangents and polar angles. As usual
; for these routines, each entry point has two labels, one for the FPASC,
; the other for the FPE.
;   The value returned is either a numeric value plus associated rounding
; information, with the uncommon bit clear, or an infinity or NaN, with the
; uncommon bit set.
;   These routines will not work correctly with an input which is an
; unnormalised URD result, or an invalid internal format number.
;
; They use standard monadic/dyadic operation entry and exit conventions
; respectively - see top of "src.core.arith" for details.

        [ FPEWanted
PolFPE
        ]

        [ SCWanted
PolSC
        ]

        CDebug3 3,"PolSC/FPE: op1 =",OP1sue,OP1mhi,OP1mlo
        CDebug3 3,"           op2 =",OP2sue,OP2mhi,OP2mlo

; Use special code if either operand is uncommon.

        TST     OP1sue,#Uncommon_bit
        TSTEQ   OP2sue,#Uncommon_bit
        BNE     Pol_Uncommon

Pol_NumericInf

; Both operands are numeric, a single or double infinity, or an anomalous
; extended infinity. Furthermore, they're not both infinite.
;   First, we need to look out for some special cases:
;
;   POL(+/-0, +/-0) is an invalid operation;
;   POL(+ve, +/-0) is exact, zero and has the same sign as the second operand.
;
; Otherwise, the result is inexact and can be worked out from ATN(ABS(second
; operand/first operand)) plus sign information.
;
; Note that because the second operand is not a normal extended infinity, we
; can test for zeros simply looking at whether the mantissa is zero.

        ORRS    Rarith,OP2mhi,OP2mlo
        BNE     Pol_Inexact

        ORRS    Rtmp,OP1mhi,OP1mlo
        MOVEQ   Rtmp,#InvReas_PolZeroZero
        ; Don't set Rarith - we don't care what the NaN's sign bit is
        BEQ     InvalidOp2ForSDE

        TST     OP1sue,#Sign_bit
        MOVEQ   OP1sue,OP2sue
        BEQ     AtnPol_Zero

Pol_Inexact

; Transfer sign information to Rarith, then make both operands positive. The
; sign information is put into a word which will eventually contain
; significant information in bits 31 and 2:0, as follows:
;   Bit 31 is 1 if the result must eventually be negated, after all other
;     transformations have been done to it;
;   Bits 2:0 indicate what change must be done to the raw result, before the
;     bit 31 negation:
;       Bits 2:0 = 000: no change;
;       Bits 2:0 = 001: result <- pi/6 + result;
;       Bits 2:0 = 010: result <- pi/3 - result;
;       Bits 2:0 = 011: result <- pi/2 - result;
;       Bits 2:0 = 100: result <- pi/2 + result;
;       Bits 2:0 = 101: result <- 2pi/3 + result;
;       Bits 2:0 = 110: result <- 5pi/6 - result;
;       Bits 2:0 = 111: result <- pi - result;

        AND     Rarith,OP2sue,#Sign_bit
        ASSERT  Sign_pos = 31
        TST     OP1sue,#Sign_bit
        EORNE   Rarith,Rarith,#7

        BIC     OP1sue,OP1sue,#Sign_bit
        BIC     OP2sue,OP2sue,#Sign_bit

; Now enter recursive section of code and transfer the adjusted operands to
; registers.

        STMFD   Rsp!,{LR}

        EnterRecursive 5,24,Rtmp2
        STMIA   Rtmp2,{OP1sue,OP1mhi,OP1mlo,OP2sue,OP2mhi,OP2mlo}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < OP2sue
        ASSERT  OP2sue < OP2mhi
        ASSERT  OP2mhi < OP2mlo
        LFM     F0,2,[Rtmp2]

; Transfer the sign information we calculated above to OP2mlo, its standard
; place in the combined ATN/POL code. Then divide second operand by first to
; make the ATN operand and branch to the combined code. Note that we don't
; mind about overflow, underflow, zeros or infinities in the division: we'll
; get a positive number or infinity whose ATN we want.

        MOV     OP2mlo,Rarith
        DVFE    F0,F1,F0
        B       AtnPol_Combined

        [ FPEWanted
AtnFPE
        ]

        [ SCWanted
AtnSC
        ]

        CDebug3 3,"AtnSC/FPE: operand =",OP1sue,OP1mhi,OP1mlo

; Split uncommon values from common values.

        TST     OP1sue,#Uncommon_bit
        BNE     Atn_Uncommon

Atn_NumericInf

; We're taking the ATN of a numeric value, single or double infinity or
; anomalous extended infinity. The only special case we need to look out for
; is that ATN(+/-0) is equal to its operand and is exact.
;
; Otherwise, the result is inexact and can be worked out from
; ATN(ABS(operand)) plus sign information.
;
; Note that because the operand is not a normal extended infinity, we can
; test for zeros simply looking at whether the mantissa is zero.

        ORRS    Rarith,OP1mhi,OP1mlo
        BEQ     AtnPol_Zero

; Transfer sign information to OP2mlo, in the same format as is described
; above for POL.

        AND     OP2mlo,OP1sue,#Sign_bit
        ASSERT  Sign_pos = 31

        BIC     OP1sue,OP1sue,#Sign_bit

; Make some registers available and transfer the adjusted operand to F0.

        STMFD   Rsp!,{LR}

        EnterRecursive 5,24,Rtmp2
        STMIA   Rtmp2,OP1regs
        LFM     F0,1,[Rtmp2]

AtnPol_Combined

; The algorithm used in what follows comes from Cody & Waite, chapter 11,
; with some modifications (checks for exact cases, a different way of
; keeping track of what final adjustments need to be made to the result and
; a different way of performing the final adjustments, so as to get better
; rounding information).
;
; We're going to reduce the problem to that of taking an ATN on an argument
; in the range 0 to 2-SQT(3). We know the operand is currently positive,
; with some sign information already transferred to OP2mlo. The next step is
; to check whether it is greater than 1 and invert if so, putting more
; information in OP2sue.

        CMF     F0,#1
        RDFGTE  F0,F0,#1                ;GT is NOT(?<=): "?" doesn't matter
        EORGT   OP2mlo,OP2mlo,#3

; Now get the constant 2-SQT(3) and compare with it. If greater, perform the
; range reduction described in Cody & Waite. If we do the range reduction,
; we'll form the required constants SQT(3)-1 and SQT(3) from 2-SQT(3)
; without loss of accuracy.

        LDFE    F1,TwoMinusSqrt3
        CMF     F0,F1
        BLE     AtnPol_RangeReduced     ;LE is ?<=: "?" doesn't matter

        RSFE    F3,F1,#1                ;Form SQT(3)-1
        MUFE    F2,F0,F3
        SUFE    F2,F2,#1                ;Subtracting 0.5 twice is a waste of
        ADFE    F2,F2,F0                ; time in IEEE arithmetic
        RSFE    F1,F1,#2                ;Form SQT(3)
        ADFE    F1,F1,F0
        DVFE    F0,F2,F1

        EOR     OP2mlo,OP2mlo,#1

AtnPol_RangeReduced

; Now check for tiny f = F0. If so, the result is very slightly less than f.
; However, note that in this case, we're certain to be adding a non-zero
; multiple of pi/6 to the result, so we don't need rounding information at
; this point and so can just use F0 as it stands.

        LDFE    F2,TwoToMinus32_B
        ABSE    F1,F0
        CMFE    F1,F2
        BLT     AtnPol_Tiny             ;LT is ?<: "?" doesn't matter

; Otherwise, we need to do the rational approximation.

        MUFE    F1,F0,F0

; Now we're ready to do the main rational approximation.
; Evaluate the polynomial g*P(g) (See Cody & Waite).

        [ CoreDebugging = 0
          ADR     Rtmp,AtnPolP_PolyCoeffs ;Produce polynomial of g
        |
          ADRL    Rtmp,AtnPolP_PolyCoeffs ;Produce polynomial of g
        ]
        MOV     Rarith,#AtnPolP_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF2      ; link register

; Then Q(g) and divide g*P(g) by Q(g).

        [ CoreDebugging = 0
          ADR     Rtmp,AtnPolQ_PolyCoeffs ;Produce polynomial of g
        |
          ADRL    Rtmp,AtnPolQ_PolyCoeffs ;Produce polynomial of g
        ]
        MOV     Rarith,#AtnPolQ_PolyLen
        MOV     Rtmp2,PC                ;These make a BL with Rtmp2 as the
        B       PolynomialOfF1InF4      ; link register

        DVFE    F2,F2,F4

; The result of the rational approximation is now F0 + F0*F2. Perform this
; calculation, rounding to nearest (to minimise the error if we have to add
; pi or pi/2 to the result).

        MUFE    F1,F2,F0
        ADFE    F1,F1,F0

AtnPol_RationalDone

; Now we're ready to add to or subtract from a multiple of pi/6. First,
; we're supposed to subtract if bit 1 of OP2mlo is 1: we'll do this by
; negating the answer at this point.

        TST     OP2mlo,#1:SHL:1
        MNFNEE  F1,F1

; If the bottom three bits of OP2mlo are all 1, we haven't got much more to
; do, but do have to complete the generation of the rounding information by
; repeating the final calculations above.

        TST     OP2mlo,#(1:SHL:0)+(1:SHL:1)+(1:SHL:2)
        BNE     AtnPol_AddAConstant

; We just have to determine rounding information in the second adjustment.
; This requires us to repeat the F0 + F0*F2 calculation, rounding to zero -
; note that we know F2 is positive, so F0*F2 is the same sign as F0. Also,
; it is less in magnitude than F0, so as in the SIN/COS calculations, we'll
; only get a discrepancy of 1 unit in the last place.

        MUFEZ   F2,F2,F0
        ADFEZ   F0,F2,F0

        CMF     F1,F0
        MOVEQ   Rarith,#&40000000
        MOVNE   Rarith,#&C0000000
        MVFNEE  F1,F0
        B       AtnPol_LastNegate

AtnPol_AddAConstant

; We've got to add a multiple of pi/6 from a table. Note that the indexing
; calculations below automatically discard the top bit of OP2mlo.

        [ CoreDebugging = 0
          ADR     Rtmp,AtnPol_PiOver6Table-24
        |
          ADRL    Rtmp,AtnPol_PiOver6Table-24
        ]
        ADD     Rtmp2,OP2mlo,OP2mlo,LSL #1
        ADD     Rtmp,Rtmp,Rtmp2,LSL #3
        LFM     F2,2,[Rtmp]

; We do this addition carefully, in order to get reasonable rounding
; information. Note that we know the value we're adding is larger in
; magnitude than F1: this allows us to determine the error involved
; accurately.

        ADFE    F0,F1,F2                ;First approximation
        SUFE    F2,F0,F2
        SUFE    F2,F2,F1                ;Error from addition
        ADFE    F2,F2,F3                ;Add in low part of addend to
                                        ; produce total error
        ADFEZ   F1,F0,F2                ;Make the answer

; Complete the generation of rounding information.

        MOV     Rarith,#&40000000
        TST     Rins,#Pr2_mask+RM_mask
        BNE     AtnPol_LastNegate
        TST     Rins,#Pr1_mask
        ADFNEE  F0,F0,F2
        CMFNE   F0,F1
        MOVNE   Rarith,#&C0000000

AtnPol_LastNegate

; Negate the answer if the top bit of OP2mlo is set.

        TST     OP2mlo,#TopBit
        MNFNEE  F1,F1

AtnPol_GotAnswer

; Transfer the result in F1 back to OP1regs and exit the recursive region.

        ExitRecursive 5,24,Rtmp2,F1,OP1regs

; We know that the result will be common, so we need to split the sign from
; the exponent.

        AND     RNDexp,OP1sue,#ToExp_mask
        AND     OP1sue,OP1sue,#Sign_bit

; Then return.

        LDMFD   Rsp!,{PC}

AtnPol_Tiny

; If the argument is tiny, we can just use the argument as the answer if
; we're going to add a non-zero multiple of pi/6. Otherwise, the answer can
; be generated by multiplying by 1-epsilon and rounding towards zero, then
; adding round and sticky bits of 1.

        TST     OP2mlo,#(1:SHL:0)+(1:SHL:1)+(1:SHL:2)
        MVFNEE  F1,F0
        BNE     AtnPol_RationalDone

        [ CoreDebugging = 0
          LDFE    F1,OneMinusEps_B
        |
          ADRL    Rtmp2,OneMinusEps_B
          LDFE    F1,[Rtmp2]
        ]
        MUFEZ   F1,F1,F0
        MOV     Rarith,#&C0000000
        B       AtnPol_LastNegate

AtnPol_Zero

; ATN of a zero is a zero of the same sign and is exact; the same applies to
; POL(+ve,zero). We already know the rounding information in Rarith is zero.

        MOV     OP1mhi,#0
        MOV     OP1mlo,#0
        AND     OP1sue,OP1sue,#Sign_bit
        MOV     RNDexp,#0
        MOV     PC,LR

Pol_Uncommon

; We have to deal with a POL where at least one operand is uncommon. The
; cases are:
;
; * If either operand is a signalling NaN, we have an invalid operation;
;
; * Otherwise, if either operand is a quiet NaN, the result is the quiet
;   NaN;
;
; * Otherwise, if both operands are infinities, we have an invalid
;   operation;
;
; * Otherwise, we can use the code above, after converting any normal
;   extended infinities to anomalous ones.
;
; Start by testing both operands for NaNs or infinities.

        TNaNInf Rtmp2,OP2sue,OP2mhi             ;Rtmp2[31] := (op2 is NaN/inf)
        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op1 is NaN/inf)
        BMI     Pol_NaNInf1
        TST     Rtmp2,#TopBit                   ;Operand 2 a NaN?
        BEQ     Pol_NumericInf

; The second operand is a NaN or infinity, the first isn't. NaNs use the
; standard propagation code, infinities use the code above.

        ORRS    Rtmp,OP2mlo,OP2mhi,LSL #1
        BNE     ConvertNaN2Of2          ;Use standard exception/quiet NaN
                                        ; propagation code if so
        MOV     OP2mhi,#EIUnits_bit     ;Make extended infinities anomalous
        B       Pol_NumericInf

Pol_NaNInf1

; The first operand is a NaN or infinity, the second may be (the top bit of
; Rtmp2 indicates whether it is).

        TST     Rtmp2,#TopBit
        BEQ     Pol_NaNInf1Only

; Both operands are NaNs or infinities. If both operands are infinities, the
; result is an invalid operation.
;   If either operand is a NaN, the standard exception/NaN propagation rules
; apply.

        ORR     Rtmp,OP1mlo,OP1mhi,LSL #1       ;Test if both are infinities
        ORR     Rtmp,Rtmp,OP2mlo
        ORRS    Rtmp,Rtmp,OP2mhi,LSL #1
        BNE     ConvertNaNs                     ;If not, use shared code
        MOV     Rtmp,#InvReas_PolInfInf
        ; Don't set Rarith - we don't care what the NaN's sign bit is
        B       InvalidOp2ForSDE

Pol_NaNInf1Only

; The first operand is a NaN or infinity, the second isn't. Use the standard
; exception/quiet NaN propagation code if its a NaN and the code above
; otherwise.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1 ;Is first operand a NaN?
        BNE     ConvertNaN1Of2          ;Use standard exception/quiet NaN
                                        ; propagation code if so
        MOV     OP1mhi,#EIUnits_bit     ;Make extended infinities anomalous
        B       Pol_NumericInf

Atn_Uncommon

; We have to deal with the ATN of an uncommon value. The cases are:
;
;   * The ATN of a signalling NaN is an invalid operation;
;
;   * The ATN of a quiet NaN is the NaN itself;
;
;   * The ATN of an infinity or uncommon numeric value can be determined by
;     the code above;
;
; So the first thing we do is check for NaNs and infinities - if we don't
; find one, we'll use the code above. Note that we check for them together,
; since they have similar bit patterns.

        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op is NaN/inf)
        BPL     Atn_NumericInf

; The operand is a NaN or infinity. If it's a NaN, we use the standard
; rules for propagating NaNs. If an infinity, we use the code above.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1 ;Is operand a NaN?
        BNE     ConvertNaN1             ;Use standard exception/quiet NaN
                                        ; propagation code if so
        MOV     OP1mhi,#EIUnits_bit     ;Make extended infinities anomalous
        B       Atn_NumericInf

;===========================================================================

        ]

        END
