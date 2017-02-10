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
; Title:   s.callback
; Purpose: To send a Service_ToolboxTaskBorn
; Author:  IDJ
; History: 26-Jul-94: IDJ: Created
;          24-Jan-95: IDJ: only send round toolbox_starting svc call, if
;                          NOT during ROM start-up.
;

r0      RN      0
r1      RN      1
r2      RN      2
r3      RN      3

r4      RN      4
r5      RN      5
r6      RN      6
r7      RN      7
r8      RN      8
r9      RN      9

r10     RN     10
r11     RN     11
r12     RN     12
r13     RN     13

sl      RN     10
fp      RN     11
ip      RN     12
sp      RN     13
lr      RN     14
pc      RN     15

XOS_ServiceCall  EQU  &20030

        EXPORT task_inform_callback_handler
        EXPORT toolbox_starting_callback_handler
	IMPORT task_inform_object_modules_callback

        AREA    |C$$Code|, CODE, READONLY

task_inform_callback_handler

	; Entry
	; R12 = private word of Toolbox module

	STMFD	r13!, {r0-r12, r14}
	MOV	r10, r13, lsr #20
	MOV	r10, r10, lsl #20	; Restore stack limit
	LDMIA	r10, {r4, r5}		; Read data from stack
	LDR	r12, [r12, #0]		; Get contents
	LDMIB	r12, {r11,r12}		; Read data relocation offsets
	STMIA	r10, {r11,r12}		; Store them
	ADD	r10, r10, #540		; Set up correct stack limit
	MOV	r11, #0			; Zero frame pointer
	BL	task_inform_object_modules_callback
	SUB	r10, r10, #540		; Find base of stack
	STMIA	r10, {r4, r5}		; Restore old values
	LDMFD	r13!, {r0-r12,pc}	; Reload registers and return


toolbox_starting_callback_handler

        ; Entry
        ; R12 = 0 => RAM start
        ; [R12] = 0 => RMReinit ROM Toolbox
        ; [R12] = 1 => ROM start-up of Toolbox

        STMFD   sp!,    {r0-r9, r10, r11, r12, lr}

        TEQ     r12,    #0                     ; are we in RAM?
        LDRNE   r1,     [r12]                  ; get value of ROM_started
        TEQNE   r1,     #0                     ; is it during ROM start-up?
        MOVNE   r1,     #0                     ; yes, then reset ROM_started
        STRNE   r1,     [r12]

        LDREQ   r1,     =&44ec1                ; Service_ToolboxStarting
        SWIEQ   XOS_ServiceCall

        LDMFD   sp!,    {r0-r9, r10, r11, r12, pc}

        END
