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
; > StartPage



; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; call: StartPage_Code
;
; in:   r0   = copies to do
;       r1   = file handle
;       r2   = strip type
;       r3   = number of blank pixel rows before start of data
;       r4  -> our private pdumper word for job
;       r5   = job workspace
;       r6   = number of blank pixels before start of line
;       r7   = horizontal and vertical resolution packed into a single word.
;
; out:  V clear;
;         r0 = number of copies to be performed
;         r3 = number of blank pixel rows before start of of image
;
;       V set;
;         r0 -> error block.
;
; This routine is called at the start of the page.  The routine will allow
; the PDumper to setup the printer and skip to the correct print position,
; the driver is also passed the number of copies to be performed.  Both
; of these values can be modified.  The device is also passed the horizontal
; margin for its own reference, this cannot be modified and it is assumed
; that the dumping routine will pad the line start with null bytes.
;
; The number of copies when returned should be non-zero, but the vertical
; skip should just be be +VE.
;

StartPage_Monochrome ROUT
StartPage_Grey ROUT
StartPage_Colour256 ROUT
StartPage_Multi		ROUT
StartPage_16Bit		ROUT
StartPage_24Bit		ROUT

        PDumper_Entry "R0-R2,R4,R6-R8"

        Debug   StartPage,"Copies to do",R0
        Debug   StartPage,"Vertical skip of",R3
        Debug   StartPage,"Left margin is",R6
        Debug   StartPage,"Packed resolution is",R7

        PDumper_Reset

        STR     R1,FileHandle          ;Stash the stream handle
        ADD     R5,R5,#pd_data          ;And point R5 at the configuration data

      [ Module_Version >= 012
        BL      sendextra               ;Stream out the extra sequence
      ]

        PDumper_AdjustFeed R6,R3,R5,R14

        LDRB    R0,[R5,#pd_data_version - pd_data]
        TEQ     R0,#0                   ;Is version number zero?
        LDRNEB  R0,[R5,#pd_data_set_lines]
        TEQNE   R0,#0                   ;Is there a set lines string?
        LDRNEB  R7,[R5,#pd_data_num_lines]
        TEQNE   R7,#0                   ;Is the number of lines zero?
        BEQ     %FT12

        ADD     R0,R5,R0                ;Output the set lines string
        PDumper_PrintCountedString R0,R1,R2

        MOV     r0, #24
        MUL     r8,r0,r7                ; Get length as 144ths inch
        BL      PDumper_PrintDecLead4   ; Output the page length
12
        LDRB    R0,[R5,#pd_data_page_start]
        TEQ     R0,#0                   ;Is there any page start sequences?
        BEQ     %FT10

        ADD     R0,R5,R0
        PDumper_PrintCountedString R0,R1,R2
10
        LDRB    R7,[R5,#pd_private_flags -pd_data]
        TST     R7,#df_NoPageAdvance    ;Is full page advance allowed?
        MOVNE   r3, #0                  ; No - default skip to zero
        LDRNEB  r0, [r5, #pd_data_version - pd_data]
        TEQNE   r0, #0                  ; Is data version zero?
        LDRNE   r3, [r5, #pd_data_roll_advance] ; No - load small skip

        LDRB    R0,[R5,#pd_data_line_skip]
        TEQ     R0,#0                   ;Can we perform vertical skipping?
        BEQ     %FT20                   ;No...

        ADD     R0,R5,R0
        LDRB    R1,[R5,#pd_dump_depth -pd_data]
15
        CMP     R3,R1                   ;Have we finished vertical skipping, ie. is skip<dump depth
        BLT     %FT20

        SUB     R3,R3,R1

        MOV     R2,R0                   ;Send the skip sequence
        PDumper_PrintCountedString R2,R4,LR
        B       %BT15                   ;And then loop back until finished
20
        PDumper_EmptyBuffer
        PDumper_Exit                    ;Flush the buffer and then return


; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        GetIf   ^.Generic.SendExtra.s, Module_Version >= 012
$GetConditionally

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        END

