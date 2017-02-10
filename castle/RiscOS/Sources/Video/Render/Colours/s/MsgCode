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
; > MsgCode


     [ international


; Lookup message token stored at R0, we first have to ensure that the
; workspace block has been claimed and the messages file opened.
;
;  in: r0 -> token block
;      r1 -> %0 parameter for substitution
;
; out: V set, r0 -> error block
;

LookupError ROUT

        Push    "R1-R7,LR"

        BL      OpenMessages            ;Attempt to open the messages file
        Pull    "R1-R7,PC",VS

        MOV     R7,#0
        MOV     R6,#0
        MOV     R5,#0
        addr    R4,Title
        MOV     R2,#0                   ;And use the system buffer to translate
        addl    R1,WP,MessagesBlock     ;Pointer to header for MsgTrans lookup
        SWI     XMessageTrans_ErrorLookup
        DebugE  xx,"Error block is "

        Pull    "R1-R7,PC"


; Ensure that the messages file is opened, setting the flag
; to indicate this.

OpenMessages ROUT

        Push    "R0-R2,LR"

        LDR     R1,[R12,#MessagesOpen]
        CMP     R1,#0                   ;Is the messages file currently opened?
        Pull    "R0-R2,PC",NE           ;Should not occur, but just incase...

        addl    R0,R12,MessagesBlock
        ADR     R1,Filename             ;Pointer to name of resource block to open
        MOV     R2,#0
        SWI     XMessageTrans_OpenFile
        MOVVC   R0,#1
        STRVC   R0,[WP,#MessagesOpen]   ;If V clear, it worked so flag as messages open
        STRVS   R0,[SP]                 ;Otherwise V set so store error block pointer

        Pull    "R0-R2,PC"


; Filename of resources to be opened.

Filename
        = "Resources:$.Resources.Colours.Messages", 0
        ALIGN


      |


; Dummy routine used when the system has not been internationalised.
;
;  in: r0 -> token block
;      r1 -> %0 parameter for substitution
;
; out: V set, r0 -> error block
;

LookupError ROUT
        RETURNVS


      ]


        END
