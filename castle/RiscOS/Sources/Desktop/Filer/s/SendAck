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
; Turn message around and return to sender, not recorded

; In    r0 = message action
;       r1 -> block (size already filled in)

SendAck Entry "r2"

        STR     r0, [r1, #ms_action]

        LDR     r14, [r1, #ms_myref]
        STR     r14, [r1, #ms_yourref]

        MOV     r0, #User_Message
        LDR     r2, [r1, #ms_taskhandle]
 [ debugtask
 DREG r2, "Sending an acknowledge to thandle "
 LDR r14, [r1, #ms_action]
 DREG r14, "Action "
 ]
        SWI     XWimp_SendMessage
 [ debugtask
 BVC %FT00
 ADD r14, r0, #4
 DSTRING r14, "***Error from SendMessage: "
00
 ]
        EXIT

        END
