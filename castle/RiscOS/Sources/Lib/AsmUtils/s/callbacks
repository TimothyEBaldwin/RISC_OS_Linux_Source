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
; Title:   s.callbacks
; Purpose: 'Usermode do-nothing' function to enable callbacks to fire
;

; Enclosed is the source to the function usermode_donothing.  This drops you
; into user mode, does an OS_LeaveOS (or OS_Byte 0,1 if that SWI is absent)
; and then returns to supervisor mode.
; On returns from the SWI called in user mode, callbacks are collected.

; Pre-condition: processor is in SVC26 or SVC32 mode
; Post-condition: processor is in same mode as on entry

        AREA    |asmutils$callback$$Code|,CODE,READONLY,PIC

        GET     hdr:ListOpts
        GET     hdr:Macros
        GET     hdr:System
        GET     hdr:Machine.<Machine>
        GET     hdr:APCS.<APCS>

; This function is currently known under many different names.
; Until they all synchronise (on usermode_donothing), export the
; aliases too.
        [ :LNOT: :DEF: DefineAliases
        GBLL    DefineAliases
DefineAliases SETL {TRUE}
        ]

        EXPORT  usermode_donothing
        [ DefineAliases
        EXPORT  CollectCallbacks
        EXPORT  user_mode_donothing
        ]

        [ No32bitCode :LAND: No26bitCode
        ! 1, "This code cannot be used in No26bitCode and No32bitCode!"
        ]

; extern void usermode_donothing(void);
        [ DefineAliases
CollectCallbacks
user_mode_donothing
        ]
usermode_donothing
        Push    "lr"
    [ :LNOT: (No32bitCode :LOR: No26bitCode)
        ; 32 or 26 bit selected at run time
        ; The 26 bit case preserves flags, so works with APCS-R (and APCS-32)
        TEQ     pc, pc
        TEQNEP  pc, #0                  ; Set USR mode, IRQs and FIQs enabled
        MRSEQ   r3, CPSR                ; Get current PSR
        BICEQ   r3, r3, #I32_bit :OR: F32_bit :OR: 2_1111
        MSREQ   CPSR_c, r3              ; Set USR26/USR32 mode, IRQs and FIQs enabled
    |
      [ :LNOT: No26bitCode
        TEQP    pc, #0                  ; Set USR mode, IRQs and FIQs enabled
      ]
      [ :LNOT: No32bitCode
        MRS     r3, CPSR                ; Get current PSR
        BIC     r3, r3, #I32_bit :OR: F32_bit :OR: 2_1111
        MSR     CPSR_c, r3              ; Set USR26/USR32 mode, IRQs and FIQs enabled
      ]
    ]
        SWI     XOS_LeaveOS             ; SWI call from USR mode with interrupts enabled triggers callbacks
        MOVVS   r0, #0
        MOVVS   r1, #1
        SWIVS   XOS_Byte                ; No 'OS_LeaveOS', do this instead (slower)
        SWI     XOS_EnterOS             ; Re-enter SVC26/SVC32 mode
    [ :LNOT: (No32bitCode :LOR: No26bitCode)
        ; 32 or 26 bit selected at run time
        ; The 26 bit case preserves flags, so works with APCS-R (and APCS-32)
        TEQ     pc, pc
        Pull    "pc",NE,^
        Pull    "pc"
    |
      [ :LNOT: No26bitCode
        Pull    "pc",,^
      ]
      [ :LNOT: No32bitCode
        Pull    "pc"
      ]
    ]

        END
