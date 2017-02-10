; Assembler source for FPA support code and emulator
; ==================================================
; Routines to round numbers and deal with Round stage exceptions
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

; Routine to round a number. RoundNum_Single, RoundNum_Double and
; RoundNum_Extended are subsidiary entry points which can be used when the
; precision is known. Note that they have precisely the same entry and exit
; conditions: in particular, RNDprm must still contain the correct precision
; as well as rounding mode.
; Entry: OP1sue holds the number's sign (remaining bits are zeros);
;        OP1mhi, OP1mlo hold the number's mantissa;
;        RNDexp holds the number's exponent;
;        RNDdir holds the direction rounding has gone so far;
;        RNDprm holds the precision and rounding mode 4-bit value, aligned
;          to the standard rounding mode field position;
;        Rarith contains the round bit in bit 31, sticky bit in whether the
;          remaining bits are zero or non-zero;
;        Rwp, Rfp and Rsp contain their standard values;
;        R14 holds the return link.
; Exit:  RNDexp, OP1mhi, OP1mlo, and RNDdir may be updated;
;        Rarith contains zero if this rounding was exact, non-zero if not.
;          (NB RNDdir indicates combined direction of all roundings so far,
;          not just of this one.)
;        Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

RoundNum

; Split according to the precision of the rounding.

        MOVS    Rtmp,RNDprm,LSR #RM_pos+3       ;Precision -> (NOT Z,C)
        BCS     RoundNum_Double
        BEQ     RoundNum_Single

RoundNum_Extended

; Extended precision rounding. No truncation is required - we just need to
; construct the index into the rounding table. Note that we also put the
; precision into the index: we will compensate for this later when we do the
; table lookup. Note also that we construct the index at a rotated position
; in the word, with the sign bit within the rotated index aligned with the
; sign bit with the top word of a floating point number. For instance, we
; rotate RNDprm by the right amount to place it just above the sign bit.

        MOVS    Rtmp,Rarith,LSL #1      ;C<-round, Z<-NOT(sticky)
        ORR     Rtmp,OP1sue,RNDprm,ROR #(RM_pos - (Sign_pos+1)):AND:31
        ORRCS   Rtmp,Rtmp,#1:SHL:((Sign_pos-1):AND:31)
        ORRNE   Rtmp,Rtmp,#1:SHL:((Sign_pos-2):AND:31)
        TEQ     RNDdir,#0               ;N<-tie case bit unless EQ, which
        MOVEQS  Rarith,OP1mlo,LSL #31   ; is dealt with here
        ORRMI   Rtmp,Rtmp,#1:SHL:((Sign_pos-3):AND:31)

; Now get the rounding table entry - remembering that the index is 128 too
; big, since we included the precision field in it and the precision is
; extended.

        ADR     Rarith,RoundTable-128
        LDRB    Rarith,[Rarith,Rtmp,ROR #(Sign_pos-3):AND:31]

; If bit 0 of the entry is set, we need to round up.

        MOVS    Rtmp,Rarith,LSR #1
        ADDCSS  OP1mlo,OP1mlo,#1        ;Increment low word
        ADDCSS  OP1mhi,OP1mhi,#1        ;If carry out, increment high word
        MOVCS   OP1mhi,#EIUnits_bit     ;If mantissa overflow, adjust
        ADDCS   RNDexp,RNDexp,#1        ; mantissa and exponent

; Finally, adjust the direction of rounding so far if bit 1 of the rounding
; table entry is 1, and return with Rarith=0 if this rounding was exact (i.e.
; if there was no need to adjust the direction of rounding), Rarith != 0
; otherwise.

        TST     Rarith,#2
        MOVNE   RNDdir,Rarith,LSL #24
        MOV     PC,LR

RoundNum_Single

; Single precision rounding. First, we construct the index into the rounding
; table. Note that we also put the precision into the index: we will
; compensate for this later when we do the table lookup. Note also that we
; construct the index at a rotated position in the word, with the sign bit
; within the rotated index aligned with the sign bit with the top word of a
; floating point number. For instance, we rotate RNDprm by the right amount
; to place it just above the sign bit.

        ORR     Rtmp,Rarith,OP1mlo       ;C<-round=OP1mhi[7], Z<-NOT(sticky)
        ORRS    Rtmp,Rtmp,OP1mhi,LSL #25 ; =NOR(Rarith,OP1mlo,OP1mhi[6:0])
        ORR     Rtmp,OP1sue,RNDprm,ROR #(RM_pos - (Sign_pos+1)):AND:31
        ORRCS   Rtmp,Rtmp,#1:SHL:((Sign_pos-1):AND:31)
        ORRNE   Rtmp,Rtmp,#1:SHL:((Sign_pos-2):AND:31)
        TEQ     RNDdir,#0               ;N<-tie case bit unless EQ, which
        MOVEQS  Rarith,OP1mhi,LSL #23   ; is dealt with here
        ORRMI   Rtmp,Rtmp,#1:SHL:((Sign_pos-3):AND:31)

; Truncate the mantissa.

        MOV     OP1mlo,#0
        BIC     OP1mhi,OP1mhi,#&FF

; Now get the rounding table entry - remembering that the index is correct
; even though we included the precision field in it, since the precision is
; single.

        ADR     Rarith,RoundTable
        LDRB    Rarith,[Rarith,Rtmp,ROR #(Sign_pos-3):AND:31]

; If bit 0 of the entry is set, we need to round up.

        MOVS    Rtmp,Rarith,LSR #1
        ADDCSS  OP1mhi,OP1mhi,#&100     ;Increment high word
        MOVCS   OP1mhi,#EIUnits_bit     ;If mantissa overflow, adjust
        ADDCS   RNDexp,RNDexp,#1        ; mantissa and exponent

; Finally, adjust the direction of rounding so far if bit 1 of the rounding
; table entry is 1, and return with Rarith=0 if this rounding was exact (i.e.
; if there was no need to adjust the direction of rounding), Rarith != 0
; otherwise.

        TST     Rarith,#2
        MOVNE   RNDdir,Rarith,LSL #24
        MOV     PC,LR

RoundNum_Double

; Double precision rounding. First, we construct the index into the rounding
; table. Note that we also put the precision into the index: we will
; compensate for this later when we do the table lookup. Note also that we
; construct the index at a rotated position in the word, with the sign bit
; within the rotated index aligned with the sign bit with the top word of a
; floating point number. For instance, we rotate RNDprm by the right amount
; to place it just above the sign bit.

        ORRS    Rtmp,Rarith,OP1mlo,LSL #22 ;C<-round=OP1mlo[10], Z<-NOT(sticky)
                                           ; = NOR(Rtmp,OP1mlo[9:0])
        ORR     Rtmp,OP1sue,RNDprm,ROR #(RM_pos - (Sign_pos+1)):AND:31
        ORRCS   Rtmp,Rtmp,#1:SHL:((Sign_pos-1):AND:31)
        ORRNE   Rtmp,Rtmp,#1:SHL:((Sign_pos-2):AND:31)
        TEQ     RNDdir,#0               ;N<-tie case bit unless EQ, which
        MOVEQS  Rarith,OP1mlo,LSL #20   ; is dealt with here
        ORRMI   Rtmp,Rtmp,#1:SHL:((Sign_pos-3):AND:31)

; Truncate the mantissa.

        BIC     OP1mlo,OP1mlo,#&FF
        BIC     OP1mlo,OP1mlo,#&700

; Now get the rounding table entry - remembering that the index is 64 too
; big, since we included the precision field in it and the precision is
; double.

        ADR     Rarith,RoundTable-64
        LDRB    Rarith,[Rarith,Rtmp,ROR #(Sign_pos-3):AND:31]

; If bit 0 of the entry is set, we need to round up.

        MOVS    Rtmp,Rarith,LSR #1
        ADDCSS  OP1mlo,OP1mlo,#&800     ;Increment low word
        ADDCSS  OP1mhi,OP1mhi,#1        ;If carry out, increment high word
        MOVCS   OP1mhi,#EIUnits_bit     ;If mantissa overflow, adjust
        ADDCS   RNDexp,RNDexp,#1        ; mantissa and exponent

; Finally, adjust the direction of rounding so far if bit 1 of the rounding
; table entry is 1, and return with Rarith=0 if this rounding was exact (i.e.
; if there was no need to adjust the direction of rounding), Rarith != 0
; otherwise.

        TST     Rarith,#2
        MOVNE   RNDdir,Rarith,LSL #24
        MOV     PC,LR

;===========================================================================

; Rounding table. This is a 64 byte table: the byte with index N refers to a
; case, controlled by the individual bits of N as follows:
;
; Bits 5,4 = 00: Rounding mode is to Nearest;
; Bits 5,4 = 01: Rounding mode is to Plus Infinity;
; Bits 5,4 = 10: Rounding mode is to Minus Infinity;
; Bits 5,4 = 11: Rounding mode is to Zero;
; Bit 3 = 0:     Value being rounded is positive;
; Bit 3 = 1:     Value being rounded is negative;
; Bit 2 = 0:     Value being rounded has a "round" bit of 0;
; Bit 2 = 1:     Value being rounded has a "round" bit of 1;
; Bit 1 = 0:     Value being rounded has a "sticky" bit of 0;
; Bit 1 = 1:     Value being rounded has a "sticky" bit of 1;
; Bit 0 = 0:     The Nearest tie case discrimination bit is 0;
; Bit 0 = 1:     The Nearest tie case discrimination bit is 1.
;
; The "Nearest tie case discrimination bit" is 1 if the rounding direction
; so far is negative, or if it is zero and the least significant bit of the
; result mantissa is 1. It is 0 if the rounding direction so far is
; positive, or if it is zero and the least significant bit of the result
; mantissa is 0. If 1, it indicates that the tie case in rounding to Nearest
; should be resolved by rounding up in magnitude; if 0, by rounding down.
;
; The entries in the table are:
;   3 to indicate the result should be rounded up in magnitude;
;   0 to indicate the result is exact;
;   254 to indicate the result should be rounded down in magnitude;
;
; This encoding is chosen to have the following properties:
;   Bit 0 is 1 if we need to increment the mantissa, 0 if not;
;   Bit 1 is 1 if we need to update the direction of rounding so far;
;   If bit 1 is 1, a suitable new value for the direction of rounding so
;     far is the whole byte, shifted left by 24 bits.

RoundTable BytesStart
        DCB     0,  0,254,254,254,  3,  3,  3   ;Nearest, positive
        DCB     0,  0,254,254,254,  3,  3,  3   ;Nearest, negative
        DCB     0,  0,  3,  3,  3,  3,  3,  3   ;Plus infinity, positive
        DCB     0,  0,254,254,254,254,254,254   ;Plus infinity, negative
        DCB     0,  0,254,254,254,254,254,254   ;Minus infinity, positive
        DCB     0,  0,  3,  3,  3,  3,  3,  3   ;Minus infinity, negative
        DCB     0,  0,254,254,254,254,254,254   ;Zero, positive
        DCB     0,  0,254,254,254,254,254,254   ;Zero, negative
        BytesEnd

;===========================================================================

; Table of possible results from an overflow whose destination is a
; register. These are in the standard 3-word internal format.

Overflow_Results
OFR_pinf        DCD     Uncommon_bit+NaNInfExp_Extended,&00000000,&00000000
OFR_pinf_o      EQU     OFR_pinf - Overflow_Results     ;+ infinity
OFR_pSmax       DCD     SMax_Exp,&FFFFFF00,&00000000
OFR_pSmax_o     EQU     OFR_pSmax - Overflow_Results    ;+ single maxnorm
OFR_pDmax       DCD     DMax_Exp,&FFFFFFFF,&FFFFF800
OFR_pDmax_o     EQU     OFR_pDmax - Overflow_Results    ;+ double maxnorm
OFR_pEmax       DCD     EMax_Exp,&FFFFFFFF,&FFFFFFFF
OFR_pEmax_o     EQU     OFR_pEmax - Overflow_Results    ;+ extended maxnorm
OFR_minf        DCD     Sign_bit+Uncommon_bit+NaNInfExp_Extended,&00000000,&00000000
OFR_minf_o      EQU     OFR_minf - Overflow_Results     ;- infinity
OFR_mSmax       DCD     Sign_bit+SMax_Exp,&FFFFFF00,&00000000
OFR_mSmax_o     EQU     OFR_mSmax - Overflow_Results    ;- single maxnorm
OFR_mDmax       DCD     Sign_bit+DMax_Exp,&FFFFFFFF,&FFFFF800
OFR_mDmax_o     EQU     OFR_mDmax - Overflow_Results    ;- double maxnorm
OFR_mEmax       DCD     Sign_bit+EMax_Exp,&FFFFFFFF,&FFFFFFFF
OFR_mEmax_o     EQU     OFR_mEmax - Overflow_Results    ;- extended maxnorm

; Table of correct register results from overflows. Each line gives the
; offset for the correct result in the "Overflow_Results" table if the
; result sign is negative, followed by the corresponding offset if the
; result is positive.

Overflow_ResultTable
        DCD     OFR_minf_o, OFR_pinf_o  ;Single, Nearest
        DCD     OFR_mSmax_o,OFR_pinf_o  ;Single, Plus infinity
        DCD     OFR_minf_o, OFR_pSmax_o ;Single, Minus infinity
        DCD     OFR_mSmax_o,OFR_pSmax_o ;Single, Zero
        DCD     OFR_minf_o, OFR_pinf_o  ;Double, Nearest
        DCD     OFR_mDmax_o,OFR_pinf_o  ;Double, Plus infinity
        DCD     OFR_minf_o, OFR_pDmax_o ;Double, Minus infinity
        DCD     OFR_mDmax_o,OFR_pDmax_o ;Double, Zero
        DCD     OFR_minf_o, OFR_pinf_o  ;Extended, Nearest
        DCD     OFR_mEmax_o,OFR_pinf_o  ;Extended, Plus infinity
        DCD     OFR_minf_o, OFR_pEmax_o ;Extended, Minus infinity
        DCD     OFR_mEmax_o,OFR_pEmax_o ;Extended, Zero
; Next 8 words are in theory in the table, for packed precision, but are
; never used (assuming the hardware and software work correctly).

;===========================================================================

; Routine to deal with exponent overflow.
; Entry: OP1sue holds the number's sign (remaining bits are zeros);
;        OP1mhi, OP1mlo hold the number's mantissa;
;        RNDexp holds the number's exponent;
;        RNDdir holds the direction rounding has gone so far;
;        RNDprm holds the precision and rounding mode 4-bit value, aligned
;          to the standard rounding mode field position;
;        Rins holds information about the instruction concerned;
;        Rfpsr, Rwp, Rfp and Rsp contain their standard values;
;        R14 holds the return link.
; Exit:  OP1sue holds the result's sign, uncommon bit and exponent;
;        OP1mhi and OP1mlo hold the result's mantissa;
;        RNDdir and Rfpsr may be updated;
;        RNDexp, Rarith, Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

Overflow

; Exponent overflow from the FPA is enough to establish that we've got IEEE
; overflow. Is the overflow trap handler enabled?

        TST     Rfpsr,#OFE_bit
        BNE     OverflowTrap

; The trap handler is not enabled, so we just need to take the default
; overflow actions. First, it's time to set the cumulative bit.

        ORR     Rfpsr,Rfpsr,#OFC_bit

; Now create the correct result, which is either an infinity or the largest
; magnitude normalised number for the destination precision. This is done by
; table look-up.

        ADR     OP1mhi,Overflow_ResultTable
        BiShift ADD,OP1mhi,OP1mhi,RNDprm,LSR #RM_pos,LSL #3
        LDMIA   OP1mhi,{OP1mhi,OP1mlo}  ;Get offsets to results of each sign
        ASSERT  OP1mhi < OP1mlo
        TST     OP1sue,#Sign_bit        ;Get sign
        ADR     OP1sue,Overflow_Results
        ADDNE   OP1sue,OP1sue,OP1mhi    ;Negative result case
        ADDEQ   OP1sue,OP1sue,OP1mlo    ;Positive result case
        LDMIA   OP1sue,{OP1sue,OP1mhi,OP1mlo}   ;Get the result
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo

; We need to update the rounding direction. The result has been rounded up
; in magnitude if it is infinite, down if it is a normalised number. We use
; the fact that the infinities are uncommon and the normalised numbers
; common to get this right.

        TST     OP1sue,#Uncommon_bit
        MOVNE   RNDdir,#1
        MOVEQ   RNDdir,#-1

; And that's all.

        MOV     PC,LR

OverflowTrap

; We're going to call an overflow trap handler.

        STMFD   Rsp!,{RNDexp,RNDprm,Rwp,Rins,LR}

; Tidy up the value in RNDdir.

        CMP     RNDdir,#TopBit
        CMPNE   RNDdir,#0
        MOVGT   RNDdir,#1
        MOVLT   RNDdir,#-1

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Make enough space on the stack for our purposes.

        SUB     Rsp,Rsp,#4

; Determine whether this is a precise or imprecise trap.

        [ SCWanted
          TestImp Rtmp2,Rtmp,ImpreciseTableR_fpa
        ]

; Split according to precision.

        TST     RNDprm,#1:SHL:(RM_pos+3)
        BNE     OverflowTrap_Extended
        TST     RNDprm,#1:SHL:(RM_pos+2)
        BNE     OverflowTrap_Double

OverflowTrap_Single

; Construct the potential result. We do this by subtracting the exponent
; bias adjust from the exponent we've got and seeing whether this brings the
; exponent in range. If so, we've got the number and merely need to combine
; the exponent with the sign; otherwise, we'll generate the "massive
; overflow" quiet NaN.

        SUB     RNDexp,RNDexp,#TrapBiasAdjust_Single
        LDR     Rtmp,=SMax_Exp
        CMP     RNDexp,Rtmp
        ORRLE   OP1sue,OP1sue,RNDexp,LSL #EIExp_pos
        ADRGT   OP1sue,OverflowTrap_MassiveNaN
        LDMGTIA OP1sue,OP1regs

; Put the potential result on the stack.

        STMFD   Rsp!,OP1regs

; Put the precise/imprecise indicator in R3.

        [ FPASCWanted
          MOV     R3,Rtmp2
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = RNDexp

; Call the veneer-defined trap handler.

        [ :LNOT:TrapsCanReturn
          B       veneer_overflow_single
        |
          BL      veneer_overflow_single

RoundingTrapCommon_Single

; Obtain the single precision result from the stack, then branch to common
; code.

          EnterRecursive 1,0,Rtmp,NoFPSRChange
          LDFS    F0,[Rtmp]
          B       RoundingTrapCommon
        ]
        
OverflowTrap_Double

; Construct the potential result. We do this by subtracting the exponent
; bias adjust from the exponent we've got and seeing whether this brings the
; exponent in range. If so, we've got the number and merely need to combine
; the exponent with the sign; otherwise, we'll generate the "massive
; overflow" quiet NaN.

        SUB     RNDexp,RNDexp,#TrapBiasAdjust_Double
        LDR     Rtmp,=DMax_Exp
        CMP     RNDexp,Rtmp
        ORRLE   OP1sue,OP1sue,RNDexp,LSL #EIExp_pos
        ADRGT   OP1sue,OverflowTrap_MassiveNaN
        LDMGTIA OP1sue,OP1regs

; Put the potential result on the stack.

        STMFD   Rsp!,OP1regs

; Put the precise/imprecise indicator in R3.

        [ FPASCWanted
          MOV     R3,Rtmp2
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = RNDexp

; Call the veneer-defined trap handler.

        [ :LNOT:TrapsCanReturn
          B       veneer_overflow_double
        |
          BL      veneer_overflow_double

RoundingTrapCommon_Double

; Obtain the double precision result from the stack, then transfer to common
; code.

          EnterRecursive 1,0,Rtmp,NoFPSRChange
          LDFD    F0,[Rtmp]
          B       RoundingTrapCommon
        ]

OverflowTrap_Extended

; Construct the potential result. We do this by subtracting the exponent
; bias adjust from the exponent we've got and seeing whether this brings the
; exponent in range. If so, we've got the number and merely need to combine
; the exponent with the sign; otherwise, we'll generate the "massive
; overflow" quiet NaN.

        SUB     RNDexp,RNDexp,#TrapBiasAdjust_Extended
        LDR     Rtmp,=EMax_Exp
        CMP     RNDexp,Rtmp
        ORRLE   OP1sue,OP1sue,RNDexp,LSL #EIExp_pos
        ADRGT   OP1sue,OverflowTrap_MassiveNaN
        LDMGTIA OP1sue,OP1regs

; Put the potential result on the stack.

        STMFD   Rsp!,OP1regs

; Put the precise/imprecise indicator in R3.

        [ FPASCWanted
          MOV     R3,Rtmp2
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = RNDexp

; Call the veneer-defined trap handler.
                                         
        [ :LNOT:TrapsCanReturn
          B       veneer_overflow_extended
        |
          BL      veneer_overflow_extended

RoundingTrapCommon_Extended

; Obtain the extended precision result from the stack, then join common
; code.

          EnterRecursive 1,0,Rtmp,NoFPSRChange
          LDFE    F0,[Rtmp]

RoundingTrapCommon

; Get the possibly changed FPSR, taking care not to produce a recursive
; entry to the FPE.

          LDR     Rfpsr,MemFPSR ;Proper FPSR for FPE, top bit set if FPASC
          TEQ     Rfpsr,#0      ;Check whether FPASC
          RFSMI   Rfpsr         ;If so, get real FPSR

; Transfer the internal format result to OP1regs and exit the recursive
; region, then return. Note that we throw away 4 words in the
; "ExitRecursive" macro in addition to those claimed by the "EnterRecursive"
; macro.

          ExitRecursive 1,16,Rtmp,F0,OP1regs
          LDMFD   Rsp!,{RNDexp,RNDprm,Rwp,Rins,PC}
        ]

;===========================================================================

OverflowTrap_MassiveNaN
        DCD     Uncommon_bit+NaNInfExp_Extended,EIFracTop_bit,&00000000

        LTORG

        [ SCWanted
; A table indicating which instructions yield imprecise exceptions. The
; first word relates to CPDOs, the second to CPRTs. Within each word, the
; bits are indexed by the 5-bit number consisting of bits 15,23,22,21,20 of
; the instruction, in that order.

ImpreciseTableR_fpa
          DCD     &C0070E3F,&00010001
        ]

;===========================================================================

; Routine to deal with exponent underflow, attempting to produce a result
; suitable for loading into a register.
; Entry: OP1sue holds the number's sign (remaining bits are zeros);
;        OP1mhi, OP1mlo hold the number's mantissa;
;        RNDexp holds the number's exponent;
;        RNDdir holds the direction rounding has gone so far;
;        RNDprm holds the precision and rounding mode 4-bit value, aligned
;          to the standard rounding mode field position;
;        Rins holds information about the instruction concerned;
;        Rtmp contains the amount by which the exponent has underflowed;
;        Rfpsr, Rwp, Rfp and Rsp contain their standard values;
;        R14 holds the return link.
; Exit:  OP1sue holds the result's sign, uncommon bit and exponent;
;        OP1mhi and OP1mlo hold the result's mantissa;
;        RNDdir and Rfpsr may be updated;
;        RNDexp, Rarith, Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

        [ :LNOT:FixUFLonMove

UnderflowForReg

; This is more complicated than the overflow case, since we don't know yet
; whether IEEE underflow has occurred - indeed, whether it has done so
; depends, among other things, on whether the underflow trap is enabled.
; The first thing we need to do is make certain that we've got IEEE
; "tininess". We already know that the exponent is too small, so all we
; still have to check is that the result is non-zero.
;   If the result is zero, all registers contain their correct values for
; return.

        ORRS    Rarith,OP1mhi,OP1mlo
        MOVEQ   PC,LR

; We now know that we have IEEE tininess (the "after rounding" variety):
; this means that if the underflow trap *is* enabled, we definitely have
; IEEE underflow. If it isn't, we will have to denormalise the number and
; then decide whether we've also got IEEE loss of accuracy. So is the
; underflow trap enabled?

        STMFD   Rsp!,{LR}
        TST     Rfpsr,#UFE_bit
        BNE     UnderflowTrap

; If not, do the denormalisation shift, adjusting the exponent and
; accumulating the round and sticky bits.

        ADD     RNDexp,RNDexp,Rtmp      ;Adjust exp. to minexp(precision)
        Denorm  OP1mhi,OP1mlo,Rarith,Rtmp,Rtmp2,Rtmp

; Now we round the denormalised number - taking the direction it's already
; been rounded into account if appropriate. If this rounding is inexact,
; we've got a denormalisation loss; this is indicated by Rtmp returning as
; a non-zero value.

        BL      RoundNum

; Now deal with the ND bit in the FPSR. We must flush the result to zero if
; the ND bit is set and the mantissa is denormalised and non-zero. This last
; condition (i.e. that the mantissa is non-zero) is necessary because we are
; also going to force RNDdir to a negative quantity and use the condition
; code to indicate how the rounding has gone. If the mantissa is already
; zero, we want to leave them alone. So the condition we want is:
;   ((OP1mhi OR OP1mlo) != 0) AND (OP1mhi[31] = 0) AND (Rfpsr[ND] != 0)
; Note also that the value of OP1mhi passed to RoundNum definitely did not
; have its top bit set. So the only way we can possibly have OP1mhi[31]=1
; is if the rounding increment made OP1mhi = &80000000. So we can rewrite
; the condition as:
;   ((OP1mhi OR OP1mlo) != 0) AND (OP1mhi != &80000000) AND (Rfpsr[ND] != 0)

        TST     Rfpsr,#ND_bit
        TEQNE   OP1mhi,#EIUnits_bit
        ORRNES  Rtmp,OP1mhi,OP1mlo
        MOVNE   OP1mhi,#0       ;If condition is satisfied, flush mantissa
        MOVNE   OP1mlo,#0       ; to zero,
        MOVNE   RNDdir,#-1      ; and new rounding direction is down

; We now know whether we've had the "denormalisation loss" form of loss of
; accuracy as well as tininess - it's if *this* rounding is inexact. The
; rounding is inexact if either we have the NE condition at present (i.e.
; we've just flushed to zero) or the RoundNum call said that its rounding
; was inexact. So set the cumulative flag if so.

        TEQEQ   Rarith,#0
        ORRNE   Rfpsr,Rfpsr,#UFC_bit

; Now we need to finish creating the result value. The rules for this are:
;
; * If the mantissa is all zeros, the result is a zero. In this case, the
;   exponent and uncommon bit both need to be zero.
;
; * If the mantissa is not all zero, and the destination precision is
;   extended (which we can detect by RNDexp being 0 at this stage), we need
;   to set the uncommon bit correctly - i.e. to one if the mantissa is
;   unnormalised.
;
; * If the mantissa is not all zero, and the destination precision is single
;   or double, the uncommon bit is definitely zero, and we need to normalise
;   the (RNDexp,OP1mhi,OP1mlo) combination to create the final result as a
;   normalised extended precision number.
;
; Note that, as in the ND bit code above, we can check for a normalised
; number either by testing the units bit directly (producing NE if
; normalised) or by testing for equality with &80000000 (producing EQ if
; normalised), since this is the only normalised value it can take. The
; former option proves best here.

        ORRS    Rarith,OP1mhi,OP1mlo    ;Is this a zero?
        LDMEQFD Rsp!,{PC}               ;If so, return - exp. is already 0
        TEQ     RNDexp,#0               ;If single or double, normalise to
        BLNE    NormaliseOp1            ; extended (NB "NormaliseOp1"
                                        ; always returns NE)
        TSTEQ   OP1mhi,#EIUnits_bit     ;If extended, result is uncommon
        ORREQ   OP1sue,OP1sue,#Uncommon_bit ; if units bit is clear
        ORR     OP1sue,OP1sue,RNDexp,LSL #EIExp_pos
        LDMFD   Rsp!,{PC}

        ]

UnderflowTrap

; We've got trapped IEEE underflow. Note this code is shared by
; "UnderflowForReg" and "UnderflowForMem", since we have no real control
; over what form the underflow trap returns its result in.
;   Here, we need to call the correct underflow trap handler.

        STMFD   Rsp!,{RNDexp,RNDprm,Rwp,Rins,LR}

; Tidy up the value in RNDdir.

        CMP     RNDdir,#TopBit
        CMPNE   RNDdir,#0
        MOVGT   RNDdir,#1
        MOVLT   RNDdir,#-1

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Make enough space on the stack for our purposes.

        SUB     Rsp,Rsp,#4

; Determine whether this is a precise or imprecise trap.

        [ SCWanted
          TestImp Rtmp2,Rtmp,ImpreciseTableR_fpa
        ]

; Split according to precision.

        TST     RNDprm,#1:SHL:(RM_pos+3)
        BNE     UnderflowTrap_Extended
        TST     RNDprm,#1:SHL:(RM_pos+2)
        BNE     UnderflowTrap_Double

UnderflowTrap_Single

; Construct the potential result. We do this by adding the exponent bias
; adjust to the exponent we've got and seeing whether this brings the
; exponent in range. If so, we've got the number and merely need to combine
; the exponent with the sign; otherwise, we'll generate the "massive
; underflow" quiet NaN.

        ADD     RNDexp,RNDexp,#TrapBiasAdjust_Single
        LDR     Rtmp,=SMin_Exp
        CMP     RNDexp,Rtmp
        ORRGE   OP1sue,OP1sue,RNDexp,LSL #EIExp_pos
        ADRLT   OP1sue,UnderflowTrap_MassiveNaN
        LDMLTIA OP1sue,OP1regs

; Put the potential result on the stack.

        STMFD   Rsp!,OP1regs

; Put the precise/imprecise indicator in R3.

        [ FPASCWanted
          MOV     R3,Rtmp2
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = RNDexp

; Call the veneer-defined trap handler.

        [ :LNOT:TrapsCanReturn
          B       veneer_underflow_single
        |
          BL      veneer_underflow_single
          B       RoundingTrapCommon_Single
        ]
        
UnderflowTrap_Double

; Construct the potential result. We do this by adding the exponent bias
; adjust to the exponent we've got and seeing whether this brings the
; exponent in range. If so, we've got the number and merely need to combine
; the exponent with the sign; otherwise, we'll generate the "massive
; underflow" quiet NaN.

        ADD     RNDexp,RNDexp,#TrapBiasAdjust_Double
        LDR     Rtmp,=DMin_Exp
        CMP     RNDexp,Rtmp
        ORRGE   OP1sue,OP1sue,RNDexp,LSL #EIExp_pos
        ADRLT   OP1sue,UnderflowTrap_MassiveNaN
        LDMLTIA OP1sue,OP1regs

; Put the potential result on the stack.

        STMFD   Rsp!,OP1regs

; Put the precise/imprecise indicator in R3.

        [ FPASCWanted
          MOV     R3,Rtmp2
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = RNDexp

; Call the veneer-defined trap handler.

        [ :LNOT:TrapsCanReturn
          B       veneer_underflow_double
        |
          BL      veneer_underflow_double
          B       RoundingTrapCommon_Double
        ]

UnderflowTrap_Extended

; Construct the potential result. We do this by adding the exponent bias
; adjust to the exponent we've got and seeing whether this brings the
; exponent in range. If so, we've got the number and merely need to combine
; the exponent with the sign; otherwise, we'll generate the "massive
; underflow" quiet NaN.

        ADD     RNDexp,RNDexp,#TrapBiasAdjust_Extended
        LDR     Rtmp,=EMin_Exp
        CMP     RNDexp,Rtmp
        ORRGE   OP1sue,OP1sue,RNDexp,LSL #EIExp_pos
        ADRLT   OP1sue,UnderflowTrap_MassiveNaN
        LDMLTIA OP1sue,OP1regs

; Put the potential result on the stack.

        STMFD   Rsp!,OP1regs

; Put the precise/imprecise indicator in R3.

        [ FPASCWanted
          MOV     R3,Rtmp2
        |
          MOV     R3,#0         ;Always precise if this is the FPE only!
        ]
        ASSERT  R3 = RNDexp

; Call the veneer-defined trap handler.

        [ :LNOT:TrapsCanReturn
          B       veneer_underflow_extended
        |
          BL      veneer_underflow_extended
          B       RoundingTrapCommon_Extended
        ]

;===========================================================================

UnderflowTrap_MassiveNaN
        DCD     Uncommon_bit+NaNInfExp_Extended,EIFracTop_bit,&00000000

        LTORG

;===========================================================================

; Routine to deal with exponent underflow, attempting to produce a result
; suitable for storing in memory. The main difference between this routine
; and "UnderflowForReg" is that when a single or double denormalised number
; is generated, "UnderflowForReg" produces it as an internal format extended
; precision normalised number: this routine creates an internal format
; single or double denormalised number.
;   Note however that this distinction is only one of intent, not a
; guarantee: in particular, trap handlers can produce denormalised numbers
; in either form, and these routines will simply return them in whatever
; form they receive them in.
;
; Entry: OP1sue holds the number's sign (remaining bits are zeros);
;        OP1mhi, OP1mlo hold the number's mantissa;
;        RNDexp holds the number's exponent;
;        RNDdir holds the direction rounding has gone so far;
;        RNDprm holds the precision and rounding mode 4-bit value, aligned
;          to the standard rounding mode field position;
;        Rins holds information about the instruction concerned;
;        Rtmp contains the amount by which the exponent has underflowed;
;        Rfpsr, Rwp, Rfp and Rsp contain their standard values;
;        R14 holds the return link.
; Exit:  OP1sue holds the result's sign, uncommon bit and exponent;
;        OP1mhi and OP1mlo hold the result's mantissa;
;        RNDdir and Rfpsr may be updated;
;        RNDexp, Rarith, Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

UnderflowForMem
         [ FixUFLonMove
UnderflowForReg
         ]

; This is more complicated than the overflow case, since we don't know yet
; whether IEEE underflow has occurred - indeed, whether it has done so
; depends, among other things, on whether the underflow trap is enabled.
; The first thing we need to do is make certain that we've got IEEE
; "tininess". We already know that the exponent is too small, so all we
; still have to check is that the result is non-zero.
;   If the result is zero, all registers contain their correct values for
; return.

        ORRS    Rarith,OP1mhi,OP1mlo
        MOVEQ   PC,LR

; We now know that we have IEEE tininess (the "after rounding" variety):
; this means that if the underflow trap *is* enabled, we definitely have
; IEEE underflow. If it isn't, we will have to denormalise the number and
; then decide whether we've also got IEEE loss of accuracy. So is the
; underflow trap enabled?

        STMFD   Rsp!,{LR}
        TST     Rfpsr,#UFE_bit
        BNE     UnderflowTrap

; If not, do the denormalisation shift, adjusting the exponent and
; accumulating the round and sticky bits.

        ADD     RNDexp,RNDexp,Rtmp      ;Adjust exp. to minexp(precision)
        Denorm  OP1mhi,OP1mlo,Rarith,Rtmp,Rtmp2,Rtmp

; Now we round the denormalised number - taking the direction it's already
; been rounded into account if appropriate. If this rounding is inexact,
; we've got a denormalisation loss; this is indicated by Rtmp returning as
; a non-zero value.

        BL      RoundNum

; Now deal with the ND bit in the FPSR. We must flush the result to zero if
; the ND bit is set and the mantissa is denormalised and non-zero. This last
; condition (i.e. that the mantissa is non-zero) is necessary because we are
; also going to force RNDdir to a negative quantity and use the condition
; code to indicate how the rounding has gone. If the mantissa is already
; zero, we want to leave them alone. So the condition we want is:
;   ((OP1mhi OR OP1mlo) != 0) AND (OP1mhi[31] = 0) AND (Rfpsr[ND] != 0)
; Note also that the value of OP1mhi passed to RoundNum definitely did not
; have its top bit set. So the only way we can possibly have OP1mhi[31]=1
; is if the rounding increment made OP1mhi = &80000000. So we can rewrite
; the condition as:
;   ((OP1mhi OR OP1mlo) != 0) AND (OP1mhi != &80000000) AND (Rfpsr[ND] != 0)

        TST     Rfpsr,#ND_bit
        TEQNE   OP1mhi,#EIUnits_bit
        ORRNES  Rtmp,OP1mhi,OP1mlo
        MOVNE   OP1mhi,#0       ;If condition is satisfied, flush mantissa
        MOVNE   OP1mlo,#0       ; to zero,
        MOVNE   RNDdir,#-1      ; and new rounding direction is down

; We now know whether we've had the "denormalisation loss" form of loss of
; accuracy as well as tininess - it's if *this* rounding is inexact. The
; rounding is inexact if either we have the NE condition at present (i.e.
; we've just flushed to zero) or the RoundNum call said that its rounding
; was inexact. So set the cumulative flag if so.

        TEQEQ   Rarith,#0
        ORRNE   Rfpsr,Rfpsr,#UFC_bit

; Now we need to finish creating the result value. The rules for this are:
;
; * If the mantissa is all zero, the result is a zero. In this case, the
;   exponent and uncommon bit both need to be zero.
;
; * If the mantissa is not all zero, and the destination precision is
;   extended (which we can detect by RNDexp being 0 at this stage), we need
;   to set the uncommon bit correctly - i.e. to one if the mantissa is
;   unnormalised.
;
; * If the mantissa is not all zero, and the destination precision is single
;   or double, we don't need to do anything if the mantissa is normalised.
;   Otherwise, we need to reduce the exponent by 1 (to allow for the
;   different bias for normalised and denormalised numbers in single and
;   double precisions) and to set the uncommon bit.
;
; Note that, as in the ND bit code above, we can check for a normalised
; number either by testing the units bit directly (producing NE if
; normalised) or by testing for equality with &80000000 (producing EQ if
; normalised), since this is the only normalised value it can take. The
; latter option proves best here.

        ORRS    Rarith,OP1mhi,OP1mlo    ;Is this a zero?
        LDMEQFD Rsp!,{PC}               ;If so, return - exp. is already 0
        TEQ     OP1mhi,#EIUnits_bit     ;We're done if result is normalised
        ORRNE   OP1sue,OP1sue,#Uncommon_bit ;Set uncommon bit
        TEQNE   RNDexp,#0               ;If single or double,
        SUBNE   RNDexp,RNDexp,#1        ; decrement exponent
        ORRNE   OP1mhi,OP1mhi,#EIUnits_bit ; and force units bit to 1
        ORR     OP1sue,OP1sue,RNDexp,LSL #EIExp_pos
        LDMFD   Rsp!,{PC}

;===========================================================================

; Routine to deal with an inexact trap for an operation producing a result
; of single, double or extended precision. "InexactTrapForS",
; "InexactTrapForD" and "InexactTrapForE" are three subsidiary entry points,
; for when the result is known to be single, double or extended precision
; respectively; for these entry points, RNDprm is irrelevant.
;
; Entry: OP1sue holds the potential result's sign, uncommon bit and
;          exponent;
;        OP1mhi, OP1mlo hold the potential result's mantissa;
;        RNDdir holds the direction rounding has gone so far;
;        RNDprm holds the precision and rounding mode 4-bit value, aligned
;          to the standard rounding mode field position;
;        Rins holds information about the instruction concerned;
;        Rfpsr, Rwp, Rfp and Rsp contain their standard values;
;        R14 holds the return link.
; Exit:  OP1sue, OP1mhi and OP1mlo may be updated;
;        RNDdir and Rfpsr may be updated;
;        Rarith, Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

InexactTrapForS

        MOV     Rtmp,#0
        B       InexactTrap_Entry

InexactTrapForD

        MOV     Rtmp,#1
        B       InexactTrap_Entry

InexactTrapForE

        MOV     Rtmp,#2
        B       InexactTrap_Entry

InexactTrapForSDE

; Isolate the precision.

        MOV     Rtmp,RNDprm,LSR #RM_pos+2

InexactTrap_Entry

        STMFD   Rsp!,{RNDexp,RNDprm,Rwp,Rins,LR}

; Tidy up the value in RNDdir.

        CMP     RNDdir,#TopBit
        CMPNE   RNDdir,#0
        MOVGT   RNDdir,#1
        MOVLT   RNDdir,#-1

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Make enough space on the stack for our purposes and put the potential
; result on the stack.

        SUB     Rsp,Rsp,#4
        STMFD   Rsp!,OP1regs

; Determine whether this is a precise or imprecise trap.

        [ SCWanted
          TestImp R3,Rtmp,ImpreciseTableR_fpa
        |
          MOV     R3,#0
        ]
        ASSERT  R3 = RNDexp

; Split according to precision. At this point, the precision is in Rtmp.

        [ :LNOT:TrapsCanReturn
          CMP     Rtmp,#1
          BHI     veneer_inexact_extended
          BEQ     veneer_inexact_double
          B       veneer_inexact_single
        |
          CMP     Rtmp,#1
          BHI     InexactTrap_Extended
          BEQ     InexactTrap_Double

InexactTrap_Single

; Call the veneer-defined trap handler.

          BL      veneer_inexact_single
          B       RoundingTrapCommon_Single
        
InexactTrap_Double

; Call the veneer-defined trap handler.

          BL      veneer_inexact_double
          B       RoundingTrapCommon_Double

InexactTrap_Extended

; Call the veneer-defined trap handler.

          BL      veneer_inexact_extended
          B       RoundingTrapCommon_Extended
        ]

;===========================================================================

; Routine to deal with an inexact trap for an operation producing an integer
; result.
;
; Entry: RNDdir holds the direction rounding has gone so far;
;        Rarith holds the potential result of the operation;
;        Rins holds information about the instruction concerned;
;        Rfpsr, Rwp, Rfp and Rsp contain their standard values;
;        R14 holds the return link.
; Exit:  Rarith may be updated;
;        RNDdir and Rfpsr may be updated;
;        OP1sue, OP1mhi, OP1mlo, Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

InexactTrapForI

        STMFD   Rsp!,{RNDexp,RNDprm,Rwp,Rins,LR}

; Tidy up the value in RNDdir.

        CMP     RNDdir,#TopBit
        CMPNE   RNDdir,#0
        MOVGT   RNDdir,#1
        MOVLT   RNDdir,#-1

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Reserve some space on the stack for the result.

        SUB     Rsp,Rsp,#16

; Since this is an instruction producing an integer result, it must be
; transferring its result to the ARM and so must be precise.

        MOV     R3,#0
        ASSERT  R3 = RNDexp

; Call the veneer-defined trap handler.

        [ :LNOT:TrapsCanReturn
          B       veneer_inexact_integer
        |
          BL      veneer_inexact_integer

; Get the possibly changed FPSR, taking care not to produce a recursive
; entry to the FPE.

          LDR     Rfpsr,MemFPSR ;Proper FPSR for FPE, top bit set if FPASC
          TEQ     Rfpsr,#0      ;Check whether FPASC
          RFSMI   Rfpsr         ;If so, get real FPSR

; Obtain the integer result from the stack, discard the surplus stack space
; and return.

          LDR     Rarith,[Rsp],#16
          LDMFD   Rsp!,{RNDexp,RNDprm,Rwp,Rins,PC}
        ]
        
;===========================================================================

; Routine to deal with an inexact trap for an operation producing a packed
; result.
;
; Entry: OP1sue, OP1mhi, OP1mlo contain the potential result;
;        RNDdir holds the direction rounding has gone so far;
;        Rins holds information about the instruction concerned;
;        Rfpsr, Rwp, Rfp and Rsp contain their standard values;
;        R14 holds the return link.
; Exit:  OP1sue, OP1mhi, OP1mlo may be updated;
;        RNDdir and Rfpsr may be updated;
;        Rarith, Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

InexactTrapForP

        STMFD   Rsp!,{RNDexp,RNDprm,Rwp,Rins,LR}

; Tidy up the value in RNDdir.

        CMP     RNDdir,#TopBit
        CMPNE   RNDdir,#0
        MOVGT   RNDdir,#1
        MOVLT   RNDdir,#-1

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Reserve some space on the stack for the result.

        SUB     Rsp,Rsp,#16

; Since this is an instruction producing a packed result, it must be
; transferring its result to memory and so must be precise.

        MOV     R3,#0
        ASSERT  R3 = RNDexp

; Call the veneer-defined trap handler.

        [ :LNOT:TrapsCanReturn
          B       veneer_inexact_packed
        |
          BL      veneer_inexact_packed

; Get the possibly changed FPSR, taking care not to produce a recursive
; entry to the FPE.

          LDR     Rfpsr,MemFPSR ;Proper FPSR for FPE, top bit set if FPASC
          TEQ     Rfpsr,#0      ;Check whether FPASC
          RFSMI   Rfpsr         ;If so, get real FPSR

; Obtain the packed result from the stack, discard the surplus stack space
; and return.

          LDMIA   Rsp,{OP1sue,OP1mhi,OP1mlo}
          ADD     Rsp,Rsp,#16
          LDMFD   Rsp!,{RNDexp,RNDprm,Rwp,Rins,PC}
        ]
        
;===========================================================================

; Routine to deal with an inexact trap for an operation producing an
; expanded packed result.
;
; Entry: OP1sue, OP1mhi, OP1mlo, Rarith contain the potential result;
;        RNDdir holds the direction rounding has gone so far;
;        Rins holds information about the instruction concerned;
;        Rfpsr, Rwp, Rfp and Rsp contain their standard values;
;        R14 holds the return link.
; Exit:  OP1sue, OP1mhi, OP1mlo, Rarith may be updated;
;        RNDdir and Rfpsr may be updated;
;        Rtmp, Rtmp2 and R14 may be corrupt;
;        All other registers preserved.

InexactTrapForX

        STMFD   Rsp!,{RNDexp,RNDprm,Rwp,Rins,LR}

; Tidy up the value in RNDdir.

        CMP     RNDdir,#TopBit
        CMPNE   RNDdir,#0
        MOVGT   RNDdir,#1
        MOVLT   RNDdir,#-1

; Make certain the real FPSR contains the correct value, taking care not to
; produce a recursive entry to the FPE.

        TEQ     Rfpsr,#0
        WFSMI   Rfpsr                     ;Real hardware FPSR
        STRPL   Rfpsr,MemFPSR             ;Real software FPSR

; Reserve some space on the stack for the result.

        SUB     Rsp,Rsp,#16

; Since this is an instruction producing an expanded packed result, it must
; be transferring its result to memory and so must be precise.

        MOV     R3,#0
        ASSERT  R3 = RNDexp

; Call the veneer-defined trap handler.

        [ :LNOT:TrapsCanReturn
          B       veneer_inexact_xpacked
        |
          BL      veneer_inexact_xpacked

; Get the possibly changed FPSR, taking care not to produce a recursive
; entry to the FPE.

          LDR     Rfpsr,MemFPSR ;Proper FPSR for FPE, top bit set if FPASC
          TEQ     Rfpsr,#0      ;Check whether FPASC
          RFSMI   Rfpsr         ;If so, get real FPSR

; Obtain the expanded packed result from the stack, discard the surplus
; stack space and return.

          LDMFD   Rsp!,{OP1sue,OP1mhi,OP1mlo,Rarith}
          LDMFD   Rsp!,{RNDexp,RNDprm,Rwp,Rins,PC}
        ]
        
;===========================================================================

        END
