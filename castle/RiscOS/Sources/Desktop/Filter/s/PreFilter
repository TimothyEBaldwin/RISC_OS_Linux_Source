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
; > s.PreFilter

;;----------------------------------------------------------------
;; pre_filter_handler
;;
;; This is called by the Wimp on entry to Wimp_Poll
;;
;; Entry:
;;
;;      R0 - Task's event mask.
;;      R2 - Task handle of calling task.
;;
;; Exit:
;;      R0 - Event mask to use.
;;
;;      All other registers preserved.
;;
;;      All interested filters called.
;;
;;

pre_filter_handler

        Push    "r1-r2,LR"

        MOV     R2,R2,ASL #16
        MOV     R2,R2,LSR #16

        LDR     r1,pre_filters
pre_filter_exit
        CMP     r1,#0
        Pull    "r1-r2,PC",EQ          ; End of list.
        LDR     r14,[r1,#next_ptr]
        Push    "r14"

        LDR     r14,[r1,#f_task]
        TEQ     r14,R2
        CMPNE   r14,#0
        Pull    "r1",NE
        BNE     pre_filter_exit        ; Filter not interested.

        LDR     r12,[r1,#f_R12]        ; Set R12.

        MOV     LR,PC
        LDR     PC, [r1,#f_address]
        NOP
        Pull    "r1"
        B       pre_filter_exit

        LNK     s.RectFilter


