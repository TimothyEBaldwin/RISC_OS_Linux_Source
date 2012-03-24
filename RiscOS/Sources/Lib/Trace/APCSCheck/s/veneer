;
; Copyright Julian Smith.
;
; This file is part of Trace.
;
; Trace is free software: you can redistribute it and/or modify it under
; the terms of the GNU Lesser General Public License as published by the
; Free Software Foundation, either version 3 of the License, or (at your
; option) any later version.
;
; Trace is distributed in the hope that it will be useful, but WITHOUT
; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
; Public License for more details.
;
; You should have received a copy of the GNU Lesser General Public
; License along with Trace.  If not, see <http://www.gnu.org/licenses/>.
;
        MACRO
        EXTERNALFUNCTION $name
$name
        EXPORT $name
        MEND



	AREA Trace_APCS, CODE


	IMPORT	Trace_APCSCheck_Start2
	IMPORT	Trace_APCSCheck_Stop2


	EXTERNALFUNCTION	Trace_APCSCheck_Start

	STR	r0, tempstore
	STR	r1, tempstore+4
	STR	r2, tempstore+8
	STR	r3, tempstore+12
	STR	r4, tempstore+16
	STR	r5, tempstore+20
	STR	r6, tempstore+24
	STR	r7, tempstore+28
	STR	r8, tempstore+32
	STR	r9, tempstore+36
	STR	r10, tempstore+40
	STR	r11, tempstore+44
	STR	r12, tempstore+48
	STR	r13, tempstore+52
	STR	r14, tempstore+56
        MRS     a2, CPSR
        STR     a2, tempstore+60

	ADR	a2, tempstore
	B	Trace_APCSCheck_Start2




	EXTERNALFUNCTION	Trace_APCSCheck_Stop

	STR	r0, tempstore
	STR	r1, tempstore+4
	STR	r2, tempstore+8
	STR	r3, tempstore+12
	STR	r4, tempstore+16
	STR	r5, tempstore+20
	STR	r6, tempstore+24
	STR	r7, tempstore+28
	STR	r8, tempstore+32
	STR	r9, tempstore+36
	STR	r10, tempstore+40
	STR	r11, tempstore+44
	STR	r12, tempstore+48
	STR	r13, tempstore+52
	STR	r14, tempstore+56
        MRS     a2, CPSR
        STR     a2, tempstore+60


	ADR	a2, tempstore
	BL	Trace_APCSCheck_Stop2

	; Set all registers according to any modifications made by Trace_APCSCheck_Stop2

	LDR	r0, tempstore		; Don't need to do this - not preserved in APCS.
	LDR	r1, tempstore+4		; Don't need to do this - not preserved in APCS.
	LDR	r2, tempstore+8		; Don't need to do this - not preserved in APCS.
	LDR	r3, tempstore+12	; Don't need to do this - not preserved in APCS.
	LDR	r4, tempstore+16
	LDR	r5, tempstore+20
	LDR	r6, tempstore+24
	LDR	r7, tempstore+28
	LDR	r8, tempstore+32
	LDR	r9, tempstore+36
	LDR	r10, tempstore+40
	LDR	r11, tempstore+44
	LDR	r12, tempstore+48	; Don't need to do this - not preserved in APCS.
	LDR	r13, tempstore+52
	LDR	r14, tempstore+56	; This shouldn't have been changed by Trace_APCSCheck_Stop2

	; Set flags only in pc
	SWI	0x16	; OS_EnterOS - need to be in SVC to change (for eg) FIQ flag.
	LDR	ip, tempstore+60
        MSR     CPSR_cf, ip ; This will set original flags and also restore the original mode.

	MOV	pc, lr




tempstore
	DCD	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	END
