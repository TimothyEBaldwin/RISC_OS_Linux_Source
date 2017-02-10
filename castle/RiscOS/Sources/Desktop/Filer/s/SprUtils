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
; Out   VC: sprite exists
;       VS: sprite does not exist

ExistsSprite Entry "r0-r7"

 [ debugredraw
 DSTRING r2,"lookup sprite "
 ]

        LDR     R0,wimpsprname
        LDR     R1,wimplistat
        TEQ     R1,#0
        BNE     %FT15

        MOV     R0,#1
        SWI     XWimp_Extend
        STRVC   R0,wimpr12

        MOV     R0,#2
        SWI     XWimp_Extend
        STRVC   R0,wimpextend

        MOV     R0,#4
        SWI     Wimp_Extend
        STRVC   R0,wimpsprname
        STRVC   R1,wimplistat

15
        LDR     R1,[R1]
        CMP     R1,#1
        BLT     %FT20
        STR     R2,[R0]
        BL_Wimp #0
        B       %FT99
20
        MOV     r0,#40
        BL      SpriteOp
 [ debugredraw
 BVC %FT00
 ADD r14, r0, #4
 DSTRING r14, "error: "
00
 ]
99
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r0 = base sprite op

; Out   r0 corrupt

SpriteOp Entry "r1"

 [ debugredraw :LAND: False
 DREG r0, "SpriteOp: rc ",cc,Word
 DREG r3, ", x ",cc,Integer
 DREG r4, ", y ",cc,Integer
 DREG r6, ", fac "
 ]
        ADD     r0, r0, #&100           ; Make operation use address/name
        SWI     XWimp_SpriteOp
        EXIT

        END
