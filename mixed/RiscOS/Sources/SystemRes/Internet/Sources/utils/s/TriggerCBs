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
;
; Trigger CBs - just fire off a few SWIs to let callbacks happen in the
; middle of an Obey file. Otherwise RMLoading MbufManager, Internet, Net
; all in one Obey file doesn't quite work properly; the Internet module
; hasn't sorted itself out or found its drivers by the time the Net module
; appears.
;
        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Proc

	AREA	|ObjAsm$$Code|,CODE,READONLY

	Entry
TriggerCBs
	MOV	R5,#16
0	MOV	R0,#0
	MOV	R1,#1
	SWI	XOS_Byte
	SUBS	R5,R5,#1
	BNE	%B0
	MOV	PC,LR

	= "TriggerCBs 1.01 (27 Apr 2000)"

	END
