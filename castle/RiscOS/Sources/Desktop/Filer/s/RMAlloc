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
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;                   R M A   h e a p   m a n a g e m e n t
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; SFreeArea
; =========
;
; Free an old heap block. Accumulate V

; In    r2 -> block to free. If r2 = 0 or Nowt then don't try to free anything

; Out   VC: block freed
;       VS: fail

SFreeArea EntryS "r0"

 [ debugalloc
 DREG r2,"SFreeArea "
 ]
        CMP     r2, #0                  ; Must cope with 0 for non-existent
        CMPNE   r2, #Nowt               ; And Nowt -> nothing there. VC, NE

        MOVNE   r0, #ModHandReason_Free ; Try to free if block exists
        SWINE   XOS_Module
        EXITS   VC                      ; Accumulate V

        STR     r0, [sp, #Proc_RegOffset]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; SNewArea
; ========
;
; Free an old heap block and get a new one

; In    r0 -> address of pointer to block to free
;       r3 = size of block to get

; Out   VC: block freed and new one obtained; pointer to block updated
;       VS: fail

SNewArea Entry "r0, r2"

 [ debugalloc
 DREG r3,"SNewArea "
 ]
        LDR     r2, [r0]                ; Address of block to free
        BL      SFreeArea
        MOVVC   r0, #ModHandReason_Claim ; Get new block only if freed
        SWIVC   XOS_Module
        MOVVS   r2, #Nowt               ; Nowt pointer if either failed
        LDR     r14, [sp]
        STR     r2, [r14]               ; Update block address in any case
 [ debugalloc
 DREG r2,"Stored ",cc
 DREG r14," in variable "
 ]
        STRVS   r0, [sp]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; SGetString
; ==========
;
; Claim a new heap block for string var and stuff it in, freeing old contents

; In    r0 -> address of pointer to block
;       r1 -> string to copy; CtrlChar terminator

; Out   VC: ok, r1 -> copied string
;       VS: fail

SGetString Entry "r0, r2, r3"

        BL      strlen
        ADD     r3, r3, #1              ; +1 for terminator

 [ debugalloc
 DREG r0,"SGetString: var ",cc
 DREG r3,", size ",cc
 DSTRING r1,", string "
 ]
        BL      SNewArea                ; Get new block
        STRVS   r0, [sp]                ; Store error^
        EXIT    VS

        MOV     r2, r1
        LDR     r1, [r0]
 [ debugalloc
 DREG r2, "Copying string from ",cc
 DREG r1, " to new block "
 ]
        BL      strcpy
        EXIT

        END
