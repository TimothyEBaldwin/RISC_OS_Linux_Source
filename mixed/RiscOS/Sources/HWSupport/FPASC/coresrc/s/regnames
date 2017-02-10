; Assembler source for FPA support code and emulator
; ==================================================
; Register allocations. Also used by "fplib".
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

; Register usage at top level in undefined instruction handler.

Rsp     RN      R13     ;Our stack pointer
Rfp     RN      R12     ;Our "frame pointer" - points to ARM register dump
Rins    RN      R11     ;Offending instruction itself
Rwp     RN      R10     ;The workspace pointer/an entry sequence temporary
Rtmp2   RN      R9      ;A temporary
Rtmp    RN      R8      ;A temporary

; Register usage in the arithmetic and rounding routines, and the Prepare
; and Round stage exception routines. Rfpsr, Rins, Rwp, Rfp and Rsp are
; also part of this interface.

OP1sue  RN      R0      ;The sign, uncommon bit and (sometimes) exponent of
                        ; the first or only operand
OP1mhi  RN      R1      ;The mantissa of the first or only operand - high
                        ; word
OP1mlo  RN      R2      ;The mantissa of the first or only operand - low
                        ; word
RNDexp  RN      R3      ;The exponent of the number being rounded
OP2sue  RN      R3      ;The sign, uncommon bit and (sometimes) exponent of
                        ; the second operand
RNDdir  RN      R4      ;Direction number has already been rounded (0 = exact,
                        ; positive = rounded up, negative = rounded down)
OP2mhi  RN      R4      ;The mantissa of the second operand - high word
RNDprm  RN      R5      ;Precision and rounding mode for rounding, as two
                        ; adjacent 2 bit fields, lower one at position RM_pos
                        ; within word, higher one at RM_pos+2.
OP2mlo  RN      R5      ;The mantissa of the second operand - low word
Rarith  RN      R6      ;A temporary
Rfpsr   RN      R7      ;FPSR contents

; Two more temporaries, used when accessing ARM registers. The requirements
; are (a) that they are not equal to any of the result registers (OP1sue,
; OP1mhi, OP1mlo and Rarith); (b) that they are not equal to Rfpsr, Rins,
; Rwp, Rfp or Rsp; (c) that they are not banked registers; (d) that they
; are not equal to RNDprm.

Rregno  RN      R3
Rregval RN      R4

        ASSERT  Rregno <> OP1sue
        ASSERT  Rregno <> OP1mhi
        ASSERT  Rregno <> OP1mlo
        ASSERT  Rregno <> Rfpsr
        ASSERT  Rregno <> Rins
        ASSERT  Rregno <> Rwp
        ASSERT  Rregno <> Rfp
        ASSERT  Rregno <> Rsp
        ASSERT  Rregno < R8
        ASSERT  Rregno <> RNDprm

        ASSERT  Rregval <> OP1sue
        ASSERT  Rregval <> OP1mhi
        ASSERT  Rregval <> OP1mlo
        ASSERT  Rregval <> Rfpsr
        ASSERT  Rregval <> Rins
        ASSERT  Rregval <> Rwp
        ASSERT  Rregval <> Rfp
        ASSERT  Rregval <> Rsp
        ASSERT  Rregval < R8
        ASSERT  Rregval <> RNDprm

        ASSERT  Rregno <> Rregval

; Some commonly used register lists:

OP1regs RLIST   {OP1sue,OP1mhi,OP1mlo}
        ASSERT  OP1sue < OP1mhi
        ASSERT  OP1mhi < OP1mlo

OP2regs RLIST   {OP2sue,OP2mhi,OP2mlo}
        ASSERT  OP2sue < OP2mhi
        ASSERT  OP2mhi < OP2mlo

        END
