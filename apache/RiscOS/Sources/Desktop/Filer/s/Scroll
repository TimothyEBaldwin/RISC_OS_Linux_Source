; Use scroll requests to make mouse wheel scrolling work.
; Author: Colin Granville

;event_scroll_request
;====================

; In    r1 -> wimp_eventstr
;             [r1, #0]  window handle
;             [r1, #4]  minimum work area x coordinate
;             [r1, #8]                    y
;             [r1, #12] maximum word area x coordinate
;             [r1, #16]                   y
;             [r1, #20] scroll x offset relative to work area origin
;             [r1, #24]        y
;             [r1, #28] window handle to open behind
;             [r1, #32] scroll x direction
;             [r1, #36]        y

; Out   all regs may be corrupted - going back to PollWimp


event_scroll_request Entry
        
; scroll x
        LDR r0,[r1,#32]
        CMP r0,#0 ; no x scroll
        BEQ %FT10
        LDR r2,[r1, #20] ; x scroll offset
        LDR r3,[r1, #12]
        LDR r4,[r1, #4]
        SUB r3,r3,r4 ; visible width

        CMN r0,#2 ; page left
        SUBEQ r2,r2,r3
        CMN r0,#1 ; left
        SUBEQ r2,r2,#32
        CMP r0,#1 ; right
        ADDEQ r2,r2,#32
        CMP r0,#2 ; page right
        ADDEQ r2,r2,r3

        STR r2,[r1, #20]

10
; scroll y
        LDR r0,[r1,#36]
        CMP r0,#0 ; no y scroll
        BEQ %FT20
        LDR r2,[r1, #24] ; y scroll offset
        LDR r3,[r1, #16]
        LDR r4,[r1, #8]
        SUB r3,r3,r4 ; visible height

        CMN r0,#2 ; page down
        SUBEQ r2,r2,r3
        CMN r0,#1 ; down
        SUBEQ r2,r2,#32
        CMP r0,#1 ; up
        ADDEQ r2,r2,#32
        CMP r0,#2 ; page up
        ADDEQ r2,r2,r3

        STR r2,[r1, #24]

20
        SWI     XWimp_OpenWindow

        EXIT

        END
