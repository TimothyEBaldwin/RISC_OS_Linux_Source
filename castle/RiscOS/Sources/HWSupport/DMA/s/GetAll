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
; > Sources.GetAll

;---------------------------------------------------------------------------
; DMA manager module.
;---------------------------------------------------------------------------

        AREA    |DMA$$Code|, CODE, READONLY, PIC

Module_BaseAddr

;---------------------------------------------------------------------------
;       Get the headers.
;
        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:ModHand
	GET	Hdr:Machine.<Machine>
	$GetIO
        GET     Hdr:Services
        GET     Hdr:MsgTrans
        GET     Hdr:ResourceFS
        GET     Hdr:DevNos
        GET     Hdr:Proc
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:HostFS
        GET     Hdr:NdrDebug
        GET     Hdr:DDVMacros
      [ HAL
        GET     Hdr:Variables
        GET     Hdr:DMADevice
        GET     Hdr:PCI
        GET     Hdr:HALEntries
      ]

        GET     VersionASM

;---------------------------------------------------------------------------
;       Define global variables.
;
                GBLL    hostvdu

debug           SETL    false
hostvdu         SETL    true
mod             SETD    false
dma             SETD    false
unsf            SETD    false
safe            SETD    false
swi             SETD    false
int             SETD    false
tab             SETD    false
term            SETD    false
purge           SETD    false
tmp             SETD    false

debug_irqsafe   SETL    true

                GBLL    WriteBackCache
WriteBackCache  SETL    true            ; Needed for StrongARM, and unless we add
                                        ; some way to set pages as write-though
                                        ; cacheable, for ARM9 and XScale too.
                                        ; Not needed for ARM7.

  [ :LNOT: :DEF: standalone
                GBLL    standalone
standalone      SETL    false
  ]

                GBLL    international
international   SETL    true

                GBLA    ScatterListThresh
ScatterListThresh SETA  -&10000

;---------------------------------------------------------------------------
;       Get the sources.
;
                GBLS    GetResFiles
 [ standalone
GetResFiles     SETS    "GET    s.ResFiles"
 |
GetResFiles     SETS    ""
 ]


      [ HAL
        GET     CallHAL.s
      ]
        GET     Front.s
        GET     Macros.s
        GET     Errors.s
        GET     ModHead.s
        $GetResFiles
        GET     SWI.s
        GET     DMA.s
      [ HAL
        GET     Command.s
      ]
        GET     Tail.s

        END
