; This source code in this file is licensed to You by Castle Technology
; Limited ("Castle") and its licensors on contractual terms and conditions
; ("Licence") which entitle you freely to modify and/or to distribute this
; source code subject to Your compliance with the terms of the Licence.
; 
; This source code has been made available to You without any warranties
; whatsoever. Consequently, Your use, modification and distribution of this
; source code is entirely at Your own risk and neither Castle, its licensors
; nor any other person who has contributed to this source code shall be
; liable to You for any loss or damage which You may suffer as a result of
; Your use, modification or distribution of this source code.
; 
; Full details of Your rights and obligations are set out in the Licence.
; You should have received a copy of the Licence with this source code file.
; If You have not received a copy, the text of the Licence is available
; online at www.castle-technology.co.uk/riscosbaselicence.htm
; 

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Proc

	AREA	|ObjAsm$$Code|,CODE,READONLY

	Entry
CheckMem
	SWI	XOS_ReadMemMapInfo
	MOVVS	PC,LR

	MOV	R8,R0

	MOV	R0,#161
	MOV	R1,#145		; System heap size
	SWI	XOS_Byte
	MOVVS	PC,LR
	MUL	R0,R2,R8
	CMPS	R0,#8*1024
	BGE	%F2
	; Reconfigure system heap size to 8K
	STMFD	R13!,{LR}
	MOV	R0,#8*1024
	MOV	R1,R8
	BL	Div
	MOV	R2,R0
	MOV	R0,#162
	MOV	R1,#145
	SWI	XOS_Byte
	LDMFD	R13!,{LR}
	MOVVS	PC,LR
2	MOV	R0,#161
	MOV	R1,#146
	SWI	XOS_Byte
	MOVVS	PC,LR
	MUL	R0,R2,R8
	CMPS	R0,#256*1024
	MOVGE	PC,LR
	; Reconfigure RMA size to 256K
	STMFD	R13!,{LR}
	MOV	R0,#256*1024
	MOV	R1,R8
	BL	Div
	MOV	R2,R0
	MOV	R0,#162
	MOV	R1,#146
	SWI	XOS_Byte
	LDMFD	R13!,{PC}

Div
	STMFD	R13!,{R1-R3}
	MOV	R3,R1
	CMPS	R3,R0,LSR #1
Div1	MOVLS	R3,R3,LSL #1
	CMPS	R3,R0,LSR #1
	BLS	Div1
	MOV	R2,#0
Div2	CMPS	R0,R3
	SUBCS	R0,R0,R3
	ADC	R2,R2,R2
	MOV	R3,R3,LSR #1
	CMPS	R3,R1
	BHS	Div2
	ADDS	R0,R2,#0        ; clear V
	LDMFD	R13!,{R1-R3}
	MOV	PC,LR

	= "CheckMem 1.01 (27 Apr 2000)"

	END
