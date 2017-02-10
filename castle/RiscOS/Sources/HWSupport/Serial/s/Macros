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
; > Macros

; Define macros used by the serial device driver continually.


                MACRO
$label          DebugFrame $condition, $reg, $size
              [ debug$condition
$label          Push    "r0-r2"
                MOV     r0, $reg
                MOV     r1, #0
00
                LDR     r2, [r0, r1]
                Debuga  ,"frame contents at offset", r1
                Debug   ," =>", r2
                ADD     r1, r1, #4
                TEQ     r1, #$size
                BNE     %00
                Pull    "r0-r2"
              ]
                MEND

                MACRO
$label          ErrorTable $errorname, $base
$label          DCD     (ErrorBlock_$errorname)-$base
                MEND

                MACRO
$label          IRQOff  $reg
$label          MOV     $reg, pc
                TST     $reg, #I_bit
                TEQEQP  $reg, #I_bit
                MEND

                END
