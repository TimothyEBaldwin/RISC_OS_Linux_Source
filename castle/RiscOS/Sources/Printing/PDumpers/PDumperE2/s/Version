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
; > Version

; ********************
; *** CHANGES LIST ***
; ********************

; 12-Jul-92 0.01 TC  Created Escape P2 PDumper module
; 02-Sep-93 0.02 TC  Bug fix position of newline code in OutputDump
; 03-Nov-94 0.03 TC  delivered to Acorn
; 03-Nov-94 1.09 MJS Use common version number
; 07-Nov-94 1.10 MJS Optimise repetitive line-ends (1 pixel vertical moves, over white
;                    space) to become one relative vertical move - this is still slow,
;                    but less noisy, and less data sent. Ultimately, the whole bitmap
;                    driver and dumpers outght to quickly notice white-space rows and
;                    rapidly skip them at any given processing stage
; 10-Jul-95 1.15 MJS generally faster in colour mode


                GET     ^.VersionASM

                GBLA    PDumperNumber
                GBLS    PDumperTitle
                GBLS    PDumperHelp
                GBLL    PDumperDebug

PDumperNumber   SETA    PDumperE2_Number
PDumperTitle    SETS    "PDumperE2"
PDumperHelp     SETS    "$PDumperTitle"
PDumperDebug    SETL    false

                GBLS    PrivMessages
PrivMessages    SETS    ""                      ; no private messages

                END
