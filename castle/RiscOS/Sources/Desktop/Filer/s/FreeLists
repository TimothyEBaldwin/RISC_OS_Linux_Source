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
; FreeLists
; =========

FreeLists Entry "r0-r3"

05      LDR     r2, DirRequestList      ; Reload from head each time
        CMP     r2, #Nowt
        BEQ     %FT10

        LDR     r14, [r2, #dirreq_link]
        STR     r14, DirRequestList

        BL      SFreeArea               ; deallocate dir request block
        B       %BT05


10      ;
 [ opendir_request_order
        ADR     r14, DirRequestList
        STR     r14, DirRequestEndLink
 ]
        LDR     r2, ViewerList
        CMP     r2, #Nowt
 [ False
        BEQ     %FT20
 |
        EXIT    EQ
 ]

        LDR     r14, [r2, #d_link]
        STR     r14, ViewerList

        LDR     r3, [r2, #d_dirnamestore]
 [ debug
 DREG r2,"Freeing dirviewer ",cc
 DREG r14,", next^ ",cc
 DREG r3,", dirname "
 ]
        BL      SFreeArea               ; deallocate dirviewer

        MOV     r2, r3
        BL      SFreeArea               ; deallocate dirname
        B       %BT10

 [ False
20      LDR     r2, ApplicList
        CMP     r2, #Nowt
        EXIT

        LDR     r14, [r2, #a_link]
        STR     r14, ApplicList

 [ debug
 DREG r2,"Freeing application entry ",cc
 DREG r14,", next^ "
 ]
        BL      SFreeArea               ; deallocate application block
        B       %BT20
 ]

 [ version >= 113
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; JunkApplicationLists
;
; Frees the application lists
;
; Out r0-r4 corrupted
;

JunkApplicationLists ROUT ; NOENTRY as may not have a stack
        MOV     r4, lr          ; Store lr in r4 as lr may be svc_lr
        MOV     r0, #ModHandReason_Free

        ; First the Application list proper
        B       %FT20
10
        LDR     r1, [r2, #a_link]
        STR     r1, ApplicList
        SWI     XOS_Module
        MOVVS   pc, r4
20
        LDR     r2, ApplicList
        CMP     r2, #Nowt
        BNE     %BT10

        ; Next the application directory list
        B       %FT40
30
        LDR     r1, [r2, #ad_link]
        STR     r1, ApplicDirList
        SWI     XOS_Module
        MOVVS   pc, r4
40
        LDR     r2, ApplicDirList
        CMP     r2, #Nowt
        BNE     %BT30

        STR     r2, ApplicListEndPointer        ; Inserted by RM 16/9/91

        MOV     pc, r4
 ]

        END
