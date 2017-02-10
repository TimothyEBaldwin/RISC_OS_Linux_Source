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
        TTL     TML_HostFS - Host Filing System via TML

; ***********************************
; ***    C h a n g e   L i s t    ***
; ***********************************

; Date       Name  Version Description
; ----       ----  ------- -----------
; 3-3-92     JSR      0.00 Written


; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:ModHand
        GET     Hdr:Services
        GET     Hdr:Proc
        GET     Hdr:EnvNumbers
        GET     Hdr:HostFS

        GET     Version

        LEADR   Module_LoadAddr

TML_BaseAddr * &33A0000

TML     RN      11

        ^       0,TML
TML_RxData      #       4
TML_TxData      #       4
TML_Control     #       4
TML_TxStatus    #       4

        MACRO
        LdTMLBase
        MOV     TML, #&3300000
        ORR     TML, TML, #&A0000
        MEND

        ^     0, wp

; ****************** HostFile Module code starts here *************************

Module_BaseAddr

        DCD     0
        DCD     HostFS_Init     -Module_BaseAddr
        DCD     HostFS_Die      -Module_BaseAddr
        DCD     HostFS_Service  -Module_BaseAddr
        DCD     HostFS_Title    -Module_BaseAddr
        DCD     HostFS_Help     -Module_BaseAddr
        DCD     0               ; no commands
        DCD     Module_SWISystemBase + TubeSWI * Module_SWIChunkSize
        DCD     HostFS_SWICode  -Module_BaseAddr
        DCD     HostFS_SWITable -Module_BaseAddr

HostFS_Title
        DCB     "TML_HostFS", 0

HostFS_SWITable
        DCB     "HostFS", 0
        DCB     "HostVdu",0
        DCB     "TubeVdu",0
        DCB     "WriteC",0
        DCB     "ReadC",0
        DCB     "ReadCMaybe",0
        DCB     0

HostFS_Help
        DCB     "HostFS"
        DCB     9,9
        DCB     "$Version ($CurrentDate)", 0
        ALIGN

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; NB. Can't talk to Tube during initialisation, only after reset has come round

; r0-r6 trashable

HostFS_Init Entry

        LdTMLBase

        ; Reset
        MOV     r0, #2
        STRB    r0, TML_Control

        ; Delay
        MOV     r1, #&ff00
10
        STRB    r0, TML_RxData
        SUBS    r1, r1, #1
        BGT     %BT10

        ; Check booted hardware OK
        LDRB    r0, TML_Control
        TEQ     r0, #&ff
        EXIT    NE

        ADR     r0, BadHardWare
        Pull    "lr"
        ORRS    pc, lr, #V_bit

BadHardWare
        DCD     0
        DCB     "TML hardware not found",0
        ALIGN

        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Let Module handler take care of removing our workspace on fatal death
; or shunting it around on Tidy - none of it is absolute

HostFS_Die * Module_BaseAddr

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

HostFS_Service * Module_BaseAddr

HostFS_SWICode ROUT
        CMP     r11, #MaxSwi            ; Number of valid SWI entries
        ADDLO   pc, pc, r11, LSL #2
        MOVS    pc, lr

JumpTable
        B       DoHostVdu
        B       DoTubeVdu
        B       Host_WriteC
        B       Host_ReadC
        B       Host_ReadCMaybe

MaxSwi  *       (.-JumpTable) / 4

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

DoHostVdu MOVS  pc, lr

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

DoTubeVdu MOVS  pc, lr

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Sit on WrchV printing characters to the Host

WRCHandler ROUT

        BL      Host_WriteC
        Pull    pc                      ; Claim it

; In r0=char
; Out r10,r11 corrupted
Host_WriteC ROUT
        LdTMLBase
10
        LDRB    r10, TML_TxStatus
        TST     r10, #1
        STRNEB  r0, TML_TxData
        MOVNES  pc, lr
        B       %BT10

; Out r0=char; r10,r11 corrupted
Host_ReadC ROUT
        LdTMLBase
10
        LDRB    r10, TML_Control
        TST     r10, #1
        LDRNEB  r0, TML_RxData
        MOVNES  pc, lr
        MOV     r10, lr
        BL      TestEscape
        MOVVC   lr, r10
        BVC     %BT10
        MOV     pc, r10

TestEscape Entry "r1,r2"
        MOV     r0, #126
        SWI     XOS_Byte
        TEQ     r1, #&ff
        EXITS   NE
        ADR     r0, EscapeError
        PullEnv
        ORRS    pc, lr, #V_bit

EscapeError
        DCD     17
        DCB     "Escape",0
        ALIGN

; Out r0=char or -1 of none available
Host_ReadCMaybe ROUT
        LdTMLBase
10
        LDRB    r10, TML_Control
        TST     r10, #1
        LDRNEB  r0, TML_RxData
        MOVEQ   r0, #-1
        MOVS    pc, lr

        END
