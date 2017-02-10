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
; >RamFS

        TTL     "Module header"

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Services
        GET     Hdr:ModHand
        GET     Hdr:UpCall
        GET     Hdr:Tokens
        GET     Hdr:Proc
        GET     Hdr:MsgTrans
        GET     Hdr:FileCore
        GET     Hdr:FileCoreErr
        GET     Hdr:HighFSI
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:PublicWS
        GET     Hdr:OSRSI6

        GET     VersionASM
        GET     Defns.s

        AREA    |RAMFS$$Code|, CODE, READONLY, PIC

        ENTRY

        ; Module header
Module_BaseAddr
        DCD     0                               ; no start entry
        DCD     InitEntry - Module_BaseAddr
        DCD     DieEntry - Module_BaseAddr
        DCD     0                               ; no ServiceEntry
        DCD     RamFSTitle - Module_BaseAddr
        DCD     RamFSHelpString - Module_BaseAddr
        DCD     ComTab - Module_BaseAddr
        DCD     RamFSSWI_Base
        DCD     SwiEntry - Module_BaseAddr
        DCD     SwiNames - Module_BaseAddr
        DCD     0                               ; no SWI name decoding code
      [ International_Help <> 0
        DCD     message_filename - Module_BaseAddr
      |
        DCD     0
      ]
        DCD     ModFlags - Module_BaseAddr
        ASSERT  {PC} - Module_BaseAddr = 52

RamFSBootText
        DCB     "Acorn "                        ; includes RamFSTitle
RamFSTitle
        DCB     "RamFS", 0
        ALIGN

RamFSHelpString
        DCB     "RamFS",9,9,"$Module_HelpVersion", 0
        ALIGN

ModFlags
      [ :LNOT:No32bitCode
        DCD     ModuleFlag_32bit
      |
        DCD     0
      ]

        ; And the rest of the sources
        GET     RamFS05.s
        GET     RamFS15.s
        GET     RamFS50.s
        GET     MsgCode.s
        GET     TokHelpSrc.s

        ; Plus optional debug routines
      [ Debug
        InsertDebugRoutines
      ]

        END
