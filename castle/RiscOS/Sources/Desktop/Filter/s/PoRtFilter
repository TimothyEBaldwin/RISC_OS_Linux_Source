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
; > s.PoRtFilter

;;----------------------------------------------------------------
;; post_rect_filter_handler
;;
;; This is called by the Wimp on exit from int_get_rectangle
;;
;; Entry:
;;
;;      R2    - Task handle of calling task.
;;      R6-R9 - screen coordinates of rectangle (x0,y0,x1,y1)
;;      R10   - window handle - 1
;;
;; Exit:
;;
;;      All other registers preserved.
;;
;;      All interested filters called.
;;
;;

post_rect_filter_handler

        Push    "r0-r2,LR"

        MOV     R2,R2,ASL #16
        MOV     R2,R2,LSR #16

        ADD     r0,r10,#1	         ; find the window being redrawn

        LDR     r1,post_rect_filters
post_rect_filter_exit
        CMP     r1,#0
      [ No26bitCode
        Pull    "r0-r2,PC",EQ            ; End of list.
      |
        Pull    "r0-r2,PC",EQ,^          ; End of list.
      ]
        LDR     r14,[r1,#next_ptr]
        Push    "r14"

        LDR     r14,[r1,#f_task]
        TEQ     r14,R2
        CMPNE   r14,#0
        Pull    "r1",NE
        BNE     post_rect_filter_exit        ; Filter not interested.

        LDR     r12,[r1,#f_R12]        ; Set R12.

        MOV     LR,PC
        LDR     PC, [r1,#f_address]
        NOP
        Pull    "r1"
        B       post_rect_filter_exit

        [ :LNOT: No26bitCode

	; Can get away with this inline data as we'll only need to
	; fake when softloading anyway.

	; Eight words to store R2,R6-R9,R10,R12
fake_regdump
	%	7*4
	; The address that int_get_rectangle was supposed to return to
fake_retaddr
	%	4

	; We want to return to 2 instructions after this instruction
	; in the Wimp's int_get_rectangle routine.
fake_magic_marker
	TST	R14,#&0C

int_get_rectangle_reentry_addr
	DCD 	0

	; This rectangle filter checks that we are being called from
	; the second rectangle filter call in the Wimp (R0=-1), and
	; if so, we poke a new return address into the stack, so that
	; int_get_rectangle returns to fakepostrect_handler.
	; What we then do is return to within int_get_rectangle, having
	; fixed the stack up, to where it sets the fg/bg colours
	; (starting at the instruction "fake_magic_marker").
	;
	; The stack at this point contains 4 words from rect_filt_handler,
	; 3 words from the Wimp's CallFilter macro, followed by
	; handle, userblk and lr from int_get_rectangle.
sortout_fakepostrect
	CMP	r0,#-1
	MOVNES	pc,lr
	Push	"r0-r1,r10,lr"
	ADR	r0,fakepostrect_handler
	LDR	lr,[r13,#(4+4+3+2)*4]		; Fiddle with int_get_rectangle's
	AND	r1,lr,#&FC000003		; lr
	ORR	r0,r0,r1
	STR	r0,[r13,#(4+4+3+2)*4]
	LDR	r10,[r13,#(4+4+3+0)*4]		; Get int_get_rectangle's handle
	ADR	r0,fake_regdump
	STMIA	r0,{r2,r6-r9,r10,r12,lr}
	; Find int_get_rectangle_reentry_addr
	LDR	r0,int_get_rectangle_reentry_addr
	TEQ	r0,#0
	Pull	"r0-r1,r10,pc",NE
	LDR	lr,[r13,#(4+3)*4]		; Get original lr passed to rect filter
	BIC	lr,lr,#&FC000003
	LDR	r1,fake_magic_marker
	; Scan forward to find the magic marker
05	LDR	r0,[lr,#4]!
	TEQ	r0,r1
	BNE	%BT05
	ADD	lr,lr,#8
	STR	lr,int_get_rectangle_reentry_addr
	Pull	"r0-r1,r10,pc"

fakepostrect_handler
	LDR	lr,fake_retaddr
	Push	"r2,r6-r9,r10,r12,lr"
	ADR	lr,fake_regdump
	LDMIA	lr,{r2,r6-r9,r10,r12}
	BL	post_rect_filter_handler
	Pull	"r2,r6-r9,r10,r12"
	LDR	pc,int_get_rectangle_reentry_addr

        ]

        LNK     s.PoIcFilter


