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
; In    r0 = window handle

; Out   window opened at front
;       much register corruption

front Entry

 [ debug
 DREG r0, "front: window handle ",,Integer
 ]
        ADR     r1, userdata            ; event_open_window expects userdata
        STR     r0, [r1]
        SWI     XWimp_GetWindowState

        MOVVC   r14, #-1                ; Open it at top of stack
        STRVC   r14, [r1, #u_bhandle]
        Push    "r1"
        BLVC    event_open_window       ; check for size changing
        Pull    "r1"
        LDRVC   r0, [r1]
        BLVC    AssignFocus
 [ debug
 DLINE "leaving front"
 ]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r4 -> dirviewer

; Out   window redrawn at current position in window stack
;       much register corruption

ForceReopen Entry

 [ centralwrap
        MOV     r14, #db_fpr_invalid    ; Ensure it gets fully redrawn/resized
 |
        MOV     r14, #0                 ; Ensure it gets fully redrawn/resized
 ]
        STRB    r14, [r4, #d_filesperrow]

        LDR     r0, [r4, #d_handle]
 [ debug
 DREG r0, "ForceReopen: window handle ",,Integer
 ]
        ADR     r1, userdata            ; event_open_window expects userdata
        STR     r0, [r1]
        SWI     XWimp_GetWindowState

        BLVC    event_open_window
 [ debug
 DLINE "leaving front"
 ]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r0 = window handle

; Out   r3, r4 = abs. coords of top left of window, NOT work area

GetWindowCoords Entry "r0, r1"

 [ debug
 DREG r0,"GetWindowCoords ",,Integer
 ]
        STR     r0, [sp, #-36]!         ; Make frame on stack
        MOV     r1, sp
        SWI     XWimp_GetWindowState
        LDRVC   r3, [r1, #u_wax0]
        LDRVC   r4, [r1, #u_way1]
        ADD     sp, sp, #36             ; restore stack
        STRVS   r0, [sp]
 [ debug
 DREG r3,"top left of window = ",cc,Integer
 DREG r4,",",,Integer
 ]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r0 = window handle

; Out   x0, y1 = origin (top/left) of work area

 [ version >= 114
GetWorkAreaCoords Entry "r0, r1, y0, x1, scx, scy", 36
 |
GetWorkAreaCoords Entry "r0, r1, y0, x1, scx, scy"
 ]

 [ debug
 DREG r0,"GetWorkAreaCoords ",,Integer
 ]
 [ version >= 114
        MOV     r1, sp
 |
        ADR     r1, userdata
 ]
        STR     r0, [r1]
        SWI     XWimp_GetWindowState
 [ version >= 114
        MOV     r14, r1
 |
        ADRVC   r14, userdata
 ]
        LDMVCIB r14, {x0, y0, x1, y1, scx, scy} ; load starting at udata + 4
 [ False ; no need to adjust same register by 0
        SUBVC   x0, x0, #0              ; scx MUST be 0
 ]
        SUBVC   y1, y1, scy

 [ debug
 DREG x0, "work area origin x ",cc,Integer
 DREG y1, ", y ",,Integer
 ]
        STRVS   r0, [sp]
        EXIT                            ; x0, y1 = work area origin


        END
