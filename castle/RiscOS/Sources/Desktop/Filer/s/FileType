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
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In    r5 -> fileinfo block

; Out   r3 = &000..&FFF -> dated file (see Hdr.Messages)
;          = &1000      -> directory
;          = &2000      -> application
;          = &3000      -> undated

FindFileType Entry

        LDRB    r14, [r5, #df_type]
        CMP     r14, #dft_dir           ; EQ,CS if so
        TEQNE   r14, #dft_applic*4,2    ; EQ,CC if so
        MOVCS   r3, #filetype_directory
        MOVCC   r3, #filetype_application
        EXIT    EQ
;      [ version >= 143
;        TEQ     r14, #dft_partition
;        MOVEQ   r3, #filetype_directory
;        EXITS   EQ
;      ]

 ASSERT df_load = 0
 ASSERT df_exec = 4
        LDMIA   r5, {r3, r14}

        TEQ     r3, r14
        MOVEQ   r3, #filetype_undated   ; [load=exec]
        EXIT    EQ

        CMN     r3, #&00100000
        MOVCC   r3, #filetype_undated   ; [undated]
        MOVCS   r3, r3, LSL #12
        MOVCS   r3, r3, LSR #20         ; 00000ttt
        EXIT

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; In Registers as returned by OS_File 5
;
; Out   r3 = &000..&FFF -> dated file (see Hdr.Messages)
;          = &1000      -> directory
;          = &2000      -> application
;          = &3000      -> undated
;          = -1         -> bad dirname (shouldn't ever happen)
;       flags preserved

FindFileType_FromInfo Entry "r1"

        CMP     r0, #object_file
        BNE     %FT10
        TEQ     r2, r3
        MOVEQ   r3, #filetype_undated   ; Load = exec
        EXIT    EQ

        CMN     r2, #&00100000
        MOVCC   r3, #filetype_undated
        MOVCS   r3, r2, LSL #12
        MOVCS   r3, r3, LSR #20
        EXIT

        ; Wander through the dirname, ending with correct
        ; type in r3.
10      MOV     r3, #-1         ; Indicates start of dirname
20      LDRB    r14, [r1], #1
        CMP     r14, #space
        EXIT    LE

        CMP     r3, #-1
        BNE     %FT30
        CMP     r14, #"!"
;        CMPNE   r14, #160                       ; alt_space
        MOVEQ   r3, #filetype_application
        MOVNE   r3, #filetype_directory
        B       %BT20

30      CMP     r14, #":"
        CMPNE   r14, #"."
        MOVEQ   r3, #-1
        B       %BT20

        END
