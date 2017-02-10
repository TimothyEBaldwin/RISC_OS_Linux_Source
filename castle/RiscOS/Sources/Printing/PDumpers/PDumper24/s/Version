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

; 10-Jan-92 0.28 OSS Created specialised 24 pin dumper from PDumperDM 0.28.
; 13-Jan-92 0.28 OSS Don't form feed if NoPageAdvance is set.
; 20-Feb-92 0.29 JSR Version number incremented for r8 corruption fix in common.header
;  5-Mar-92 0.30 DDV New format version byte within PDdata description files.
; 25-Mar-92 0.31 DDV Bug fix: $Extra variables reliably translated
;  1-Apr-92 0.32 DDV Bug fix: further tweek to $Extra sending.
; 24-Apr-92 0.33 DDV Support for handling of v3 data files added.
; 15-Sep-94 1.08 AMcC Use common version number
;
                GET     ^.VersionASM

                GBLA    PDumperNumber
                GBLS    PDumperTitle
                GBLS    PDumperHelp
                GBLL    PDumperDebug

PDumperNumber   SETA    PDumper24_Number
PDumperTitle    SETS    "PDumper24"
PDumperHelp     SETS    "$PDumperTitle"
PDumperDebug    SETL    false

                GBLS    PrivMessages
PrivMessages    SETS    ""                      ; no private messages

                END
