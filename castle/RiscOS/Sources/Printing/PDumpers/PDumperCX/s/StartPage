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
StartPage_Multi         ROUT
StartPage_16Bit         ROUT
StartPage_24Bit         ROUT

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

        MOV     R0, #0
        STR     R0, pending_line_ends

        LDRB    R0,[R5,#pd_data_version - pd_data]
        TEQ     R0,#0                   ;Is version number zero?
        LDRNEB  R0,[R5,#pd_data_set_lines]
        TEQNE   R0,#0                   ;Is there a set lines string?
        LDRNEB  R8,[R5,#pd_data_num_lines]
        TEQNE   R8,#0                   ;Is the number of lines zero?
        BEQ     %FT12

        ADD     R0,R5,R0                ;Output the set lines string
        PDumper_PrintCountedString R0,R1,R2
        PDumper_OutputReg R8            ; Output the number of lines
12
        LDRB    R0,[R5,#pd_data_page_start]
        TEQ     R0,#0                   ;Is there any page start sequences?
        BEQ     %FT10

        ADD     R0,R5,R0
        PDumper_PrintCountedString R0,R1,R2
10
        LDRB    R8,[R5,#pd_private_flags -pd_data]
        TST     R8,#df_NoPageAdvance    ;Is full page advance allowed?
        MOVNE   r3, #0                  ; No - default skip to zero
        LDRNEB  r0, [r5, #pd_data_version - pd_data]
        TEQNE   r0, #0                  ; Is data version zero?
        LDRNE   r3, [r5, #pd_data_roll_advance] ; No - load small skip

;set left margin
      [ :DEF: BuildCX2
        Push    "R0-R2,R7-R8"
        ADR     R0,cx_page_margins
      |
        Push    "R0-R2,R7"
        ADR     R0,cx_left_margin
      ]
        PDumper_PrintCountedString R0,R1,R2
        BIC     R7,R7,#&FF000000
        BIC     R7,R7,#&00FF0000  ;select just the horizontal resolution
      [ :DEF: BuildCX2
        MOV     R2,#120           ;we can set left margin in 1/60'ths inch - allow for rounding
                                  ; AND we divide by 2 later!!
        MUL     R6,R2,R6
        MOV     R0,#&8000         ; default the page length
        PDumper_PrintBinaryPair_HighFirst R0,R8
      |
        MOV     R2,#20            ;we can set left margin in 1/10'ths inch - allow for rounding
        MUL     R6,R2,R6
      ]
        DivRem  R0,R6,R7,R1
        ADD     R0,R0,#1          ;round to nearest
        MOV     R0,R0,LSR #1
      [ :DEF: BuildCX2
        PDumper_PrintBinaryPair_HighFirst R0,R8 ; Left margin
        MOV     R2, #&8000        ; default the right margin huge
;        MOV     R2, #480          ; right margin =8inch at 60dpi
        PDumper_PrintBinaryPair_HighFirst R2,R8 ; Right Margin
        MOV     R0,#0             ; default the offset
        PDumper_PrintBinaryPair_HighFirst R0,R8
        Pull    "R0-R2,R7-R8"
      |
        PDumper_OutputReg R0      ; Left margin
        MOV     R2, #80
        PDumper_OutputReg R2      ; Right Margin
        Pull    "R0-R2,R7"
      ]

;vertical skip to start
        CMP     R3,#0
        BLE     %FT20
        Push    "R0-R2"
        ADR     R0,cx_vertskip
        PDumper_PrintCountedString R0,R1,R2
        PDumper_PrintBinaryPair_HighFirst R3,R1
        MOV     R3,#0                   ;we've handled initial skip
        Pull    "R0-R2"

20
        PDumper_EmptyBuffer
        PDumper_Exit                    ;Flush the buffer and then return
 
 [ :DEF: BuildCX2
; sets extended page margins, need
; page length hi..lo   n/60 inch .. undef = maxpagelen
; left margin hi..lo   n/60 inch .. from first printable position + offset (default 0)
; right margin hi..lo  n/60 inch .. undef = max width (default 0x8000)
; offset hi..lo        n/60 inch .. from first printable position (default 0)
cx_page_margins = 5,27,"(","p",8,0
        ALIGN
 |
;sets 0 for page length, which should leave length at current setting
cx_left_margin = 6,27,"(","g",3,0,0
        ALIGN
 ]
cx_vertskip = 5,27,"(","e",2,0
        ALIGN

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        GetIf   ^.Generic.SendExtra.s, Module_Version >= 012
$GetConditionally

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        END

