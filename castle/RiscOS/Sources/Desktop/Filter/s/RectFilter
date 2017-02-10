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
; > s.rectFilter

;;----------------------------------------------------------------
;; rect_filter_handler
;;
;; This is called by the Wimp on entry to int_get_rectangle
;;
;; Entry:
;;
;;      R2 - Task handle of calling task.
;;
;; Exit:
;;
;;      All other registers preserved.
;;
;;      All interested filters called.
;;
;;

rect_filter_handler

        Push    "r0-r2,LR"		; If you change this, change the
					; sortout_fakepostrect routine
        MOV     R2,R2,ASL #16
        MOV     R2,R2,LSR #16

        [ :LNOT: No26bitCode
        LDR	LR, fake_postrect	; If we're faking post-rectangle
	TEQ	LR, #0			; filters, and we have any
	LDRNE	LR, post_rect_filters	; claimants, go poke the
	TEQNE	LR, #0			; Window Manager's stack
	BLNE	sortout_fakepostrect
        ]

        LDR     r0, get_handle_from_r10 ; find the window being redrawn
        TEQ     r0, #0
        LDREQ   r0, [sp,#16+12+0]	; BTW - you didn't see that...
        ADDEQ   r0, r0, #1
        ADDNE   r0, r10, #1		; turn pointer into window handle

        LDR     r1,rect_filters
rect_filter_exit
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
        BNE     rect_filter_exit        ; Filter not interested.

        LDR     r12,[r1,#f_R12]        ; Set R12.

        MOV     LR,PC
        LDR     PC, [r1,#f_address]
        NOP
        Pull    "r1"
        B       rect_filter_exit
        LNK     s.PoRtFilter


