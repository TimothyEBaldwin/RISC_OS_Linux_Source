; Assembler source for FPA support code and emulator
; ==================================================
; Core top level assembler source file.
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

; Core release and change log
; ===========================
;
; Date         Core     Changes
;              version
; --------------------------------------------------------------------------
;                       [Changes not recorded until after version 1.00]
; 27-Jan-1993  0.00     First, still incomplete, version of FPASC/FPE core
;                         released to Acorn to allow veneer development to
;                         start.
; 23-Feb-1993  0.01     Intermediate version of "src.main" sent to Acorn.
; 04-Mar-1993  0.02     Intermediate version of "src.main" sent to Acorn.
; 08-Mar-1993  0.03     Intermediate version of "src.main" sent to Acorn.
; 15-Mar-1993  0.04     Second, still incomplete, version of FPASC/FPE core
;                         released to Acorn to allow veneer development to
;                         continue.
; 08-Apr-1993  0.05     Third, still incomplete, version of FPASC/FPE core
;                         released to Acorn.
; 19-Apr-1993  1.00     First full version of FPASC/FPE core released.
;                         Proper bug logging starts at this point.
; 21-Apr-1993  1.01     Bug [001], reported by Acorn: POW and RPW found to
;                         be failing on a^b, with b an integer, a not +/-1
;                         (DoIntegerPowers = {TRUE} version.)
; 26-Apr-1993  1.01     Bug [001] fixed;
;                       Bug [002], spotted during bug [001] fixing: the
;                         code after "Pow_Small" was testing the sign bit of
;                         the wrong register (OP2mhi, when it should have
;                         been OP2mlo). Would have produced slightly wrong
;                         results from some POW and RPW instructions with
;                         directed rounding modes. Fixed.
;                       Bug [003], found as part of bug [001] fixing: an
;                         omitted RFS instruction made POW/RPW massive
;                         overflow detection fail. Fixed.
;                       Bug [004], spotted during bug [001] fixing: RPW/POW
;                         core debugging message reports just one operand.
;                         Fixed.
;                       Bug [005], spotted during bug [001] fixing: EXP of
;                         large negative arguments overflows rather than
;                         underflows. Caused by putting sign of argument in
;                         wrong register. Fixed.
; 07-May-1993  1.02     Defined and implemented the "ZeroToTheZero" assembly
;                         time option after discovering the C definition of
;                         domain errors in the "pow" function.
;                       Bug [006], spotted during implementation of FPE's
;                         "two floating point instructions in a row"
;                         optimisation: in "src.core.fpeundef", the label
;                         "FPE_LDFP_Convert" led to code which ended
;                         "FPInstrDone", "B FPEWriteFPSRAndReturn". Since
;                         the label "FPEWriteFPSRAndReturn" led to another
;                         "FPInstrDone", this "FPInstrDone" was wrong. Fixed
;                         by removing the excess "FPInstrDone".
;                       Implemented the "FPEChecksNextInstr" optimisation.
; 11-May-1993  1.03     Bug [007], reported by Acorn: 'core_loadcontext' was
;                         sometimes making MemFPSR contain a software SysID
;                         on a hardware system, which disrupted subsequent
;                         calls to core_disable. Turned out to be caused by
;                         the software/hardware test at the start of the
;                         routine not being assembled when FPASCWanted and
;                         FPEWanted were {TRUE} and FPE4WordsPerReg was
;                         {FALSE}, due to incorrect conditional assembly.
;                         Fixed.
; 19-May-1993  1.03     Bug [008], reported by Acorn: after a non-user mode
;                         instruction, versions of the FPASC/FPE with
;                         FPEChecksNextInstr = {TRUE} were sometimes loading
;                         the next instruction with an LDRNET instruction,
;                         not an LDRNE instruction. Turned out to be LDF
;                         instructions, which branched to common code to do
;                         the format conversion; this common code later
;                         assumed that its caller was in user mode... Fixed
;                         by duplicating the common code.
; 29-Jul-1993  1.04     Bug [009], reported by Acorn: comparisons of normal
;                         extended precision infinities with single, double
;                         or anomalous extended precision infinities of the
;                         same sign didn't produce a "equal" result. Reason:
;                         the code in the compare routine to convert all
;                         infinities to normal extended precision ones
;                         failed to clear the units bit. Fixed.
; 24-Aug-1993  1.05     Bug [010], reported by Acorn: POW(x,y) was producing
;                         an answer near 2, not 1, when x was very large and
;                         y was very small. Tracked down to an error in
;                         calculating EXP(x) for very small values of x
;                         (specifically, for x < 2^-66). Fixed.
; 03-Dec-1993  1.06     Some incorrect "NOT YET DONE"s removed from the
;                         sources.
;                       Source file conventions changed, as described in the
;                         top level "main" source file.
;                       Bug [011], found by inspection: emulations of user
;                         mode LDFs, STFs, LFMs and SFMs were using
;                         LDM {...}^ and STM {...}^ instructions to do the
;                         transfer. This is incorrect because it doesn't
;                         tell the memory system to treat it as a user mode
;                         transfer by asserting Ntrans. Fixed by changing
;                         over to doing the transfers with LDRT and STRT
;                         instructions: this will unfortunately lead to a
;                         slight loss of performance for all but single
;                         precision transfers.
;                       Bug [012], reported by HMeekings and Acorn: STFP
;                         failed on denormalised numbers (and also on
;                         extended unnormalised numbers). This was caused by
;                         failing to keep track of the difference between
;                         the original exponent of the number and the
;                         exponent after it had been normalised correctly.
;                         Fixed by extra code which compensates for this
;                         difference.
;                       Bug [013], found by inspection: the "EnterRecursive"
;                         and "ExitRecursive" macros had some hard-wired
;                         uses of "Rtmp2" left in them, which hadn't been
;                         changed to uses of the "$addr" and "$t" parameters
;                         respectively. The actual effects were probably
;                         problems for some trap handlers. Fixed.
; 08-Dec-1993  1.07     Byte array veneer changes made.
; 17-May-1995  1.08     Bug [014], reported by lbond: the trap handler
;                         routines contained some WFS instructions which
;                         were not "protected" by being between an
;                         EnterRecursive macro and an ExitRecursive macro.
;                         These have been replaced by code which only does
;                         the WFS if this is a hardware implementation, and
;                         otherwise loads Rfpsr from the MemFPSR location.
;                       Bug [015], reported by mwilliams: the underflow
;                         routines were assuming that a small exponent was
;                         enough to mean that "tininess" had occurred,
;                         ignoring the fact that the result also had to be
;                         non-zero. This made no difference to untrapped
;                         underflows (since a zero result never causes "loss
;                         of accuracy"), but meant that exact zero results
;                         caused an underflow when the underflow trap was
;                         enabled. Fixed by adding a test for a zero result.
; 16-Oct-1995  1.09     Bug [016], reported by amerritt: NaN conversions
;                         for STFs were producing incorrect results. Due to
;                         use of CPDO precision bits by the conversion
;                         routine rather than CPDT ones. Fixed.
;                       Inefficiencies in STF format conversions fixed.
; 17-May-1995  1.10     Bug [017], found during ARM7500fe validation: the
;                         "ConvertNaN1_ForSTF" routine in the "nans" source
;                         file contained a branch to "ConvertNaN1_Quieten".
;                         If this branch was taken, the resulting conversion
;                         would be done in accordance with the CPDO/CPRT
;                         precision bits (19 and 7) rather than the CPDT
;                         precision bits (22 and 15) as it should be. Fixed.
; 22-Apr-1997  1.11     Bug [018], reported by Acorn: With MultipleContexts
;                         = {TRUE}, core_changecontext didn't return the old
;                         context in R0. This was a simple coding error and
;                         is fixed.
;                       Bug [019], reported by Acorn: With MultipleContexts
;                         = {TRUE}, core_deactivatecontext corrupts R1 if
;                         both FPE and FPASC are included. This was also a
;                         simple coding error and is fixed.
;                       PowerDrainFix option removed.
;                       "AssumedHardware" and "FPESigNaNCopy_Invalid"
;                         options added.
;                       NaN conversion and generation rules simplified.
;                       Placeholder "transsw" source file removed.
; 30-Sep-1997  1.12     Bug [020], found by inspection: Instructions that
;                         write to R13 or R14 from system mode didn't work.
;                         Now fixed.
; 10-June-1998 1.13     Bug mls-3284, found by inspection:incorrect precision
;                         FLTEQ instruction in RangeRedByMod caused range 
;                         reduction inaccuracies.
;                         Now fixed.

;===========================================================================

; The core version number.

                        GBLA    CoreMajorVersion
CoreMajorVersion        SETA    1

                        GBLA    CoreMinorVersion
CoreMinorVersion        SETA    13

; Create the version number string.

                ASSERT  CoreMajorVersion < 100
                ASSERT  CoreMinorVersion < 100

                GBLS    CoreVersion
        [ CoreMajorVersion < 10
CoreVersion     SETS    ""
        |
CoreVersion     SETS    (:STR:(CoreMajorVersion/10)):RIGHT:1
        ]
CoreVersion     SETS    CoreVersion:CC:((:STR:(CoreMajorVersion:MOD:10)):RIGHT:1)
CoreVersion     SETS    CoreVersion:CC:"."
CoreVersion     SETS    CoreVersion:CC:((:STR:(CoreMinorVersion/10)):RIGHT:1)
CoreVersion     SETS    CoreVersion:CC:((:STR:(CoreMinorVersion:MOD:10)):RIGHT:1)
        [ :DEF:AssumedHardware
CoreVersion     SETS    CoreVersion:CC:"A"
        ]
        [ UndefHandBranchTable
CoreVersion     SETS    CoreVersion:CC:"B"
        ]
        [ UseCLZ
CoreVersion     SETS    CoreVersion:CC:"C"
        ]
        [ :LNOT:SCWanted
CoreVersion     SETS    CoreVersion:CC:"E"
        ]
        [ :LNOT:EnableInterrupts
CoreVersion     SETS    CoreVersion:CC:"I"
        ]
        [ Use64bitMultiply
CoreVersion     SETS    CoreVersion:CC:"L"
        ]
        [ MultipleContexts
CoreVersion     SETS    CoreVersion:CC:"M"
        ]
        [ DynamicRounding
CoreVersion     SETS    CoreVersion:CC:"R"
        ]
        [ :LNOT:FPEWanted
CoreVersion     SETS    CoreVersion:CC:"S"
        ]
        [ {CONFIG}=26
          [ ARM2Safe
CoreVersion     SETS    CoreVersion:CC:"Z"
          |
CoreVersion     SETS    CoreVersion:CC:"z"
          ]
        ]

;===========================================================================

; Options decided at the core level.

; The level of core debugging - 0 = none; 1 = most important messages only,
; etc. If any core debugging is on, the veneer must define suitable macros:
;   $label Debug0 $message        - to output a simple message.
;   $label Debug1 $message,$reg   - to output the message, followed by a
;                                   space and the register value in hex.
;   $label Debug2 $message,$reg1,$reg2               )
;   $label Debug3 $message,$reg1,$reg2,$reg3         ) Similar
;   $label Debug4 $message,$reg1,$reg2,$reg3,$reg4   ) 

                GBLA    CoreDebugging
CoreDebugging   SETA    0

        [ CoreDebugging > 0
CoreVersion     SETS    CoreVersion:CC:"_":CC:((:STR:CoreDebugging):RIGHT:1)
        ]

        !       0,"Version of core code being assembled is $CoreVersion"

;===========================================================================

; Some macros to assist core debugging

        MACRO
$label  CDebug0 $level,$message
        LCLS    Temps
        LCLA    Tempa
        ASSERT  $level >= 1
        [ CoreDebugging >= $level
Temps     SETS    "$message"
Tempa     SETA    0
          WHILE Tempa < $level
Temps       SETS  "  ":CC:Temps
Tempa       SETA  Tempa+1
          WEND
$label    Debug0  "$Temps"
        ]
        MEND

        MACRO
$label  CDebug1 $level,$message,$reg
        LCLS    Temps
        LCLA    Tempa
        ASSERT  $level >= 1
        [ CoreDebugging >= $level
Temps     SETS    "$message"
Tempa     SETA    0
          WHILE Tempa < $level
Temps       SETS  "  ":CC:Temps
Tempa       SETA  Tempa+1
          WEND
$label    Debug1  "$Temps",$reg
        ]
        MEND

        MACRO
$label  CDebug2 $level,$message,$reg1,$reg2
        LCLS    Temps
        LCLA    Tempa
        ASSERT  $level >= 1
        [ CoreDebugging >= $level
Temps     SETS    "$message"
Tempa     SETA    0
          WHILE Tempa < $level
Temps       SETS  "  ":CC:Temps
Tempa       SETA  Tempa+1
          WEND
$label    Debug2  "$Temps",$reg1,$reg2
        ]
        MEND

        MACRO
$label  CDebug3 $level,$message,$reg1,$reg2,$reg3
        LCLS    Temps
        LCLA    Tempa
        ASSERT  $level >= 1
        [ CoreDebugging >= $level
Temps     SETS    "$message"
Tempa     SETA    0
          WHILE Tempa < $level
Temps       SETS  "  ":CC:Temps
Tempa       SETA  Tempa+1
          WEND
$label    Debug3  "$Temps",$reg1,$reg2,$reg3
        ]
        MEND

        MACRO
$label  CDebug4 $level,$message,$reg1,$reg2,$reg3,$reg4
        LCLS    Temps
        LCLA    Tempa
        ASSERT  $level >= 1
        [ CoreDebugging >= $level
Temps     SETS    "$message"
Tempa     SETA    0
          WHILE Tempa < $level
Temps       SETS  "  ":CC:Temps
Tempa       SETA  Tempa+1
          WEND
$label    Debug4  "$Temps",$reg1,$reg2,$reg3,$reg4
        ]
        MEND

;===========================================================================

; Get the standard macros used in this source.

        GET     $CoreDir.macros$FileExt

;===========================================================================

; Assumptions made
; ----------------
; These assumptions are not currently subject to assembly time switches.
;
;   Supervisor/undefined mode stacks are Full Descending.
;
;   Floating point code executed in non-user modes "knows what it is doing"
;   as far as memory protection is concerned. All memory transfers for
;   floating point code executed in user mode is protected by using
;   LDRT/STRT and similar instructions, but nothing similar is done for
;   non-user mode code.

;===========================================================================

; Assembly time switches
; ----------------------
;
; Several of these are provided by the veneer "options" file: these are
; documented in the top level "main" source file.
;
; Whether the undefined instruction handler is to be entered in 26-bit or
; 32-bit mode is determined from the {CONFIG} built-in variable. The rules
; for each of these possibilities are:
;
; The 26 bit undefined instruction handler executes in Supervisor26 mode and
; the 32 bit undefined instruction handler in Undefined32 mode. The
; following table indicates what processor modes may use floating point
; instructions for each type of handler:
;
;   Mode            26 bit handlers    32 bit handlers
;   --------------------------------------------------
;   User26           Yes                Yes
;   FIQ26            No[3]              No[3]
;   IRQ26            Ill-advised[2]     Ill-advised[2]
;   Supervisor26     Conditional[1]     Yes
;   User32           N/A                Yes
;   FIQ32            N/A                No[3]
;   IRQ32            N/A                Ill-advised[2]
;   Supervisor32     N/A                Yes
;   Abort32          N/A                Ill-advised[2]
;   Undefined32      N/A                Conditional[1]
;
; [1] The conditions are:
;     * The instruction must not use R13 or R14 in any way;
;     * R14 must be treated as a scratch register (i.e. it will not
;       necessarily be preserved by a floating point instruction);
;     * For 32 bit handlers, SPSR_undef must also be treated as a scratch
;       register;
;     * R13 must point correctly to a Full Descending stack with a
;       sufficient amount of free space.
;
; [2] There is no intrinsic reason why the handler should not be capable of
;     coping with floating point instructions in these modes. However,
;     allowing them creates all sorts of possibilities for unexpected
;     recursions and is almost certainly a bad idea. Exception: IRQs can
;     reasonably be used for process switches, with associated floating
;     point context switches.
;
; [3] Strictly, there are probably some conditions under which this will
;     work. But using potentially emulated instructions in an FIQ mode isn't
;     really compatible with the idea of FIQs. Attempting either to codify
;     the conditions under which they will work or to make them work under
;     standard conditions would seem to be wasted effort.

;===========================================================================

; Start of the undefined instruction handlers. We insert 3 words of padding
; to ensure prefetching doesn't put the PC on the wrong side of the
; boundary.

        DCD     0,0,0

FP_UndefHandlers_Start

;===========================================================================

; Now the undefined instruction handlers themselves.

        GET     $CoreDir.fpaundef$FileExt
        GET     $CoreDir.fpeundef$FileExt

;===========================================================================

; Shared exit points from undefined instruction handlers.

        [ UndefHandStandAlone

NotForUs1
NotForUs2
          [ MultipleContexts
            AdrWS   Rwp
          ]
NotForUs

; Now we've got to enter the next trap handler in exactly the same state as
; we entered this one.

          [ {CONFIG}=32
            LDMDB   Rfp,{Rtmp,Rtmp2}    ;Restore SPSR & CPSR (note that the
            MSR     CPSR_csxf,Rtmp2     ; order must be right: interrupts
            MSR     SPSR_csxf,Rtmp      ; re-disabled before SPSR valid)
            LDR     R11,NextHandler     ;Get correct PC for handler entry,
            LDR     R11,[R11]           ; via indirection
            LDR     R10,[Rfp,#15*4]     ;Correct R14 for handler entry
            ADD     R9,Rfp,#16*4        ;Correct R13 for handler entry
            STMDB   R9,{R9-R11}         ;Modify preserved block of registers
            LDMDB   R9,{R0-PC}          ;Restore regs and branch
          ]

          [ {CONFIG}=26
            LDR     R11,NextHandler     ;Get correct PC for handler entry,
            LDR     R11,[R11]           ; via indirection
            LDR     R10,[Rfp,#15*4]     ;Correct R14 for handler entry
            AND     R9,R10,#Flags_mask+IntMasks_mask ;Reconstruct entry PSR
            ORR     R9,R9,#I_bit+Mode_SVC26
            ORR     R11,R11,R9          ;Correct PC+PSR for handler entry
            ADD     R9,Rfp,#16*4        ;Correct R13 for handler entry
            STMDB   R9,{R9-R11}         ;Modify preserved block of registers
            LDMDB   R9,{R0-PC}^         ;Restore regs and PSR, and branch
          ]

          [ {CONFIG}=26
            [ ARM2Safe

ReallyAnARM2SWI

; We've got to enter the SWI vector in the state in which we entered the
; undefined instruction vector, since the undefined instruction vector was
; entered mistakenly, due to an ARM2 bug.

              LDR     R10,[Rfp,#15*4]   ;Correct R14 for handler entry
              AND     R11,R10,#Flags_mask+IntMasks_mask ;Reconstruct flags on entry
              ORR     R11,R11,#I_bit+Mode_SVC26
              ORR     R11,R11,#SWI_vector ;Correct PC+PSR for handler entry
              ADD     R9,Rfp,#16*4      ;Correct R13 for handler entry
              STMDB   R9,{R9-R11}       ;Modify preserved block of registers
              LDMDB   R9,{R9-PC}^       ;Restore regs & PSR, and branch

            ]
          ]

        ]

        [ UndefHandBranchTable

NotForUs1

          [ MultipleContexts
            AdrWS   Rwp
          ]

          [ {CONFIG}=26
            SUB     Rsp,Rfp,#8
          ]

          [ {CONFIG}=32
            SUB     Rsp,Rfp,#16         ;Takes account of stacked SPSR & CPSR
          ]

          LDMIA   Rsp,{Rins,LR}
          LDR     Rwp,NextHandler1
          LDR     PC,[Rwp]

NotForUs2

          [ MultipleContexts
            AdrWS   Rwp
          ]

          [ {CONFIG}=26
            SUB     Rsp,Rfp,#8
          ]

          [ {CONFIG}=32
            SUB     Rsp,Rfp,#16         ;Takes account of stacked SPSR & CPSR
          ]

          LDMIA   Rsp,{Rins,LR}
          LDR     Rwp,NextHandler2
          LDR     PC,[Rwp]

        ]

; Need to assert register usage above is correct!
        ASSERT  Rsp = R13
        ASSERT  Rfp = R12
        ASSERT  Rins = R11
        ASSERT  Rwp = R10
        ASSERT  Rtmp2 = R9

;===========================================================================

        LTORG

;===========================================================================

; Library routines used in undefined instruction handlers.

        GET     $CoreDir.ldst$FileExt       ;Load and store routines
        GET     $CoreDir.rounding$FileExt   ;Rounding and Round stage
                                            ; exception routines
        GET     $CoreDir.nans$FileExt       ;Routines to handle NaN propaga-
                                            ; tion and format conversions,
                                            ; plus invalid operation and
                                            ; divide-by-zero exceptions
        GET     $CoreDir.arith$FileExt      ;Routines to deal with basic
                                            ; arithmetic functions
        GET     $CoreDir.transhw$FileExt    ;Hardware-optimised routines to
                                            ; do transcendental functions

;===========================================================================

; End of the undefined instruction handlers. We insert 3 words of padding to
; ensure prefetching doesn't put the PC on the wrong side of the boundary.

        DCD     0,0,0

FP_UndefHandlers_End

;===========================================================================

; The interface to the veneer.

        GET     $CoreDir.interf$FileExt

;===========================================================================

        END
