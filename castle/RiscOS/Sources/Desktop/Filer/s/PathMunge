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
; In    r1 -> full pathname

; Out   r2 -> leafname

FindLeafname Entry "r3"

        MOV     r2, r1                  ; paranoia, but it won't fall over!
        MOV     r3, r1

10      LDRB    r14, [r3], #1
        CMP     r14, #space
        EXIT    LO                      ; r2 -> leafname
        CMP     r14, #"."
        CMPNE   r14, #":"
        MOVEQ   r2, r3                  ; r2 -> latest bit we've found
 [ debug
 BNE %BT10
 DSTRING r2, "remaining "
 ]
        B       %BT10

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r1 -> dirname

; Out   NE: r1 -> dirname after stripping a leafname
;       EQ: no leafname stripped

ExtractDirprefix Entry "r3"

        BL      strlen
        BL      TryLeafStrip

        MOVNE   r14, #0                 ; terminate dirprefix
        STRNEB  r14, [r1, r3]           ; kill final '.' char
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r1 -> dirname
;       r3 = span to consider

; Out   NE: r3 = new span (+r1 -> where to bonk name)
;       EQ: no leafname strippable, r3 unchanged

TryLeafStrip Entry "r1, r3"

 [ debug
 DSTRING r1, "Try to strip leaf from ",cc
 DREG r3, ", span length ",,Integer
 ]
        ADD     r3, r1, r3              ; r3 -> past end of span

10      CMP     r1, r3                  ; Ended ?
        LDRNEB  r14, [r3, #-1]!         ; Skip back till we find a dot
        CMPNE   r14, #":"               ; Skipped back to a colon ?
        EXIT    EQ                      ; EQ -> no leafname strippable
        CMP     r14, #"."               ; Back to a dot ?
        BNE     %BT10

        LDRB    r14, [r3, #1]           ; What was char after the dot ?
        TEQ     r14, #"$"               ; Can go no further back if rooty
        TEQNE   r14, #"&"               ; eg. adfs::discname.$
        TEQNE   r14, #"%"
        SUBNE   r3, r3, r1              ; Back to a length (offset of dot)
        STRNE   r3, [sp, #4*1]
 [ debug
 EXIT EQ
 DREG r3, "new span is ",,Integer
 ]
        EXIT                            ; EQ -> no leafname strippable

        END
