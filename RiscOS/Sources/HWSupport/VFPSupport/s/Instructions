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

; Core instruction handling code
; This file is included twice, once for single precision and once for double
; precision

; prec = "S" or "D"
; invprec = inverse of prec ("D" or "S")
; bits = "32" or "64"
; invbits = inverse of bits ("64" or "32")


CDP_$prec
        ; xins = CDP instruction
        ; xwp = exception workspace
        ; xctx = context

        ;
        ; 1110 1110 aaaa bbbb ---- 101- cc-0 dddd
        ; Where aaaa = opc1
        ;       bbbb = opc2
        ;       cc = opc3
        ;       dddd = opc4
        ;

        ; opc1 of 1x11 indicates 2-register instructions
        AND     x0, xins, #2_1011 << 20
        TEQ     x0, #2_1011 << 20
        BEQ     CDP_TwoRegister_$prec

        ; opc1 of 1x01, 1x10, or opc1 1x00 + opc3 x1 is VFPv4 or undefined
        CMP     x0, #2_1000 << 20
        BLO     ThreeRegOK_$prec
        BHI     VFPSupportCode_VFPv4    ; VFNMA, VFMS, VFMA, VFMS
        TST     xins, #1<<6
        BNE     VFPSupportCode_Undefined
        ; Fall through...

ThreeRegOK_$prec
        ; Look up register numbers
        BL      GetThreeRegs_$prec

ThreeRegLoop_$prec TRACE

        ; Load operands ready for function call
        LoadReg_$prec , xa, N
        LoadReg_$prec , xb, M

        ; Check for subnormal inputs
        CheckSubnormal_$prec ,xa
        CheckSubnormal_$prec ,xb
        
        ; 1x00 -> VDIV
        ; Other VFPv2 instructions should have bit 23 clear
        TEQ     x0, #2_1000 << 20
        ADDNE   pc, pc, x0, LSR #18
        B       VDIV_$prec              ; 1x00
        B       VMLA_VMLS_$prec         ; 0x00
        B       VNMLA_VNMLS_$prec       ; 0x01
        B       VMUL_VNMUL_$prec        ; 0x10
        TST     xins, #1<<6             ; 0x11
        BNE     VSUB_$prec
        B       VADD_$prec

ThreeRegTail_$prec

        AND     x0, xins, #2_1011 << 20 ; Set up ready for ThreeRegLoop

        ADR     lr, ThreeRegLoop_$prec
        B       AdvanceToNext

CDP_TwoRegister_$prec

        ; opc3 of x0 is the VFPv3 VMOV (imm) instruction
        TST     xins, #1<<6
        BEQ     VMOV_imm_$prec

        ; opc2 with bits 1-3 nonzero are tricky scalar instructions which use
        ; registers in nonstandard ways. Split them off into a separate case
        ; for the purpose of D reg limit checking.
        TST     xins, #&E0000
        BNE     CDP_TwoRegister_Tricky_$prec

        ; Look up register numbers
        BL      GetTwoRegs_$prec

TwoRegLoop_$prec TRACE

        ; Load operand ready for function call
        LoadReg_$prec , xa, M

        ; Subnormal checking is handled on a per-case basis as not all
        ; instructions will need it

        AND     x0, xins, #&F0000
        AND     x1, xins, #&00080
        ORR     x0, x0, x1, LSL #8
        ADD     pc, pc, x0, LSR #13
        NOP                              ; opc2 opc3
        B       VMOV_$prec               ; 0000 01
        B       VABS_$prec               ; 0000 11
        B       VNEG_$prec               ; 0001 01
        B       VSQRT_$prec              ; 0001 11

TwoRegTail_$prec

        ADR     lr, TwoRegLoop_$prec
        B       AdvanceToNext

CDP_TwoRegister_Tricky_$prec
        ; Tricky scalar instructions. We can't get the registers here because
        ; they're encoded differently depending on each instruction. Get them
        ; within each handler instead.
        
        ; The simplest approach here is a big jump table using opc2 and the
        ; high bit of opc3 (we've already examined the low bit above)
        AND     x0, xins, #&F0000
        AND     x1, xins, #&00080
        ORR     x0, x0, x1, LSL #8
        ADD     pc, pc, x0, LSR #13
        NOP                              ; opc2 opc3
        B       VFPSupportCode_Unexpected; 0000 01 (handled by TwoRegLoop_$prec)
        B       VFPSupportCode_Unexpected; 0000 11 (handled by TwoRegLoop_$prec)
        B       VFPSupportCode_Unexpected; 0001 01 (handled by TwoRegLoop_$prec)
        B       VFPSupportCode_Unexpected; 0001 11 (handled by TwoRegLoop_$prec)
        B       VCVTB_VCVTT_$prec        ; 0010 01
        B       VCVTB_VCVTT_$prec        ; 0010 11
        B       VCVTB_VCVTT_$prec        ; 0011 01
        B       VCVTB_VCVTT_$prec        ; 0011 11
        B       VCMP_VCMPE_$prec         ; 0100 01
        B       VCMP_VCMPE_$prec         ; 0100 11
        B       VCMP_VCMPE_$prec         ; 0101 01
        B       VCMP_VCMPE_$prec         ; 0101 11
        B       VFPSupportCode_Undefined ; 0110 01
        B       VFPSupportCode_Undefined ; 0110 11
        B       VFPSupportCode_Undefined ; 0111 01
        B       VCVT_DP_SP_$prec         ; 0111 11
        B       VCVT_FP_U32_$prec        ; 1000 01
        B       VCVT_FP_S32_$prec        ; 1000 11
        B       VFPSupportCode_Undefined ; 1001 01
        B       VFPSupportCode_Undefined ; 1001 11
        B       VCVT_FP_FIXED_$prec      ; 1010 01
        B       VCVT_FP_FIXED_$prec      ; 1010 11
        B       VCVT_FP_FIXED_$prec      ; 1011 01
        B       VCVT_FP_FIXED_$prec      ; 1011 11
        B       VCVTR_U32_FP_$prec       ; 1100 01
        B       VCVT_U32_FP_$prec        ; 1100 11
        B       VCVTR_S32_FP_$prec       ; 1101 01
        B       VCVT_S32_FP_$prec        ; 1101 11
        B       VCVT_FP_FIXED_$prec      ; 1110 01
        B       VCVT_FP_FIXED_$prec      ; 1110 11
        B       VCVT_FP_FIXED_$prec      ; 1111 01
        B       VCVT_FP_FIXED_$prec      ; 1111 11
        
VMLA_VMLS_$prec TRACE
        ; VMLA: D = (N * M) + D
        ; VMLS: D = -(N * M) + D
        BL      float$bits._mul
        ; Load third operand
        LoadReg_$prec , xb, D
        CheckSubnormal_$prec ,xb
        ; Bit 6 controls whether add or sub
        TST     xins, #1<<6
        NegRegFP_$prec  NE, xa
        ; Fall through...
VADD_$prec TRACE
        ; D = N + M
        BL      float$bits._add
        StoreReg_$prec , D, xa, ip
        B       ThreeRegTail_$prec

VNMLA_VNMLS_$prec TRACE
        ; VNMLA: D = -(N * M) + -D
        ; VNMLS: D = (N * M) + -D
        BL      float$bits._mul
        ; Load third operand
        LoadReg_$prec , xb, D
        CheckSubnormal_$prec ,xb
        ; Bit 6 controls negation of product
        TST     xins, #1<<6
        NegRegFP_$prec  NE, xa
        ; We can skip negating the third operand and just use SUB
        ; Fall through...
VSUB_$prec TRACE
        ; D = N - M
        BL      float$bits._sub
        StoreReg_$prec , D, xa, ip
        B       ThreeRegTail_$prec

VCMP_VCMPE_$prec TRACE
        ROUT
        ; FPSCR = cmp(D,M) or cmp(D,0)
        ;
        ; Load D into xa and M or zero into xb. Be careful to fetch the register
        ; numbers both at the same time, to ensure out-of-range D registers are
        ; detected before any FP exception checks.
        GetRegNo_$prec D,xa
        ; Bit 16 indicates whether the comparison is with M or (+)0.0
        TST     xins, #1<<16
        LoadZero_$prec NE, xb           ; Zero out M
        BNE     %FT05
        GetRegNo_$prec M,xb
        LoadReg_$prec ,xb,
        CheckSubnormal_$prec ,xb
05
        ; Fetch D
        LoadReg_$prec , xa,
        CheckSubnormal_$prec ,xa        ; TODO - Check we're meant to do this
        LDR     x0, [xctx, #Context_FPSCR]
        ; Preserve args on stack, we need to perform several tests
      [ "$prec" = "D"
        STMFD   sp!,{r0-r3}
      |
        STMFD   sp!,{r0-r1}
      ]
        BIC     x0, x0, #FPSCR_N+FPSCR_Z+FPSCR_C+FPSCR_V
        ; Bit 7 indicates whether any NaNs cause an IO exception
        TST     xins, #1<<7
        BNE     %FT50
        ; VCMP: Only signaling NaNs cause exceptions
        BL      float$bits._eq
        TEQ     r0, #0
        ORRNE   x0, x0, #FPSCR_Z+FPSCR_C ; EQ
        BNE     %FT90
      [ "$prec" = "D"
        LDMIA   sp,{r0-r3}
      |
        LDMIA   sp,{r0-r1}
      ]
        BL      float$bits._lt_quiet
        TEQ     r0, #0
        ORRNE   x0, x0, #FPSCR_N        ; LT
        BNE     %FT90
        ; Swap the two operands for the final check (no GT test in SoftFloat)
      [ "$prec" = "D"
        LDMFD   sp!,{r2-r3}
        LDMFD   sp!,{r0-r1}
      |
        Pull    "r1"
        Pull    "r0"
      ]
        BL      float$bits._lt_quiet
        ORR     x0, x0, #FPSCR_C        ; GT
        TEQ     r0, #0
        ORREQ   x0, x0, #FPSCR_C+FPSCR_V ; unordered
        Debug   x, "result ", x0
        STR     x0, [xctx, #Context_FPSCR]
        B       AdvanceToNext_Scalar

50
        ; VCMPE: All NaNs cause exceptions 
        BL      float$bits._eq_signaling
        TEQ     r0, #0
        ORRNE   x0, x0, #FPSCR_Z+FPSCR_C ; EQ
        BNE     %FT90
      [ "$prec" = "D"
        LDMIA   sp,{r0-r3}
      |
        LDMIA   sp,{r0-r1}
      ]
        BL      float$bits._lt
        TEQ     r0, #0
        ORRNE   x0, x0, #FPSCR_N        ; LT
        BNE     %FT90
        ; Swap the two operands for the final check (no GT test in SoftFloat)
      [ "$prec" = "D"
        LDMFD   sp!,{r2-r3}
        LDMFD   sp!,{r0-r1}
      |
        Pull    "r1"
        Pull    "r0"
      ]
        BL      float$bits._lt
        ORR     x0, x0, #FPSCR_C        ; GT
        TEQ     r0, #0
        ORREQ   x0, x0, #FPSCR_C+FPSCR_V ; unordered
        Debug   x, "result ", x0
        STR     x0, [xctx, #Context_FPSCR]
        B       AdvanceToNext_Scalar

90
      [ "$prec" = "D"
        ADD     sp, sp, #16
      |
        ADD     sp, sp, #8
      ]
        Debug   x, "result ", x0
        STR     x0, [xctx, #Context_FPSCR]
        B       AdvanceToNext_Scalar


VMUL_VNMUL_$prec TRACE
        ; VMUL: D = N * M
        ; VNMUL: D = -(N * M)
        BL      float$bits._mul
        ; Bit 6 controls whether VMUL or VNMUL
        TST     xins, #1<<6
        NegRegFP_$prec  NE, xa
        StoreReg_$prec , D, xa, ip
        B       ThreeRegTail_$prec        

VDIV_$prec TRACE
        ; D = N / M
        BL      float$bits._div
        StoreReg_$prec , D, xa, ip
        B       ThreeRegTail_$prec

VSQRT_$prec TRACE
        ; D = sqrt(M)
        CheckSubnormal_$prec ,xa
        BL      float$bits._sqrt
        StoreReg_$prec , D, xa, ip
        B       TwoRegTail_$prec

        ; VMOV, VABS and VNEG should never bounce, and shouldn't generate any
        ; exceptions. However IXE=1 on SubArchV1 will trigger synchronous
        ; exceptions for them (even though we shouldn't generate any actual
        ; exception). There's also a chance they could show up in FPINST2 (the
        ; TRM doesn't explicitly indicate that they can't).
VABS_$prec TRACE
        ; D = ABS(M)
        AbsRegFP_$prec , xa
        ; Fall through...
VMOV_$prec TRACE
        ; D = M
        StoreReg_$prec , D, xa, ip
        B       TwoRegTail_$prec

VNEG_$prec TRACE
        ; D = -M
        NegRegFP_$prec , xa
        StoreReg_$prec , D, xa, ip
        B       TwoRegTail_$prec

VCVT_DP_SP_$prec TRACE
        ; $prec indicates source width, $invprec destination width
        GetRegNo_$invprec D,x0
        GetRegNo_$prec M,xa
        LoadReg_$prec ,xa,
        CheckSubnormal_$prec ,xa
        BL      float$bits._to_float$invbits
        StoreReg_$invprec ,,xa,x0
        B       AdvanceToNext_Scalar

VCVT_FP_U32_$prec TRACE
        ; M operand is a S register
        GetRegNo_S M,xa
        GetRegNo_$prec D,x0
        LoadReg_S ,xa
        ; There aren't any unsigned into to float functions in SoftFloat
        ; However, we can abuse the int64 functions
        MOV     r1, #0
        BL      int64_to_float$bits
        StoreReg_$prec ,,xa,x0
        B       AdvanceToNext_Scalar

VCVT_FP_S32_$prec TRACE
        ; M operand is a S register
        GetRegNo_S M,xa
        GetRegNo_$prec D,x0
        LoadReg_S ,xa
        BL      int32_to_float$bits
        StoreReg_$prec ,,xa,x0
        B       AdvanceToNext_Scalar

VCVTR_U32_FP_$prec TRACE
        ; Round using FPSCR
        ; There aren't any float-to-unsigned int functions, but we can abuse the
        ; int64 functions
        ; TODO - is this correct wrt NaNs, infinities, etc.?
        GetRegNo_$prec M,xa
        LoadReg_$prec ,xa
        CheckSubnormal_$prec ,xa
        BL      float$bits._to_int64
        CMP     xahi, #0
        BEQ     %FT10
        MOVLT   x0, #0
        MOVGT   x0, #-1
        MOV     r0, #FPSCR_IOC          ; Out of range values trigger IO exception
        BL      float_raise
        MOV     xa, x0
10
        ; D operand is a S register
        GetRegNo_S D,ip
        StoreReg_S ,,xa,ip
        B       AdvanceToNext_Scalar
        

VCVT_U32_FP_$prec TRACE
        ; Round to zero
        ; There aren't any float-to-unsigned int functions, but we can abuse the
        ; int64 functions
        ; TODO - is this correct wrt NaNs, infinities, etc.?
        GetRegNo_$prec M,xa
        LoadReg_$prec ,xa
        CheckSubnormal_$prec ,xa
        BL      float$bits._to_int64_round_to_zero
        CMP     xahi, #0
        BEQ     %FT10
        MOVLT   x0, #0
        MOVGT   x0, #-1
        MOV     r0, #FPSCR_IOC          ; Out of range values trigger IO exception
        BL      float_raise
        MOV     xa, x0
10
        ; D operand is a S register
        GetRegNo_S D,ip
        StoreReg_S ,,xa,ip
        B       AdvanceToNext_Scalar

VCVTR_S32_FP_$prec TRACE
        ; Round using FPSCR
        GetRegNo_$prec M,xa
        LoadReg_$prec ,xa
        CheckSubnormal_$prec ,xa
        BL      float$bits._to_int32
        ; D operand is a S register
        GetRegNo_S D,ip
        StoreReg_S ,,xa,ip
        B       AdvanceToNext_Scalar

VCVT_S32_FP_$prec TRACE
        ; Round to zero
        GetRegNo_$prec M,xa
        LoadReg_$prec ,xa
        CheckSubnormal_$prec ,xa
        BL      float$bits._to_int32_round_to_zero
        ; D operand is a S register
        GetRegNo_S D,ip
        StoreReg_S ,,xa,ip
        B       AdvanceToNext_Scalar

VMOV_imm_$prec TRACE
        ; Get dest register number
        BL      GetOneReg_$prec
        ; Decode the floating point constant
        ; Encoded as:
        ; ---- ---- ---- abcd ---- ---- ---- efgh
        ; Single precision:
        ; aBbb bbbc defg h000 0000 0000 0000 0000
        ; Double precision:
        ; aBbb bbbb bbcd efgh 0000 0000 0000 0000 (0000...)
        EOR     x2, xins, #&4<<16
        AND     x0, xins, #&7<<16
        AND     x1, xins, #&F
        ORR     x0, x1, x0, LSR #12 ; bcdefgh
        MOV     x2, x2, LSL #12
        MOV     x0, x0, LSL #25
        AND     x2, x2, #&C<<28
      [ "$prec" = "D"
        MOV     x1, x0, ASR #7 ; bbbbbbbbcdefgh00000...
        ASSERT  xclo != x1
        ASSERT  xclo != x2
        MOV     xclo, #0
        ORR     xchi, x2, x1, LSR #2 ; Prepend aB
      |
        MOV     x0, x0, ASR #4 ; bbbbbcdefgh00000...
        ORR     xc, x2, x0, LSR #2 ; Prepend aB
      ]
VMOV_imm_loop_$prec
        StoreReg_$prec , D, xc, ip
        ADR     lr, VMOV_imm_loop_$prec
        B       AdvanceToNext        

        ; Unimplemented VFPv3 instructions
      [ debugx
VCVTB_VCVTT_$prec TRACE
        B       VFPSupportCode_Undefined
VCVT_FP_FIXED_$prec TRACE
        B       VFPSupportCode_Undefined
      ]        

        IMPORT  float$bits._add
        IMPORT  float$bits._sub
        IMPORT  float$bits._mul
        IMPORT  float$bits._div
        IMPORT  float$bits._sqrt
        IMPORT  float$bits._eq
        IMPORT  float$bits._lt_quiet
        IMPORT  float$bits._eq_signaling
        IMPORT  float$bits._lt
        IMPORT  int64_to_float$bits
        IMPORT  int32_to_float$bits
        IMPORT  float$bits._to_int64
        IMPORT  float$bits._to_int64_round_to_zero
        IMPORT  float$bits._to_int32
        IMPORT  float$bits._to_int32_round_to_zero
        IMPORT  float$bits._to_float$invbits

        END
