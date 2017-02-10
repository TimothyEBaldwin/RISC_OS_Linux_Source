; Copyright (c) 1995, Expressive Software Projects
; All rights reserved.
; 
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
;     * Redistributions of source code must retain the above copyright
;       notice, this list of conditions and the following disclaimer.
;     * Redistributions in binary form must reproduce the above copyright
;       notice, this list of conditions and the following disclaimer in the
;       documentation and/or other materials provided with the distribution.
;     * Neither the name of Expressive Software Projects nor the names of its
;       contributors may be used to endorse or promote products derived from
;       this software without specific prior written permission.
; 
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
; DISCLAIMED. IN NO EVENT SHALL EXPRESSIVE SOFTWARE PROJECTS BE LIABLE FOR ANY
; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
; ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
; 

memoryStartVal
        DCD     memoryStart

 ;----

startMem
        Entry

        LDR     r3,memoryStartVal

        MOV     r0,#ModHandReason_Claim
        SWI     XOS_Module
        EXIT    VS         ;  Flag an error - and don't start module

        STR     r2,[ws]

        MOV     r10,ws     ; Use r10 as tempory private word pointer, for sound installation
        MOV     ws,r2
        STR     r3,[ws,#work_memSize]
        STR     r10,[ws,#work_privateWord]

        EXIT

 ; -------------------------------- Workspace routines ------------------------

initWorkspace   ROUT
        Entry

        ; Clear memory
        ADD     r1,ws,#:INDEX:work_privateWord + 4
        LDR     r2,memoryStartVal
        ADD     r2,r2,ws
        MOV     r0,#0

initWorkspace_Loop
        STR     r0,[r1],#4
        CMP     r1,r2
        BCC     initWorkspace_Loop

        ; Specific values......
        MOV     r0,#0
        STR     r0,[ws,#work_currentDriver] ; No driver installed yet

        STR     r0,[ws,#work_SampleFrequency]
        STR     r0,[ws,#work_SamplePeriod]

        STR     r0,[ws,#work_SoundActive]   ; No sound currently active

        STR     r0,[ws,#work_ControlWord]   ; Control word for Replay

        STR     r0,[ws,#work_ImmediateHandlers]
        STR     r0,[ws,#work_CallBackHandlers]
        STR     r0,[ws,#work_ProcessHandlers]

        ; Initialise the fillcode table
        MOV     r0,#0
        ADRL    r1,fill_silence
        ADRL    r2,fill_data
        ADD     lr,ws,#work_FillcodeTable
        STMIA   lr,{r0-r2}

        ; .. Initialise handler table by setting handler_Address entries to 0
        ADD     r0,ws,#work_handlerTable   ; Position of table
        MOV     r1,#handlerMax              ; Number in table
        MOV     r2,#0

initWorkHandlerTableLoop
        STR     r2,[r0,#handler_Address]    ; Store 0 in handler_Address
        ADD     r0,r0,#handlerTableLen      ; Increment to next table entry
        SUBS    r1,r1,#1                     ; Decrement count
        BNE     initWorkHandlerTableLoop    ; Branch to start of loop

        ; .. Initialise driver table by setting driver_Address entries to 0
        ADD     r0,ws,#work_driverTable    ; Position of table
        MOV     r1,#driverMax               ; Number in table
        MOV     r2,#0

initWorkDriverTableLoop
        STR     r2,[r0,#driver_Address]     ; Store 0 in handler_Address
        ADD     r0,r0,#driverTableLen       ; Increment to next table entry
        SUBS    r1,r1,#1                     ; Decrement count
        BNE     initWorkDriverTableLoop     ; Branch to start of loop

        MOV     r0,#0
        STR     r0,[ws,#work_callBack_Active]
        STR     r0,[ws,#work_callBack_Count]
        STR     r0,[ws,#work_CallBack_BufferFullCount]
        STR     r0,[ws,#work_CallBack_CurrentSoundBuffer]
        STR     r0,[ws,#work_CallBack_CurrentOutBuffer]

        MOV     r0,#defaultNumCallBackBuffers
        STR     r0,[ws,#work_CallBack_numCallBackBuffers]

        EXIT

        END
