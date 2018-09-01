; Assembler source for FPA support code and emulator
; ==================================================
; Definitions relating to the ARM. Also used by "fplib".
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

; PSR fields.

Flags_mask      EQU     &F0000000
N_bit           EQU     &80000000
Z_bit           EQU     &40000000
C_bit           EQU     &20000000
V_bit           EQU     &10000000
                [ {CONFIG}=26
IntMasks_mask     EQU     &0C000000
I_bit             EQU     &08000000
F_bit             EQU     &04000000
Mode_mask         EQU     &00000003
PSR_mask          EQU     Flags_mask:OR:IntMasks_mask:OR:Mode_mask
                ]
                [ {CONFIG}=32
IntMasks_mask     EQU     &000000C0
I_bit             EQU     &00000080
F_bit             EQU     &00000040
T_bit             EQU     &00000020
Mode_mask         EQU     &0000001F
Mode_32not26      EQU     &00000010
Mode_USR32        EQU     &00000010
Mode_FIQ32        EQU     &00000011
Mode_IRQ32        EQU     &00000012
Mode_SVC32        EQU     &00000013
Mode_ABT32        EQU     &00000017
Mode_UND32        EQU     &0000001B
Mode_SYS32        EQU     &0000001F
                ]
Mode_USR26      EQU     &00000000
Mode_FIQ26      EQU     &00000001
Mode_IRQ26      EQU     &00000002
Mode_SVC26      EQU     &00000003

; The ARM vectors.

Reset_vector    EQU     &00
Undef_vector    EQU     &04
SWI_vector      EQU     &08
Prefetch_vector EQU     &0C
Data_vector     EQU     &10
        [ {CONFIG}=26
AdrExc_vector   EQU     &14
        ]
IRQ_vector      EQU     &18
FIQ_vector      EQU     &1C

; Other ARM constants.

TopBit          EQU     &80000000

;===========================================================================

        END
