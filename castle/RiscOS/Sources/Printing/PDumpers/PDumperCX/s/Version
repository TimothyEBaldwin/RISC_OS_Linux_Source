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

; 24-Jul-95      MJS Created CanonX (Canon Extended Mode) dumper from Escape P2 dumper


                GET     ^.VersionASM

                GBLA    PDumperNumber
                GBLS    PDumperTitle
                GBLS    PDumperHelp
                GBLL    PDumperDebug

              [ :DEF: BuildCX2
            ! 0,"Assembling CX2 varient" 
PDumperNumber   SETA    PDumperCX2_Number
PDumperTitle    SETS    "PDumperCX2"
              |
            ! 0,"Assembling CX varient" 
PDumperNumber   SETA    PDumperCX_Number
PDumperTitle    SETS    "PDumperCX"
              ]
PDumperHelp     SETS    "$PDumperTitle"
PDumperDebug    SETL    false

                GBLS    PrivMessages
PrivMessages    SETS    ""                      ; no private messages

                END
