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
 ; => GetAll
        TTL     The PCI manager for RISC OS.

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        $GetMEMM
        GET     Hdr:CMOS
        GET     Hdr:ModHand
        GET     Hdr:Debug
        GET     Hdr:PCI
        GET     Hdr:FSNumbers
        GET     Hdr:HighFSI
        GET     Hdr:NewErrors
        GET     Hdr:Services
        GET     Hdr:Tokens
        GET     Hdr:Proc
        GET     Hdr:Symbols
        GET     Hdr:HALEntries
        GET     Hdr:ResourceFS
        GET     Hdr:MsgTrans
        GET     Hdr:Heap
        GET     Hdr:OSMem

        GET     VersionASM

        GBLL    ReleaseVersion
ReleaseVersion  SETL    {TRUE}

        GBLS    GetHelpTexts
  [ International_Help <> 0
GetHelpTexts    SETS    "GET HelpTexts"
  |
GetHelpTexts    SETS    "GET HelpTokens.s"
  ]

  [ :LNOT::DEF:standalone
        GBLL    standalone
  ]

        GBLL    DebugModule
DebugModule     SETL    ( :LNOT: ReleaseVersion ) :LAND: {FALSE}

        GBLL    DebugInterface
DebugInterface  SETL    ( :LNOT: ReleaseVersion ) :LAND: {FALSE}

        GBLL    DebugCommands
DebugCommands   SETL    ( :LNOT: ReleaseVersion ) :LAND: {FALSE}

        GBLL    DebugScan
DebugScan       SETL    ( :LNOT: ReleaseVersion ) :LAND: {FALSE}

        GBLL    DebugMemory
DebugMemory     SETL    ( :LNOT: ReleaseVersion ) :LAND: {FALSE}

        GBLL    TML_Debugging
TML_Debugging   SETL    {FALSE}

        GET     Structures.s

        GET     Module.s
        GET     Interface.s
        GET     Scan.s
        GET     Commands.s
        GET     Memory.s
        GET     Errors.s
        $GetHelpTexts
        GET     MsgCode.s

        END
