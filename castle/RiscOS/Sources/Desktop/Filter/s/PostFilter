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
; > s.PostFilter

;;----------------------------------------------------------------
;; Post_filter_handler
;;
;; This is called by the Wimp on exit from Wimp_Poll
;;
;; Entry:
;;
;;      R0 - Event code
;;      R1 - Pointer to event block.
;;      R2 - Task handle of calling task.
;;
;; Exit:
;;      R0 - Modified event code
;;           or -1 to claim the event and not pass it to the application.
;;      [R1] may be modified to include data for the event.
;;
;;      All interested filters called.
;;
;;

post_filter_handler

        Push    "r1-r7,LR"

        MOV     R2,R2,ASL #16
        MOV     R2,R2,LSR #16

        MOV     R6,R0
        MOV     R7,R0

        LDR     r3,post_filters
01
        CMP     r3,#0
        CMPEQ   R6,#-1
        MOVEQ   R0,#-1
        CMP     r3,#0
      [ No26bitCode
        Pull    "r1-r7,PC",EQ          ; End of list.
      |
        Pull    "r1-r7,PC",EQ,^        ; End of list.
      ]      
        LDR     r4,[r3,#next_ptr]
        Push    "r4"

        LDR     r14,[r3,#f_task]
        TEQ     r14,R2
        CMPNE   r14,#0
        Pull    "r3",NE
        BNE     %BT01                  ; Filter not interested in this task.

        LDR     r14,[r3,#f_mask]
        MOV     r4,#1
        CMP     r0,#31
        MOVLS   r4,r4,ASL r0
        MOVHI   r4,#0                  ; This event cannot be masked
        TST     r14,r4
        Pull    "r3",NE
        BNE     %BT01                  ; Filter not interested in this event.

        LDR     r12,[r3,#f_R12]        ; Set R12.
        LDR     r4, [r3,#f_address]
        Debug   xx,"MGR - Calling post filter."
        MOV     LR,PC                  ; Task handle is in R2.
        MOV     PC,r4                  ; Call filter (r0=event r1->block)
        NOP
post_filter_exit
        Pull    "r3"
        Debug   xx,"MGR - Post filter returned."

        CMP     R0,#-1
        MOVEQ   R6,R0
        MOVEQ   R0,R7
        B       %BT01

        LNK     s.Tail
