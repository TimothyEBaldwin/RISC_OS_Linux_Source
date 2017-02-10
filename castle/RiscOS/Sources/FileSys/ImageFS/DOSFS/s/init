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

        IMPORT  |_clib_initialisemodule|

        EXPORT  |_dosfs_initialisemodule|

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:MsgTrans
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        
        AREA    |C$$Code|, CODE, READONLY

|_dosfs_initialisemodule|
        ADR     r7, |_dosfs_initialisemodule|
        LDR     r8, |_dosfs_initialisemodule_adcon|
        CMP     r7, r8
        BEQ     |_clib_initialisemodule|
        ADR     r0, module_ramload_error
        MOV     r1, #0
        MOV     r2, #0
        ADR     r4, titlestr
        MOV     r5, #0
        MOV     r6, #0
        MOV     r7, #0
        SWI     XMessageTrans_ErrorLookup
        Pull    "r7-r11, pc"

|_dosfs_initialisemodule_adcon|
        DCD     |_dosfs_initialisemodule|

module_ramload_error
        DCD     ErrorBase_CSharedLibrary + 10 ; See 'RISC_OSLib/modulewrap.s'
        DCB     "RAMLoadC", 0
        ALIGN

titlestr
        DCB     "DOSFS", 0
        ALIGN

        END
