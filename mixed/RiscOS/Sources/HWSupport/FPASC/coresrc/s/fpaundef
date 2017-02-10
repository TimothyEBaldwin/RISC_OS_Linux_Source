; Assembler source for FPA support code and emulator
; ==================================================
; Undefined instruction handler for FPA support code
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

        [ FPASCWanted           ;Scope: the whole of this source file

;===========================================================================

        [ UndefHandStandAlone

; The undefined instruction handler is entered with very little known. All
; that is in fact known is:
;
; For 26 bit handler:
;   Processor mode is Supervisor26;
;   R14_svc contains PC and PSR to return to the instruction following the
;     one that bounced;
;   R13_svc points to a Full Descending stack with sufficiently many words
;     free.
;
; For 32 bit handler:
;   Processor mode is Undefined32;
;   R14_undef and SPSR_undef contain the PC and PSR to return to the
;     instruction following the one that bounced;
;   R13_undef points to a Full Descending stack with sufficiently many words
;     free.

FPASCUndefHandler
        [ :DEF:AssumedHardware
FPUndefHandler
        ]

; We start by preserving *user* registers R0-R14 in the available stack
; space. Note that if we need to emulate an instruction which uses R13 or
; R14, we will take special action if we're not in user mode. Also note that
; the caller's R13 and R14 get preserved in different ways, depending on
; whether the caller is in user mode (in which case these preserved copies
; are used) or non-user mode (in which case they are preserved simply by
; being mode-dependent registers).
;   This deals with all mode-dependent registers except R8_fiq to R12_fiq,
; which we are not going to try to handle anyway!

        SUB     Rsp,Rsp,#16*4           ;Note that coding rules say not to
        STMIA   Rsp,{R0-R14}^           ; use writeback on such STMs
        STR     LR,[Rsp,#15*4]          ;Preserve caller's PC value - note
                                        ; that PC will need special care
                                        ; if used by the instruction
        MOV     Rfp,Rsp                 ;Preserve pointer to register dump

        CDebug1 5,"Frame pointer set up to be",Rfp

        [ {CONFIG}=32
; In 32-bit code, we need to preserve the entry value of the CPSR in case we
; need to pass this exception on to another undefined instruction handler,
; and of the SPSR in case we are going to execute another undefined
; instruction. This could only be done when we actually *are* going to
; execute another undefined instruction, but this leads to a lot of extra
; code, possibilities for bugs, etc., for little extra performance. Note
; incidentally that an added benefit of preserving it here, before we
; re-enable interrupts, is that it means that process swap code will be
; under no obligation to preserve the SPSR, at any rate as far as the
; FPASC/FPE is concerned.
;   For the CPSR, note that the apparent alternative of reconstructing the
; correct CPSR value from SPSR_undef by mimicking the effect of the
; undefined instruction trap is cheaper but not future-proof: we don't know
; exactly what the undefined instruction trap will do to any future
; extensions of the PSR.

          MRS     Rwp,CPSR              ;Using Rwp as a temporary
          MRS     Rtmp2,SPSR
          STMFD   Rsp!,{Rtmp2,Rwp}
          ASSERT  Rtmp2 < Rwp
; **KJB** - check it wasn't a Thumb undefined instruction
          TST     Rtmp2,#T_bit
          BNE     NotForUs1
        ]

        [ {CONFIG}=26
; In 26-bit code, we will reconstruct the entry value of the PSR from the
; stored value in LR by mimicking the effect of the undefined instruction
; trap. This is safe because there is no possibility of the 26-bit PSR being
; extended further.
        ]

; Get the instruction that caused the undefined instruction exception.

        [ {CONFIG}=32
          TST     Rtmp2,#Mode_mask-Mode_32not26 ;NB Rtmp2 contains SPSR_all
          SUB     Rtmp2,LR,#4           ;Point at bouncing instruction
        ]

        [ {CONFIG}=26
          TST     LR,#Mode_mask         ;Determine user vs. non-user mode
          SUB     Rtmp2,LR,#4           ;Point at bouncing instruction
          BIC     Rtmp2,Rtmp2,#PSR_mask
        ]

        LDREQT  Rins,[Rtmp2]            ;Get instruction, taking care about
        LDRNE   Rins,[Rtmp2]            ; user mode, and advance pointer

        [ {CONFIG}=26
          [ ARM2Safe
; We need to make certain this isn't a SWI that has entered the undefined
; instruction handler due to an ARM2 bug. If it is, we need to take remedial
; action.
            AND     Rtmp2,Rins,#&0F000000       ;Check for SWIs
            TEQ     Rtmp2,#&0F000000
            BEQ     ReallyAnARM2SWI
          ]
        ]

; Now Rins=instruction; Rfp and Rsp are correct; LR=link. Get the main
; workspace pointer.

        AdrWS   Rwp

; Check the coprocessor number and that this *is* a coprocessor instruction.

        TST     Rins,#NotUndef_bit      ;Genuinely undefined instructions
        BEQ     NotForUs                ; are not for us
        AND     Rtmp2,Rins,#Coproc_mask ;If OK, isolate coprocessor number
        CMP     Rtmp2,#Coproc_1
        BNE     FPASCMaybeCoproc2

        ]                       ;End of "UndefHandStandAlone" section

FPASCUndefHandler_Coproc1

        [ UndefHandBranchTable
          [ :DEF:AssumedHardware
FPUndefHandler1
          ]
          STMFD   Rsp!,{Rins,LR}
          AdrWS   Rwp
        ]

        [ MultipleContexts
          LDR     Rwp,CurrentContext
        ]

        CDebug1 1,"FPA: Coproc 1 instr",Rins

; OK - it's for us and it's a coprocessor 1 instruction. Next thing to do is
; read the control register and analyse the cause of the bounce. There's no
; problem about a recursive bounce, since RFC cannot bounce under any
; circumstances. Note also that the RFC won't execute until all arithmetic
; instructions are complete, so after it has finished, we know that all
; exceptions within the FPA have been fully resolved.
;   The relevant bits from the FPCR are DA, AB, SB and RE. Isn't it nice
; they're all together? :-)
;   We also get the FPSR at this stage - it's going to be wanted in almost
; all cases.

        [ CoreDebugging >= 5
          MOV     LR,Rsp
          CDebug2 5,"Stack/frame pointers are",LR,Rfp
        ]

        ASSERT  RE_pos = DA_pos+1
        ASSERT  AB_pos = DA_pos+2
        ASSERT  SB_pos = DA_pos+3
        RFC     Rtmp2
        AND     Rtmp,Rtmp2,#SB_bit+AB_bit+RE_bit+DA_bit
        RFS     Rfpsr
        BiShift ADD,PC,PC,Rtmp,LSR #DA_pos,LSL #2

        BranchTablePad

        B       veneer_corefaulty       ;AB=SB=0, so why an exception???
        B       veneer_corefaulty       ;AB=SB=0, so why an exception???
        B       veneer_corefaulty       ;AB=SB=0, so why an exception???
        B       veneer_corefaulty       ;AB=SB=0, so why an exception???
        B       FPASCPrepStage1         ;AB=1,RE=0, so Prepare stage exc.
        B       FPASCPendingExc         ;(DA,SB,AB)=(1,0,1), so pending exc.
        B       FPASCRoundStage1        ;AB=1,RE=1, so Round stage exc.
        B       FPASCPendingExc         ;(DA,SB,AB)=(1,0,1), so pending exc.
        B       FPASCSyncBounce         ;AB=0,SB=1, so synchronous bounce
        B       FPASCDisabled           ;(DA,SB,AB)=(1,1,0), so disabled
        B       FPASCSyncBounce         ;AB=0,SB=1, so synchronous bounce
        B       FPASCDisabled           ;(DA,SB,AB)=(1,1,0), so disabled
        B       FPASCPrepStage1         ;AB=1,RE=0, so Prepare stage exc.
        B       FPASCDisabledAndPE      ;(DA,SB,AB)=(1,1,1); disabled & p.e.
        B       FPASCRoundStage1        ;AB=1,RE=1, so Round stage exc.
        B       FPASCDisabledAndPE      ;(DA,SB,AB)=(1,1,1); disabled & p.e.

;===========================================================================

        LTORG

;===========================================================================

        [ UndefHandStandAlone

FPASCMaybeCoproc2

        CMP     Rtmp2,#Coproc_2
        BNE     NotForUs

        ]

FPASCUndefHandler_Coproc2

        [ UndefHandBranchTable
          [ :DEF:AssumedHardware
FPUndefHandler2
          ]
          STMFD   Rsp!,{Rins,LR}
          AdrWS   Rwp
        ]

        [ MultipleContexts
          LDR     Rwp,CurrentContext
        ]

        CDebug1 1,"FPA: Coproc 2 instr",Rins

; OK - it's for us and it's a coprocessor 2 instruction. Next thing to do is
; read the control register and analyse the cause of the bounce. There's no
; problem about a recursive bounce, since RFC cannot bounce under any
; circumstances. Note also that the RFC won't execute until all arithmetic
; instructions are complete, so after it has finished, we know that all
; exceptions within the FPA have been fully resolved.
;   The relevant bits from the FPCR are DA, AB, SB and RE. Isn't it nice
; they're all together? :-)
;   We also get the FPSR at this stage - it's going to be wanted in almost
; all cases.

        ASSERT  RE_pos = DA_pos+1
        ASSERT  AB_pos = DA_pos+2
        ASSERT  SB_pos = DA_pos+3
        RFC     Rtmp2
        AND     Rtmp,Rtmp2,#SB_bit+AB_bit+RE_bit+DA_bit
        RFS     Rfpsr
        BiShift ADD,PC,PC,Rtmp,LSR #DA_pos,LSL #2

        BranchTablePad

        B       veneer_corefaulty       ;AB=SB=0, so why an exception???
        B       veneer_corefaulty       ;AB=SB=0, so why an exception???
        B       veneer_corefaulty       ;AB=SB=0, so why an exception???
        B       veneer_corefaulty       ;AB=SB=0, so why an exception???
        B       FPASCPrepStage2         ;AB=1,RE=0, so Prepare stage exc.
        B       FPASCPendingExc         ;(DA,SB,AB)=(1,0,1), so pending exc.
        B       FPASCRoundStage2        ;AB=1,RE=1, so Round stage exc.
        B       FPASCPendingExc         ;(DA,SB,AB)=(1,0,1), so pending exc.
        B       NotForUs2               ;AB=0,SB=1, so synchronous bounce
        B       FPASCDisabled           ;(DA,SB,AB)=(1,1,0), so disabled
        B       NotForUs2               ;AB=0,SB=1, so synchronous bounce
        B       FPASCDisabled           ;(DA,SB,AB)=(1,1,0), so disabled
        B       FPASCPrepStage2         ;AB=1,RE=0, so Prepare stage exc.
        B       FPASCDisabledAndPE      ;(DA,SB,AB)=(1,1,1); disabled & p.e.
        B       FPASCRoundStage2        ;AB=1,RE=1, so Round stage exc.
        B       FPASCDisabledAndPE      ;(DA,SB,AB)=(1,1,1); disabled & p.e.

;===========================================================================

FPASCRoundStage2

; This is a Round stage exception - i.e. a potential overflow, underflow or
; inexact exception - and the instruction that actually bounced is a
; coprocessor 2 instruction.
;
; The following registers have their correct contents at this point:
;   Rsp, Rfp, Rins, Rwp, Rfpsr
; and Rtmp2 contains the FPCR value.
;
; This is treated just like FPASCRoundStage1 below, with one exception: if
; the FPCR information indicates that the bounce is caused by a FIX, we
; already know that this must be a spurious bounce, since the coprocessor 2
; instruction that actually bounced cannot be a FIX. So in these
; circumstances, we immediately retry the instruction that bounced, in order
; to make the problem go away.

        TST     Rtmp2,#RTnotDO_bit
        TSTNE   Rtmp2,#RT_SnotL_bit
        BEQ     FPASCRoundStage

FPASCSpuriousBounce

        LDR     Rtmp,[Rfp,#15*4]
        SUB     Rtmp,Rtmp,#4
        STR     Rtmp,[Rfp,#15*4]
        Return

FPASCRoundStage1

; This is a Round stage exception - i.e. a potential overflow, underflow or
; inexact exception - and the instruction that actually bounced is a
; coprocessor 1 instruction.
;
; The following registers have their correct contents at this point:
;   Rsp, Rfp, Rins, Rwp, Rfpsr
; and Rtmp2 contains the FPCR value.
;
; We need to split out FIXes, since Round stage bounces in FIXes should be
; synchronous and so need to be treated specially. We can do this by testing
; for a store-type CPRT: all store-type CPRTs other than FIXes should not be
; capable of generating a Round stage exception, either because they are
; Load/Store-only operations and so don't generate arithmetic bounces (RFC
; and RFS), or because they are compares (which only generate Prepare stage
; arithmetic bounces), or because they are undefined (CPRTs with opcode
; 0111).

        TST     Rtmp2,#RTnotDO_bit
        TSTNE   Rtmp2,#RT_SnotL_bit
        BNE     FPASCFixCompareBounce

FPASCRoundStage

; We now know that information about the instruction we're working on is in
; the FPCR, and that we don't need to know anything about the instruction
; that actually bounced. So transfer the information and make a register
; available! In the process, set bit 25 in the instruction information to
; ensure that trap handlers will see the instruction as being a CPDO or
; CPRT: the FPCR doesn't actually keep that bit around, since it is always 1
; for instructions which can produce an arithmetic bounce.
;   Also, modify the return address in the stack frame unless the SO bit is
; set in the FPSR; we are allowed to re-enable interrupts once we've done
; this.
;   We will adjust the return address by subtracting 4 in both 26-bit and
; 32-bit code: this is strictly incorrect for 26-bit code, but I don't
; believe we really care what happens to a floating point instruction at
; location 3FFFFFC, since the next thing to be executed will be the hardware
; reset vector)!

        ORR     Rins,Rtmp2,#RTDOnotDT_bit

        CDebug1 2,"Round bounce, info",Rins

        TST     Rfpsr,#SO_bit
        LDREQ   Rtmp,[Rfp,#15*4]
        SUBEQ   Rtmp,Rtmp,#4
        STREQ   Rtmp,[Rfp,#15*4]

        InterruptEnable Rtmp

; Now we need to read the destination register of the instruction.

        GetDst  FPASC,OP1regs,Rins,Rtmp

; Split into sign/uncommon and exponent fields (note that the uncommon bit
; and the reserved field are guaranteed to be 0).

        BIC     RNDexp,OP1sue,#(Sign_bit + Uncommon_bit)
        ASSERT  EIExp_pos = 0
        AND     OP1sue,OP1sue,#(Sign_bit + Uncommon_bit)

; Now adjust exponent for Exponent Overflow bit. If this gives an exponent
; above halfway point through overflow range, adjust it to a negative value.
; So after adjoining the EO bit, we compare with 1.5 times maximum normal
; exponent and subtract 2.0 times maximum normal exponent if greater than or
; equal.

        AND     Rtmp,Rins,#EO_bit       ;Remember Rins is really FPCR
        BiShift ORR,RNDexp,RNDexp,Rtmp,LSR #EO_pos,LSL #(EIExp_pos+EIExp_len)
        CMP     RNDexp,#3:SHL:(EIExp_pos+EIExp_len-1)
        SUBHS   RNDexp,RNDexp,#2:SHL:(EIExp_pos+EIExp_len)

; Extract the precision and rounding mode from the instruction data, plus
; the direction the result has already been rounded.

        AND     RNDprm,Rins,#(RM_mask+Pr2_mask)
        AND     Rtmp,Rins,#Pr1_mask
        BiShift ORR,RNDprm,RNDprm,Rtmp,LSR #Pr1_pos,LSL #(RM_pos+3)
        ASSERT  ((RM_mask+Pr2_mask):SHR:RM_pos) + (Pr1_mask:SHR:(Pr1_pos-3)) = &F
        ASSERT  (RM_pos+4) <= 32
        AND     RNDdir,Rins,#IE_bit     ;Zero if exact, positive if inexact
                                        ; (remember Rins is FPCR)
        ASSERT  IE_bit < TopBit
        TST     Rins,#RU_bit            ;Remember Rins is FPCR
        RSBEQ   RNDdir,RNDdir,#0        ;Now 0 if exact, pos. if up, neg. if down

        CDebug3 3,"Rounded (from chip):",OP1sue,OP1mhi,OP1mlo
        CDebug2 3," exp/rnddir:",RNDexp,RNDdir

        B       FPASCRoundedResult

;===========================================================================

; Table of minimum and maximum exponents for each precision and rounding
; mode combination.

FPASCExpLimits
        DCD     SMin_Exp,SMax_Exp       ;Single, Nearest
        DCD     SMin_Exp,SMax_Exp       ;Single, Plus infinity
        DCD     SMin_Exp,SMax_Exp       ;Single, Minus infinity
        DCD     SMin_Exp,SMax_Exp       ;Single, Zero
        DCD     DMin_Exp,DMax_Exp       ;Double, Nearest
        DCD     DMin_Exp,DMax_Exp       ;Double, Plus infinity
        DCD     DMin_Exp,DMax_Exp       ;Double, Minus infinity
        DCD     DMin_Exp,DMax_Exp       ;Double, Zero
        DCD     EMin_Exp,EMax_Exp       ;Extended, Nearest
        DCD     EMin_Exp,EMax_Exp       ;Extended, Plus infinity
        DCD     EMin_Exp,EMax_Exp       ;Extended, Minus infinity
        DCD     EMin_Exp,EMax_Exp       ;Extended, Zero
; Next 8 words are in theory in the table, for packed precision, but are
; never used (assuming the hardware and software work correctly).

;===========================================================================

; The following code is placed rather oddly: the reason is to do with
; addressability of the shared tables.

FPASC_CPDO_Continue

        CDebug3 3,"Raw result:",OP1sue,OP1mhi,OP1mlo

; We've returned from the subroutine, which means that this is a defined and
; implemented instruction. If the value we've received back has its uncommon
; bit set, it's the correct result. If it doesn't, we need to round it and
; look for rounding exceptions.

        TST     OP1sue,#Uncommon_bit
        BNE     FPASCFullResult

; Extract the precision and rounding mode from the instruction data.

        CDebug2 3," exp/grs:",RNDexp,Rarith

        AND     RNDprm,Rins,#(RM_mask+Pr2_mask)
        AND     Rtmp,Rins,#Pr1_mask
        BiShift ORR,RNDprm,RNDprm,Rtmp,LSR #Pr1_pos,LSL #(RM_pos+3)
        ASSERT  ((RM_mask+Pr2_mask):SHR:RM_pos) + (Pr1_mask:SHR:(Pr1_pos-3)) = &F
        ASSERT  (RM_pos+4) <= 32

; Round the result.

        MOV     RNDdir,#0               ;Result has not been rounded so far
        BL      RoundNum

        CDebug3 3,"Rounded:",OP1sue,OP1mhi,OP1mlo
        CDebug2 3," exp/rnddir:",RNDexp,RNDdir

FPASCRoundedResult

; Check exponent against maximum and minimum allowed exponents for this
; precision, putting lower limit in Rtmp, upper limit in Rtmp2.

        ADR     Rtmp,FPASCExpLimits
        BiShift ADD,Rtmp,Rtmp,RNDprm,LSR #RM_pos,LSL #3
        LDMIA   Rtmp,{Rtmp,Rtmp2}
        ASSERT  Rtmp < Rtmp2
        CMP     RNDexp,Rtmp2                            ;Check for overflow
        CMPLE   Rtmp,RNDexp                             ; or underflow
        BGT     FPASCExpOutOfRange
        ORR     OP1sue,OP1sue,RNDexp,LSL #EIExp_pos     ;Recombine exponent
                                                        ; with sign/uncommon

FPASCCheckInexact

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
        ASSERT  SysID_pos > IXE_pos
        ORRCC   Rfpsr,Rfpsr,#IXC_bit
        BLHI    InexactTrapForSDE ;Works because HI = CS/NE

FPASCFullResult

        CDebug3 3,"Result =",OP1sue,OP1mhi,OP1mlo

; Now we can put the result back into the FPA.

        PutDst  FPASC,OP1regs,Rins,Rtmp

FPASCWriteFPSRAndReturn

; Write the possibly updated FPSR back, then return.

        WFS     Rfpsr
        FPInstrDone
        Return

FPASCExpOutOfRange

; We've got overflow or underflow. Call the appropriate routine, returning
; to FPASCCheckInexact.

        ADR     R14,FPASCCheckInexact
        SUBS    Rtmp,Rtmp,RNDexp
        BGT     UnderflowForReg
        B       Overflow

;===========================================================================

        LTORG

;===========================================================================

; The following routines are used by the PutDst and PutFDst macros. They
; transfer the internal precision number on the stack to registers F0, F1,
; F2, F3, F4, F5, F6 and F7 respectively. Note that they are called via a
; calculated branch-and-link: it is important that their entry addresses
; occur every 8 bytes.

FPASC_PutDstRoutines

        LFMFD   F0,1,[Rsp]!
        MOV     PC,LR

        LFMFD   F1,1,[Rsp]!
        MOV     PC,LR

        LFMFD   F2,1,[Rsp]!
        MOV     PC,LR

        LFMFD   F3,1,[Rsp]!
        MOV     PC,LR

        LFMFD   F4,1,[Rsp]!
        MOV     PC,LR

        LFMFD   F5,1,[Rsp]!
        MOV     PC,LR

        LFMFD   F6,1,[Rsp]!
        MOV     PC,LR

        LFMFD   F7,1,[Rsp]!
        MOV     PC,LR

;===========================================================================

FPASCFltBounce

; This is a bounce caused by a FLT instruction. We need to pick up the
; integer register concerned: this involves a split into picking it up from
; the stack and changing mode to pick it up. (The usual third option of
; reconstructing it from the return address isn't needed: FLT Fn,PC is no
; longer an architecturally defined instruction.)
;
; Get the register number and split according to it.

        AND     Rregno,Rins,#RT_ARMreg_mask
        CMP     Rregno,#R13:SHL:RT_ARMreg_pos
        BHS     FPASCFltBounce_R13to15

FPASCFltBounce_Stack

; Pick up the correct register value from the stack.

        BiShift LDR,Rarith,Rfp,Rregno,LSR #RT_ARMreg_pos,LSL #2

FPASCFltBounce_Common

; The value to be FLTed is now in Rarith. Call the FLT subroutine to convert
; it to pre-rounding form.

        BL      FltSC

; Annoyingly, FLT has a different destination register field to most
; instructions with an arithmetic result, so we cannot share code...
;   Extract the precision and rounding mode from the instruction data.

        CDebug2 3," exp/grs:",RNDexp,Rarith

        AND     RNDprm,Rins,#(RM_mask+Pr2_mask)
        AND     Rtmp,Rins,#Pr1_mask
        BiShift ORR,RNDprm,RNDprm,Rtmp,LSR #Pr1_pos,LSL #(RM_pos+3)
        ASSERT  ((RM_mask+Pr2_mask):SHR:RM_pos) + (Pr1_mask:SHR:(Pr1_pos-3)) = &F
        ASSERT  (RM_pos+4) <= 32

; Round the result.

        MOV     RNDdir,#0               ;Result has not been rounded so far
        BL      RoundNum

        CDebug3 3,"Rounded:",OP1sue,OP1mhi,OP1mlo
        CDebug2 3," exp/rnddir:",RNDexp,RNDdir

; Now we can recombine the exponent with the sign and uncommon bits.

        ORR     OP1sue,OP1sue,RNDexp,LSL #EIExp_pos

; No need to check exponent for being out of range.
;   If the result is exact, we don't want to do anything about the inexact
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
        ASSERT  SysID_pos > IXE_pos
        ORRCC   Rfpsr,Rfpsr,#IXC_bit
        BLHI    InexactTrapForSDE ;Works because HI = CS/NE

        CDebug3 3,"Result:",OP1sue,OP1mhi,OP1mlo

; Now we can put the result back into the FPA.

        PutFDst  FPASC,OP1regs,Rins,Rtmp

; Write the possibly updated FPSR back, then return.

        B       FPASCWriteFPSRAndReturn

FPASCFltBounce_R13to15

; We can assume that the operand is in fact R13 or R14: MCR instructions
; with R15 as an operand are no longer architecturally defined. Before this
; was the case, the following code appeared here:
;
;         CMP     Rregno,#R15:SHL:RT_ARMreg_pos
;         BEQ     FPASCFltBounce_R15

; If caller was in user mode, we get the address from the stack. Otherwise,
; we will have to change mode, get the register required and change mode
; back.

        GetMode Rtmp
        BEQ     FPASCFltBounce_Stack

        [ {CONFIG}=32
          ORR     Rtmp,Rtmp,#Mode_32not26+I_bit ;Make 32-bit version of mode
          MRS     Rtmp2,CPSR                    ; and ensure interrupts become
          BIC     Rarith,Rtmp2,#Mode_mask       ; disabled temporarily
          ORR     Rtmp,Rarith,Rtmp
          MSR     CPSR_c,Rtmp                   ;Change to mode just calculated
          CMP     Rregno,#R13:SHL:RT_ARMreg_pos ;EQ if R13, NE if R14
          MOVEQ   Rarith,R13
          MOVNE   Rarith,R14
          MSR     CPSR_c,Rtmp2                  ;Change back to original mode
        ]                                       ; and interrupt status

        [ {CONFIG}=26
          ORR     Rtmp,Rtmp,#I_bit              ;Ensure that interrupts become
          MOV     Rtmp2,PC                      ; disabled temporarily
          AND     Rarith,Rtmp2,#PSR_mask:AND:(:NOT:Mode_mask)
          ORR     Rtmp,Rarith,Rtmp
          TEQP    PC,Rtmp                       ;Change to caller's mode
          CMP     Rregno,#R13:SHL:RT_ARMreg_pos ;EQ if R13, NE if R14
          MOVEQ   Rarith,R13
          MOVNE   Rarith,R14
          TEQP    PC,Rtmp2                      ;Change back to original mode
        ]                                       ; and interrupt status

        B       FPASCFltBounce_Common

; The following is the original code for implementing FLT Fn,PC. This
; instruction is no longer architurally defined and so the code has been
; commented out.
;
; FPASCFltBounce_R15
;
; ; Get the instruction address plus 12. Note that we *don't* clear the PSR
; ; bits in 26-bit code, but do protect them from having a carry propagate
; ; into them.
;
;         LDR     Rarith,[Rfp,#15*4]              ;Get (instr. address)+4
;
;         [ {CONFIG}=26
;           MOV     Rarith,Rarith,ROR #26         ;Put it at top of word
;           ADD     Rarith,Rarith,#8:SHL:6        ;Now (instr. address)+12
;           MOV     Rarith,Rarith,ROR #6          ;Put back in normal place
;         ]
;
;         [ {CONFIG}=32
;           ADD     Rarith,Rarith,#8              ;Now (instr. address)+12
;         ]
;
;         B       FPASCFltBounce_Common

;===========================================================================

FPASCSyncBounce_RTorDO

        [ CoreDebugging >= 5
          MOV     LR,Rsp
          CDebug2 5,"Stack/frame pointers are",LR,Rfp
        ]

; If the precision field indicates "packed", this instruction needs to be
; passed on to other handlers.

        TST     Rins,#Pr1_mask
        TSTNE   Rins,#Pr2_mask
        BNE     NotForUs1

; Split according to whether this is a CPDO or a CPRT.

        TST     Rins,#RTnotDO_bit
        BEQ     FPASC_CPDO

; It's a CPRT. Split according to which instruction it is.

        AND     Rtmp,Rins,#Op1_mask
        BiShift ADD,PC,PC,Rtmp,LSR #Op1_pos,LSL #2

        BranchTablePad

        B       FPASCFltBounce          ;FLT
        B       FPASCFixBounce          ;FIX
        B       NotForUs1               ;WFS (should not bounce)
        B       NotForUs1               ;RFS (should not bounce)
        B       NotForUs1               ;WFC (pass bounces in user modes on)
        B       NotForUs1               ;RFC (pass bounces in user modes on)
        B       NotForUs1               ;Undefined
        B       NotForUs1               ;Undefined
        B       NotForUs1               ;Undefined
        B       FPASCCompareBounce      ;CMF
        B       NotForUs1               ;Undefined
        B       FPASCCompareBounce      ;CNF
        B       NotForUs1               ;Undefined
        B       FPASCCompareBounce      ;CMFE
        B       NotForUs1               ;Undefined
        B       FPASCCompareBounce      ;CNFE

;===========================================================================

; The following table contains the constants, at 4 word boundaries for easy
; indexing.

FPASCConstTable
                DCD     &00000000,&00000000,&00000000,0
                DCD     &00003FFF,&80000000,&00000000,0
                DCD     &00004000,&80000000,&00000000,0
                DCD     &00004000,&C0000000,&00000000,0
                DCD     &00004001,&80000000,&00000000,0
                DCD     &00004001,&A0000000,&00000000,0
                DCD     &00003FFE,&80000000,&00000000,0
                DCD     &00004002,&A0000000,&00000000,0

;===========================================================================

FPASCPendingExc

; There is a pending exception whose FPCR value has previously been stored
; away in 'DisableInfo'. We simply have to pick this information up and use
; it in place of the real FPCR, which is currently in Rtmp2.
;   Note that we know that this information has to relate to an asynchronous
; exception, so there is no point in giving it the full branch table
; treatment. Note also that if this information relates to a pending
; exception from a FIX or compare, it has to be a spurious bounce. So we
; branch to FPASCPrepStage2 or FPASCRoundStage2 according to the setting of
; the RE bit.

        LDR     Rtmp2,DisableInfo
        TST     Rtmp2,#RE_bit
        BNE     FPASCRoundStage2

; Fall through to FPASCPrepStage2...

;===========================================================================

FPASCPrepStage2

; This is a Prepare stage exception - i.e. a potential invalid operation or
; divide-by-zero exception - and the instruction that actually bounced is a
; coprocessor 2 instruction.
;
; The following registers have their correct contents at this point:
;   Rsp, Rfp, Rins, Rwp, Rfpsr
; and Rtmp2 contains the FPCR value.
;
; This is treated just like FPASCPrepStage1 below, with one exception: if
; the FPCR information indicates that the bounce is caused by a FIX or
; compare, we already know that this must be a spurious bounce, since the
; coprocessor 2 instruction that actually bounced cannot be a FIX or
; compare. So in these circumstances, we immediately retry the instruction
; that bounced, in order to make the problem go away.

        TST     Rtmp2,#RTnotDO_bit
        TSTNE   Rtmp2,#RT_SnotL_bit
        BEQ     FPASCPrepStage
        B       FPASCSpuriousBounce

FPASCPrepStage1

; This is a Prepare stage exception - i.e. a potential invalid operation or
; divide-by-zero exception - and the instruction that actually bounced is a
; coprocessor 1 instruction.
;
; The following registers have their correct contents at this point:
;   Rsp, Rfp, Rins, Rwp, Rfpsr
; and Rtmp2 contains the FPCR value.
;
; We need to split out FIXes and compares, since Prepare stage bounces in
; FIXes and compares should be synchronous and so need to be treated
; specially. We can do this by testing for a store-type CPRT: all store-type
; CPRTs other than FIXes and compares should not be capable of generating a
; Prepare stage exception, either because they are Load/Store-only
; operations and so don't generate arithmetic bounces (RFC and RFS), or
; because they are undefined (CPRTs with opcode 0111).

        TST     Rtmp2,#RTnotDO_bit
        TSTNE   Rtmp2,#RT_SnotL_bit
        BNE     FPASCFixCompareBounce

FPASCPrepStage

; We now know that information about the instruction we're working on is in
; the FPCR, and that we don't need to know anything about the instruction
; that actually bounced. So transfer the information and make a register
; available! In the process, set bit 25 in the instruction information to
; ensure that trap handlers will see the instruction as being a CPDO or
; CPRT: the FPCR doesn't actually keep that bit around, since it is always 1
; for instructions which can produce an arithmetic bounce.
;   In fact, we know that the instruction must be a CPDO if we get here:
; FIXes and compares are dealt with separately above and other CPRTs don't
; produce Prepare stage arithmetic bounces.
;   Also, modify the return address in the stack frame unless the SO bit is
; set in the FPSR; we are allowed to re-enable interrupts once we've done
; this.
;   We will adjust the return address by subtracting 4 in both 26-bit and
; 32-bit code: this is strictly incorrect for 26-bit code, but I don't
; believe we really care what happens to a floating point instruction at
; location 3FFFFFC, since the next thing to be executed will be the hardware
; reset vector)!

        ORR     Rins,Rtmp2,#RTDOnotDT_bit

        CDebug1 2,"Prepare bounce, info",Rins

        TST     Rfpsr,#SO_bit
        LDREQ   Rtmp,[Rfp,#15*4]
        SUBEQ   Rtmp,Rtmp,#4
        STREQ   Rtmp,[Rfp,#15*4]

        InterruptEnable Rtmp

FPASC_CPDO

; Note that the "synchronous bounce" code above branches in here to deal
; with CPDOs, with Rins containing the real instruction that bounced rather
; than the FPCR. The identical layout of important fields in the two makes
; this possible.

; Get the operand(s): this depends on whether this is a monadic or dyadic
; operation. The branch structure here is optimised for dyadic operations,
; since they are much more important in practice.

        TST     Rins,#DO_monad_bit
        BNE     FPASC_CPDO_Monadic

FPASC_CPDO_Dyadic

; We need to get the two operands.

        GetS12  FPASC,OP1regs,OP2regs,Rins,Rtmp,Rtmp2

        [ CoreDebugging >= 5
          MOV     LR,Rsp
          CDebug2 5,"Stack/frame pointers are",LR,Rfp
        ]

; Now we need to do a table-driven sort-of-subroutine call, based on the
; opcode. Note that for as-yet-unimplemented instructions and as-yet-
; undefined instructions, this "subroutine" doesn't return. Also note that
; if it does return, it returns to FPASC_CPDO_Continue above.

        [ CoreDebugging = 0
          ADR     LR,FPASC_CPDO_Continue
        |
          ADRL    LR,FPASC_CPDO_Continue
        ]
        AND     Rtmp,Rins,#Op1_mask
        BiShift ADD,PC,PC,Rtmp,LSR #Op1_pos,LSL #2

        BranchTablePad

        B       AddSubSC        ;ADF
        B       MultSC          ;MUF
        B       AddSubSC        ;SUF
        B       AddSubSC        ;RSF
        B       DivSC           ;DVF
        B       DivSC           ;RDF
        [ NoTranscendentals
          B       NotForUs1     ;POW is undefined
          B       NotForUs1     ;RPW is undefined
        |
          B       PowSC         ;POW
          B       PowSC         ;RPW
        ]
        B       RemSC           ;RMF
        B       MultSC          ;FML
        B       DivSC           ;FDV
        B       DivSC           ;FRD
        [ NoTranscendentals
          B       NotForUs1     ;POL is undefined
        |
          B       PolSC         ;POL
        ]
        B       NotForUs1       ;Undefined
        B       NotForUs1       ;Undefined
        B       NotForUs1       ;Undefined

; Note that execution will resume at the label FPASC_CPDO_Continue after the
; "subroutine call" above, assuming it returns at all.

FPASC_CPDO_Monadic

; We need to get the operand.

        GetS2   FPASC,OP1regs,Rins,Rtmp,Rtmp2

        [ CoreDebugging >= 5
          MOV     LR,Rsp
          CDebug2 5,"Stack/frame pointers are",LR,Rfp
        ]

; Now we need to do a table-driven sort-of-subroutine call, based on the
; opcode. Note that for as-yet-unimplemented instructions and as-yet-
; undefined instructions, this "subroutine" doesn't return. Also note that
; if it does return, it returns to FPASC_CPDO_Continue above.

        [ CoreDebugging = 0
          ADR     LR,FPASC_CPDO_Continue
        |
          ADRL    LR,FPASC_CPDO_Continue
        ]
        AND     Rtmp,Rins,#Op1_mask
        BiShift ADD,PC,PC,Rtmp,LSR #Op1_pos,LSL #2

        BranchTablePad

        B       MoveSC                  ;MVF
        B       MoveSC                  ;MNF
        B       MoveSC                  ;ABS
        B       RndSC                   ;RND
        B       SqrtSC                  ;SQT
        [ NoTranscendentals
          B       NotForUs1             ;LOG is undefined
          B       NotForUs1             ;LGN is undefined
          B       NotForUs1             ;EXP is undefined
          B       NotForUs1             ;SIN is undefined
          B       NotForUs1             ;COS is undefined
          B       NotForUs1             ;TAN is undefined
          B       NotForUs1             ;ASN is undefined
          B       NotForUs1             ;ACS is undefined
          B       NotForUs1             ;ATN is undefined
        |
          B       LgnLogSC              ;LOG
          B       LgnLogSC              ;LGN
          B       ExpSC                 ;EXP
          B       SinCosSC              ;SIN
          B       SinCosSC              ;COS
          B       TanSC                 ;TAN
          B       AsnAcsSC              ;ASN
          B       AsnAcsSC              ;ACS
          B       AtnSC                 ;ATN
        ]
        B       UrdSC                  ;URD
        B       NormSC                 ;NRM

; Note that execution will resume at the label FPASC_CPDO_Continue after the
; "subroutine call" above, assuming it returns at all.

;===========================================================================

FPASCFixCompareBounce

; We've had an arithmetic exception in a FIX or compare instruction. We
; don't try to distinguish Round stage from Prepare stage bounces here -
; indeed, we have merged the two code lines. This is because we cannot
; access F8 and so cannot do any better on a Round Stage bounce than we can
; on a Prepare stage one: we simply have to emulate the instruction either
; way.
;
; The following registers have their correct contents at this point:
;   Rsp, Rfp, Rwp, Rins, Rfpsr
; and Rtmp2 contains the FPCR value.
;
; First thing to do is determine whether it is a spurious bounce (caused by
; a subsequently cancelled instruction) and should be ignored. This is
; determined by seeing whether the FPCR reports essentially the same
; information as the instruction that bounced: if it doesn't, we know the
; bounce was spurious; if it does, there is a good chance that the bounce is
; a good one. Testing this match is complicated by the fact that the main
; instruction decoder within the FPA has mangled a few of the instruction
; bits!
;   We can actually get to this point in the code if (a) the instruction has
; generated an arithmetic bounce - which implies it is a CPRT or CPDO; (b)
; the instruction is a coprocessor 1 instruction; (c) the RTnotDO_bit in the
; FPCR is set - which implies it is a CPRT; (d) the RT_SnotL_bit in the FPCR
; is set - which implies it is a store-type CPRT. Under these circumstances,
; the FPPipe instruction decoder has:
;   Left bits 23:16,7:0 unchanged;
;   Put bit 15 into an undefined state;
;   Replaced bits 14:12 by bits 18:16.
; These bits were then transmitted to the FPCR unchanged, so the match we
; actually need between the FPCR and the real instruction is:
;   Source 2 field (bits 3:0) identical;
;   Opcode (bits 23:20,15,4) identical apart from bit 15;
;   Rounding mode (bits 6:5) identical;
;   Precision (bits 19,7) identical;
;   Source 1 field (bits 18:16) identical;

        EOR     Rtmp,Rins,Rtmp2
        LDR     Rtmp2,=OpRT_mask+S1_mask+S2_mask+Pr_mask+RM_mask
        TST     Rtmp,Rtmp2
        BNE     FPASCSpuriousBounce

; OK - it's probably real. Even if the bounce was in fact spurious, we know
; that the instruction that bounced is in fact a FIX or compare. So at this
; point, we can safely emulate the instruction, provided we use the
; information in Rins and not that in Rtmp2 (= the FPCR).
;   We already know that the instruction is a store-type CPRT, which
; restricts us to just eight opcodes (some of which cannot occur). This
; could be done by a branch table, but the whole thing is really too simple
; - ones with the top opcode bit set are compares, ones with it clear are
; FIXes or instructions that don't produce arithmetic bounces (RFS, RFC or
; CPRT 0111).
;   We can enable interrupts at this point, since we know the return address
; is correct.

        InterruptEnable Rtmp

        TST     Rins,#1:SHL:(Op1_pos+3)
        ASSERT  Op1_mask:SHR:Op1_pos=&F ;Make certain we've used the top bit
        BEQ     FPASCFixBounce

FPASCCompareBounce

; This is a bounce caused by a compare instruction: we need to emulate the
; instruction. First, we need to get the two operands and do the compare.

        GetS12  FPASC,OP1regs,OP2regs,Rins,Rtmp,Rtmp2
        BL      CompareSC

; We need to write the integer result back to the destination register. The
; rules for doing this are described under 'FPASCFixBounce' below. 
;
; Also note that we optimise this code for a destination register of R15,
; since this is by far the most common case for compare instructions (in
; fact, it's the only officially allowed case).

        AND     Rregno,Rins,#RT_ARMreg_mask
        TEQ     Rregno,#R15:SHL:RT_ARMreg_pos
        BNE     FPASCIntegerRes

FPASCIntegerRes_R15

; This result is for R15, so we change the stored flags.

        [ {CONFIG}=32
          LDR     Rtmp,[Rfp,#-8]
        ]
        [ {CONFIG}=26
          LDR     Rtmp,[Rfp,#15*4]
        ]
        BIC     Rtmp,Rtmp,#Flags_mask
        AND     Rarith,Rarith,#Flags_mask
        ORR     Rtmp,Rtmp,Rarith
        [ {CONFIG}=32
          STR     Rtmp,[Rfp,#-8]
        ]
        [ {CONFIG}=26
          STR     Rtmp,[Rfp,#15*4]
        ]

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCFixBounce

; This is a bounce caused by a FIX instruction. Get the operand and do the
; FIX.

        GetS2   FPASC,OP1regs,Rins,Rtmp,Rtmp2
        BL      FixSC

; The integer result of this operation needs to be written back to the
; destination register. This is a somewhat tricky business:
;
; * If the destination register is R15, we need to ensure that the flags are
;   written back to the ARM. This involves modifying the stacked SPSR for
;   32-bit handlers and the stacked PC+PSR for 26-bit handlers;
;
; * If the destination register is R13 or R14, we need to change the stacked
;   value of the destination register if we were called from User mode;
;   otherwise, we need to change to the caller's mode, modify the register
;   and change back to our current mode.
;
; * Otherwise, we need to change the stacked value of the destination
;   register.
;
; Note this doesn't work for R8-R12 in FIQ mode, or for R13 and R14 in the
; handler's own mode (i.e. Supervisor26 or Undefined32). However, the FPA
; system is not required to deal with these cases correctly.
;
; Note also that we optimise *this* code for a destination register which is
; not R15, since a destination register of R15 for a FIX instruction should
; be very rare indeed!

        AND     Rregno,Rins,#RT_ARMreg_mask

FPASCIntegerRes

        CMP     Rregno,#R13:SHL:RT_ARMreg_pos
        BHS     FPASCIntegerRes_R13to15

FPASCIntegerRes_Stack

; This result simply needs to be written to the stack.

        BiShift STR,Rarith,Rfp,Rregno,LSR #RT_ARMreg_pos,LSL #2

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCIntegerRes_R13to15

        TEQ     Rregno,#R15:SHL:RT_ARMreg_pos
        BEQ     FPASCIntegerRes_R15

; This result is for R13 or R14. If the caller was in a User mode or System
; mode, we write the result to the stack; otherwise, we need to change modes
; to write the result back to the right register.

        GetMode Rtmp
        [ {CONFIG}=32
          TEQNE   Rtmp,#Mode_SYS32
        ]
        BEQ     FPASCIntegerRes_Stack

; We need to change mode, put the result in the correct register and change
; mode back. Note that if this is a 32-bit handler, we always change mode to
; the 32-bit version of the caller's mode, regardless of whether the caller
; was actually in a 32-bit or 26-bit mode: this keeps the code sane!

        [ {CONFIG}=32
          ORR     Rtmp,Rtmp,#Mode_32not26+I_bit ;Make 32-bit version of mode
          MRS     Rtmp2,CPSR                    ; and ensure interrupts become
          BIC     Rregval,Rtmp2,#Mode_mask      ; disabled temporarily
          ORR     Rtmp,Rregval,Rtmp
          MSR     CPSR_c,Rtmp                   ;Change to mode just calculated
          CMP     Rregno,#R13:SHL:RT_ARMreg_pos ;EQ if R13, NE if R14
          MOVEQ   R13,Rarith
          MOVNE   R14,Rarith
          MSR     CPSR_c,Rtmp2                  ;Change back to original mode
        ]                                       ; and interrupt status

        [ {CONFIG}=26
          ORR     Rtmp,Rtmp,#I_bit              ;Ensure that interrupts become
          MOV     Rtmp2,PC                      ; disabled temporarily
          AND     Rregval,Rtmp2,#PSR_mask:AND:(:NOT:Mode_mask)
          ORR     Rtmp,Rregval,Rtmp
          TEQP    PC,Rtmp                       ;Change to caller's mode
          CMP     Rregno,#R13:SHL:RT_ARMreg_pos ;EQ if R13, NE if R14
          MOVEQ   R13,Rarith
          MOVNE   R14,Rarith
          TEQP    PC,Rtmp2                      ;Change back to original mode
        ]                                       ; and interrupt status

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

;===========================================================================

                LTORG

;===========================================================================

FPASCSyncBounce

; This is a synchronous bounce - i.e. an unimplemented instruction, an STF
; exception, FLTS with the inexact trap enabled, or an arithmetic bounce in
; Synchronous Operation mode. Note that coprocessor 2 CPDOs and CPRTs are
; passed on to the next handler by an immediate call to "NotForUs2", and
; that coprocessor 2 CPDTs (i.e. LFMs and SFMs) don't cause synchronous
; bounces. So we know the instruction must be a coprocessor 1 instruction.
;
; The following registers have their correct contents at this point:
;   Rsp, Rfp, Rins, Rwp, Rfpsr
; and Rtmp2 contains the FPCR value. In fact, we're no longer interested in
; the FPCR value, since we've extracted the information that this is a
; synchronous bounce and thus that the information about the bouncing
; instruction in the FPCR is irrelevant.
;
; We know that the return address is correct, so we can enable interrupts.

        InterruptEnable Rtmp

; Now we simply have to emulate the instruction that has been bounced. The
; first step is to split according to the type of the instruction. We do at
; least know that it is an FP instruction.

        [ CoreDebugging >= 5
          MOV     LR,Rsp
          CDebug2 5,"Stack/frame pointers are",LR,Rfp
        ]

        TST     Rins,#RTDOnotDT_bit
        BNE     FPASCSyncBounce_RTorDO

; It's a CPDT - i.e. an LDF, STF, LFM or SFM. Note that of these, only LDFP
; and STFx should be capable of causing a synchronous bounce, so we know it
; isn't LFM, SFM, LDFS, LDFD or LDFE. So we work out the precision of the
; instruction (in the usual "precision and rounding mode" form, using a
; rounding mode of "to nearest") and branch out if it's packed.

        AND     RNDprm,Rins,#DT_pr1_mask
        BiShift MOV,RNDprm,,RNDprm,LSR #DT_pr1_pos,LSL #RM_pos+3
        AND     Rtmp,Rins,#DT_pr2_mask
        BiShift ORR,RNDprm,RNDprm,Rtmp,LSR #DT_pr2_pos,LSL #RM_pos+2
        ASSERT  RM_Nearest = 0

        CMP     RNDprm,#3:SHL:(RM_pos+2)        ;Check for packed precision
        [       NoPacked
          BEQ     NotForUs1
        |
          BEQ     FPASCSyncBounce_LDFPorSTFP
        ]

; It must be STFS, STFD or STFE, with RNDprm holding the correct rounding
; mode. Next thing to do is to pick up the correct register contents.

        GetDst  FPASC,OP1regs,Rins,Rtmp
        ASSERT  DT_dst_mask = Ds_mask

; Now convert the value to the correct word(s) to be stored to memory.

        BL      STFConvertSC

; We've now got the correct words to store in OP1sue, OP1mhi and OP1mlo,
; with OP1mhi only being used, or indeed valid, if the destination precision
; is double or extended, and OP1mlo only being used or valid if the
; destination precision is extended. We've now got to work out the address
; at which to store them, do the store and do writeback if necessary. To do
; this, we need to split into three cases:
;
; * Register is R0-R14 in user modes, or R0-R12 in non-user modes: in this
;   case, we simply use the register values we stored away on the stack on
;   entry to the undefined instruction handler. (Note that we make no
;   attempt to handle FIQ modes, so we don't need to worry about registers
;   R8-R12 being banked.)
;
; * Register is R13 or R14 in non-user modes: in this case, we use the value
;   obtained by changing to the mode concerned, picking up the appropriate
;   register and changing back. (If called from the appropriate one of
;   Supervisor26 and Undefined32, this will produce inappropriate results -
;   however, this is another thing we don't even try to get right.)
;
;   As a special case, use of R13 or R14 in System mode will be treated like
;   use of R0-R12 in System mode, since it is important that writeback
;   should occur to the "live" copy of the user mode registers on the stack
;   rather than the "dead" copy in the registers themselves.
;
; * Register is R15 in any mode: in this case, we need to use the address of
;   the instruction that bounced plus 8, and we don't do writeback even if
;   it is specified in the instruction.
;
; First split according to user/non-user mode. (This is done because not
; merely the decision as to how to access the register depends on this, but
; also what type of store instruction we use to access memory.)

        AND     Rregno,Rins,#DT_ARMreg_mask     ;Isolate register number

        GetMode Rtmp                            ;Split according to user or
        BNE     FPASCSyncBounce_STF_NonUser     ; non-user mode

FPASCSyncBounce_STF_User

; Split according to whether the address register is R0-R14 or R15.

        CMP     Rregno,#R15:SHL:DT_ARMreg_pos
        BHS     FPASCSyncBounce_STF_User_R15

FPASCSyncBounce_STF_User_Stacked

; We can pick up the ARM register concerned from the stacked register values
; pointed to by Rfp, and do writeback there as well if necessary. First pick
; up the register value.

        BiShift LDR,Rregval,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Calculate the indexed version of this address.

        AND     Rtmp,Rins,#DT_offset_mask
        TST     Rins,#DT_UnotD_bit
        ADDNE   Rtmp,Rregval,Rtmp,LSL #2
        SUBEQ   Rtmp,Rregval,Rtmp,LSL #2

; Do the writeback if required.

        TST     Rins,#DT_wb_bit
        BiShift STRNE,Rtmp,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Do the store to the correct one of these.

        TST     Rins,#DT_PreIndex_bit
        MOVNE   Rregval,Rtmp
        CMP     RNDprm,#1:SHL:(RM_pos+2)
        STRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        STRHST  OP1mhi,[Rregval],#4
        STRHIT  OP1mlo,[Rregval]

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCSyncBounce_STF_User_R15

; The original link value, excluding the PSR bits if this is a 26-bit
; handler, is 4 less than the value of R15 to use.

        LDR     Rregval,[Rfp,#15*4]
        ADD     Rregval,Rregval,#4
        [ {CONFIG}=26
          BIC     Rregval,Rregval,#PSR_mask
        ]

; If pre-indexed, calculate the indexed version of this address. Note we're
; never going to do writeback, so there is no need to do the indexing unless
; the instruction is pre-indexed.

        TST     Rins,#DT_PreIndex_bit           ;Preindexed?
        ANDNE   Rtmp,Rins,#DT_offset_mask       ;If so, extract offset and
        SUBNE   Rregval,Rregval,Rtmp,LSL #2     ; assume it is -ve; then
        TSTNE   Rins,#DT_UnotD_bit              ; check to see if it is +ve
        ADDNE   Rregval,Rregval,Rtmp,LSL #3     ; & compensate if so

; Do the store.

        CMP     RNDprm,#1:SHL:(RM_pos+2)
        STRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        STRHST  OP1mhi,[Rregval],#4
        STRHIT  OP1mlo,[Rregval]

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCSyncBounce_STF_NonUser

; Split according to whether the address register is R0-R12, R13-R14 or R15.
; Note that Rtmp still holds the caller's mode.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPASCSyncBounce_STF_NonUser_R13toR15

FPASCSyncBounce_STF_NonUser_Stacked

; We can pick up the ARM register concerned from the stacked register values
; pointed to by Rfp, and do writeback there as well if necessary. First pick
; up the register value.

        BiShift LDR,Rregval,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Calculate the indexed version of this address.

        AND     Rtmp,Rins,#DT_offset_mask
        TST     Rins,#DT_UnotD_bit
        ADDNE   Rtmp,Rregval,Rtmp,LSL #2
        SUBEQ   Rtmp,Rregval,Rtmp,LSL #2

; Do the writeback if required.

        TST     Rins,#DT_wb_bit
        BiShift STRNE,Rtmp,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Do the store to the correct one of these.

        TST     Rins,#DT_PreIndex_bit
        MOVNE   Rregval,Rtmp
        CMP     RNDprm,#1:SHL:(RM_pos+2)
        STMLOIA Rregval,{OP1sue}                ;NB Normal transfer
        STMEQIA Rregval,{OP1sue,OP1mhi}
        STMHIIA Rregval,{OP1sue,OP1mhi,OP1mlo}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCSyncBounce_STF_NonUser_R13toR15

; Note that Rtmp still holds the caller's mode.

        CMP     Rregno,#R15:SHL:DT_ARMreg_pos
        BNE     FPASCSyncBounce_STF_NonUser_ModeChanges

FPASCSyncBounce_STF_NonUser_R15

; The original link value, excluding the PSR bits if this is a 26-bit
; handler, is 4 less than the value of R15 to use.

        LDR     Rregval,[Rfp,#15*4]
        ADD     Rregval,Rregval,#4
        [ {CONFIG}=26
          BIC     Rregval,Rregval,#PSR_mask
        ]

; If pre-indexed, calculate the indexed version of this address. Note we're
; never going to do writeback, so there is no need to do the indexing unless
; the instruction is pre-indexed.

        TST     Rins,#DT_PreIndex_bit           ;Preindexed?
        ANDNE   Rtmp,Rins,#DT_offset_mask       ;If so, extract offset and
        SUBNE   Rregval,Rregval,Rtmp,LSL #2     ; assume it is -ve; then
        TSTNE   Rins,#DT_UnotD_bit              ; check to see if it is +ve
        ADDNE   Rregval,Rregval,Rtmp,LSL #3     ; & compensate if so

; Do the store.

        CMP     RNDprm,#1:SHL:(RM_pos+2)
        STMLOIA Rregval,{OP1sue}                ;NB Normal transfer
        STMEQIA Rregval,{OP1sue,OP1mhi}
        STMHIIA Rregval,{OP1sue,OP1mhi,OP1mlo}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCSyncBounce_STF_NonUser_ModeChanges

        [ {CONFIG}=32
          TEQ     Rtmp,#Mode_SYS32
          BEQ     FPASCSyncBounce_STF_NonUser_Stacked
        ]

; Change to the caller's mode and preserve original mode in Rtmp2. Note that
; Rtmp still holds the caller's mode.

        [ {CONFIG}=32
          ORR     Rtmp,Rtmp,#Mode_32not26+I_bit ;Make 32-bit version of mode
          MRS     Rtmp2,CPSR                    ; and ensure interrupts become
          BIC     Rregval,Rtmp2,#Mode_mask      ; disabled temporarily
          ORR     Rtmp,Rregval,Rtmp
          MSR     CPSR_c,Rtmp                   ;Change to mode just calculated
        ]

        [ {CONFIG}=26
          ORR     Rtmp,Rtmp,#I_bit              ;Ensure that interrupts become
          MOV     Rtmp2,PC                      ; disabled temporarily
          AND     Rregval,Rtmp2,#PSR_mask:AND:(:NOT:Mode_mask)
          ORR     Rtmp,Rregval,Rtmp
          TEQP    PC,Rtmp                       ;Change to caller's mode
        ]

; Get correct one of R13 or R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        MOVEQ   Rregval,R13
        MOVNE   Rregval,R14

; Calculate the indexed version of this address.

        AND     Rtmp,Rins,#DT_offset_mask
        TST     Rins,#DT_UnotD_bit
        ADDNE   Rtmp,Rregval,Rtmp,LSL #2
        SUBEQ   Rtmp,Rregval,Rtmp,LSL #2

; Do the writeback if required.

        TST     Rins,#DT_wb_bit
        BEQ     FPASCSyncBounce_STF_NonUser_WritebackDone
        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        MOVEQ   R13,Rtmp
        MOVNE   R14,Rtmp

FPASCSyncBounce_STF_NonUser_WritebackDone

; Deal with pre-indexing vs. post-indexing.

        TST     Rins,#DT_PreIndex_bit
        MOVNE   Rregval,Rtmp

; Change back to original mode.

        [ {CONFIG}=32
          MSR     CPSR_c,Rtmp2                  ;Change back to original mode
        ]                                       ; and interrupt status

        [ {CONFIG}=26
          TEQP    PC,Rtmp2                      ;Change back to original mode
        ]                                       ; and interrupt status

; Do the store.

        CMP     RNDprm,#1:SHL:(RM_pos+2)
        STMLOIA Rregval,{OP1sue}                ;NB Normal transfer
        STMEQIA Rregval,{OP1sue,OP1mhi}
        STMHIIA Rregval,{OP1sue,OP1mhi,OP1mlo}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

;===========================================================================

        [       :LNOT:NoPacked

FPASCSyncBounce_LDFPorSTFP

        TST     Rins,#DT_LnotS_bit
        BNE     FPASCSyncBounce_LDFP

FPASCSyncBounce_STFP

; It's an STFP. Next thing to do is to pick up the correct register
; contents.

        GetDst  FPASC,OP1regs,Rins,Rtmp
        ASSERT  DT_dst_mask = Ds_mask

; Now convert the value to the correct word(s) to be stored to memory.

        BL      STFConvertSC_Packed

; We've now got the correct words to store in OP1sue, OP1mhi and OP1mlo, and
; Rarith if the EP bit is set in the FPSR. We've now got to work out the
; address at which to store them, do the store and do writeback if
; necessary. To do this, we need to split into three cases:
;
; * Register is R0-R14 in user modes, or R0-R12 in non-user modes: in this
;   case, we simply use the register values we stored away on the stack on
;   entry to the undefined instruction handler. (Note that we make no
;   attempt to handle FIQ modes, so we don't need to worry about registers
;   R8-R12 being banked.)
;
; * Register is R13 or R14 in non-user modes: in this case, we use the value
;   obtained by changing to the mode concerned, picking up the appropriate
;   register and changing back. (If called from the appropriate one of
;   Supervisor26 and Undefined32, this will produce inappropriate results -
;   however, this is another thing we don't even try to get right.)
;
;   As a special case, use of R13 or R14 in System mode will be treated like
;   use of R0-R12 in System mode, since it is important that writeback
;   should occur to the "live" copy of the user mode registers on the stack
;   rather than the "dead" copy in the registers themselves.
;
; * Register is R15 in any mode: in this case, we need to use the address of
;   the instruction that bounced plus 8, and we don't do writeback even if
;   it is specified in the instruction.
;
; First split according to user/non-user mode. (This is done because not
; merely the decision as to how to access the register depends on this, but
; also what type of store instruction we use to access memory.)

        AND     Rregno,Rins,#DT_ARMreg_mask     ;Isolate register number

        GetMode Rtmp                            ;Split according to user or
        BNE     FPASCSyncBounce_STFP_NonUser    ; non-user mode

FPASCSyncBounce_STFP_User

; Split according to whether the address register is R0-R14 or R15.

        CMP     Rregno,#R15:SHL:DT_ARMreg_pos
        BHS     FPASCSyncBounce_STFP_User_R15

FPASCSyncBounce_STFP_User_Stacked

; We can pick up the ARM register concerned from the stacked register values
; pointed to by Rfp, and do writeback there as well if necessary. First pick
; up the register value.

        BiShift LDR,Rregval,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Calculate the indexed version of this address.

        AND     Rtmp,Rins,#DT_offset_mask
        TST     Rins,#DT_UnotD_bit
        ADDNE   Rtmp,Rregval,Rtmp,LSL #2
        SUBEQ   Rtmp,Rregval,Rtmp,LSL #2

; Do the writeback if required.

        TST     Rins,#DT_wb_bit
        BiShift STRNE,Rtmp,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Do the store to the correct one of these.

        TST     Rins,#DT_PreIndex_bit
        MOVNE   Rregval,Rtmp
        TST     Rfpsr,#EP_bit
        STRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        STRT    OP1mhi,[Rregval],#4
        STRT    OP1mlo,[Rregval],#4
        STRNET  Rarith,[Rregval]

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCSyncBounce_STFP_User_R15

; The original link value, excluding the PSR bits if this is a 26-bit
; handler, is 4 less than the value of R15 to use.

        LDR     Rregval,[Rfp,#15*4]
        ADD     Rregval,Rregval,#4
        [ {CONFIG}=26
          BIC     Rregval,Rregval,#PSR_mask
        ]

; If pre-indexed, calculate the indexed version of this address. Note we're
; never going to do writeback, so there is no need to do the indexing unless
; the instruction is pre-indexed.

        TST     Rins,#DT_PreIndex_bit           ;Preindexed?
        ANDNE   Rtmp,Rins,#DT_offset_mask       ;If so, extract offset and
        SUBNE   Rregval,Rregval,Rtmp,LSL #2     ; assume it is -ve; then
        TSTNE   Rins,#DT_UnotD_bit              ; check to see if it is +ve
        ADDNE   Rregval,Rregval,Rtmp,LSL #3     ; & compensate if so

; Do the store.

        TST     Rfpsr,#EP_bit
        STRT    OP1sue,[Rregval],#4
        STRT    OP1mhi,[Rregval],#4
        STRT    OP1mlo,[Rregval],#4
        STRNET  Rarith,[Rregval]

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCSyncBounce_STFP_NonUser

; Split according to whether the address register is R0-R12, R13-R14 or R15.
; Note that Rtmp still holds the caller's mode.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPASCSyncBounce_STFP_NonUser_R13toR15

FPASCSyncBounce_STFP_NonUser_Stacked

; We can pick up the ARM register concerned from the stacked register values
; pointed to by Rfp, and do writeback there as well if necessary. First pick
; up the register value.

        BiShift LDR,Rregval,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Calculate the indexed version of this address.

        AND     Rtmp,Rins,#DT_offset_mask
        TST     Rins,#DT_UnotD_bit
        ADDNE   Rtmp,Rregval,Rtmp,LSL #2
        SUBEQ   Rtmp,Rregval,Rtmp,LSL #2

; Do the writeback if required.

        TST     Rins,#DT_wb_bit
        BiShift STRNE,Rtmp,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Do the store to the correct one of these.

        TST     Rins,#DT_PreIndex_bit
        MOVNE   Rregval,Rtmp
        TST     Rfpsr,#EP_bit
        STMEQIA Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        STMHIIA Rregval,{OP1sue,OP1mhi,OP1mlo,Rarith}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < Rarith

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCSyncBounce_STFP_NonUser_R13toR15

; Note that Rtmp still holds the caller's mode.

        CMP     Rregno,#R15:SHL:DT_ARMreg_pos
        BNE     FPASCSyncBounce_STFP_NonUser_ModeChanges

FPASCSyncBounce_STFP_NonUser_R15

; The original link value, excluding the PSR bits if this is a 26-bit
; handler, is 4 less than the value of R15 to use.

        LDR     Rregval,[Rfp,#15*4]
        ADD     Rregval,Rregval,#4
        [ {CONFIG}=26
          BIC     Rregval,Rregval,#PSR_mask
        ]

; If pre-indexed, calculate the indexed version of this address. Note we're
; never going to do writeback, so there is no need to do the indexing unless
; the instruction is pre-indexed.

        TST     Rins,#DT_PreIndex_bit           ;Preindexed?
        ANDNE   Rtmp,Rins,#DT_offset_mask       ;If so, extract offset and
        SUBNE   Rregval,Rregval,Rtmp,LSL #2     ; assume it is -ve; then
        TSTNE   Rins,#DT_UnotD_bit              ; check to see if it is +ve
        ADDNE   Rregval,Rregval,Rtmp,LSL #3     ; & compensate if so

; Do the store.

        TST     Rfpsr,#EP_bit
        STMEQIA Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        STMHIIA Rregval,{OP1sue,OP1mhi,OP1mlo,Rarith}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < Rarith

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCSyncBounce_STFP_NonUser_ModeChanges

        [ {CONFIG}=32
          TEQ     Rtmp,#Mode_SYS32
          BEQ     FPASCSyncBounce_STFP_NonUser_Stacked
        ]

; Change to the caller's mode and preserve original mode in Rtmp2. Note that
; Rtmp still holds the caller's mode.

        [ {CONFIG}=32
          ORR     Rtmp,Rtmp,#Mode_32not26+I_bit ;Make 32-bit version of mode
          MRS     Rtmp2,CPSR                    ; and ensure interrupts become
          BIC     Rregval,Rtmp2,#Mode_mask      ; disabled temporarily
          ORR     Rtmp,Rregval,Rtmp
          MSR     CPSR_c,Rtmp                   ;Change to mode just calculated
        ]

        [ {CONFIG}=26
          ORR     Rtmp,Rtmp,#I_bit              ;Ensure that interrupts become
          MOV     Rtmp2,PC                      ; disabled temporarily
          AND     Rregval,Rtmp2,#PSR_mask:AND:(:NOT:Mode_mask)
          ORR     Rtmp,Rregval,Rtmp
          TEQP    PC,Rtmp                       ;Change to caller's mode
        ]

; Get correct one of R13 or R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        MOVEQ   Rregval,R13
        MOVNE   Rregval,R14

; Calculate the indexed version of this address.

        AND     Rtmp,Rins,#DT_offset_mask
        TST     Rins,#DT_UnotD_bit
        ADDNE   Rtmp,Rregval,Rtmp,LSL #2
        SUBEQ   Rtmp,Rregval,Rtmp,LSL #2

; Do the writeback if required.

        TST     Rins,#DT_wb_bit
        BEQ     FPASCSyncBounce_STFP_NonUser_WritebackDone
        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        MOVEQ   R13,Rtmp
        MOVNE   R14,Rtmp

FPASCSyncBounce_STFP_NonUser_WritebackDone

; Deal with pre-indexing vs. post-indexing.

        TST     Rins,#DT_PreIndex_bit
        MOVNE   Rregval,Rtmp

; Change back to original mode.

        [ {CONFIG}=32
          MSR     CPSR_c,Rtmp2                  ;Change back to original mode
        ]                                       ; and interrupt status

        [ {CONFIG}=26
          TEQP    PC,Rtmp2                      ;Change back to original mode
        ]                                       ; and interrupt status

; Do the store.

        TST     Rfpsr,#EP_bit
        STMEQIA Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        STMHIIA Rregval,{OP1sue,OP1mhi,OP1mlo,Rarith}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < Rarith

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

;===========================================================================

FPASCSyncBounce_LDFP

; It's an LDFP. First, we've got to work out the address from which to load
; the value, do the load and do writeback if necessary. To do this, we need
; to split into three cases:
;
; * Register is R0-R14 in user modes, or R0-R12 in non-user modes: in this
;   case, we simply use the register values we stored away on the stack on
;   entry to the undefined instruction handler. (Note that we make no
;   attempt to handle FIQ modes, so we don't need to worry about registers
;   R8-R12 being banked.)
;
; * Register is R13 or R14 in non-user modes: in this case, we use the value
;   obtained by changing to the mode concerned, picking up the appropriate
;   register and changing back. (If called from the appropriate one of
;   Supervisor26 and Undefined32, this will produce inappropriate results -
;   however, this is another thing we don't even try to get right.)
;
;   As a special case, use of R13 or R14 in System mode will be treated like
;   use of R0-R12 in System mode, since it is important that writeback
;   should occur to the "live" copy of the user mode registers on the stack
;   rather than the "dead" copy in the registers themselves.
;
; * Register is R15 in any mode: in this case, we need to use the address of
;   the instruction that bounced plus 8, and we don't do writeback even if
;   it is specified in the instruction.
;
; First split according to user/non-user mode. (This is done because not
; merely the decision as to how to access the register depends on this, but
; also what type of store instruction we use to access memory.)

        AND     Rregno,Rins,#DT_ARMreg_mask     ;Isolate register number

        GetMode Rtmp                            ;Split according to user or
        BNE     FPASCSyncBounce_LDFP_NonUser    ; non-user mode

FPASCSyncBounce_LDFP_User

; Split according to whether the address register is R0-R14 or R15.

        CMP     Rregno,#R15:SHL:DT_ARMreg_pos
        BHS     FPASCSyncBounce_LDFP_User_R15

FPASCSyncBounce_LDFP_User_Stacked

; We can pick up the ARM register concerned from the stacked register values
; pointed to by Rfp, and do writeback there as well if necessary. First pick
; up the register value.

        BiShift LDR,Rregval,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Calculate the indexed version of this address.

        AND     Rtmp,Rins,#DT_offset_mask
        TST     Rins,#DT_UnotD_bit
        ADDNE   Rtmp,Rregval,Rtmp,LSL #2
        SUBEQ   Rtmp,Rregval,Rtmp,LSL #2

; Do the writeback if required.

        TST     Rins,#DT_wb_bit
        BiShift STRNE,Rtmp,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Do the load from the correct one of these.

        TST     Rins,#DT_PreIndex_bit
        MOVNE   Rregval,Rtmp

FPASCSyncBounce_LDFP_User_Shared

        TST     Rfpsr,#EP_bit
        LDRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        LDRT    OP1mhi,[Rregval],#4
        LDRT    OP1mlo,[Rregval],#4
        LDRNET  Rarith,[Rregval]

FPASCSyncBounce_LDFP_Shared

; Convert the number and store it in the correct register.

        BL      LDFConvertSC_Packed

        PutDst  FPASC,OP1regs,Rins,Rtmp,L

; Now write back the possibly modified FPSR and return.

        B       FPASCWriteFPSRAndReturn

FPASCSyncBounce_LDFP_User_R15

; The original link value, excluding the PSR bits if this is a 26-bit
; handler, is 4 less than the value of R15 to use.

        LDR     Rregval,[Rfp,#15*4]
        ADD     Rregval,Rregval,#4
        [ {CONFIG}=26
          BIC     Rregval,Rregval,#PSR_mask
        ]

; If pre-indexed, calculate the indexed version of this address. Note we're
; never going to do writeback, so there is no need to do the indexing unless
; the instruction is pre-indexed.

        TST     Rins,#DT_PreIndex_bit           ;Preindexed?
        ANDNE   Rtmp,Rins,#DT_offset_mask       ;If so, extract offset and
        SUBNE   Rregval,Rregval,Rtmp,LSL #2     ; assume it is -ve; then
        TSTNE   Rins,#DT_UnotD_bit              ; check to see if it is +ve
        ADDNE   Rregval,Rregval,Rtmp,LSL #3     ; & compensate if so

; Join up with other user code.

        B       FPASCSyncBounce_LDFP_User_Shared

FPASCSyncBounce_LDFP_NonUser

; Split according to whether the address register is R0-R12, R13-R14 or R15.
; Note that Rtmp still holds the caller's mode.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPASCSyncBounce_LDFP_NonUser_R13toR15

FPASCSyncBounce_LDFP_NonUser_Stacked

; We can pick up the ARM register concerned from the stacked register values
; pointed to by Rfp, and do writeback there as well if necessary. First pick
; up the register value.

        BiShift LDR,Rregval,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Calculate the indexed version of this address.

        AND     Rtmp,Rins,#DT_offset_mask
        TST     Rins,#DT_UnotD_bit
        ADDNE   Rtmp,Rregval,Rtmp,LSL #2
        SUBEQ   Rtmp,Rregval,Rtmp,LSL #2

; Do the writeback if required.

        TST     Rins,#DT_wb_bit
        BiShift STRNE,Rtmp,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2

; Do the load from the correct one of these.

        TST     Rins,#DT_PreIndex_bit
        MOVNE   Rregval,Rtmp

FPASCSyncBounce_LDFP_NonUser_Shared

        TST     Rfpsr,#EP_bit
        LDMEQIA Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        LDMHIIA Rregval,{OP1sue,OP1mhi,OP1mlo,Rarith}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < Rarith

        B       FPASCSyncBounce_LDFP_Shared

FPASCSyncBounce_LDFP_NonUser_R13toR15

; Note that Rtmp still holds the caller's mode.

        CMP     Rregno,#R15:SHL:DT_ARMreg_pos
        BNE     FPASCSyncBounce_LDFP_NonUser_ModeChanges

FPASCSyncBounce_LDFP_NonUser_R15

; The original link value, excluding the PSR bits if this is a 26-bit
; handler, is 4 less than the value of R15 to use.

        LDR     Rregval,[Rfp,#15*4]
        ADD     Rregval,Rregval,#4
        [ {CONFIG}=26
          BIC     Rregval,Rregval,#PSR_mask
        ]

; If pre-indexed, calculate the indexed version of this address. Note we're
; never going to do writeback, so there is no need to do the indexing unless
; the instruction is pre-indexed.

        TST     Rins,#DT_PreIndex_bit           ;Preindexed?
        ANDNE   Rtmp,Rins,#DT_offset_mask       ;If so, extract offset and
        SUBNE   Rregval,Rregval,Rtmp,LSL #2     ; assume it is -ve; then
        TSTNE   Rins,#DT_UnotD_bit              ; check to see if it is +ve
        ADDNE   Rregval,Rregval,Rtmp,LSL #3     ; & compensate if so

; Join up with other non-user code.

        B       FPASCSyncBounce_LDFP_NonUser_Shared

FPASCSyncBounce_LDFP_NonUser_ModeChanges

        [ {CONFIG}=32
          TEQ     Rtmp,#Mode_SYS32
          BEQ     FPASCSyncBounce_LDFP_NonUser_Stacked
        ]

; Change to the caller's mode and preserve original mode in Rtmp2. Note that
; Rtmp still holds the caller's mode.

        [ {CONFIG}=32
          ORR     Rtmp,Rtmp,#Mode_32not26+I_bit ;Make 32-bit version of mode
          MRS     Rtmp2,CPSR                    ; and ensure interrupts become
          BIC     Rregval,Rtmp2,#Mode_mask      ; disabled temporarily
          ORR     Rtmp,Rregval,Rtmp
          MSR     CPSR_c,Rtmp                   ;Change to mode just calculated
        ]

        [ {CONFIG}=26
          ORR     Rtmp,Rtmp,#I_bit              ;Ensure that interrupts become
          MOV     Rtmp2,PC                      ; disabled temporarily
          AND     Rregval,Rtmp2,#PSR_mask:AND:(:NOT:Mode_mask)
          ORR     Rtmp,Rregval,Rtmp
          TEQP    PC,Rtmp                       ;Change to caller's mode
        ]

; Get correct one of R13 or R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        MOVEQ   Rregval,R13
        MOVNE   Rregval,R14

; Calculate the indexed version of this address.

        AND     Rtmp,Rins,#DT_offset_mask
        TST     Rins,#DT_UnotD_bit
        ADDNE   Rtmp,Rregval,Rtmp,LSL #2
        SUBEQ   Rtmp,Rregval,Rtmp,LSL #2

; Do the writeback if required.

        TST     Rins,#DT_wb_bit
        BEQ     FPASCSyncBounce_LDFP_NonUser_WritebackDone
        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        MOVEQ   R13,Rtmp
        MOVNE   R14,Rtmp

FPASCSyncBounce_LDFP_NonUser_WritebackDone

; Deal with pre-indexing vs. post-indexing.

        TST     Rins,#DT_PreIndex_bit
        MOVNE   Rregval,Rtmp

; Change back to original mode.

        [ {CONFIG}=32
          MSR     CPSR_c,Rtmp2                  ;Change back to original mode
        ]                                       ; and interrupt status

        [ {CONFIG}=26
          TEQP    PC,Rtmp2                      ;Change back to original mode
        ]                                       ; and interrupt status

; Join up with other non-user code.

        B       FPASCSyncBounce_LDFP_NonUser_Shared

        ]                                       ;End of :LNOT:NoPacked section

;===========================================================================

FPASCDisabledAndPE

; The core was disabled and has been re-enabled by the act of reading the
; FPCR. However, there is a pending exception associated with an FPCR value
; which was read earlier and stored in 'DisableInfo'. Since it is not
; possible to write the pending exception information back to the FPCR,
; we've got to put the FPA into another "disabled" state, so that we can
; intervene again when an attempt is made to execute a floating point
; instruction.
;   Using the terminology defined in the "interf.s" source file, we must
; change the DISABLED_PE state to the INACTIVE_PE state, which involves
; clearing the SB bit and storing the FPSR and register values.

        RFS     Rtmp2
        STR     Rtmp2,MemFPSR

Tempa   SETA            :BASE:SC_RegDump
        [ Tempa = 15
Tempa2    SETA            SC_RegDump-({PC}+8)
        |
Tempa2    SETA            :INDEX:SC_RegDump
        ]
        SFM     F0,4,[R$Tempa,#Tempa2]

Tempa   SETA            :BASE:SC_RegDump
        [ Tempa = 15
Tempa2    SETA            SC_RegDump-({PC}+8)
        |
Tempa2    SETA            :INDEX:SC_RegDump
        ]
        SFM     F4,4,[R$Tempa,#Tempa2+48]

        LDR     Rtmp2,DisableInfo
        BIC     Rtmp2,Rtmp2,#SB_bit
        STR     Rtmp2,DisableInfo

FPASCDisabled

; The core was disabled and either there was no pending exception, or there
; was a pending exception and we've dealt with the problem above. In either
; case, all we have to do now is move the return link back and branch to
; 'veneer_coredisabled'. As usual, we don't worry about the PC=0 case in
; 26-bit code.

        LDR     Rtmp2,[Rfp,#15*4]
        SUB     Rtmp2,Rtmp2,#4
        STR     Rtmp2,[Rfp,#15*4]

        B       veneer_coredisabled

;===========================================================================

        ]               ; For FPASCWanted condition covering whole file

        END
