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
;> Sources.Tables

; Note that the binary numbers in the flag tables have to be read backwards.
; The table below should help in this:

                ; 10987654321098765432109876543210
                ; ?>=<;:9876543210/.-,+*)('&%$#"!
                ; _^]\[ZYXWVUTSRQPONMLKJIHGFEDCBA@
                ;  ~}|{zyxwvutsrqponmlkjihffedcba`
                ; Ÿžœ›š™˜—–•”“’‘ŽŒ‹Š‰ˆ‡†…„ƒ‚€
                ; ¿¾½¼»º¹¸·¶µ´³²±°¯®­¬«ª©¨§¦¥¤£¢¡ 
                ; ßÞÝÛÛÚÙØ×ÖÕÔÓÒÑÐÏÎÍÌËÊÉÈÇÆÅÄÃÂÁÀ
                ; ÿþýüûúùø÷öõôóòñðïîíìëêéèçæåäãâáà

        LTORG

; This table is almost certainly invariant between territories.

ControlTable
        DCD     2_11111111111111111111111111111111 ; [00]
        DCD     2_00000000000000000000000000000000 ; SP
        DCD     2_00000000000000000000000000000000 ; @
        DCD     2_10000000000000000000000000000000 ; `
        DCD     2_00000000000000000000000000000000 ; €
        DCD     2_00000000000000000000000000000000 ; NBSP
        DCD     2_00000000000000000000000000000000 ; À
        DCD     2_00000000000000000000000000000000 ; à

        DoUppercaseTable
        DoLowercaseTable
        DoAlphaTable
        DoPunctuationTable
        DoSpaceTable

; Two more probably invariant tables

DigitTable
        DCD     2_00000000000000000000000000000000 ; [00]
        DCD     2_00000011111111110000000000000000 ; SP
        DCD     2_00000000000000000000000000000000 ; @
        DCD     2_00000000000000000000000000000000 ; `
        DCD     2_00000000000000000000000000000000 ; €
        DCD     2_00000000000000000000000000000000 ; NBSP
        DCD     2_00000000000000000000000000000000 ; À
        DCD     2_00000000000000000000000000000000 ; à
XDigitTable
        DCD     2_00000000000000000000000000000000 ; [00]
        DCD     2_00000011111111110000000000000000 ; SP
        DCD     2_00000000000000000000000001111110 ; @
        DCD     2_00000000000000000000000001111110 ; `
        DCD     2_00000000000000000000000000000000 ; €
        DCD     2_00000000000000000000000000000000 ; NBSP
        DCD     2_00000000000000000000000000000000 ; À
        DCD     2_00000000000000000000000000000000 ; à

        DoAccentedTable
        DoForwardFlowTable
        DoBackwardFlowTable

        DoToLowerTable
        DoToUpperTable
        DoToControlTable
        DoToPlainTable
        DoToValueTable
        DoToRepresentationTable

        DoSortValueTable

        LNK     DateTime.s
