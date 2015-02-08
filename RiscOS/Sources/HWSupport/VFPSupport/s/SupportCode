; 
; Copyright (c) 2014, RISC OS Open Ltd
; All rights reserved.
; 
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met: 
;     * Redistributions of source code must retain the above copyright
;       notice, this list of conditions and the following disclaimer.
;     * Redistributions in binary form must reproduce the above copyright
;       notice, this list of conditions and the following disclaimer in the
;       documentation and/or other materials provided with the distribution.
;     * Neither the name of RISC OS Open Ltd nor the names of its contributors
;       may be used to endorse or promote products derived from this software
;       without specific prior written permission.
; 
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; POSSIBILITY OF SUCH DAMAGE.
; 

; VFP support code
;
; This is a software implementation of a subset of the VFPv3 instruction set,
; in order to allow floating point exceptions to be generated, and to help
; the hardware deal with some situations it can't cope with itself

; Control whether we check for D16/D32 register limits
; classify() will do the checks for us, so the checks in this assembler code
; should be redundant (including for instructions fetched from FPINST/FPINST2,
; as only valid instructions should arrive there)
        GBLL    CheckD16
CheckD16 SETL   {FALSE}

XFlag_Synchronous      * 1 ; This is a synchronous exception; return to lr_und instead of lr_und-4, and expect to see unexpected instructions
 [ (MaxDRegs > 16) :LAND: CheckD16
XFlag_D16              * 16 ; Hardware has 16 D regs
 ]

; Register usage:
; r0-r3 = temp or APCS inputs/outputs, caller save
; r12 = temp. r12 only used as module workspace when needed

; Argument registers
; hi & lo variants are for doubleword code
xa      RN        r0
xb      RN        r1

xalo    RN        r0
xahi    RN        r1
xblo    RN        r2
xbhi    RN        r3

x0      RN        r4  ; Callee save work registers
x1      RN        r5
x2      RN        r6

xflags  RN        r7  ; XFlags
xins    RN        r8  ; Instruction being handled (TheInstruction)
xregs   RN        r9  ; VFP register dump ptr 
xwp     RN        r10 ; Exception workspace ptr - must be SL for access by C
xctx    RN        r11 ; VFP context (TheContext)

; Extra FP work register which aliases x0 & x1
xc      RN        r4
xclo    RN        r4
xchi    RN        r5

        ; Debugging macro to print out the label name each time it's passed
        MACRO
$label  TRACE
$label
        Debug   x, "$label"
        MEND

; Location of register fields in VFP CDP instructions
D_big    * 12 ; Bits 12-15
D_little * 22 ; Bit 22
N_big    * 16 ; Bits 16-19
N_little * 7 ; Bit 7
M_big    * 0 ; Bits 0-3
M_little * 5 ; Bit 5

;
; This entry point is called whenever our undefined instruction handler is
; entered with:
;
; (a) the VFP coprocessor enabled (or believed to be enabled)
; (b)
;     (i) FPSCR.EX or FPSCR.DEX set (standard SupportHandler)
;     or
;     (ii) we might need to emulate a short vector operation (SupportHandlerSV)
;
; Entry:
; UND mode, IRQs disabled
; r12 = workspace
; r12_und stacked
; R0-R11, R14, SPSR unmodified from exception entry
;

; Prologue is held in a macro so we can easily create different versions for
; each VFP subarchitecture
        MACRO
        VFPSupportCodePrologue
        ; Get the user's r13-r14, and then switch to SVC mode so we can
        ; safely enable interrupts later down the line
        Push    "r8-r11,r14"
        MRS     r11, SPSR               ; Get the SPSR
        ADD     r10, r13, #16           ; Remember where these are
        ANDS    r9, r11, #&F            ; Get the exception mode
        ASSERT  (USR32_mode :AND: &F) = 0
        ORREQ   r9, r9, #SYS32_mode     ; Use SYS mode instead of USR
        ORR     r9, r9, #USR32_mode+I32_bit ; 32bit mode, interrupts off
        MSR     CPSR_c, r9              ; Into the exception mode
        MOV     r8, r13
        MOV     r9, r14
        MSR     CPSR_c, #SVC32_mode+I32_bit ; Into SVC mode ready for IRQ enable later on
        ; Store the exception registers on the stack
        Push    "r11,r14"               ; SPSR_und, lr_svc
        LDR     r11, [r10, #0]          ; lr_und
        Push    "r8-r9,r11"             ; r13, r14, lr
        LDR     r11, [r10, #4]          ; r12
        LDMDB   r10!, {r8-r9}           ; r10-r11
        Push    "r8-r9,r11"             ; r10-r12
        LDMDB   r10!, {r8-r9}           ; r8-r9
        Push    "r0-r9"                 ; r0-r9
        myVMRS  , r3, FPEXC
        ; Reserve space for the rest of the workspace frame
        SUB     sp, sp, #UserRegisters
        MOV     xwp, sp
        STR     r12, [xwp, #Workspace]
        LDR     xctx, ActiveContext
        STR     xctx, [xwp, #TheContext]
        ; Do some sanity checks
        LDRB    r2, CPEnabledFlag
        CMP     xctx, #0                ; We must have an active context
        TSTNE   r3, #FPEXC_EN           ; The coprocessor must be enabled
        CMPNE   r2, #0                  ; And we should think it's enabled
        BEQ     VFPSupportCode_BadState
        ; So it looks like we've got a valid exception condition
        ; Serialise this context by nonlazily deactivating it
        MOV     r0, #0
        MOV     r1, #0
        BL      SWI_ChangeContext
        BVS     VFPSupportCode_Oops
        ; Restore user's IRQ state
        LDR     r4, [xwp, #UserPSR]
        TST     r4, #I32_bit
        MSREQ   CPSR_c, #SVC32_mode
        ; Set up some more workspace values
        STR     r3, [xwp, #TheFPEXC]
        LDR     r4, CRelocOffset
        STR     r4, [xwp, #XCRelocOffset]
        LDR     x0, [xctx, #Context_FPSCR]
        AND     x1, x0, #FPSCR_RMODE_MASK
        AND     x2, x0, #FPSCR_ENABLE_FLAGS ; n.b. always zero if trapped exceptions not supported by HW
        MOV     x1, x1, LSR #FPSCR_RMODE_SHIFT ; x1 = RoundingMode
        ASSERT  XFlags = RoundingMode+1
      [ (MaxDRegs > 16) :LAND: CheckD16
        LDRB    xflags, NumVFPRegs
        ASSERT  XFlag_D16 = 16
        AND     xflags, xflags, #16
        ORR     x1, x1, xflags, LSL #8
      |
        MOV     xflags, #0
      ]
        ASSERT  ExceptionFlags = RoundingMode+2
        ASSERT  ExceptionEnable = RoundingMode+3
        ASSERT  FPSCR_IOE = 1<<8
        ORR     x1, x1, x2, LSL #16     ; Merge enable flags into correct pos
        ASSERT  (RoundingMode :AND: 3) = 0
        STR     x1, [xwp, #RoundingMode] ; Rounding mode, exception enable flags, XFlags set. Exception state and synchronous flag cleared.
        ADD     xregs, xctx, #Context_RegDump ; Assume no FSTMX format word

      [ debugx
        Debug   x, "Beginning exception processing"
        LDR     r1, [xwp, #UserRegisters+15*4]
        Debug   x, "lr_und =", r1
        LDR     r0, [r1, #-4]
        Debug   x, "[lr_und-4]", r0
        SWI     XDebugger_Disassemble
        DebugS  x, "=", r1
        LDR     r0, [xwp, #UserPSR]
        Debug   x, "PSR ", r0
        MOV     r0, xctx
        MOV     r1, #VFPSupport_ChangeContext_Lazy
        BL      SWI_ChangeContext
        ADRL    r0, showvfpregs
        SWI     XOS_CLI
        MOV     r0, #0
        MOV     r1, #0
        BL      SWI_ChangeContext
      ]
        MEND
        ; On exit from the prologue macro, we're making use of the register
        ; names as defined above

        ; xwp = exception workspace
        ; xctx = context
        ; xregs = registers
        ; r12 = module workspace (for the moment)
        ; x0 = FPSCR (for the moment) - required for SubArchV1 handling

VFPSupportCode_SubArchV1 ROUT
        VFPSupportCodePrologue

        ; Deal with VFP subarchitecture v1 quirk
        ; When FPSCR.IXE is set, all exceptions are synchronous, and require
        ; us to grab the instruction directly from [lr_und-4] (FPEXC.DEX won't
        ; be set, and most fields of FPEXC are to be ignored)
        TST     x0, #FPSCR_IXE
        LDR     xins, [xctx, #Context_FPINST]
        BEQ     VFPSupportCode_NextInstruction

        ; IXE in effect
        Debug   x, "Is IXE synchronous exception"

VFPSupportCode_Synchronous
        LDR     r0, [xwp, #UserRegisters+15*4]
        LDR     xins, [r0, #-4]
        ORR     xflags, xflags, #XFlag_Synchronous
        STRB    xflags, [xwp, #XFlags]      ; Set XFlags appropriately

        ;
        ; Check that this really is a VFP CDP instruction we're looking at. Even
        ; though this is a synchronous exception, there are a number of
        ; situations in which the (ARM11/VFP11) hardware can get it wrong and
        ; trigger an exception for an instruction which is meant to be handled
        ; by someone else. It's also possible for exceptions to be triggered
        ; for VFP instructions which shouldn't be capable of generating
        ; exceptions (VSTMIA), and for invalid VFP instructions (e.g. requiring
        ; VFP3, D32, etc.). If we handle one of these cases incorrectly we
        ; might get stuck in an abort loop where the same instructions bounces
        ; to the support code again and again. See test3 and test6 for plenty
        ; of examples.
        ;
        ; This means that our processing flow for inexact exceptions needs to
        ; be as follows:
        ;
        ; 1. Examine the instruction. If it's a VFP instruction, determine the
        ;    full details (VFP version required, D32 support, double/single
        ;    word registers, etc.)
        ; 2. If it's not a VFP instruction, or it's a VFP instruction which
        ;    the hardware shouldn't support, clear the exception state and pass
        ;    it on to the next handler
        ; 3. If it's a valid VFP instruction, but it's not a data processing
        ;    instruction, clear the exception state and retry the instruction.
        ;    It should execute OK the 2nd time around
        ; 4. Otherwise it must be a valid VFP data processing instruction - in
        ;    which case perform the calculation in software and raise exceptions
        ;    as appropriate.
        ;

        ; For (1), we rely on classify() to examine the instruction and
        ; determine what it is.
        LDR     x1, BadClasses
        MOV     r0, xins
        IMPORT  classify
        BL      classify
        Debug   x, "Instr classes vs. BadClasses", r0, x1
        ; Check for any flags which indicate (2)
        TST     r0, x1
        BNE     VFPSupportCode_PassOn
        ; Check for (4)
        TST     r0, #CLASS_NOT_CDP
        MOV     r0, #FPEXC_EX+FPEXC_EN  ; Fake FPEXC to modify
        BEQ     VFPSupportCode_CalcVECITR ; Instruction looks good, process it
        ; Must be case (3)
        Debug   x, "Looks like fake exception on non-CDP"
        ; By clearing the synchronous flag, we can exit via VFPSupportCode_Done
        BIC     xflags, xflags, #XFlag_Synchronous
        STR     r0, [xwp, #TheFPEXC]
        STRB    xflags, [xwp, #XFlags]
        B       VFPSupportCode_Done

VFPSupportCode_SV ROUT
        ; Support code for when we just want to emulate short vectors
        Pull    "r11" ; Pop r11 for compatibility with standard prologue
        ; Fall through...
VFPSupportCode_SubArchV2 ROUT
        VFPSupportCodePrologue

      [ {FALSE}
        ; TODO - Deal with synchronous exceptions for SubArchV2

        ; Examine the instruction in FPINST
        ;
        ; The ARMv7 ARM indicates that only CDP instructions are capable of
        ; being stored in the FPINST/FPINST2 registers
        ;
        ; Using the field names from the ARMv7 ARM, VFP CDP instructions have
        ; the following format:
        ;
        ; 1110 1110 aaaa bbbb ---- 101- cc-0 dddd
        ; Where aaaa = opc1
        ;       bbbb = opc2
        ;       cc = opc3
        ;       dddd = opc4
        ;
        ; Note that condition code is set to 1110 by the hardware, but we'll
        ; skip checking it here in order to simplify things when dealing with
        ; synchronous exceptions
        LDR     xins, [xctx, #Context_FPINST]
      |
        ; Partial SubArchV2/V3 implementation for Cortex-A7, A9, A15
        ; All we need to do is branch to our synchronous exception handling code
        B       VFPSupportCode_Synchronous
      ]

VFPSupportCode_NextInstruction
        Debug   x, "Processing instruction", xins
        STR     xins, [xwp, #TheInstruction]
      [ {FALSE} ; Paranoia checks. These shouldn't be necessary.
        AND     r0, xins, #&F000000
        AND     r1, xins, #&E10
        TEQ     r0, #&E000000
        TEQEQ   r1, #&A00
        BNE     VFPSupportCode_Unexpected
      ]
        ; Check whether double or single precision
        TST     xins, #&100
        BNE     CDP_D
        B       CDP_S

VFPSupportCode_NotCDP TRACE
        ; Arrive here when the braindead coprocessor triggered a VFP exception
        ; for something that didn't need it. This could be either a (supposedly)
        ; exception-free VFP instruction such as VSTMIA, or some other kind of
        ; undefined instruction (FPA instruction, genuine UDF, etc.)
        ; Deal with it by clearing the exception state from FPEXC and retrying
        ; the instruction. And pray that we don't get stuck in a loop due to
        ; the coprocessor seeing another VFP instruction further on.
        BIC     xflags, xflags, #XFlag_Synchronous
        STRB    xflags, [xwp, #XFlags]
       [ debugx
        B       VFPSupportCode_Done ; Skip debug spam
       ]

AdvanceToNext_Scalar TRACE
        ; Arrive here after processing a scalar instruction
        ; Currently we don't need to do anything special, so just fall through
VFPSupportCode_Done ROUT
        ; Top-level routine
        ;
        ; Arrive here once all processing for an instruction has been performed
        ;
        ; First check if there were any exceptions which we haven't reported
        ASSERT  ExceptionEnable = ExceptionFlags+1
        ASSERT  (ExceptionFlags :AND: 1) = 0
        LDRH    r1, [xwp, #ExceptionFlags]
        ANDS    r0, r1, r1, LSR #8
        BNE     VFPSupportCode_RaiseException
        ; Now check to see if we have a second instruction to process
        LDR     r0, [xwp, #TheFPEXC]
        TST     r0, #FPEXC_FP2V
        BNE     %FT50
        ; Need to clear exception state from FPEXC, restore the context, and
        ; exit
        LDR     r2, [xctx, #Context_FPSCR]
        MOV     r0, #FPEXC_EN           ; All exception flags must be cleared
        ORR     r2, r2, r1              ; Update cumulative exceptions in FPSCR
        STR     r0, [xctx, #Context_FPEXC]
        MOV     r0, xctx
        STRB    r2, [xctx, #Context_FPSCR]
        MOV     r1, #0                  ; Non-lazy activation - if there was an exception we can be fairly certain this context is being used
        LDR     r12, [xwp, #Workspace]
        BL      SWI_ChangeContext
      [ debugx
        Debug   x, "Done, final context state follows"
        ADRL    r0, showvfpregs
        SWI     XOS_CLI
      ]
        ; Now resume execution
        LDRB    r0, [xwp, #XFlags]
        ADD     sp, sp, #UserRegisters
        TST     r0, #XFlag_Synchronous
        Pull    "r0-r7"                 ; r0-r7
        ADD     sp, sp, #8*4            ; Skip r8-r12 (will restore from UND stack), r13-r14 from exception mode, lr_und
        Pull    "r8,r14"                ; Recover SPSR_und, lr_svc
        MSR     CPSR_c, #UND32_mode+I32_bit ; Back to UND
        MSR     SPSR_cxsf, r8           ; Restore SPSR ready for return
        Pull    "r8-r11,r14"            ; Restore UND stack frame
        Pull    "r12"
        ADDNE   lr, lr, #4              ; Skip ahead if exception was synchronous
        SUBS    pc, lr, #4              ; And retry the instruction that aborted

50
        Debug   x, "Processing FPINST2"
        ; Deal with 2nd instruction (FPINST2)
        BIC     r0, r0, #FPEXC_FP2V
        LDR     xins, [xctx, #Context_FPINST2]
        BIC     r0, r0, #FPEXC_VECITR_MASK
        LDR     x0, [xctx, #Context_FPSCR]
        ; Fall through...

VFPSupportCode_CalcVECITR
        Debug   x, "CalcVECITR for xins =", xins
        ; Calculate VECITR value for an instruction
        ; r0 = FPEXC, with VECITR cleared
        ; x0 = FPSCR
        ; xins = instruction
        ;
        ; Choice of vector/scalar is determined by destination register, and
        ; conveniently the scalar bank numbering means that we only need to
        ; test bits 14 & 15 of the instruction to determine if the destination
        ; is scalar or vector
        TST     xins, #3<<14
        ; We also need to make sure FPSCR.LEN isn't zero
        ANDNES  x0, x0, #FPSCR_LEN_MASK
        DebugIf EQ, x, "-> scalar dest or FPSCR.LEN==0"
        BEQ     %FT60
      [ {FALSE} ; These checks are redundant, all scalar instructions now branch to AdvanceToNext_Scalar instead of AdvanceToNext
        ; It could be a vector operation. Check the instruction to make sure
        ; it's capable of vector operations. Supported instructions are:
        ;
        ; cccc 1110 0-00 ---- ---- 101- -0-0 ---- VMLA      
        ; cccc 1110 0-00 ---- ---- 101- -1-0 ---- VMLS      
        ; cccc 1110 0-01 ---- ---- 101- -0-0 ---- VNMLS     
        ; cccc 1110 0-01 ---- ---- 101- -1-0 ---- VNMLA     
        ; cccc 1110 0-10 ---- ---- 101- -0-0 ---- VMUL      
        ; cccc 1110 0-10 ---- ---- 101- -1-0 ---- VNMUL     
        ; cccc 1110 0-11 ---- ---- 101- -0-0 ---- VADD      
        ; cccc 1110 0-11 ---- ---- 101- -1-0 ---- VSUB      
        ; cccc 1110 1-00 ---- ---- 101- -0-0 ---- VDIV      
        ; cccc 1110 1-11 ---- ---- 101- -0-0 ---- VMOV (imm)
        ; cccc 1110 1-11 0000 ---- 101- 01-0 ---- VMOV (reg)
        ; cccc 1110 1-11 0000 ---- 101- 11-0 ---- VABS      
        ; cccc 1110 1-11 0001 ---- 101- 01-0 ---- VNEG      
        ; cccc 1110 1-11 0001 ---- 101- 11-0 ---- VSQRT
        ;
        ; Collapse similar encodings and we end up with just four patterns:
        ;
        ; cccc 1110 0--- ---- ---- 101- ---0 ---- VMLA, VMLS, VNMLS, VNMLA, VMUL, VNMUL, VADD, VSUB
        ; cccc 1110 1-00 ---- ---- 101- -0-0 ---- VDIV      
        ; cccc 1110 1-11 ---- ---- 101- -0-0 ---- VMOV (imm)
        ; cccc 1110 1-11 000- ---- 101- -1-0 ---- VMOV (reg), VABS, VNEG, VSQRT
        ;
        ; If bit 23 is clear it's definitely a vector op
        TST     xins, #1<<23
        DebugIf EQ, x, "-> vector VMLA, VMLS, VNMLS, VNMLS, VMUL, VNMUL, VADD, VSUB"
        BEQ     %FT55
        ; If bits 20-21 and 6 are clear it's VDIV
        ANDS    r1, xins, #3<<20
        BNE     %FT51
        TSTEQ   xins, #1<<6
        DebugIf EQ, x, "-> vector VDIV"
        BEQ     %FT55
        Debug   x, "-> not VDIV"
        B       %FT60
51
        ; Bits 20-21 nonzero. They'd better be 2_11.
        TEQ     r1, #3<<20
        DebugIf NE, x, "-> 20-21 not 2_11"
        BNE     %FT60
        ; If bit 6 is zero, it's VMOV (imm)
        TST     xins, #1<<6
        DebugIf EQ, x, "-> vector VMOV (imm)"
        BEQ     %FT55
        ; Bits 21-23 must be zero
        TST     xins, #7<<21
        DebugIf NE, x, "-> 21-23 not 0"
        BNE     %FT60
        Debug   x, "-> vector VMOV (reg), VABS, VNEG, VSQRT"
55
      |
        Debug   x, "-> could be vector, calculating VECITR appropriately"
      ]
        ; Vector instruction
        ; x0 = FPSCR.LEN
        SUB     x0, x0, #1<<FPSCR_LEN_SHIFT ; Convert to FPEXC value
        ; FPSCR.LEN is guaranteed nonzero at this point, so we don't have to
        ; worry about underflow. Just combine it with the FPEXC value and we're
        ; done.
        ASSERT  FPSCR_LEN_SHIFT > FPEXC_VECITR_SHIFT
        ORR     r0, r0, x0, LSR #FPSCR_LEN_SHIFT-FPEXC_VECITR_SHIFT
        STR     r0, [xwp, #TheFPEXC]
        B       VFPSupportCode_NextInstruction

60
        ; Scalar instruction
        ORR     r0, r0, #7<<FPEXC_VECITR_SHIFT
        STR     r0, [xwp, #TheFPEXC]
        B       VFPSupportCode_NextInstruction

      [ debugx
showvfpregs DCB "*ShowVFPRegs c", 0
        ALIGN
      ]        

        ; Extract D register number, and check for D register limit
        MACRO
        GetRegNo_D $reg, $dest, $nolimit
        ; D32, format is little.big
        AND     $dest, xins, #&F<<$reg._big
      [ (MaxDRegs > 16) :LOR: (("$nolimit" = "") :LAND: CheckD16)
        TST     xins, #1<<$reg._little
      ]
      [ $reg._big > 0
        MOV     $dest, $dest, LSR #$reg._big-1
      |
        MOV     $dest, $dest, LSL #1
      ]
    [ MaxDRegs > 16
        ORRNE   $dest, $dest, #32
      [ ("$nolimit" = "") :LAND: CheckD16
        TSTNE   xflags, #XFlag_D16     ; Check if register limit is in place
      ]
    ]
      [ ("$nolimit" = "") :LAND: CheckD16
        DebugIf NE, x, "$reg >= 16"
        BNE     VFPSupportCode_Undefined
      ]
        MEND

        ; Extract S register number
        MACRO
        GetRegNo_S $reg, $dest
        ; S32, format is big.little
        AND     $dest, xins, #&F<<$reg._big
        TST     xins, #1<<$reg._little
      [ $reg._big > 0
        MOV     $dest, $dest, LSR #$reg._big-1
      |
        MOV     $dest, $dest, LSL #1
      ]
        ORRNE   $dest, $dest, #1
        MEND

        ; Load D register DNM into argument register
        ; Be careful with $name = "" version - you must load xb before xa to
        ; avoid xahi overwriting xb
        MACRO
        LoadReg_D $cc, $arg, $name
      [ "$name" <> ""
        LDR$cc  $arg.lo, [xwp, #Reg_$name]
        ADD$cc  $arg.lo, xregs, $arg.lo, LSL #2
      |
        ADD$cc  $arg.lo, xregs, $arg, LSL #2
      ]
        LDMIA$cc $arg.lo, {$arg.lo, $arg.hi}
        DebugIf $cc, x, "LoadReg_D $arg $name =", $arg.hi, $arg.lo
        MEND

        ; Load S register DNM into argument register
        MACRO
        LoadReg_S $cc, $arg, $name
      [ "$name" <> ""
        LDR$cc   $arg, [xwp, #Reg_$name]
      ]
        LDR$cc   $arg, [xregs, $arg, LSL #2]
        DebugIf $cc, x, "LoadReg_S $arg $name =", $arg
        MEND

        ; Store D register DNM from argument register
        MACRO
        StoreReg_D $cc, $name, $arg, $temp
      [ "$name" <> ""
        LDR$cc  $temp, [xwp, #Reg_$name]
      ]
        ADD$cc  $temp, xregs, $temp, LSL #2
        STMIA$cc $temp, {$arg.lo, $arg.hi}
        DebugIf $cc, x, "StoreReg_D $arg $name =", $arg.hi, $arg.lo
        MEND

        ; Store S register DNM from argument register
        MACRO
        StoreReg_S $cc, $name, $arg, $temp
      [ "$name" <> ""
        LDR$cc  $temp, [xwp, #Reg_$name]
      ]
        STR$cc  $arg, [xregs, $temp, LSL #2]
        DebugIf $cc, x, "StoreReg_S $arg $name =", $arg
        MEND

        ; Move D register from one argument register to another
        MACRO
        MoveReg_D $cc, $dest, $src
        MOV$cc  $dest.lo, $src.lo
        MOV$cc  $dest.hi, $src.hi
        MEND

        ; Move S register from one argument register to another
        MACRO
        MoveReg_S $cc, $dest, $src
        MOV$cc  $dest, $src
        MEND

        ; Negate floating point D argument
        MACRO
        NegRegFP_D $cc, $arg
        EOR$cc  $arg.hi, $arg.hi, #&80000000
        MEND

        ; Negate floating point S argument
        MACRO
        NegRegFP_S $cc, $arg
        EOR$cc  $arg, $arg, #&80000000
        MEND

        ; Abs floating point D argument
        MACRO
        AbsRegFP_D $cc, $arg
        BIC$cc  $arg.hi, $arg.hi, #&80000000
        MEND

        ; Abs floating point S argument
        MACRO
        AbsRegFP_S $cc, $arg
        BIC$cc  $arg, $arg, #&80000000
        MEND

        ; Set D argument to zero
        MACRO
        LoadZero_D $cc, $arg
        MOV$cc  $arg.lo, #0
        MOV$cc  $arg.hi, #0
        MEND

        ; Set S argument to zero
        MACRO
        LoadZero_S $cc, $arg
        MOV$cc  $arg, #0
        MEND

        ; Perform subnormal input check on a D argument
        ; Corrupts flags, lr
        MACRO
        CheckSubnormal_D $cc, $arg
        ASSERT  ("$cc" = "EQ") :LOR: ("$cc" = "")
      [ "$cc" = "EQ"
        BNE     %FT90
      ]
        MOVS    lr, $arg.hi, LSL #1     ; Discard sign and check for zero
        TEQEQ   $arg.lo, #0
        BEQ     %FT90
        CMP     lr, #1<<21              ; Check exponent
        BLLO    raise_subnormal
90
        MEND

        ; Perform subnormal input check on a S argument
        ; Corrupts flags, lr
        MACRO
        CheckSubnormal_S $cc, $arg
        ASSERT  ("$cc" = "EQ") :LOR: ("$cc" = "")
      [ "$cc" = "EQ"
        MOV     lr, $arg, LSL #1        ; Discard sign
        TSTEQ   lr, #&FF000000          ; Check exponent
        BNE     %FT90                   ; Exponent nonzero, or wrong $cc
        TEQ     lr, #0                  ; Check for zero
        BLNE    raise_subnormal         ; Not zero - therefore subnormal
      |
        MOVS    lr, $arg, LSL #1        ; Discard sign and check for zero
        BEQ     %FT90
        CMP     lr, #1<<24              ; Check exponent
        BLLO    raise_subnormal
      ]
90
        MEND

        ; In: xins = instruction word
        ;     xwp = exception workspace
        ;     xflags = XFlags
        ; Out: DNM, DM or D registers fill in
        ;      r0-r2 corrupt
GetThreeRegs_S
        GetRegNo_S N,r1
        Debug   x, "Sn =", r1
        STR     r1, [xwp, #Reg_N]
GetTwoRegs_S        
        GetRegNo_S D,r0
        GetRegNo_S M,r2
        STR     r0, [xwp, #Reg_D]
        STR     r2, [xwp, #Reg_M]
        Debug   x, "Sd, Sm =", r0, r2
        MOV     pc, lr

GetOneReg_S        
        GetRegNo_S D,r0
        ; Zero Reg_M to prevent AdvanceToNext doing too much excess work
        MOV     r1, #0
        STR     r0, [xwp, #Reg_D]
        STR     r1, [xwp, #Reg_M]
        Debug   x, "Sd =", r0
        MOV     pc, lr

GetOneReg_D
        GetRegNo_D D,r0
        MOV     r1, #0
        STR     r0, [xwp, #Reg_D]
        STR     r1, [xwp, #Reg_M]
        Debug   x, "Dd =", r0
        MOV     pc, lr

GetTwoRegs_D
        GetRegNo_D D,r0,nolimit
        GetRegNo_D M,r2,nolimit
        Debug   x, "Dd, Dm =", r0, r2
    [ CheckD16
        ; Do register limit checks
        TST     xins, #1<<D_little
        TSTEQ   xins, #1<<M_little
      [ MaxDRegs > 16
        TSTNE   xflags, #XFlag_D16
      ]
        DebugIf NE, x, "reg >= 16"
        BNE     VFPSupportCode_Undefined
    ]
        STR     r0, [xwp, #Reg_D]
        STR     r2, [xwp, #Reg_M]
        MOV     pc, lr

GetThreeRegs_D
        GetRegNo_D D,r0,nolimit
        GetRegNo_D N,r1,nolimit
        GetRegNo_D M,r2,nolimit
        Debug   x, "Dn, Dd, Dm =", r0, r1, r2
    [ CheckD16
        ; Do register limit checks
        TST     xins, #1<<D_little
        TSTEQ   xins, #(1<<N_little)+(1<<M_little)
      [ MaxDRegs > 16
        TSTNE   xflags, #XFlag_D16
      ]
        DebugIf NE, x, "reg >= 16"
        BNE     VFPSupportCode_Undefined
    ]
        STR     r0, [xwp, #Reg_D]
        STR     r1, [xwp, #Reg_N]
        STR     r2, [xwp, #Reg_M]
        MOV     pc, lr

        ; Top-level routine
        ;
        ; Advance to next vector element, or exit
        ; In: xins = instruction word
        ;     xctx = context
        ;     xregs = registers
        ;     xwp = exception workspace
        ; Out: r0-r3 corrupt
AdvanceToNext   ROUT
        ; Check FPEXC to see if there are any more elements
        LDR     r0, [xwp, #TheFPEXC]
        Debug   x, "AdvanceToNext, TheFPEXC=", r0
        MOV     r0, r0, ROR #FPEXC_VECITR_SHIFT+3 ; Shift VECITR to top bits
        CMP     r0, #7<<29
        BHS     VFPSupportCode_Done
        ; Advance FPEXC
        SUB     r0, r0, #1<<29
        MOV     r0, r0, ROR #32-(FPEXC_VECITR_SHIFT+3) ; Rotate back to normal
        STR     r0, [xwp, #TheFPEXC]
        ; Advance register numbers
        LDR     r1, [xctx, #Context_FPSCR]
        AND     r1, r1, #FPSCR_STRIDE_MASK
        EOR     r1, r1, #1<<FPSCR_STRIDE_SHIFT ; Get actual stride value
        ; Double or single word registers?
        TST     xins, #1<<8
        MOVNE   r1, r1, LSL #1          ; Double the stride for D regs
        MOV     r1, r1, LSL #29-FPSCR_STRIDE_SHIFT
        ; Advance D & N registers - will be vectors
        LDR     r2, [xwp, #Reg_D]
        LDR     r3, [xwp, #Reg_N]
        ADD     r2, r1, r2, ROR #3
        ADD     r3, r1, r3, ROR #3
        MOV     r2, r2, ROR #29
        MOV     r3, r3, ROR #29
        Debug   x, "Reg_D, Reg_N=",r2,r3
        STR     r2, [xwp, #Reg_D]
        STR     r3, [xwp, #Reg_N]
        ; Advance M register - may be vector or scalar
        LDR     r2, [xwp, #Reg_M]
        TST     r2, #3<<3
        ADD     r2, r1, r2, ROR #3
        DebugIf EQ, x, "Reg_M is scalar"
        MOVEQ   pc, lr
        MOV     r2, r2, ROR #29
        Debug   x, "Reg_M=", r2
        STR     r2, [xwp, #Reg_M]
        ; Continue execution
        MOV     pc, lr

; Include the main instruction handling code

        GBLS    prec
        GBLS    invprec
        GBLS    bits
        GBLS    invbits

prec    SETS    "S"
invprec SETS    "D"
bits    SETS    "32"
invbits SETS    "64"
        GET     Instructions.s

prec    SETS    "D"
invprec SETS    "S"
bits    SETS    "64"
invbits SETS    "32"
        GET     Instructions.s

; Code to pass on exceptions for situations where the hardware got it wrong

      [ :LNOT: debugx
        ; Non-debug definitions of the unimplemented instructions, to avoid pointless branches in non-debug builds
VCVTB_VCVTT_D
VCVT_FP_FIXED_D
VCVTB_VCVTT_S
VCVT_FP_FIXED_S
        ; Fall through...
      ]

VFPSupportCode_VFPv4 TRACE
        ; Arrive here upon encountering a VFPv4 instruction
        ; Fall through...

VFPSupportCode_Undefined TRACE
        ; Arrive here for any kind of undefined VFP instruction (VFPv3, VFPv4, or a truly undefined one)
        ; If this is a synchrounous exception, we pass it on so the OS can throw its error
        ; Otherwise we throw our own error, as the presence of the instruction in the FPINST registers indicates either a hardware fault or a software fault is at work
        LDRB    r0, [xwp, #XFlags]
        TST     r0, #XFlag_Synchronous
        BEQ     VFPSupportCode_Unexpected
      [ debugx
        B       VFPSupportCode_PassOn   ; Skip some debug spam
      ]
        ; Fall through...

VFPSupportCode_PassOn TRACE
        ; Top-level entry
        ;
        ; xwp = workspace
        ; xctx = context
        ;
        ; Clear FPEXC, restore the context + registers, and call OldHandler to
        ; pass the exception on
        MOV     r0, #FPEXC_EN
        STR     r0, [xctx, #Context_FPEXC]
        MOV     r0, xctx
        MOV     r1, #VFPSupport_ChangeContext_Lazy ; The fact we received a spurious exception implies there's a real exception coming soon
        LDR     r12, [xwp, #Workspace]
        BL      SWI_ChangeContext
      [ debugx
        Debug   x, "Restored context state"
        ADRL    r0, showvfpregs
        SWI     XOS_CLI
      ]
        ; Now pass it on
        ADD     sp, sp, #UserRegisters
        Pull    "r0-r7"                 ; r0-r7
        ADD     sp, sp, #8*4            ; Skip r8-r12 (will restore from UND stack), r13-r14 from exception mode, lr_und
        Pull    "r8,r14"                ; Recover SPSR_und, lr_svc
        MSR     CPSR_c, #UND32_mode+I32_bit ; Back to UND
        MSR     SPSR_cxsf, r8           ; Restore SPSR ready for return
        LDR     r12, OldHandler         ; r12 becomes return address
        Pull    "r8-r11,r14"            ; Restore UND stack frame
        Push    "r12"                   ; Push return address
        LDR     r12, [sp, #4]           ; Grab r12_und
        LDR     pc, [sp], #8            ; Jump to OldHandler and junk the rest

; Error reporting

        MACRO
        VFPSupportError $prefix, $token, $msg
VFPSupportCode_$token
        Debug   x, "Throwing error $token"
        ADRL    r0, ErrorBlock_VFPSupport_$prefix.$token
        B       VFPSupportCode_Error
        MakeInternatErrorBlock VFPSupport_$prefix.$token,,"$msg"
        MEND

        VFPSupportError SupCode_, NoContext,"S00"
        VFPSupportError SupCode_, NotEN,"S01"
        VFPSupportError SupCode_, ENMismatch,"S02"
        VFPSupportError SupCode_, Unexpected,"S03"
        VFPSupportError SupCode_, SupDiv0,"S04"
        VFPSupportError SupCode_, UnkExcep,"S05"

        VFPSupportError ,IO,"IO"
        VFPSupportError ,DZ,"DZ"
        VFPSupportError ,OF,"OF"
        VFPSupportError ,UF,"UF"
        VFPSupportError ,IX,"IX"
        VFPSupportError ,ID,"ID"

VFPSupportCode_BadState
        ; xctx = context
        ; r2 = CPEnabledFlag
        ; r3 = FPEXC
        ; One of these is bad, work out which it is and report the error
        CMP     xctx, #0
        BEQ     VFPSupportCode_NoContext
        TST     r3, #FPEXC_EN
        BEQ     VFPSupportCode_NotEN
        B       VFPSupportCode_ENMismatch

VFPSupportCode_Error
        ; R0 = error to translate
        ; xwp = exception workspace
        ; Copy the context to the exception block and report the error
        LDR     r12, [xwp, #Workspace]
        BL      ReturnError_LR
        ; Fall through...

VFPSupportCode_Oops ROUT
        Debug   x, "Oops!"
        ; R0 = error ptr
        ; xwp = exception workspace
        ; Copy the context to the exception block and report the error
        MOV     r11, r0
        MOV     r0, #VFPSupport_ExceptionDump_Create
        LDR     r1, [xwp, #TheContext]
        LDR     r12, [xwp, #Workspace]
        BL      SWI_ExceptionDump
        ; Set up the integer exception dump
        MOV     r0, #13
        MOV     r1, #0
        MOV     r2, #0
        MOV     r3, #0
        SWI     XOS_ChangeEnvironment
        BVS     %FT10
        ADD     r0, xwp, #UserRegisters
        LDMIA   r0!, {r2-r9} ; r0-r7
        STMIA   r1!, {r2-r9}
        LDMIA   r0!, {r2-r9,r14} ; r8-r15, PSR
        STMIA   r1!, {r2-r9,r14}
10
        MOV     r0, r11
        ; Junk stack frame and recover entry registers
        ADD     sp, xwp, #UserRegisters+4
        Pull    "r1-r12"                ; Recover r1-r12
        ADD     sp, sp, #16             ; Skip user's r13-r15, lr_svc
        ; TODO - Is restoring all of this stuff necessary? won't the error handler flatten the stacks?
        ; SVC stack should now be restored
        ; r14_svc won't have been restored, but the SWI call is about to clobber
        ; it anyway
        MSR     CPSR_c, #UND32_mode+I32_bit ; Switch to UND so we can restore its stack
        ADD     sp, sp, #12             ; Skip r8-r11, already restored
        LDR     r14, [sp], #8           ; Restore r14_und, skip r12
        ; UND stack should now be restored
        SWI     OS_GenerateError

; C support

        ; Specify where the relocation offset is relative to SL
        ; This is a negative offset!
        EXPORT  |_Mod$Reloc$Off|
|_Mod$Reloc$Off| * 0
        ASSERT  XCRelocOffset = 0

raise_subnormal
        ; Raise a subnormal exception
        ; All regs preserved
        Entry   "r0-r2"
        MOV     r0, #FPSCR_IDC
        BL      float_raise
        EXIT

        EXPORT  float_raise

float_raise
        ; Raise the given exceptions immediately (if enabled)
        ; Note: raise_subnormal assumes r3, r12 aren't used
        ASSERT  ExceptionEnable = ExceptionFlags+1
        ASSERT  (ExceptionFlags :AND: 1) = 0
        LDRH    r2, [xwp, #ExceptionFlags]
        Debug   x, "float_raise", r0
        Debug   x, "ontop of", r2
        ORR     r1, r2, r0              ; Merge in the new flags
        ANDS    r0, r0, r2, LSR #8      ; But only throw exception if one of the indicated exceptions is enabled
        STRB    r1, [xwp, #ExceptionFlags]
        MOVEQ   pc, lr
        ; Recover context pointer
        LDR     xctx, [xwp, #TheContext]
        ; Fall through...
VFPSupportCode_RaiseException
        ; In:
        ; r0 = exception(s) to raise
        ; r1 = ExceptionFlags in low 8 bits, upper bits undefined
        ; xwp = exception workspace
        ; xctx = context
        ; Other global registers invalid
        ;
        ; Start by updating FPSCR to show the new exception state
        LDR     r2, [xctx, #Context_FPSCR]
        ORR     r2, r2, r1
        Debug   x, "Raising exceptions", r0
        Debug   x, "with FPSCR", r2
        STRB    r2, [xctx, #Context_FPSCR]
        ; Now decide which error to throw
        ;
        ; Research suggests they should be prioritised in the following order:
        ;
        ; invalid operation (IO)
        ; division by zero (DZ)
        ; overflow (OF)
        ; underflow (UF)
        ; inexact (IX)
        ; input denormal (ID)
        ;
        ; Annoyingly this is the reverse of the bit order, so we can't use CLZ.
        ; So just test each bit in turn.
        TST     r0, #FPSCR_IOC
        BNE     VFPSupportCode_IO
        TST     r0, #FPSCR_DZC
        BNE     VFPSupportCode_DZ
        TST     r0, #FPSCR_OFC
        BNE     VFPSupportCode_OF
        TST     r0, #FPSCR_UFC
        BNE     VFPSupportCode_UF
        TST     r0, #FPSCR_IXC
        BNE     VFPSupportCode_IX
        TST     r0, #FPSCR_IDC
        BNE     VFPSupportCode_ID
        ; Oh dear.
        B       VFPSupportCode_UnkExcep

        

        EXPORT  dividebyzero
        EXPORT  __rt_div0

dividebyzero
|__rt_div0|
        ; These shouldn't happen, unless there's a bug in SoftFloat somewhere
        B       VFPSupportCode_SupDiv0

        END
