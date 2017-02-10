; 
; Copyright (c) 2010, RISC OS Open Ltd
; All rights reserved.
; 
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met: 
;     * Redistributions of source code must retain the above copyright
;       notice, this list of conditions and the following disclaimer.
;     * Redistributions in binary form must reproduce the above copyright
;       notice, this list of conditions and the following disclaimer in the
;       documentation and/or other materials provided with the distribution.
;     * Neither the name of RISC OS Open Ltd nor the names of its contributors
;       may be used to endorse or promote products derived from this software
;       without specific prior written permission.
; 
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; POSSIBILITY OF SUCH DAMAGE.
; 

MessageFilename
        DCB     "Resources:$.Resources.VFPSupport.Messages", 0
        ALIGN

ReturnError_LR ; Translate R0 and exit using LR
        Push    "lr"
ReturnError_Stacked ; Translate R0 and exit using stacked address
        Push    "r1-r2,r4-r7"
        ; Check if we need to open the messages file
        LDR     r1, MessageFile_Open
        CMP     r1, #0
        BNE     %FT10
        MOV     r7, r0
        ADR     r0, MessageFile_Block
        ADR     r1, MessageFilename
        MOV     r2, #0
        SWI     XMessageTrans_OpenFile
        Pull    "r1-r2,r4-r7,pc",VS
        STR     r0, MessageFile_Open ; Any non-zero value will do
        MOV     r0, r7
10
        ADR     r1, MessageFile_Block
        MOV     r2, #0
        MOV     r4, #0
        MOV     r5, #0
        MOV     r6, #0
        MOV     r7, #0
        SWI     XMessageTrans_ErrorLookup
        Pull    "r1-r2,r4-r7,pc"

CloseMessages
        Entry
        LDR     r0, MessageFile_Open
        CMP     r0, #0
        EXIT    EQ
        MOV     r0, #0
        STR     r0, MessageFile_Open
        ADR     r0, MessageFile_Block
        SWI     XMessageTrans_CloseFile
        EXIT

        END
