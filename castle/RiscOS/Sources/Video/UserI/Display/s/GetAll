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
;       Get the headers.
;
        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:ModHand
        GET     Hdr:Services
        GET     Hdr:Wimp
        GET     Hdr:WimpSpace
        GET     Hdr:MsgTrans
        GET     Hdr:MsgMenus
        GET     Hdr:ResourceFS
        GET     Hdr:NdrDebug
        GET     Hdr:HostFS
        GET     Hdr:DDVMacros
        GET     Hdr:Proc
        GET     Hdr:Messages
        GET     Hdr:Sprite
        GET     Hdr:VduExt
        GET     Hdr:FileTypes
        GET     Hdr:Variables
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:ScrModes
        GET     Hdr:ColourTran
        GET     Hdr:GraphicsV

        GET     VersionASM

;---------------------------------------------------------------------------
;       Define global variables.
;
                GBLL    hostvdu

debug           SETL    false
hostvdu         SETL    true

mod             SETD    false
mode            SETD    false
menu            SETD    false
win             SETD    false
msg             SETD    false
icon            SETD    false

  [ :LNOT: :DEF: standalone
                GBLL    standalone
standalone      SETL    false
  ]

                GBLL    Medusa
Medusa          SETL    true

                GBLL    SelectFrameRate
SelectFrameRate SETL    true

                GBLL    LoadModeFiles
LoadModeFiles   SETL    true

                GBLL    SortOnPixelShape
SortOnPixelShape SETL   true

		GBLL	MessageChanging
MessageChanging	SETL	false

                GBLL    Allow24bpp ; Allow packed 24bpp modes?
Allow24bpp      SETL    false                

;---------------------------------------------------------------------------
;       Get the sources.
;
                GBLS    GetResFiles
 [ standalone
GetResFiles     SETS    "GET    Sources.ResFiles"
 |
GetResFiles     SETS    ""
 ]

        GET     Front.s
        GET     Errors.s
        GET     Module.s
        GET     Icon.s
        GET     Window.s
        GET     Menu.s
        GET     Message.s
        GET     Mouse.s
        GET     Mode.s
        GET     MsgTrans.s
        $GetResFiles

        END
