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
; s.Help
;
;
PinboardToken   DCB     "PWH",0
PinedDirToken   DCB     "PIcD",0
PinedFileToken  DCB     "PIcF",0
PinedAppToken   DCB     "PIcA",0
IconizedToken   DCB     "PIcW",0
InfoDboxToken   DCB     "Hdb",0
TinyDirsToken   DCB     "IcT",0
TinyDirToken    DCB     "IcD",0
TinyAppToken    DCB     "IcA",0
TinyFileToken   DCB     "IcF",0
HelpRequest     ROUT

        LDR     r2,[r1,#36]     ; Icon
        LDR     r1,[r1,#32]     ; Window

        LDR     r14,saveas_handle
        TEQ     r1,r14
        Pull    "PC",EQ

        LDR     r14,backdrop_handle
        TEQ     r1,r14
        BEQ     PinboardHelp

        CMP     r1,#-2
        BNE     MenuHelp

        LDR     r14,TinyDirs_Handle
        TEQ     r2,r14
        ADREQ   r1,TinyDirsToken
        BEQ     SendHelp

        BL      FindIcon
        Pull    "PC",NE

        LDR     r14,[r2,#ic_filetype]
        CMP     r14,#&1000
        ADREQ   r1,TinyDirToken
        ADRLT   r1,TinyFileToken
        ADRGT   r1,TinyAppToken
        B       SendHelp

PinboardHelp
        Debug   he,"Icon is ",r2
        CMP     r2,#-1
        ADREQ   r1,PinboardToken
        BEQ     SendHelp

        BL      FindIcon
        ADRNE   r1,IconizedToken
        BNE     SendHelp

        LDR     r14,[r2,#ic_filetype]
        CMP     r14,#&1000
        ADREQ   r1,PinedDirToken
        ADRLT   r1,PinedFileToken
        ADRGT   r1,PinedAppToken
        B       SendHelp

PinboardMenuToken       DCB     "PH",0,0
TinyDirsMenuToken       DCB     "H1",0,0
TinyDirsIconMenuToken   DCB     "H2",0,0

MenuHelp
        Debug   he,"Menu help"

        LDR     r0,CurrentMenu
        TEQ     r0,#Menu_Pinboard
        LDREQ   r14,PinboardMenuToken
        TEQ     r0,#Menu_TinyDirs
        LDREQ   r14,TinyDirsMenuToken
        TEQ     r0,#Menu_TinyDirsIcon
        LDREQ   r14,TinyDirsIconMenuToken
        STR     r14,ConversionSpace

        MOV     r3,r2
        MOV     r2,r1
        MOV     r0,#1
        ADRL    r1,dataarea+20
        SWI     XWimp_GetMenuState
        Pull    "PC",VS

        ADRL    r1,dataarea+20
        ADRL    r0,ConversionSpace+2

        LDR     r2,[r1],#4
        CMP     r2,#0
        Pull    "PC",LT
01
        ADD     r2,r2,#"0"
        STRB    r2,[r0],#1
        LDR     r2,[r1],#4
        CMP     r2,#0
        BGE     %BT01
        MOV     r2,#0
        STRB    r2,[r0],#1
        ADR     r1,ConversionSpace
        B       SendHelp

        Pull    "PC"

SendHelp
        ADR     r0,message_file_block+4
        ADRL    r2,dataarea+20
        MOV     r3,#256-20
        SWI     XMessageTrans_Lookup
        Pull    "PC",VS

        ADR     r1,dataarea
        LDR     r0,[r1,#8]
        STR     r0,[r1,#12]
        LDR     r0,=Message_HelpReply
        STR     r0,[r1,#ms_action]
        ADD     r0,r3,#21
        ADD     r0,r0,#3
        BIC     r0,r0,#3
        STR     r0,[r1,#ms_size]
        MOV     r0,#17
        LDR     r2,[r1,#4]
        SWI     XWimp_SendMessage
        Pull    "PC"

        LNK     Iconize.s

