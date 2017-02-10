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
        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Machine.<Machine>

;	Hack!
        GBLL  med_00001_debug
med_00001_debug     SETL  {FALSE}

; and another...
        GBLL  StrongARM
StrongARM SETL {TRUE}

; yet more..
        GBLL    ChocolateSysHeap
ChocolateSysHeap SETL {TRUE}

        GBLL    mjsSysHeapNodesTrace
mjsSysHeapNodesTrace SETL {TRUE}


        GET     ^.PublicWS
        GET     ^.KernelWS


        MACRO
        LabelValue $LabelName
        LCLS    String
String  SETS    "Label " :CC: "$LabelName" :CC: " has the value &"
String  SETS    "$String" :CC: :STR: $LabelName
        !       0, "$String"
        MEND

        MACRO
        RegisterLabelValue $LabelName
        LCLS    String
        LCLA    Register
String  SETS    "Label " :CC: "$LabelName" :CC: " has the value &"
String  SETS    "$String" :CC: :STR: ( :INDEX: $LabelName)
Register SETA   :BASE: $LabelName
        [       Register >= 10
String  SETS    "$String" :CC: ", R" :CC: ((:STR: (Register+6)) :RIGHT: 2)
        |
String  SETS    "$String" :CC: ", R" :CC: ((:STR: Register) :RIGHT: 1)
        ]
        !       0, "$String"
        MEND


        LabelValue Export_BgEcfOraEor
        LabelValue Export_FgEcfOraEor
        LabelValue Export_BranchToSWIExit
        LabelValue Export_DomainId
        LabelValue Export_ESC_Status
        LabelValue Export_IRQsema
        LabelValue Export_LatchBSoftCopy
        LabelValue Export_MEMC_CR_SoftCopy
        LabelValue Export_DebuggerSpace
        LabelValue Export_RedirectInHandle
        LabelValue Export_RedirectOutHandle
        LabelValue Export_ScratchSpace
        LabelValue ScratchSpaceSize
        LabelValue Export_SoundDMABuffers
        LabelValue Export_SoundDMABufferSize
        LabelValue Export_SoundWorkSpace
        LabelValue Export_SVCSTK
        LabelValue Export_SvcTable
        LabelValue Export_SysHeapStart
        LabelValue Export_VduDriverWorkSpace
        LabelValue VDWSSize
        LabelValue ScreenBlankFlag
        LabelValue ScreenBlankDPMSState

        END
