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
; File:    toolboxmem.s
; Purpose: veneers onto Toolbox memory allocation SWIs
; Author:  Kevin Bracey
; History: 22-Nov-96: KJB:   created

XToolbox_Memory * &64EF9

	AREA	|ToolboxMemCode|,CODE,READONLY,PIC

	EXPORT	toolbox_memory_alloc
	EXPORT	toolbox_memory_free
	EXPORT	toolbox_memory_extend

        MACRO
        MOVRet  $cond
        [ {CONFIG}=26
        MOV$cond.S    pc,r12
        |
        MOV$cond      pc,r12
        ]
        MEND

toolbox_memory_alloc
	MOV	R12,LR
	MOV	R1,R0
	MOV	R0,#0
	SWI	XToolbox_Memory
	MOVVS	R0,#0
        MOVRet

toolbox_memory_free
	MOV	R12,LR
	MOV	R1,R0
	MOV	R0,#1
	SWI	XToolbox_Memory
        MOVRet

toolbox_memory_extend
	MOV	R12,LR
	MOV	R2,R1
	MOV	R1,R0
	MOV	R0,#2
	SWI	XToolbox_Memory
	MOVVS	R0,#0
        MOVRet

	END
