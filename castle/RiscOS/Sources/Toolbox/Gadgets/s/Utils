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
; Utils

; Revision History:
; piers    26/9/96 Created

	AREA    |C$$code|, CODE, READONLY

	GET	hdr:ListOpts
	GET	hdr:Macros
        GET     Hdr:System
        GET     Hdr:Wimp
        GET     Hdr:Toolbox
        GET     Hdr:APCS.<APCS>

; APCS compliant
; SVC mode compatible (a4/r3 used as link register)

; work_to_screen_handle ----------------------------------------------------
; Converts a work area box to screen coords
;
; Prototype:	_kernel_oserror *work_to_screen_handle(BBox *visible,
;			BBox *work, int window_handle);
; On entry:	r0 = BBox *visible
;		r1 = BBox *work
;		r2 = window_handle
; On exit:	r0 = NULL (or pointer to error block)
work_to_screen_handle
	EXPORT	work_to_screen_handle

	stmfd	sp!, {r4-r9, lr}

	mov	r3, r1
	sub	sp, sp, #36
	mov	r1, sp
	str	r2, [sp]
	mov	r2, r0
	swi	XWimp_GetWindowState
	addvs	sp, sp, #36
        Return  "r4-r9",,VS

	; r2 = visible
	; r3 = work
	ldr	r4, [sp, #4]	; state->visible_area.xmin
	add	sp, sp, #16
	ldmia	sp, {r5, r6, r7}

	add	sp, sp, #36 - 16

	ldmia	r3, {r0, r1, r8, r9}

	sub	ip, r4, r6
	add	r0, r0, ip
	add	r8, r8, ip

	sub	ip, r5, r7
	add	r1, r1, ip
	add	r9, r9, ip

	stmia	r2, {r0, r1, r8, r9}

        Return  "r4-r9"

; window_get_wimp_handle ---------------------------------------------------
; Gets the underlying Wimp handle for the specified window object
;
; On entry:	r0 = flags
;		r1 = window
;		r2 = address of window_handle
; On exit:	r0 = NULL (or pointer to error block)
window_get_wimp_handle
        EXPORT  window_get_wimp_handle
        
	stmfd	sp!, {r2, r4-r9, lr}
	mov     r2, #0          ; Window_GetWimpHandle
        swi     XToolbox_ObjectMiscOp
        ldmvsfd sp!, {r2, r4-r9, pc}
        ldmfd   sp!, {r2, r4-r9, lr}
        teq     r2, #0
        strne   r0, [r2]
        mov     r0, #0
        mov     pc, lr

	END
