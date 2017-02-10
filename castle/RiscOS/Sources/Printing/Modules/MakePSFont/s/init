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

; init for MakePSFont - allows it to be dormant in ROM

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:ModHand
        GET     Hdr:Services
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:MsgTrans
        GET     Hdr:PDriver

        IMPORT  |_clib_initialisemodule|

        EXPORT  |_makepsf_initialisemodule|

        AREA    |C$$Code|, CODE, READONLY

|_makepsf_initialisemodule|
        Push    "r0,lr"
        SWI     XPDriver_CurrentJob     ;cheap check that PDriver module is present
        Pull    "r0,lr"
        BVC     |_clib_initialisemodule|
; PDriver not present
        Push    "lr"
        ADR     r0, no_PDriver_error
        MOV     r1, #0 ; use global messages
        MOV     r2, #0 ; use internal buffer
        ADR     r4, this_title
        ADR     r5, that_title
        MOV     r6, #0
        MOV     r7, #0
        SWI     XMessageTrans_ErrorLookup
        Pull    "pc"

no_PDriver_error
        DCD     ErrorNumber_NeedMod
        DCB     "NeedMod",0
        ALIGN
this_title
        DCB     "MakePSFont",0
        ALIGN
that_title
        DCB     "PDriver",0
        ALIGN

        END
