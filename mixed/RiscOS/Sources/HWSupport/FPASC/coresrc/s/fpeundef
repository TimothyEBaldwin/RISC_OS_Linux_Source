; Assembler source for FPA support code and emulator
; ==================================================
; Undefined instruction handler for FPA Emulator
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

          GET     CPU/Arch

        [ FPEWanted             ;Scope: the whole of this source file

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

FPEUndefHandler
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
  [ SASTMhatbroken                      ; use writeback on such STMs
        STMIA   Rsp,{R0-R12}            ;SA revision < 3 may screw up R12 if we do
        ADD     Rwp,Rsp,#13*4           ; it all in one go. Use Rwp as a temporary
        STMIA   Rwp,{R13,R14}^
  |
        STMIA   Rsp,{R0-R14}^
  ]
        STR     LR,[Rsp,#15*4]          ;Preserve caller's PC value - note
                                        ; that PC will need special care
                                        ; if used by the instruction
        MOV     Rfp,Rsp                 ;Preserve pointer to register dump

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
        [ SupportARMv5
; In newer CPUs, opcodes with the condition field set to &F ('NV') are
; considered to be different, unconditional instructions so will always take
; the undefined instruction trap. Don't attempt to intercept them.
          CMP     Rins,#&F0000000
          BCS     NotForUs1
        ]

; Now Rins=instruction; Rfp and Rsp are correct; LR=link. Get the main
; workspace pointer.

        AdrWS   Rwp
        
        [ SupportARMv7
; In even newer CPUs, we can't count on the condition code having been checked
; before the undefined instruction handler has been entered!
          CMP     Rins,#&E0000000
          BCS     %FT02 ; shortcut for AL
          LDR     Rtmp2,[Rsp] ; retrieve SPSR from stack
          MOV     Rtmp2,Rtmp2,LSR#28
          MOV     Rtmp,Rins,LSR#29 ; top 3 bits of cond determine rules
          EOR     Rtmp2,Rtmp2,Rtmp2,LSL#3
          EOR     Rtmp2,Rtmp2,#2_1000111 ; !N Z C N^V !Z !C !V
          LDRB    Rtmp,[pc,Rtmp]
          B       %FT01
          =       2_0000100 ; NE: !Z = 1
          =       2_0000010 ; CC: !C = 1
          =       2_1000000 ; PL: !N = 1
          =       2_0000001 ; VC: !V = 1
          =       2_0100010 ; LS: !C = 1 or Z = 1
          =       2_0001000 ; LT: N^V = 1
          =       2_0101000 ; LE: N^V = 1 or Z = 1
          ALIGN
01        ANDS    Rtmp,Rtmp,Rtmp2
          MOVNE   Rtmp,#&80000000 ; bit 31 set if cond bit-0-set test passes
          TEQ     Rtmp,Rins,LSL#3 ; invert bit 31 if cond bit 0 is set
        [ MultipleContexts
          LDRMI   Rwp,CurrentContext
        ]
          BMI     FPEReturn
02
        ]

; Check the coprocessor number and that this *is* a coprocessor instruction.

        TST     Rins,#NotUndef_bit      ;Genuinely undefined instructions
        BEQ     NotForUs                ; are not for us
        AND     Rtmp2,Rins,#Coproc_mask ;If OK, isolate coprocessor number
        CMP     Rtmp2,#Coproc_1
        BNE     FPEMaybeCoproc2

        ]                       ;End of "UndefHandStandAlone" section

FPEUndefHandler_Coproc1

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

        CDebug1 1,"FPE: Coproc.1 instruction",Rins

; Is the system disabled? Branch out if so.

        LDR     Rtmp,DisableInfo
        TEQ     Rtmp,#0
        BNE     FPE_Disabled

; The return address on the stack is OK, so we can re-enable interrupts.

        InterruptEnable Rtmp

        [ FPEChecksNextInstr
FPE_NextInstrForCoproc1
        ]

; OK - it's for us, and it's a coprocessor 1 instruction. In FPASC terms,
; what we've got now is effectively always a synchronous bounce - i.e. we
; simply need to emulate the instruction in Rins.
;
; We will want the FPSR in much of the code that follows.

        LDR     Rfpsr,MemFPSR

; The following registers have their correct contents at this point:
;   Rsp, Rfp, Rins, Rwp, Rfpsr
;
; Now we simply have to emulate the instruction that has been bounced. The
; first step is to split according to the type of the instruction.

        TST     Rins,#RTDOnotDT_bit
        BNE     FPE_CPDOorCPRT

FPE_CPDT1

        CDebug0 2,"LDF/STF"

; General remark: there is a lot of duplicated code below. This has been
; done in the interests of performance: since this class of instructions
; account for about 2/3 of all floating point instructions executed, their
; speed is especially important. This applies especially to LDF, which
; accounts for something of the order of 40% of all floating point
; instructions executed.
;
; We will split according to four criteria:
;
;   * Load or store instruction?
;   * User or non-user mode?
;   * ARM register involved is R0-R14 or R15?
;   * The precision.
;
; Calculate an index, in the process putting the ARM register number in
; Rregno and the precision left-aligned in RNDprm.

        MOV     Rtmp2,Rins,LSL #31-DT_pr1_pos   ;Get 1st precision bit
        ASSERT  DT_LnotS_pos = DT_pr1_pos-2     ; and load/store bit
        AND     Rtmp2,Rtmp2,#&A0000000
        TST     Rins,#DT_pr2_mask               ;Merge in second precision bit
        ORRNE   Rtmp2,Rtmp2,#&40000000
        AND     Rregno,Rins,#DT_ARMreg_mask     ;Isolate register number
        CMP     Rregno,#R15:SHL:DT_ARMreg_pos   ;Merge in R15 indicator
        ORRCS   Rtmp2,Rtmp2,#&10000000
        GetMode Rtmp                            ;Merge in user/non-user bit
        ORRNE   Rtmp2,Rtmp2,#&08000000

        AND     RNDprm,Rtmp2,#&C0000000         ;Isolate precision

; The index in Rtmp2 now has:
;
;   Bits 31..30: Precision;
;   Bit 29:      1 if load,          0 if store;
;   Bit 28:      1 if R15,           0 if R0-R14;
;   Bit 27:      1 if non-user mode, 0 if user mode.
;   Bits 26..0:  zeros
;
; Branch according to this index.

        CDebug1 2,"CPDT - branch index is",Rtmp2

        ADD     PC,PC,Rtmp2,LSR #25

        BranchTablePad

        B       FPE_STFS_User_R0toR14
        B       FPE_STFS_NonUser_R0toR14
        B       FPE_STFS_User_R15
        B       FPE_STFS_NonUser_R15
        B       FPE_LDFS_User_R0toR14
        B       FPE_LDFS_NonUser_R0toR14
        B       FPE_LDFS_User_R15
        B       FPE_LDFS_NonUser_R15
        B       FPE_STFD_User_R0toR14
        B       FPE_STFD_NonUser_R0toR14
        B       FPE_STFD_User_R15
        B       FPE_STFD_NonUser_R15
        B       FPE_LDFD_User_R0toR14
        B       FPE_LDFD_NonUser_R0toR14
        B       FPE_LDFD_User_R15
        B       FPE_LDFD_NonUser_R15
        B       FPE_STFE_User_R0toR14
        B       FPE_STFE_NonUser_R0toR14
        B       FPE_STFE_User_R15
        B       FPE_STFE_NonUser_R15
        B       FPE_LDFE_User_R0toR14
        B       FPE_LDFE_NonUser_R0toR14
        B       FPE_LDFE_User_R15
        B       FPE_LDFE_NonUser_R15
        [       NoPacked
          B       NotForUs1
          B       NotForUs1
          B       NotForUs1
          B       NotForUs1
          B       NotForUs1
          B       NotForUs1
          B       NotForUs1
          B       NotForUs1
        |
          B       FPE_STFP_User_R0toR14
          B       FPE_STFP_NonUser_R0toR14
          B       FPE_STFP_User_R15
          B       FPE_STFP_NonUser_R15
          B       FPE_LDFP_User_R0toR14
          B       FPE_LDFP_NonUser_R0toR14
          B       FPE_LDFP_User_R15
          B       FPE_LDFP_NonUser_R15
        ]

;===========================================================================

        LTORG

;===========================================================================

; We use quite a few standard code fragments in what follows. The following
; macros encapsulate these. They're not in "src.macros" because their
; interface is highly specific to the following code - e.g. register names
; are not passed in, but simply assumed.

; Macros to pick up the appropriate floating point register's contents and
; convert them to the destination precision. There are four variants,
; depending on precision.

        MACRO
        FPE_STFSGetRegAndConvert
        GetDst  FPE,OP1regs,Rins,Rtmp
        ASSERT  DT_dst_mask = Ds_mask
        CDebug3 3,"Unconverted value is",OP1sue,OP1mhi,OP1mlo
        BL      STFConvertFPE_Single
        CDebug1 3,"Converted value is",OP1sue
        MEND

        MACRO
        FPE_STFDGetRegAndConvert
        GetDst  FPE,OP1regs,Rins,Rtmp
        ASSERT  DT_dst_mask = Ds_mask
        CDebug3 3,"Unconverted value is",OP1sue,OP1mhi,OP1mlo
        BL      STFConvertFPE_Double
        CDebug2 3,"Converted value is",OP1sue,OP1mhi
        MEND

        MACRO
        FPE_STFEGetRegAndConvert
        GetDst  FPE,OP1regs,Rins,Rtmp
        ASSERT  DT_dst_mask = Ds_mask
        MOV     RNDprm,RNDprm,LSR #31-(RM_pos+3)
        [ DynamicRounding
          ; Is this necessary at all? Don't think STFE ever needs RM.
          AND     Rtmp,Rfpsr,#RO_mask
          BiShift ORR,RNDprm,RNDprm,Rtmp,LSR #RO_pos,LSL #RM_pos
        |
        ASSERT  RM_Nearest = 0
        ]
        CDebug3 3,"Unconverted value is",OP1sue,OP1mhi,OP1mlo
        TST     OP1sue,#Uncommon_bit
        BLNE    STFConvertFPE_Extended
        CDebug3 3,"Converted value is",OP1sue,OP1mhi,OP1mlo
        MEND

        [ :LNOT:NoPacked

        MACRO
        FPE_STFPGetRegAndConvert
        GetDst  FPE,OP1regs,Rins,Rtmp
        ASSERT  DT_dst_mask = Ds_mask
        CDebug3 3,"Unconverted value is",OP1sue,OP1mhi,OP1mlo
        BL      STFConvertFPE_Packed
        CDebug4 3,"Converted value is",OP1sue,OP1mhi,OP1mlo,Rarith
        MEND

        ]

; This next macro handles reading the ARM register value, doing the address
; calculations and doing the register writeback when the ARM address
; register is R0 to R14 and can be accessed on the stack (i.e. not R13 or
; R14 in non-user, non-system modes). Note we don't care about R8 to R12 in
; FIQ modes.

        MACRO
        FPE_UseStackedAddress
        BiShift LDR,Rregval,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2
                                                ;Rregval := base address
        AND     Rtmp,Rins,#DT_offset_mask       ;Rtmp := indexed address
        TST     Rins,#DT_UnotD_bit
        ADDNE   Rtmp,Rregval,Rtmp,LSL #2
        SUBEQ   Rtmp,Rregval,Rtmp,LSL #2
        TST     Rins,#DT_PreIndex_bit           ;Rregval := address to
        MOVNE   Rregval,Rtmp                    ; use for store instruction
        TST     Rins,#DT_wb_bit                 ;Do writeback if needed
        BiShift STRNE,Rtmp,Rfp,Rregno,LSR #DT_ARMreg_pos,LSL #2
        MEND

; The next macro is similar, but deals with the case that the ARM address
; register is R15 (in any mode). The address to use is the calling
; instruction's address plus 8. Note that no writeback is ever done in this
; case.

        MACRO
        FPE_UseInstrAddressPlus8
        LDR     Rregval,[Rfp,#15*4]             ;Get (instr. address)+4
        ADD     Rregval,Rregval,#4              ;Now (instr. address)+8
        [ {CONFIG}=26
          BIC     Rregval,Rregval,#PSR_mask     ;Strip out PSR
        ]
        TST     Rins,#DT_PreIndex_bit           ;Preindexed?
        ANDNE   Rtmp,Rins,#DT_offset_mask       ;If so, extract offset and
        SUBNE   Rregval,Rregval,Rtmp,LSL #2     ; assume it is -ve; then
        TSTNE   Rins,#DT_UnotD_bit              ; check to see if it is +ve
        ADDNE   Rregval,Rregval,Rtmp,LSL #3     ; & compensate if so
        MEND

; The next macro is similar, but deals with the case where the ARM address
; register is R13 or R14 in a non-user mode. The address to use can be found
; in the other mode's version of R13 or R14. Note we don't care about making
; the code work in this case if the caller is in the same mode as we are.
;   Note also that the next instruction after this macro must not access
; mode-dependent registers.

        MACRO
        FPE_UseOtherModeAddress $branch_for_system_mode
        GetMode Rtmp
        [ {CONFIG}=32
          TEQ     Rtmp,#Mode_SYS32              ;System mode must use stack
          BEQ     $branch_for_system_mode
          MRS     Rtmp2,CPSR                    ;Rtmp2 := original mode
          ORR     Rtmp,Rtmp,#Mode_32not26+I_bit ;Make 32-bit version of mode
                                                ; and disable interrupts
                                                ; temporarily
          BIC     Rregval,Rtmp2,#Mode_mask      ;Replace mode - note Rregval is
          ORR     Rtmp,Rregval,Rtmp             ; just a convenient temporary
          MSR     CPSR_c,Rtmp                   ;Change to mode just calculated
        ]
        [ {CONFIG}=26
          ORR     Rtmp,Rtmp,#I_bit              ;Ensure that interrupts become
          MOV     Rtmp2,PC                      ; disabled temporarily
          AND     Rregval,Rtmp2,#PSR_mask:AND:(:NOT:Mode_mask)
                                                ;Replace mode - note Rregval is
          ORR     Rtmp,Rregval,Rtmp             ; just a convenient temporary
          TEQP    PC,Rtmp                       ;Change to caller's mode
        ]
        CMP     Rregno,#R13:SHL:DT_ARMreg_pos   ;Rregval := base address
        MOVEQ   Rregval,R13                     ; = correct one of R13 and R14
        MOVNE   Rregval,R14
        CDebug1 3,"Non-user R13/R14 read as",Rregval
        AND     Rtmp,Rins,#DT_offset_mask       ;Rtmp := indexed address
        TST     Rins,#DT_UnotD_bit
        BiShift ADDNE,Rtmp,Rregval,Rtmp,LSR #DT_offset_pos,LSL #2
        BiShift SUBEQ,Rtmp,Rregval,Rtmp,LSR #DT_offset_pos,LSL #2
        TST     Rins,#DT_PreIndex_bit           ;Rregval := correct address
        MOVNE   Rregval,Rtmp                    ; for store instruction
        TST     Rins,#DT_wb_bit                 ;Writeback wanted?
        BEQ     %f10
        CMP     Rregno,#R13:SHL:DT_ARMreg_pos   ;If so, write back to correct 
        MOVEQ   R13,Rtmp                        ; one of R13 and R14
        MOVNE   R14,Rtmp
        CDebug1 3,"Non-user R13/R14 written back as",Rtmp
10
        [ {CONFIG}=32
          MSR     CPSR_c,Rtmp2                ;Change back to original mode
        ]
        [ {CONFIG}=26
          TEQP    PC,Rtmp2                      ;Change back to original mode
        ]
        MEND

; MW 03/12/09 When r13_svc is involved, we need to take special action to
; protect the value on the SVC stack from being overwritten by interrupt
; code dropping into SVC mode. The previous macro cannot be used for loading
; reliably because the data is left unprotected below the stack pointer, so
; it can be overwritten before it is read.

; The LoadFromOtherModeAddress macro is the same as UseOtherModeAddress
; except that the loading instruction is integrated into the macro, so
; it can happen while interrupts are disabled. This has the minor side
; effect of executing the load with the other mode's privileges, which,
; if different at all, is even closer to the desired semantics.

; If $Mode is 0, then one word is loaded into OP1sue
; If $Mode is 1, then two words are loaded into OP1sue, OP1mlo
; IF $Mode is 2, then three words are loaded into OP1sue,OP1mhi,OP1mlo
; If $Mode is 3, then a "P" load happens, i.e., if EP is 0, then
;                three words are loaded into OP1sue,OP1mhi,OP1mlo else
;                four words are loaded into OP1sue,OP1mhi,OP1mlo,Rarith

        MACRO
        FPE_LoadFromOtherModeAddress $branch_for_system_mode,$Mode
        GetMode Rtmp
        [ {CONFIG}=32
          TEQ     Rtmp,#Mode_SYS32              ;System mode must use stack
          BEQ     $branch_for_system_mode
          MRS     Rtmp2,CPSR                    ;Rtmp2 := original mode
          ORR     Rtmp,Rtmp,#Mode_32not26+I_bit ;Make 32-bit version of mode
                                                ; and disable interrupts
                                                ; temporarily
          BIC     Rregval,Rtmp2,#Mode_mask      ;Replace mode - note Rregval is
          ORR     Rtmp,Rregval,Rtmp             ; just a convenient temporary
          MSR     CPSR_c,Rtmp                   ;Change to mode just calculated
        ]
        [ {CONFIG}=26
          ORR     Rtmp,Rtmp,#I_bit              ;Ensure that interrupts become
          MOV     Rtmp2,PC                      ; disabled temporarily
          AND     Rregval,Rtmp2,#PSR_mask:AND:(:NOT:Mode_mask)
                                                ;Replace mode - note Rregval is
          ORR     Rtmp,Rregval,Rtmp             ; just a convenient temporary
          TEQP    PC,Rtmp                       ;Change to caller's mode
        ]
        CMP     Rregno,#R13:SHL:DT_ARMreg_pos   ;Rregval := base address
        MOVEQ   Rregval,R13                     ; = correct one of R13 and R14
        MOVNE   Rregval,R14
        CDebug1 3,"Non-user R13/R14 read as",Rregval
        AND     Rtmp,Rins,#DT_offset_mask       ;Rtmp := indexed address
        TST     Rins,#DT_UnotD_bit
        BiShift ADDNE,Rtmp,Rregval,Rtmp,LSR #DT_offset_pos,LSL #2
        BiShift SUBEQ,Rtmp,Rregval,Rtmp,LSR #DT_offset_pos,LSL #2
        TST     Rins,#DT_PreIndex_bit           ;Rregval := correct address
        MOVNE   Rregval,Rtmp                    ; for store instruction
        TST     Rins,#DT_wb_bit                 ;Writeback wanted?
        BEQ     %f10
        CMP     Rregno,#R13:SHL:DT_ARMreg_pos   ;If so, write back to correct
        MOVEQ   R13,Rtmp                        ; one of R13 and R14
        MOVNE   R14,Rtmp
        CDebug1 3,"Non-user R13/R14 written back as",Rtmp
10
        ; we do the transfer right now in all cases while interrupts
        ; are still disabled
        [ $Mode = 0
          LDMIA   Rregval,{OP1sue}                      ;NB Normal transfer
        |
          [ $Mode = 1
            LDMIA   Rregval,{OP1sue,OP1mlo}             ;NB Normal transfer
          |
            [ $Mode = 2
              LDMIA   Rregval,{OP1sue,OP1mhi,OP1mlo}    ;NB Normal transfer
            |
              [ $Mode = 3
                TST     Rfpsr,#EP_bit
                LDMEQIA Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
                LDMNEIA Rregval,{OP1sue,OP1mhi,OP1mlo,Rarith}
              |
                Assert(0)
              ]
            ]
          ]
        ]
        [ {CONFIG}=32
          MSR     CPSR_c,Rtmp2                ;Change back to original mode
        ]
        [ {CONFIG}=26
          TEQP    PC,Rtmp2                      ;Change back to original mode
        ]
        MEND

;===========================================================================

FPE_STFS_User_R0toR14

        CDebug1 2,"User mode STFS, address register is",Rregno

        FPE_STFSGetRegAndConvert
        AND     Rregno,Rins,#DT_ARMreg_mask     ;Recover register number
        FPE_UseStackedAddress
        STRT    OP1sue,[Rregval]                ;NB User mode transfer

        [ :LNOT:FPEChecksNextInstr

          STR     Rfpsr,MemFPSR
          FPInstrDone

        |

FPEWriteFPSRAndReturn_User

          STR     Rfpsr,MemFPSR

FPEReturn_User

; Point at the next instruction.

          [ {CONFIG} = 32
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG} = 26
            LDR     Rtmp,[Rfp,#15*4]
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNET  Rins,[Rtmp2]
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
        ]

        Return

;===========================================================================

        LTORG

;===========================================================================

FPE_STFS_NonUser_R0toR14

        CDebug1 2,"Non-user mode STFS, address register is",Rregno

        FPE_STFSGetRegAndConvert
        AND     Rregno,Rins,#DT_ARMreg_mask     ;Recover register number

; Split according to whether the address register is R0-R12 or R13-R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPE_STFS_NonUser_R13toR14

FPE_STFS_NonUser_Stacked
        FPE_UseStackedAddress
        STMIA   Rregval,{OP1sue}                ;NB Normal transfer

        [ :LNOT:FPEChecksNextInstr

          B       FPEWriteFPSRAndReturn_NonUser

        |

FPEWriteFPSRAndReturn_NonUser

          STR     Rfpsr,MemFPSR

FPEReturn_NonUser

; Point at the next instruction.

          [ {CONFIG}=32
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG}=26
            LDR     Rtmp,[Rfp,#15*4]
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNE   Rins,[Rtmp2]                  ;NB Standard transfer
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
          Return
        ]

FPE_STFS_NonUser_R13toR14

        FPE_UseOtherModeAddress FPE_STFS_NonUser_Stacked
        STMIA   Rregval,{OP1sue}                ;NB Normal transfer
        B       FPEWriteFPSRAndReturn_NonUser

;===========================================================================

FPE_STFS_User_R15

        CDebug0 2,"User mode STFS, address register is PC"

        FPE_STFSGetRegAndConvert
        FPE_UseInstrAddressPlus8
        STRT    OP1sue,[Rregval]                ;NB User mode transfer
        B       FPEWriteFPSRAndReturn_User

;===========================================================================

FPE_STFS_NonUser_R15

        CDebug0 2,"Non-user mode STFS, address register is PC"

        FPE_STFSGetRegAndConvert
        FPE_UseInstrAddressPlus8
        STMIA   Rregval,{OP1sue}                ;NB Normal transfer
        B       FPEWriteFPSRAndReturn_NonUser

;===========================================================================

FPE_STFD_User_R0toR14

        CDebug1 2,"User mode STFD, address register is",Rregno

        FPE_STFDGetRegAndConvert
        AND     Rregno,Rins,#DT_ARMreg_mask     ;Recover register number
        FPE_UseStackedAddress
        STRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        STRT    OP1mhi,[Rregval],#-4            ;",#-4" probably unnecessary
        STR     Rfpsr,MemFPSR

        [ :LNOT:FPEChecksNextInstr
          FPInstrDone
        |

; Point at the next instruction.

          [ {CONFIG} = 32
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG} = 26
            LDR     Rtmp,[Rfp,#15*4]
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNET  Rins,[Rtmp2]
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
        ]

        Return

;===========================================================================

        LTORG

;===========================================================================

FPE_STFD_NonUser_R0toR14

        CDebug1 2,"Non-user mode STFD, address register is",Rregno

        FPE_STFDGetRegAndConvert
        AND     Rregno,Rins,#DT_ARMreg_mask     ;Recover register number

; Split according to whether the address register is R0-R12 or R13-R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPE_STFD_NonUser_R13toR14

FPE_STFD_NonUser_Stacked
        FPE_UseStackedAddress
        STMIA   Rregval,{OP1sue,OP1mhi}         ;NB Normal transfer
        ASSERT  OP1sue < OP1mhi
        B       FPEWriteFPSRAndReturn_NonUser

FPE_STFD_NonUser_R13toR14

        FPE_UseOtherModeAddress FPE_STFD_NonUser_Stacked
        STMIA   Rregval,{OP1sue,OP1mhi}         ;NB Normal transfer
        ASSERT  OP1sue < OP1mhi
        B       FPEWriteFPSRAndReturn_NonUser

;===========================================================================

FPE_STFD_User_R15

        CDebug0 2,"User mode STFD, address register is PC"

        FPE_STFDGetRegAndConvert
        FPE_UseInstrAddressPlus8
        STRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        STRT    OP1mhi,[Rregval],#-4            ;",#-4" probably unnecessary
        B       FPEWriteFPSRAndReturn_User

;===========================================================================

FPE_STFD_NonUser_R15

        CDebug0 2,"Non-user mode STFD, address register is PC"

        FPE_STFDGetRegAndConvert
        FPE_UseInstrAddressPlus8
        STMIA   Rregval,{OP1sue,OP1mhi}         ;NB Normal transfer
        ASSERT  OP1sue < OP1mhi
        B       FPEWriteFPSRAndReturn_NonUser

;===========================================================================

FPE_STFE_User_R0toR14

        CDebug1 2,"User mode STFE, address register is",Rregno

        FPE_STFEGetRegAndConvert
        AND     Rregno,Rins,#DT_ARMreg_mask     ;Recover register number
        FPE_UseStackedAddress
        STRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        STRT    OP1mhi,[Rregval],#4
        STRT    OP1mlo,[Rregval],#-8            ;",#-8" may be unnecessary
        STR     Rfpsr,MemFPSR

        [ :LNOT:FPEChecksNextInstr
          FPInstrDone
        |

; Point at the next instruction.

          [ {CONFIG} = 32
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG} = 26
            LDR     Rtmp,[Rfp,#15*4]
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNET  Rins,[Rtmp2]
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
        ]

        Return

;===========================================================================

        LTORG

;===========================================================================

FPE_STFE_NonUser_R0toR14

        CDebug1 2,"Non-user mode STFE, address register is",Rregno

        FPE_STFEGetRegAndConvert
        AND     Rregno,Rins,#DT_ARMreg_mask     ;Recover register number

; Split according to whether the address register is R0-R12 or R13-R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPE_STFE_NonUser_R13toR14

FPE_STFE_NonUser_Stacked
        FPE_UseStackedAddress
        STMIA   Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        B       FPEWriteFPSRAndReturn_NonUser

FPE_STFE_NonUser_R13toR14

        FPE_UseOtherModeAddress FPE_STFE_NonUser_Stacked
        STMIA   Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        B       FPEWriteFPSRAndReturn_NonUser

;===========================================================================

FPE_STFE_User_R15

        CDebug0 2,"User mode STFE, address register is PC"

        FPE_STFEGetRegAndConvert
        FPE_UseInstrAddressPlus8
        STRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        STRT    OP1mhi,[Rregval],#4
        STRT    OP1mlo,[Rregval],#-8            ;",#-8" may be unnecessary
        B       FPEWriteFPSRAndReturn_User

;===========================================================================

FPE_STFE_NonUser_R15

        CDebug0 2,"Non-user mode STFE, address register is PC"

        FPE_STFEGetRegAndConvert
        FPE_UseInstrAddressPlus8
        STMIA   Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        B       FPEWriteFPSRAndReturn_NonUser

;===========================================================================

        [ :LNOT:NoPacked

FPE_STFP_User_R0toR14

        CDebug1 2,"User mode STFP, address register is",Rregno

        FPE_STFPGetRegAndConvert
        AND     Rregno,Rins,#DT_ARMreg_mask     ;Recover register number
        FPE_UseStackedAddress
        TST     Rfpsr,#EP_bit
        STRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        STRT    OP1mhi,[Rregval],#4
        STRT    OP1mlo,[Rregval],#4
        STRNET  Rarith,[Rregval]
        B       FPEWriteFPSRAndReturn_User

;===========================================================================

FPE_STFP_NonUser_R0toR14

        CDebug1 2,"Non-user mode STFP, address register is",Rregno

        FPE_STFPGetRegAndConvert
        AND     Rregno,Rins,#DT_ARMreg_mask     ;Recover register number

; Split according to whether the address register is R0-R12 or R13-R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPE_STFP_NonUser_R13toR14

FPE_STFP_NonUser_Stacked
        FPE_UseStackedAddress
        TST     Rfpsr,#EP_bit
        STMEQIA Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        STMNEIA Rregval,{OP1sue,OP1mhi,OP1mlo,Rarith}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < Rarith
        B       FPEWriteFPSRAndReturn_NonUser

FPE_STFP_NonUser_R13toR14

        FPE_UseOtherModeAddress FPE_STFP_NonUser_Stacked
        TST     Rfpsr,#EP_bit
        STMEQIA Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        STMNEIA Rregval,{OP1sue,OP1mhi,OP1mlo,Rarith}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < Rarith
        B       FPEWriteFPSRAndReturn_NonUser

;===========================================================================

FPE_STFP_User_R15

        CDebug0 2,"User mode STFP, address register is PC"

        FPE_STFPGetRegAndConvert
        FPE_UseInstrAddressPlus8
        TST     Rfpsr,#EP_bit
        STRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        STRT    OP1mhi,[Rregval],#4
        STRT    OP1mlo,[Rregval],#4
        STRNET  Rarith,[Rregval]
        B       FPEWriteFPSRAndReturn_User

;===========================================================================

FPE_STFP_NonUser_R15

        CDebug0 2,"Non-user mode STFP, address register is PC"

        FPE_STFPGetRegAndConvert
        FPE_UseInstrAddressPlus8
        TST     Rfpsr,#EP_bit
        STMEQIA Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        STMNEIA Rregval,{OP1sue,OP1mhi,OP1mlo,Rarith}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo
        ASSERT  OP1mlo < Rarith
        B       FPEWriteFPSRAndReturn_NonUser

        ]

;===========================================================================

FPE_LDFS_User_R0toR14

        CDebug1 2,"User mode LDFS, address register is",Rregno

        FPE_UseStackedAddress

FPE_LDFS_User_GetValue

        LDRT    OP1sue,[Rregval]                ;NB User mode transfer

FPE_LDFS_User_Convert

; Separate sign, exponent and fraction.

        MOVS    OP1sue,OP1sue,LSL #1    ;C:=sign; Z:=value is a zero
        MOV     OP1mhi,OP1sue,LSL #7    ;Fraction in bits 30:8 of OP1mhi
        MOV     OP1sue,OP1sue,LSR #23   ;Exponent in bits 8:1 of OP1sue

; Rebias exponent and recombine with sign.

        ADDNE   OP1sue,OP1sue,#(EIExp_bias - SExp_bias):SHL:1
        MOV     OP1sue,OP1sue,RRX       ;Recombine sign and exponent

; If this is a zero, the high word of the mantissa is correct. Otherwise,
; its units bit needs to be set (even for denormalised numbers). In either
; case, the low word should be zero.

        ORRNE   OP1mhi,OP1mhi,#EIUnits_bit
        MOV     OP1mlo,#0

; Now we need to set the uncommon bit correctly. It should be set if the
; exponent is now &3F80 (i.e. a denormalised number) or &407F (a NaN or
; infinity). Since the exponent is necessarily either &0000 or in the range
; &3F80 to &407F, we can determine this by checking whether the low 8 bits
; of the exponent are &7F or &80.

        MOVS    Rtmp,OP1sue,LSL #25
        EORCCS  Rtmp,Rtmp,#&7F:SHL:25
        ORREQ   OP1sue,OP1sue,#Uncommon_bit

; Put the result into the correct register, then return. There's no need to
; write back the FPSR, since we certainly haven't changed it.

        PutDst  FPE,OP1regs,Rins,Rtmp

        [ :LNOT:FPEChecksNextInstr
          FPInstrDone
        |

; Point at the next instruction.

          [ {CONFIG} = 32
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG} = 26
            LDR     Rtmp,[Rfp,#15*4]
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNET  Rins,[Rtmp2]
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
        ]

        Return

;===========================================================================

        LTORG

;===========================================================================

FPE_LDFS_NonUser_R0toR14

        CDebug1 2,"Non-user mode LDFS, address register is",Rregno

; Split according to whether the address register is R0-R12 or R13-R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPE_LDFS_NonUser_R13toR14

FPE_LDFS_NonUser_Stacked
        FPE_UseStackedAddress
        LDMIA   Rregval,{OP1sue}                ;NB Normal transfer

FPE_LDFS_NonUser_Convert

; Separate sign, exponent and fraction.

        MOVS    OP1sue,OP1sue,LSL #1    ;C:=sign; Z:=value is a zero
        MOV     OP1mhi,OP1sue,LSL #7    ;Fraction in bits 30:8 of OP1mhi
        MOV     OP1sue,OP1sue,LSR #23   ;Exponent in bits 8:1 of OP1sue

; Rebias exponent and recombine with sign.

        ADDNE   OP1sue,OP1sue,#(EIExp_bias - SExp_bias):SHL:1
        MOV     OP1sue,OP1sue,RRX       ;Recombine sign and exponent

; If this is a zero, the high word of the mantissa is correct. Otherwise,
; its units bit needs to be set (even for denormalised numbers). In either
; case, the low word should be zero.

        ORRNE   OP1mhi,OP1mhi,#EIUnits_bit
        MOV     OP1mlo,#0

; Now we need to set the uncommon bit correctly. It should be set if the
; exponent is now &3F80 (i.e. a denormalised number) or &407F (a NaN or
; infinity). Since the exponent is necessarily either &0000 or in the range
; &3F80 to &407F, we can determine this by checking whether the low 8 bits
; of the exponent are &7F or &80.

        MOVS    Rtmp,OP1sue,LSL #25
        EORCCS  Rtmp,Rtmp,#&7F:SHL:25
        ORREQ   OP1sue,OP1sue,#Uncommon_bit

; Put the result into the correct register, then return. There's no need to
; write back the FPSR, since we certainly haven't changed it.

        PutDst  FPE,OP1regs,Rins,Rtmp

        [ :LNOT:FPEChecksNextInstr
          FPInstrDone
        |

; Point at the next instruction.

          [ {CONFIG} = 32
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG} = 26
            LDR     Rtmp,[Rfp,#15*4]
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNE   Rins,[Rtmp2]                  ;NB Standard transfer
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
        ]

        Return

FPE_LDFS_NonUser_R13toR14

        FPE_LoadFromOtherModeAddress FPE_LDFS_NonUser_Stacked,0
        B       FPE_LDFS_NonUser_Convert

;===========================================================================

FPE_LDFS_User_R15

        CDebug0 2,"User mode LDFS, address register is PC"

        FPE_UseInstrAddressPlus8
        B       FPE_LDFS_User_GetValue

;===========================================================================

FPE_LDFS_NonUser_R15

        CDebug0 2,"Non-user mode LDFS, address register is PC"

        FPE_UseInstrAddressPlus8
        LDMIA   Rregval,{OP1sue}                ;NB Normal transfer
        B       FPE_LDFS_NonUser_Convert

;===========================================================================

FPE_LDFD_User_R0toR14

        CDebug1 2,"User mode LDFD, address register is",Rregno

        FPE_UseStackedAddress

FPE_LDFD_User_GetValue

        LDRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        LDRT    OP1mlo,[Rregval],#-4            ;",#-4" probably unnecessary

FPE_LDFD_User_Convert

; Separate sign, exponent and fraction.

        MOVS    OP1sue,OP1sue,LSL #1    ;C:=sign; Z:=exp & frac.top zero
        TEQEQ   OP1mlo,#0               ;C unchanged; Z:=value is a zero
        MOV     OP1mhi,OP1sue,LSL #10   ;Frac.top in bits 30:11 of OP1mhi
        MOV     OP1sue,OP1sue,LSR #20   ;Exponent in bits 11:1 of OP1sue
        ORR     OP1mhi,OP1mhi,OP1mlo,LSR #21 ;Fraction in bits 30:0 of
        MOV     OP1mlo,OP1mlo,LSL #11        ; OP1mhi and 31:11 of OP1mlo

; Rebias exponent and recombine with sign.

        ADDNE   OP1sue,OP1sue,#(EIExp_bias - DExp_bias):SHL:1
        MOV     OP1sue,OP1sue,RRX       ;Recombine sign and exponent

; If this is a zero, the mantissa is now correct. Otherwise, its units bit
; needs to be set (even for denormalised numbers).

        ORRNE   OP1mhi,OP1mhi,#EIUnits_bit

; Now we need to set the uncommon bit correctly. It should be set if the
; exponent is now &3C00 (i.e. a denormalised number) or &43FF (a NaN or
; infinity). Since the exponent is necessarily either &0000 or in the range
; &3C00 to &43FF, we can determine this by checking whether the low 11 bits
; of the exponent are &3FF or &400.

        MOVS    Rtmp,OP1sue,LSL #22
        EORCC   Rtmp,Rtmp,#&300:SHL:22
        EORCCS  Rtmp,Rtmp,#&FF:SHL:22
        ORREQ   OP1sue,OP1sue,#Uncommon_bit

; Put the result into the correct register, then return. There's no need to
; write back the FPSR, since we certainly haven't changed it.

        PutDst  FPE,OP1regs,Rins,Rtmp

        [ :LNOT:FPEChecksNextInstr
          FPInstrDone
        |

; Point at the next instruction.

          [ {CONFIG} = 32
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG} = 26
            LDR     Rtmp,[Rfp,#15*4]
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNET  Rins,[Rtmp2]
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
        ]

        Return

;===========================================================================

        LTORG

;===========================================================================

FPE_LDFD_NonUser_R0toR14

        CDebug1 2,"Non-user mode LDFD, address register is",Rregno

; Split according to whether the address register is R0-R12 or R13-R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPE_LDFD_NonUser_R13toR14

FPE_LDFD_NonUser_Stacked
        FPE_UseStackedAddress
        LDMIA   Rregval,{OP1sue,OP1mlo}         ;NB Normal transfer

FPE_LDFD_NonUser_Convert

; Separate sign, exponent and fraction.

        MOVS    OP1sue,OP1sue,LSL #1    ;C:=sign; Z:=exp & frac.top zero
        TEQEQ   OP1mlo,#0               ;C unchanged; Z:=value is a zero
        MOV     OP1mhi,OP1sue,LSL #10   ;Frac.top in bits 30:11 of OP1mhi
        MOV     OP1sue,OP1sue,LSR #20   ;Exponent in bits 11:1 of OP1sue
        ORR     OP1mhi,OP1mhi,OP1mlo,LSR #21 ;Fraction in bits 30:0 of
        MOV     OP1mlo,OP1mlo,LSL #11        ; OP1mhi and 31:11 of OP1mlo

; Rebias exponent and recombine with sign.

        ADDNE   OP1sue,OP1sue,#(EIExp_bias - DExp_bias):SHL:1
        MOV     OP1sue,OP1sue,RRX       ;Recombine sign and exponent

; If this is a zero, the mantissa is now correct. Otherwise, its units bit
; needs to be set (even for denormalised numbers).

        ORRNE   OP1mhi,OP1mhi,#EIUnits_bit

; Now we need to set the uncommon bit correctly. It should be set if the
; exponent is now &3C00 (i.e. a denormalised number) or &43FF (a NaN or
; infinity). Since the exponent is necessarily either &0000 or in the range
; &3C00 to &43FF, we can determine this by checking whether the low 11 bits
; of the exponent are &3FF or &400.

        MOVS    Rtmp,OP1sue,LSL #22
        EORCC   Rtmp,Rtmp,#&300:SHL:22
        EORCCS  Rtmp,Rtmp,#&FF:SHL:22
        ORREQ   OP1sue,OP1sue,#Uncommon_bit

; Put the result into the correct register, then return. There's no need to
; write back the FPSR, since we certainly haven't changed it.

        PutDst  FPE,OP1regs,Rins,Rtmp

        [ :LNOT:FPEChecksNextInstr
          FPInstrDone
        |

; Point at the next instruction.

          [ {CONFIG} = 32
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG} = 26
            LDR     Rtmp,[Rfp,#15*4]
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNE   Rins,[Rtmp2]                  ;NB Standard transfer
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
        ]

        Return

FPE_LDFD_NonUser_R13toR14

        FPE_LoadFromOtherModeAddress FPE_LDFD_NonUser_Stacked,1
        B       FPE_LDFD_NonUser_Convert

;===========================================================================

FPE_LDFD_User_R15

        CDebug0 2,"User mode LDFD, address register is PC"

        FPE_UseInstrAddressPlus8
        B       FPE_LDFD_User_GetValue

;===========================================================================

FPE_LDFD_NonUser_R15

        CDebug0 2,"Non-user mode LDFD, address register is PC"

        FPE_UseInstrAddressPlus8
        LDMIA   Rregval,{OP1sue,OP1mlo}         ;NB Normal transfer
        B       FPE_LDFD_NonUser_Convert

;===========================================================================

FPE_LDFE_User_R0toR14

        CDebug1 2,"User mode LDFE, address register is",Rregno

        FPE_UseStackedAddress

FPE_LDFE_User_GetValue

        LDRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        LDRT    OP1mhi,[Rregval],#4
        LDRT    OP1mlo,[Rregval],#-8            ;",#-8" probably unnecessary

FPE_LDFE_User_Convert

; Clear the reserved bits.

        BIC     OP1sue,OP1sue,#IRsv_mask_pt1
        BIC     OP1sue,OP1sue,#IRsv_mask_pt2

; Now we need to set the uncommon bit correctly. It should be set if the
; exponent is &7FFF, or if the units bit is 0 and the number is not actually
; a zero.

        TST     OP1mhi,#EIUnits_bit             ;EQ if units bit is zero,
        MVNNE   Rtmp,OP1sue                     ; or if exponent is &7FFF
        MOVNES  Rtmp,Rtmp,LSL #32-EIExp_len
        ASSERT  EIExp_pos = 0

        ORREQ   OP1sue,OP1sue,#Uncommon_bit     ;Get uncommon bit right for
        BICNE   OP1sue,OP1sue,#Uncommon_bit     ; all but zeros

        ORR     Rtmp,OP1mhi,OP1mlo              ;Check for a zero
        ORRS    Rtmp,Rtmp,OP1sue,LSL #32-EIExp_len
        BICEQ   OP1sue,OP1sue,#Uncommon_bit     ;Clear uncommon bit if so

; Put the result into the correct register, then return. There's no need to
; write back the FPSR, since we certainly haven't changed it.

        PutDst  FPE,OP1regs,Rins,Rtmp

        [ :LNOT:FPEChecksNextInstr
          FPInstrDone
        |

; Point at the next instruction.

          [ {CONFIG} = 32
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG} = 26
            LDR     Rtmp,[Rfp,#15*4]
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNET  Rins,[Rtmp2]
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
        ]

        Return

;===========================================================================

        LTORG

;===========================================================================

FPE_LDFE_NonUser_R0toR14

        CDebug1 2,"Non-user mode LDFE, address register is",Rregno

; Split according to whether the address register is R0-R12 or R13-R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPE_LDFE_NonUser_R13toR14

FPE_LDFE_NonUser_Stacked
        FPE_UseStackedAddress
        LDMIA   Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer

FPE_LDFE_NonUser_Convert

; Clear the reserved bits.

        BIC     OP1sue,OP1sue,#IRsv_mask_pt1
        BIC     OP1sue,OP1sue,#IRsv_mask_pt2

; Now we need to set the uncommon bit correctly. It should be set if the
; exponent is &7FFF, or if the units bit is 0 and the number is not actually
; a zero.

        TST     OP1mhi,#EIUnits_bit             ;EQ if units bit is zero,
        MVNNE   Rtmp,OP1sue                     ; or if exponent is &7FFF
        MOVNES  Rtmp,Rtmp,LSL #32-EIExp_len
        ASSERT  EIExp_pos = 0

        ORREQ   OP1sue,OP1sue,#Uncommon_bit     ;Get uncommon bit right for
        BICNE   OP1sue,OP1sue,#Uncommon_bit     ; all but zeros

        ORR     Rtmp,OP1mhi,OP1mlo              ;Check for a zero
        ORRS    Rtmp,Rtmp,OP1sue,LSL #32-EIExp_len
        BICEQ   OP1sue,OP1sue,#Uncommon_bit     ;Clear uncommon bit if so

; Put the result into the correct register, then return. There's no need to
; write back the FPSR, since we certainly haven't changed it.

        PutDst  FPE,OP1regs,Rins,Rtmp

        [ :LNOT:FPEChecksNextInstr
          FPInstrDone
        |

; Point at the next instruction.

          [ {CONFIG} = 32
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG} = 26
            LDR     Rtmp,[Rfp,#15*4]
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNE   Rins,[Rtmp2]                  ;NB Standard transfer
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
        ]

        Return

FPE_LDFE_NonUser_R13toR14

        FPE_LoadFromOtherModeAddress FPE_LDFE_NonUser_Stacked,2
        B       FPE_LDFE_NonUser_Convert

;===========================================================================

FPE_LDFE_User_R15

        CDebug0 2,"User mode LDFE, address register is PC"

        FPE_UseInstrAddressPlus8
        B       FPE_LDFE_User_GetValue

;===========================================================================

FPE_LDFE_NonUser_R15

        CDebug0 2,"Non-user mode LDFE, address register is PC"

        FPE_UseInstrAddressPlus8
        LDMIA   Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        B       FPE_LDFE_NonUser_Convert

;===========================================================================

        [ :LNOT:NoPacked

FPE_LDFP_User_R0toR14

        CDebug1 2,"User mode LDFP, address register is",Rregno

        FPE_UseStackedAddress

FPE_LDFP_User_GetValue

        TST     Rfpsr,#EP_bit
        LDRT    OP1sue,[Rregval],#4             ;NB User mode transfer
        LDRT    OP1mhi,[Rregval],#4
        LDRT    OP1mlo,[Rregval],#4
        LDRNET  Rarith,[Rregval]

FPE_LDFP_Convert

        CDebug4 3,"Unconverted value is",OP1sue,OP1mhi,OP1mlo,Rarith
        BL      LDFConvertFPE_Packed
        CDebug3 3,"Converted value is",OP1sue,OP1mhi,OP1mlo

; Put the result into the correct register, then return. There's no need to
; write back the FPSR, since we certainly haven't changed it.

        PutDst  FPE,OP1regs,Rins,Rtmp
        B       FPEWriteFPSRAndReturn

;===========================================================================

        LTORG

;===========================================================================

FPE_LDFP_NonUser_R0toR14

        CDebug1 2,"Non-user mode LDFP, address register is",Rregno

; Split according to whether the address register is R0-R12 or R13-R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPE_LDFP_NonUser_R13toR14

FPE_LDFP_NonUser_Stacked
        FPE_UseStackedAddress
        TST     Rfpsr,#EP_bit
        LDMEQIA Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        LDMNEIA Rregval,{OP1sue,OP1mhi,OP1mlo,Rarith}
        B       FPE_LDFP_Convert

FPE_LDFP_NonUser_R13toR14

        FPE_LoadFromOtherModeAddress FPE_LDFP_NonUser_Stacked,3
        B       FPE_LDFP_Convert

;===========================================================================

FPE_LDFP_User_R15

        CDebug0 2,"User mode LDFP, address register is PC"

        FPE_UseInstrAddressPlus8
        B       FPE_LDFP_User_GetValue

;===========================================================================

FPE_LDFP_NonUser_R15

        CDebug0 2,"Non-user mode LDFP, address register is PC"

        FPE_UseInstrAddressPlus8
        TST     Rfpsr,#EP_bit
        LDMEQIA Rregval,{OP1sue,OP1mhi,OP1mlo}  ;NB Normal transfer
        LDMNEIA Rregval,{OP1sue,OP1mhi,OP1mlo,Rarith}
        B       FPE_LDFP_Convert

        ]

;===========================================================================

; The following code is placed rather oddly: the reason is to do with
; addressability of the shared tables.

FPE_CPDO_Continue

        CDebug3 3,"Raw result =",OP1sue,OP1mhi,OP1mlo

; We've returned from the subroutine, which means that this is a defined and
; implemented instruction. If the value we've received back has its uncommon
; bit set, it's the correct result. If it doesn't, we need to round it and
; look for rounding exceptions.

        TST     OP1sue,#Uncommon_bit
        BNE     FPEFullResult_Shared

FPE_CPDO_RoundResult

; Extract the precision and rounding mode from the instruction data.

        CDebug2 3,"with exponent, round/sticky",RNDexp,Rarith

        AND     RNDprm,Rins,#(RM_mask+Pr2_mask)
        AND     Rtmp,Rins,#Pr1_mask
        BiShift ORR,RNDprm,RNDprm,Rtmp,LSR #Pr1_pos,LSL #(RM_pos+3)
        ASSERT  ((RM_mask+Pr2_mask):SHR:RM_pos) + (Pr1_mask:SHR:(Pr1_pos-3)) = &F
        ASSERT  (RM_pos+4) <= 32

; Round the result.

        MOV     RNDdir,#0               ;Result has not been rounded so far
        BL      RoundNum

        CDebug3 3,"Rounded result =",OP1sue,OP1mhi,OP1mlo
        CDebug2 3,"with exponent, rounding direction",RNDexp,RNDdir

; Check exponent against maximum and minimum allowed exponents for this
; precision, putting lower limit in Rtmp, upper limit in Rtmp2.

        [ CoreDebugging = 0
          ADR     Rtmp,FPEExpLimits
        |
          ADRL    Rtmp,FPEExpLimits
        ]
        BiShift ADD,Rtmp,Rtmp,RNDprm,LSR #RM_pos,LSL #3
        LDMIA   Rtmp,{Rtmp,Rtmp2}
        ASSERT  Rtmp < Rtmp2
        CMP     RNDexp,Rtmp2                            ;Check for overflow
        CMPLE   Rtmp,RNDexp                             ; or underflow
        BGT     FPEExpOutOfRange
        ORR     OP1sue,OP1sue,RNDexp,LSL #EIExp_pos     ;Recombine exponent
                                                        ; with sign/uncommon

FPECheckInexact

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
        ASSERT  SysID_FPE <> 0  ; shifted out)
        ASSERT  SysID_pos > IXE_pos
        ORRCC   Rfpsr,Rfpsr,#IXC_bit
        BLHI    InexactTrapForSDE ;Works because HI = CS/NE

FPEFullResult_Shared

        CDebug3 3,"Final result =",OP1sue,OP1mhi,OP1mlo

; Now we can put the result back into the floating point registers.

        PutDst  FPE,OP1regs,Rins,Rtmp

; Write the possibly updated FPSR back, then return.

FPEWriteFPSRAndReturn

        [ :LNOT:FPEChecksNextInstr
FPEWriteFPSRAndReturn_User
FPEWriteFPSRAndReturn_NonUser
        ]

        STR     Rfpsr,MemFPSR

FPEReturn

        [ :LNOT:FPEChecksNextInstr

FPEReturn_User
FPEReturn_NonUser

          FPInstrDone

        |

; Split according to whether we've got user mode or not. If so, point at the
; next instruction.

          [ {CONFIG}=32
            GetMode Rtmp
            BNE     FPEReturn_NonUser
            LDR     Rtmp2,[Rfp,#15*4]
          ]

          [ {CONFIG}=26
            LDR     Rtmp,[Rfp,#15*4]
            TST     Rtmp,#Mode_mask
            ASSERT  Mode_USR26 = 0
            BNE     FPEReturn_NonUser
            BIC     Rtmp2,Rtmp,#PSR_mask
          ]

; Do the exit processing.

          FPInstrDone WithFPEOptimisation

; If exit processing permits, get the next instruction and check it for
; coprocessor instructions and SWIs. Branch off to the "next instruction may
; be floating point" code if so. Note that this is done as a
; branch-and-link, to give that code a quick escape route if it discovers
; that it isn't floating point.

          LDRNET  Rins,[Rtmp2]
          [ {CONFIG} = 26
            ANDNE   Rtmp2,Rins,Rins,LSL #1
            TSTNE   Rtmp2,#&08000000
          ]
          [ {CONFIG} = 32
            ANDNE   Rtmp,Rins,Rins,LSL #1
            TSTNE   Rtmp,#&08000000
          ]
          BLNE    FPE_MaybeAnotherFPInstr
        ]

        Return

FPEExpOutOfRange

; We've got overflow or underflow. Call the appropriate routine, returning
; to FPECheckInexact.

        ADR     R14,FPECheckInexact
        SUBS    Rtmp,Rtmp,RNDexp
        BGT     UnderflowForReg
        B       Overflow

;===========================================================================

        LTORG

;===========================================================================

; Table of minimum and maximum exponents for each precision and rounding
; mode combination.

FPEExpLimits
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

; The following table contains the constants, at 4 word boundaries to save
; instructions and time when accessing it.

FPEConstTable
                DCD     &00000000,&00000000,&00000000,0
                DCD     &00003FFF,&80000000,&00000000,0
                DCD     &00004000,&80000000,&00000000,0
                DCD     &00004000,&C0000000,&00000000,0
                DCD     &00004001,&80000000,&00000000,0
                DCD     &00004001,&A0000000,&00000000,0
                DCD     &00003FFE,&80000000,&00000000,0
                DCD     &00004002,&A0000000,&00000000,0

;===========================================================================

FPE_CPDOorCPRT

; Continue splitting according to the type of instruction, but first do some
; checks common to CPDOs and CPRTs.

        TST     Rins,#Pr1_mask  ;Packed precision CPDOs/CPRTs are undefined
        TSTNE   Rins,#Pr2_mask
        BNE     NotForUs1

        [ DynamicRounding
          TST     Rins,#RM_mask   ;Perform rounding mode override on Rins
          ANDEQ   Rtmp,Rfpsr,#RO_mask
          BiShift ORREQ,Rins,Rins,Rtmp,LSR #RO_pos,LSL #RM_pos
        ]

        TST     Rins,#RTnotDO_bit
        BNE     FPE_CPRT

FPE_CPDO

        CDebug0 2,"CPDO"

; Get the operand(s): this depends on whether this is a monadic or dyadic
; operation. The branch structure here is optimised for dyadic operations,
; since they are much more important in practice.

        TST     Rins,#DO_monad_bit
        BNE     FPE_CPDO_Monadic

FPE_CPDO_Dyadic

; We need to get the two operands.

        GetS12  FPE,OP1regs,OP2regs,Rins,Rtmp,Rtmp2

        CDebug3 2," op1 =",OP1sue,OP1mhi,OP1mlo
        CDebug3 2," op2 =",OP2sue,OP2mhi,OP2mlo

; Now we need to do a table-driven sort-of-subroutine call, based on the
; opcode. Note that for purely software-implemented instructions, as-yet-
; unimplemented instructions and as-yet-undefined instructions, this
; subroutine doesn't return. Also note that if it does return, it returns to
; FPE_CPDO_Continue below.

        AND     Rtmp,Rins,#Op1_mask
        [ CoreDebugging = 0
          ADR     LR,FPE_CPDO_Continue
        |
          ADRL    LR,FPE_CPDO_Continue
        ]
        BiShift ADD,PC,PC,Rtmp,LSR #Op1_pos,LSL #2

        BranchTablePad

        B       AddSubFPE       ;ADF
        B       MultFPE         ;MUF
        B       AddSubFPE       ;SUF
        B       AddSubFPE       ;RSF
        B       DivFPE          ;DVF
        B       DivFPE          ;RDF
        [ NoTranscendentals
          B       NotForUs1     ;POW is undefined
          B       NotForUs1     ;RPW is undefined
        |
          B       PowFPE        ;POW
          B       PowFPE        ;RPW
        ]
        B       RemFPE          ;RMF
        B       MultFPE         ;FML
        B       DivFPE          ;FDV
        B       DivFPE          ;FRD
        [ NoTranscendentals
          B       NotForUs1     ;POL is undefined
        |
          B       PolFPE        ;POL
        ]
        B       NotForUs1       ;Undefined
        B       NotForUs1       ;Undefined
        B       NotForUs1       ;Undefined

; Note that execution will resume at the label FPE_CPDO_Continue after the
; "subroutine call" above, assuming it returns.

FPE_CPDO_Monadic

; We need to get the operand.

        GetS2   FPE,OP1regs,Rins,Rtmp,Rtmp2

        CDebug3 2," op =",OP1sue,OP1mhi,OP1mlo

; Now we need to do a table-driven sort-of-subroutine call, based on the
; opcode. Note that for purely software-implemented instructions, as-yet-
; unimplemented instructions and as-yet-undefined instructions, this
; subroutine doesn't return. Also note that if it does return, it returns to
; FPE_CPDO_Continue below.

        AND     Rtmp,Rins,#Op1_mask
        [ CoreDebugging = 0
          ADR     LR,FPE_CPDO_Continue
        |
          ADRL    LR,FPE_CPDO_Continue
        ]
        BiShift ADD,PC,PC,Rtmp,LSR #Op1_pos,LSL #2

        BranchTablePad

        B       MoveFPE         ;MVF
        B       MoveFPE         ;MNF
        B       MoveFPE         ;ABS
        B       RndFPE          ;RND
        B       SqrtFPE         ;SQT
        [ NoTranscendentals
          B       NotForUs1     ;LOG is undefined
          B       NotForUs1     ;LGN is undefined
          B       NotForUs1     ;EXP is undefined
          B       NotForUs1     ;SIN is undefined
          B       NotForUs1     ;COS is undefined
          B       NotForUs1     ;TAN is undefined
          B       NotForUs1     ;ASN is undefined
          B       NotForUs1     ;ACS is undefined
          B       NotForUs1     ;ATN is undefined
        |
          B       LgnLogFPE     ;LOG
          B       LgnLogFPE     ;LGN
          B       ExpFPE        ;EXP
          B       SinCosFPE     ;SIN
          B       SinCosFPE     ;COS
          B       TanFPE        ;TAN
          B       AsnAcsFPE     ;ASN
          B       AsnAcsFPE     ;ACS
          B       AtnFPE        ;ATN
        ]
        B       UrdFPE          ;URD
        B       NormFPE         ;NRM

; Note that execution will resume at the label FPE_CPDO_Continue after the
; "subroutine call" above, assuming it returns.

;===========================================================================

FPE_CPRT

        CDebug0 2,"CPRT"

; It's a CPRT. Split according to which instruction it is.

        AND     Rtmp,Rins,#Op1_mask
        BiShift ADD,PC,PC,Rtmp,LSR #Op1_pos,LSL #2

        BranchTablePad

        B       FPE_FltBounce           ;FLT
        B       FPE_FixBounce           ;FIX
        B       FPE_WFSBounce           ;WFS
        B       FPE_RFSBounce           ;RFS
        B       NotForUs1               ;WFC (doesn't exist for FPE)
        B       NotForUs1               ;RFC (doesn't exist for FPE)
        B       NotForUs1               ;Undefined
        B       NotForUs1               ;Undefined
        B       NotForUs1               ;Undefined
        B       FPE_CompareBounce       ;CMF
        B       NotForUs1               ;Undefined
        B       FPE_CompareBounce       ;CNF
        B       NotForUs1               ;Undefined
        B       FPE_CompareBounce       ;CMFE
        B       NotForUs1               ;Undefined
        B       FPE_CompareBounce       ;CNFE

;===========================================================================

FPE_FixBounce

; This is a bounce caused by a FIX instruction. Get its operand, do the FIX,
; then use the standard integer result code below.

        GetS2   FPE,OP1regs,Rins,Rtmp,Rtmp2
        ADR     R14,FPEIntegerRes_GetRegNo      ;Faster replacement for
        B       FixFPE                          ; BL FixFPE/B ..._GetRegNo

;===========================================================================

FPE_CompareBounce

; This is a bounce caused by a compare instruction: we need to emulate the
; instruction. First, we need to get the two operands and do the compare.

        GetS12  FPE,OP1regs,OP2regs,Rins,Rtmp,Rtmp2
        BL      CompareFPE

; We need to write the integer result back to the destination register. The
; rules for doing this are described under 'FPE_RFSBounce' below. 
;
; Also note that we optimise this code for a destination register of R15,
; since this is by far the most common case for compare instructions (in
; fact, it's the only officially allowed case).

        AND     Rregno,Rins,#RT_ARMreg_mask
        TEQ     Rregno,#R15:SHL:RT_ARMreg_pos
        BNE     FPEIntegerRes

FPEIntegerRes_R15

; This result is for R15, so we write the stored flags in a way which
; depends on whether this is a 26-bit or 32-bit handler.

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

        B       FPEWriteFPSRAndReturn

;===========================================================================

FPE_RFSBounce

; This is a bounce caused by an RFS instruction. Just put the FPSR value in
; the right place, then enter the standard "return integer result" routine.

        MOV     Rarith,Rfpsr

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
; not R15, since a destination register of R15 for a FIX or RFS instruction
; should be very rare indeed!

FPEIntegerRes_GetRegNo

        AND     Rregno,Rins,#RT_ARMreg_mask

FPEIntegerRes

        CMP     Rregno,#R13:SHL:RT_ARMreg_pos
        BHS     FPEIntegerRes_R13to15

FPEIntegerRes_Stack

; This result simply needs to be written to the stack.

        BiShift STR,Rarith,Rfp,Rregno,LSR #RT_ARMreg_pos,LSL #2

; Now write back the possibly modified FPSR and return.

        B       FPEWriteFPSRAndReturn

FPEIntegerRes_R13to15

        TEQ     Rregno,#R15:SHL:RT_ARMreg_pos
        BEQ     FPEIntegerRes_R15

; This result is for R13 or R14. If the caller was in a User mode or System
; mode, we write the result to the stack; otherwise, we need to change modes
; to write the result back to the right register.

        GetMode Rtmp
        [ {CONFIG}=32
          TEQNE   Rtmp,#Mode_SYS32
        ]
        BEQ     FPEIntegerRes_Stack

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
          MSR     CPSR_c,Rtmp2                ;Change back to original mode
        ]

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
        ]

; Now write back the possibly modified FPSR and return.

        B       FPEWriteFPSRAndReturn_NonUser

;===========================================================================

FPE_WFSBounce

; This is a bounce caused by a WFS instruction. We need to pick up the
; integer register concerned: this involves the usual split into picking it
; up from the stack, changing mode to pick it up and reconstructing it from
; the return address (this last case is very weird - I cannot think of a
; sensible use for a WFS PC instruction!).
;
; Get the register number and split according to it.

        CDebug1 2,"This is a WFS instruction - frame pointer is",Rfp

        AND     Rregno,Rins,#RT_ARMreg_mask
        CMP     Rregno,#R13:SHL:RT_ARMreg_pos
        BHS     FPE_WFSBounce_R13to15

FPE_WFSBounce_Stack

; Pick up the correct register value from the stack.

        BiShift LDR,Rarith,Rfp,Rregno,LSR #RT_ARMreg_pos,LSL #2

FPE_WFSBounce_Common

; Force the SysId field to the correct value, then dump the value we've got
; in the FPSR and return.

        BIC     Rarith,Rarith,#SysID_mask
        ORR     Rfpsr,Rarith,#SysID_FPE:SHL:SysID_pos
        B       FPEWriteFPSRAndReturn

FPE_WFSBounce_R13to15
        CMP     Rregno,#R15:SHL:RT_ARMreg_pos
        BEQ     FPE_WFSBounce_R15

; If caller was in user mode, we get the value from the stack. Otherwise,
; we will have to change mode, get the register required and change mode
; back.

        GetMode Rtmp
        BEQ     FPE_WFSBounce_Stack

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
        ]

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
        ]

        B       FPE_WFSBounce_Common

FPE_WFSBounce_R15

; Get the instruction address plus 12. Note that we *don't* clear the PSR
; bits in 26-bit code.

        LDR     Rarith,[Rfp,#15*4]              ;Get (instr. address)+4

        [ {CONFIG}=26
          MOV     Rarith,Rarith,ROR #26         ;Put it at top of word
          ADD     Rarith,Rarith,#8:SHL:6        ;Now (instr. address)+12
          MOV     Rarith,Rarith,ROR #6          ;Put back in normal place
        ]

        [ {CONFIG}=32
          ADD     Rarith,Rarith,#8              ;Now (instr. address)+12
        ]

        B       FPE_WFSBounce_Common

;===========================================================================

FPE_FltBounce

; This is a bounce caused by a FLT instruction. We need to pick up the
; integer register concerned: this involves a split into picking it up from
; the stack and changing mode to pick it up. (The usual third option of
; reconstructing it from the return address isn't needed: FLT Fn,PC is no
; longer an architecturally defined instruction.)
;
; Get the register number and split according to it.

        AND     Rregno,Rins,#RT_ARMreg_mask
        CMP     Rregno,#R13:SHL:RT_ARMreg_pos
        BHS     FPE_FltBounce_R13to15

FPE_FltBounce_Stack

; Pick up the correct register value from the stack.

        BiShift LDR,Rarith,Rfp,Rregno,LSR #RT_ARMreg_pos,LSL #2

FPE_FltBounce_Common

; The value to be FLTed is now in Rarith. Call the FLT subroutine to convert
; it to pre-rounding form.

        BL      FltFPE

; Annoyingly, FLT has a different destination register field to most
; instructions with an arithmetic result, so we cannot share code...
;   Extract the precision and rounding mode from the instruction data.

        CDebug2 3,"with exponent, round/sticky",RNDexp,Rarith

        AND     RNDprm,Rins,#(RM_mask+Pr2_mask)
        AND     Rtmp,Rins,#Pr1_mask
        BiShift ORR,RNDprm,RNDprm,Rtmp,LSR #Pr1_pos,LSL #(RM_pos+3)
        ASSERT  ((RM_mask+Pr2_mask):SHR:RM_pos) + (Pr1_mask:SHR:(Pr1_pos-3)) = &F
        ASSERT  (RM_pos+4) <= 32

; Round the result.

        MOV     RNDdir,#0               ;Result has not been rounded so far
        BL      RoundNum

        CDebug3 3,"Rounded result =",OP1sue,OP1mhi,OP1mlo
        CDebug2 3,"with exponent, rounding direction",RNDexp,RNDdir

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
        ASSERT  SysID_FPE <> 0  ; shifted out)
        ASSERT  SysID_pos > IXE_pos
        ORRCC   Rfpsr,Rfpsr,#IXC_bit
        BLHI    InexactTrapForSDE ;Works because HI = CS/NE

        CDebug3 3,"Final result =",OP1sue,OP1mhi,OP1mlo

; Now we can put the result back into the floating point registers.

        PutFDst FPE,OP1regs,Rins,Rtmp

; Write the possibly updated FPSR back, then return.

        B       FPEWriteFPSRAndReturn

FPE_FltBounce_R13to15

; We can assume that the operand is in fact R13 or R14: MCR instructions
; with R15 as an operand are no longer architecturally defined. Before this
; was the case, the following code appeared here:
;
;         CMP     Rregno,#R15:SHL:RT_ARMreg_pos
;         BEQ     FPE_FltBounce_R15

; If caller was in user or system mode mode, we put the value on the stack.
; Otherwise, we will have to change mode, get the register required and
; change mode back.

        GetMode Rtmp
        [ {CONFIG}=32
          TEQNE   Rtmp,#Mode_SYS32
        ]
        BEQ     FPE_FltBounce_Stack

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
        ]

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
        ]

        B       FPE_FltBounce_Common

; The following is the original code for implementing FLT Fn,PC. This
; instruction is no longer architurally defined and so the code has been
; commented out.
;
; FPE_FltBounce_R15
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
;         B       FPE_FltBounce_Common

;===========================================================================

; Code to deal with the case of the FPE being disabled. Re-enable it, shift
; the return address back, then branch to 'veneer_coredisabled'. As usual,
; we simply subtract 4 from the return link regardless of whether this is
; 26-bit or 32-bit code.

FPE_Disabled

        CDebug1 2,"Gone to FPE_Disabled - frame pointer is",Rfp

        MOV     Rtmp,#0
        STR     Rtmp,DisableInfo
        LDR     Rtmp,[Rfp,#15*4]
        SUB     Rtmp,Rtmp,#4
        STR     Rtmp,[Rfp,#15*4]
        B       veneer_coredisabled

;===========================================================================

        LTORG

;===========================================================================

        [ UndefHandStandAlone

FPEMaybeCoproc2

        CMP     Rtmp2,#Coproc_2
        BNE     NotForUs

        ]

FPEUndefHandler_Coproc2

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

        CDebug1 1,"FPE: Coproc.2 instruction",Rins

; Is the system disabled? Branch out if so.

        LDR     Rtmp,DisableInfo
        TEQ     Rtmp,#0
        BNE     FPE_Disabled

; The return address on the stack is OK, so we can re-enable interrupts.

        InterruptEnable Rtmp

        [ FPEChecksNextInstr
FPE_NextInstrForCoproc2
        ]

; OK - it's for us, and it's a coprocessor 2 instruction. In FPASC terms,
; what we've got now is effectively always a synchronous bounce - i.e. we
; simply need to emulate the instruction in Rins.

; The following registers have their correct contents at this point:
;   Rsp, Rfp, Rins, Rwp
;
; Now we simply have to emulate the instruction that has been bounced. The
; first step is to split according to the type of the instruction. CPDOs and
; CPRTs for coprocessor 2 are simply not defined.

        TST     Rins,#RTDOnotDT_bit
        BNE     NotForUs2

FPE_CPDT2

        CDebug0 2,"LFM/SFM"

; We will now split according to three criteria:
;
;   * Load or store instruction?
;   * User or non-user mode?
;   * ARM register involved is R0-R14 or R15?
;
; Calculate an index, in the process putting the ARM register number in
; Rregno. Also put the number of registers left-aligned in RNDprm.

        MOV     Rtmp2,Rins,LSL #31-DT_LnotS_pos ;Get load/store bit
        AND     Rtmp2,Rtmp2,#&80000000
        AND     Rregno,Rins,#DT_ARMreg_mask     ;Isolate register number
        CMP     Rregno,#R15:SHL:DT_ARMreg_pos   ;Merge in R15 indicator
        ORRCS   Rtmp2,Rtmp2,#&40000000
        GetMode Rtmp                            ;Merge in user/non-user bit
        ORRNE   Rtmp2,Rtmp2,#&20000000

        MOV     RNDprm,Rins,LSL #31-DT_pr1_pos  ;Isolate register count
        AND     RNDprm,RNDprm,#&80000000
        TST     Rins,#DT_pr2_mask
        ORRNE   RNDprm,RNDprm,#&40000000

; The index in Rtmp2 now has:
;
;   Bit 31:      1 if load,          0 if store;
;   Bit 30:      1 if R15,           0 if R0-R14;
;   Bit 29:      1 if non-user mode, 0 if user mode.
;   Bits 28..0:  zeros
;
; Branch according to this index.

        CDebug1 2,"CPDT - branch index is",Rtmp2

        ADD     PC,PC,Rtmp2,LSR #27

        BranchTablePad

        B       FPE_SFM_User_R0toR14
        B       FPE_SFM_NonUser_R0toR14
        B       FPE_SFM_User_R15
        B       FPE_SFM_NonUser_R15
        B       FPE_LFM_User_R0toR14
        B       FPE_LFM_NonUser_R0toR14
        B       FPE_LFM_User_R15
        B       FPE_LFM_NonUser_R15

;===========================================================================

FPE_SFM_User_R0toR14

        CDebug1 2,"User mode SFM, address register is",Rregno

; We will use a 2-bit counter at the top of a register, which has already
; been set up in RNDprm. If we decrement it each time before testing for
; zero, we'll get the correct number of registers transferred.

        FPE_UseStackedAddress

FPE_SFM_User_Shared

; Similarly, we'll keep the floating point register number in a 3-bit
; counter at the top of a register, to make the wrapround work correctly.

        AND     Rregno,Rins,#DT_dst_mask
        MOV     Rregno,Rregno,LSL #29-DT_dst_pos
        ADR     Rtmp2,FPE_Regs

FPE_SFM_User_Loop

        [ FPE4WordsPerReg
          BiShift ADD,Rtmp,Rtmp2,Rregno,LSR #29,LSL #4  ;Address register
        |
          BiShift ADD,Rtmp,Rtmp2,Rregno,LSR #29,LSL #2  ;Address register
          BiShift ADD,Rtmp,Rtmp,Rregno,LSR #29,LSL #3
        ]  
        LDMIA   Rtmp,OP1regs                    ;Get register value
        STRT    OP1sue,[Rregval],#4             ;NB User mode transfer,
        STRT    OP1mhi,[Rregval],#4             ; effectively with
        STRT    OP1mlo,[Rregval],#4             ; writeback
        ADD     Rregno,Rregno,#1:SHL:29
        SUBS    RNDprm,RNDprm,#1:SHL:30
        BNE     FPE_SFM_User_Loop

        B       FPEReturn_User

;===========================================================================

FPE_SFM_NonUser_R0toR14

        CDebug1 2,"Non-user mode SFM, address register is",Rregno

; We will use a 2-bit counter at the top of a register, which has already
; been set up in RNDprm. If we decrement it each time before testing for
; zero, we'll get the correct number of registers transferred.
;   Split according to whether the address register is R0-R12 or R13-R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPE_SFM_NonUser_R13toR14

FPE_SFM_NonUser_Stacked
        FPE_UseStackedAddress

FPE_SFM_NonUser_Shared

; Similarly, we'll keep the floating point register number in a 3-bit
; counter at the top of a register, to make the wrapround work correctly.

        AND     Rregno,Rins,#DT_dst_mask
        MOV     Rregno,Rregno,LSL #29-DT_dst_pos
        ADR     Rtmp2,FPE_Regs

FPE_SFM_NonUser_Loop

        [ FPE4WordsPerReg
          BiShift ADD,Rtmp,Rtmp2,Rregno,LSR #29,LSL #4    ;Address register
        |
          BiShift ADD,Rtmp,Rtmp2,Rregno,LSR #29,LSL #2    ;Address register
          BiShift ADD,Rtmp,Rtmp,Rregno,LSR #29,LSL #3
        ]
        LDMIA   Rtmp,OP1regs                    ;Get register value
        STMIA   Rregval!,OP1regs                ;Store value
        ADD     Rregno,Rregno,#1:SHL:29
        SUBS    RNDprm,RNDprm,#1:SHL:30
        BNE     FPE_SFM_NonUser_Loop

        B       FPEReturn_NonUser

FPE_SFM_NonUser_R13toR14

        FPE_UseOtherModeAddress FPE_SFM_NonUser_Stacked
        B       FPE_SFM_NonUser_Shared

;===========================================================================

FPE_SFM_User_R15

        CDebug0 2,"User mode SFM, address register is the PC"

; We will use a 2-bit counter at the top of a register, which has already
; been set up in RNDprm. If we decrement it each time before testing for
; zero, we'll get the correct number of registers transferred.

        FPE_UseInstrAddressPlus8
        B       FPE_SFM_User_Shared

;===========================================================================

FPE_SFM_NonUser_R15

        CDebug0 2,"Non-user mode SFM, address register is the PC"

; We will use a 2-bit counter at the top of a register, which has already
; been set up in RNDprm. If we decrement it each time before testing for
; zero, we'll get the correct number of registers transferred.

        FPE_UseInstrAddressPlus8
        B       FPE_SFM_NonUser_Shared

;===========================================================================

FPE_LFM_User_R0toR14

        CDebug1 2,"User mode LFM, address register is",Rregno

; We will use a 2-bit counter at the top of a register, which has already
; been set up in RNDprm. If we decrement it each time before testing for
; zero, we'll get the correct number of registers transferred.

        FPE_UseStackedAddress

FPE_LFM_User_Shared

; Similarly, we'll keep the floating point register number in a 3-bit
; counter at the top of a register, to make the wrapround work correctly.

        AND     Rregno,Rins,#DT_dst_mask
        MOV     Rregno,Rregno,LSL #29-DT_dst_pos
        ADR     Rtmp2,FPE_Regs

FPE_LFM_User_Loop

; Get the value from memory.

        LDRT    OP1sue,[Rregval],#4             ;NB User mode transfer,
        LDRT    OP1mhi,[Rregval],#4             ; effectively with
        LDRT    OP1mlo,[Rregval],#4             ; writeback

        CDebug3 3,"Value from memory is",OP1sue,OP1mhi,OP1mlo

; Clear the reserved bits.

        BIC     OP1sue,OP1sue,#IRsv_mask_pt1
        BIC     OP1sue,OP1sue,#IRsv_mask_pt2

; Force the uncommon bit to 1 if this is not a legitimate common value. This
; means that it must be set if the exponent is &7FFF, or if the units bit is
; 0 and the number is not actually a zero. It must be left alone otherwise.

        TST     OP1mhi,#EIUnits_bit             ;EQ if units bit is zero,
        MVNNE   Rtmp,OP1sue                     ; or if exponent is &7FFF
        MOVNES  Rtmp,Rtmp,LSL #32-EIExp_len
        ASSERT  EIExp_pos = 0

        ORR     Rtmp,OP1mhi,OP1sue,LSL #1       ;Start check for a common
        ASSERT  Sign_pos = 31                   ; zero

        ORREQ   OP1sue,OP1sue,#Uncommon_bit     ;Set uncommon bit if EQ

        ORRS    Rtmp,Rtmp,OP1mlo                ;But undo this if it was a
        BICEQ   OP1sue,OP1sue,#Uncommon_bit     ; common zero

; Write the converted value to our "register" and loop or return.

        CDebug3 3,"Value to be held in register is",OP1sue,OP1mhi,OP1mlo

        [ FPE4WordsPerReg
          BiShift ADD,Rtmp,Rtmp2,Rregno,LSR #29,LSL #4
        |
          BiShift ADD,Rtmp,Rtmp2,Rregno,LSR #29,LSL #2
          BiShift ADD,Rtmp,Rtmp,Rregno,LSR #29,LSL #3
        ]

        CDebug1 3,"Address of register is",Rtmp

        STMIA   Rtmp,OP1regs
        ADD     Rregno,Rregno,#1:SHL:29
        SUBS    RNDprm,RNDprm,#1:SHL:30
        BNE     FPE_LFM_User_Loop

        B       FPEReturn_User

;===========================================================================

FPE_LFM_NonUser_R0toR14

        CDebug1 2,"Non-user mode LFM, address register is",Rregno

; We will use a 2-bit counter at the top of a register, which has already
; been set up in RNDprm. If we decrement it each time before testing for
; zero, we'll get the correct number of registers transferred.
;   Split according to whether the address register is R0-R12 or R13-R14.

        CMP     Rregno,#R13:SHL:DT_ARMreg_pos
        BHS     FPE_LFM_NonUser_R13toR14

FPE_LFM_NonUser_Stacked
        FPE_UseStackedAddress

FPE_LFM_NonUser_Shared

; Similarly, we'll keep the floating point register number in a 3-bit
; counter at the top of a register, to make the wrapround work correctly.

        AND     Rregno,Rins,#DT_dst_mask
        MOV     Rregno,Rregno,LSL #29-DT_dst_pos
        ADR     Rtmp2,FPE_Regs

FPE_LFM_NonUser_Loop

; Get the value from memory.

        LDMIA   Rregval!,OP1regs

        CDebug3 3,"Value from memory is",OP1sue,OP1mhi,OP1mlo

; Clear the reserved bits.

        BIC     OP1sue,OP1sue,#IRsv_mask_pt1
        BIC     OP1sue,OP1sue,#IRsv_mask_pt2

; Force the uncommon bit to 1 if this is not a legitimate common value. This
; means that it must be set if the exponent is &7FFF, or if the units bit is
; 0 and the number is not actually a zero. It must be left alone otherwise.

        TST     OP1mhi,#EIUnits_bit             ;EQ if units bit is zero,
        MVNNE   Rtmp,OP1sue                     ; or if exponent is &7FFF
        MOVNES  Rtmp,Rtmp,LSL #32-EIExp_len
        ASSERT  EIExp_pos = 0

        ORR     Rtmp,OP1mhi,OP1sue,LSL #1       ;Start check for a common
        ASSERT  Sign_pos = 31                   ; zero

        ORREQ   OP1sue,OP1sue,#Uncommon_bit     ;Set uncommon bit if EQ

        ORRS    Rtmp,Rtmp,OP1mlo                ;But undo this if it was a
        BICEQ   OP1sue,OP1sue,#Uncommon_bit     ; common zero

; Write the converted value to our "register" and loop or return.

        CDebug3 3,"Value to be held in register is",OP1sue,OP1mhi,OP1mlo

        [ FPE4WordsPerReg
          BiShift ADD,Rtmp,Rtmp2,Rregno,LSR #29,LSL #4
        |
          BiShift ADD,Rtmp,Rtmp2,Rregno,LSR #29,LSL #2
          BiShift ADD,Rtmp,Rtmp,Rregno,LSR #29,LSL #3
        ]

        CDebug1 3,"Address of register is",Rtmp

        STMIA   Rtmp,OP1regs
        ADD     Rregno,Rregno,#1:SHL:29
        SUBS    RNDprm,RNDprm,#1:SHL:30
        BNE     FPE_LFM_NonUser_Loop

        B       FPEReturn_NonUser

FPE_LFM_NonUser_R13toR14

        FPE_UseOtherModeAddress FPE_LFM_NonUser_Stacked
        B       FPE_LFM_NonUser_Shared

;===========================================================================

FPE_LFM_User_R15

        CDebug0 2,"User mode LFM, address register is the PC"

; We will use a 2-bit counter at the top of a register, which has already
; been set up in RNDprm. If we decrement it each time before testing for
; zero, we'll get the correct number of registers transferred.

        FPE_UseInstrAddressPlus8
        B       FPE_LFM_User_Shared

;===========================================================================

FPE_LFM_NonUser_R15

        CDebug0 2,"Non-user mode LFM, address register is the PC"

; We will use a 2-bit counter at the top of a register, which has already
; been set up in RNDprm. If we decrement it each time before testing for
; zero, we'll get the correct number of registers transferred.

        FPE_UseInstrAddressPlus8
        B       FPE_LFM_NonUser_Shared

;===========================================================================

        [ FPEChecksNextInstr

FPE_MaybeAnotherFPInstr

; This is the code which does the main checking for another floating point
; instruction. On arrival at this point, the registers are in the following
; state:
;   Rtmp holds the link value from the stack frame (26-bit code) or the
;     instruction being inspected ANDed with itself shifted left 1 bit
;     (32-bit code);
;   Rtmp2 holds the instruction being inspected ANDed with itself shifted
;     left 1 bit (26-bit code) or the link value from the stack frame
;     (32-bit code);
;   Rins holds the instruction being inspected, which is known to be a
;     coprocessor instruction or a SWI - i.e. bits 27 and 26 are both 1;
;   Rwp, Rfp and Rsp hold their usual values;
;   LR holds the place to return to if the instruction turns out not to be
;     another floating point instruction;
;   all other registers are unused;
;   the stack frame has been updated for the previous instruction - its link
;     value still points to the instruction being inspected, so will need to
;     be incremented by 4 if the instruction does turn out to be a floating
;     point instruction.
;
; The first thing to do is to verify that this really is a floating point
; instruction. It is known to be a SWI or a coprocessor instruction, so we
; must weed out SWIs and non-FPA coprocessors.

          AND     Rarith,Rins,#Coproc_mask
          TEQ     Rarith,#Coproc_1
          TEQNE   Rarith,#Coproc_2
          [ {CONFIG} = 26
            TSTEQ   Rtmp2,#&02000000            ;Check for SWIs
          ]
          [ {CONFIG} = 32
            TSTEQ   Rtmp,#&02000000             ;Check for SWIs
          ]
          MOVNE   PC,LR
          [ SupportARMv5
            ; Don't attempt to handle NV condition code instructions
            CMP     Rins,#&F0000000
            MOVCS   PC,LR
          ]

; This is indeed a floating point instruction. Update the frame to move past
; the instruction.

          [ {CONFIG} = 26
            ADD     Rtmp2,Rtmp,#4
          ]
          [ {CONFIG} = 32
            ADD     Rtmp2,Rtmp2,#4
          ]
          STR     Rtmp2,[Rfp,#15*4]

; The next problem is that the instruction may be conditional - on normal
; entry to the FPE, the ARM will already have checked this, but we have to
; check it ourselves when doing this "check next instruction" optimisation.
; We will take a short cut for the "always" condition, to re-enter the
; emulator code for the correct coprocessor.

          MOV     Rarith,Rins,LSR #28
          TEQ     Rarith,#&E
          BNE     FPE_ConditionalFPInstr
          TST     Rins,#1:SHL:Coproc_pos
          BNE     FPE_NextInstrForCoproc1
          B       FPE_NextInstrForCoproc2

FPE_ConditionalFPInstr

; There is a real condition to be tested. We do the condition test by a
; table-driven approach. Note that for 26-bit code, the condition flags are
; already in Rtmp; for 32-bit code, we will have to load them.

          [ {CONFIG} = 32
            LDR     Rtmp,[Rfp,#-8]
          ]
          ADR     Rtmp2,FPE_ConditionTable
          LDR     Rarith,[Rtmp2,Rarith,LSL #2]
          MOV     Rtmp,Rtmp,LSR #28
          MOVS    Rarith,Rarith,LSL Rtmp

; If the condition is not satisfied, we'll try the following instruction
; instead. Otherwise, we'll re-enter the emulator code for the correct
; coprocessor.

          BPL     FPEReturn
          TST     Rins,#1:SHL:Coproc_pos
          BNE     FPE_NextInstrForCoproc1
          B       FPE_NextInstrForCoproc2

; The following table indicates which sets of condition flags match each
; instruction condition field. Word N of the table encodes how condition
; field N should be treated; within each word, bit 31-i indicates whether
; the condition is satisfied if the 4 bit number (N,Z,C,V) is equal to i.

FPE_ConditionTable
          DCD     2_00001111000011110000000000000000    ;EQ
          DCD     2_11110000111100000000000000000000    ;NE
          DCD     2_00110011001100110000000000000000    ;CS/HS
          DCD     2_11001100110011000000000000000000    ;CC/LO
          DCD     2_00000000111111110000000000000000    ;MI
          DCD     2_11111111000000000000000000000000    ;PL
          DCD     2_01010101010101010000000000000000    ;VS
          DCD     2_10101010101010100000000000000000    ;VC
          DCD     2_00110000001100000000000000000000    ;HI
          DCD     2_11001111110011110000000000000000    ;LS
          DCD     2_10101010010101010000000000000000    ;GE
          DCD     2_01010101101010100000000000000000    ;LT
          DCD     2_10100000010100000000000000000000    ;GT
          DCD     2_01011111101011110000000000000000    ;LE
          DCD     2_11111111111111110000000000000000    ;AL (unused entry)
          DCD     2_00000000000000000000000000000000    ;NV

        ]

;===========================================================================

        ]

        END
