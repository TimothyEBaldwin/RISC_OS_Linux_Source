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
; > s.copyFilter

;;----------------------------------------------------------------
;; copy_filter_handler
;;
;; This is called by the Wimp when copying a rectangle
;;
;; Entry:
;;
;;      R2-R5 - Destination bounding box.
;;	R6-R9 - Source bounding box.
;;      R10   - Window handle - 1
;;
;; Exit:
;;
;;      All other registers preserved.  (Except R12!)
;;
;;      All interested filters called.
;;
;;

copy_filter_handler

        Push    "r0-r2,r10,r11,LR"

	ADD	r0,r10,#1

        LDR     r1,copy_filters
copy_filter_exit
        CMP     r1,#0
      [ No26bitCode
        Pull    "r0-r2,r10,r11,PC",EQ    ; End of list
      |
        Pull    "r0-r2,r10,r11,PC",EQ,^  ; End of list
      ]
        LDR     r14,[r1,#next_ptr]
        Push    "r14"

        LDR     r12,[r1,#f_R12]        ; Set R12.

        MOV     LR,PC
        LDR     PC, [r1,#f_address]
        NOP
        Pull    "r1"
        B       copy_filter_exit
        LNK     s.PostFilter


