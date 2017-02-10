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
; Title:   s.toolbox
; Purpose: toolbox functions
; Author:  NK
; History: 31-Aug-94: NK : Created
;          16-Nov-99: SNB: 32-bit support plus other fixes

; APCS-R/APCS-32 compliant as per {CONFIG}
;   a1-a4,ip (R0-R3,R12) may be corrupted

        EXPORT  |toolbox_delete_object|
        EXPORT  |window_starting|

        AREA    |Veneers$$Code|, CODE, READONLY, PIC

        GET     hdr:ListOpts
        GET     hdr:Macros
        GET     hdr:System
        GET     hdr:Proc
        GET     hdr:Toolbox
        GET     hdr:Services

        MACRO
        MOVRet  $lr,$cond
        [ {CONFIG}=26
        MOV$cond.S    pc,$lr
        |
        MOV$cond      pc,$lr
        ]
        MEND

        MACRO
        LDMRet  $regs,$cond
        [ {CONFIG}=26
        LDM$cond.FD   sp!,{$regs,pc}^
        |
        LDM$cond.FD   sp!,{$regs,pc}
        ]
        MEND


toolbox_delete_object
        MOV     ip,lr
        SWI     XToolbox_DeleteObject
        MOVVC   a1,#0
        MOVRet  ip

window_starting
        STMFD   sp!,{r0-r7,lr}
        LDR     r1,=Service_WindowModuleStarting
        SWI     XOS_ServiceCall
        LDMRet  r0-r7

        END

