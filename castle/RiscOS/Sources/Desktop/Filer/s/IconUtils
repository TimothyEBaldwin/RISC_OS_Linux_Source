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
; InitialiseIconAreas
;
; Grabs memory for the two indirected icons - the writable icon used for
; renaming and the indirected icon used for viewer redraws.
;
; In:  Nothing
;
; Out: All registers preserved.

InitialiseIconAreas Entry "r0-r3"

        ; Get memory for dirnamebuffer
        MOV     r0, #6
        MOV     r3, #dirnamebuffer_size
        SWI     XOS_Module
        EXIT    VS
        STR     r2, dirnamebuffer

        ; Get memory for Alt+Click renaming
        MOV     r0, #6
        MOV     r3, #re_chunksize
        SWI     XOS_Module                     ; Get the memory
        EXIT    VS
        STR     r2, renaming_chunkaddr         ; r2 -> memory chunk
        MOV     r14, #0
        STR     r14, [r2, #re_windowhandle]    ; set renaming window handle to 0
        STR     r14, [r2, #re_iconhandle]      ; set renaming icon handle to 0

        ; Get memory for indirected icon
        MOV     r0, #6
        MOV     r3, #i_textbuffer_size
        SWI     XOS_Module
        EXIT    VS
        STR     r2, i_textbuffer_ptr
        EXIT


; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r3 = window handle
;       r2 = icon handle
;       EQ/NE -> is_inverted or 0

EncodeAccess Entry "r4,r5"
        MOVEQ   r4, #0                          ; EOR value
        MOVNE   r4, #is_inverted
        MOV     r5, #is_inverted                ; BIC value
        BL      SetIconState
        EXIT


; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r3 = window handle
;       r2 = icon handle
;       r4 = EOR value
;       r5 = BIC value

SetIconState    Entry "r1"
        Push    "r2,r4,r5"
        Push    "r3"
        MOV     r1, sp
        SWI     XWimp_SetIconState
        ADD     sp, sp, #4*4
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r3 = window handle
;       r2 = icon handle

; Out   r2 = icon flags, EQ/NE set on is_inverted
; [ version >= 117
; |
;  [ version >= 113
;       r1 = 0/1/2 if 2nd char of verification string is n, o, or something else
;       r0 -> verification string
;  ]
; ]

GetIconState Entry "r3", 4*2 + i_size

        STR     r3, [sp, #0]
        STR     r2, [sp, #4]
        MOV     r1, sp
        SWI     XWimp_GetIconState

        EXIT    VS

 [ version >= 117
 |
  [ version >= 113
        ; Generate 0, 1 or 2 for n, o or something else
        LDR     r0, [sp, #4*2 + i_data + 4*1]           ; pointer to verification string
        LDRB    r2, [r0, #1]                            ; 2nd char of verification string
        MOV     r1, #0
        TEQ     r2, #"n"
        ADDNE   r1, r1, #1
        TEQNE   r2, #"o"
        ADDNE   r1, r1, #1
  ]
 ]

        LDR     r2, [sp, #4*2+i_flags]
 [ debug
 DREG r2, "icon flags = "
 ]
        TST     r2, #is_inverted
        EXIT
        END
