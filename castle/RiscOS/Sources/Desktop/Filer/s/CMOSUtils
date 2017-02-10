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
; In    r2 = new options
;       r3 = bit mask to write under

WriteCMOSBits Entry "r0-r3"

 [ debugmenu
 DREG r2,"setting bits ",cc,Byte
 DREG r3," under mask ",,Byte
 ]
        AND     r0, r2, r3              ; Clear out bits we'll not alter

        BL      ReadCMOSBits
        LDRVC   r14, [sp, #4*3]         ; r3in
        BICVC   r3, r3, r14             ; Clear out bits we'll alter

        ORRVC   r2, r3, r0              ; Merge bits
 [ debugmenu
 DREG r2,"writing cmos state ",,Byte
 ]
        MOVVC   r0, #162
        MOVVC   r1, #DesktopCMOS
        SWIVC   XOS_Byte
        STRVS   R0,[sp]
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Out   r3 = current CMOS state

ReadCMOSBits Entry "r0-r2"

        MOV     r0, #161                ; Read current state
        MOV     r1, #DesktopCMOS
        SWI     XOS_Byte
        MOV     r3, r2
 [ debugmenu
 DREG r3,"current cmos state is ",,Byte
 ]
        STRVS   R0,[SP]
        EXIT
        END
