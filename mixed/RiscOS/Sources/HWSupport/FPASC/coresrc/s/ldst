; Assembler source for FPA support code and emulator
; ==================================================
; Routines to do load and store instructions.
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

; These routines work on numbers in the standard internal format. See
; "src.fpadefs" for a description of this format.

;===========================================================================

; Routine to prepare an internal format floating point number for storing by
; an STF instruction. This excludes STFP instructions.
;   This routine will not work correctly with an input which is an
; unnormalised URD result or an invalid internal format number. Exception:
; it will handle these values if the destination precision is extended.
;   There is only an FPASC entry point to this routine, since the FPE splits
; according to precision before doing this conversion.
; Entry: OP1sue = Operand sign, uncommon, exponent;
;        OP1mhi = Operand mantissa, high word;
;        OP1mlo = Operand mantissa, low word;
;        RNDprm = Precision derived from instruction, aligned to lie just
;          above the standard rounding mode field; the rounding mode is
;          always "to nearest" and its corresponding bits in this register
;          are always zero; note that the precision is assumed not to be
;          packed.
;        Rfpsr  = FPSR;
;        Rins   = instruction (needed for traps, and precision in some
;          cases);
;        Rwp, Rfp, Rsp hold their usual values;
;        R14    = return link.
; Exit:  OP1sue, (OP1mhi, (OP1mlo)) = words to be stored; OP1mhi is only
;          valid if the destination precision is double or extended, and
;          OP1mlo is only valid if the destination precision is extended;
;        RNDexp, RNDdir, Rarith, Rtmp, Rtmp2 and R14 may be corrupt;
;        Rfpsr may be updated;
;        All other registers preserved.

        [ SCWanted

STFConvertSC

; Split according to precision.

        CMP     RNDprm,#1:SHL:(RM_pos+2)
        BEQ     STFConvertSC_Double
        BHI     STFConvertSC_Extended
        B       STFConvertSC_Single

        ]

;===========================================================================

; Routine to prepare an internal format floating point number for storing by
; an STFS instruction.
;   This routine will not work correctly with an input which is an
; unnormalised URD result or an invalid internal format number.
;   There are two entry points to this routine, one for the FPE and the
; other for the FPASC. This is simply to optimise for the fact the operand
; is expected to be common for the FPE and uncommon for the FPASC.
; Entry: OP1sue = Operand sign, uncommon, exponent;
;        OP1mhi = Operand mantissa, high word;
;        OP1mlo = Operand mantissa, low word;
;        RNDprm = Precision derived from instruction, aligned to lie just
;          above the standard rounding mode field; the rounding mode is
;          always "to nearest" and its corresponding bits in this register
;          are always zero; note that the precision is assumed not to be
;          packed. (Only required for STFConvertSC_Single entry.)
;        Rfpsr  = FPSR;
;        Rins   = instruction (needed for traps, and precision in some
;          cases);
;        Rwp, Rfp, Rsp hold their usual values;
;        R14    = return link.
; Exit:  OP1sue = word to be stored;
;        RNDexp, RNDdir, Rarith, Rtmp, Rtmp2 and R14 may be corrupt;
;        Rfpsr may be updated;
;        All other registers preserved.

        [ FPEWanted

STFConvertFPE_Single

        [ DynamicRounding
          AND     Rtmp,Rfpsr,#RO_mask
          BiShift MOV,RNDprm,,Rtmp,LSR #RO_pos,LSL #RM_pos
        |
        MOV     RNDprm,#0:SHL:(RM_pos+2)
        ASSERT  RM_Nearest = 0
        ]

; If the value is common, it's comparatively easy to deal with.

        TST     OP1sue,#Uncommon_bit
        BNE     STFConvert_Single_Uncommon

        ]

STFConvert_Single_Common

; This value is common - i.e. zero, a normalised number or a URD result. It
; already been converted correctly if any of the following is true:
;
; * The value is a zero;
;
; * The value is an unnormalised URD result (since we don't care what the
;   conversion yields).
;
; This reduces to saying that the conversion is already done if the
; operand's units bit is 0.

        TST     OP1mhi,#EIUnits_bit
        MOVEQ   PC,LR

; Split out the exponent from the sign.

        AND     RNDexp,OP1sue,#ToExp_mask
        AND     OP1sue,OP1sue,#Sign_bit

STFConvert_Single_Normalised

; We want a fast track, to deal with the very common case that the value has
; already been rounded to the required destination precision. This is true
; if (a) the bottom 40 fractional bits are zero (i.e. the mantissa is
; already rounded); (b) the exponent lies in the correct range for single
; precision numbers.

        ORRS    RNDdir,OP1mlo,OP1mhi,LSL #24
        BNE     STFConvert_Single_RoundingNeeded

        [ CoreDebugging = 0
          ADR     Rtmp,ExpLimits_Single
        |
          ADRL    Rtmp,ExpLimits_Single
        ]
        LDMIA   Rtmp,{Rtmp,Rtmp2}
        ASSERT  Rtmp < Rtmp2
        CMP     RNDexp,Rtmp2
        CMPLE   Rtmp,RNDexp
        STMGTFD Rsp!,{LR}                               ;Get stack right
        BGT     STFConvert_Single_ExpOutOfRange         ;NB RNDdir=0 if taken

; OK - the value is a valid normalised single precision number, so we can
; convert it very simply and return.

        ORR     OP1sue,OP1sue,OP1mhi,LSR #8             ;Merge in mantissa
        BIC     OP1sue,OP1sue,#&00800000                ;Remove units bit
        SUB     Rtmp,RNDexp,#(EIExp_bias - SExp_bias)   ;Re-bias exponent
        ORR     OP1sue,OP1sue,Rtmp,LSL #23              ; and merge it in
        MOV     PC,LR

STFConvert_Single_RoundingNeeded

; Perform the rounding.

        STMFD   Rsp!,{LR}               ;Subroutine call(s) coming up

        MOV     RNDdir,#0               ;No rounding so far
        MOV     Rarith,#0               ;All rounding info in mantissa
        BL      RoundNum_Single         ;Do the rounding
        [ CoreDebugging = 0
          ADR     Rtmp,ExpLimits_Single
        |
          ADRL    Rtmp,ExpLimits_Single
        ]
        LDMIA   Rtmp,{Rtmp,Rtmp2}
        ASSERT  Rtmp < Rtmp2

; Check exponent against maximum and minimum allowed exponents for this
; precision: the lower limit is in Rtmp, the upper limit in Rtmp2.

        CMP     RNDexp,Rtmp2                            ;Check for overflow
        CMPLE   Rtmp,RNDexp                             ; or underflow
        BGT     STFConvert_Single_ExpOutOfRange
        ORR     OP1sue,OP1sue,RNDexp,LSL #EIExp_pos     ;Recombine exponent
                                                        ; with sign/uncommon

STFConvert_Single_InexactCheck

; If the result is exact, we don't want to do anything about the inexact
; exception. If it's inexact and the inexact trap is disabled, we want to
; set the inexact cumulative bit in the FPSR. If it's inexact and the
; inexact trap is enabled, we want to call the trap. We use some tricky
; code to distinguish the three cases in-line.

        CMP     RNDdir,#0       ;Leaves CS/EQ if exact, NE if inexact
        MOVNES  Rtmp,Rfpsr,LSR #IXE_pos+1
                                ;Now CS/EQ if exact, CS/NE if inexact &
                                ; trap enabled, CC/NE if inexact & trap
                                ; disabled (since SysID non-zero & not
        ASSERT  SysID_FPA <> 0  ; shifted out)
        ASSERT  SysID_FPE <> 0
        ASSERT  SysID_pos > IXE_pos
        ORRCC   Rfpsr,Rfpsr,#IXC_bit
        BLHI    InexactTrapForS ;Works because HI = CS/NE

        LDMFD   Rsp!,{LR}

STFConvert_Single_Ready

        CDebug3 4,"Single precision number to convert is",OP1sue,OP1mhi,OP1mlo

; We're now ready to convert whatever we've got in (OP1sue,OP1mhi,OP1mlo) at
; this point to a single precision number. We know that it has been created
; in one of the following ways:
;   * As a rounded single precision number that did not cause any exception
;     other than an untrapped inexact exception;
;   * As an infinity or maximum single precision normalised number created
;     by an untrapped overflow exception;
;   * As a single precision normalised or denormalised number, not converted
;     into an extended normalised number, created by an untrapped underflow
;     exception;
;   * As any type of infinity or a single precision NaN, which will have
;     come unchanged through to here;
;   * As a quiet NaN generated by converting a non-single NaN without a
;     trapped invalid operation exception occurring;
;   * As a number loaded by an LDFS instruction from the result of a veneer
;     trap handler routine.
;
; This allows us to classify the types of bit pattern that are possible or
; impossible at this stage as follows (see the table in "src.core.fpadefs"
; for explanations of the terminology):
;
;   Possible                            Impossible
;   -----------------------------------------------------------------------
;   Normalised number with exponent     Normalised number with exponent
;     and fraction within single          and/or fraction outside single
;     precision limits                    precision limits
;   Zero                                Extended denormalised number
;   Extended infinity                   Extended unnormalised number
;   Anomalous extended infinity         Extended unnormalised zero
;   Double infinity                     Extended NaN
;   Single denormalised number          Double denormalised number
;   Single infinity                     Double NaN
;   Single NaN
;
; We can therefore split into the following cases:
;   Uncommon bit = 1, exponent <= &3FFF - convert as if single denormalised:
;     OP1sue := Bit 31:      OP1sue[31]
;               Bits 30..23: 00000000
;               Bits 22..0:  OP1mhi[30:8]
;   Uncommon bit = 1, exponent >= &4000 - convert as if NaN/infinity:
;     OP1sue := Bit 31:      OP1sue[31]
;               Bits 30..23: 11111111
;               Bits 22..0:  OP1mhi[30:8]
;   Uncommon bit = 0, units bit = 0 - convert as if zero:
;     OP1sue := Bit 31:      OP1sue[31]
;               Bits 30..23: 00000000
;               Bits 22..0:  OP1mhi[30:8]
;   Uncommon bit = 0, units bit = 1 - convert as if single normalised:
;     OP1sue := Bit 31:      OP1sue[31]
;               Bits 30..23: RNDexp[7:0] EOR &80
;               Bits 22..0:  OP1mhi[30:8]
;
; Note that in the case of the uncommon bit and units bits being zero, we
; know that the exponent will also be zero. This allows us to share some
; code, with zeros and uncommon values being treated one way, normalised
; numbers another.
;   We use a tricky test for the normalised number combination...

        BICS    Rtmp,OP1mhi,OP1sue,LSL #EIUnits_pos-Uncommon_pos
        ASSERT  EIUnits_pos = 31
        BPL     STFConvert_Single_Ready_UncommonOrZero

STFConvert_Single_Ready_Normalised

; The number is a single precision normalised number, so do the conversion
; described above.

        EORS    OP1sue,OP1sue,#&80      ;Convert exponent, N <- sign
        ASSERT  Sign_pos = 31
        MOV     Rtmp,OP1mhi,LSL #1      ;Discard units bit
        ASSERT  EIUnits_pos = 31
        MOV     Rtmp,Rtmp,LSR #9        ;Merge fraction and exponent
        ORR     OP1sue,Rtmp,OP1sue,LSL #23
        BICPL   OP1sue,OP1sue,#Sign_bit ;Re-insert sign
        ORRMI   OP1sue,OP1sue,#Sign_bit
        MOV     PC,LR

STFConvert_Single_Ready_UncommonOrZero

; We need to assemble a value in OP1sue as follows:
;   New bit 31      = old OP1sue bit 31
;   New bits 30..23 = old OP1sue bit 14
;   New bits 22..0  = old OP1mhi bits 30..8

        MOVS    OP1sue,OP1sue,ASR #15           ;Bit 31 -> N, bit 14 -> C
        BICCC   OP1sue,OP1mhi,#TopBit           ;Put bit 14 above fraction
        ORRCS   OP1sue,OP1mhi,#TopBit
        MOV     OP1sue,OP1sue,ASR #8            ;Replicate bit 14
        BICPL   OP1sue,OP1sue,#TopBit           ;And insert bit 31
        ORRMI   OP1sue,OP1sue,#TopBit
        MOV     PC,LR

STFConvert_Single_ExpOutOfRange

; We've got overflow or underflow. Call the appropriate routine, returning
; to STFConvert_Single_InexactCheck.

        ADR     R14,STFConvert_Single_InexactCheck
        SUBS    Rtmp,Rtmp,RNDexp
        BGT     UnderflowForMem
        B       Overflow

        [ SCWanted

STFConvertSC_Single

; If the value is common, it's comparatively easy to deal with.

        TST     OP1sue,#Uncommon_bit
        BEQ     STFConvert_Single_Common

        ]

STFConvert_Single_Uncommon

; Only uncommon values will get here. First split out NaNs and infinities.

        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op is NaN/inf)
        BMI     STFConvert_Single_NaNInf

; The value is an uncommon numeric value - i.e. a denormalised number, an
; extended unnormalised number or an extended unnormalised zero. If it's the
; last of these, we can convert it easily.

        ORRS    Rtmp,OP1mhi,OP1mlo
        ANDEQ   OP1sue,OP1sue,#Sign_bit
        MOVEQ   PC,LR

; Extract exponent.

        AND     RNDexp,OP1sue,#ToExp_mask

; Is this already a single precision denorm? If so, we just need to put it
; into store format.

        TST     OP1mhi,#EIUnits_bit     ;NE if single/double denormalised
        CMPNE   RNDexp,#DenormExp_Double ;NE if single denormalised
        BNE     STFConvert_Single_Ready_UncommonOrZero

; Otherwise, extract the sign, then change it to extended unnormalised if it
; is double denormalised.

        AND     OP1sue,OP1sue,#Sign_bit

        TST     OP1mhi,#EIUnits_bit     ;NE if double denormalised
        BICNE   OP1mhi,OP1mhi,#EIUnits_bit
        ADDNE   RNDexp,RNDexp,#1

; Then normalise it as an extended precision number (possibly getting a
; negative biased exponent) and treat it as a normalised number.

        STMFD   Rsp!,{LR}
        BL      NormaliseOp1
        LDMFD   Rsp!,{LR}
        B       STFConvert_Single_Normalised

STFConvert_Single_NaNInf

; The operand is a NaN or infinity. If it's an infinity, it must simply
; become the standard single precision infinity; if it's a NaN, we have to
; worry about the implicit conversion, whether we've got an invalid
; operation, etc.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1       ;Check for infinity
        BEQ     STFConvert_Single_Ready_UncommonOrZero

        STMFD   Rsp!,{LR}
        [ SigNaNCopy_OK
          BL      NaNConversionNeededForSTF
          TEQ     Rarith,#0                     ;Conversion needed?
          BLPL    ConvertNaN1_ForSTF            ;Convert it if so
        |
          BL      ConvertNaN1_ForSTF            ;Always convert the NaN
        ]
        LDMFD   Rsp!,{LR}

; Note that, because of the possibility of a trap handler having intervened,
; we do not know that what we've got is still a NaN or infinity. So we just
; use the general purpose routine.

        B       STFConvert_Single_Ready

;===========================================================================

; Routine to prepare an internal format floating point number for storing by
; an STFD instruction.
;   This routine will not work correctly with an input which is an
; unnormalised URD result or an invalid internal format number.
;   There are two entry points to this routine, one for the FPE and the
; other for the FPASC. This is simply to optimise for the fact the operand
; is expected to be common for the FPE and uncommon for the FPASC.
; Entry: OP1sue = Operand sign, uncommon, exponent;
;        OP1mhi = Operand mantissa, high word;
;        OP1mlo = Operand mantissa, low word;
;        RNDprm = Precision derived from instruction, aligned to lie just
;          above the standard rounding mode field; the rounding mode is
;          always "to nearest" and its corresponding bits in this register
;          are always zero; note that the precision is assumed not to be
;          packed. (Only needed for the STFConvertSC_Double entry point.)
;        Rfpsr  = FPSR;
;        Rins   = instruction (needed for traps, and precision in some
;          cases);
;        Rwp, Rfp, Rsp hold their usual values;
;        R14    = return link.
; Exit:  OP1sue, OP1mhi = words to be stored;
;        RNDexp, RNDdir, Rarith, Rtmp, Rtmp2 and R14 may be corrupt;
;        Rfpsr may be updated;
;        All other registers preserved.

        [ FPEWanted

STFConvertFPE_Double

        MOV     RNDprm,#1:SHL:(RM_pos+2)
        [ DynamicRounding
          AND     Rtmp,Rfpsr,#RO_mask
          BiShift ORR,RNDprm,RNDprm,Rtmp,LSR #RO_pos,LSL #RM_pos
        |
        ASSERT  RM_Nearest = 0
        ]

; If the value is common, it's comparatively easy to deal with.

        TST     OP1sue,#Uncommon_bit
        BNE     STFConvert_Double_Uncommon

        ]

STFConvert_Double_Common

; This value is common - i.e. zero, a normalised number or a URD result. It
; already been converted correctly if any of the following is true:
;
; * The value is a zero;
;
; * The value is an unnormalised URD result (since we don't care what the
;   conversion yields).
;
; This reduces to saying that the conversion is already done if the
; operand's units bit is 0.

        TST     OP1mhi,#EIUnits_bit
        MOVEQ   PC,LR

; Split out the exponent from the sign.

        AND     RNDexp,OP1sue,#ToExp_mask
        AND     OP1sue,OP1sue,#Sign_bit

STFConvert_Double_Normalised

; We want a fast track, to deal with the very common case that the value has
; already been rounded to the required destination precision. This is true
; if (a) the bottom 11 fractional bits are zero (i.e. the mantissa is
; already rounded); (b) the exponent lies in the correct range for double
; precision numbers.

        MOVS    RNDdir,OP1mlo,LSL #21
        BNE     STFConvert_Double_RoundingNeeded

        [ CoreDebugging = 0
          ADR     Rtmp,ExpLimits_Double
        |
          ADRL    Rtmp,ExpLimits_Double
        ]
        LDMIA   Rtmp,{Rtmp,Rtmp2}
        ASSERT  Rtmp < Rtmp2
        CMP     RNDexp,Rtmp2
        CMPLE   Rtmp,RNDexp
        STMGTFD Rsp!,{LR}                               ;Get stack right
        BGT     STFConvert_Double_ExpOutOfRange         ;NB RNDdir=0 if taken

; OK - the value is a valid normalised double precision number, so we can
; convert it very simply and return.

        ORR     OP1sue,OP1sue,OP1mhi,LSR #11            ;Merge in mantissa
        BIC     OP1sue,OP1sue,#&00100000                ;Remove units bit
        SUB     Rtmp,RNDexp,#(EIExp_bias - DExp_bias)   ;Re-bias exponent
        ORR     OP1sue,OP1sue,Rtmp,LSL #20              ; and merge it in
        MOV     OP1mhi,OP1mhi,LSL #21                   ;Construct fraction
        ORR     OP1mhi,OP1mhi,OP1mlo,LSR #11            ; low word
        MOV     PC,LR

STFConvert_Double_RoundingNeeded

; Perform the rounding.

        STMFD   Rsp!,{LR}               ;Subroutine call(s) coming up

        MOV     RNDdir,#0               ;No rounding so far
        MOV     Rarith,#0               ;All rounding info in mantissa
        BL      RoundNum_Double         ;Do the rounding
        [ CoreDebugging = 0
          ADR     Rtmp,ExpLimits_Double
        |
          ADRL    Rtmp,ExpLimits_Double
        ]
        LDMIA   Rtmp,{Rtmp,Rtmp2}

; Check exponent against maximum and minimum allowed exponents for this
; precision: the lower limit is in Rtmp, the upper limit in Rtmp2.

        CMP     RNDexp,Rtmp2                            ;Check for overflow
        CMPLE   Rtmp,RNDexp                             ; or underflow
        BGT     STFConvert_Double_ExpOutOfRange
        ORR     OP1sue,OP1sue,RNDexp,LSL #EIExp_pos     ;Recombine exponent
                                                        ; with sign/uncommon

STFConvert_Double_InexactCheck

; If the result is exact, we don't want to do anything about the inexact
; exception. If it's inexact and the inexact trap is disabled, we want to
; set the inexact cumulative bit in the FPSR. If it's inexact and the
; inexact trap is enabled, we want to call the trap. We use some tricky
; code to distinguish the three cases in-line.

        CMP     RNDdir,#0       ;Leaves CS/EQ if exact, NE if inexact
        MOVNES  Rtmp,Rfpsr,LSR #IXE_pos+1
                                ;Now CS/EQ if exact, CS/NE if inexact &
                                ; trap enabled, CC/NE if inexact & trap
                                ; disabled (since SysID non-zero & not
        ASSERT  SysID_FPA <> 0  ; shifted out)
        ASSERT  SysID_FPE <> 0
        ASSERT  SysID_pos > IXE_pos
        ORRCC   Rfpsr,Rfpsr,#IXC_bit
        BLHI    InexactTrapForD ;Works because HI = CS/NE

        LDMFD   Rsp!,{LR}

STFConvert_Double_Ready

        CDebug3 4,"Double precision number to convert is",OP1sue,OP1mhi,OP1mlo

; We're now ready to convert whatever we've got in (OP1sue,OP1mhi,OP1mlo) at
; this point to a double precision number. We know that it has been created
; in one of the following ways:
;   * As a rounded double precision number that did not cause any exception
;     other than an untrapped inexact exception;
;   * As an infinity or maximum double precision normalised number created
;     by an untrapped overflow exception;
;   * As a double precision normalised or denormalised number, not converted
;     into an extended normalised number, created by an untrapped underflow
;     exception;
;   * As any type of infinity or a double precision NaN, which will have
;     come unchanged through to here;
;   * As a quiet NaN generated by converting a non-double NaN without a
;     trapped invalid operation exception occurring;
;   * As a number loaded by an LDFD instruction from the result of a veneer
;     trap handler routine.
;
; This allows us to classify the types of bit pattern that are possible or
; impossible at this stage as follows (see the table in "src.core.fpadefs"
; for explanations of the terminology):
;
;   Possible                            Impossible
;   -----------------------------------------------------------------------
;   Normalised number with exponent     Normalised number with exponent
;     and fraction within single          and/or fraction outside single
;     precision limits                    precision limits
;   Zero                                Extended denormalised number
;   Extended infinity                   Extended unnormalised number
;   Anomalous extended infinity         Extended unnormalised zero
;   Double denormalised number          Extended NaN
;   Double infinity                     Single denormalised number
;   Double NaN                          Single NaN
;   Single infinity
;
; We can therefore split into the following cases:
;   Uncommon bit = 1, exponent <= &3FFF - convert as if double denormalised:
;     OP1sue := Bit 31:      OP1sue[31]
;               Bits 30..20: 00000000000
;               Bits 19..0:  OP1mhi[30:11]
;     OP1mhi := OP1mhi[10:0], OP1mlo[31:11]
;   Uncommon bit = 1, exponent >= &4000 - convert as if NaN/infinity:
;     OP1sue := Bit 31:      OP1sue[31]
;               Bits 30..20: 11111111111
;               Bits 19..0:  OP1mhi[30:11]
;     OP1mhi := OP1mhi[10:0], OP1mlo[31:11]
;   Uncommon bit = 0, units bit = 0 - convert as if zero:
;     OP1sue := Bit 31:      OP1sue[31]
;               Bits 30..20: 00000000000
;               Bits 19..0:  OP1mhi[30:11]
;     OP1mhi := OP1mhi[10:0], OP1mlo[31:11]
;   Uncommon bit = 0, units bit = 1 - convert as if normalised:
;     OP1sue := Bit 31:      OP1sue[31]
;               Bits 30..20: RNDexp[10:0] EOR &400
;               Bits 19..0:  OP1mhi[30:11]
;     OP1mhi := OP1mhi[10:0], OP1mlo[31:11]
;
; Note that in the case of the uncommon bit and units bits being zero, we
; know that the exponent will also be zero. This allows us to share some
; code, with zeros and uncommon values being treated one way, normalised
; numbers another.
;   We use a tricky test for the normalised number combination...

        BICS    Rtmp,OP1mhi,OP1sue,LSL #EIUnits_pos-Uncommon_pos
        ASSERT  EIUnits_pos = 31
        BPL     STFConvert_Double_Ready_UncommonOrZero

STFConvert_Double_Ready_Normalised

; The number is a double precision normalised number, so do the conversion
; described above.

        EORS    OP1sue,OP1sue,#&400             ;Convert exponent, N <- sign
        ASSERT  Sign_pos = 31
        MOV     Rtmp,OP1mhi,LSL #1              ;Discard units bit
        ASSERT  EIUnits_pos = 31
        MOV     Rtmp,Rtmp,LSR #12               ;Merge fraction and exponent
        ORR     OP1sue,Rtmp,OP1sue,LSL #20
        BICPL   OP1sue,OP1sue,#Sign_bit         ;Re-insert sign
        ORRMI   OP1sue,OP1sue,#Sign_bit
        MOV     OP1mhi,OP1mhi,LSL #21           ;Then create second word
        ORR     OP1mhi,OP1mhi,OP1mlo,LSR #11
        MOV     PC,LR

STFConvert_Double_Ready_UncommonOrZero

; We need to assemble a value in OP1sue as follows:
;   New bit 31      = old OP1sue bit 31
;   New bits 30..20 = old OP1sue bit 14
;   New bits 19..0  = old OP1mhi bits 30..11

        MOVS    OP1sue,OP1sue,ASR #15           ;Bit 31 -> N, bit 14 -> C
        BICCC   OP1sue,OP1mhi,#TopBit           ;Put bit 14 above fraction
        ORRCS   OP1sue,OP1mhi,#TopBit
        MOV     OP1sue,OP1sue,ASR #11           ;Replicate bit 14
        BICPL   OP1sue,OP1sue,#TopBit           ;And insert bit 31
        ORRMI   OP1sue,OP1sue,#TopBit
        MOV     OP1mhi,OP1mhi,LSL #21           ;Then create second word
        ORR     OP1mhi,OP1mhi,OP1mlo,LSR #11
        MOV     PC,LR

STFConvert_Double_ExpOutOfRange

; We've got overflow or underflow. Call the appropriate routine, returning
; to STFConvert_Double_InexactCheck.

        ADR     R14,STFConvert_Double_InexactCheck
        SUBS    Rtmp,Rtmp,RNDexp
        BGT     UnderflowForMem
        B       Overflow

        [ SCWanted

STFConvertSC_Double

; If the value is common, it's comparatively easy to deal with.

        TST     OP1sue,#Uncommon_bit
        BEQ     STFConvert_Double_Common

        ]

STFConvert_Double_Uncommon

; Only uncommon values will get here. First split out NaNs and infinities.

        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op is NaN/inf)
        BMI     STFConvert_Double_NaNInf

; The value is an uncommon numeric value - i.e. a denormalised number, an
; extended unnormalised number or an extended unnormalised zero. If it's the
; last of these, we can convert it easily.

        ORRS    Rtmp,OP1mhi,OP1mlo
        ANDEQ   OP1sue,OP1sue,#Sign_bit
        MOVEQ   PC,LR

STFConvert_Double_UnnormDenorm

; Extract exponent.

        AND     RNDexp,OP1sue,#ToExp_mask

; Is this already a double precision denorm? If so, we just need to put it
; into store format.

        TST     OP1mhi,#EIUnits_bit     ;NE if single/double denormalised
        CMPNE   RNDexp,#DenormExp_Single ;NE if double denormalised
        BNE     STFConvert_Double_Ready_UncommonOrZero

; Otherwise, extract the sign, then change it to extended unnormalised if it
; is single denormalised.

        AND     OP1sue,OP1sue,#Sign_bit

        TST     OP1mhi,#EIUnits_bit     ;NE if single denormalised
        BICNE   OP1mhi,OP1mhi,#EIUnits_bit
        ADDNE   RNDexp,RNDexp,#1

; Then normalise it as an extended precision number (possibly getting a
; negative biased exponent) and treat it as common.

        STMFD   Rsp!,{LR}
        BL      NormaliseOp1
        LDMFD   Rsp!,{LR}
        B       STFConvert_Double_Normalised

STFConvert_Double_NaNInf

; The operand is a NaN or infinity. If it's an infinity, it must simply
; become the standard double precision infinity; if it's a NaN, we have to
; worry about the implicit conversion, whether we've got an invalid
; operation, etc.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1       ;Check for infinity
        BEQ     STFConvert_Double_Ready_UncommonOrZero

        STMFD   Rsp!,{LR}
        [ SigNaNCopy_OK
          BL      NaNConversionNeededForSTF
          TEQ     Rarith,#0                     ;Conversion needed?
          BLPL    ConvertNaN1_ForSTF            ;Convert it if so
        |
          BL      ConvertNaN1_ForSTF            ;Always convert the NaN
        ]
        LDMFD   Rsp!,{LR}

; Note that, because of the possibility of a trap handler having intervened,
; we do not know that what we've got is still a NaN or infinity. So we just
; use the general purpose routine.

        B       STFConvert_Double_Ready

;===========================================================================

; Routine to prepare an internal format floating point number for storing by
; an STFE instruction.
;   As usual, there are two entry points to this routine, one for the FPE
; and the other for the FPASC.
; Entry: OP1sue = Operand sign, uncommon, exponent;
;        OP1mhi = Operand mantissa, high word;
;        OP1mlo = Operand mantissa, low word;
;        RNDprm = Precision derived from instruction, aligned to lie just
;          above the standard rounding mode field; the rounding mode is
;          always "to nearest" and its corresponding bits in this register
;          are always zero; note that the precision is assumed not to be
;          packed. (Only needed for STFConvertSC_Extended entry point.)
;        Rfpsr  = FPSR;
;        Rins   = instruction (needed for traps, and precision in some
;          cases);
;        Rwp, Rfp, Rsp hold their usual values;
;        R14    = return link.
; Exit:  OP1sue, OP1mhi, OP1mlo = words to be stored;
;        RNDexp, RNDdir, Rarith, Rtmp, Rtmp2 and R14 may be corrupt;
;        Rfpsr may be updated;
;        All other registers preserved.

        [ SCWanted

STFConvertSC_Extended

; If the value is common, it's already converted - so don't change it!

        TST     OP1sue,#Uncommon_bit
        MOVEQ   PC,LR

        ]

        [ FPEWanted

STFConvertFPE_Extended

        ]

; Split out NaNs and infinities.

        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op is NaN/inf)
        BMI     STFConvert_Extended_NaNInf

; The value is an uncommon numeric value - i.e. a denormalised number, an
; extended unnormalised number or an extended unnormalised zero. If it's the
; last of these, we can convert it easily.

        CDebug0 4,"This is an uncommon numeric value"

        ORRS    Rtmp,OP1mhi,OP1mlo
        ANDEQ   OP1sue,OP1sue,#Sign_bit
        MOVEQ   PC,LR

; If the number is in fact a single or double denormalised number (indicated
; by its units bit being a 1), we have to adjust its exponent and units bit.
; Then we need to normalise/denormalise it if its exponent is not already
; zero.

        Exp2Top Rarith,OP1sue
        AND     OP1sue,OP1sue,#Sign_bit
        TST     OP1mhi,#EIUnits_bit
        BICNE   OP1mhi,OP1mhi,#EIUnits_bit
        ADDNE   Rarith,Rarith,#1:SHL:(32-EIExp_len)
        TEQ     Rarith,#0
        BNE     NormDenormOp1
        AND     OP1sue,OP1sue,#Sign_bit
        MOV     PC,LR

STFConvert_Extended_NaNInf

        CDebug0 4,"This is a NaN or infinity"

; The operand is a NaN or infinity. If it's an infinity, it must simply
; become the standard infinity of the correct precision; if it's a NaN, we
; have worry about the implicit conversion, whether we've got an invalid
; operation, etc.

        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1       ;Check for infinity
        BEQ     STFConvert_Extended_Ready

        STMFD   Rsp!,{LR}
        [ SigNaNCopy_OK
          BL      NaNConversionNeededForSTF
          TEQ     Rarith,#0                     ;Conversion needed?
          BLPL    ConvertNaN1_ForSTF            ;Convert it if so
        |
          BL      ConvertNaN1_ForSTF            ;Always convert the NaN
        ]
        LDMFD   Rsp!,{LR}

; Note that, because of the possibility of a trap handler having intervened,
; we do not know that what we've got is still a NaN or infinity. So we just
; use the general purpose routine.

STFConvert_Extended_Ready

; We're now ready to convert whatever we've got at this point to a extended
; precision number. Note that because of the possibility of traps, we can in
; fact have any value at all at this point. However, the specification of
; the trap handlers (at the core/veneer interface) ensures that they *don't*
; return a value of the wrong precision, to avoid recursion problems: we may
; therefore safely assume the value we've got now is a valid extended
; precision value.
;
; There is one exception to this. We cannot assume that an infinity has the
; correct precision: the fact that there are different representations for
; different precisions of infinity is purely one of convenience in handling
; LDF instructions (in both the FPA and the FPE). There is no logical
; distinction between them; arithmetic routines make no attempt to create
; the correct one, they don't get converted before this stage, etc. We
; therefore have to cope with all types of infinities here.
;
; So apart from checking for wrong precision infinities and converting them
; to standard extended precision infinities, we simply have to clear the
; uncommon bit and return.
;
; Looking at the possible internal format numbers, the non-standard extended
; precision infinities can be identified by uncommon bit = units bit = 1,
; fraction = 0.

        TST     OP1mhi,OP1sue,LSL #31-Uncommon_pos
        ASSERT  EIUnits_pos = 31
        BIC     OP1sue,OP1sue,#Uncommon_bit
        MOVPL   PC,LR
        ORRS    Rtmp,OP1mlo,OP1mhi,LSL #1
        MOVNE   PC,LR
        ORR     OP1sue,OP1sue,#(NaNInfExp_Extended:SHL:EIExp_pos):AND:&FF
        ORR     OP1sue,OP1sue,#(NaNInfExp_Extended:SHL:EIExp_pos):AND:&FF00
        BIC     OP1mhi,OP1mhi,#EIUnits_bit
        ASSERT  (NaNInfExp_Extended:SHL:EIExp_pos) <= &FFFF
        MOV     PC,LR

;===========================================================================

ExpLimits_Single
        DCD     SMin_Exp,SMax_Exp

ExpLimits_Double
        DCD     DMin_Exp,DMax_Exp

;===========================================================================

; To keep the "powers of ten" table addressable, we put the "uncommon" part
; of STFP conversion here.

        [ :LNOT:NoPacked

STFConvert_Packed_Uncommon

; Split out NaNs and infinities.

        TNaNInf Rtmp,OP1sue,OP1mhi              ;Rtmp[31] := (op is NaN/inf)
        BMI     STFConvert_Packed_NaNInf

; The value is an uncommon numeric value - i.e. a denormalised number, an
; extended unnormalised number or an extended unnormalised zero. If it's the
; last of these, we can convert it easily.

        ORRS    Rarith,OP1mhi,OP1mlo    ;Test for zero & make 4th converted
                                        ; word in case it's Expanded Packed
        ANDEQ   OP1sue,OP1sue,#Sign_bit ;Make 1st converted word and return
        MOVEQ   PC,LR                   ; (NB 2nd & 3rd words are OK)

; Otherwise, extract exponent.

        AND     RNDexp,OP1sue,#ToExp_mask

; Then change it to extended unnormalised if it is single or double
; denormalised.

        TST     OP1mhi,#EIUnits_bit     ;NE if single/double denormalised
        BICNE   OP1mhi,OP1mhi,#EIUnits_bit
        ADDNE   RNDexp,RNDexp,#1

; Then normalise it as an extended precision number (possibly getting a
; negative biased exponent) and treat it as a normalised number, except that
; we need to keep track of the difference between the OP1sue and RNDexp
; exponents in OP2mhi.

        STMFD   Rsp!,{LR}
        BL      NormaliseOp1
        LDMFD   Rsp!,{LR}
        BIC     OP1sue,OP1sue,#Uncommon_bit     ;Treat as common
        AND     OP2mhi,OP1sue,#ToExp_mask       ;Calculate exp difference
        SUB     OP2mhi,OP2mhi,RNDexp
        B       STFConvert_Packed_Number

STFConvert_Packed_NaNInf

; This is an infinity or NaN. We don't need to know which: we can simply
; convert the fraction bits on the basis that the top fraction bit indicates
; whether the NaN is signalling or quiet and the remaining 62 fraction bits
; are treated as an integer and converted to a 19 digit decimal integer
; (with the first digit equal to 4 or less, so we won't run into any sort of
; conflict about setting the top fraction bit in normal packed format).
;   However, we will reorder the number somewhat before we get to work,
; since we want the low numbered NaNs to be the ones that are preserved
; across all precisions. So we will in fact rearrange them to consist of the
; bottom 11 fraction bits followed by the 29 lying above them, followed by
; the 22 fraction bits lying between them and the top fraction bit.
;   Do first things first, though: if this is a signalling NaN, we've got an
; invalid operation exception.

        ORRS    Rtmp,OP1mhi,OP1mlo              ;OK if an infinity
        BEQ     STFConvert_Packed_NaNInf_Convert
        TST     OP1sue,#EIFracTop_bit           ;Also OK if a quiet NaN
        BNE     STFConvert_Packed_NaNInf_Convert

        TST     Rfpsr,#IOE_bit                  ;Is trap enabled?
        BNE     InvalidOp1TrapForPX             ;If so, call trap handler
                                                ;Otherwise, convert as quiet

STFConvert_Packed_NaNInf_Convert

; KJB change - ARM core 1.13 does not do this any longer, due to its removal
; of NaN reason codes. Reinstated. 1.13 code was:
;
;        BIC     OP2mhi,OP1mhi,#EIUnits_bit+EIFracTop_bit
;        MOV     OP2mlo,OP2mlo

; Rearrange the integer to be converted.

        MOV     Rtmp,OP1mlo,LSR #11             ;Get middle part
        ORR     Rtmp,Rtmp,OP1mhi,LSL #21
        BIC     Rtmp,Rtmp,#&E0000000
        BIC     OP2mlo,OP1mhi,#&C0000000        ;Get top part
        MOV     OP2mlo,OP2mlo,LSR #8
        MOV     OP2mhi,OP1mlo,LSL #19           ;Get bottom part
        BIC     OP2mhi,OP2mhi,#&C0000000
        ORR     OP2mlo,OP2mlo,Rtmp,LSL #22      ;Merge together
        ORR     OP2mhi,OP2mhi,Rtmp,LSR #10

; Now we have the sign (plus junk) in OP1sue; the top bit of the fraction in
; OP1mhi and the number we wish to convert in (OP2mhi,OP2mlo). Put the top
; bit of the fraction into OP1sue and set the exponent field on the
; assumption that this is normal packed format: if it is in fact expanded
; packed, this will do no harm.
;   Everything becomes an infinity or a quiet NaN here: infinities want the
; top fraction bit clear, quiet NaNs want it set.

        AND     OP1sue,OP1sue,#Sign_bit
        ORR     OP1sue,OP1sue,#&0FF00000
        ORR     OP1sue,OP1sue,#&000FF000
        ORRS    Rtmp,OP1mhi,OP1mlo              ;Test for infinity
        ORRNE   OP1sue,OP1sue,#&00000800

; Now do a binary->decimal conversion on the 62-bit integer in
; (OP2mhi,OP2mlo), putting the result digits in (OP1mhi,OP1mlo,Rarith).
;
; This is done by the "divide by 10 and take the remainder" technique. To
; avoid the costs of full divisions, we use an optimised division. This
; works as follows, where we're using fixed point hexadecimal numbers in the
; formulae:
;
; Suppose i is an integer. Let j = i - (i >> 2). Since (i >> 2) = i/4 - X/4,
; where X is 0, 1, 2 or 3, we have:
;
;   j = &0.C * i + [0,&0.C]
;
; where [a,b] means some number in the range a to b inclusive.
;
; Let k = j + (j >> 4). By a similar argument:
;
;   k = &0.CC * i + [0,&0.CC]
;                 - [0,&0.F0]
;
; Let l = k + (k >> 8), giving:
;
;   l = &0.CCCC * i + [0,&0.CCCC]
;                   - [0,&0.F0F0]
;                   - [0,&0.FF00]
;
; Let m = l + (l >> 16), giving:
;
;   m = &0.CCCCCCCC * i + [0,&0.CCCCCCCC]
;                       - [0,&0.F0F0F0F0]
;                       - [0,&0.FF00FF00]
;                       - [0,&0.FFFF0000]
;
; Let n = m + (m >> 32), giving:
;
;   n = &0.CCCCCCCCCCCCCCCC * i + [0,&0.CCCCCCCCCCCCCCCC]
;                               - [0,&0.F0F0F0F0F0F0F0F0]
;                               - [0,&0.FF00FF00FF00FF00]
;                               - [0,&0.FFFF0000FFFF0000]
;                               - [0,&0.FFFFFFFF00000000]
;
; Since 4/5 = &0.CCCCC..., we have &0.CCCCCCCCCCCCCCCC = 4/5 - 4/5 *
; 2^(-64). So, broadening the range of error somewhat, we have:
;
;   n = (4/5 * i) - (4/5 * 2^(-64) * i) + [-4, 4/5 * (1-2^(-64))]
;
;     = (4/5 * i) + [-5, 4/5 * (1-2^(-64))],
;
; which gives:
;
;   (n >> 3) = (1/10 * i) + [-5/8, 1/10 * (1-2^(-64))] + [-7/8,0]
;
;            = (1/10 * i) + [-12/8, 1/10 * (1-2^(-64))]
;
; So:
;
;   10 * (n >> 3) = i + [-15, 1-2^(-64)]
;
; Or:
;
;   -1 < i - 10 * (n >> 3) <= 15
;
; In other words, (n >> 3) is (i DIV 10) to within a possible error of -1 or
; 0. Which can be easily established by multiplying up the bottom word
; again, which we will need to do anyway to establish what (i MOD 10) is.
;
; Start the process of generating the quotient digits by initialising
; (OP1mhi,OP1mlo, Rarith) with zeros, except for a sentinel bit that will
; tell us when the iteration is over.

        MOV     Rarith,#&00000000
        MOV     OP1mlo,#&00000000
        MOV     OP1mhi,#&00000800

STFConvert_Packed_NaNInf_Loop

; Construct "n" from the "i" in (OP2mhi,OP2mlo).

        MOV     Rtmp2,OP2mlo            ;We'll want this later

        MOV     Rtmp,OP2mlo,LSR #2
        ORR     Rtmp,Rtmp,OP2mhi,LSL #30
        SUBS    OP2mlo,OP2mlo,Rtmp
        SBC     OP2mhi,OP2mhi,OP2mhi,LSR #2

        MOV     Rtmp,OP2mlo,LSR #4
        ORR     Rtmp,Rtmp,OP2mhi,LSL #28
        ADDS    OP2mlo,OP2mlo,Rtmp
        ADC     OP2mhi,OP2mhi,OP2mhi,LSR #4

        MOV     Rtmp,OP2mlo,LSR #8
        ORR     Rtmp,Rtmp,OP2mhi,LSL #24
        ADDS    OP2mlo,OP2mlo,Rtmp
        ADC     OP2mhi,OP2mhi,OP2mhi,LSR #8

        MOV     Rtmp,OP2mlo,LSR #16
        ORR     Rtmp,Rtmp,OP2mhi,LSL #16
        ADDS    OP2mlo,OP2mlo,Rtmp
        ADC     OP2mhi,OP2mhi,OP2mhi,LSR #16

        ADDS    OP2mlo,OP2mlo,OP2mhi
        ADC     OP2mhi,OP2mhi,#0

        MOV     OP2mlo,OP2mlo,LSR #3
        ORR     OP2mlo,OP2mlo,OP2mhi,LSL #29
        MOV     OP2mhi,OP2mhi,LSR #3

; Calculate remainder. From the above, we know it lies in the range 0 to 15.

        ADD     Rtmp,OP2mlo,OP2mlo,LSL #2
        SUB     Rtmp,Rtmp2,Rtmp,LSL #1
        CMP     Rtmp,#10                        ;Leaves C set if too big
        SUBCS   Rtmp,Rtmp,#10                   ;Adjust the remainder and
        ADCS    OP2mlo,OP2mlo,#0                ; the quotient if remainder
        ADC     OP2mhi,OP2mhi,#0                ; came out too big

; Transfer remainder to digits so far and loop until done.

        MOVS    Rarith,Rarith,LSR #4            ;Check the sentinel
        ORR     Rarith,Rarith,OP1mlo,LSL #28
        MOV     OP1mlo,OP1mlo,LSR #4
        ORR     OP1mlo,OP1mlo,OP1mhi,LSL #28
        MOV     OP1mhi,OP1mhi,LSR #4
        ORR     OP1mhi,OP1mhi,Rtmp,LSL #28

        BCC     STFConvert_Packed_NaNInf_Loop

; Now merge the results in the correct way, depending on whether this is
; expanded or normal packed format.

        TST     Rfpsr,#EP_bit
        BEQ     STFConvert_Packed_NaNInf_NotExpanded

STFConvert_Packed_NaNInf_Expanded

        MOV     Rarith,Rarith,LSR #20           ;Shift integer into place
        ORR     Rarith,Rarith,OP1mlo,LSL #12
        MOV     OP1mlo,OP1mlo,LSR #20
        ORR     OP1mlo,OP1mlo,OP1mhi,LSL #12
        MOV     OP1mhi,OP1mhi,LSR #20
        ORR     OP1mhi,OP1mhi,OP1sue,LSL #20    ; and signalling/quiet bit
        ORR     OP1sue,OP1sue,#&00000FF0        ;Finish setting exponent
        ORR     OP1sue,OP1sue,#&0000000F
        MOV     PC,LR

STFConvert_Packed_NaNInf_NotExpanded

        ORR     OP1sue,OP1sue,OP1mhi,LSR #20    ;Shift integer into place
        MOV     OP1mhi,OP1mhi,LSL #12
        ORR     OP1mhi,OP1mhi,OP1mlo,LSR #20
        MOV     OP1mlo,OP1mlo,LSL #12
        ORR     OP1mlo,OP1mlo,Rarith,LSR #20
        MOV     PC,LR

;===========================================================================

STFP_constants
        DCD     EIExp_bias - 1          ;The standard exponent bias minus 1
        DCD     &13441                  ;LOG2lo*2^18

;===========================================================================

; Routine to prepare an internal format floating point number for storing by
; an STFP instruction.
;   To fit in with the usual conventions, the entry point is given two
; labels, one for the FPE and the other for the FPASC.
; Entry: OP1sue = Operand sign, uncommon, exponent;
;        OP1mhi = Operand mantissa, high word;
;        OP1mlo = Operand mantissa, low word;
;        Rfpsr  = FPSR;
;        Rins   = instruction (needed for traps);
;        Rwp, Rfp, Rsp hold their usual values;
;        R14    = return link.
; Exit:  OP1sue, OP1mhi, OP1mlo = words to be stored;
;        If the FPSR EP bit is set, Rarith = fourth word to be stored;
;          otherwise, Rarith may be corrupt;
;        RNDexp (= OP2sue), OP2mhi, OP2mlo, Rtmp, Rtmp2 and R14 may be
;          corrupt;
;        Rfpsr may be updated;
;        All other registers preserved.

        [ FPEWanted
STFConvertFPE_Packed
        ]

        [ SCWanted
STFConvertSC_Packed
        ]

; Split out uncommon values.

        TST     OP1sue,#Uncommon_bit
        BNE     STFConvert_Packed_Uncommon

STFConvert_Packed_Common

; Split exponent out of OP1sue.

        AND     RNDexp,OP1sue,#ToExp_mask

; The value we have to convert is numeric. If it is zero, the job is easy.

        ORRS    Rarith,OP1mhi,OP1mlo    ;Test for zero & make 4th converted
                                        ; word in case it's Expanded Packed
        ANDEQ   OP1sue,OP1sue,#Sign_bit ;Make 1st converted word and return
        MOVEQ   PC,LR                   ; (NB 2nd & 3rd words are OK)
        MOV     OP2mhi,#0               ;Difference between OP1sue and
                                        ; RNDexp exponents

STFConvert_Packed_Number

        STMFD   Rsp!,{LR}               ;Floating point instructions that
                                        ; might bounce are coming up

; The value we have to convert is known to be normalised. Currently, the
; mantissa is in (OP1mhi,OP1mlo), the sign/exponent in OP1sue and the
; exponent in RNDexp. The exponent in OP1sue is still as it was originally;
; the one in RNDexp is the correct "normalised" exponent, which may be
; negative and may differ from that in OP1sue if the number is in fact
; denormalised or unnormalised. The difference between the two exponents is
; held in OP2mhi, and will remain there until we reach the label
; "STFConvert_Packed_ExpAdjustDone" below. First get the constants we'll
; need and take the bias minus 1 off the exponent.

        ADR     Rtmp,STFP_constants
        LDMIA   Rtmp,{Rtmp,Rtmp2}
        ASSERT  Rtmp < Rtmp2
        SUBS    Rarith,RNDexp,Rtmp      ;Re-bias and move exponent
        ADDHI   Rtmp2,Rtmp2,#1          ;If +ve, convert LOG2lo*2^18 to
                                        ; LOG2hi*2^18 (reason given below)

; Rarith is now on the range -63-(EIExp_bias-1) = -&403D to (maximum real
; exponent + 1 - EIExp_bias) = &4000. We wish to change this to a decimal
; exponent. This can't be done entirely accurately without doing something
; akin to a logarithm on the mantissa, so instead we will simply produce an
; approximation. Unlike the old FPE/FPPC support code, however, which allow
; the approximation to be in error by 1 in either direction, we will make
; certain that this approximation can only be in error by +1: this
; simplifies subsequent work.
;
; We currently know that:
;
;   2^(Rarith-1) <= value < 2^Rarith
;
; Taking logarithms base 10 (denoted by log), we get:
;
;   (Rarith-1)*log(2) <= log(value) < Rarith*log(2)
;
; Let LOG2lo and LOG2hi be slightly too low and slightly too high
; approximations to log(2) respectively. Then we get the following:
;
;   If Rarith > 0:  (Rarith-1)*LOG2lo <= log(value) < Rarith*LOG2hi
;   If Rarith <= 0: (Rarith-1)*LOG2hi <= log(value) < Rarith*LOG2lo
;
; Or, putting D = LOG2hi-LOG2lo:
;
;   If Rarith > 0:
;     Rarith*LOG2hi - Rarith*D - LOG2lo    <= log(value) < Rarith*LOG2hi
;   If Rarith <= 0:
;     Rarith*LOG2lo - (-Rarith*D) - LOG2hi <= log(value) < Rarith*LOG2lo
;
; Taking the "floor" function of the numbers - i.e. the closest integers in
; the direction of -infinity:
;
;   If Rarith > 0:
;     floor(Rarith*LOG2hi) - 1 <= floor(log(value)) <= floor(Rarith*LOG2hi)
;   If Rarith <= 0:
;     floor(Rarith*LOG2lo) - 1 <= floor(log(value)) <= floor(Rarith*LOG2lo)
;
; provided LOG2hi, LOG2lo and D = LOG2hi-LOG2lo are such that LOG2lo +
; D*&4000 <= 1 and LOG2hi + D*&403D <= 1. The latter is the more stringent
; condition: since log(2) is approximately 0.3, it is easily satisfied if D
; <= 2^(-15).
;
; To get as much accuracy as we can, we will make the values of LOG2hi and
; LOG2lo as accurate as we can without risking overflowing a single ARM
; multiplication. Since Rarith can only just exceed 2^14 in magnitude and
; log(2) is not *just* less than a power of two, we can safely take 17 bits
; of accuracy. So we have:
;
;   LOG2lo = log(2) rounded down to a multiple of 2^(-18);
;   LOG2hi = log(2) rounded up to a multiple of 2^(-18)
;          = LOG2lo + 2^(-18).
;
; So we can evaluate a suitable decimal exponent by multiplying Rarith by
; LOG2hi or LOG2lo, depending on whether Rarith is positive or negative,
; then taking the integer part of the result. The true decimal exponent is
; either equal to this value or 1 smaller than it.
;
; N.B. in theory, rounding errors could conceivably make it 1 greater: in
; practice, however, the only time that a power of 2 and a power of 10 are
; close enough together for this to happen is when 2^0 = 10^0. The danger is
; that 1.11...1 * 2^(-1) would round up to 10.0 when multiplied by 10:
; however, a check reveals that this is not the case.

        MUL     Rtmp2,Rarith,Rtmp2              ;Multiply Rarith by constant
                                                ; (note that Rtmp2 is small)
        MOVS    Rarith,Rtmp2,ASR #18            ;Take integer part
        MOVPL   Rtmp,Rarith                     ;If zero, ready for mantissa
        BEQ     STFConvert_Packed_ExpAdjustDone ; conversion with Rtmp = 0
        RSBMI   Rtmp,Rarith,#0                  ; to indicate exactness;
                                                ; otherwise, get absolute
                                                ; value of exponent in Rtmp

; We've got to multiply the number we're converting by 10^(-Rarith) to end
; up with the correct decimal mantissa. This corresponds to multiplying or
; dividing by 2^Rtmp, depending on the sign of Rarith.
;
; NOTE: This stage introduces some rounding errors, which may cause some
; problems with strict adherence to the IEEE standard. Certainly conversions
; between extended and packed formats are not totally accurate: fortunately,
; the IEEE standard doesn't have anything to say about such conversions.
; However, due to the presence of guard bits, conversions between
; single/double and packed formats will be IEEE-accurate provided the
; conversion from packed to single/double is implemented as LDFP Fn followed
; by MVFS/D Fn,Fn. There are probably still problems with the inexact bit,
; though...
;
; Start by preserving a couple of floating point registers, then transfer
; the operand to F0 via the stack.

        EnterRecursive 2,12,Rtmp2
        STMIA   Rtmp2,OP1regs
        LFM     F0,1,[Rtmp2]

; Multiply or divide by 10^Rtmp. We're going to have to take some care about
; this, since Rtmp can be sufficiently big that 10^Rtmp would overflow (e.g.
; if the original number was a denormalised extended precision number).
;   We use an optimised fast track if we can simply look 10^Rtmp up in our
; tables.

        CMP     Rtmp,#PowersOfTenTable_Size
        BGE     STFConvert_Packed_BigPower
        ADR     Rtmp2,PowersOfTenTable
        ADD     Rtmp2,Rtmp2,Rtmp,LSL #4
        LDFE    F1,[Rtmp2]

STFConvert_Packed_GotPower

; Now we just need to complete the multiplication/division.

        TEQ     Rarith,#0
        DVFPLE  F0,F0,F1
        MUFMIE  F0,F0,F1

; Get an exactness indicator for the operation so far from the FPSR. This
; will be kept in Rtmp throughout the conversion that follows.

        RFS     Rtmp                            ;Make exactness indicator
        AND     Rtmp,Rtmp,#IXC_bit              ; for later

; Get the number back into ARM registers and restore the original FPA
; registers.

        ExitRecursive 2,12,Rtmp2,F0,OP1regs

STFConvert_Packed_ExpAdjustDone

; What we've done above is OK for normalised numbers. There's a problem if
; the original operand was denormalised or unnormalised, though: we
; determined the power of ten to multiply by from the normalised exponent in
; RNDexp, but actually multiplied the power of ten into (sign/original
; exponent, normalised mantissa). This means that the value we've got now is
; too large by a factor of 2^(difference between original and normalised
; exponents). However, we did keep that difference around in OP2mhi, so we
; can fix things up in what follows...
;
; NB The apparent alternative fix of inserting the normalised exponent into
; OP1sue before doing the above calculations is *not* a good idea: the
; normalised exponent may be negative, even in its biased form. I.e.
; (sign/normalised exponent, normalised mantissa) may well not be a valid
; internal format number.
;
; Otherwise, ignoring rounding errors, the number is now equal to the
; extended precision number (OP1sue,OP1mhi,OP1mlo) times 10^Rarith, and
; (OP1sue,OP1mhi,OP1mlo) is known to lie in the range 10^(-1) <= X < 10.
; Also, Rtmp is zero if the calculations are exact so far, non-zero
; otherwise. Now we need to convert the mantissa, possibly adjusting the
; exponent down by 1 in the process.
;
; Start by splitting OP1sue into sign and exponent.

        AND     RNDexp,OP1sue,#ToExp_mask
        SUB     RNDexp,RNDexp,OP2mhi
        AND     OP1sue,OP1sue,#Sign_bit

; Initialise the number of digits counter in Rtmp2.

        TST     Rfpsr,#EP_bit
        MOVEQ   Rtmp2,#17
        MOVNE   Rtmp2,#21

; Align the mantissa so that the binary point lies between bits 27 and 28 of
; OP1mhi, using OP2mhi for the underflow.

        RSB     RNDexp,RNDexp,#(EIExp_bias+3):AND:&FF
        ADD     RNDexp,RNDexp,#(EIExp_bias+3):AND:&FF00
        ASSERT  (EIExp_bias+3) <= &FFFF
        RSB     LR,RNDexp,#32
        MOV     OP2mhi,OP1mlo,LSL LR
        MOV     OP1mlo,OP1mlo,LSR RNDexp
        ORR     OP1mlo,OP1mlo,OP1mhi,LSL LR
        MOV     OP1mhi,OP1mhi,LSR RNDexp

; If the mantissa is less than 1, we need to decrement the Rarith exponent
; and branch into the conversion loop at the "multiply by ten" stage.
; Otherwise, we fall into the "extract result digit" stage.

        MOV     RNDexp,#0                       ;Initialise digits so far

        TST     OP1mhi,#&F0000000
        BNE     STFConvert_Packed_GetDigit3word
        SUB     Rarith,Rarith,#1

; General strategy in what follows: the calculation will occur in two
; loops, each of them consisting of alternating "extract digit" and
; "multiply by 10" stages.
;
; (a) The three word loop. During this loop, (OP1mhi,OP1mlo,OP2mhi) contains
;     the number to be converted, and RNDexp contains the digits extracted
;     so far. We know that the number we're converting lies in the range
;     10^(-1) to 10, i.e. that its unbiased exponent was in the range -4 to
;     3. So the above put at most 7 bits in the top of OP2mhi. Each
;     multiplication by 10 decreases this number of bits by 1, so after at
;     most 7 iterations (i.e. before RNDexp is full, and before we can
;     possibly be finished), OP2mhi will become zero. As soon as this
;     happens, we will drop into the second loop instead.
;
; (b) The two word loop. During this loop, (OP1mhi,OP1mlo) contains the
;     number to be converted, and (OP2mhi,OP2mlo,RNDexp) contains the digits
;     extracted so far. This iteration ends when we've got enough digits.

STFConvert_Packed_MultByTen3word

; First double the number.

        ADDS    OP2mhi,OP2mhi,OP2mhi
        ADCS    OP1mlo,OP1mlo,OP1mlo
        ADC     OP1mhi,OP1mhi,OP1mhi

; Then multiply it by 5. We use OP2mlo as a temporary - it is otherwise
; unused at this stage.

        MOV     OP2mlo,OP2mhi,LSR #30
        ADDS    OP2mhi,OP2mhi,OP2mhi,LSL #2
        MOV     LR,OP1mlo,LSR #30
        ORR     OP2mlo,OP2mlo,OP1mlo,LSL #2
      ; XXX KJB correction
        ADCS    OP1mlo,OP1mlo,OP2mlo ; was ADCS OP1mlo,OP1mlo,OP1mlo,LSL #2
        ORR     LR,LR,OP1mhi,LSL #2
        ADC     OP1mhi,OP1mhi,LR

STFConvert_Packed_GetDigit3word

; The integer part of the number is the next digit. Transfer it, remove it
; from the number and decrement the number of digits to do. Then check
; whether we're ready for the two word loop.

        MOV     RNDexp,RNDexp,LSL #4
        ORR     RNDexp,RNDexp,OP1mhi,LSR #28
        BIC     OP1mhi,OP1mhi,#&F0000000
        SUB     Rtmp2,Rtmp2,#1
        TEQ     OP2mhi,#0
        BNE     STFConvert_Packed_MultByTen3word

; Note we've got at least 10 digits to go. So there's no need to zero
; OP2mhi: its current contents will all be shifted out by the time we're
; done.

        MOV     OP2mlo,#0

STFConvert_Packed_MultByTen2word

; First double the number.

        ADDS    OP1mlo,OP1mlo,OP1mlo
        ADC     OP1mhi,OP1mhi,OP1mhi

; Then multiply by 5.

        MOV     LR,OP1mlo,LSR #30
        ADDS    OP1mlo,OP1mlo,OP1mlo,LSL #2
        ORR     LR,LR,OP1mhi,LSL #2
        ADC     OP1mhi,OP1mhi,LR

STFConvert_Packed_GetDigit2word

; The integer part of the number is the next digit. Transfer it, remove it
; from the number and decrement the number of digits to do. Loop unless
; we've got all the digits we want.

        MOV     OP2mhi,OP2mhi,LSL #4
        ORR     OP2mhi,OP2mhi,OP2mlo,LSR #28
        MOV     OP2mlo,OP2mlo,LSL #4
        ORR     OP2mlo,OP2mlo,RNDexp,LSR #28
        MOV     RNDexp,RNDexp,LSL #4
        ORR     RNDexp,RNDexp,OP1mhi,LSR #28
        BIC     OP1mhi,OP1mhi,#&F0000000
        SUBS    Rtmp2,Rtmp2,#1
        BNE     STFConvert_Packed_MultByTen2word

; Round the number if necessary. We don't pay attention to overflow at this
; point.
        
        ORR     Rtmp2,Rtmp,OP1mhi               ;Make the full exactness
        ORR     Rtmp2,Rtmp2,OP1mlo              ; indicator, moving it to
                                                ; Rtmp2

        ORRS    OP1mhi,OP1mlo,OP1mhi,LSL #5     ;C<-round, Z<-NOT(sticky)
        BCC     STFConvert_Packed_Rounded
        ANDEQ   OP1mhi,RNDexp,#1                ;Resolve tie case
        BEQ     STFConvert_Packed_Rounded
        ADDS    RNDexp,RNDexp,#1                ;Attempt to increment simply
        AND     Rtmp,RNDexp,#&F                 ; but branch to special case
        TEQ     Rtmp,#&A                        ; code if there is a carry
        BEQ     STFConvert_Packed_CarryChain    ; chain (NB ADDS sets C
                                                ; correctly if branch taken)

STFConvert_Packed_Rounded

; We've got all the digits and done the rounding. Next we must convert the
; exponent. First thing is to transfer its sign to OP1sue and take its
; absolute value.

        TEQ     Rarith,#0
        ORRMI   OP1sue,OP1sue,#&40000000
        RSBMI   Rarith,Rarith,#0

; Now convert the exponent to a decimal number in Rtmp by a binary chop
; technique. Note that we know the exponent cannot be 8000 or more.

        MOV     Rtmp,#0
        CMP     Rarith,#4000
        SUBHS   Rarith,Rarith,#4000
        ORRHS   Rtmp,Rtmp,#&4000
        CMP     Rarith,#2000
        SUBHS   Rarith,Rarith,#2000
        ORRHS   Rtmp,Rtmp,#&2000
        CMP     Rarith,#1000
        SUBHS   Rarith,Rarith,#1000
        ORRHS   Rtmp,Rtmp,#&1000
        CMP     Rarith,#800
        SUBHS   Rarith,Rarith,#800
        ORRHS   Rtmp,Rtmp,#&800
        CMP     Rarith,#400
        SUBHS   Rarith,Rarith,#400
        ORRHS   Rtmp,Rtmp,#&400
        CMP     Rarith,#200
        SUBHS   Rarith,Rarith,#200
        ORRHS   Rtmp,Rtmp,#&200
        CMP     Rarith,#100
        SUBHS   Rarith,Rarith,#100
        ORRHS   Rtmp,Rtmp,#&100
        CMP     Rarith,#80
        SUBHS   Rarith,Rarith,#80
        ORRHS   Rtmp,Rtmp,#&80
        CMP     Rarith,#40
        SUBHS   Rarith,Rarith,#40
        ORRHS   Rtmp,Rtmp,#&40
        CMP     Rarith,#20
        SUBHS   Rarith,Rarith,#20
        ORRHS   Rtmp,Rtmp,#&20
        CMP     Rarith,#10
        ADDHS   Rarith,Rarith,#&10-10   ;Shortcut on last few digits
        ADD     Rtmp,Rtmp,Rarith

; Current situation:
;   (OP2mhi,OP2mlo,RNDexp) contains 17 or 21 decimal digits, depending on
;     the setting of the FPSR EP bit;
;   Rtmp contains 4 decimal digits of exponent;
;   OP1sue contains the mantissa and exponent signs in its top two bits;
;   Rtmp2 is 0 if the result is exact, non-zero if it is inexact.
;
; We now split according to the FPSR EP bit, since the details of merging to
; form the final answer differ according to how it is set.

        TST     Rfpsr,#EP_bit
        BEQ     STFConvert_Packed_NotExpanded

STFConvert_Packed_Expanded

; Shift and merge to form the final answer.

        ORR     OP1sue,OP1sue,Rtmp
        MOV     OP1mhi,OP2mhi,LSL #12
        ORR     OP1mhi,OP1mhi,OP2mlo,LSR #20
        MOV     OP1mlo,OP2mlo,LSL #12
        ORR     OP1mlo,OP1mlo,RNDexp,LSR #20
        MOV     Rarith,RNDexp,LSL #12

; Finally, pay attention to whether the result is inexact. This is the case
; if either the binary->decimal conversion was inexact (indicated by Rtmp2
; being non-zero) or the multiplications/divisions above are inexact. (NOTE:
; there's a flaw here, since the combined effect of the two errors may be to
; produce an exact result. We can't do any better with the current
; algorithm, though!)

        TEQ     Rtmp2,#0
        LDMEQFD Rsp!,{PC}               ;Return if exact

        TST     Rfpsr,#IXE_bit
        ORREQ   Rfpsr,Rfpsr,#IXC_bit
        BLNE    InexactTrapForX
        LDMFD   Rsp!,{PC}

STFConvert_Packed_NotExpanded

; Shift and merge to form the final answer.

        ORR     OP1sue,OP1sue,Rtmp,LSL #12
        ORR     OP1sue,OP1sue,OP2mhi,LSL #8
        ORR     OP1sue,OP1sue,OP2mlo,LSR #24
        MOV     OP1mhi,OP2mlo,LSL #8
        ORR     OP1mhi,OP1mhi,RNDexp,LSR #24
        MOV     OP1mlo,RNDexp,LSL #8

; Finally, pay attention to whether the result is inexact. This is the case
; if either the binary->decimal conversion was inexact (indicated by Rtmp2
; being non-zero) or the multiplications/divisions above are inexact. (NOTE:
; there's a flaw here, since the combined effect of the two errors may be to
; produce an exact result. We can't do any better with the current
; algorithm, though!)

        TEQ     Rtmp2,#0
        LDMEQFD Rsp!,{PC}               ;Return if exact

        TST     Rfpsr,#IXE_bit
        ORREQ   Rfpsr,Rfpsr,#IXC_bit
        BLNE    InexactTrapForP
        LDMFD   Rsp!,{PC}

STFConvert_Packed_CarryChain

; Code to complete incrementing the 3-word BCD number in (OP2mhi, OP2mlo,
; RNDexp). On entry, RNDexp has just had 1 added to it (and it has been
; discovered that the bottom BCD digit has become &A, though we won't use
; this fact). Furthermore, C is set correctly on the result of this
; addition. We may use Rtmp, OP1mhi and OP1mlo as temporary registers.
; Finally, Rarith holds the decimal exponent: this will need to be
; incremented if mantissa overflow during rounding occurs.
;   First create the constants we'll want for BCD arithmetic.

        MOV     OP1mhi,#&11                     ;OP1mhi := &11
        ORR     OP1mhi,OP1mhi,OP1mhi,LSL #8     ;OP1mhi := &1111
        ORR     OP1mhi,OP1mhi,OP1mhi,LSL #16    ;OP1mhi := &11111111
        ORR     OP1mlo,OP1mhi,OP1mhi,LSL #1     ;OP1mlo := &33333333

; Complete the BCD addition of 1 into RNDexp. We use standard BCD addition
; code, as follows:
;
; Assume registers A and B contain the two operands, register C is to
; receive the result and register T is free. Also assume registers Threes
; and Eights contain &33333333 and &88888888 respectively. Then the code is:
;
;       ADDS    C,A,B           ;Start the addition
;       ADD     T,Threes,C,RRX  ;Produce the BCD carries out from each
;       EOR     T,T,A,LSR #1    ; BCD digit by adding &66666666, then
;       EOR     T,T,B,LSR #1    ; comparing the low bit of each digit with
;       AND     T,T,Eights      ; the EOR of corresponding bits from the
;                               ; operands. Note everything is shifted right
;                               ; one bit to keep it within the word.
;       ADD     C,C,T,LSR #1    ;Do the decimal adjust by adding 6 to each
;       ADD     C,C,T,LSR #2    ; digit where a BCD carry out occurred.
;
; Furthermore, there is a carry out from the BCD addition if the top bit of
; T is set at the end of this.
;
; This is considerably simplified in this particular case, since the first
; instruction has already been done and we know we're adding 1. The only
; problem is that we've already destroyed the RNDexp operand, which we
; apparently need for the EOR operands. However, note that we have only
; modified the bottom 4 bits of RNDexp, which means that using the new value
; of RNDexp rather than the old one will only affect the bottom 3 bits of
; the EOR result. These bits are promptly masked out by the AND, so we can
; in fact use the new value of RNDexp in the EOR rather than the old one.
; The other EOR vanishes completely, since (1 >> 1) = 0.So we get the
; following real code:

        ADD     Rtmp,OP1mlo,RNDexp,RRX
        EOR     Rtmp,Rtmp,RNDexp,LSR #1
        ANDS    Rtmp,Rtmp,OP1mhi,LSL #3         ;N:=carry out from this word
        ADD     RNDexp,RNDexp,Rtmp,LSR #1
        ADD     RNDexp,RNDexp,Rtmp,LSR #2

; If there's no carry out, return. Otherwise, proceed to increment the
; second word and if necessary the third word, using the same technique each
; time.

        BPL     STFConvert_Packed_Rounded

        ADDS    OP2mlo,OP2mlo,#1
        ADD     Rtmp,OP1mlo,OP2mlo,RRX
        EOR     Rtmp,Rtmp,OP2mlo,LSR #1
        ANDS    Rtmp,Rtmp,OP1mhi,LSL #3         ;N:=carry out from this word
        ADD     OP2mlo,OP2mlo,Rtmp,LSR #1
        ADD     OP2mlo,OP2mlo,Rtmp,LSR #2

        BPL     STFConvert_Packed_Rounded

        ADDS    OP2mhi,OP2mhi,#1
        ADD     Rtmp,OP1mlo,OP2mhi,RRX
        EOR     Rtmp,Rtmp,OP2mhi,LSR #1
        AND     Rtmp,Rtmp,OP1mhi,LSL #3         ;No carry out possible
        ADD     OP2mhi,OP2mhi,Rtmp,LSR #1
        ADD     OP2mhi,OP2mhi,Rtmp,LSR #2

; If we incremented the third word, we may have had overflow (into an 18th
; digit if EP=0 or a 22nd digit if EP=1). Check for this; increment the
; exponent and shift the mantissa if it happened. Note that we know the low
; words of the mantissa are zero both before and after the shift, so there's
; no need to change them.

        MOVS    Rtmp,Rfpsr,LSR #(EP_pos+1)      ;C := EP bit
        TSTCC   OP2mhi,#&00000010               ;Doesn't affect C
        TSTCS   OP2mhi,#&00100000               ;No longer care about C
        MOVNE   OP2mhi,OP2mhi,LSR #4
        ADDNE   Rarith,Rarith,#1

        B       STFConvert_Packed_Rounded

STFConvert_Packed_BigPower

; This is where we have to take care about Rtmp being so large that 10^Rtmp
; would overflow. We take advantage of the fact that we know that it can't
; overflow really badly: in particular, 10^(Rtmp/2, rounded down) and
; 10^(Rtmp/2, rounded up) will not overflow, and their product is the number
; we want. (Note that there is no point in using a threshold, above which we
; use this strategy and below which we simply evaluate the power of ten: we
; end up doing exactly the same number of multiplications either way.)
;
; So we start by calculating 10^(Rtmp/2, rounded down) in F1.

        MOV     Rtmp2,Rtmp,LSR #1
        BL      MakePowerOfTenInF1

; Multiply/divide by the number in F1.

        TEQ     Rarith,#0                       ;Multiply/divide by
        DVFPLE  F0,F0,F1                        ; 10^(Rtmp/2, rounded down)
        MUFMIE  F0,F0,F1

; Form 10^(Rtmp/2, rounded up) in F1: this involves multiplying the current
; value by 10 if Rtmp is odd and leaving it alone if Rtmp is even.

        TST     Rtmp,#1                         ;Form
        MUFNEE  F1,F1,#10                       ; 10^(Rtmp/2, rounded up)

; Return to the main line code: it will complete the multiplication/division.

        B       STFConvert_Packed_GotPower

        ]

;===========================================================================

        [ (:LNOT:NoPacked) :LOR: (:LNOT:NoTranscendentals)

; The following table is to optimise the calculation of small powers of ten.
; The numbers are stored with single word padding between them, to speed up
; addressing. They go up as far as the numbers remain exact: this is not
; essential here, but this table is also used to determine exact cases for
; the LOG instruction.

PowersOfTenTable

        DCD     &00003FFF,&80000000,&00000000,0         ;10^0
        DCD     &00004002,&A0000000,&00000000,0         ;10^1
        DCD     &00004005,&C8000000,&00000000,0         ;10^2
        DCD     &00004008,&FA000000,&00000000,0         ;10^3
        DCD     &0000400C,&9C400000,&00000000,0         ;10^4
        DCD     &0000400F,&C3500000,&00000000,0         ;10^5
        DCD     &00004012,&F4240000,&00000000,0         ;10^6
        DCD     &00004016,&98968000,&00000000,0         ;10^7
        DCD     &00004019,&BEBC2000,&00000000,0         ;10^8
        DCD     &0000401C,&EE6B2800,&00000000,0         ;10^9
        DCD     &00004020,&9502F900,&00000000,0         ;10^10
        DCD     &00004023,&BA43B740,&00000000,0         ;10^11
        DCD     &00004026,&E8D4A510,&00000000,0         ;10^12
        DCD     &0000402A,&9184E72A,&00000000,0         ;10^13
        DCD     &0000402D,&B5E620F4,&80000000,0         ;10^14
        DCD     &00004030,&E35FA931,&A0000000,0         ;10^15
        DCD     &00004034,&8E1BC9BF,&04000000,0         ;10^16
        DCD     &00004037,&B1A2BC2E,&C5000000,0         ;10^17
        DCD     &0000403A,&DE0B6B3A,&76400000,0         ;10^18
        DCD     &0000403E,&8AC72304,&89E80000,0         ;10^19
        DCD     &00004041,&AD78EBC5,&AC620000,0         ;10^20
        DCD     &00004044,&D8D726B7,&177A8000,0         ;10^21
        DCD     &00004048,&87867832,&6EAC9000,0         ;10^22
        DCD     &0000404B,&A968163F,&0A57B400,0         ;10^23
        DCD     &0000404E,&D3C21BCE,&CCEDA100,0         ;10^24
        DCD     &00004052,&84595161,&401484A0,0         ;10^25
        DCD     &00004055,&A56FA5B9,&9019A5C8,0         ;10^26
        DCD     &00004058,&CECB8F27,&F4200F3A,0         ;10^27

PowersOfTenTable_End

PowersOfTenTable_Size   EQU     (PowersOfTenTable_End - PowersOfTenTable)/16

        ]

;===========================================================================

        [ :LNOT:NoPacked

MakePowerOfTenInF1

; Subroutine to create 10^Rtmp2 in F1. Assumes that overflow will not occur,
; and that traps are disabled. Preserves all registers except OP1sue,
; OP1mhi, OP1mlo and LR. Does not use the stack.
;
; The approach we'll take to this is to shift the exponent right until we
; can get the power by table look-up, then go leftwards again, squaring the
; answer so far, then multiplying by 10 if the shifted-in bit is a 1.

        MOV     OP1sue,LR                       ;NB FP instructions may
                                                ; corrupt LR
        MOV     OP1mhi,#0
        MOV     OP1mlo,Rtmp2

MakePowerOfTenInF1_Loop1

        CMP     OP1mlo,#PowersOfTenTable_Size   ;Shift right until within
        MOVHS   OP1mlo,OP1mlo,LSR #1            ; range of table
        ADDHS   OP1mhi,OP1mhi,#1
        BHS     MakePowerOfTenInF1_Loop1

        ADR     LR,PowersOfTenTable
        ADD     OP1mlo,LR,OP1mlo,LSL #4
        LDFE    F1,[OP1mlo]

MakePowerOfTenInF1_Loop2

        CMP     OP1mhi,#1                       ;Return if nothing more to
        MOVLO   PC,OP1sue                       ; do
        MUFE    F1,F1,F1                        ;Square result so far
        MOVS    OP1mlo,Rtmp2,LSR OP1mhi         ;Find next bit
        SUB     OP1mhi,OP1mhi,#1                ;Scheduled during MUFE
        MUFCSE  F1,F1,#10                       ;Multiply by 10 if bit is 1
        B       MakePowerOfTenInF1_Loop2

;===========================================================================

; Routine to convert a number loaded by an LDFP instruction to an internal
; format floating point number.
;   To fit in with the usual conventions, the entry point is given two
; labels, one for the FPE and the other for the FPASC.
; Entry: OP1sue = First word of packed number;
;        OP1mhi = Second word of packed number;
;        OP1mlo = Third word of packed number;
;        Rarith = Fourth word of packed number (only if EP bit set in FPSR);
;        Rfpsr  = FPSR;
;        Rins   = instruction (needed for traps);
;        Rwp, Rfp, Rsp hold their usual values;
;        R14    = return link.
; Exit:  OP1sue, OP1mhi, OP1mlo = number in internal format;
;        RNDexp (= OP2sue), OP2mhi, OP2mlo, Rarith, Rtmp, Rtmp2 and R14 may
;          be corrupt;
;        Rfpsr may be updated;
;        All other registers preserved.

        [ FPEWanted
LDFConvertFPE_Packed
        ]

        [ SCWanted
LDFConvertSC_Packed
        ]

        STMFD   Rsp!,{LR}       ;We've got subroutine calls & floating point
                                ; instructions below

; Convert the decimal exponent and mantissa to binary. Note that we don't
; actually pay any attention here to whether the digits are legitimate,
; since we're allowed to produce anything we want to if they're not (except
; in the case of NaNs and infinities). We will detect NaNs and infinities by
; the fact that they produce an out of range exponent.
;
; First split out the exponent field and convert it. We'll use
; (OP2sue,OP2mhi,OP2mlo) as the standard place to put converted numbers, but
; note that we'll only pay attention to OP2mlo for the exponent.

        MOV     Rtmp,OP1sue,LSL #4      ;Put exponent at top of Rtmp
        TST     Rfpsr,#EP_bit           ; and number of digits to convert 
        MOVEQ   Rtmp2,#4                ; in Rtmp2 (latter depends on EP
        MOVNE   Rtmp2,#7                ; bit)
        MOV     OP2mlo,#0               ;No need to clear other result words
        BL      LDFConvert_Packed_Digits
        CDebug3 5,"As an integer, exponent is",OP2sue,OP2mhi,OP2mlo

; Put the three words of mantissa digits in (Rtmp,OP1mhi,OP1mlo) and the
; number of valid digits in Rtmp in Rtmp2.

        MOVS    Rtmp,Rfpsr,LSR #EP_pos+1        ;C := EP_bit
        MOVCS   Rtmp2,#8
        MOVCSS  Rtmp,OP1mhi                     ;Does not alter C
        MOVCS   OP1mhi,OP1mlo
        MOVCS   OP1mlo,Rarith
        MOVCC   Rtmp2,#3
        MOVCCS  Rtmp,OP1sue,LSL #20             ;Alters C, but this is OK

; Now N is set to the top bit of the mantissa, which will be useful for
; distinguishing signalling and non-signalling NaNs. Stash away the
; converted exponent and this bit in Rarith, which is now free.

        MOV     Rarith,OP2mlo,LSL #1
        ORRMI   Rarith,Rarith,#1

; Convert the mantissa.

        MOV     OP2mlo,#0
        MOV     OP2mhi,#0
        MOV     OP2sue,#0
        BL      LDFConvert_Packed_Digits
        CDebug3 5,"As an integer, mantissa word 1 is",OP2sue,OP2mhi,OP2mlo

        MOV     Rtmp,OP1mhi
        MOV     Rtmp2,#8
        BL      LDFConvert_Packed_Digits
        CDebug3 5,"As an integer, mantissa words 1&2 are",OP2sue,OP2mhi,OP2mlo

        MOV     Rtmp,OP1mlo
        MOV     Rtmp2,#8
        BL      LDFConvert_Packed_Digits
        CDebug3 5,"As an integer, full mantissa is",OP2sue,OP2mhi,OP2mlo

; We now have the signs (plus various junk we no longer need) in OP1sue, the
; converted exponent and the top bit of the mantissa in Rarith and the
; converted mantissa in (OP2sue,OP2mhi,OP2mlo). Both the mantissa and the
; exponent have been converted as integers.
;
; Now split out NaNs and infinities. We'll do this simply by checking for
; exponents that are too big. We have the following known facts:
;
;   Format                Maximum normal exponent   NaN/infinity exponent
;   ---------------------------------------------------------------------
;   Non-expanded packed       9999 =   &270F            FFFF =   &4119
;   Expanded packed        9999999 = &98967F         FFFFFFF = &FE5029
;
; So for each precision, we can use any value between these two to decide
; that we're dealing with a NaN or infinity.

        TST     Rfpsr,#EP_bit
        MOVEQ   Rtmp,#&4100
        MOVNE   Rtmp,#&FE0000
        CMP     Rtmp,Rarith,LSR #1             ;Compare without mantissa bit
        BLS     LDFConvert_Packed_NaNInf
        MOV     Rarith,Rarith,LSR #1            ;Get rid of mantissa bit

; Next, watch out for zeros: if the converted mantissa is zero, we can
; complete the conversion simply by isolating the sign bit (note that we
; know that OP1mhi and OP1mlo are already both zero in this case).

        ORR     Rtmp,OP2sue,OP2mhi
        ORRS    Rtmp,Rtmp,OP2mlo
        ANDEQ   OP1sue,OP1sue,#Sign_bit
        LDMEQFD Rsp!,{PC}

; OK, we're either dealing with a proper number or with some nonsense value
; - we can assume the former. Change the sign of the exponent if necessary,
; then subtract 18 or 23 (depending on the EP bit) to deal with the fact
; that we are converting the mantissa as though it were an integer, when it
; is in fact an integer over 10^18 or 10^23.

        TST     OP1sue,#&40000000
        RSBNE   Rarith,Rarith,#0
        TST     Rfpsr,#EP_bit
        SUBEQ   Rarith,Rarith,#18
        SUBNE   Rarith,Rarith,#23

; Now change the integer in (OP2sue,OP2mhi,OP2mlo) to an extended precision
; number in (OP1sue,OP2mhi,OP2mlo). We know that it is less than 10^19 or
; 10^24, depending on the EP bit - i.e. that it contains no more than 64 or
; 80 significant bits respectively. We also know that (assuming the original
; decimal number was properly normalised) it doesn't contain much less than
; this number, so normalising it by adding and shifting (rather than by
; binary chop) is appropriate.
;   Note also that because we dealt with zeros above, we know this
; normalisation process will terminate.

        AND     OP1sue,OP1sue,#Sign_bit
        ADD     OP1sue,OP1sue,#(EIExp_bias+1)
        ADDEQ   OP1sue,OP1sue,#62               ;Exponent 63 if not EP
        MOVEQ   Rtmp,#0                         ; (with no rounding)
        ADDNE   OP1sue,OP1sue,#78               ; or 79 if EP, with low
        MOVNE   Rtmp,OP2mlo,LSL #16             ; order bits becoming
        MOVNE   OP2mlo,OP2mlo,LSR #16           ; rounding information
        ORRNE   OP2mlo,OP2mlo,OP2mhi,LSL #16
        MOVNE   OP2mhi,OP2mhi,LSR #16
        ORRNE   OP2mhi,OP2mhi,OP2sue,LSL #16

        TEQ     OP2mhi,#0                       ;Normalise what we've got
        BMI     LDFConvert_Packed_Normalised
LDFConvert_Packed_Normalise
        ADDS    Rtmp,Rtmp,Rtmp
        ADCS    OP2mlo,OP2mlo,OP2mlo
        ADCS    OP2mhi,OP2mhi,OP2mhi
        SUB     OP1sue,OP1sue,#1
        BPL     LDFConvert_Packed_Normalise
LDFConvert_Packed_Normalised
        CDebug4 5,"Normalised extended number is",OP1sue,OP2mhi,OP2mlo,Rtmp

        TEQ     Rtmp,#TopBit            ;Check for rounding up (EQ if tie
                                        ; case, else PL for round up, MI for
                                        ; round down)
        MVNEQS  Rtmp,OP2mlo,LSL #31     ;Resolve tie case
        BMI     LDFConvert_Packed_Rounded
        ADDS    OP2mlo,OP2mlo,#1
        ADCS    OP2mhi,OP2mhi,#0
        MOVCS   OP2mhi,OP2mhi,RRX
        ADDCS   OP1sue,OP1sue,#1
LDFConvert_Packed_Rounded

; We've now got the following values in registers:
;   (OP1sue,OP2mhi,OP2mlo) = mantissa integer as a floating point value;
;   Rarith = power of 10 to multiply this by;
;   Rtmp = 0 if calculations so far are exact; non-zero otherwise;
;
; We clear out some FPA registers and transfer the mantissa to F0.

        EnterRecursive 3,12,Rtmp2
        STMIA   Rtmp2,{OP1sue,OP2mhi,OP2mlo}
        ASSERT  OP1sue < OP2mhi
        ASSERT  OP2mhi < OP2mlo
        LFM     F0,1,[Rtmp2]

; Set the inexact cumulative bit if the above indicates inexactness in Rtmp.

        TEQ     Rtmp,#0
        RFSNE   Rtmp2
        ORRNE   Rtmp2,Rtmp2,#IXC_bit
        WFSNE   Rtmp2

; We now just need to multiply by 10^Rarith. This is somewhat tricky, due to
; the possibility of massive overflow/underflow. We need the following
; facts:
;
;   * The value in (OP1sue,OP2mhi,OP2mlo) lies between 10^1 and 10^24
;     inclusive;
;   * The largest extended precision value that doesn't overflow is
;     just under (2-2^(-64)) * 2^16383, which lies between 10^4932 and
;     10^4933;
;   * The smallest extended precision value that doesn't underflow is
;     (1-2^(-65) * 2^(-16446), which lies between 10^(-4951) and 10^(-4950);
;   * The largest extended precision value which will not cause massive
;     overflow (i.e. overflow even after the bias adjustment for trapped
;     overflow) is just under (2-2^(-64)) * 2^40959, which lies between
;     10^12330 and 10^12331;
;   * The smallest extended precision value which will not cause massive
;     underflow (i.e. underflow even after the bias adjustment for trapped
;     underflow) is (1-2^(-65)) * 2^(-41022), which lies between 10^(-12349)
;     and 10^(-12348).
;
; We'll split into the following cases:
;
;   Rarith <= -16384: Massive underflow is certain.
;
;   -16384 < Rarith < -8192: Underflow certain, massive underflow possible:
;     We will divide by four powers of ten whose product is 10^Rarith, and
;     multiply by 2^(24576) (the bias adjustment), using the following
;     sequence: multiply by 2^(12288), then divide by first and second
;     powers of 10, then multiply again by 2^(12288), then divide by third
;     and fourth powers of ten. If underflow has not occurred by the end of
;     this, we've got simple underflow and the result we've got is the right
;     value to pass to the trap handler; if underflow has occurred, we've
;     got massive underflow.
;
;   -8192 <= Rarith < 4096: Danger of underflow, not of massive underflow:
;     Multiply first by 2^(12288) to ensure that calculations stay in
;     range, then divide by 10^(-Rarith/2, rounded down), then by
;     10^(-Rarith/2, rounded up), then multiply by 2^(-12288). All these
;     calculations are done with the underflow trap disabled: only the last
;     one can actually cause underflow. If it does, we can easily work out
;     what to send to the underflow routine from the penultimate result.
;
;   -4096 <= Rarith < 0: No danger of underflow:
;     Create 10^Rarith and divide by it;
;
;   Rarith = 0: Nothing to do.
;
;   0 < Rarith <= 4096: No danger of overflow:
;     Create 10^Rarith and multiply by it;
;
;   4096 < Rarith <= 8192: Danger of overflow, not of massive overflow:
;     Multiply first by 2^(-12288) to ensure that calculations stay in
;     range, then multiply by 10^(Rarith/2, rounded down), then by
;     10^(Rarith/2, rounded up), then by 2^12288. All these calculations are
;     done with the overflow trap disabled: only the last one can actually
;     cause overflow. If it does, we can easily work out what to send to the
;     overflow routine from the penultimate result.
;
;   8192 < Rarith < 16384: Overflow certain, massive overflow possible:
;     We will multiply by four powers of ten whose product is 10^Rarith, and
;     by 2^(-24576) (the bias adjustment), using the following sequence:
;     multiply by 2^(-12288), then by first and second powers of 10, then
;     again by 2^(-12288), then by third and fourth powers of ten. If
;     overflow has not occurred by the end of this, we've got simple
;     overflow and the result we've got is the right value to pass to the
;     trap handler; if overflow has occurred, we've got massive overflow.
;
;   16384 <= Rarith: Massive overflow is certain.

        MOVS    Rtmp2,Rarith
        BMI     LDFConvert_Packed_NegPowerOfTen
        BEQ     LDFConvert_Packed_NoException

LDFConvert_Packed_PosPowerOfTen

        CMP     Rtmp2,#4096
        BHI     LDFConvert_Packed_Big

; This is the "No danger of overflow" case above. Life is pretty simple - we
; just have to create the correct power of ten and multiply by it. We do
; have an optimisation for small powers of ten, which will be common.

        CMP     Rtmp2,#PowersOfTenTable_Size
        [ CoreDebugging = 0
          ADRLT   Rtmp,PowersOfTenTable
        |
          ADRLTL  Rtmp,PowersOfTenTable
        ]
        ADDLT   Rtmp,Rtmp,Rtmp2,LSL #4
        LDFLTE  F1,[Rtmp]
        BLGE    MakePowerOfTenInF1

        MUFE    F0,F0,F1

        B       LDFConvert_Packed_NoException

LDFConvert_Packed_NegPowerOfTen

        RSB     Rtmp2,Rtmp2,#0          ;Get absolute power of ten
        CMP     Rtmp2,#4096
        BHI     LDFConvert_Packed_Small

; This is the "No danger of underflow" case above. Life is simple in this
; case as well: we just have to divide by the power of 10 instead of
; multiplying by it.

        CMP     Rtmp2,#PowersOfTenTable_Size
        [ CoreDebugging = 0
          ADRLT   Rtmp,PowersOfTenTable
        |
          ADRLTL  Rtmp,PowersOfTenTable
        ]
        ADDLT   Rtmp,Rtmp,Rtmp2,LSL #4
        LDFLTE  F1,[Rtmp]
        BLGE    MakePowerOfTenInF1

        DVFE    F0,F0,F1

LDFConvert_Packed_NoException

; Get the inexact condition into the Z flag before we exit this "recursive
; floating point instructions allowed" region.

        RFS     Rtmp
        TST     Rtmp,#IXC_bit

; Get the number back into ARM registers and restore the original FPA
; registers. Note that the Z flag is preserved throughout this.

        ExitRecursive 3,12,Rtmp2,F0,OP1regs

; Now deal with the inexact condition.

        LDMEQFD Rsp!,{PC}               ;Return if exact

        TST     Rfpsr,#IXE_bit
        ORREQ   Rfpsr,Rfpsr,#IXC_bit
        MOVNE   RNDdir,#&80000000       ;Rounding direction not known
        BLNE    InexactTrapForE
        LDMFD   Rsp!,{PC}

LDFConvert_Packed_Big

        CMP     Rtmp2,#8192
        BHI     LDFConvert_Packed_VeryBig

; This is the "may be overflow, but definitely not massive overflow" case
; above.
;
; First generate 10^(Rtmp2/2, rounded down).

        MOV     Rarith,Rtmp2
        MOV     Rtmp2,Rtmp2,LSR #1
        BL      MakePowerOfTenInF1

; Load the "bias down" constant and multiply.

        ADR     Rtmp2,LDFConvert_BiasDown
        LFM     F2,1,[Rtmp2]
        MUFE    F0,F0,F2

; Do the main multiplications, ending in F1.

        MUFE    F0,F0,F1
        TST     Rarith,#1
        MUFNEE  F1,F1,#10
        MUFE    F1,F0,F1

; Load the "bias up" constant and multiply.

        ADR     Rtmp2,LDFConvert_BiasUp
        LFM     F0,1,[Rtmp2]
        MUFE    F0,F1,F0

; If no overflow has been detected, we're OK - otherwise we've got overflow
; and need to bias down instead.

        RFS     Rtmp2
        TST     Rtmp2,#OFC_bit
        BEQ     LDFConvert_Packed_NoException

        MUFE    F0,F1,F2

LDFConvert_Packed_Overflow

; We've got overflow: the current result has been biased down. First get the
; inexact condition into the Z flag before we exit this "recursive floating
; point instructions allowed" region.

        RFS     Rtmp
        TST     Rtmp,#IXC_bit

; Get the number back into ARM registers and restore the original FPA
; registers. Note that the Z flag is preserved throughout this.

        ExitRecursive 3,12,Rtmp2,F0,OP1regs

; Now call the overflow handler correctly.

        AND     RNDexp,OP1sue,#ToExp_mask       ;Split exponent out and do
        ADD     RNDexp,RNDexp,#&6000            ; bias adjust
        AND     OP1sue,OP1sue,#Sign_bit         ;Separate out the sign
        MOVEQ   RNDdir,#0                       ;Set up rounding direction
        MOVNE   RNDdir,#&80000000               ; to "exact" or "unknown"
        MOV     RNDprm,#2:SHL:(RM_pos+2)        ;To nearest, extended
        BL      Overflow

; Now deal with the inexact condition if necessary.

        TEQ     RNDdir,#0
        LDMEQFD Rsp!,{PC}               ;Return if exact

        TST     Rfpsr,#IXE_bit
        ORREQ   Rfpsr,Rfpsr,#IXC_bit
        BLNE    InexactTrapForE
        LDMFD   Rsp!,{PC}

LDFConvert_Packed_VeryBig

        CMP     Rtmp2,#16384
        BHS     LDFConvert_Packed_MassiveOverflow

; This is the "definitely overflow, maybe massive overflow" case above.
;
; First generate 10^(Rtmp2/4, rounded down).

        MOV     Rarith,Rtmp2
        MOV     Rtmp2,Rtmp2,LSR #2
        BL      MakePowerOfTenInF1

; Load the "bias down" constant and multiply by it.

        ADR     Rtmp2,LDFConvert_BiasDown
        LFM     F2,1,[Rtmp2]
        MUFE    F0,F0,F2

; Multiply twice by 10^(Rtmp2/4, rounded down), then by the bias adjust
; constant again, then by some possibly incremented powers of ten that will
; complete the job of multiplying by 10^Rtmp2.

        MUFE    F0,F0,F1
        MUFE    F0,F0,F1
        MUFE    F0,F0,F2
        TST     Rarith,#2
        MUFNEE  F1,F1,#10
        MUFE    F0,F0,F1
        TST     Rarith,#1
        MUFNEE  F1,F1,#10
        MUFE    F0,F0,F1

; If we've had overflow, it indicates massive overflow; if we haven't, we've
; just had ordinary overflow.

        RFS     Rtmp2
        TST     Rtmp2,#OFC_bit
        BEQ     LDFConvert_Packed_Overflow

; Get the number back into ARM registers, just to get the sign right.

        ADD     Rtmp2,Rsp,#40
        SFM     F0,1,[Rtmp2]
        LDMIA   Rtmp2,OP1regs

LDFConvert_Packed_MassiveOverflow

; We've got massive overflow.

        ExitRecursive 3,12,Rtmp2

; Now call the overflow handler correctly, with a constructed result.

        AND     OP1sue,OP1sue,#Sign_bit ;Separate out the real sign
        MOV     OP1mhi,#&80000000
        MOV     OP1mlo,#&00000000
        MOV     RNDexp,#&1000000        ;Real exponent doesn't matter as
                                        ; long as there's massive overflow
        MOV     RNDdir,#&80000000       ;Rounding direction is "unknown"
        MOV     RNDprm,#2:SHL:(RM_pos+2)        ;To nearest, extended
        BL      Overflow

; Now deal with the inexact condition if necessary.

        TEQ     RNDdir,#0
        LDMEQFD Rsp!,{PC}               ;Return if exact

        TST     Rfpsr,#IXE_bit
        ORREQ   Rfpsr,Rfpsr,#IXC_bit
        BLNE    InexactTrapForE
        LDMFD   Rsp!,{PC}

LDFConvert_Packed_Small

        CMP     Rtmp2,#8192
        BHI     LDFConvert_Packed_VerySmall

; This is the "may be underflow, but definitely not massive underflow" case
; above.
;
; First generate 10^(Rtmp2/2, rounded down).

        MOV     Rarith,Rtmp2
        MOV     Rtmp2,Rtmp2,LSR #1
        BL      MakePowerOfTenInF1

; Load the "bias up" constant and multiply.

        ADR     Rtmp2,LDFConvert_BiasUp
        LFM     F2,1,[Rtmp2]
        MUFE    F0,F0,F2

; Do the main divisions, ending in F1.

        DVFE    F0,F0,F1
        TST     Rarith,#1
        MUFNEE  F1,F1,#10
        DVFE    F1,F0,F1

; Load the "bias down" constant and multiply.

        ADR     Rtmp2,LDFConvert_BiasDown
        LFM     F0,1,[Rtmp2]
        MUFE    F0,F1,F0

; If no underflow has been detected, we're OK - otherwise we've got
; underflow and need to bias up instead.

        RFS     Rtmp2
        TST     Rtmp2,#UFC_bit
        BEQ     LDFConvert_Packed_NoException

        MUFE    F0,F1,F2

LDFConvert_Packed_Underflow

; We've got underflow: the current result has been biased up. First get the
; inexact condition into the Z flag before we exit this "recursive floating
; point instructions allowed" region.

        RFS     Rtmp
        TST     Rtmp,#IXC_bit

; Get the number back into ARM registers and restore the original FPA
; registers. Note that the Z flag is preserved throughout this.

        ExitRecursive 3,12,Rtmp2,F0,OP1regs

; Now call the underflow handler correctly.

        AND     RNDexp,OP1sue,#ToExp_mask       ;Split exponent out and do
        SUB     RNDexp,RNDexp,#&6000            ; bias adjust
        AND     OP1sue,OP1sue,#Sign_bit         ;Separate out the sign
        MOVEQ   RNDdir,#0                       ;Set up rounding direction
        MOVNE   RNDdir,#&80000000               ; to "exact" or "unknown"
        MOV     RNDprm,#2:SHL:(RM_pos+2)        ;To nearest, extended
        RSB     Rtmp,RNDexp,#0                  ;Amount by which underflowed
        BL      UnderflowForReg

; Now deal with the inexact condition if necessary.

        TEQ     RNDdir,#0
        LDMEQFD Rsp!,{PC}               ;Return if exact

        TST     Rfpsr,#IXE_bit
        ORREQ   Rfpsr,Rfpsr,#IXC_bit
        BLNE    InexactTrapForE
        LDMFD   Rsp!,{PC}

LDFConvert_Packed_VerySmall

        CMP     Rtmp2,#16384
        BHS     LDFConvert_Packed_MassiveUnderflow

; This is the "definitely underflow, maybe massive underflow" case above.
;
; First generate 10^(Rtmp2/4, rounded down).

        MOV     Rarith,Rtmp2
        MOV     Rtmp2,Rtmp2,LSR #2
        BL      MakePowerOfTenInF1

; Load the "bias up" constant and multiply by it.

        ADR     Rtmp2,LDFConvert_BiasUp
        LFM     F2,1,[Rtmp2]
        MUFE    F0,F0,F2

; Divide twice by 10^(Rtmp2/4, rounded down), then multiply by the bias
; adjust constant again, then divide by some possibly incremented powers of
; ten that will complete the job of dividing by 10^Rtmp2.

        DVFE    F0,F0,F1
        DVFE    F0,F0,F1
        MUFE    F0,F0,F2
        TST     Rarith,#2
        MUFNEE  F1,F1,#10
        DVFE    F0,F0,F1
        TST     Rarith,#1
        MUFNEE  F1,F1,#10
        DVFE    F0,F0,F1

; If we've had underflow, it indicates massive underflow; if we haven't,
; we've just had ordinary underflow.

        RFS     Rtmp2
        TST     Rtmp2,#UFC_bit
        BEQ     LDFConvert_Packed_Underflow

; Get the number back into ARM registers, just to get the sign right.

        ADD     Rtmp2,Rsp,#40
        SFM     F0,1,[Rtmp2]
        LDMIA   Rtmp2,OP1regs

LDFConvert_Packed_MassiveUnderflow

; We've got massive underflow.
;   Don't bother getting the number back into ARM registers - we're not
; going to use it... But we do have to tidy up the stack and the floating
; point registers.

        ExitRecursive 3,12,Rtmp2

; Now call the underflow handler correctly, with a constructed result.

        AND     OP1sue,OP1sue,#Sign_bit ;Separate out the real sign
        MOV     OP1mhi,#&80000000
        MOV     OP1mlo,#&00000000
        MOV     RNDexp,#&FF000000       ;Real exponent doesn't matter as
                                        ; long as there's massive underflow
        MOV     RNDdir,#&80000000       ;Rounding direction is "unknown"
        MOV     RNDprm,#2:SHL:(RM_pos+2)        ;To nearest, extended
        BL      UnderflowForReg

; Now deal with the inexact condition if necessary.

        TEQ     RNDdir,#0
        LDMEQFD Rsp!,{PC}               ;Return if exact

        TST     Rfpsr,#IXE_bit
        ORREQ   Rfpsr,Rfpsr,#IXC_bit
        BLNE    InexactTrapForE
        LDMFD   Rsp!,{PC}

; The bias adjustment constants 2^(-12288) and 2^(12288).

LDFConvert_BiasDown     DCD     EIExp_bias - (TrapBiasAdjust_Extended/2)
                        DCD     &80000000,&00000000
LDFConvert_BiasUp       DCD     EIExp_bias + (TrapBiasAdjust_Extended/2)
                        DCD     &80000000,&00000000

; Constants needed to sort out NaNs and infinities.

NaNInf_Const_EP         DCD     &6F05B59D,&3B200000

NaNInf_Const_XEP        DCD     &16EF0A57,&B4000000

LDFConvert_Packed_NaNInf

; The bottom bit of Rarith contains the original top bit of the mantissa,
; while (OP2sue,OP2mhi,OP2mlo) contains the mantissa, converted as an
; integer. We're only interested in the original top bit and the bottom 62
; bits of (OP2mhi,OP2mlo). Also, we've got to correct these bottom 62 bits
; if the original top bit was a 1: this effectively means we added 8*10^18
; or 8*10^23 too much to (OP2sue,OP2mhi,OP2mlo).

        TST     Rarith,#1
        BEQ     LDFConvert_Packed_NaNInf_Rearrange

        TST     Rfpsr,#EP_bit
        ADREQ   Rtmp,NaNInf_Const_EP
        ADRNE   Rtmp,NaNInf_Const_XEP
        LDMIA   Rtmp,{OP1mhi,OP1mlo}
        SUBS    OP2mlo,OP2mlo,OP1mlo
        SBC     OP2mhi,OP2mhi,OP1mhi

LDFConvert_Packed_NaNInf_Rearrange

; Now we're almost ready to put together the internal format number. The one
; remaining thing to do before we do is to juggle the bits in the inverse
; pattern to that used in STFConvert_Packed above.

; ARM core 1.13 removed this, but KJB reinstated. 1.13 code was:
;
;         BIC     OP1mhi,OP2mhi,#EIUnits_bit+EIFracTop_bit
;         MOV     OP1mlo,OP2mlo

        MOV     Rtmp,OP2mlo,LSR #22             ;Get middle part
        ORR     Rtmp,Rtmp,OP2mhi,LSL #10
        BIC     Rtmp,Rtmp,#&E0000000
        BIC     OP1mlo,OP2mhi,#&C0000000        ;Get top part
        MOV     OP1mlo,OP1mlo,LSR #19
        MOV     OP1mhi,OP2mlo,LSL #8            ;Get bottom part
        BIC     OP1mhi,OP1mhi,#&C0000000
        ORR     OP1mlo,OP1mlo,Rtmp,LSL #11      ;Merge together
        ORR     OP1mhi,OP1mhi,Rtmp,LSR #21

; Now assemble the number as follows:
;   Sign comes from OP1sue;
;   Uncommon bit is 1;
;   Exponent is maximum;
;   Units bit is zero;
;   First fraction bit comes from Rarith;
;   Remaining fraction bits come from OP1mhi,OP1mlo.

        AND     OP1sue,OP1sue,#Sign_bit
        ORR     OP1sue,OP1sue,#Uncommon_bit
        ORR     OP1sue,OP1sue,#NaNInfExp_Extended:AND:&FF00
        ORR     OP1sue,OP1sue,#NaNInfExp_Extended:AND:&FF
        ASSERT  NaNInfExp_Extended < &10000
        TST     Rarith,#1
        ORRNE   OP1mhi,OP1mhi,#EIFracTop_bit

        MOV     PC,LR

LDFConvert_Packed_Digits

; Internal subroutine to convert Rtmp2 digits from the top of Rtmp from
; binary to decimal, accumulating them into (OP2sue,OP2mhi,OP2mlo). Note
; that a 3-word area is required for this, to deal with expanded packed
; format. Corrupts Rtmp and Rtmp2; updates OP2sue, OP2mhi and OP2mlo;
; preserves all other registers.
;
; Start by multiplying by 10. We don't have any spare registers, so we've
; got to be careful about this! The main trick we employ is that if we add
; two non-overlapping fields to a register (in this case, the same register
; shifted right 2 and the next register up shifted left 30), we know they
; will not both produce a carry. So after adding the first one, we can then
; add the second one with an ADDCS/ADDCCS pair and get the correct carry
; out.

        MOV     OP2sue,OP2sue,LSL #3            ;First multiply by 8
        ORR     OP2sue,OP2sue,OP2mhi,LSR #29
        MOV     OP2mhi,OP2mhi,LSL #3
        ORR     OP2mhi,OP2mhi,OP2mlo,LSR #29
        MOV     OP2mlo,OP2mlo,LSL #3

        ADDS    OP2mlo,OP2mlo,OP2mlo,LSR #2     ;Then multiply by 5/4
        ADDCS   OP2mlo,OP2mlo,OP2mhi,LSL #30
        ADDCCS  OP2mlo,OP2mlo,OP2mhi,LSL #30
        ADCS    OP2mhi,OP2mhi,OP2mhi,LSR #2
        ADDCS   OP2mhi,OP2mhi,OP2sue,LSL #30
        ADDCCS  OP2mhi,OP2mhi,OP2sue,LSL #30
        ADC     OP2sue,OP2sue,OP2sue,LSR #2

; Now add in the new digit and loop if there's more to do.

        ADDS    OP2mlo,OP2mlo,Rtmp,LSR #28
        ADCS    OP2mhi,OP2mhi,#0
        ADC     OP2sue,OP2sue,#0
        MOV     Rtmp,Rtmp,LSL #4
        SUBS    Rtmp2,Rtmp2,#1
        BNE     LDFConvert_Packed_Digits
        MOV     PC,LR

        ]

;===========================================================================

        END
