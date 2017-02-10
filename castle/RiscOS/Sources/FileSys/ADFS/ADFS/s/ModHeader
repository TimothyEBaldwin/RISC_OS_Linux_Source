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
org

        ENTRY

;Module Header
        ASSERT  {PC}-org=0
        & 0             ;no start entry
        & InitEntry     - org   ;initialisation entry
        & DieEntry      - org
        & ServiceEntry  - org
        & AdfsTitle     - org
        & AdfsHelpString - org
        & ComTab        - org
        & ADFSSWI_Base
        & SwiEntry      - org
        & SwiNames      - org
        & 0             ;no SWI name decoding code
 [ International_Help <> 0
        & message_filename - org
 |
        & 0
 ]
        & AdfsModFlags  - org

        ASSERT  {PC}-org=52

AdfsBootText
        =       "Acorn "        ;includes AdfsTitle
AdfsTitle
        Text    "ADFS"


AdfsHelpString
        DCB     "ADFS", 9, 9, Module_HelpVersion
        [ Dev
        DCB     " Development version"
        |
        DCB     0
        ]
        ALIGN

AdfsModFlags
 [ No32bitCode
        &       0
 |
        &       ModuleFlag_32bit
 ]

        END
