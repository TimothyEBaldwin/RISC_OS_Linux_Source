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


; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; IconizedReopen
;
; Reopen an iconized window
;
; In : r1 = window
;      r2 = icon

IconizedReopen  ROUT
        MOV     r6,r2
        BL      find_iconized
        BL      reopen_window

        ;LDR     r0, Window_Icons
        ;SUB     r0, r0, #1
        ;STR     r0, Window_Icons
        ;LDR     r0, Windows_Selected
        ;SUB     r0, r0, #1
        ;STR     r0, Windows_Selected

        Pull    "PC"

IconizedClose
        MOV     r6,r2
        BL      find_iconized
        BL      delete_window
        Pull    "PC"

; ----------------------------------------------------------------------------------------------------------------------
; Find iconized.
;         r6 = Icon number.
; On Exit:
;         r7 - Pointer to block or 0 if not found.
;
find_iconized
        Push    "LR"


        LDR     r7,iconized_ptr
01      CMP     r7,#0
        Pull    "PC",EQ
        LDR     r14,[r7,#w_icon_handle]
        CMP     r14,r6
        LDRNE   r7,[r7,#w_next_ptr]
        BNE     %BT01

        Pull    "PC"

; Find iconized icon by window handle.
;         r5 = Window handle.
; On Exit:
;         r7 - Pointer to block or 0 if not found.
;
find_window
        Push    "LR"

        LDR     r7,iconized_ptr
01      CMP     r7,#0
        Pull    "PC",EQ
        LDR     r14,[r7,#w_window_handle]
        CMP     r14,r5
        LDRNE   r7,[r7,#w_next_ptr]
        BNE     %BT01

        Pull    "PC"
; ----------------------------------------------------------------------------------------------------------------------
; Find iconized icon by task handle.
;         r5 = Task handle.
; On Exit:
;         r7 - Pointer to block or 0 if not found.
;
find_task
        Push    "LR"

        LDR     r7,iconized_ptr
01      CMP     r7,#0
        Pull    "PC",EQ
        LDR     r14,[r7,#w_task]
        CMP     r14,r5
        LDRNE   r7,[r7,#w_next_ptr]
        BNE     %BT01

        Pull    "PC"

; ----------------------------------------------------------------------------------------------------------------------
; pre quit - reopen all iconized windows.
;            delete backdrop sprite.
ReopenWindows

        Push     "LR"

01      LDR      r7,iconized_ptr
        CMP      r7,#0
        BEQ      %FT02
        BL       reopen_window   ; Shifts the list for us.
        B        %BT01
02

        Pull    "PC"


; ----------------------------------------------------------------------------------------------------------------------
; Delete an icon, don't reopen windo.
;
delete_window
        Push    "LR"

        [ {FALSE}
        ADR      r1,dataarea
        ADD      r0,r7,#w_window_handle
        LDMIA    r0,{r2,r3,r4,r5,r6,r8,r9,r10}
        MOV      r10,#-1
        STMIA    r1,{r2,r3,r4,r5,r6,r8,r9,r10}

        MOV      r0,#3
        LDR      r2,[r7,#w_task]
        Debug    ic,"Task is ",r2
        SWI      XWimp_SendMessage
        ]
        B       delete_window_entry

reopen_window
        Push    "LR"

; ----------------------------------------------------------------------------------------------------------------------
; Click on iconized window.

iconized_click
; Reopen the window

        ADR      r1,dataarea
        ADD      r0,r7,#w_window_handle
        LDMIA    r0,{r2,r3,r4,r5,r6,r8,r9,r10}
        MOV      r10,#-1
        STMIA    r1,{r2,r3,r4,r5,r6,r8,r9,r10}
 
        MOV      r0,#2
        LDR      r2,[r7,#w_task]
        Debug    ic,"Task is ",r2
        SWI      XWimp_SendMessage

; Entry point to delete the icon.
delete_window_entry                     ; Must preserve r5 from here down.


; Now delete the icon

        ADRL    r1, dataarea+100        ; If this is a result of an Iconize message we must not

        LDR     r0, [r7, #w_icon_id]

        STR     r0, [r1]
        LDR     r2, [r7,#w_icon_handle]
        STR     r2, [r1,#4]
        SWI     XWimp_GetIconState
        Pull    "pc",VS

        LDR     r3, [r1, #24]           ; Load icon flags into r3

        LDR     r4, [r1]                ; r4 is window handle of icon

        ; If on iconbar, subtract one from Iconbar_Icons
        CMP     r4, #-2
        LDREQ   r4, Iconbar_Icons
        SUBEQ   r4, r4, #1
        STREQ   r4, Iconbar_Icons
        BEQ     %FT03

        ; If not on the iconbar, then check if selected and update Windows_Selected
        LDR     r4, Windows_Selected
        TST     r3, #is_selected        ; Selected?
        SUBNE   r4, r4, #1
        STR     r4, Windows_Selected

        ; subtract one from number of window icons on pinboard
03      LDR     r4, Window_Icons
        SUB     r4, r4, #1
        STR     r4, Window_Icons

        ; Delete the icon
        SWIVC   XWimp_DeleteIcon

        LDR     r0, [r7, #w_icon_id]

        ADD     r1,r1,#8
        LDMIA   r1,{r1-r4}
        SWI     XWimp_ForceRedraw
        Pull    "pc",VS

; Remove it from the list.

        LDR     r0,[r7,#w_prev_ptr]
        LDR     r1,[r7,#w_next_ptr]
        Debug   ic,"prev ptr is",r0
        CMP     r0,#0
        STREQ   r1,iconized_ptr
        STRNE   r1,[r0,#w_next_ptr]

        CMP     r1,#0
        STRNE   r0,[r1,#w_prev_ptr]

; And free memory.

        MOV     r0, #ModHandReason_Free
        MOV     r2, r7
        SWI     XOS_Module

        Pull    "PC"

        LNK     Save.s
