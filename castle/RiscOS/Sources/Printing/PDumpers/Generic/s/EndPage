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
; > EndPage

;..............................................................................
; 
; Handle the end of page condition, check to see if there is an end of
; page sequence.  If there is then send it to specified file handle.
;
; in    R1 file handle
;       R2 strip type
;       R3 ->private word for dumper
;       R4 job workspace
;
; out   V =1 => R0 -> error block

EndPage_Monochrome ROUT
EndPage_Grey       ROUT
EndPage_Colour256  ROUT
EndPage_Multi		ROUT
EndPage_16Bit		ROUT
EndPage_24Bit		ROUT

        PDumper_Entry "R0-R3,R4-R6"
             
        Debug   EndPage,"(endpage) handle, strip type, private word, jobws",R1,R2,R3,R4
                           
        STR     R1,FileHandle           ;Store the handle
        PDumper_Reset                   ;And then flush it away
                                                              
        ADD     R4,R4,#pd_data

        LDRB    R0,[R4,#pd_data_version - pd_data]
        CMP     R0,#2                   ; Is version >=2?
        BLT     %FT10

        LDRB    R0,[R4,#pd_private_flags -pd_data]
        TST     R0,#df_NoPageAdvance    ; Is full page advance allowed?
        BNE     %FT10                   ; No - don't form feed

        LDRB    r0, [r4, #pd_data_form_feed]    ; -> form feed sequence
        TEQ     r0, #0                  ; is one specified?
        BEQ     %FT10                   ; No - don't output it

        ADD     r0, r4, r0      
        PDumper_PrintCountedString r0, r1, r2
10
        LDRB    R0,[R4,#pd_data_page_end]
        TEQ     R0,#0                   ;Is there an end of page sequence?
        BEQ     %FT10

        ADD     R0,R4,R0                ;->Sequence to be sent
        PDumper_PrintCountedString R0,R1,R2
10
        PDumper_EmptyBuffer
        PDumper_Exit                    ;Flush the buffer and then exit

        END
