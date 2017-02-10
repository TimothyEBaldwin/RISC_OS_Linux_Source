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

OSByte_ReadCMOS	*	161
CMOS_IPAddress0 *	108
CMOS_IPAddress1 *	109
CMOS_IPAddress2 *	110
CMOS_IPAddress3 *	0

	Entry
ReadCMOSIP
	MOV	R0,#OSByte_ReadCMOS
	MOV	R1,#CMOS_IPAddress0
	SWI	XOS_Byte
	MOVVS	PC,LR
	MOV	R4,R2

	MOV	R1,#CMOS_IPAddress1
	SWI	XOS_Byte
	MOVVS	PC,LR
	MOV	R5,R2

	MOV	R1,#CMOS_IPAddress2
	SWI	XOS_Byte
	MOVVS	PC,LR
	MOV	R6,R2

	MOV	R1,#CMOS_IPAddress3
	SWI	XOS_Byte
	MOVVS	PC,LR
	MOV	R7,R2

	; If the address is 0.0.0.0 don't do anything
	; If it's 0.0.0.x then treat as 10.0.0.x
	CMPS	R4,#0           ; clears V
	TEQEQS	R5,#0
	TEQEQS	R6,#0
	MOVEQ	R4,#10
	TEQEQS	R7,#0
	MOVEQ	PC,LR

	MOV	R0,R4
	MOV	R1,R12
	MOV	R2,#512
	SWI	XOS_ConvertCardinal1
	MOVVS	PC,LR
	MOV	R0,#"."
	STRB	R0,[R1],#1

	MOV	R0,R5
	SWI	XOS_ConvertCardinal1
	MOVVS	PC,LR
	MOV	R0,#"."
	STRB	R0,[R1],#1

	MOV	R0,R6
	SWI	XOS_ConvertCardinal1
	MOVVS	PC,LR
	MOV	R0,#"."
	STRB	R0,[R1],#1

	MOV	R0,R7
	SWI	XOS_ConvertCardinal1
	MOVVS	PC,LR

	SUB	R2,R1,R12
	ADR	R0,VarName
	MOV	R1,R12
	MOV	R3,#0
	MOV	R4,#0
	SWI	XOS_SetVarVal
	MOV	PC,LR

VarName
	= "Inet$CMOSIPAddr", 0

	= "ReadCMOSIP 1.01 (27 Apr 2000)"

	END
