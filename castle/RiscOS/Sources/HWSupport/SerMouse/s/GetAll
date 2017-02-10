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
; > s.GetAll

;---------------------------------------------------------------------------
;       Serial mouse driver.
;---------------------------------------------------------------------------

        AREA    |SerialMouse$$Code|, CODE, READONLY, PIC

Module_BaseAddr

;---------------------------------------------------------------------------
;       Get the headers.
;
        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:ModHand
        GET     Hdr:Services
        GET     Hdr:MsgTrans
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:ResourceFS
        GET     Hdr:Buffer
        GET     Hdr:HighFSI
        GET     Hdr:CMOS
        GET     Hdr:HostFS
        GET     Hdr:NdrDebug
        GET     Hdr:DDVMacros
        GET     Hdr:Proc
        GET     Hdr:Pointer
        GET     Hdr:SerialOp

        GET     VersionASM

;---------------------------------------------------------------------------
;       Define global variables.
;
                GBLL    hostvdu

debug           SETL    false
hostvdu         SETL    false

mod             SETD    false
drv             SETD    false

  [ :LNOT: :DEF: standalone
                GBLL    standalone
standalone      SETL    false
  ]

                GBLL    international
international   SETL    true

;---------------------------------------------------------------------------
;       Get the sources.
;
                GBLS    GetResFiles
 [ standalone
GetResFiles     SETS    "GET    ResFiles.s"
 |
GetResFiles     SETS    ""
 ]

        GET     Front.s
        GET     Macros.s
        GET     ModHead.s
        $GetResFiles
        GET     SerMouse.s
        GET     Driver.s
        GET     Tail.s

        END
