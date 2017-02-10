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
; > s.Tail

; ----------------------------------------------------------------------------------------------------------------------
;       Release linked lists of filters. Note - may be in USER mode or SVC mode - can't use USER stack,
;       though, as it may not be okay. Hence not allowed to use the stack at all.
;    R2 -> pointer to start of list to kill (pre_filters or post_filters)
;        DANGER - CORRUPTS R0-R3
free_list
        MOV     R3, LR
        LDR     r1, [r2,#next_ptr]
        MOV     r0, #0
        STR     r0, [r2,#next_ptr]
; Get next file in the list
01
        MOV     r0, #ModHandReason_Free
        SUBS    r2, r1, #0
        MOVLE   PC, R3
; Free the workspace
        LDR     r1, [r2,#next_ptr]
        SWI     XOS_Module
        B       %BT01
; ----------------------------------------------------------------------------

      [ standalone
declareresourcefsfiles
        FunctionEntry "r0"

        ADR     R0,resourcefsfiles
        SWI     XResourceFS_RegisterFiles   ; ignore errors

        Return  "r0"

resourcefsfiles
	ResourceFile	$MergedMsgs, Resources.FilterMgr.Messages
	DCD	0
      ]

; ----------------------------------------------------------------------------------------------------------------------
; Neil's debugging routines

      [ debug
        InsertNDRDebugRoutines
      ]

        END
