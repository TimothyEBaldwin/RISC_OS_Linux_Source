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
 [ actionwind
        LTORG
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Action Window Handling
; ======================
; -----------------------------------------------------------------------------
;
; StartActionWindow
;
; Entry -
;[ version >= 113
; r0    Minimum memory to attempt to start task with
;]
; Exit
; r0    Task handle or 0 if dead at birth
;

ActionWindowCommand     DCB "*"
ActionWindowModuleName  DCB "Filer_Action",0
        ALIGN

StartActionWindow Entry "r1-r6"
      [ version >= 113

        ; Check the memory is enough to do the operation
        MOV     r6, r0
        MOV     r0, #-1
        MOV     r1, #-1
        SWI     XWimp_SlotSize
        EXIT    VS
        CMP     r2, r6
        MOVLT   r0, #0
        EXIT    LT

        ; Check the Filer_Action module is present
        MOV     r0, #ModHandReason_LookupName
        ADR     r1, ActionWindowModuleName
        SWI     XOS_Module
        BVC     %FT10
        LDR     r1, [r0, #0]    ; error number
        LDR     r2, =ErrorNumber_RMNotFound
        TEQ     r1, r2
        MOVEQ   r0, #0          ; Emulate dead task if module not found
        CLRV    EQ
        EXIT
10
      ]

        ADR     r0, ActionWindowCommand
        SWI     XWimp_StartTask
        EXIT

      [ :LNOT: OptionsAreInRAM
ExtractCMOSOptions Entry "r3"
        BL      ReadCMOSBits
        MOV     r2, #0
        TST     r3, #confirm_cmos_bit
        ORRNE   r2, r2, #Action_OptionConfirm
        TST     r3, #verbose_cmos_bit
        ORRNE   r2, r2, #Action_OptionVerbose
        TST     r3, #force_cmos_bit
        ORRNE   r2, r2, #Action_OptionForce
        TST     r3, #newer_cmos_bit
        ORRNE   r2, r2, #Action_OptionNewer
        EXIT
      ]
      
SendSelectedFiles Entry "r1-r5"
10      CMP     r5, #Nowt
        EXIT    EQ
        LDR     r1, sel_leafname
        SWI     XFilerAction_SendSelectedFile
        EXIT    VS
        BL      GetSelection
        B       %BT10


; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; SendWasSelectedFiles

SendWasSelectedFiles Entry "r1-r5"
10      CMP     r5, #Nowt
        EXIT    EQ
        LDR     r1, sel_leafname
        SWI     XFilerAction_SendSelectedFile
        EXIT    VS
        BL      GetWasSelection
        B       %BT10


       LTORG
 ]


        END
