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
; > s.Wimp

;;-----------------------------------------------------------------------------
;; Title:    A1 Wimp System
;; Author:   Neil Raine
;;-----------------------------------------------------------------------------

        AREA    |Asm$$Code|, CODE, READONLY

Module_BaseAddr

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Machine.<Machine>
        GET     Hdr:CMOS
        GET     Hdr:PublicWS               ; for SvcTable
        GET     Hdr:ModHand
        GET     Hdr:Proc
        GET     Hdr:EnvNumbers
        GET     Hdr:Services
        GET     Hdr:UpCall
        GET     Hdr:VduExt
        GET     Hdr:FSNumbers
        GET     Hdr:HighFSI
        GET     Hdr:HostFS
        GET     Hdr:NDRDebug
        GET     Hdr:Font
        GET     Hdr:Wimp
        GET     Hdr:Messages
        GET     Hdr:NewErrors
        GET     Hdr:Sprite
        GET     Hdr:Variables
        GET     Hdr:FileTypes
        GET     Hdr:Hourglass
        GET     Hdr:ResourceFS
        GET     Hdr:Portable
        GET     Hdr:MsgTrans
        GET     hdr:ColourTran
        GET     hdr:FPEmulator
        GET     hdr:Territory
        GET     hdr:Switcher
        GET     hdr:PDriver
        GET     hdr:ScrBlank
        GET     hdr:OsWords
        GET     hdr:Countries
        GET     hdr:Internatio
        GET     hdr:VFPSupport
        GET     hdr:OSRSI6

        GET     VersionASM

        GET     hdr.WIMPMacros
        GET     hdr.IconHigh

	GBLL	true
	GBLL	false
true	SETL	{TRUE}
false	SETL	{FALSE}

        GBLS    LoadWimpOptions
      [ Options = ""
LoadWimpOptions SETS "GET Options.s.<System>"
      |
LoadWimpOptions SETS "GET Options.s.$Options"
      ]

	GET	Options.s.!Default
        $LoadWimpOptions
	GET     Hdr:ImageSize.<ImageSize>
	GET	Options.s.!Common
	GET	Options.s.!Debug
        GET     Wimp01.s
        GET     Memory.s
        GET     Wimp02.s
        GET     Watchdog.s
      [ ThreeDPatch
        GET     Tiling3D.s
      |
        GET     Tiling.s
      ]
        GET     Wimp03.s
        GET     Wimp04.s
        GET     Wimp05.s
        GET     Wimp06.s
        GET     Iconbar.s
        GET     Wimp07.s
        GET     ProgErrs.s
        GET     Wimp08.s
        GET     Wimp09.s
        GET     Wimp10.s
        GET     NewSWIs.s
        GET     AutoScroll.s
      [ debug
        GET     Trace.s
      ]

        END
