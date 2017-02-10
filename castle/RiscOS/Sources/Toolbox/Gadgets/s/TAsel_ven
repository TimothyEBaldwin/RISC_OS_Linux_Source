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
; Title:   s.TAsel_ven
; Purpose: TextArea selection veneers
; Author:  EPW
; History: 23-Dec-96: EPW: Created from NK's slider_ven.s from slider gadget
;

	AREA    |C$$code|, CODE, READONLY

	GET	hdr:ListOpts
	GET	hdr:Macros
        GET     Hdr:System
        GET     hdr:Wimp
        GET     Hdr:APCS.<APCS>

        ^ 0,ip
button  #       4
window  #       4
icon    #       4
sent    #       4


        EXPORT  |textarea_drag_draw|
        EXPORT  |_textarea_drag_draw|
        EXPORT  |_textarea_drag_move|
        EXPORT  |_textarea_drag_remove|
        EXPORT  |get_sl|

        AREA    |C$$Code|, CODE, READONLY

textarea_drag_draw
|_textarea_drag_move|
        STMDB   sp!,{r0-r3,lr}
        LDR     r0,[ip,#12]                     ; has last one been dealt with?
        TEQ     r0,#0
        BNE     end
; construct a mouse event!
        SUB     sp,sp,#20
        STR     r2,[sp]                         ; maxx
        STR     r1,[sp,#4]                      ; miny
        ADD     r1,sp,#8
        LDMIA   ip,{r0,r2,r3}
        STMIA   r1,{r0,r2,r3}
        MOV     r0,#6                           ; mouse click
        LDR     r2,[ip,#4]
        SUB     r1,r1,#8
        SWI     XWimp_SendMessage
        ADD     sp,sp,#20
        MOV     r0,#1
        STR     r0,[ip,#12]
end
        LDMIA   sp!,{r0-r3,pc}

get_sl
        MOV     R0,R10

|_textarea_drag_draw|
|_textarea_drag_remove|
        MOV     pc,lr

        END
