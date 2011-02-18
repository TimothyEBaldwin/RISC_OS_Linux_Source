; Assembler source for FPA support code and emulator
; ==================================================
; Definitions and default values of optional optimisations. Also used by
; "fplib".
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

; The "traps never return" code size optimisation.

                GBLL    TrapsCanReturn
TrapsCanReturn  SETL    {TRUE}

; The "FPE context uses 4 words per register" speed optimisation.

                GBLL    FPE4WordsPerReg
FPE4WordsPerReg SETL    {FALSE}

; The "do integer powers" optimisation.

                GBLL    DoIntegerPowers
DoIntegerPowers SETL    {TRUE}

; The value of 0^0.

                GBLS    ZeroToTheZero
ZeroToTheZero   SETS    "One"

; The "FPE checks whether next instruction is floating point" optimisation.

                GBLL    FPEChecksNextInstr
FPEChecksNextInstr SETL {TRUE}

; The "no transcendentals" optimisation.

                GBLL    NoTranscendentals
NoTranscendentals SETL  {FALSE}

; The "no packed precision" optimisation.

                GBLL    NoPacked
NoPacked        SETL    {FALSE}

; Implement dynamic rounding modes

                GBLL    DynamicRounding
DynamicRounding SETL    {FALSE}

;===========================================================================

        END
