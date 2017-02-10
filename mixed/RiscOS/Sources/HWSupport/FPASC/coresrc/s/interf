; Assembler source for FPA support code and emulator
; ==================================================
; Core routines to implement the core/veneer interface
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

; Some documentation of how the FPASC uses the FPCR:
;
; Each context can be regarded as being in one of six states, where the
; memory context FPCR value is in "DisableInfo". (Only the current context
; may be in any state other than INACTIVE or INACTIVE_PE, and the statements
; below about what is in the real FPCR, FPSR and registers are obviously
; irrelevant to non-current contexts.) The states are:
;
; (1) ACTIVE
;     The real FPCR contains DA=0, SB=X, AB=0;
;     Other bits of the real FPCR are irrelevant;
;     The FPA contains up-to-date FPSR and register values;
;     The FPCR in the memory context is irrelevant;
;     The FPSR and register values in the memory context are irrelevant;
;
; (2) ACTIVE_PE
;     The real FPCR contains DA=0, SB=X, AB=1;
;     Other bits of the real FPCR contain the asynchronous exception info;
;     The FPA contains up-to-date FPSR and register values;
;     The FPCR in the memory context is irrelevant;
;     The FPSR and register values in the memory context are irrelevant;
;
; (3) INACTIVE
;     The real FPCR contains DA=0, SB=0, AB=0;
;     Other bits of the real FPCR are irrelevant;
;     The FPA contains up-to-date FPSR and register values;
;     The FPCR in the memory context has DA=0, SB=0, AB=0, with other bits
;       irrelevant;
;     The FPSR and register values in the memory context are up-to-date;
;
; (4) INACTIVE_PE
;     The real FPCR contains DA=1, SB=0, AB=1;
;     Other bits of the real FPCR are irrelevant;
;     The FPA contains up-to-date FPSR and register values;
;     The FPCR in the memory context has DA=1, SB=0, AB=1, with other bits
;       containing the asynchronous exception info;
;     The FPSR and register values in the memory context are up-to-date;
;
; (5) DISABLED
;     The real FPCR contains DA=1, SB=1, AB=0;
;     Other bits of the real FPCR are irrelevant;
;     The FPA contains up-to-date FPSR and register values;
;     The FPCR in the memory context has DA=1, SB=1, AB=0, with other bits
;       irrelevant;
;     The FPSR and register values in the memory context are irrelevant;
;
; (6) DISABLED_PE
;     The real FPCR contains DA=1, SB=1, AB=1;
;     Other bits of the real FPCR are irrelevant;
;     The FPA contains up-to-date FPSR and register values;
;     The FPCR in the memory context has DA=1, SB=1, AB=1, with other bits
;       containing the asynchronous exception info;
;     The FPSR and register values in the memory context are irrelevant;
;
; Note that states ACTIVE and INACTIVE are not distinguishable from the
; state of the FPA: however, there is no need to take different actions in
; the two cases. They do differ in respect of whether memory is up-to-date
; with the FPA. Keeping track of this is simply a software convention: if no
; instruction has been executed and the FPA system has not been disabled
; since the context was deactivated, memory is up-to-date.
;
; The effects of various calls on these states are:
;
; core_deactivatecontext:
;   ACTIVE      -> INACTIVE    (FPSR & registers saved)
;   ACTIVE_PE   -> INACTIVE_PE (FPSR, registers & exception info saved)
;   INACTIVE    -> INACTIVE    (FPSR & registers may be saved again)
;   INACTIVE_PE -> INACTIVE_PE (FPSR & registers may be saved again)
;   DISABLED    -> INACTIVE    (FPSR & registers saved)
;   DISABLED_PE -> INACTIVE_PE (FPSR & registers saved)
;
; core_activatecontext:
;   Old FPA state is lost, including any pending exception, and replaced by
;   state from context being loaded. Context being loaded cannot be ACTIVE,
;   ACTIVE_PE, DISABLED or DISABLED_PE; other states changed as follows:
;   INACTIVE    -> ACTIVE
;   INACTIVE_PE -> INACTIVE_PE (now in FPA as well as memory)
;
; core_disable:
;   ACTIVE      -> DISABLED
;   ACTIVE_PE   -> DISABLED_PE (Exception info only saved)
;   INACTIVE    -> DISABLED
;   INACTIVE_PE -> DISABLED_PE
;   DISABLED    -> DISABLED
;   DISABLED_PE -> DISABLED_PE
;
; core_enable:
;   ACTIVE      -> ACTIVE
;   ACTIVE_PE   -> INACTIVE_PE (FPSR, registers & exception info saved)
;   INACTIVE    -> ACTIVE
;   INACTIVE_PE -> INACTIVE_PE (FPSR & registers may be saved again)
;   DISABLED    -> ACTIVE
;   DISABLED_PE -> INACTIVE_PE (FPSR & registers saved)
;
; Exception occurs (calls to above routines wait for this to happen, since
; they read the FPCR):
;   ACTIVE      -> ACTIVE_PE
;   Cannot happen in other states, because of hardware and software
;   interlocks;
;
; Executing an instruction:
;   ACTIVE      -> ACTIVE
;   ACTIVE_PE   -> ACTIVE      (exception processed, instr.emulated/retried)
;   INACTIVE    -> ACTIVE
;   INACTIVE_PE -> ACTIVE      (exception processed, instr.emulated/retried)
;   DISABLED    -> ACTIVE      (exits via 'veneer_coredisabled')
;   DISABLED_PE -> INACTIVE_PE (exits via 'veneer_coredisabled')

;===========================================================================

; The value with which registers are initialised.

        GBLL    RegInitOK
RegInitOK SETL  {FALSE}

        [ FPRegInitValue="SigNaN"
RegInitOK SETL  {TRUE}
Initialisation_RegValue
          DCD     0x40007FFF,0x3FFFFFFF,0xFFFFFFFF
        ]

        [ FPRegInitValue="Zero"
RegInitOK SETL  {TRUE}
Initialisation_RegValue
          DCD     0x00000000,0x00000000,0x00000000
        ]

        ASSERT  RegInitOK

; The value with which the FPSR is initialised, excluding the SysID.

Initialisation_FPSRValue        EQU     FPSRInitValue:AND:(:NOT:SysID_mask)

;===========================================================================

; A routine to cancel any pending exception and abort any incomplete
; floating point processing. See "src.main" for a more detailed explanation
; of this routine.
;
; This routine works because of some careful handling of recursive floating
; point instructions within the code. In particular, whenever we free some
; floating point registers for internal calculations, we put them on the
; stack, followed by a mask saying which registers we put on the stack. Then
; we disable interrupts and ensure that we don't have anything else on the
; stack at any point that a recursive floating point instruction is
; executed. Thus we ensure (a) that we're not interrupted with incorrect
; floating point register values unless we're inside a recursive call to the
; undefined instruction handler; (b) that when we are inside a recursive
; call to the undefined instruction handler, the first values on the stack
; above the stack frame are the mask, then the dumped values of the floating
; point registers indicated by the mask.

core_abort

        [ SCWanted

; Get the memory copy of the FPSR.

          LDR     R6,MemFPSR

          [ FPEWanted

; First thing to do is split according to whether we're dealing with a
; hardware or software context.

            TEQ     R6,#0
            BPL     core_abort_FPE
          ]

core_abort_SC

; Make R6 hold the correct system ID.

          AND     R6,R6,#SysID_mask

; If this is the current floating point context, clear any pending exception
; in the hardware.

          ASSERT  (:BASE:CurrentContext) = Rwp
          AdrWS   R2
          LDR     R2,[R2,#:INDEX:CurrentContext]

          TEQ     R2,R10
          RFCEQ   R2

; Clear any pending exception in the memory context.

          LDR     R2,DisableInfo
          BIC     R2,R2,#AB_bit
          STR     R2,DisableInfo

; Does the PC value in R1 indicate we're inside the undefined instruction
; handlers? If not, we're done.

          [ {CONFIG} = 26
            BIC     R1,R1,#PSR_mask
          ]
          ADRL    R2,FP_UndefHandlers_Start
          ADRL    R3,FP_UndefHandlers_End-4
          CMP     R1,R2
          CMPGE   R3,R1
          MOVLT   PC,LR

core_abort_SC_loop

; We are inside the undefined instruction handlers, so R0 contains a frame
; pointer. Pick up the new PC value and check whether it lies inside the
; undefined instruction handlers. If not, we're done.

          LDR     R1,[R0,#15*4]
          [ {CONFIG} = 26
            BIC     R1,R1,#PSR_mask
          ]
          CMP     R1,R2
          CMPGE   R3,R1
          MOVLT   PC,LR

; We've got a recursive call to unwind. Address the floating point register
; dump, get the mask, then load up floating point registers as it indicates.

          ADD     R4,R0,#17*4
          LDR     R5,[R4,#-4]
          TST     R5,#1:SHL:0
          LFMNEIA F0,1,[R4]!
          TST     R5,#1:SHL:1
          LFMNEIA F1,1,[R4]!
          TST     R5,#1:SHL:2
          LFMNEIA F2,1,[R4]!
          TST     R5,#1:SHL:3
          LFMNEIA F3,1,[R4]!
          TST     R5,#1:SHL:4
          LFMNEIA F4,1,[R4]!
          TST     R5,#1:SHL:5
          LFMNEIA F5,1,[R4]!
          TST     R5,#1:SHL:6
          LFMNEIA F6,1,[R4]!
          TST     R5,#1:SHL:7
          LFMNEIA F7,1,[R4]!

; Restore the FPSR, get the new frame pointer and repeat.

          MOV     R5,R5,LSR #8
          ORR     R5,R5,R6              ;Insert system ID byte
          WFS     R5
          LDR     R0,[R0,#Rfp*4]
          B       core_abort_SC_loop

        ]

        [ FPEWanted

core_abort_FPE

; Does the PC value in R1 indicate we're inside the undefined instruction
; handlers? If not, we're done.

          [ {CONFIG} = 26
            BIC     R1,R1,#PSR_mask
          ]
          ADRL    R2,FP_UndefHandlers_Start
          ADRL    R3,FP_UndefHandlers_End-4
          CMP     R1,R2
          CMPGE   R3,R1
          MOVLT   PC,LR

core_abort_FPE_loop

; We are inside the undefined instruction handlers, so R0 contains a frame
; pointer. Pick up the new PC value and check whether it lies inside the
; undefined instruction handlers. If not, we're done.

          LDR     R1,[R0,#15*4]
          [ {CONFIG} = 26
            BIC     R1,R1,#PSR_mask
          ]
          CMP     R1,R2
          CMPGE   R3,R1
          MOVLT   PC,LR

; We've got a recursive call to unwind. Address the floating point register
; dump, get the mask, then load up floating point registers as it indicates.

          ADR     R3,FPE_Regs
          ADD     R4,R0,#17*4
          LDR     R5,[R4,#-4]
          TST     R5,#1:SHL:0
          LDMNEIA R4!,{R1,R6,R7}
          STMNEIA R3,{R1,R6,R7}
          [ FPE4WordsPerReg
            ADD     R3,R3,#16
          |
            ADD     R3,R3,#12
          ]
          TST     R5,#1:SHL:1
          LDMNEIA R4!,{R1,R6,R7}
          STMNEIA R3,{R1,R6,R7}
          [ FPE4WordsPerReg
            ADD     R3,R3,#16
          |
            ADD     R3,R3,#12
          ]
          TST     R5,#1:SHL:2
          LDMNEIA R4!,{R1,R6,R7}
          STMNEIA R3,{R1,R6,R7}
          [ FPE4WordsPerReg
            ADD     R3,R3,#16
          |
            ADD     R3,R3,#12
          ]
          TST     R5,#1:SHL:3
          LDMNEIA R4!,{R1,R6,R7}
          STMNEIA R3,{R1,R6,R7}
          [ FPE4WordsPerReg
            ADD     R3,R3,#16
          |
            ADD     R3,R3,#12
          ]
          TST     R5,#1:SHL:4
          LDMNEIA R4!,{R1,R6,R7}
          STMNEIA R3,{R1,R6,R7}
          [ FPE4WordsPerReg
            ADD     R3,R3,#16
          |
            ADD     R3,R3,#12
          ]
          TST     R5,#1:SHL:5
          LDMNEIA R4!,{R1,R6,R7}
          STMNEIA R3,{R1,R6,R7}
          [ FPE4WordsPerReg
            ADD     R3,R3,#16
          |
            ADD     R3,R3,#12
          ]
          TST     R5,#1:SHL:6
          LDMNEIA R4!,{R1,R6,R7}
          STMNEIA R3,{R1,R6,R7}
          [ FPE4WordsPerReg
            ADD     R3,R3,#16
          |
            ADD     R3,R3,#12
          ]
          TST     R5,#1:SHL:7
          LDMNEIA R4!,{R1,R6,R7}
          STMNEIA R3,{R1,R6,R7}

; Restore the FPSR, get the new frame pointer and repeat.

          ADRL    R3,FP_UndefHandlers_End-4     ;Retrieve the value we lost
          MOV     R5,R5,LSR #8
          ORR     R5,R5,#SysID_FPE:SHL:SysID_pos
          STR     R5,MemFPSR
          LDR     R0,[R0,#Rfp*4]
          B       core_abort_FPE_loop

        ]

;===========================================================================

        LTORG

;===========================================================================

        [ :LNOT::DEF:AssumedHardware

; A special-purpose undefined instruction handler used below. If an FP
; instruction bounces, it simply puts -1 into R0 and continues with the next
; instruction. It may optionally do the same with other coprocessors'
; instructions (it does for the "StandAlone" linkage convention, doesn't for
; the "BranchTable" convention).

UndefMakesR0Minus1

        [       UndefHandStandAlone
          MOV     R0,#-1
          MOVS    PC,LR
        ]

        [       UndefHandBranchTable
          [ {CONFIG} = 32
            LDMDB   Rfp,{Rtmp,Rtmp2}    ;Recover the SPSR and CPSR
            MSR     CPSR_csxf,Rtmp2     ; (restoring the CPSR re-disables
            MSR     SPSR_csxf,Rtmp      ; interrupts, so the SPSR isn't ever
                                        ; valid when interrupts are enabled)
          ]
          ADD     Rsp,Rfp,#4            ;Discard now-spurious stack contents
                                        ;  including stacked R0 value
          MOV     R0,#-1
          LDMIA   Rsp,{R1-R14}^         ;Coding rules: cannot use write-back
          NOP                           ; and must protect next instruction
          ADD     Rsp,Rsp,#14*4         ;Do the write-back
          LDMFD   Rsp!,{PC}^            ;Restore R13_svr/R13_und, PC and PSR
        ]

        ]               ;End of :LNOT::DEF:AssumedHardware section

;===========================================================================

; Routine to initialise the global workspace, including the context it
; contains if MultipleContexts = {FALSE}. See "src.main" for a more detailed
; description of this routine.

core_initws

        STMFD   Rsp!,{R1,R2,R3,R4,LR}

; Store parameters as appropriate.

        [ UndefHandStandAlone
          STR     R1,NextHandler
        ]

        [ UndefHandBranchTable
          STR     R1,NextHandler1
          STR     R2,NextHandler2
        ]

; There is initially no current context.

          MOV     LR,#0
          STR     LR,CurrentContext

        [ :DEF:AssumedHardware

; We simply assume that the right hardware is present.

          MOV     R0,#AssumedHardware
          STR     R0,HardwareID

        |               ;IF :LNOT::DEF:AssumedHardware

; Find out whether any hardware is present and if so, what hardware. Context
; switches or coprocessor instructions during the following would be
; embarrassing, so we disable interrupts for the duration.

          [ {CONFIG} = 26
            MOV     R3,PC
            ORR     R0,R3,#I_bit
            TEQP    PC,R0
          ]

          [ {CONFIG} = 32
            MRS     R3,CPSR
            ORR     R0,R3,#I_bit
            MSR     CPSR_c,R0
          ]

; Now we install a special undefined instruction handler, which will set R0
; to -1 if the instruction bounces.

          [       UndefHandStandAlone
            ADR     R1,UndefMakesR0Minus1
          ]

          [       UndefHandBranchTable
            ADR     R1,UndefMakesR0Minus1
            ADR     R2,UndefMakesR0Minus1
          ]

          BL      veneer_newhandlers

; Now we're ready to test for the presence of the hardware.

          MOV     R0,#0           ;Assume hardware is present
          RFC     R4              ;Read the control register

; If hardware *is* present, we will assume (a) that reading the control
; register has enabled it, so that we can read the status register; (b) that
; writing the value we read back to the control register will disable the
; chip again. These are both true of the FPA, and should be true of other
; hardware in the future. I'm not sure whether they are true of the old
; Acorn FPPC system: I believe that the FPPC system will in fact remain
; disabled at this point. We will deal with this by initialising the
; register the FPSR is read into with the SysId of the Acorn FPPC system. So
; if the instruction bounces, we will assume that the hardware we've got is
; the Acorn FPPC system (the undefined instruction handler will also set R0
; to -1, but this value will be overwritten anyway).

          TEQ     R0,#0
          STRNE   R0,HardwareID
          BNE     core_initws_backtonormal

          MOV     R2,#SysID_FPPC:SHL:SysID_pos
          RFS     R2

; Extract the SysId.

          MOV     R0,R2,LSR #SysID_pos
          STR     R0,HardwareID

; If this is the FPA, we will actually force it to become disabled;
; otherwise, we'll make the assumption described above.

          TEQ     R0,#SysID_FPA
          MOVEQ   R4,#SB_bit+AB_bit+DA_bit

; Now return the hardware to its disabled state.

          WFC     R4

core_initws_backtonormal

; Restore the undefined instruction handlers to their normal state.

          BL      veneer_restorehandlers

; Now we can re-enable the interrupts.

          [ {CONFIG} = 26
            TEQP    PC,R3
          ]

          [ {CONFIG} = 32
            MSR     CPSR_c,R3
          ]

        ]               ;End of :LNOT::DEF:AssumedHardware section

; Return or fall through to 'core_initcontext', as appropriate.

        [ MultipleContexts
          LDMFD   Rsp!,{R1,R2,R3,R4,PC}
        |
          NOP                             ;For safety from TEQP/MSR above
          LDMFD   Rsp!,{R1,R2,R3,R4,LR}
        ]

; If MultipleContexts = {FALSE}, we fall through into 'core_initcontext'

;===========================================================================

; N.B. Can fall through into this routine.

; Routine to initialise or re-initialise a floating point context. See
; "src.main" for a more detailed description of this routine.

core_initcontext

        STMFD   Rsp!,{R0-R3,LR}

        MOV     R0,#0
        STR     R0,DisableInfo

        [ UndefHandCount > 1
          ASSERT  (:BASE:HardwareID) = Rwp
          AdrWS   R0
          LDR     R0,[R0,#:INDEX:HardwareID]

          [ FPASCWanted
            TEQ     R0,#SysID_FPA
            BEQ     core_initcontext_FPASC
          ]

        ]

        [ FPEWanted

core_initcontext_FPE

          ADR     R0,Initialisation_RegValue
          LDMIA   R0,{R1,R2,R3}
          ADR     R0,FPE_Regs
          [ FPE4WordsPerReg
            STMIA   R0!,{R1,R2,R3,R4}   ;NB R4 is a "don't care" value
            STMIA   R0!,{R1,R2,R3,R4}
            STMIA   R0!,{R1,R2,R3,R4}
            STMIA   R0!,{R1,R2,R3,R4}
            STMIA   R0!,{R1,R2,R3,R4}
            STMIA   R0!,{R1,R2,R3,R4}
            STMIA   R0!,{R1,R2,R3,R4}
            STMIA   R0!,{R1,R2,R3,R4}
          |
            STMIA   R0!,{R1,R2,R3}
            STMIA   R0!,{R1,R2,R3}
            STMIA   R0!,{R1,R2,R3}
            STMIA   R0!,{R1,R2,R3}
            STMIA   R0!,{R1,R2,R3}
            STMIA   R0!,{R1,R2,R3}
            STMIA   R0!,{R1,R2,R3}
            STMIA   R0!,{R1,R2,R3}
          ]
          LDR     R0,=(SysID_FPE:SHL:SysID_pos):OR:Initialisation_FPSRValue
          STR     R0,MemFPSR
          LDMFD   Rsp!,{R0-R3,PC}

        ]

        [ FPASCWanted

core_initcontext_FPASC

          ADR     R0,Initialisation_RegValue
          LDMIA   R0,{R1,R2,R3}
          ADR     R0,SC_RegDump
          STMIA   R0!,{R1,R2,R3}
          STMIA   R0!,{R1,R2,R3}
          STMIA   R0!,{R1,R2,R3}
          STMIA   R0!,{R1,R2,R3}
          STMIA   R0!,{R1,R2,R3}
          STMIA   R0!,{R1,R2,R3}
          STMIA   R0!,{R1,R2,R3}
          STMIA   R0!,{R1,R2,R3}
          LDR     R0,=(SysID_FPA:SHL:SysID_pos):OR:Initialisation_FPSRValue
          STR     R0,MemFPSR
          LDMFD   Rsp!,{R0-R3,PC}

        ]

;===========================================================================

        LTORG

;===========================================================================

; This is the call to change from one floating point context to another. See
; "src.main" for a more detailed description of this routine.

core_changecontext

        STMFD   Rsp!,{R1,R2,R3,LR}

; We just need to do a call to core_deactivatecontext followed by one to
; core_activatecontext. Ensure that core_deactivatecontext will return to
; the correct point in core_activatecontext, then fall through to
; core_deactivatecontext.

        ADR     LR,core_activatecontext_common

;===========================================================================

; The following call deactivates the current floating point context,
; ensuring that everything about the context is held in memory. See
; "src.main" for a more detailed description of this call.
;   This call is in fact set up to be idempotent - i.e. deactivating the
; current context and then deactivating it again produces just the same
; results as deactivating it once only. This isn't part of the defined
; interface to the veneer, but is useful in some internal uses of this
; routine.

core_deactivatecontext

; Find out what the current context is.

        ASSERT  (:BASE:CurrentContext) = Rwp
        AdrWS   R0
        LDR     R0,[R0,#:INDEX:CurrentContext]

; If it is zero, we're done.

        TEQ     R0,#0
        MOVEQ   PC,LR

; Store away return link and a scratch register.

        STMFD   Rsp!,{R1,LR}

        [ SCWanted:LAND:FPEWanted

; Split according to whether this is a hardware or software context.

          ASSERT  (:BASE:MemFPSR) = Rwp
          LDR     R1,[R0,#:INDEX:MemFPSR]
          TEQ     R1,#0
          BPL     core_deactivatecontext_FPE

        ]

        [ SCWanted

core_deactivatecontext_SC

; It's a hardware context. Start by getting the FPCR value.

          RFC     R1

; We can do what is needed by:
;
; (a) storing the FPSR and register values regardless;
; (b) going to state INACTIVE_PE if the AB bit is set, INACTIVE if the AB
;     bit is clear;
; (c) updating the stored exception info if we're going from ACTIVE_PE to
;     INACTIVE_PE;
;
; Combining (b) and (c), we find that we can calculate the new FPCR value
; and value to go into 'DisableInfo' as follows:
;   new SB = 0;
;   new AB = new DA = current AB bit;
;   other new bits come from real FPCR if current DA = 0, from current
;     'DisableInfo' if current DA = 1;

          ASSERT  (:BASE:DisableInfo) = Rwp
          TST     R1,#DA_bit
          MOVEQ   LR,R1
          LDRNE   LR,[R0,#:INDEX:DisableInfo]
          BIC     LR,LR,#DA_bit+SB_bit+AB_bit
          TST     R1,#AB_bit
          ORRNE   LR,LR,#DA_bit+AB_bit
          STR     LR,[R0,#:INDEX:DisableInfo]

; Now store away the FPSR and registers.

          ASSERT  (:BASE:MemFPSR) = Rwp
          RFS     R1
          STR     R1,[R0,#:INDEX:MemFPSR]

          ASSERT  (:BASE:SC_RegDump) = Rwp
          SFM     F0,4,[R0,#:INDEX:SC_RegDump]
          SFM     F4,4,[R0,#(:INDEX:SC_RegDump)+48]

; Finally, write the value calculated earlier to the real FPCR.

          WFC     LR

          LDMFD   Rsp!,{R1,PC}

        ]

        [ FPEWanted

core_deactivatecontext_FPE

          MOV     LR,#0
          ASSERT  (:BASE:DisableInfo) = Rwp
          STR     LR,[R0,#:INDEX:DisableInfo]

          LDMFD   Rsp!,{R1,PC}

        ]

;===========================================================================

; This is the call that will actually install a suitable undefined
; instruction handler. See "src.main" for a more detailed description of
; this routine.

core_activatecontext

        STMFD   Rsp!,{R1,R2,R3,LR}

core_activatecontext_common

; Store away the new context.

        ASSERT  (:BASE:CurrentContext) = Rwp
        AdrWS   R3
        STR     Rwp,[R3,#:INDEX:CurrentContext]

; Get the hardware ID.

        ASSERT  (:BASE:HardwareID) = Rwp
        LDR     R3,[R3,#:INDEX:HardwareID]

; If this is the FPA hardware, ensure it is enabled by reading the FPCR.
; (Note that this is necessary in order to ensure we can do subsequent
; operations on it, including disabling it!)

        TEQ     R3,#SysID_FPA
        BNE     %FT01
        RFC     R1
01

; If this is a null context, we want to have no handlers present.

        TEQ     Rwp,#0
        BEQ     core_activatecontext_nohandlers

        [ FPASCWanted
; If both FPA hardware and software are available, we want to load up the
; FPA with the context and start up the FPASC handlers.

          TEQ     R3,#SysID_FPA
          BEQ     core_activatecontext_FPASChandlers
        ]

        [ FPEWanted
; If the FPE software is present, we want to start up the FPE handlers and
; disable the FPA if it is present.

core_activatecontext_FPEhandlers

; Ensure the FPA is disabled, then install the FPE handlers.

          TEQ     R3,#SysID_FPA
          BNE     %FT01
          MOVEQ   R1,#SB_bit+AB_bit+DA_bit
          WFCEQ   R1
01
          [ :LNOT::DEF:AssumedHardware
            [ UndefHandStandAlone
              ADRL    R1,FPEUndefHandler
            ]

            [ UndefHandBranchTable
              ADRL    R1,FPEUndefHandler_Coproc1
              ADRL    R2,FPEUndefHandler_Coproc2
            ]

            BL      veneer_newhandlers
          ]

          LDMFD   Rsp!,{R1,R2,R3,PC}

        ]

core_activatecontext_nohandlers

; We get here if either a null context was requested (Rwp=0), or the wrong
; hardware was present and no FPE was assembled. The latter is basically
; just a "fail-safe": a veneer that doesn't include the FPE ought to go
; seriously wrong if the wrong hardware is present.

; Ensure the FPA is disabled, then put back the previous owner's handler.

        TEQ     R3,#SysID_FPA
        BNE     %FT01
        MOVEQ   R1,#SB_bit+AB_bit+DA_bit
        WFCEQ   R1
01
        [ :DEF:AssumedHardware
          LDMFD   Rsp!,{R1,R2,R3,PC}
        |
          LDMFD   Rsp!,{R1,R2,R3,LR}
          B       veneer_restorehandlers
        ]

        [ FPASCWanted

core_activatecontext_FPASChandlers

; Load up FPSR and F0-F7 from the values in the context, then install the
; FPASC handlers.

          LDR     R1,MemFPSR
          WFS     R1

Tempa     SETA            :BASE:SC_RegDump
          [ Tempa = 15
Tempa2      SETA            SC_RegDump-({PC}+8)
          |
Tempa2      SETA            :INDEX:SC_RegDump
          ]
          LFM     F0,4,[R$Tempa,#Tempa2]

Tempa     SETA            :BASE:SC_RegDump
          [ Tempa = 15
Tempa2      SETA            SC_RegDump-({PC}+8)
          |
Tempa2      SETA            :INDEX:SC_RegDump
          ]
          LFM     F4,4,[R$Tempa,#Tempa2+48]

          [ :LNOT::DEF:AssumedHardware
            [ UndefHandStandAlone
              ADRL    R1,FPASCUndefHandler
            ]

            [ UndefHandBranchTable
              ADRL    R1,FPASCUndefHandler_Coproc1
              ADRL    R2,FPASCUndefHandler_Coproc2
            ]

            BL      veneer_newhandlers
          ]

; Finally, put the system into the correct state. This simply involves
; leaving it enabled if the context does not contain a pending exception,
; and putting it into the INACTIVE_PE state if the context does contain a
; pending exception.

          LDR     R1,DisableInfo
          TST     R1,#AB_bit
          MOVNE   R1,#DA_bit+AB_bit
          WFCNE   R1

          LDMFD   Rsp!,{R1,R2,R3,PC}

        ]

;===========================================================================

        LTORG

;===========================================================================

; This call shuts down the FPASC/FPE world entirely. See "src.main" for a
; more detailed description of this routine.

core_shutdown

        STMFD   Rsp!,{Rwp,LR}
        MOV     Rwp,#0
        BL      core_activatecontext
        LDMFD   Rsp!,{Rwp,PC}

;===========================================================================

; The following call is used to temporarily disable the floating point
; system. See "src.main" for a more detailed description.

core_disable

; Find out what the current context is.

        ASSERT  (:BASE:CurrentContext) = Rwp
        AdrWS   R0
        LDR     R0,[R0,#:INDEX:CurrentContext]

; If it is zero, we're done.

        TEQ     R0,#0
        MOVEQ   PC,LR

        [ SCWanted:LAND:FPEWanted

; Split according to whether this is a hardware or software context.

          ASSERT  (:BASE:MemFPSR) = Rwp
          LDR     R1,[R0,#:INDEX:MemFPSR]
          TEQ     R1,#0
          BPL     core_disable_FPE

        ]

        [ SCWanted

core_disable_SC

; Read the FPCR.

          RFC     R1

; Use the old exception information if DA=1, new information if DA=0.

          TST     R1,#DA_bit
          MOVEQ   R2,R1
          ASSERT  (:BASE:DisableInfo) = Rwp
          LDRNE   R2,[R0,#:INDEX:DisableInfo]

; Force DA and SB to 1 to generate the correct state - either DISABLED or
; DISABLED_PE.

          ORR     R2,R2,#DA_bit+SB_bit
          STR     R2,[R0,#:INDEX:DisableInfo]
          WFC     R2
          MOV     PC,LR

        ]

        [ FPEWanted

core_disable_FPE

          MOV     R1,#1
          ASSERT  (:BASE:DisableInfo) = Rwp
          STR     R1,[R0,#:INDEX:DisableInfo]
          MOV     PC,LR

        ]

;===========================================================================

; The following call is used to re-enable the floating point system after a
; call to 'core_disable'. See "src.main" for a more detailed description.

core_enable

; Find out what the current context is.

        ASSERT  (:BASE:CurrentContext) = Rwp
        AdrWS   R0
        LDR     R0,[R0,#:INDEX:CurrentContext]

; If it is zero, we're done.

        TEQ     R0,#0
        MOVEQ   PC,LR

        [ SCWanted:LAND:FPEWanted

; Split according to whether this is a hardware or software context.

          ASSERT  (:BASE:MemFPSR) = Rwp
          LDR     R1,[R0,#:INDEX:MemFPSR]
          TEQ     R1,#0
          BPL     core_enable_FPE

        ]

        [ SCWanted

core_enable_SC

; Read the FPCR.

          RFC     R1

; If there is no pending exception, this has re-entered the ACTIVE state, as
; required, and we're done.

          TST     R1,#AB_bit
          MOVEQ   PC,LR

; Otherwise, we must use the old exception information if DA=1, new
; information if DA=0.

          TST     R1,#DA_bit
          MOVEQ   R2,R1
          ASSERT  (:BASE:DisableInfo) = Rwp
          LDRNE   R2,[R0,#:INDEX:DisableInfo]

; Force DA to 1 and SB to 0 to generate the correct state - i.e. INACTIVE_PE.

          ORR     R2,R2,#DA_bit
          BIC     R2,R2,#SB_bit
          STR     R2,[R0,#:INDEX:DisableInfo]

; Now store away the FPSR and registers.

          ASSERT  (:BASE:MemFPSR) = Rwp
          RFS     R1
          STR     R1,[R0,#:INDEX:MemFPSR]

          ASSERT  (:BASE:SC_RegDump) = Rwp
          SFM     F0,4,[R0,#:INDEX:SC_RegDump]
          SFM     F4,4,[R0,#(:INDEX:SC_RegDump)+48]

; Write back the FPCR value we calculated earlier and return.

          WFC     R2
          MOV     PC,LR

        ]

        [ FPEWanted

core_enable_FPE

          MOV     R1,#0
          ASSERT  (:BASE:DisableInfo) = Rwp
          STR     R1,[R0,#:INDEX:DisableInfo]
          MOV     PC,LR

        ]

;===========================================================================

        LTORG

;===========================================================================

; The following call is used to interrogate a floating point context. See
; "src.main" for a more detailed explanation.

core_savecontext

        STMFD   Rsp!,{R1-R7,LR}

        [ SCWanted:LAND:FPEWanted

; First thing to do is find out whether we're dealing with a hardware or
; software context.

          LDR     R2,MemFPSR
          TEQ     R2,#0
          BPL     core_savecontext_FPE

        ]

        [ SCWanted

core_savecontext_SC

; SC context register "stride" is 3 words.

          MOV     R7,#3*4

; If this is the current floating point context, we're going to need to
; transfer its contents to memory.

          ASSERT  (:BASE:CurrentContext) = Rwp
          AdrWS   R2
          LDR     R2,[R2,#:INDEX:CurrentContext]

          TEQ     R2,R10
          LDRNE   R6,DisableInfo
          BNE     core_savecontext_SC_common

; Read the FPCR, which enables the FPA.

          RFC     R6

; Now we can transfer the FPSR and register values to the context.

          RFS     R2
          STR     R2,MemFPSR

          ASSERT  (:BASE:SC_RegDump) = Rwp
          SFM     F0,4,[Rwp,#:INDEX:SC_RegDump]
          SFM     F4,4,[Rwp,#(:INDEX:SC_RegDump)+48]

; We can return to the original state simply by writing the value we read
; for the FPCR back to the chip - only the DA, AB and SB bits will be
; written, but they're the only ones that have changed anyway!

          WFC     R6

core_savecontext_SC_common

; There's a pending exception if R6 has the AB bit set at this point.

          AND     R6,R6,#AB_bit

          ASSERT  (:BASE:SC_RegDump) = Rwp
          ASSERT  (:INDEX:SC_RegDump) = 0

          [ FPEWanted
            B       core_savecontext_combined
          ]

        ]

        [ FPEWanted

core_savecontext_FPE

; FPE context register "stride" is 3 or 4 words, depending on assembly
; options, and there's never a pending exception.

          [ FPE4WordsPerReg
            MOV     R7,#4*4
          |
            MOV     R7,#3*4
          ]
          MOV     R6,#0

          ASSERT  (:BASE:FPE_Regs) = Rwp
          ASSERT  (:INDEX:FPE_Regs) = 0

        ]

core_savecontext_combined

        LDR     R2,MemFPSR
        STR     R2,[R0],#4

        MOV     R2,#8

core_savecontext_loop

        ASSERT  OP2sue = R3
        ASSERT  OP2mhi = R4
        ASSERT  OP2mlo = R5
        LDMIA   Rwp,OP2regs
        ADD     Rwp,Rwp,R7

; Now comes the fun... we've got an internal format number, and we've got to
; change it into an extended precision number. First, if the uncommon bit is
; zero, we're OK unless it's an unnormalised URD result.

        TST     OP2sue,#Uncommon_bit
        BEQ     core_savecontext_common

; If it's uncommon, we need to clear the uncommon bit. If the units bit is
; clear, we need to check for infinities and NaNs and normalise otherwise.

        BIC     OP2sue,OP2sue,#Uncommon_bit
        TST     OP2mhi,#EIUnits_bit
        BEQ     core_savecontext_normalise

; Otherwise, we're definitely going to want to clear the units bit. If the
; top bit of the exponent is 1, we can simply force the exponent to its
; maximum; if it is zero, we increment the exponent and treat as an
; unnormalised number.

        BIC     OP2mhi,OP2mhi,#EIUnits_bit
        TST     OP2sue,#1:SHL:(EIExp_pos + EIExp_len - 1)
        ADDEQ   OP2sue,OP2sue,#1:SHL:EIExp_pos
        BEQ     core_savecontext_normalise
        ORR     OP2sue,OP2sue,#(NaNInfExp_Extended):AND:&FF
        ORR     OP2sue,OP2sue,#(NaNInfExp_Extended):AND:&FF00
        ASSERT  NaNInfExp_Extended < &10000
        B       core_savecontext_converted

core_savecontext_common

        TST     OP2mhi,#EIUnits_bit
        BNE     core_savecontext_converted

core_savecontext_normalise

        STMFD   Rsp!,{Rarith,Rtmp,Rtmp2}
        ASSERT  EIExp_pos = 0
        MOV     Rarith,OP2sue,LSL #32-EIExp_len
        ADDS    Rtmp,Rarith,#1:SHL:(32-EIExp_len)       ;Let infinities &
        BLNE    NormDenormOp2                           ; NaNs through
        LDMFD   Rsp!,{Rarith,Rtmp,Rtmp2}

core_savecontext_converted

        STMIA   R0!,OP2regs

        SUBS    R2,R2,#1
        BNE     core_savecontext_loop

; Check whether PC value in range, and indicate partially processed
; exception if so; otherwise, use the pending exception information.

        ADRL    R2,FP_UndefHandlers_Start
        ADRL    R3,FP_UndefHandlers_End-4
        CMP     R1,R2
        CMPGE   R3,R1
        MOVGE   R0,#1
        MOVLT   R0,R6

        LDMFD   Rsp!,{R1-R7,PC}

;===========================================================================

; The following call is used to load a floating point context. See
; "src.main" for a more detailed explanation.

core_loadcontext

        STMFD   Rsp!,{R0-R7,LR}

        [ SCWanted

; Get the memory copy of the FPSR - we're only interested in the system ID
; byte.

          LDR     R1,MemFPSR

          [ FPEWanted :LAND: FPE4WordsPerReg

; Determine the "stride" required if it differs between hardware and
; software contexts.

            ANDS    R1,R1,#SysID_mask
            MOVPL   R7,#4*4
            MOVMI   R7,#3*4

          |

            AND     R1,R1,#SysID_mask 

          ]

; Transfer the loaded values to the memory context. Start with the FPSR,
; which should have the value specified by the user, except that the system
; ID byte should come from the memory copy of the FPSR.

          LDR     R2,[R0],#4
          BIC     R2,R2,#SysID_mask
          ORR     R2,R2,R1
          STR     R2,MemFPSR

        |               ;IF :LNOT:SCWanted

; Transfer the loaded values to the memory context. Start with the FPSR.,
; which should have the value specified by the user, except that the system
; ID byte should be the correct one for the FPE.

          LDR     R2,[R0],#4
          BIC     R2,R2,#SysID_mask
          ORR     R2,R2,#SysID_FPE:SHL:SysID_pos
          STR     R2,MemFPSR

        ]

; Now the registers.

        MOV     R2,#8

core_loadcontext_loop

        ASSERT  OP2sue = R3
        ASSERT  OP2mhi = R4
        ASSERT  OP2mlo = R5
        LDMIA   R0!,OP2regs

        [       FPEWanted :LOR: FPASCWanted

; We've got to calculate an appropriate uncommon bit to go with each number.
; The uncommon bit should be one if the exponent is &7FFF or if the units
; bit is 0, except that the uncommon bit should be zero if the number is in
; fact zero.

          ORR     R6,OP2mhi,OP2mlo        ;Test for zero
          ORRS    R6,R6,OP2sue,LSL #1
          BEQ     core_loadcontext_converted
          ASSERT  EIExp_pos = 0
          MOV     R6,OP2sue,LSL #32-EIExp_len
          ADDS    R6,R6,#1:SHL:(32-EIExp_len)
          TSTNE   OP2mhi,#EIUnits_bit
          ORREQ   OP2sue,OP2sue,#Uncommon_bit

core_loadcontext_converted

        ]

        [ SCWanted
          ASSERT  (:BASE:SC_RegDump) = Rwp
          ASSERT  (:INDEX:SC_RegDump) = 0
        ]
        [ FPEWanted
          ASSERT  (:BASE:FPE_Regs) = Rwp
          ASSERT  (:INDEX:FPE_Regs) = 0
        ]

        [ FPEWanted:LAND:FPE4WordsPerReg
          STMIA   Rwp,OP2regs
          [ SCWanted
            ADD     Rwp,Rwp,R7
          |
            ADD     Rwp,Rwp,#16
          ]
        |
          STMIA   Rwp!,OP2regs
        ]

        SUBS    R2,R2,#1
        BNE     core_loadcontext_loop

        [ FPEWanted:LAND:FPE4WordsPerReg
          [ SCWanted
            SUB     Rwp,Rwp,R7,LSL #3
          |
            SUB     Rwp,Rwp,#128
          ]
        |
          SUB     Rwp,Rwp,#96
        ]

; We're done if this is a software context; otherwise, we must check whether
; it is the current context and load the FPA itself if so.

        [ SCWanted

          [ FPEWanted
            TEQ     R1,#0
            LDMPLFD Rsp!,{R0-R7,PC}         ;PL here if a software context
          ]

          ASSERT  (:BASE:CurrentContext) = Rwp
          AdrWS   R2
          LDR     R2,[R2,#:INDEX:CurrentContext]

          TEQ     R2,R10
          LDMNEFD Rsp!,{R0-R7,PC}

; Read the FPCR, which enables the FPA.

          RFC     R6

; Now we can transfer the FPSR and register values to the context.

          LDR     R2,MemFPSR
          WFS     R2

          ASSERT  (:BASE:SC_RegDump) = Rwp
          LFM     F0,4,[Rwp,#:INDEX:SC_RegDump]
          LFM     F4,4,[Rwp,#(:INDEX:SC_RegDump)+48]

; We can return to the original state simply by writing the value we read
; for the FPCR back to the chip - only the DA, AB and SB bits will be
; written, but they're the only ones that have changed anyway!

          WFC     R6

        ]

        LDMFD   Rsp!,{R0-R7,PC}

;===========================================================================

        LTORG

;===========================================================================

        END
