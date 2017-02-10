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
;                      Filer application entry point
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r0 -> error
;       r1 = state for ReportError (Ok and Cancel buttons)

; Out   r1 = button clicked, VClear always

ReportError Entry "r0, r2"

        LDRB    r14, hourglassstate
        TEQ     r14, #1
        SWIEQ   XHourglass_Off          ; Turn off hourglass for a while
                                        ; Ignore errors, may not be there
        BL      GetTaskName
      [ debug
        ADD     r0,r0,#4
        DSTRING r0,"reporting error: "
        SUB     r0,r0,#4
      ]
        SWI     XWimp_ReportError
        BVS     Abort

        LDRB    r14, hourglassstate     ; Back on again please
        TEQ     r14, #1
        SWIEQ   XHourglass_On

        CLRV                            ; Ignore errors, may not be there
        EXIT

        [ {FALSE}
GetTaskName     Entry "r0,r1,r3"        ; returns r2->task title
        LDR     r0, msgtrans_blockptr
        TEQ     r0, #0
        ADREQL  r2, Filer_TitleString
        EXIT    EQ
        ADR     r1, Filer_TaskToken
        ADR     r2, userdata+userdata_size-&80
        MOV     r3, #&80
        SWI     XMessageTrans_Lookup
        ADRVSL  r2, Filer_TitleString
        CLRV
        EXIT
        |
GetTaskName     Entry "R0"
        LDR     R0,mytaskhandle
        SWI     XTaskManager_TaskNameFromHandle
        MOVVC   R2,R0
        ADRVSL  r2, Filer_TitleString
        CLRV
        EXIT
        ]

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r0 -> error

; Out   VClear always

LocalReportError Entry "r1"

        MOV     r1, #ok_button
        BL      ReportError
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ErrorCloseTemplate

        Push    r0
        SWI     XWimp_CloseTemplate
        Pull    r0

; .............................................................................

ErrorAbort

        MOV     r1, #cancel_button
        BL      ReportError

; .............................................................................

 [ version >= 113
Abort   BL      ShrinkWorkspace
 |
Abort   BL      FreeWorkspace
 ]
        MOV     r14, #-1                ; We are dead
        STR     r14, [r12]
        SWI     OS_Exit

UseDesktopError
        ADR     r0, ErrorBlock_Global_UseDesktop
        ADRL    r4, Filer_TitleString

LookupError
        LDR     r1, msgtrans_blockptr
        MOV     r2, #0
        MOV     r8, lr
        SWI     XMessageTrans_ErrorLookup
        MOV     pc, r8

        LTORG

ErrorBlock_Global_UseDesktop
        DCD     0
        DCB     "UseDesk", 0

Filer_TaskToken
        DCB     "TskName", 0
        ALIGN

; .............................................................................
;
; Error environment handlers
;
; In    r0 -> workspace
; Out   No return, re-enter poll loop

Error_Handler
        MOV     wp, r0

        wsaddr  sp, stacktop

        ADRL    r0, userdata + 4	; Skip error PC
        ADRL    lr, repollwimp
        B       LocalReportError

        END
