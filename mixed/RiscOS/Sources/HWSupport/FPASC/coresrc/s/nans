; Assembler source for FPA support code and emulator
; ==================================================
; Routines to propagate and convert NaNs, and to deal with invalid operation
; and divide-by-zero exceptions.
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
;===========================================================================

; The following routine determines how a NaN needs to be converted to an
; instruction's destination precision, for STF instructions - i.e.
; instructions which have an implicit IEEE conversion in them precisely when
; the destination precision is not the same as the operand precision. The
; rules for this are simple if the NaN Exceptions bit is set in the FPSR:
; the NaN needs proper conversion if the NaN's precision is equal to the
; destination precision, and doesn't need any conversion if it's not. The
; rules are more complex if the NaN Exceptions bit is clear: the NaN still
; needs some sort of conversion if the destination precision is not the same
; as the operand precision, and no conversion otherwise. However, the
; conversion routine should only produce invalid operation exceptions if the
; effective conversion is single->double or vice versa, where an extended
; precision NaN operand is regarded as being effectively double precision if
; its bottom fractional bit is 1, and effectively single precision if its
; bottom fractional bit is 0.
;   All the above assumes that "SigNaNCopy_OK" is set. If "SigNaNCopy_Bad"
; is set instead, things become a lot simpler: a full conversion is *always*
; required: we won't even bother to define this routine, but will simply
; implement the decision at the point of call. If "SigNaNCopy_OK" and
; "SigNaNCopy_Bad" are *both* set, life becomes more complicated: we need to
; pay attention to exactly which hardware (or no hardware) we're dealing with.
;
; Entry: OP1sue, OP1mhi, OP1mlo = operand, which is assumed to be a NaN;
;        Rfpsr holds FPSR (the NE bit affects the conversion, and the system
;          ID byte will be needed as well if "SigNaNCopy_OK" and
;          "SigNaNCopy_Bad" are both set);
;        Rins holds instruction (used for destination precision);
;        Rwp, Rfp and Rsp hold their standard values;
;        R14 is the return link.
; Exit:  Rarith is negative to indicate no conversion is required, zero to
;          indicate that a conversion without invalid operation traps is
;          required and positive to indicate that a full conversion is
;          required;
;        Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved;

        [ SigNaNCopy_OK

NaNConversionNeededForSTF

          CDebug3 4,"NaNConversionNeededForSTF:",OP1sue,OP1mhi,OP1mlo

          [ SigNaNCopy_Bad
            MOVS    Rarith,Rfpsr,LSR #SysID_pos   ;Will generate NE, value > 0
            ASSERT  SysID_pos > 0
            ASSERT  SysID_FPE  <> 0
            [ FPEWanted :LAND: FPESigNaNCopy_Invalid    ; Should be true
              TEQNE   Rarith,#SysID_FPE
            ]
            MOVEQ   PC,LR
          ]

; Get NaN precision by looking at its exponent. Note we assume this field
; can only have one of the three allowed values for NaNs.

          AND     Rtmp,OP1sue,#ToExp_mask ;Isolate exponent field
          MOV     Rtmp2,#NaNInfExp_Double:AND:&FF
          ORR     Rtmp2,Rtmp2,#NaNInfExp_Double:AND:&FF00
          ASSERT  NaNInfExp_Double <= &FFFF
          CMP     Rtmp,Rtmp2              ;LO/EQ/HI if single/double/extended
          ASSERT  NaNInfExp_Single < NaNInfExp_Double
          ASSERT  NaNInfExp_Double < NaNInfExp_Extended

; Now we want to look at the appropriate fields in the instruction. To match
; the observed precision, the first precision bit must be 1 if we've
; observed extended precision, 0 otherwise, and the second must be 1 if
; we've observed double precision, 0 otherwise.

          MOVHI   Rarith,Rins,LSL #31-DT_pr1_pos          ;Make Rarith -ve if
          MVNLS   Rarith,Rins,LSL #31-DT_pr1_pos          ; 1st bit matches
          ANDEQ   Rarith,Rarith,Rins,LSL #31-DT_pr2_pos   ;Then -ve if 2nd bit
          BICNE   Rarith,Rarith,Rins,LSL #31-DT_pr2_pos   ; also matches
          TEQ     Rarith,#0                               ;Check result

; If the source precision matches the destination precision, no conversion
; is required; if it doesn't match and the NE bit is set, a full conversion
; is required;

          ANDPLS  Rarith,Rfpsr,#NE_bit            ;If no match, check NE bit
          ASSERT  NE_bit < &80000000
          MOVNE   PC,LR

; The real precisions don't match and the NE bit is clear. Work out the
; effective precision of the operand.

          MOVS    Rarith,Rtmp,LSL #22     ;CS if extended; if CC, top bit is 1
                                          ; for double, 0 for single
          MOVCC   Rarith,Rarith,LSR #31   ;Rarith = 0 for single, 1 for double
          ANDCS   Rarith,OP1mlo,#1        ;Rarith set to effective precision
                                          ; for extended

; Conversions to extended precision always need trap-less conversion:
; conversions to single or double precision need trapless conversion if the
; destination precision matches the operand's effective precision.

          TST     Rins,#DT_pr2_mask       ;If double, invert Rarith
          EORNE   Rarith,Rarith,#1        ; (note already OK for single)
          TST     Rins,#DT_pr1_mask       ;If extended, clear Rarith
          MOVNE   Rarith,#0
          MOV     PC,LR

        ]

;===========================================================================

; The following routine determines how a NaN needs to be converted to an
; instruction's destination precision, for MVF/MNF/ABS instructions - i.e.
; instructions which have an implicit IEEE conversion in them precisely when
; the destination precision is not the same as the operand precision. The
; rules for this are simple if the NaN Exceptions bit is set in the FPSR:
; the NaN needs proper conversion if the NaN's precision is equal to the
; destination precision, and doesn't need any conversion if it's not. The
; rules are more complex if the NaN Exceptions bit is clear: the NaN still
; needs some sort of conversion if the destination precision is not the same
; as the operand precision, and no conversion otherwise. However, the
; conversion routine should only produce invalid operation exceptions if the
; effective conversion is single->double or vice versa, where an extended
; precision NaN operand is regarded as being effectively double precision if
; its bottom fractional bit is 1, and effectively single precision if its
; bottom fractional bit is 0.
;   All the above assumes that "SigNaNCopy_OK" is set. If "SigNaNCopy_Bad"
; is set instead, things become a lot simpler: a full conversion is *always*
; required: we won't even bother to define this routine, but will simply
; implement the decision at the point of call. If "SigNaNCopy_OK" and
; "SigNaNCopy_Bad" are *both* set, life becomes more complicated: we need to
; pay attention to exactly which hardware (or no hardware) we're dealing with.
;
; Entry: OP1sue, OP1mhi, OP1mlo = operand, which is assumed to be a NaN;
;        Rfpsr holds FPSR (the NE bit affects the conversion, and the system
;          ID byte will be needed as well if "SigNaNCopy_OK" and
;          "SigNaNCopy_Bad" are both set);
;        Rins holds instruction (used for destination precision);
;        Rwp, Rfp and Rsp hold their standard values;
;        R14 is the return link.
; Exit:  Rarith is negative to indicate no conversion is required, zero to
;          indicate that a conversion without invalid operation traps is
;          required and positive to indicate that a full conversion is
;          required;
;        Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved;

        [ SigNaNCopy_OK

NaNConversionNeeded

          CDebug3 4,"NaNConversionNeeded:",OP1sue,OP1mhi,OP1mlo

          [ SigNaNCopy_Bad
            MOVS    Rarith,Rfpsr,LSR #SysID_pos   ;Will generate NE, value > 0
            ASSERT  SysID_pos > 0
            ASSERT  SysID_FPE  <> 0
            [ FPEWanted :LAND: FPESigNaNCopy_Invalid      ; Should be true
              TEQNE   Rarith,#SysID_FPE
            ]
            MOVEQ   PC,LR
          ]

; Get NaN precision by looking at its exponent. Note we assume this field
; can only have one of the three allowed values for NaNs. Note also that we
; will branch out into some more complicated code if the NaN Exceptions bit
; is 0, since the decision whether there is a change of format occurring is
; more complicated in this case.

          AND     Rtmp,OP1sue,#ToExp_mask ;Isolate exponent field
          MOV     Rtmp2,#NaNInfExp_Double:AND:&FF
          ORR     Rtmp2,Rtmp2,#NaNInfExp_Double:AND:&FF00
          ASSERT  NaNInfExp_Double <= &FFFF
          CMP     Rtmp,Rtmp2              ;LO/EQ/HI if single/double/extended
          ASSERT  NaNInfExp_Single < NaNInfExp_Double
          ASSERT  NaNInfExp_Double < NaNInfExp_Extended

; Now we want to look at the appropriate fields in the instruction. To match
; the observed precision, the first precision bit must be 1 if we've
; observed extended precision, 0 otherwise, and the second must be 1 if
; we've observed double precision, 0 otherwise.

          MOVHI   Rarith,Rins,LSL #31-Pr1_pos             ;Make Rarith -ve if
          MVNLS   Rarith,Rins,LSL #31-Pr1_pos             ; 1st bit matches
          ANDEQ   Rarith,Rarith,Rins,LSL #31-Pr2_pos      ;Then -ve if 2nd bit
          BICNE   Rarith,Rarith,Rins,LSL #31-Pr2_pos      ; also matches
          TEQ     Rarith,#0                               ;Check result

; If the source precision matches the destination precision, no conversion
; is required; if it doesn't match and the NE bit is set, a full conversion
; is required;

          ANDPLS  Rarith,Rfpsr,#NE_bit            ;If no match, check NE bit
          ASSERT  NE_bit < &80000000
          MOVNE   PC,LR

; The real precisions don't match and the NE bit is clear. Work out the
; effective precision of the operand.

          MOVS    Rarith,Rtmp,LSL #22     ;CS if extended; if CC, top bit is 1
                                          ; for double, 0 for single
          MOVCC   Rarith,Rarith,LSR #31   ;Rarith = 0 for single, 1 for double
          ANDCS   Rarith,OP1mlo,#1        ;Rarith set to effective precision
                                          ; for extended

; Conversions to extended precision always need trap-less conversion:
; conversions to single or double precision need trapless conversion if the
; destination precision matches the operand's effective precision.

          TST     Rins,#Pr2_mask          ;If double, invert Rarith
          EORNE   Rarith,Rarith,#1        ; (note already OK for single)
          TST     Rins,#Pr1_mask          ;If extended, clear Rarith
          MOVNE   Rarith,#0
          MOV     PC,LR

        ]

;===========================================================================

; The following routines convert NaNs to a destination precision. All but
; ConvertNaNs assume without checking that their operand really is a NaN.
; Entry: OP1sue, OP1mhi, OP1mlo = first operand, which is the NaN to be
;          converted for ConvertNaN1, ConvertNaN1Of2, ConvertNaN1_Special,
;          ConvertNaN1_ForSTF and possibly ConvertNaNs;
;        OP2sue, OP2mhi, OP2mlo = second operand, which is the NaN to be
;          converted for ConvertNaN2Of2 and possibly ConvertNaNs;
;        Rarith holds potential integer result;
;        Rfpsr holds FPSR (the NE bit affects the conversion, and the system
;        ID byte will be needed as well if both "SigNaNCopy_OK" and
;          "SigNaNCopy_Bad" are set);
;        Rins holds instruction (used for destination precision);
;        Rwp, Rfp and Rsp hold their standard values;
;        R14 is the return link.
; Exit:  If the floating point result is uncommon, it is held in standard
;          internal format in OP1sue, OP1mhi and OP1mlo, and RNDexp and
;          Rarith are corrupt;
;        If the floating point result is common, it is held with sign and
;          exponent separated in OP1sue, OP1mhi, OP1mlo and RNDexp, while
;          Rarith holds 0 to indicate there's no guard, round and sticky
;          information (this case can only happen on trapped invalid
;          operation, and in that case the trap handler has already done the
;          rounding);
;        Rfpsr may be updated;
;        OP2mhi, OP2mlo, Rtmp, Rtmp2 and R14 may be corrupt;
;        Returns NE if an invalid operation trap occurred, EQ otherwise
;          (i.e. if there was no invalid operation exception or if there was
;          one but it wasn't trapped);
;        All other registers preserved;
;
; ConvertNaNs assumes that both operands are NaNs or infinities, and at
; least one of them is a NaN. It invokes ConvertNaN1Of2 if the first operand
; is a signalling NaN, or if the first operand is a NaN and the second is
; not a signalling NaN. If the first operand is an infinity rather than a
; NaN, the second one must be a NaN, and ConvertNaN2Of2 is invoked.
; Otherwise, the first operand is a quiet NaN and the second is a signalling
; NaN: in this case, ConvertNaN1Of2_Invalid is invoked.
;
; ConvertNaN1Of2 converts OP1sue/mhi/mlo: if the operand is a signalling
; NaN, it always raises an invalid operation exception. If this happens, it
; calls a two-operand invalid operation routine: i.e. it assumes that it is
; dealing with a dyadic CPDO.
;
; ConvertNaN1Of2_Invalid does the same as ConvertNaN1Of2, except that the
; invalid operation exception is raised regardless of whether the operand is
; a signalling NaN (this is for the case that the first operand is a quiet
; NaN and the second a signalling NaN).
;
; ConvertNaN1 is like ConvertNaN1Of2, except that it uses a one-operand
; invalid operation routine: this makes it suitable for most monadic CPDOs.
;
; ConvertNaN2Of2 is like ConvertNaN1Of2, except that it converts
; OP2sue/mhi/mlo.
;
; ConvertNaN1_Special is like ConvertNaN1, except that if the EQ condition
; is set on entry, no check for an invalid operation is performed. It
; therefore always returns EQ in this case. It is suitable for operations
; which may be a copy without change of format - i.e. MVF, MNF and ABS.
;
; ConvertNaN1_ForSTF is like ConvertNaN1_Special, except that the CPDT
; precision bits will be used rather than the CPDO/CPRT ones.
;
; The above descriptions apply for the case that copying a signalling NaN
; without change of format does not generate an invalid operation exception
; - i.e. to the FPASC or suitably configured FPE. When copying a signalling
; NaN generates an invalid operation exception regardless of whether a
; format conversion took place (as for a suitably configured FPE), the rules
; mostly change to simply always making an extended precision NaN. The
; exception is ConvertNaN1_ForSTF, which must change to the correct
; destination format to allow the remainder of the STF to be emulated
; correctly. (ConvertNaN1_ForSTF and ConvertNaN1_Special also lose their
; special case for an EQ entry condition.)

ConvertNaNs

; First check for cases where the first operand determines which routine to
; use - i.e. if it is a signalling NaN or not a NaN at all.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1       ;First operand a NaN?
        BEQ     ConvertNaN2Of2                  ;If not, use ConvertNaN2Of2
        TST     OP1mhi,#EIFracTop_bit           ;First operand a sign.NaN?
                                                ;If so, use ConvertNaN1Of2
                                                ; via fallthrough to branch

; First operand is a quiet NaN. If second is a signalling NaN, we use
; ConvertNaN1Of2_Invalid; otherwise, we use ConvertNaN1Of2.

        ORRNES  Rtmp,OP2mlo,OP2mhi,LSL #1       ;Second operand a NaN?
        BEQ     ConvertNaN1Of2                  ;If not, use ConvertNaN1Of2
        ANDS    Rtmp,OP2mhi,#EIFracTop_bit      ;Second operand a sign.NaN?
        BEQ     ConvertNaN1Of2_Invalid          ;If so, ConvertNaN1Of2_Invalid
        ASSERT  InvReas_SigNaN = 0              ; with reason code in Rtmp!

ConvertNaN1Of2

        CDebug3 4,"ConvertNaN1Of2: NaN =",OP1sue,OP1mhi,OP1mlo

; We must check for an invalid operation trap *before* we start using shared
; code, because the operands must be left unchanged for the trap handler.

        ANDS    Rtmp,OP1mhi,#EIFracTop_bit      ;Signalling NaN? (Note Rtmp
        BNE     ConvertNaN1_NoTrap              ; becomes 0 = InvReas_SigNaN
        ASSERT  InvReas_SigNaN = 0              ; if so)

ConvertNaN1Of2_Invalid                          ;Rtmp=0 on branch to here too

        TST     Rfpsr,#IOE_bit                  ;Yes. Is invalid op trapped?
        BNE     InvalidOp2TrapForSDE            ;If so, call trap handler

ConvertNaN1_Quieten

        ORR     Rfpsr,Rfpsr,#IOC_bit            ;Otherwise set cumulative bit
        ORR     OP1mhi,OP1mhi,#EIFracTop_bit    ; and quieten NaN

ConvertNaN1_NoTrap

; Now we need to perform the actual NaN conversion. The rules here are:
;
; * The exponent field must be converted to the appropriate value for the
;   destination precision;
;
; * Fraction bits that are not used by the destination precision must be
;   cleared;
;
; * If result precision is single or double, units bit is forced to 1;
;
; * If the NE bit is 0 and we're converting to extended precision, the
;   bottom bit of the fraction must be cleared or set to indicate whether
;   the NaN is "really" single or double precision respectively.

; Split according to result precision.

        TST     Rins,#Pr1_mask
        BNE     ConvertNaN1_ToExtended
        TST     Rins,#Pr2_mask
        BNE     ConvertNaN1_ToDouble

ConvertNaN1_ToSingle

; Clear appropriate fraction bits.

        MOV     OP1mlo,#0
        BIC     OP1mhi,OP1mhi,#&FF

        [ SigNaNCopy_Bad
          [ SigNaNCopy_OK
; With both SigNaNCopy_OK and SigNaNCopy_Bad set, we must change the
; exponent to the correct value depending on which system we're working on.
            MOVS    Rtmp,Rfpsr,LSR #SysID_pos   ;Will generate NE, value > 0
            ASSERT  SysID_pos > 0
            ASSERT  SysID_FPE  <> 0
            [ FPEWanted :LAND: FPESigNaNCopy_Invalid    ; Should be true
              TEQNE   Rtmp,#SysID_FPE
            ]
            BEQ     ConvertNaN1_MakeExpExtended
          |
; With just SigNaNCopy_Bad set, we must change the exponent to an extended
; precision one.
            B       ConvertNaN1_MakeExpExtended
          ]
        |
; With just SigNaNCopy_OK set, we must change the exponent to a single
; precision one. So just fall through here.
        ]

ConvertNaN1_MakeExpSingle

; Change exponent.

        AND     OP1sue,OP1sue,#Sign_bit+Uncommon_bit
        ORR     OP1sue,OP1sue,#NaNInfExp_Single:AND:&FF
        ORR     OP1sue,OP1sue,#NaNInfExp_Single:AND:&FF00
        ASSERT  NaNInfExp_Single <= &FFFF

; Set the units bit and return with EQ condition. Note that we know this
; won't change a NaN into an infinity unless someone is misusing extended
; precision with the NE bit equal to 0.

        ORR     OP1mhi,OP1mhi,#EIUnits_bit
        TEQ     OP1sue,OP1sue           ;Force EQ condition
        MOV     PC,LR

ConvertNaN1_ToDouble

; Clear appropriate fraction bits.

        MOV     OP1mlo,OP1mlo,LSR #11
        MOV     OP1mlo,OP1mlo,LSL #11

        [ SigNaNCopy_Bad
          [ SigNaNCopy_OK
; With both SigNaNCopy_OK and SigNaNCopy_Bad set, we must change the
; exponent to the correct value depending on which system we're working on.
            MOVS    Rtmp,Rfpsr,LSR #SysID_pos   ;Will generate NE, value > 0
            ASSERT  SysID_pos > 0
            ASSERT  SysID_FPE  <> 0
            [ FPEWanted :LAND: FPESigNaNCopy_Invalid    ; Should be true
              TEQNE   Rtmp,#SysID_FPE
            ]
            BEQ     ConvertNaN1_MakeExpExtended
          |
; With just SigNaNCopy_Bad set, we must change the exponent to an extended
; precision one.
            B       ConvertNaN1_MakeExpExtended
          ]
        |
; With just SigNaNCopy_OK set, we must change the exponent to a double
; precision one. So just fall through here.
        ]

ConvertNaN1_MakeExpDouble

; Change exponent.

        AND     OP1sue,OP1sue,#Sign_bit+Uncommon_bit
        ORR     OP1sue,OP1sue,#NaNInfExp_Double:AND:&FF
        ORR     OP1sue,OP1sue,#NaNInfExp_Double:AND:&FF00
        ASSERT  NaNInfExp_Double <= &FFFF

; Set the units bit and return with EQ condition. Note that we know this
; won't change a NaN into an infinity unless someone is misusing extended
; precision with NE=0.

        ORR     OP1mhi,OP1mhi,#EIUnits_bit
        TEQ     OP1sue,OP1sue           ;Force EQ condition
        MOV     PC,LR

ConvertNaN1_ToExtended

; If NE=0, we just need to modify the exponent. Otherwise, we need to
; establish the effective precision and set or clear the bottom bit of the
; fraction appropriately.

        TST     Rins,#NE_bit
        BNE     ConvertNaN1_MakeExpExtended
        AND     Rtmp,OP1sue,#ToExp_mask ;Isolate exponent field
        MOV     Rtmp2,#NaNInfExp_Double:AND:&FF
        ORR     Rtmp2,Rtmp2,#NaNInfExp_Double:AND:&FF00
        ASSERT  NaNInfExp_Double <= &FFFF
        CMP     Rtmp,Rtmp2              ;LO/EQ/HI if single/double/extended
        ASSERT  NaNInfExp_Single < NaNInfExp_Double
        ASSERT  NaNInfExp_Double < NaNInfExp_Extended
        BICLO   OP1mlo,OP1mlo,#1        ;Bottom bit cleared for single NaN
        ORREQ   OP1mlo,OP1mlo,#1        ;Bottom bit set for double NaN
                                        ;Bottom bit unchanged for extended NaN

ConvertNaN1_MakeExpExtended

; Change exponent and return.

        AND     OP1sue,OP1sue,#Sign_bit+Uncommon_bit
        ORR     OP1sue,OP1sue,#NaNInfExp_Extended:AND:&FF
        ORR     OP1sue,OP1sue,#NaNInfExp_Extended:AND:&FF00
        ASSERT  NaNInfExp_Extended <= &FFFF

        TEQ     OP1sue,OP1sue           ;Force EQ condition
        MOV     PC,LR

ConvertNaN1_ForSTF

        CDebug3 4,"ConvertNaN1_ForSTF: NaN =",OP1sue,OP1mhi,OP1mlo

        [ SigNaNCopy_OK
          [ SigNaNCopy_Bad
; With both SigNaNCopy_OK and SigNaNCopy_Bad set, we need to pay attention
; to the EQ flag unless the system we're dealing with is a suitably
; configured FPE system.
            BNE     ConvertNaN1_ForSTF_PossibleTrap
            MOVS    Rtmp,Rfpsr,LSR #SysID_pos   ;Will generate NE, value > 0
            ASSERT  SysID_pos > 0
            ASSERT  SysID_FPE  <> 0
            [ FPEWanted :LAND: FPESigNaNCopy_Invalid    ; Should be true
              TEQNE   Rtmp,#SysID_FPE
            ]
            BNE     ConvertNaN1_ForSTF_NoTrap
ConvertNaN1_ForSTF_PossibleTrap
          |
; With only SigNaNCopy_OK set, we simply need to skip the test for an
; invalid operation if the EQ condition is set.
            BEQ     ConvertNaN1_ForSTF_NoTrap
          ]
        |
; If only SigNaNCopy_Bad is set, no special action required here.
        ]

; We must check for an invalid operation trap *before* we start using shared
; code, because the operands must be left unchanged for the trap handler.

        ANDS    Rtmp,OP1mhi,#EIFracTop_bit      ;Signalling NaN? (Note Rtmp
        BNE     ConvertNaN1_ForSTF_NoTrap       ; becomes 0 = InvReas_SigNaN
        ASSERT  InvReas_SigNaN = 0              ; if so)
        TST     Rfpsr,#IOE_bit                  ;Yes. Is invalid op trapped?
        BNE     InvalidOp1TrapForSDE_STF        ;If so, call trap handler

        ORR     Rfpsr,Rfpsr,#IOC_bit            ;Otherwise set cumulative bit
        ORR     OP1mhi,OP1mhi,#EIFracTop_bit    ; and quieten NaN

ConvertNaN1_ForSTF_NoTrap

; Split according to result precision.

        [ SigNaNCopy_Bad
; We need to do any fraction bit clearing here, then split according to the
; CPDT result precision bits. (We cannot share the first level destinations
; of ConvertNaN1_NoTrap above because we don't want the possible production
; of an extended precision form instead.)
          TST     Rins,#DT_pr1_mask
          BNE     ConvertNaN1_MakeExpExtended
          TST     Rins,#DT_pr2_mask
          MOVNE   OP1mlo,OP1mlo,LSR #11         ;Non-double precision fraction
          MOVNE   OP1mlo,OP1mlo,LSL #11         ; bits forced to zero
          BNE     ConvertNaN1_MakeExpDouble
          MOV     OP1mlo,#0                     ;Non-single precision fraction
          BIC     OP1mhi,OP1mhi,#&FF            ; bits forced to zero
          B       ConvertNaN1_MakeExpSingle
        |
; With just SigNaNCopy_OK set, just split according to the CPDT result
; precision bits - we want precisely the effect of ConvertNaN1_NoTrap above
; apart from the clearing of a different set of bits.
          TST     Rins,#DT_pr1_mask
          BNE     ConvertNaN1_ToExtended
          TST     Rins,#DT_pr2_mask
          BNE     ConvertNaN1_ToDouble
          B       ConvertNaN1_ToSingle
        ]

ConvertNaN1_Special

        CDebug3 4,"ConvertNaN1_Special: NaN =",OP1sue,OP1mhi,OP1mlo

        [ SigNaNCopy_OK
          [ SigNaNCopy_Bad
; With both SigNaNCopy_OK and SigNaNCopy_Bad set, we need to pay attention
; to the EQ flag unless the system we're dealing with is a suitably
; configured FPE system.
            BNE     ConvertNaN1_PossibleTrap
            MOVS    Rtmp,Rfpsr,LSR #SysID_pos   ;Will generate NE, value > 0
            ASSERT  SysID_pos > 0
            ASSERT  SysID_FPE  <> 0
            [ FPEWanted :LAND: FPESigNaNCopy_Invalid    ; Should be true
              TEQNE   Rtmp,#SysID_FPE
            ]
            BNE     ConvertNaN1_NoTrap
ConvertNaN1_PossibleTrap
          |
; With only SigNaNCopy_OK set, we simply need to skip the test for an
; invalid operation if the EQ condition is set.
            BEQ     ConvertNaN1_NoTrap
          ]
        |
; If only SigNaNCopy_Bad is set, no special action required here.
        ]

ConvertNaN1

; We must check for an invalid operation trap *before* we start using shared
; code, because the operands must be left unchanged for the trap handler.

        CDebug3 4,"ConvertNaN1: NaN =",OP1sue,OP1mhi,OP1mlo

        ANDS    Rtmp,OP1mhi,#EIFracTop_bit      ;Signalling NaN? (Note Rtmp
        BNE     ConvertNaN1_NoTrap              ; becomes 0 = InvReas_SigNaN
        ASSERT  InvReas_SigNaN = 0              ; if so)
        TST     Rfpsr,#IOE_bit                  ;Yes. Is invalid op trapped?
        BNE     InvalidOp1TrapForSDE            ;If so, call trap handler

        B       ConvertNaN1_Quieten

ConvertNaN2Of2

        CDebug3 4,"ConvertNaN2Of2: NaN =",OP2sue,OP2mhi,OP2mlo

; We must check for an invalid operation trap *before* we start using shared
; code, because the operands must be left unchanged for the trap handler.

        ANDS    Rtmp,OP2mhi,#EIFracTop_bit      ;Signalling NaN? (Note Rtmp
        BNE     ConvertNaN2_NoTrap              ; becomes 0 = InvReas_SigNaN
        ASSERT  InvReas_SigNaN = 0              ; if so)
        TST     Rfpsr,#IOE_bit                  ;Yes. Is invalid op trapped?
        BNE     InvalidOp2TrapForSDE            ;If so, call trap handler
        ORR     Rfpsr,Rfpsr,#IOC_bit            ;Otherwise set cumulative bit
        ORR     OP2mhi,OP2mhi,#EIFracTop_bit    ; and quieten NaN

ConvertNaN2_NoTrap

; Now we can transfer the NaN to OP1sue/mhi/mlo and use shared code.

        MOV     OP1sue,OP2sue
        MOV     OP1mhi,OP2mhi
        MOV     OP1mlo,OP2mlo
        B       ConvertNaN1_NoTrap

;===========================================================================

; The following routine deals with invalid operation exceptions from monadic
; operations which produce a single, double or extended precision result.
; (I.e. all monadic CPDOs plus STFS, STFD and STFE.) It has a number of
; entry points:
;   * InvalidOp1ForSDE: deals with invalid operation exceptions from monadic
;     CPDOs, except for those produced by a signalling NaN operand (these
;     are dealt with by the ConvertNaN* routines above, plus the next entry
;     point);
;   * InvalidOp1TrapForSDE: deals with invalid operation traps from monadic
;     CPDOs (branched to by the ConvertNaN* routines above when there is a
;     signalling NaN and the exception is trapped);
;   * InvalidOp1TrapForSDE_STF: like InvalidOp1TrapForSDE, except that it
;     uses the CPDT bits to distinguish the instruction precision rather
;     than the CPDO/CPRT ones, and is therefore suitable for STFS, STFD and
;     STFE instructions.
;
; Entry: OP1sue = Operand sign, uncommon and exponent;
;        OP1mhi, OP1mlo = Operand mantissa;
;        Rarith holds the sign wanted for the result NaN in its top bit (to
;          match likely result from possible future hardware). This applies
;          to the "InvalidOp1ForSDE" entry point only, and will be ignored
;          if the exception is trapped.
;        Rfpsr = FPSR value, not updated for current instruction;
;        Rtmp holds a reason code for the invalid operation. This applies to
;          the "InvalidOp1ForSDE" entry point only, and will be ignored if
;          the exception is trapped.
;        Rins holds the instruction information;
;        Rwp, Rfp and Rsp hold their standard values;
;        R14 is the return link.
; Exit:  If the floating point result is uncommon, it is held in standard
;          internal format in OP1sue, OP1mhi and OP1mlo, and RNDexp and
;          Rarith are corrupt;
;        If the floating point result is common, it is held with sign and
;          exponent separated in OP1sue, OP1mhi, OP1mlo and RNDexp, while
;          Rarith holds 0 to indicate there's no guard, round and sticky
;          information (this case can only happen on trapped invalid
;          operation, and in that case the trap handler has already done the
;          rounding);
;        Rfpsr may be updated;
;        Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.
;        Returns NE if trap occurred, EQ if not (so all the entry points
;          except "InvalidOp1ForSDE" always return NE);

InvalidOp1ForSDE

; Is the trap enabled? If so, we'll need to call the trap handler.

        TST     Rfpsr,#IOE_bit
        BNE     InvalidOp1TrapForSDE

InvalidOp_Untrapped                     ;Shared code with other routines

; The trap is disabled, so we set the cumulative exception flag.

        ORR     Rfpsr,Rfpsr,#IOC_bit

; The floating point result is always a quiet NaN. In earlier versions, the
; reason code was involved in generating this quiet NaN; this is no longer
; the case (as hardware is extremely unlikely to ever include this
; refinement). The ORR instruction which is commented out below did this.

        ADR     OP1sue,Prototype_QuietNaN ;Create a NaN
        LDMIA   OP1sue,OP1regs

; Include the following instruction if the reason code in Rtmp should be
; inserted into the result NaN.
        ORR     OP1mhi,OP1mhi,Rtmp,LSL #8 ;KJB - uncommented

; Include the following instructions if the sign in Rarith should be
; inserted into the result NaN.

;        TST     Rarith,#Sign_bit
;        ORR     OP1sue,OP1sue,#Sign_bit
        MOVS    Rtmp,Rarith,LSR #32       ;KJB - corrected
        ORRCS   OP1sue,OP1sue,#Sign_bit

; Return.
        MOV     PC,LR                     ;Note we still have EQ from above

InvalidOp1TrapForSDE

; We've got a one-operand invalid operation exception from something other
; than an STF.

        STMFD   Rsp!,{OP2mhi,OP2mlo,Rwp,Rins,LR}

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Make enough space on the stack for our purposes and store away the
; operand.

        SUB     Rsp,Rsp,#12
        STMFD   Rsp!,OP1regs

; Determine whether this is a precise or imprecise trap.

        [ SCWanted
          TestImp R3,Rtmp,ImpreciseTableN_fpa
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = OP2sue

; Split according to the precision - note we can assume the CPDO/CPRT
; position of the precision bits in the instruction.

        TST     Rins,#Pr1_mask
        [ :LNOT:TrapsCanReturn
          BNE     veneer_invalidop1_extended
          TST     Rins,#Pr2_mask
          BEQ     veneer_invalidop1_single
          B       veneer_invalidop1_double
        |
          BNE     InvalidOp1TrapForE
          TST     Rins,#Pr2_mask
          BNE     InvalidOp1TrapForD

InvalidOp1TrapForS

; Call the veneer-defined trap handler.

          BL      veneer_invalidop1_single

PrepareTrapCommon_Single

; Obtain the single precision result from the stack, then branch to common
; code. Take care to make everything OK for core_abort.

          EnterRecursive 1,0,Rtmp,NoFPSRChange
          LDFS    F0,[Rtmp]
          B       PrepareTrapCommon
        ]

InvalidOp1TrapForSDE_STF

; We've got a one-operand invalid operation exception from an STF

        STMFD   Rsp!,{OP2mhi,OP2mlo,Rwp,Rins,LR}

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Make enough space on the stack for our purposes and store away the
; operand.

        SUB     Rsp,Rsp,#12
        STMFD   Rsp!,OP1regs

; Determine whether this is a precise or imprecise trap.

        [ SCWanted
          TestImp R3,Rtmp,ImpreciseTableN_fpa
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = OP2sue

; Split according to the precision - note we can assume the CPDT position of
; the precision bits in the instruction.

        TST     Rins,#DT_pr1_mask
        [ :LNOT:TrapsCanReturn
          BNE     veneer_invalidop1_extended
          TST     Rins,#DT_pr2_mask
          BEQ     veneer_invalidop1_single
          B       veneer_invalidop1_double
        |
          BNE     InvalidOp1TrapForE
          TST     Rins,#DT_pr2_mask
          BEQ     InvalidOp1TrapForS

InvalidOp1TrapForD

; Call the veneer-defined trap handler.

          BL      veneer_invalidop1_double

PrepareTrapCommon_Double

; Obtain the double precision result from the stack, then branch to common
; code.

          EnterRecursive 1,0,Rtmp,NoFPSRChange
          LDFD    F0,[Rtmp]
          B       PrepareTrapCommon

InvalidOp1TrapForE

; Call the veneer-defined trap handler.

          BL      veneer_invalidop1_extended

PrepareTrapCommon_Extended

; Obtain the extended precision result from the stack, then join common
; code.

          EnterRecursive 1,0,Rtmp,NoFPSRChange
          LDFE    F0,[Rtmp]

PrepareTrapCommon

; Get the possibly changed FPSR, taking care not to produce a recursive
; entry to the FPE.

          LDR     Rfpsr,MemFPSR ;Proper FPSR for FPE, top bit set if FPASC
          TEQ     Rfpsr,#0      ;Check whether FPASC
          RFSMI   Rfpsr         ;If so, get real FPSR

; Move the internal format result to OP1regs, then exit the recursive
; region. Note that the "ExitRecursive" macro throws away 6 words on the
; stack in addition to what the "EnterRecursive" macro claimed.

          ExitRecursive 1,24,Rtmp,F0,OP1regs

; If the returned value is common, we must split the sign from the exponent
; and indicate zero guard/round/sticky info in Rarith.

          ANDS    Rarith,OP1sue,#Uncommon_bit
          ANDEQ   RNDexp,OP1sue,#ToExp_mask
          ANDEQ   OP1sue,OP1sue,#Sign_bit

; Return with NE set.

          MOVS    Rtmp,#1
          LDMFD   Rsp!,{OP2mhi,OP2mlo,Rwp,Rins,PC}
        ]

;===========================================================================

; The following routine deals with invalid operation exceptions from dyadic
; operations which produce a single, double or extended precision result.
; (I.e. all dyadic CPDOs.) It has three entry points:
;   * InvalidOp2ForSDE: deals with invalid operation exceptions from dyadic
;     CPDOs, except for those produced by a signalling NaN operand (these
;     are dealt with by the ConvertNaN* routines above, plus the next entry
;     point);
;   * InvalidOp2ForSDE_SignEOR: just the same as "InvalidOp2ForSDE", except
;     that the sign bit in Rarith is generated by EORing the two operand
;     signs together (a frequent method).
;   * InvalidOp2TrapForSDE: deals with invalid operation traps from dyadic
;     CPDOs (branched to by the ConvertNaN* routines above when there is a
;     signalling NaN and the exception is trapped);
;
; Entry: OP1sue = First operand sign, uncommon and exponent;
;        OP1mhi, OP1mlo = First operand mantissa;
;        OP2sue = Second operand sign, uncommon and exponent;
;        OP2mhi, OP2mlo = Second operand mantissa;
;        Rarith holds the sign wanted for the result NaN in its top bit (to
;          match likely result from possible future hardware). This applies
;          to the "InvalidOp2ForSDE" entry point only, and will be ignored
;          if the exception is trapped.
;        Rfpsr = FPSR value, not updated for current instruction;
;        Rtmp holds a reason code for the invalid operation. This applies to
;          the "InvalidOp2ForSDE" entry point only, and will be ignored if
;          the exception is trapped.
;        Rins holds the instruction information;
;        Rwp, Rfp and Rsp hold their standard values;
;        R14 is the return link.
; Exit:  If the floating point result is uncommon, it is held in standard
;          internal format in OP1sue, OP1mhi and OP1mlo, and RNDexp and
;          Rarith are corrupt;
;        If the floating point result is common, it is held with sign and
;          exponent separated in OP1sue, OP1mhi, OP1mlo and RNDexp, while
;          Rarith holds 0 to indicate there's no guard, round and sticky
;          information (this case can only happen on trapped invalid
;          operation, and in that case the trap handler has already done the
;          rounding);
;        Rfpsr may be updated;
;        Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.
;        Returns NE if trap occurred, EQ if not (so all the entry points
;          except "InvalidOp2ForSDE" always return NE);

InvalidOp2ForSDE_SignEOR
        EOR     Rarith,OP1sue,OP2sue

InvalidOp2ForSDE

; Is the trap enabled? If so, we'll need to call the trap handler.

        TST     Rfpsr,#IOE_bit
        BEQ     InvalidOp_Untrapped

InvalidOp2TrapForSDE

; We've got a two-operand invalid operation trap.

        STMFD   Rsp!,{OP2mhi,OP2mlo,Rwp,Rins,LR}

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Make enough space on the stack for our purposes and store away the
; operands.

        STMFD   Rsp!,{OP1sue,OP1mhi,OP1mlo,OP2sue,OP2mhi,OP2mlo}

; Determine whether this is a precise or imprecise trap.

        [ SCWanted
          TestImp R3,Rtmp,ImpreciseTableN_fpa
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = OP2sue

; Split according to the precision - note we can assume the CPDO/CPRT
; position of the precision bits in the instruction.

        TST     Rins,#Pr1_mask
        [ :LNOT:TrapsCanReturn
          BNE     veneer_invalidop2_extended
          TST     Rins,#Pr2_mask
          BEQ     veneer_invalidop2_single
          B       veneer_invalidop2_double
        |
          BNE     InvalidOp2TrapForE
          TST     Rins,#Pr2_mask
          BNE     InvalidOp2TrapForD

InvalidOp2TrapForS

; Call the veneer-defined trap handler.

          BL      veneer_invalidop2_single
          B       PrepareTrapCommon_Single

InvalidOp2TrapForD

; Call the veneer-defined trap handler.

          BL      veneer_invalidop2_double
          B       PrepareTrapCommon_Double

InvalidOp2TrapForE

; Call the veneer-defined trap handler.

          BL      veneer_invalidop2_extended
          B       PrepareTrapCommon_Extended
        ]

;===========================================================================

; The following routine deals with invalid operation exceptions from monadic
; operations which produce an integer result. (I.e. FIX.)
;
; Entry: OP1sue = Operand sign, uncommon and exponent;
;        OP1mhi, OP1mlo = Operand mantissa;
;        Rarith holds the potential integer result - i.e. what the integer
;          result will be if a trap handler doesn't intervene;
;        Rfpsr = FPSR value, not updated for current instruction;
;        Rtmp holds a reason code for the invalid operation;
;        Rins holds the instruction information;
;        Rwp, Rfp and Rsp hold their standard values;
;        R14 is the return link.
; Exit:  Rarith and Rfpsr may be updated;
;        OP1sue, OP1mhi, OP1mlo, OP2sue, OP2mhi, OP2mlo, Rtmp, Rtmp2 and R14
;          may be corrupt;
;        All other registers preserved.

InvalidOp1ForI

; Is the trap enabled? If not, we simply return after setting the cumulative
; bit.

        TST     Rfpsr,#IOE_bit
        ORREQ   Rfpsr,Rfpsr,#IOC_bit
        MOVEQ   PC,LR

; We've got a one-operand integer invalid operation trap.

        STMFD   Rsp!,{Rwp,Rins,LR}

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Reserve some space on the stack and put the operand on the stack.

        SUB     Rsp,Rsp,#4
        STMFD   Rsp!,OP1regs

; This must be a precise trap.

        MOV     R3,#0
        ASSERT  R3 = OP2sue

; Call the veneer-defined trap handler.

        [ :LNOT:TrapsCanReturn
          B       veneer_invalidop1_integer
        |
          BL      veneer_invalidop1_integer

; Get the possibly changed FPSR, taking care not to produce a recursive
; entry to the FPE.

          LDR     Rfpsr,MemFPSR ;Proper FPSR for FPE, top bit set if FPASC
          TEQ     Rfpsr,#0      ;Check whether FPASC
          RFSMI   Rfpsr         ;If so, get real FPSR

; Get the integer result off the stack, discard the surplus stack space and
; return.

          LDR     Rarith,[Rsp],#16
          LDMFD   Rsp!,{Rwp,Rins,PC}
        ]

;===========================================================================

; The following routine deals with invalid operation exceptions from dyadic
; operations which produce an integer result. (I.e. compares.)
;
; Entry: OP1sue = Operand sign, uncommon and exponent;
;        OP1mhi, OP1mlo = Operand mantissa;
;        OP2sue = Operand sign, uncommon and exponent;
;        OP2mhi, OP2mlo = Operand mantissa;
;        Rarith holds the potential integer result - i.e. what the integer
;          result will be if a trap handler doesn't intervene;
;        Rfpsr = FPSR value, not updated for current instruction;
;        Rtmp holds a reason code for the invalid operation;
;        Rins holds the instruction information;
;        Rwp, Rfp and Rsp hold their standard values;
;        R14 is the return link.
; Exit:  Rarith and Rfpsr may be updated;
;        OP1sue, OP1mhi, OP1mlo, OP2sue, OP2mhi, OP2mlo, Rtmp, Rtmp2 and R14
;          may be corrupt;
;        All other registers preserved.

InvalidOp2ForI

; Is the trap enabled? If not, we simply return after setting the cumulative
; bit.

        TST     Rfpsr,#IOE_bit
        ORREQ   Rfpsr,Rfpsr,#IOC_bit
        MOVEQ   PC,LR

; We've got a two-operand integer invalid operation trap.

        STMFD   Rsp!,{Rwp,Rins,LR}

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Reserve some space on the stack and put the operands on the stack.

        STMFD   Rsp!,{OP1sue,OP1mhi,OP1mlo,OP2sue,OP2mhi,OP2mlo}

; This must be a precise trap.

        MOV     R3,#0
        ASSERT  R3 = OP2sue

; Call the veneer-defined trap handler.

        [ :LNOT:TrapsCanReturn
          B       veneer_invalidop2_integer
        |
          BL      veneer_invalidop2_integer

; Get the possibly changed FPSR, taking care not to produce a recursive
; entry to the FPE.

          LDR     Rfpsr,MemFPSR ;Proper FPSR for FPE, top bit set if FPASC
          TEQ     Rfpsr,#0      ;Check whether FPASC
          RFSMI   Rfpsr         ;If so, get real FPSR

; Get the integer result off the stack, discard the surplus stack space and
; return.

          LDR     Rarith,[Rsp],#24
          LDMFD   Rsp!,{Rwp,Rins,PC}
        ]

;===========================================================================

; The following routine deals with invalid operation traps from monadic
; operations which produce a packed or expanded packed result. (I.e. STFP.)
;
; Entry: OP1sue = Operand sign, uncommon and exponent;
;        OP1mhi, OP1mlo = Operand mantissa;
;        Rfpsr = FPSR value, not updated for current instruction;
;        Rtmp holds a reason code for the invalid operation;
;        Rins holds the instruction information;
;        Rwp, Rfp and Rsp hold their standard values;
;        R14 is the return link.
; Exit:  OP1sue, OP1mhi, OP1mlo and possibly Rarith hold the result;
;        Rfpsr may be updated;
;        OP2sue, OP2mhi, OP2mlo, Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

InvalidOp1TrapForPX

; We've got a one-operand packed invalid operation trap.

        STMFD   Rsp!,{Rwp,Rins,LR}

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Reserve some space on the stack and put the operand on the stack.

        SUB     Rsp,Rsp,#4
        STMFD   Rsp!,OP1regs

; This must be a precise trap.

        MOV     R3,#0
        ASSERT  R3 = OP2sue

; Split according to whether this is normal packed or expanded packed.

        [ :LNOT:TrapsCanReturn
          TST     Rfpsr,#EP_bit
          BNE     veneer_invalidop1_xpacked
          B       veneer_invalidop1_packed
        |
          TST     Rfpsr,#EP_bit
          BNE     InvalidOp1Trap_Expanded

InvalidOp1Trap_Packed

; Call the veneer-defined trap handler.

          BL      veneer_invalidop1_packed

; Load the result, throw away the surplus stack space and branch to common
; code.

          LDMFD   Rsp!,OP1regs
          ADD     Rsp,Rsp,#4

          B       InvalidOp1TrapForPX_Common

InvalidOp1Trap_Expanded

; Call the veneer-defined trap handler.

          BL      veneer_invalidop1_xpacked

; Load the result and join with common code.

          LDMFD   Rsp!,{OP1sue,OP1mhi,OP1mlo,Rarith}

InvalidOp1TrapForPX_Common

; Get the possibly changed FPSR, taking care not to produce a recursive
; entry to the FPE.

          LDR     Rfpsr,MemFPSR ;Proper FPSR for FPE, top bit set if FPASC
          TEQ     Rfpsr,#0      ;Check whether FPASC
          RFSMI   Rfpsr         ;If so, get real FPSR

; Return.

          LDMFD   Rsp!,{Rwp,Rins,PC}
        ]

;===========================================================================

Prototype_Infinity2
        DCD     &40007FFF,&00000000,&00000000

Prototype_QuietNaN
        DCD     &40007FFF,&40000000,&00000000

        [ SCWanted
; A table indicating which instructions yield imprecise exceptions. The
; first word relates to CPDOs, the second to CPRTs. Within each word, the
; bits are indexed by the 5-bit number consisting of bits 15,23,22,21,20 of
; the instruction, in that order.

ImpreciseTableN_fpa
          DCD     &C0070E3F,&00010001
        ]

;===========================================================================

; The following routine deals with divide-by-zero exceptions caused by
; monadic operations - i.e. by LOG and LGN instructions.
; Entry: OP1sue = Operand sign, uncommon and exponent;
;        OP1mhi, OP1mlo = Operand mantissa;
;        Rfpsr = FPSR value, not updated for current instruction;
;        Rins holds the instruction information;
;        Rwp, Rfp and Rsp hold their standard values;
;        R14 is the return link.
; Exit:  If the floating point result is uncommon, it is held in standard
;          internal format in OP1sue, OP1mhi and OP1mlo, and RNDexp and
;          Rarith are corrupt;
;        If the floating point result is common, it is held with sign and
;          exponent separated in OP1sue, OP1mhi, OP1mlo and RNDexp, while
;          Rarith holds 0 to indicate there's no guard, round and sticky
;          information (this case can only happen on trapped divide-by-zero,
;          and in that case the trap handler has already done the rounding);
;        Rfpsr may be updated;
;        OP2mhi, OP2mlo, Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

DivideByZero1

        CDebug0 4,"Divide by zero (monadic)"

; Is the trap enabled? If so, we'll need to call the trap handler.

        TST     Rfpsr,#DZE_bit
        BNE     DivideByZero1Trap

; The trap is disabled, so we set the cumulative exception flag.

        ORR     Rfpsr,Rfpsr,#DZC_bit

; The correct result is minus infinity.

        ADR     OP1sue,Prototype_Infinity2
        LDMIA   OP1sue,OP1regs
        ORR     OP1sue,OP1sue,#Sign_bit
        MOV     PC,LR

DivideByZero1Trap

; We've got a one-operand divide-by-zero trap.

        STMFD   Rsp!,{OP2mhi,OP2mlo,Rwp,Rins,LR}

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Reserve enough space on the stack for our purposes and put the operand on
; the stack.

        SUB     Rsp,Rsp,#12
        STMFD   Rsp!,OP1regs

; Determine whether this is a precise or imprecise trap.

        [ SCWanted
          TestImp R3,Rtmp,ImpreciseTableN_fpa
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = OP2sue

; Split according to precision, which we must determine from the instruction.

        TST     Rins,#Pr1_mask
        [ :LNOT:TrapsCanReturn
          BNE     veneer_zerodivide1_extended
          TST     Rins,#Pr2_mask
          BEQ     veneer_zerodivide1_single
          B       veneer_zerodivide1_double
        |
          BNE     DivideByZero1Trap_Extended
          TST     Rins,#Pr2_mask
          BNE     DivideByZero1Trap_Double

DivideByZero1Trap_Single

; Call the veneer-defined trap handler.

          BL      veneer_zerodivide1_single
          B       PrepareTrapCommon_Single
        
DivideByZero1Trap_Double

; Call the veneer-defined trap handler.

          BL      veneer_zerodivide1_double
          B       PrepareTrapCommon_Double

DivideByZero1Trap_Extended

; Call the veneer-defined trap handler.

          BL      veneer_zerodivide1_extended
          B       PrepareTrapCommon_Extended
        ]

;===========================================================================

; The following routine deals with divide-by-zero exceptions caused by
; dyadic operations - i.e. by DVF, RDF, FDV and FRD instructions.
; Entry: OP1sue = First operand sign, uncommon and exponent;
;        OP1mhi, OP1mlo = First operand mantissa;
;        OP2sue = Second operand sign, uncommon and exponent;
;        OP2mhi, OP2mlo = Second operand mantissa;
;        Rfpsr = FPSR value, not updated for current instruction;
;        Rins holds the instruction information;
;        Rwp, Rfp and Rsp hold their standard values;
;        R14 is the return link.
; Exit:  If the floating point result is uncommon, it is held in standard
;          internal format in OP1sue, OP1mhi and OP1mlo, and RNDexp and
;          Rarith are corrupt;
;        If the floating point result is common, it is held with sign and
;          exponent separated in OP1sue, OP1mhi, OP1mlo and RNDexp, while
;          Rarith holds 0 to indicate there's no guard, round and sticky
;          information (this case can only happen on trapped divide-by-zero,
;          and in that case the trap handler has already done the rounding);
;        Rfpsr may be updated;
;        OP2mhi, OP2mlo, Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

DivideByZero2

        CDebug0 4,"Divide by zero"

; Is the trap enabled? If so, we'll need to call the trap handler.

        TST     Rfpsr,#DZE_bit
        BNE     DivideByZero2Trap

; The trap is disabled, so we set the cumulative exception flag.

        ORR     Rfpsr,Rfpsr,#DZC_bit

; The correct result is an infinity, with sign equal to the exclusive-OR of
; the signs of the operands.

        EOR     Rtmp,OP1sue,OP2sue
        AND     Rtmp,Rtmp,#Sign_bit
        ADR     OP1sue,Prototype_Infinity2
        LDMIA   OP1sue,OP1regs
        ORR     OP1sue,OP1sue,Rtmp
        MOV     PC,LR

DivideByZero2Trap

; We've got a two-operand divide-by-zero trap.

        STMFD   Rsp!,{OP2mhi,OP2mlo,Rwp,Rins,LR}

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Make enough space on the stack for our purposes and store away the
; operands.

        STMFD   Rsp!,{OP1sue,OP1mhi,OP1mlo,OP2sue,OP2mhi,OP2mlo}

; Determine whether this is a precise or imprecise trap.

        [ SCWanted
          TestImp R3,Rtmp,ImpreciseTableN_fpa
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = OP2sue

; Split according to precision, which we must determine from the instruction.

        TST     Rins,#Pr1_mask
        [ :LNOT:TrapsCanReturn
          BNE     veneer_zerodivide2_extended
          TST     Rins,#Pr2_mask
          BEQ     veneer_zerodivide2_single
          B       veneer_zerodivide2_double
        |
          BNE     DivideByZero2Trap_Extended
          TST     Rins,#Pr2_mask
          BNE     DivideByZero2Trap_Double

DivideByZero2Trap_Single

; Call the veneer-defined trap handler.

          BL      veneer_zerodivide2_single
          B       PrepareTrapCommon_Single
        
DivideByZero2Trap_Double

; Call the veneer-defined trap handler.

          BL      veneer_zerodivide2_double
          B       PrepareTrapCommon_Double

DivideByZero2Trap_Extended

; Call the veneer-defined trap handler.

          BL      veneer_zerodivide2_extended
          B       PrepareTrapCommon_Extended
        ]

;===========================================================================

        END
