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
; -> s.debug, debugging code for Squash

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:ModHand
        GET     Hdr:HostFS

        GBLL    Debug
Debug   SETL    {FALSE}

        AREA    debugging,CODE,READONLY

 [ Debug

WriteHex
; r0 - number to print
        Push    "r1-r2,lr"
        MOV     r1, r0
        MOV     r2, #8
nextdigit
        MOV     r0, r1, LSR #28
        CMP     r0, #10
        ADDGE   r0, r0, #7
        ADD     r0, r0, #"0"
        SWI     XOS_WriteC
        MOV     r1, r1, LSL #4
        SUBS    r2, r2, #1
        BNE     nextdigit
        Pull    "r1-r2,pc"

        EXPORT |_tracef|
|_tracef|
; r0 - pointer to null terminated string
; r1,r2,r3 - optional parameters
        Push    "r4,lr"
        MOV     r4, r0
        SWI     XHostFS_HostVdu
trloop
        LDRB    r0, [r4], #1
        CMP     r0, #0
        BEQ     trend
        CMP     r0, #10
        SWIEQ   XOS_NewLine
        BEQ     trloop
        CMP     r0, #"%"
        SWINE   XOS_WriteC
        BNE     trloop
        LDRB    r0, [r4]
        CMP     r0, #"%"
        SWIEQ   XOS_WriteC
        ADDEQ   r4, r4, #1
        BEQ     trloop
        MOV     r0, #"&"
        SWI     XOS_WriteC
        MOV     r0, r1
        MOV     r1, r2
        MOV     r2, r3
        BL      WriteHex
        B       trloop
trend
        SWI     XHostFS_TubeVdu
        Pull    "r4,pc"

 ]

        END
