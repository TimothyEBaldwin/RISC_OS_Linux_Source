; 
; Copyright (c) 2010, RISC OS Open Ltd
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

        AREA    |!|, CODE, READONLY, PIC

Module_BaseAddr
        &       0
        &       InitModule - Module_BaseAddr
        &       KillModule - Module_BaseAddr
        &       0
        &       ModuleTitle - Module_BaseAddr
        &       HelpString - Module_BaseAddr
        &       0
        &       VFPSupportSWI_Base
        &       SWIEntry - Module_BaseAddr
        &       SWINameTable - Module_BaseAddr
        &       0
 [ International_Help <> 0
        DCD     MessageFilename - Module_BaseAddr
 |
        DCD     0
 ]
        &       ModuleFlags - Module_BaseAddr

HelpString
        =       "VFPSupport", 9, "$Module_MajorVersion ($Module_Date)"
        [       Module_MinorVersion <> ""
        =       " $Module_MinorVersion"
        ]
        =       0
ModuleTitle
SWINameTable
        =       "VFPSupport", 0
        =       "CheckContext", 0
        =       "CreateContext", 0
        =       "DestroyContext", 0
        =       "ChangeContext", 0
        =       "ExamineContext", 0
        =       "FastAPI", 0
        =       "ActiveContext", 0
        =       "Version", 0
        =       "Features", 0
        =       "ExceptionDump", 0
        =       0
        ALIGN
        
ModuleFlags
        &       ModuleFlag_32bit

; Workspace

                      ^ 0, wp
MessageFile_Block     # 16
MessageFile_Open      # 4
ActiveContext         # 4 ; Context that's actually active
LazyContext           # 4 ; Context awaiting lazy activation (==ActiveContext if none)
NumVFPRegs            # 1 ; Number of doubleword regs available on this hardware
ARMVersion            # 1 ; ARM architecture version from MIDR. <7=ARMv5, 7=ARMv6, &F=ARMv6/ARMv7
VFPSubarch            # 1 ; VFP subarchitecture field from FPSID
CPEnabledFlag         # 1 ; 255 if CP access is enabled, 0 if disabled
OldHandler            # 4 ; Original undefined instruction handler
UndefinedHandler      # 4 ; Undefined instruction handler code
LazyHandler           # 8*4 ; Code to call the lazy handler
ChangeContext         # 4 ; Address of SWI_ChangeContext
CurrentRoutine        # 4 ; OldHandler, LazyHandler, or SupportHandler
 [ SupportCode
VFPSupportCodePtr     # 4 ; Pointer to arch-specific support code implementation
SupportHandler        # 12*4 ; Code to call the support code
SupportHandlerPtr     # 4 ; SupportHandler if arch needs support code, else OldHandler 
CRelocOffset          # 4 ; C relocation offset
BadClasses            # 4 ; Instruction class flags which indicate it's not a valid VFP instruction
 ]
SoftFPSID             # 4 ; FPSID
SoftMVFR0             # 4 ; MVFR0
SoftMVFR1             # 4 ; MVFR1
SoftMVFR2             # 4 ; MVFR2
ExceptionContext      # 4
ExceptionDump         # :INDEX:Context_RegDump+MaxDRegs*8
                      
WSSize                * :INDEX: @

; VFPSubarch values
Subarch_VFPv1_IMP     * 0 ; VFPv1 arch with implementation defined subarch
Subarch_VFPv2_v1Sub   * 1 ; VFPv2 arch with v1 common subarch (ARM1176JZF-S)
Subarch_VFPv3_v2Sub   * 2 ; >=VFPv3 arch with v2 common subarch (Cortex-A7)
Subarch_VFPv3_NoSub   * 3 ; >=VFPv3 arch with no subarch (Cortex-A8, Cortex-A9, Cortex-A53)
Subarch_VFPv3_v3Sub   * 4 ; >=VFPv3 arch with v3 common subarch (Cortex-A15)


; Undefined instruction handler code - gets copied into workspace
UndefinedHandlerTemplate

RelocOffset * UndefinedHandlerTemplate-:INDEX:UndefinedHandler

        LDR     pc, RelocOffset+:INDEX:CurrentRoutine ; Branch to address in CurrentRoutine
        ; LazyHandler starts here
        SUB     lr, lr, #4
        STMDB   r13!,{r0-r1,wp,lr}
        ADR     wp, RelocOffset         ; Get wp
        MOV     r1, #0
        LDR     r0, LazyContext
        MOV     lr, pc
        LDR     pc, ChangeContext       ; Reuse main code for simplicity
        LDMIA   r13!,{r0-r1,wp,pc}^     ; Restart aborting instruction
UndefinedHandlerTemplateEnd

        ASSERT  LazyHandler-UndefinedHandler+?LazyHandler = UndefinedHandlerTemplateEnd-UndefinedHandlerTemplate

 [ SupportCode
RelocOffsetSup * SupportHandlerTemplate-:INDEX:SupportHandler

SupportHandlerTemplate
        Push    "r12"
        myVMRS  ,r12,FPEXC
        TST     r12, #FPEXC_EX+FPEXC_DEX
        ADRNE   r12, RelocOffsetSup        ; Get wp
        LDRNE   pc, RelocOffsetSup+:INDEX:VFPSupportCodePtr ; Call the support code
        Pull    "r12"
        LDR     pc, RelocOffsetSup+:INDEX:OldHandler ; Not a VFP exception, pass on to next handler
SupportHandlerTemplateEnd

        ASSERT  SupportHandlerTemplateEnd-SupportHandlerTemplate <= ?SupportHandler

RelocOffsetSV * SupportHandlerTemplateSV-:INDEX:SupportHandler

SupportHandlerTemplateSV
        ; Alternative support handler template for hardware which doesn't
        ; generate exceptions via EX/DEX, and for which we want to support short
        ; vectors.
        ; This means that it's down to us to decide whether any individual
        ; instruction generates exceptions or not.
        ; Pattern to match is:
        ; cccc 1110 ---- ---- ---- 101- ---0 ----
        Push    "r11,r12"
        LDR     r11, [r14, #-4]         ; N.B. assuming not Thumb mode!
        CMP     r11, #&F0000000         ; Reject unconditional instructions
        LDRHS   pc, RelocOffsetSV+:INDEX:OldHandler
        AND     r12, r11, #&0F000000
        AND     r11, r11, #&00000E10
        TEQ     r12, #&0E000000
        TEQEQ   r11, #&00000A00
        ADREQ   r12, RelocOffsetSV
        LDREQ   pc, RelocOffsetSV+:INDEX:VFPSupportCodePtr
        Pull    "r11,r12"
        LDR     pc, RelocOffsetSV+:INDEX:OldHandler
SupportHandlerTemplateSVEnd

        ASSERT  SupportHandlerTemplateSVEnd-SupportHandlerTemplateSV <= ?SupportHandler
 ]

; Module code

InitModule
        Entry   "r7-r11"

 [ SupportCode
        IMPORT  __RelocCode
        BL      __RelocCode
        FRAMLDR r11                     ; Corrupted by __RelocCode
 ]

 [ standalone
        BL      Resources
        SWI     XResourceFS_RegisterFiles
        EXIT    VS
 ]
        MOV     r0, #ModHandReason_Claim
        LDR     r3, =WSSize
        SWI     XOS_Module
        EXIT    VS
        STR     r2, [r12]
        MOV     r12, r2

        MOV     r0, #0
10      SUBS    r3, r3, #4
        STR     r0, [r12, r3]
        BNE     %BT10

    [ SupportCode
        ADR     R3, Module_BaseAddr
        IMPORT  |!$$Base|
        LDR     R0, =|!$$Base|
        SUB     R3, R3, R0              ;Calculate relocation offset. Should be zero for ROM builds, but calculate anyway just in case we've been manually loaded or something.
        STR     R3, CRelocOffset
    ]

        ; Check for multiple instantiation; must be done after workspace setup
        CMP     r11, #0
        ADRNEL  r0, ErrorBlock_VFPSupport_Instanced
        BLNE    ReturnError_LR
        BVS     %FT20

        BL      CheckHardware

        BLVC    InstallHandler

20
        EXIT    VC
        Push    "r0"
        BL      CloseMessages
 [ standalone
        BL      Resources
        SWI     XResourceFS_DeregisterFiles
 ] 
        Pull    "r0"
        SETV
        EXIT

CheckHardware
        Push    "lr"
        ; Check for any VFP hardware
        ; First step is to check what ARM architecture we're on
        MRC     p15,0,r0,c0,c0,0 ; read main id register
        ANDS    r1, r0, #&F000
        TEQNE   r1, #&7000
        BEQ     NoVFP ; ARM7 or below
        AND     r0, r0, #&F0000
        CMP     r0, #&30000
        BLT     NoVFP ; pre ARMv5
        MOV     r0, r0, LSR #16
        STRB    r0, ARMVersion

        ; Interrupts off for the remainder of the tests
        MRS     r1, CPSR
        ORR     r2, r1, #I32_bit
        MSR     CPSR_c, r2

        CMP     r0, #&7
        BLT     IsARMv5
        ; ARMv6 and above have the coprocessor access control register, which allows us to poll for CP presence
        MRC     p15,0,r2,c1,c0,2 ; read CPACR
        ORR     r3, r2, #&F<<20
        MCR     p15,0,r3,c1,c0,2
        MRC     p15,0,r3,c1,c0,2 ; read it back to get status
        AND     r4, r3, #&F<<20
        CMP     r4, #&F<<20
        BEQ     %FT05
        MCR     p15,0,r2,c1,c0,2 ; restore original CPACR
        B       NoVFP_v6v7
05      CMP     r0, #&F
        BNE     %FT10
        ; Both ARMv6 and ARMv7 identify themselves with &F in the main ID register
        ; To work out which is which, it looks like the only (or easiest) way is to check the cache type register
        MRC     p15, 0, r4, c0, c0, 1
        TST     r4, #&80000000
        MOVEQ   r0, #&7
10
        ; VFP coprocessors exist and are now enabled, read FPSID
        myISB   ,r4 ; ISB to ensure that the coprocessors really are enabled
        myVMRS  ,r4, FPSID
        B       GotFPSID

IsARMv5
        ; No CPACR on ARMv5, so only way we can test for VFP is to try reading FPSID and seeing if we trigger an abort
        ; TODO - There are some extra things, e.g. ARMv5 CPACR as found on XScale
        Push    "r1-r2"
        LDR     r0, =&101
        ADR     r1, ARMv5Und
        SWI     XOS_ClaimProcessorVector
        Pull    "r1-r2",VS
        MSRVS   CPSR_c, r1
        Pull    "pc",VS

        MOV     r5, #0
        myVMRS  ,r4, FPSID

        MOV     r0, #1
        ADR     r2, ARMv5Und
        SWI     XOS_ClaimProcessorVector
        Pull    "r1-r2"
        MSRVS   CPSR_c, r1
        Pull    "pc",VS
        ; r5 will be nonzero if we aborted
        CMP     r5, #0
        LDREQB  r0, ARMVersion
        BEQ     GotFPSID
NoVFP_v6v7
        MSR     CPSR_c, r1 ; restore interrupts
NoVFP
        ADRL    r0, ErrorBlock_VFPSupport_NoHW
        B       ReturnError_Stacked

ARMv5Und
        MOV     r5, #1
        MOVS    pc, lr

GotFPSID
        ; r0 = ARM version
        ; r1 = old PSR
        ; r2 = old CPACR if >ARMv5
        ; r4 = FPSID
        TST     r4, #1:SHL:23 ; Is the software bit set?
        BNE     BadVFP
        ; The FPSID format has changed a bit between ARMv5, v6 and v7
        CMP     r0, #&7
        BLT     CheckFPSIDv5
        BEQ     CheckFPSIDv6
        ; v7 version. There are a few different subarchitectures which we support.
        AND     r3, r4, #&7F0000
        CMP     r3, #Subarch_VFPv3_v2Sub<<16
        CMPNE   r3, #Subarch_VFPv3_NoSub<<16
        CMPNE   r3, #Subarch_VFPv3_v3Sub<<16
        BNE     BadVFP
        ; Note that for v2 & v3 subarch we currently have no support for
        ; asynchronous exceptions (no hardware to test with). Probe to see if
        ; FPEXC.EX is implemented so that we can discard any such hardware.
        ;
        ; Also note that current v2/v3 implementations only throw exceptions for
        ; attempts to use VFP short vectors (which are no longer supported in
        ; hardware). This means we don't need to switch support for them based
        ; around SupportCode - so on these machines SupportCode becomes a
        ; switch for whether we want to provide software emulation of vectors
        ; or not.
        MOV     r7, #FPEXC_EX
        myVMSR  ,FPEXC,r7
        myVMRS  ,r7,FPEXC
        TST     r7, #FPEXC_EX
        MOVNE   r7, #0
        myVMSR  NE,FPEXC,r7
        BNE     BadVFP
        B       GoodVFP

CheckFPSIDv5
CheckFPSIDv6
        ; v5/v6 version. Should be VFPv1 or VFPv2.
      [ SupportCode
        ; We only have full support code for VFPv2 with subarchitecture v1
        AND     r3, r4, #&F0000
        CMP     r3, #Subarch_VFPv2_v1Sub<<16
        BNE     BadVFP
        ; Currently only support implementations that use FSTMX/FLDMX standard format 1 (i.e. we can just use VLDM/VSTM)
        TST     r4, #3:SHL:21
        BNE     BadVFP
        B       GoodVFP
      |
        ; Support code is disabled. Refuse to run on this hardware to avoid
        ; platforms which require support code from being used without it.
        B       BadVFP
      ]
        

BadVFP
NoMVFR ; Currently we don't cope with situations where the MVFR registers are absent
        ; Restore CPACR if ARMv6+
        CMP     r0, #&7
        BLT     %FT01
        MCR     p15,0,r2,c1,c0,2
        myISB   ,r0 ; Deal with pipelined CP15 ops on ARMv6+. TODO - ARMv5
01      ; Restore interrupts
        MSR     CPSR_c, R1
        ADRL    r0, ErrorBlock_VFPSupport_BadHW
        B       ReturnError_Stacked

HasMVFRTable
        DCW     &FFF0 ; FPSID mask (part & variant fields)
                      ; Bottom nibble of the below values are used to store the number of implemented feature registers
        DCW     &20B2 ; VFP11 has MVFR0, MVFR1
        DCW     &4033 ; Cortex-A53 has MVFR0, MVFR1, MVFR2
        DCW     0
        ALIGN

GoodVFP
        ; r0 = ARM version
        ; r1 = old PSR
        ; r2 = old CPACR if >ARMv5
        ; r3 = FPSID subarchitecture field
        ; r4 = FPSID
        ; Read MVFR0/1 if they're available
        ; In subarchitecture 1 and below, the registers are optional.
        ; E.g. VFP9-S doesn't have them but VFP11 does, even though they're both subarchitecture 1/VFPv2.
        ; For ARMv8, there's also the MVFR2 register, which isn't present on earlier ARM versions, and can't be probed for since access to undefined registers is unpredictable
        ; So to deal with these annoying cases, search through a list of VFP variants which are known to contain specific numbers of registers
        ADR     r7, HasMVFRTable
        LDRH    r8, [r7], #2
        AND     r8, r8, r4
10
        LDRH    r9, [r7], #2
        CMP     r9, #0
        BEQ     %FT20
        EOR     r9, r9, r8
        CMP     r9, #16
        BLO     HasMVFR
        B       %BT10
20
        ; Subarchitecture 2+ is required to have at least MVFR0 & MVFR1
        CMP     r3, #Subarch_VFPv2_v1Sub<<16
        BLO     NoMVFR
        MOV     r9, #2
        ; Fall through...
HasMVFR
        MOV     r7, #0
        myVMRS  ,r5,MVFR0 ; Assume the first two are always present
        myVMRS  ,r6,MVFR1
        CMP     r9, #3
        myVMRS  GE,r7,MVFR2
        ; Done for now, make sure VFP access is disabled
        ; For the moment we just disable access via the FPEXC.EN bit. This will disable everything except VMSR & VMRS from privileged modes
        MOV     lr, #0
        myVMSR  ,FPEXC, lr
        ; Store our results
        ; TODO - Calculate fake MVFR0/MVFR1 values where necessary
        MOV     r3, r3, LSR #16
        STRB    r3, VFPSubarch
        ASSERT  SoftMVFR0 = SoftFPSID+4
        ASSERT  SoftMVFR1 = SoftFPSID+8
        ASSERT  SoftMVFR2 = SoftFPSID+12
        ADR     lr, SoftFPSID
        STMIA   lr, {r4-r7}
        ; Work out how many data registers there are
        ; Assumes we've faked up MVFR0!
        AND     r3, r5, #&F
        CMP     r3, #2
        MOVEQ   r3, #32
        MOVNE   r3, #16
        CMP     r3, #MaxDRegs
        BGT     BadVFP
        STRB    r3, NumVFPRegs
      [ SupportCode
        ; Work out BadClasses, assuming MVFR0 & MVFR1 match the ARMv7 format
        MOV     r0, #CLASS_NOT_VFP
        CMP     r3, #32
        ORRLT   r0, r0, #CLASS_D32
        LDRB    r3, VFPSubarch
        CMP     r3, #Subarch_VFPv3_v2Sub
        ORRLT   r0, r0, #CLASS_VFP3
        TST     r5, #&F0
        ORREQ   r0, r0, #CLASS_S
        TST     r5, #&F00
        ORREQ   r0, r0, #CLASS_D
        TST     r5, #&F0000
        ORREQ   r0, r0, #CLASS_DIV
        TST     r5, #&F00000
        ORREQ   r0, r0, #CLASS_SQRT
        TST     r6, #&F000000
        ORREQ   r0, r0, #CLASS_HP
        TST     r6, #&F0000000
        ORREQ   r0, r0, #CLASS_VFP4 ; Might need renaming so that it just covers the FMAC instructions?
        STR     r0, BadClasses
      ]
        ; Restore interrupts
        MSR     CPSR_c, R1
        Pull    "pc"

InstallHandler ROUT
        Entry
        ; Initialise UndefinedHandler + LazyHandler + ChangeContext
        ADR     r0, UndefinedHandlerTemplate
        ADR     r1, UndefinedHandler
        ASSERT  UndefinedHandlerTemplateEnd-UndefinedHandlerTemplate = 9*4
        LDMIA   r0!, {r2-r10}
        ASSERT  ChangeContext = UndefinedHandler+(UndefinedHandlerTemplateEnd-UndefinedHandlerTemplate)
        ADR     r11, SWI_ChangeContext
        STMIA   r1, {r2-r11}
        ADR     r2, ChangeContext
      [ SupportCode
        ; Work out what support code (if any) is needed.
        ; Possible situations are:
        ; * ARM11/VFP11: Support code required to give the hardware help with difficult instructions. Indicated by Subarch_VFPv2_v1Sub.
        ; * Cortex-A8: Support code not required. Indicated by Subarch_VFPv3_NoSub & no response to FPEXC EX & DEX bits
        ; * Cortex-A9: Support code required for short vector support. Indicated by Subarch_VFPv3_NoSub, no response to FPEXC EX, but response to DEX (+ MVFR0 indicates no short vector support)
        ; * Cortex-A7: Support code required for short vector support. Indicated by Subarch_VFPv3_v2Sub, no response to FPEXC EX, but response to DEX (+ MVFR0 indicates no short vector support)
        ; * Cortex-A15: Support code required for short vector support. Also requires special abort handler due to lack of DEX. Indicated by Subarch_VFPv3_v3Sub, no response to FPEXC EX & DEX bits (+ MVRF0 indicates no short vector support)
        ; * Cortex-A53: Support code not required. Indicated by Subarch_VFPv3_NoSub & no response to FPEXC EX & DEX bits. Also no possibility of emulating short vector support (FPSCR LEN/STRIDE is zero)
        ; So logic to follow is:
        ; * If EX or DEX supported, pick based around SubArch version
        ; * If MVFR0 indicates no short vector support, and FPSCR LEN/STRIDE can be set, use special abort handler
        ; When testing for support, avoid setting both EX and DEX at once, as that's an invalid combination
        MOV     r10, #0 ; r10 is used as our 'support handler installed' flag
        MOV     r11, #FPEXC_EX
        myVMSR  ,FPEXC,r11
        myVMRS  ,r11,FPEXC
        TST     r11, #FPEXC_EX
        BNE     %FT20
        MOV     r11, #FPEXC_DEX
        myVMSR  ,FPEXC,r11
        myVMRS  ,r11,FPEXC
        TST     r11, #FPEXC_DEX
        BNE     %FT20
        ; No exceptions generated by hardware. But do we need short vector support?
        LDR     r11, SoftMVFR0
        TST     r11, #&F<<24
        BNE     %FT80 ; (no support code needed at all)
        ; Short vectors not supported in hardware, install support code to emulate them if the FPSCR has LEN+STRIDE fields
        MOV     r11, #FPEXC_EN
        myVMSR  ,FPEXC,r11
        MOV     r11, #&310000 ; length 2, stride 2
        myVMSR  ,FPSCR,r11
        myVMRS  ,r10,FPSCR
        TEQ     r10,r11
        MOV     r10,#0
        myVMSR  ,FPEXC,r10
        BNE     %FT80 ; (short vector emulation not possible)
        ; Short vector emulation possible
        ADRL    r10, VFPSupportCode_SV
        ADR     r0, SupportHandlerTemplateSV
        B       %FT50
20
        ; Hardware generates exceptions via EX/DEX. Use subarchitecture to decide which support code is required.
        LDRB    r11, VFPSubarch
        myVMSR  ,FPEXC,r10 ; Reset clobbered reg
        CMP     r11, #Subarch_VFPv2_v1Sub
        ADREQL  r10, VFPSupportCode_SubArchV1
        CMP     r11, #Subarch_VFPv3_v2Sub
        CMPNE   r11, #Subarch_VFPv3_NoSub
        CMPNE   r11, #Subarch_VFPv3_v3Sub
        ADREQL  r10, VFPSupportCode_SubArchV2
        ; If we've failed to find the right support code then something is wrong
        TEQ     r10, #0
        ADREQL  r0, ErrorBlock_VFPSupport_BadHW
        BEQ     ReturnError_Stacked
        ADR     r0, SupportHandlerTemplate
50
        ; Initialise VFPSupportCodePtr & SupportHandler using r10 & r0
        STR     r10, VFPSupportCodePtr
        ADR     r2, SupportHandler
        ; Copy all 12 words even if actual handler is shorter
        ASSERT  ?SupportHandler = 12*4
        LDMIA   r0!, {r3-r8}
        STMIA   r2!, {r3-r8}
        LDMIA   r0!, {r3-r8}
        STMIA   r2!, {r3-r8}
        ; Assume ranged IMB from r1 to r2 will cover both handlers
        ASSERT  SupportHandler > LazyHandler
80
      ]
        MOV     r0, #1
        SWI     XOS_SynchroniseCodeAreas
        ; Install the handler. Interrupts disabled to ensure we don't get caught before we set up CurrentRoutine.
        MRS     r4, CPSR
        ORR     r3, r4, #I32_bit
        MSR     CPSR_c, r3
        LDR     r0, =&101        
        SWI     XOS_ClaimProcessorVector
        BVS     %FT90
        STR     r1, OldHandler
      [ SupportCode
        ; Set up SupportHandlerPtr as appropriate
        ; Either a pointer to SupportHandler (if support code required) or
        ; OldHandler (no support code required)
        CMP     r10, #0
        LDREQ   r1, OldHandler
        ADRNE   r1, SupportHandler
        STR     r1, SupportHandlerPtr
      ]
        STR     r1, CurrentRoutine
90
        MSR     CPSR_c, r4
        EXIT

           GBLA    BCDVersion
BCDVersion SETBCD  Module_Version*100

KillModule
        LDR     wp, [r12]
        MOV     r6, lr

        ; Warn our clients that we're about to die
        ; TODO - If ClaimProcessorVector fails, our clients will still think we're dead
        ADRL    r0, Module_BaseAddr
        MOV     r1, #Service_ModulePostFinal
        ADRL    r2, ModuleTitle
        MOV     r3, #0 ; We only allow one instance
        LDR     r4, =BCDVersion
        SWI     XOS_ServiceCall

        ; Remove undefined instruction handler
        MOV     r0, #1
        LDR     r1, OldHandler
        ADR     r2, UndefinedHandler
        SWI     XOS_ClaimProcessorVector
        MOVVS   pc, r6 ; Improperly nested handlers

        ; Disable VFP
        BL      DisableCPAccess

        ; TODO - Disable in CPACR as well?

        ; TODO - Free any contexts?

        BL      CloseMessages

 [ standalone
        BL      Resources
        SWI     XResourceFS_DeregisterFiles   ; ignore errors
 ]

        CLRV
        MOV     pc, r6

SWIEntry
        LDR     wp, [r12]
        CMP     r11, #(EndOfJumpTable-JumpTable)/4
        ADDLO   pc, pc, r11, LSL #2
        B       UnknownSWI
JumpTable
        B       SWI_CheckContext
        B       SWI_CreateContext
        B       SWI_DestroyContext
        B       SWI_ChangeContext
        B       SWI_ExamineContext
        B       SWI_FastAPI
        B       SWI_ActiveContext
        B       SWI_Version
        B       SWI_Features
        B       SWI_ExceptionDump
EndOfJumpTable

UnknownSWI
        ADRL    r0, ErrorBlock_ModuleBadSWI
        B       ReturnError_LR

SWI_CheckContext
;  in: R0 = flags
;           b0 = user mode flag (0=user mode access not required, 1=user mode access required)
;           b1 = application space flag (0=not in application space, 1=in application space)
;           b30 = ignored (for CreateContext compatability)
;           b31 = ignored (for CreateContext compatability)
;           other bits reserved, sbz
;      R1 = number of doubleword registers required (1-32)
; out: R0 = required size of context save area
        ; Validate flags & reg count
        CMP     r1,#0
        BLE     %FT10
        ; Note that this next bit relies on C being set by the above CMP
        ASSERT  VFPSupport_Context_UserMode+VFPSupport_Context_AppSpace+VFPSupport_CreateContext_LazyActivate+VFPSupport_CreateContext_Activate >= &80000000 ; Must clear sign bit
        BICS    r0,r0,#VFPSupport_Context_UserMode+VFPSupport_Context_AppSpace+VFPSupport_CreateContext_LazyActivate+VFPSupport_CreateContext_Activate
        LDRLSB  r0,NumVFPRegs
        CMPLS   r1,r0
        MOVLS   r0,#Context_RegDump
        ADDLS   r0,r0,r1,LSL #3
        MSRLS   CPSR_f,#Z_bit ; Clear V while retaining LS state
        MOVLS   pc,lr
10
        ADRL    r0, ErrorBlock_VFPSupport_FeatureUnavailable
        B       ReturnError_LR

SWI_CreateContext
;  in: R0 = flags
;           b0 = user mode flag (0=user mode access not required, 1=user mode access required)
;           b1 = application space flag (0=not in application space, 1=in application space)
;           b30 = lazy activation flag (0=leave context inactive, 1=activate lazily. Supercedes b31.)
;           b31 = activate flag (0=leave context inactive, 1=activate now)
;           other bits reserved, sbz
;      R1 = number of doubleword registers required (1-32)
;      R2 = pointer to word-aligned context save area of the size indicated by VFPSupport_CheckContext, or 0 if VFPSupport is to allocate memory itself
;      R3 = FPSCR value to initialise context with
; out: R0 = context pointer
;      R1 = previously active context ID/preserved
        Push    "r0-r3,lr"
        CMP     r2,#0
        BIC     r0,r0,#VFPSupport_CreateContext_LazyActivate+VFPSupport_CreateContext_Activate ; Clear unwanted flags
        BNE     %FT10
        BL      SWI_CheckContext
        MOVVC   r3,r0
        MOVVC   r0,#ModHandReason_Claim
        SWIVC   XOS_Module
        ADDVS   sp,sp,#4
        Pull    "r1-r3,pc",VS
        LDR     r0,[sp]
        ORR     r0,r0,#VFPSupport_Context_VFPMemory
        LDR     r3,[sp,#12]
10
        ; Initialise context contents
        ASSERT  Context_Flags = 0
        ASSERT  Context_NumRegs = 4
        ASSERT  Context_FPSCR = 8
        ASSERT  Context_FPEXC = 12
        MOV     lr, #0 ; null FPEXC == no registers to restore
        STMIA   r2,{r0,r1,r3,lr}
        ; Did they want the context activating?
        Pull    "r1" ; Actually R0 on input
        MOV     r0,r2
        CLRV
        TST     r1,#VFPSupport_CreateContext_LazyActivate+VFPSupport_CreateContext_Activate ; Check activation flags
        Pull    "r1-r3,pc",EQ ; Exit if context doesn't need activating
        STR     r0,[sp]
        ASSERT  VFPSupport_CreateContext_Activate = &80000000
        MOVMI   r1,#0 ; Nonlazy activation
        MOVPL   r1,#VFPSupport_ChangeContext_Lazy ; Lazy activation
        BL      SWI_ChangeContext
        ; Assumes that ChangeContext won't return an error
        MOV     r1,r0
        Pull    "r0,r2-r3,pc"

SWI_DestroyContext
;  in: R0 = context to destroy
;      R1 = context to activate if R0 was the active context
; out: R0 = context that's now active
        Entry   "r1-r4"
        MRS     r4, CPSR
        ORR     r3, r4, #I32_bit
        MSR     CPSR_c, r3
        ; Dereference R0
        ; TODO - Improve this so it doesn't save the context we're about to delete
        ; Would need to make sure ActiveContext, LazyContext, coprocessor access & CurrentRoutine all stay in sync
        MOV     r2, r0
        CMP     r0, r1
        MOVEQ   r1, #0 ; Don't activate R1 if we're destroying it!
        LDR     r0, LazyContext
        CMP     r0, r2
        MOVEQ   r0, r1 ; if dying context is active/lazily active, activate user's R1
        LDRNE   r1, ActiveContext
        CMPNE   r1, r2 ; if dying context is really active, activate LazyContext
        MOVEQ   r1, #0 ; Activate desired context non-lazily
        STREQ   r1, [r2, #Context_NumRegs] ; ChangeContext will attempt to save the context we're deleting. But we can make things a little bit faster by skipping the main FP registers.
        BLEQ    SWI_ChangeContext
        ; Ignore error?
        MSR     CPSR_cf, r4 ; Restore interrupts
        LDR     r1, [r2, #Context_Flags]
        TST     r1, #VFPSupport_Context_VFPMemory
        MOV     r0, #ModHandReason_Free
        SWINE   XOS_Module
        CLRV    ; Ignore error?
        LDR     r0, LazyContext
        EXIT

SWI_ChangeContext
;  in: R0 = context to activate
;      R1 = flags
;           b0 = lazy activation (0=activate now, 1=use lazy activation)
;           b1 = application space changing (0=no change, 1=changing)
;           other bits reserved, sbz
; out: R0 = previously active context
; TODO - rewrite to use state machine based around array of function pointers?
; TODO - make use of user mode flag
        Entry   "r1-r4"
        ; Perform a dummy load from the context ptr so that if it's bad we'll
        ; crash now instead of after we've updated a load of state (n.b. we
        ; should really check the high address as well)
        CMP     r0, #0
        LDRNE   r2, [r0]
        MRS     r4, CPSR
        ORR     r3, r4, #I32_bit
        MSR     CPSR_c, r3
        ; If application space is being moved, and ActiveContext is in app
        ; space, clear the lazy activation flag to ensure that the context
        ; gets flushed out of the system 
        LDR     r3, ActiveContext
        TST     r1, #VFPSupport_ChangeContext_AppSpace
        BEQ     %FT10
        CMP     r3, #0
        LDRNE   r2, [r3, #Context_Flags]
        ASSERT  VFPSupport_Context_AppSpace = VFPSupport_ChangeContext_Lazy*2
        BICNE   r1, r1, r2, LSR #1
10
        LDR     r2, LazyContext
        TST     r1, #VFPSupport_ChangeContext_Lazy
        STR     r0, LazyContext
        MOV     r1, r3
        BEQ     ChangeContext_Now
        ; Lazy activation
        CMP     r2, r0
        BEQ     ChangeContext_Exit_IRQ_R0 ; Already (lazily) active
        CMP     r0, #0
        LDREQ   r0, OldHandler
        BEQ     ChangeContext_Exit_IRQ_R2_SetHandler ; Lazy deactivation - clear CurrentRoutine and disable CP access
        ; Else some form of lazy activation. If r0 is actually active, enable CP access, else disable
        CMP     r0, r1
        ADRNE   r0, LazyHandler
        BNE     ChangeContext_Exit_IRQ_R2_SetHandler ; Enable lazy handler
        BL      EnableCPAccess
        ; Disable lazy handler, it's no longer needed
      [ SupportCode
        LDR     r1, SupportHandlerPtr
      |
        LDR     r1, OldHandler
      ] 
        STR     r1, CurrentRoutine
        B       ChangeContext_Exit_IRQ_R0
ChangeContext_Now
        ; Nonlazy activation
        ; Start by disabling the lazy handler
      [ SupportCode
        ; Install SupportHandlerPtr or OldHandler as appropriate
        CMP     r0, #0
        LDRNE   lr, SupportHandlerPtr
        LDREQ   lr, OldHandler
      |
        LDR     lr, OldHandler
      ]
        CMP     r0, r1
        STR     r0, ActiveContext
        CMPEQ   r0, #0
        STR     lr, CurrentRoutine
        BEQ     ChangeContext_Exit_IRQ_R2_Disable ; We're turning it off and it's already off, so do nothing
        BL      EnableCPAccess
        CMP     r0, r1
        BEQ     ChangeContext_Exit_IRQ_R2_MaybeDisable ; Context is already loaded
        ; Save r1 if necessary
        CMP     r1, #0
        BLNE    SaveContext_R1
        ; Load r0 if necessary
        CMP     r0, #0
        BLNE    LoadContext_R0
ChangeContext_Exit_IRQ_R2_MaybeDisable
        CMP     r0, #0
        BLEQ    DisableCPAccess
ChangeContext_Exit_IRQ_R2
        MOV     r0, r2
ChangeContext_Exit_IRQ_R0
        MSR     CPSR_c, r4
        CLRV
        EXIT

ChangeContext_Exit_IRQ_R2_SetHandler
        STR     r0, CurrentRoutine
ChangeContext_Exit_IRQ_R2_Disable
        BL      DisableCPAccess
        MOV     r0, r2
        MSR     CPSR_c, r4
        CLRV
        EXIT

SWI_ExamineContext
;  in: R0 = context
;      R1 = flags
;           b0 = Serialise context
; out: R0 = flags:
;           b0 = User mode flag (0=user mode access not required, 1=user mode access required)
;           b1 = application space flag (0=not in application space, 1=in application space)
;           b29 = context is awaiting lazy activation (1=yes, 0=no)
;           b30 = context status registers are active (1=active, 0=saved)
;           b31 = memory allocation method (0=user allocated, 1=VFPSupport allocated)
;      R1 = number of doubleword registers (may be greater than number requested upon context creation)
;      R2 = register status. bit n is 1 if doubleword register is active, 0 if saved.
;      R3 = pointer to dump format descriptor block
;      R4 = context size
        MOVS    r4, r0
        BEQ     %FT20
        TST     r1, #VFPSupport_ExamineContext_Serialise
        BEQ     %FT10
        ; Serialise it if it's active
        ; TODO - Do something a bit more sophisticated!
        LDR     r2, ActiveContext
        CMP     r2, r0
        BNE     %FT10
        MOV     r3, lr
        MOV     r0, #0
        MOV     r1, #0
        BL      SWI_ChangeContext ; Deactivate it
        BLVC    SWI_ChangeContext ; Reactivate it
        MOVVS   pc, r3
        MOV     r0, r2
        MOV     lr, r3
10
        ; Check the FPEXC value in the dump as a method of determining which format of descriptor block we should use
        ; This won't work too well if programs use this as a method of inserting fake exceptions!
        LDR     r2, [r0, #Context_FPEXC]
        ASSERT  FPEXC_EX = N_bit
        ASSERT  FPEXC_FP2V = V_bit
        MSR     CPSR_f, r2
        ADRGE   r3, FormatDescriptorBlock_FPINST2 ; EX=1 FP2V=1 (EX=1 enforced by PL check below)
        ADRLT   r3, FormatDescriptorBlock_FPINST ; EX=1 FP2V=0 (EX=1 enforced by PL check below)
        ADRPL   r3, FormatDescriptorBlock_NullSubarch ; EX=0
        ; Compute LazyActivation flag
        LDR     r2, LazyContext
        CMP     r4, r2
        LDR     r0, [r4, #Context_Flags]
        ORREQ   r0, r0, #VFPSupport_Context_LazyActivation
        ; Compute StatusRegsActive flag and R2
        LDR     r2, ActiveContext
        CMP     r4, r2
        BICEQ   r0, r0, #VFPSupport_Context_LazyActivation ; If this context is active, then it shouldn't be waiting for lazy activation
        MOVEQ   r2, #1
        LDR     r1, [r4, #Context_NumRegs]
        MOVNE   r2, #0
        ORREQ   r0, r0, #VFPSupport_Context_StatusRegsActive
        RSBEQ   r2, r2, r2, LSL r1
        ; Compute R4
        MOV     r4, #Context_RegDump
        ADD     r4, r4,r1,LSL #3
        CLRV
        MOV     pc, lr
20
        ADRL    r0, ErrorBlock_VFPSupport_BadContext
        B       ReturnError_LR

        ; We could collapse these into one list, but having separate lists for
        ; each case causes *ShowVFPRegs to format the dump in a sensible manner
FormatDescriptorBlock_NullSubarch
        DCD     VFPSupport_Field_FPSCR + Context_FPSCR<<16
        DCD     VFPSupport_Field_FPEXC + Context_FPEXC<<16
        DCD     VFPSupport_Field_RegDump + Context_RegDump<<16
        DCD     -1 

FormatDescriptorBlock_FPINST
        DCD     VFPSupport_Field_FPSCR + Context_FPSCR<<16
        DCD     VFPSupport_Field_FPEXC + Context_FPEXC<<16
        DCD     VFPSupport_Field_FPINST + Context_FPINST<<16
        DCD     VFPSupport_Field_RegDump + Context_RegDump<<16
        DCD     -1

FormatDescriptorBlock_FPINST2
        DCD     VFPSupport_Field_FPSCR + Context_FPSCR<<16
        DCD     VFPSupport_Field_FPEXC + Context_FPEXC<<16
        DCD     VFPSupport_Field_FPINST + Context_FPINST<<16
        DCD     VFPSupport_Field_FPINST2 + Context_FPINST2<<16
        DCD     VFPSupport_Field_RegDump + Context_RegDump<<16
        DCD     -1 

SWI_FastAPI
; out: R0 = Workspace pointer to pass in R12
;      R1 = CheckContext function pointer
;      R2 = CreateContext function pointer
;      R3 = DestroyContext function pointer
;      R4 = ChangeContext function pointer
        MOV     r0, wp
        ADR     r1, SWI_CheckContext
        ADR     r2, SWI_CreateContext
        ADR     r3, SWI_DestroyContext
        ADR     r4, SWI_ChangeContext
        MOV     pc, lr

SWI_ActiveContext
; out: R0 = currently active context ID (or ID of context pending lazy activation)
        LDR     r0, LazyContext
        MOV     pc, lr

SWI_Version
; out: R0 = Module version number * 100
        MOV     r0, #Module_Version
        MOV     pc, lr

SWI_Features
; in: R0 = Reason code
        CMP     r0, #(EndOfFeaturesJumpTable-FeaturesJumpTable)/4
        ADDLO   pc, pc, r0, LSL #2
        B       UnknownFeature
FeaturesJumpTable
        B       Feature_SystemRegs
        B       Feature_VFPExceptions
        B       Feature_Misc
        B       Feature_SystemRegs2
EndOfFeaturesJumpTable

UnknownFeature
        ADRL    r0, ErrorBlock_VFPSupport_BadFeature
        B       ReturnError_LR

Feature_SystemRegs
;  in: R0 = 0
; out: R0 = FPSID
;      R1 = MVFR0
;      R2 = MVFR1
        ASSERT SoftMVFR0=SoftFPSID+4
        ASSERT SoftMVFR1=SoftMVFR0+4
        ADR    r0, SoftFPSID
        LDMIA  r0, {r0-r2}
        MOV    pc, lr

Feature_VFPExceptions
;  in: R0 = 1
; out: R0 = mask of which VFP exceptions can be trapped
      [ SupportCode
        LDR    r0, SupportHandlerPtr
        LDR    r10, OldHandler
        EORS   r0, r0, r10              ; Is support code installed? (n.b. check should be redundant if we've correctly identified hardware on startup)
        LDRNE  r0, SoftMVFR0
        ANDNES r0, r0, #&F000           ; Does hardware throw trapped exceptions to support code?
        MOVNE  r0, #FPSCR_ENABLE_FLAGS  ; All exceptions available
      |
        MOV    r0, #0
      ]
        MOV    pc, lr

Feature_Misc ROUT
;  in: R0 = 2
; out: R0 = misc flags:
;           bit 0: VFP short vectors supported by hardware
;           bit 1: VFP short vectors supported by software (slow!)
        LDR    r0, SoftMVFR0
        ANDS   r0, r0, #&F<<24
        MOVNE  r0, #VFPSupport_MiscFeature_VFPVectors_HW
      [ SupportCode
        BNE    %FT10
        ; Our support code implementation is able to provide full emulation of
        ; vector mode
        LDR    r0, SupportHandlerPtr
        LDR    r10, OldHandler
        EORS   r0, r0, r10
        MOVNE  r0, #VFPSupport_MiscFeature_VFPVectors_SW        
10
      ]
        ; Insert new flags here
        MOV    pc, lr

Feature_SystemRegs2
;  in: R0 = 3
; out: R0 = MVFR2
;      R1 = Reserved (zero)
;      R2 = Reserved (zero)
;      R3 = Reserved (zero)
        LDR    r0, SoftMVFR2
        MOV    r1, #0
        MOV    r2, #0
        MOV    r3, #0
        MOV    pc, lr

SWI_ExceptionDump
;  in: R0 = flags
;      R1 = context (if Create)
; out: R0 = copy of dump (if GetDump)
;      R1 = original context (if GetContext)
        ASSERT VFPSupport_ExceptionDump_GetDump+VFPSupport_ExceptionDump_GetContext+VFPSupport_ExceptionDump_Clear+VFPSupport_ExceptionDump_Create = &F
        CMP     r0, #&F
        ADRHIL  r0, ErrorBlock_VFPSupport_BadFlags
        BHI     ReturnError_LR
        Entry   "r0-r8"
        MOV     r7, r0
        ; IRQs off for atomicity
        MRS     r8, CPSR
        ORR     lr, r8, #I32_bit
        MSR     CPSR_c, lr
        ; Handle creation first
        TST     r7, #VFPSupport_ExceptionDump_Create
        BEQ     %FT50
        ; Serialise the given context (plus read size)
        MOVS    r0, r1
        STREQ   r0, ExceptionContext    ; Treat a null pointer as a clear request
        BEQ     %FT50
        MOV     r1, #VFPSupport_ExamineContext_Serialise
        BL      SWI_ExamineContext
        STRVS   r0, [sp]
        BVS     %FT90
        ; Now copy it into our exception block
        LDR     r0, [sp, #4]
        STR     r0, ExceptionContext
        ADR     r1, ExceptionDump
10
        LDR     r2, [r0], #4
        SUBS    r4, r4, #4
        STR     r2, [r1], #4
        BNE     %BT10
50
        ; Handle examination, clearing
        ; Clear request is checked for before calling OS_Module to ensure we
        ; only clear the context we're returning and not any other context
        ; that appears during the OS_Module call
        LDR     r6, ExceptionContext
        TST     r7, #VFPSupport_ExceptionDump_Clear
        MOVNE   r0, #0
        STRNE   r0, ExceptionContext
        TST     r7, #VFPSupport_ExceptionDump_GetDump
        BEQ     %FT80
        TEQ     r6, #0
        STREQ   r6, [sp, #0]
        BEQ     %FT80
        ; Allocate a buffer on the stack to temporarily copy the context into
        ; This makes sure the user gets the context they want, even if another
        ; exception fires during the OS_Module call
        ADR     r0, ExceptionDump
        LDR     r2, [r0, #Context_NumRegs]
        MOV     r3, #:INDEX:Context_RegDump
        ADD     r3, r3, r2, LSL #3
        MOV     r5, r3
60
        ; Note - reversing the data here
        LDR     r1, [r0], #4
        SUBS    r5, r5, #4
        Push    "r1"
        BNE     %BT60
        ; Allocate memory
        MOV     r0, #ModHandReason_Claim
        SWI     XOS_Module
        STRVS   r0, [sp, r3]!
        BVS     %FT90
        ; Copy over, reversing the data again
70
        Pull    "r1"
        SUBS    r3, r3, #4
        STR     r1, [r2, r3]
        BNE     %BT70
        STR     r2, [sp]
80
        TST     r7, #VFPSupport_ExceptionDump_GetContext
        STRNE   r6, [sp, #4]
        CLRV
90
        MSR     CPSR_c, r8
        EXIT

EnableCPAccess
        ; Enable VFP CP access
        Entry
        LDRB    lr,CPEnabledFlag
        EORS    lr,lr,#255
        EXIT    EQ
        STRB    lr,CPEnabledFlag
        myVMRS  ,lr,FPEXC
        ORR     lr,lr,#FPEXC_EN
        myVMSR  ,FPEXC,lr
        EXIT

DisableCPAccess
        ; Disable VFP CP access
        Entry
        LDRB    lr,CPEnabledFlag
        EORS    lr,lr,#255
        EXIT    NE
        STRB    lr,CPEnabledFlag
        myVMRS  ,lr,FPEXC
        BIC     lr,lr,#FPEXC_EN
        myVMSR  ,FPEXC,lr
        EXIT

SaveContext_R1
        ; Save active context to R1
        ; This should work with VFPv2/3, not sure about VFPv1
        Entry   "r2-r3"
        myVMRS  ,r2, FPEXC
        ASSERT  FPEXC_EX = N_bit
        ASSERT  FPEXC_FP2V = V_bit
        MSR     CPSR_f, r2
        STR     r2, [r1,#Context_FPEXC]
        BPL     %FT10
        ; Must store FPINST
        myVMRS  ,lr, FPINST
        STR     lr, [r1,#Context_FPINST]
        ; Might need to store FPINST2
        myVMRS  VS,lr, FPINST2
        STRVS   lr, [r1,#Context_FPINST2]
        ; Must clear exception bits before we're able to store the rest
        BIC     r2, r2, #FPEXC_EX+FPEXC_FP2V
        myVMSR  ,FPEXC,r2
10
        LDR     lr, [r1,#Context_NumRegs]
        myVMRS  ,r2, FPSCR
        ADD     r3, r1, #Context_RegDump
        STR     r2, [r1,#Context_FPSCR]
      [ MaxDRegs > 16
        ADD     pc, pc, lr, LSL #4
      |
        ; Pack the table a bit tighter if only 16 registers are needed
        ADD     pc, pc, lr, LSL #3
      ]
        NOP
        EXIT ; Don't malfunction if the context we're saving has 0 regs. Used by DeleteContext to make things a bit faster.
        NOP
      [ MaxDRegs > 16
        NOP
        NOP
      ]

        ; Generate VSTM jump table
        GBLA    count
count   SETA    1
        WHILE   count <= MaxDRegs
      [ count <= 16
        DCI     &EC830B00 + count*2 ; VSTMIA r3,{D0-Dn}
        EXIT
       [ MaxDRegs > 16
        NOP
        NOP
       ]
      |
        DCI     &ECA30B20 ; VSTMIA r3!,{D0-D15} (we can only STM 16 at once)
        DCI     &ECC30B00 + (count-16)*2 ; VSTMIA r3,{D16-Dn}
        EXIT
        NOP
      ]
count   SETA    count+1
        WEND

LoadContext_R0
        ; Load context from R0
        ; This should work with VFPv2/3, not sure about VFPv1
        Entry   "r2-r3"
        LDR     r2, [r0,#Context_FPEXC]
        ASSERT  FPEXC_EX = N_bit
        ASSERT  FPEXC_FP2V = V_bit
        ASSERT  FPEXC_EN = Z_bit ; EN bit will be clear if there are no data registers to restore (actually, entire FPEXC will be clear)
        MSR     CPSR_f, r2
        BIC     r3, r2, #FPEXC_EX+FPEXC_FP2V ; Don't set the exception bits yet
        myVMSR  EQ,FPEXC, r3 ; Don't write FPEXC if EN isn't set
        BPL     %FT10
        ; Must restore FPINST
        LDR     lr, [r0,#Context_FPINST]
        myVMSR  ,FPINST, lr
        ; Might need to restore FPINST2
        LDRVS   lr, [r0,#Context_FPINST2]
        myVMSR  VS,FPINST2, lr
10
        LDR     r3, [r0,#Context_FPSCR]
        LDREQ   lr, [r0,#Context_NumRegs]
        myVMSR  ,FPSCR, r3 ; Will only work on first use of new context if we already have CP access (which we currently will)
        ADDEQ   r3, r0, #Context_RegDump
        ADDEQ   pc, pc, lr, LSL #4
        ; If we're still here, we need to reset FPEXC to default and load 0 regs
        MOV     r2, #FPEXC_EN
        myVMSR  ,FPEXC, r2
        EXIT
        NOP
        NOP
        
        ; Generate VLDM jump table
        GBLA    count
count   SETA    1
        WHILE   count <= MaxDRegs
       [ count <= 16
        DCI     &EC930B00 + count*2 ; VLDMIA r3,{D0-Dn}
        myVMSR  MI,FPEXC, r2 ; Set exception bits now that all registers are restored
        EXIT
        NOP
       |
        DCI     &ECB30B20 ; VLDMIA r3!,{D0-D15} (we can only LDM 16 at once)
        DCI     &ECD30B00 + (count-16)*2 ; VLDMIA r3,{D16-Dn}
        myVMSR  MI,FPEXC, r2
        EXIT
       ]
count   SETA    count+1
        WEND

        LTORG

        [ standalone
        IMPORT  Resources
        ]

        END
