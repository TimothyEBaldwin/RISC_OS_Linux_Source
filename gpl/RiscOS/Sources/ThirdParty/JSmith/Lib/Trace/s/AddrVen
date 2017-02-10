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
	AREA	Trace_AddrVen, CODE
	
	GET sh.Macros
	
	;MACRO
	;EXPORTGLOBAL	$name
	;EXPORT	$name
;$name
	;MEND
	
address_zero
	
	EXPORTGLOBAL	Trace__AddressV
	
	; Call user function.
	STMFD	sp!, { a1-a4, ip, lr}
	
	LDR	a1, Trace__AddressV_offset_address__POS
	
Trace__AddressV_offset_BL_AddressVHandler__POS
	BL	address_zero	; Relocate to:	BL Trace__AddressVHandler
	
	LDMFD	sp!, { a1-a4, ip, lr}
	
Trace__AddressV_offset_relocated_instruction__POS
	MOV	r0, r0		; Replace with relocated intercepted instruction.
	
Trace__AddressV_offset_B_back__POS
	B	address_zero	; Relocate to:	B	intercepted instruction+1
	
Trace__AddressV_offset_address__POS
	DCD	0		; Set to original address being intercepted.
	
Trace__AddressV_codesize__POS
	
	
	EXPORTGLOBAL	Trace__AddressV_code
	DCD	Trace__AddressV
	
	;MACRO
	;MakeOffset	$name
	;EXPORTGLOBAL	$name
	;DCD	($name.__POS - Trace__AddressV)
	;MEND
	
	MakeOffset	Trace__AddressV_codesize,			address_zero
	MakeOffset	Trace__AddressV_offset_BL_AddressVHandler,	address_zero
	MakeOffset	Trace__AddressV_offset_relocated_instruction,	address_zero
	MakeOffset	Trace__AddressV_offset_B_back,			address_zero
	MakeOffset	Trace__AddressV_offset_address,			address_zero
	
	;GLOBAL	Trace__AddressV_codesize
	;DCD	Trace__AddressV_End - Trace__AddressV
	;
	;GLOBAL	Trace__AddressV_offset_BL_AddressVHandler
	;DCD	Trace__AddressV_BLHandler - Trace__AddressV
	;
	;GLOBAL	Trace__AddressV_offset_relocated_instruction
	;DCD	Trace__AddressV_RelocatedInstruction - Trace__AddressV
	;
	;GLOBAL	Trace__AddressV_offset_B_back
	;DCD	Trace__AddressV_BBack - Trace__AddressV
	;
	;GLOBAL	Trace__AddressV_offset_address
	;DCD	Trace__AddressV_address - Trace__AddressV
	;
	END
