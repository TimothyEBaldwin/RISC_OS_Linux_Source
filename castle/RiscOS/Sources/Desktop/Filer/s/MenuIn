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
;
; event_menu_select
; =================

; In    r1 -> wimp_eventstr (list of selections)

; Out   all regs may be corrupted - going back to PollWimp

event_menu_select Entry

        ADR     r1, mousedata           ; Need buttonstate for menu select
        SWI     XWimp_GetPointerInfo    ; Won't error

        BL      DecodeMenu
        EXIT    VS

        LDRB    r14, menu_reopen
        TEQ     r14, #0
        LDRNE   r14, buttonstate        ; Trying to hold menu open ?
        TSTNE   r14, #button_right
        BEQ     %FT90

        BL      RecreateMenu
        EXIT


; In the case of a menu_select, Neil has left the menu tree in a pending
; death state, so will disappear on PollWimp

90      BL      NobbleMenuSelection     ; Remove context sensitive selection
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

RecreateMenu Entry "r4"

 [ version >= 116
 |
        BL      RedrawIfModified        ; Another quick perusal; may have
        EXIT    VS                      ; modified dir contents on which menu
                                        ; encoding is based
 ]

        LDR     r4, sel_dir             ; May get moved by recache

        LDR     r14, menu_relmousex
        STR     r14, relmousex
        LDR     r14, menu_relmousey
        STR     r14, relmousey

        BL      EncodeAndCreateMenu     ; Recreate same menu (keep it open)
        EXIT                            ; with active point where we originally
                                        ; clicked

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Out   V accumulated, r0 preserved if we're not causing error

NobbleMenuTree EntryS "r0, r1"

        MOV     r1, #-1
        SWI     XWimp_CreateMenu
        EXITS   VC

        STR     r0, [sp, #Proc_RegOffset]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Remove context sensitive selection

; Out   V accumulated, r0 preserved if we're not causing error

NobbleMenuSelection EntryS "r0, r2"

        LDRB    r14, menu_causedselection
        TEQ     r14, #0
        MOVNE   r14, #0
        STRNEB  r14, menu_causedselection

        MOVNE   r2, #Nowt               ; find it anywhere
        BLNE    ClearAllSelections      ; ie. this one
        EXITS   VC                      ; Accumulate V

        STR     r0, [sp, #Proc_RegOffset]
        EXIT

        END
