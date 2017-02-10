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
        GBLL    FileCache
FileCache SETL  {TRUE}

        GBLL    NewFs
NewFs   SETL    {TRUE}

        GBLL    TickerVPatch    ;patch to release TickerV when loading to
                                ;replace versions 0.02,0.03 which left claimed
TickerVPatch SETL {FALSE}

        GBLL    PodFix
PodFix  SETL    {TRUE}

        GBLL    WTEST
WTEST   SETL    {TRUE}

; 32-bit mode proof fiq handling
; This is 26-bit mode proof, so no need to make it machine dependant
        GBLL    FIQ32bit
FIQ32bit        SETL    {TRUE}

; Enables control over whether Engineering mode verify is enabled
; or disabled on the IDE controller (default disabled)
        GBLL    EngineeringMode
EngineeringMode SETL    {TRUE}

        GBLL    IDEPower
IDEPower        SETL    {TRUE}

; allow auto-detection of IDE devices
        GBLL    AutoDetectIDE
AutoDetectIDE   SETL    {TRUE}

; new 32-bit FileCore error reporting scheme
        GBLL    NewErrors
NewErrors       SETL    {TRUE}

 [ NewErrors
NewErrorBit * CreateFlag_NewErrorSupport
 |
NewErrorBit * 0
 ]

; updated semantics of scatter list to allow background transfer
; to/from top-bit set logical addresses
        GBLL    FixTBSAddrs
FixTBSAddrs     SETL    {TRUE}
ScatterListNegThresh    *       &10000

        END
