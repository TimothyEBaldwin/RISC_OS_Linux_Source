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
; EncodeMenu
; ==========
;
; Clear ticks and ensure no items greyed out of menu

; In    r1 -> menu

EncodeMenu Entry "r0, r1"

        ADD     r1, r1, #m_headersize   ; skip menu header

01      LDR     r0, [r1, #mi_itemflags]
 [ debugmenu
 DREG r1,"Clearing grey/ticks from "
 ]
        BIC     r0, r0, #mi_it_tick     ; ensure all unticked to start with
        STR     r0, [r1, #mi_itemflags]

        LDR     r14, [r1, #mi_iconflags]!
        BIC     r14, r14, #is_shaded    ; ensure none greyed out
        STR     r14, [r1], #(mi_size - mi_iconflags)

        TST     r0, #mi_it_lastitem     ; last item in menu?
        BEQ     %BT01                   ; [no]

        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r1 -> menu
;       r2 = item to tick

; Out   item marked as ticked, flags preserved

TickMenu Entry "r1, r2"

        ADD     r1, r1, #m_headersize + mi_itemflags ; skip menu header
                                        ; and item fields before itemflags
 ASSERT mi_size = 24
        ADD     r2, r2, r2, LSL #1      ; *3
        LDR     r14, [r1, r2, LSL #3]   ; *24
        ORR     r14, r14, #mi_it_tick   ; 'tick' corresponding entry
        STR     r14, [r1, r2, LSL #3]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r1 -> menu
;       r2 = item to shade

; Out   item marked as shaded, flags preserved

ShadeMenu Entry "r1, r2"

        ADD     r1, r1, #m_headersize + mi_iconflags ; skip menu header
                                        ; and fields before iconflags
 ASSERT mi_size = 24
        ADD     r2, r2, r2, LSL #1      ; *3
        LDR     r14, [r1, r2, LSL #3]   ; *24
        ORR     r14, r14, #is_shaded    ; 'shade' corresponding entry
        STR     r14, [r1, r2, LSL #3]
        EXIT

 [ version >= 117
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r1 -> menu

; Out   All items in menu shaded

ShadeWholeMenu EntryS "r2,r3"
        ADD     r3, r1, #m_headersize + mi_itemflags
        MOV     r2, #0
10      ; Start of loop through menu
        BL      ShadeMenu
        ADD     r2, r2, #1
        LDR     r14, [r3], #mi_size
        TST     r14, #mi_it_lastitem
        BEQ     %BT10
        EXITS
 ]

        END
