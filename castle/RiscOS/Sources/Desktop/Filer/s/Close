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
; event_close_window
; ==================

; In    r1 -> wimp_eventstr
;       [r1, #0]  window handle

; Out   all regs may be corrupted - going back to PollWimp

event_close_window Entry "r1"

        ADR     r1, mousedata           ; Need buttonstate for close
        SWI     XWimp_GetPointerInfo    ; Won't error

        LDR     r1, [sp]
        LDR     r0, [r1, #u_handle]

        BL      close_window_common
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r0 = handle of window to close

close_window_r0 Entry "r0, r1"

        MOV     r14, #button_left       ; fake buttonstate
        STR     r14, buttonstate

        BL      close_window_common

        STRVS   r0, [sp]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r0 = handle of window to close

close_window_common Entry "r0, r1"

 [ debug
 DREG r0, "close_window: window ",,Integer
 ]
        BL      FindDir
        BNE     %FT90                   ; [not a dirviewer]

        [ AltRenaming
        BL      remove_rename_writeable
        ]

; Asked to close a dirviewer

        LDR     r14, buttonstate
 [ debugredraw
 DREG r14, "buttonstate for close: "
 ]
        TST     r14, #button_left
        BNE     %FT50                   ; [closed with SELect]

; Closed with EXTend -> open parent dirviewer

 [ version < 139
        LDR     r14, [r4, #d_filesystem] ; Remember for OpenDir
        STR     r14, setplusfilesystem
 ]

        LDR     r1, [r4, #d_dirnamestore] ; Hide this dirname away
        ADR     r0, TempString          ; as we will be deallocating it shortly
        BL      SGetString
        BVS     %FT99

        LDR     r0, [sp]                ; Get handle back
        BL      GetWindowCoords         ; r3,r4 := abscoords of window top left
        BVS     %FT99
 [ shfextclose
        MOV     r0, #&81                ; Find the shift state
        MOV     r1, #&FF
        MOV     r2, #&FF
        SWI     XOS_Byte
        TEQ     r1, #&FF
        BNE     %FT50                   ; Shift not pressed
        LDR     r14, dvoffsetx          ; Shift pressed, set up for open
        SUB     r3, r3, r14             ; parent at an offset
        LDR     r14, dvoffsety
        SUB     r4, r4, r14
        B       %FT60
 ]
50      LDR     r0, [sp]                ; Get handle back
        BL      DeleteDir               ; Delete dirviewer
        BVS     %FT99

        LDR     r14, buttonstate
        TST     r14, #button_left
        EXIT    NE                      ; [closed with SELect; all done]

 [ debugredraw
 DLINE "close wants to open parent"
 ]
60      LDR     r1, TempString
        BL      ExtractDirprefix        ; Strip off a leafname
 [ openat
        MOVNE   r5, #0                  ; Open at default width
        MOVNE   r8, #0                  ; Open with default displaymode
 ]
        BLNE    OpenDir                 ; EQ -> no parent to open

99      STRVS   r0, [sp]
        EXIT


90 ; Not a dirviewer

        Push    r0
        MOV     r1, sp
        SWI     XWimp_CloseWindow
        ADD     sp, sp, #4
        EXIT

        END
