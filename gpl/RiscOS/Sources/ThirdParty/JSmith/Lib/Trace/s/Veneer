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
	;
	; Example function:

	;	EQUS "Foo"
	;	EQUD &ff0000c	; length of 'Foo', rounded up to word.
	;	Foo
	;		MOV	ip, lr
	;		STMFD	sp!, { r0, fp, ip, lr, pc}
	;		...

	; This will be replaced by:
	;
	;	Foo
	;		B	HierProf__Function2_Foo
	;		STMFD	sp!, { r0, fp, ip, lr, pc}
	;		...

		; (in some malloc block)


	AREA	Trace_veneer, CODE

	GET sh.Macros

address_zero
	EXPORTGLOBAL	Trace__Function2

        MRS     ip, CPSR        ; Can't be bothered with 26-bit ARMs
        STR     ip, [sp, #-4]!  ; to store flags...
	LDR	ip, Trace__Function2_local_r14
	CMP	ip, #0

	BEQ	intercept

	; Have to restore flags - we are returning without MOVS pc, lr.
        LDR     ip, [sp], #4
        MSR     CPSR_f, ip      ; restore flags

Trace__Function2_offset_relocated_instruction1__POS
	MOV	r0, r0		; Replace with first instruction from original Foo.

Trace__Function2_offset_B_back1__POS
	B	address_zero	; Relocate to:	B	Foo + 1 instruction

intercept

        LDR     ip, [sp], #4
        MSR     CPSR_f, ip      ; restore flags

	STR	lr, Trace__Function2_local_r14

	; Call start function.
	STMFD	sp!, { a1-a4}
	ADR	a1, Trace__Function2_name

Trace__Function2_offset_BL_starthandler__POS
	BL	address_zero	; Relocate to:	BL Trace__StartHandler

	LDMFD	sp!, { a1-a4}

	; Call Foo

	; The return address in lr has to be done by hand:

	; The next two instructions put address of 'return' into lr, but with
	; the same processor mode flags as the current pc.
	; This is a fix for a bug found by Ben Laughton - previously, 'ADR lr, return'
	; was used, which resulted in a change to USR mode when lr was used to return
	; from Foo. This caused big problems when running in non-USR mode originally
	; (eg module code).

	;ADR	lr, return
	MOV	lr, #(return-.-12)
	ADD	lr, lr, pc

Trace__Function2_offset_relocated_instruction2__POS
	MOV	r0, r0		; Replace with first instruction from original Foo.

Trace__Function2_offset_B_back2__POS
	B	address_zero	; Relocate to:	BL	Foo + 1 instruction

return
	; Call Stop handler
	STMFD	sp!, { a1-a4}
	ADR	a1, Trace__Function2_name

Trace__Function2_offset_BL_stophandler__POS
	BL	address_zero	; Relocate to:	BL	Trace__StopHandler

	; Recover stored lr.
	LDR	lr, Trace__Function2_local_r14
	MOV	ip, #0
	STR	ip, Trace__Function2_local_r14

	LDMFD	sp!, { a1-a4}
     [ {CONFIG}=26
	MOVS	pc, lr	; Now restores flags... 19 Aug 1996
     |
        MOV     pc, lr
     ]

Trace__Function2_local_r14
	DCD	0


;	EXPORT	Trace__Function2_End
;Trace__Function2_End
Trace__Function2_codesize__POS

Trace__Function2_name = "Foo", 0
	ALIGN

	MakeOffset	Trace__Function2_codesize,			address_zero
	MakeOffset	Trace__Function2_offset_relocated_instruction1,	address_zero
	MakeOffset	Trace__Function2_offset_B_back1,		address_zero
	MakeOffset	Trace__Function2_offset_BL_starthandler,	address_zero
	MakeOffset	Trace__Function2_offset_relocated_instruction2,	address_zero
	MakeOffset	Trace__Function2_offset_B_back2,		address_zero
	MakeOffset	Trace__Function2_offset_BL_stophandler,		address_zero


	END
