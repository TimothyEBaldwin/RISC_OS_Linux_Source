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
; Debug routines and macros for IDE debugging.

        MACRO
$label  TLINE   $str,$cc
$label
        B       %f20
10
 [ "$str" <> ""
        =       "$str"
 ]
 [ "$cc" = ""
        =       13,10
 |
  [ "$cc" <> "cc"
   ! 1,"Error in TLINE with 'cc': '$cc' used instead"
   MEXIT
  ]
 ]
        =       0
        ALIGN
20
        Push    "R1,LR"
        ADR     R1,%b10
        BL      TubeString
        Pull    "R1,LR"
        MEND

;*********************************************************************

        MACRO
$label  TREG    $reg,$str,$cc
$label
        Push    "R0,LR"
 [ "$str" = ""
        Push    "R0,LR"
        MOV     R0,#" "
        BL      TubeChar
        Pull    "R0,LR"
 |
        TLINE   "$str",cc
 ]
        Tword   $reg
 [ "$cc" = ""
        MOV     R0,#13
        BL      TubeChar
        MOV     R0,#10
        BL      TubeChar
 |
  [ "$cc" <> "cc"
   ! 1,"Error in TLINE with 'cc': '$cc' used instead"
   MEXIT
  ]
 ]
        Pull    "R0,LR"
        MEND

;*********************************************************************

        MACRO
$label  TBYTE   $reg,$str,$cc
$label
        Push    "R0,LR"
 [ "$str" = ""
        Push    "R0,LR"
        MOV     R0,#" "
        BL      TubeChar
        Pull    "R0,LR"
 |
        TLINE   "$str",cc
 ]
        MOV     R0,$reg
        BL      TubeHexByte
 [ "$cc" = ""
        MOV     R0,#13
        BL      TubeChar
        MOV     R0,#10
        BL      TubeChar
 |
  [ "$cc" <> "cc"
   ! 1,"Error in TLINE with 'cc': '$cc' used instead"
   MEXIT
  ]
 ]
        Pull    "R0,LR"
        MEND

;*********************************************************************

        MACRO
$label  TPRINTV
$label
        Push    "LR"
        BL      TubePrintV
        Pull    "LR"
        MEND

;*********************************************************************

TubePrintV      ROUT
        Push    "R1,LR"
        SavePSR R1
        BVC     %FT10
        TLINE   "VS",cc
        B       %FT20
10
        TLINE   "VC",cc
20
        RestPSR R1,,f
        Pull    "PC"

;*********************************************************************

TubeString      ROUT
        Push    "R0,R2,LR"
        SavePSR R2
10
        LDRB    R0,[R1],#1
        TEQS    R0,#0
        BLNE    TubeChar
        BNE     %BT10
        RestPSR R2,,f
        Pull    "R0,R2,PC"

;*********************************************************************

TubeHexByte     ROUT
        Push    "R0,R1,R2,LR"
        SavePSR R2
        MOV     R1,R0
        MOV     R0,R0,LSR #4
        BL      %FT10
        MOV     R0,R1
        BL      %FT10
        RestPSR R2,,f
        Pull    "R0,R1,R2,PC"
10
        AND     R0,R0,#&0F
        CMPS    R0,#10
        ADDCC   R0,R0,#"0"
        ADDCS   R0,R0,#"A"-10
        B       TubeChar

;*********************************************************************

        END
