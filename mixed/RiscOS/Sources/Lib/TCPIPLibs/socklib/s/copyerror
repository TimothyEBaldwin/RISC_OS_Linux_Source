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

	[ :LNOT::DEF:module
	GBLL	module
	]

ESRCH	*	3
EREMOTE	*	71

	AREA	SockLib,CODE,READONLY
	ROUT
	EXPORT	_copyerror
_copyerror
	STMFD	sp!,{v1,lr}
	[ module
	LDR	ip,[sl,#-536]
	]
; Extract error number from error block
	LDR	a2,[a1,#0]
; If error is in the range &20E00-&20E7F, it is a UNIX style error -
; shift it into the range 0-&7F
	SUB	a3,a2,#&20C00
	CMPS	a3,#&200
	BLT	%F1
	CMPS	a3,#&280
	BGE	%F1
	AND	a2,a2,#&FF
; If UNIX-style error is > EREMOTE, change it to ESRCH
	CMPS	a2,#EREMOTE
	MOVGT	a2,#ESRCH

; Update errno
1	LDR	a3,P_errno
	[ module
	STR	a2,[a3,ip]
	|
	STR	a2,[a3]
	]

; Copy error into _inet_error
	LDR	a2,P__inet_error
	[ module
	ADD	a2,ip,a2
	]
	MOV	ip,#16
0	LDMIA	a1!,{a3-a4,v1,lr}
	STMIA	a2!,{a3-a4,v1,lr}
	SUBS	ip,ip,#1
	BNE	%B0

	MVN	a1,#0
        [ {CONFIG}=26
	LDMFD	sp,{v1,pc}^
        |
	LDMFD	sp,{v1,pc}
        ]

P_errno
	IMPORT	__errno
	DCD	__errno

P__inet_error
	DCD	_inet_error

; **********************************************************************

	AREA	SockLibData,DATA,NOINIT

	EXPORT	_inet_error
_inet_error
	%	256

	END
