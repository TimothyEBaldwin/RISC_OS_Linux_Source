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

; OSS Message file handling code, created for Internationalisation.
; The workspace usage in StringLib is somewhat unconventional, which
; means that I can't easily use the workspace to open the Messages
; file so I open and close it on demand on the stack.


; Lookup a string in the message file, and return a direct pointer to it.
; If file handle (R11) is zero then return zero as looked up string.
; Entry: R0 -> Token
;        R11 -> message file block
; Exit:  R0 -> String or V set error return

lookup_zero_file_r11 Entry "r1-r7"
        MOV     r1, r0                          ; Token
        SUBS    r0, r11, #0                     ; File handle (clears V!)
        EXIT    EQ                              ; No file so return zero

        MOV     r2, #0                          ; Direct pointer please
        MOV     r4, #0                          ; No %0
        MOV     r5, #0                          ; No %1
        MOV     r6, #0                          ; No %2
        MOV     r7, #0                          ; No %3
        SWI     XMessageTrans_Lookup
        MOVVC   r0, r2                          ; Result if no error
        EXIT


message_filename
        DCB     "Resources:$.Resources.StringLib.Messages", 0
        ALIGN


; Open the message file, using the 16 byte block passed in R11.
; Preserves all registers, if error then R0->error block, V set.

open_message_file_r11 Entry "r0-r2"
        MOV     r0, r11                         ; Block passed for file
        ADR     r1, message_filename
        MOV     r2, #0
        SWI     XMessageTrans_OpenFile          ; Open the file
        STRVS   r0, [sp]
        MOVVS   r11, #0                         ; Set handle to 0 on error
        EXIT


; Close the message file block passed in R11 (or ignore if 0).
; Preserves all registers, if error then R0->error block, V set.

close_message_file_r11 Entry "r0"
        SUBS    r0, r11, #0                     ; File handle (clears V!)
        EXIT    EQ                              ; No file so return zero

        SWI     XMessageTrans_CloseFile         ; Close the file.
        STRVS   r0, [sp]
        EXIT

        END
