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
        GBLL    CBAIDisableInt

; these are defined in global headers
; XOS_SWINumberFromString       *       &20039

; The process involves receiving a 'fill this buffer' instruction
; from a driver.
; The fill code then fills and mixes any available data from
; any immediate handlers whith each handler doing it's own mixing.
; Then any call back streams are called to give any available data
; with the fill code mixing it.
; Finally, call back streams are called to make sure that the call
; back buffer is full.
; At the end of each call back call process handlers can be called.
; The same handler code for each stage can be used with flags to
; indicate which type of handler is being processed ans with the
; data pointers set appropriately.

CBAIDisableInt  SETL {TRUE}

 ;-------------------------- Sound Handler Code ------------------------

stopSound       ROUT
        ; Make sure nothing is happening

        Entry   "r0"

        MOV     r0,#1
        STR     r0,[ws,#work_SoundPause]    ; Pause flag for handler routine

        ; Now wait until no sound is happening

stopSoundLoop


        LDR     r0,[ws,#work_SoundActive]   ; This will be set to 0 at then end of a fill
        CMP     r0,#0
        BNE     stopSoundLoop

        EXIT

 ; -----------

startSound      ROUT
        ; Set handler going again

        Entry   "r0"

        MOV     r0,#0
        STR     r0,[ws,#work_SoundPause]  ; Clear the pause flag

        ; Should check that there is a current driver and that it is active...

        EXIT
 ; -------------------------------

fill    ROUT
        ; Main fill call for output driver
        ; Can be called by a 16 or 8 bit driver
        ; It needs to collect and mix data into the final buffer
        ; converting the data if necessary.
        ; On entry:
        ;    r0 = parameter, this should be the SharedSound ws value
        ;    r1 = base of buffer
        ;    r2 = end of buffer
        ;    r3 = flags
        ;    r4 = sample frequency or period
        ; Added:
        ;    r5 = sample period

        Entry   "r0-r11,ws"

        LDR     ws,[r0]

        LDR     r0,[ws,#work_SoundPause]     ; Are we in pause state
        CMP     r0,#1
        BEQ     fillExit

        MOV     r0,#1
        STR     r0,[ws,#work_SoundActive]    ; Flag active

        ; If there is data in the buffer then this is shown in r3
        MOV     r5,r4
        LDR     r4,[ws,#work_SampleFrequency]         ; Put current rate into r4
        CMP     r4,r5

        BLNE    rateChange                             ; Set a call back to change values

        LDR     r5,[ws,#work_SamplePeriod]            ; Use old values for now

        ; First call any immediate handlers

        LDR     r6,[ws,#work_ImmediateHandlers]
        CMP     r6,#0
        MOVNE   r6,#handlerType_Immediate
        BLNE    handler

        ; Now get any callBack buffers and mix in
        LDR     r6,[ws,#work_CallBackHandlers]
        CMP     r6,#0
        BEQ     fillExit

        BL      addCallBackBuffer

        ; Finally initiate any callbacks required

        BL      callBackHandlerProcess


fillExit
        ; Do we need to pass the buffer on to SoundDriver for record?
        LDR     r0,[ws,#work_RecordOn]
        CMP     r0,#0
        BEQ     fillQuit

        ; Send to record

        ; r0 = Parameter
        ; r1 = Base
        ; r2 = End
        ; r3 = Handler number
        ; r4 = Sample frequency
        LDR     r0,[ws,#work_RecordHandlerParameter]
        LDR     r3,[ws,#work_RecordHandle]

        LDR     r9,[ws,#work_RecordHandlerAddress]
        CMP     r9,#0
        BEQ     fillQuit

        MOV     lr,pc   ; Return address
        MOV     pc,r9    ; Call handler

fillQuit
        MOV     r0,#0
        STR     r0,[ws,#work_SoundActive]    ; Flag finished

        EXIT

 ; ------------------

rateChange      ROUT
        ; Issue a call back to change the rate values
        Entry   "r0,r1"

 [ doCallBack
        ADR     r0,rateChangeCallBack
        LDR     r1,[ws,#work_privateWord]

        ; Change here from RJW; we may well be in IRQ mode here, so
        ; can't call SWIs directly. Instead jump to SVC mode and
        ; protect SVC_R14 first.
        Push    "R8,R9"

        SetMode SVC32_mode, R8, R9

        Push    "R14"

        SWI     XOS_AddCallBack

        Pull    "R14"
        RestPSR R9,,cf
        Pull    "R8,R9"


        EXIT
 |
        MOV     r0,r5   ; New frequency
        BL      newRate

        EXIT
 ]


 ; ---------


 [ doCallBack


rateChangeCallBack ROUT
        Entry   "r0-r11,ws"

        LDR     ws,[ws]         ; Get workspace pointer

        ; First get current sample frequency and sample period
        ; This is provided by the SampleRate routine
        MOV     r0,#0          ; Function code read
        BL      newSampleRate

        EXIT

 ]


 ; ---------------- Handler stuff ---------------

handler ROUT
        ; Dummy fill code
        ; Used to pass on control to chain of handlers
        ; The flags indicate which handlers to call
        ; There are three types - immediate, callback and process
        ; On entry:
        ;    r0 = parameter, this should be the SharedSound ws value
        ;    r1 = base of buffer
        ;    r2 = end of buffer
        ;    r3 = flags
        ;    r4 = sample frequency
        ;    r5 = sample period
        ;    r6 = Handler type

        ; Added by SharedSound before calling handlers

        ;    r6 = fraction step
        ;    r7 = LR Volume

        Entry   "r0-r2,r4-r11,ws"

        ; Now call each handler in turn, if they match the flag type

        MOV     r11,r6 ; Handler type

        ADD     r8,ws,#work_handlerTable       ; Address of table
        MOV     r9,#handlerMax                  ; Handler count

handlerLoop
        LDR     r10,[r8,#handler_Type]
        CMP     r10,r11
        BNE     handlerNext

        LDR     r10,[r8,#handler_Address]        ; Does this slot contain a handler?
        CMP     r10,#0
        BEQ     handlerNext

        Push    "r1,r2,r4,r5,r8,r9,r11,ws"      ; Will need these preserved

        LDR     r0,[r8,#handler_Parameter]
        LDR     r6,[r8,#handler_Fraction]
        LDR     r7,[r8,#handler_VolumeScaled]
        ADD     r8,ws,#work_FillcodeTable

        ; Set those extra flags
        CMN     r7,#1           ; If volume != 0xFFFFFFFF
        ORRNE   r3,r3,#1<<30    ; then set bit 30
        CMP     r7,#0           ; If volume == 0x00000000
        ORREQ   r3,r3,#1<<31    ; then set bit 31

        MOV     lr,pc
        MOV     pc,r10                            ; Jump to address
handlerReturn
        BIC     r3,r3,#3<<30    ; Clear the volume indicator bits
        Pull    "r1,r2,r4,r5,r8,r9,r11,ws"      ; Will need these preserved

handlerNext
        ADD     r8,r8,#handlerTableLen
        SUBS    r9,r9,#1
        BNE     handlerLoop

handlerExit
        EXIT

 ; ------------------- Call Back Handler routines

work_CallBack_BufferVal
        DCD     work_CallBack_Buffer

 ; ----

addCallBackBuffer ROUT
        ; Get pointer to call back buffer if it exists
        ; On entry:
        ;    r1 = base of buffer
        ;    r2 = end of buffer
        ;    r3 = flags
        ;    r4 = sample frequency
        ;    r5 = sample period
        ; On exit:
        ;    call back data mixed in if there is some

        Entry   "r0-r11,ws"

        SUB     r6,r2,r1
        LDR     r7,[ws,#work_CallBack_BufferSize]

        CMP     r6,r7

        ; If the buffer size has changed then need to make changes...
        STR     r6,[ws,#work_CallBack_BufferSize]

        LDR     r5,[ws,#work_CallBack_BufferFullCount]  ; Are there any full buffers?
        CMP     r5,#0
        BGT     addCallBackBuffer_OK

        ; Need to flag an overrun
        LDR     r5,[ws,#work_callBack_Active]  ; Is the old call back active?
        CMP     r5,#1

        ; If there are no full buffers and the call back is active then we have overrun
        LDREQ   r7,[ws,#work_callBack_Count]   ; If so then increment count and return
        ADDEQ   r7,r7,#1
        STREQ   r7,[ws,#work_callBack_Count]

        ; Need to do a volume shift on the buffer to effectivly mix an empty buffer
        ; into the existing data
        ; This avoids volume fluctuations

        ; r1 = Start of SoundDMA buffer
        ; r2 = End of SoundDMA buffer
        ; r6 = Length

  [ NoARMv6
addCallBackBuffer_VolumeShiftLoop
        LDMIA   r1,{r3-r6}

        MACRO
        acbb_vsl        $work1,$work2,$getReg
        ; Shift volumes
        MOV     $getReg,$getReg,ASR#1
        ; Now getReg is perfect except possibly for bit 15 that should be the same as
        ; bit 14. Form a word of differences between bits.
        EOR     $work1,$getReg,$getReg,LSL#1
        AND     $work1,$work1,#1<<15
        EOR     $getReg,$getReg,$work1
        MEND

        acbb_vsl        R11,R12,R3
        acbb_vsl        R11,R12,R4
        acbb_vsl        R11,R12,R5
        acbb_vsl        R11,R12,R6

        STMIA   r1!,{r3-r6}

        CMP     r1,r2
        BLT     addCallBackBuffer_VolumeShiftLoop
  |
        MOV     r11, #0
addCallBackBuffer_VolumeShiftLoop
        LDMIA   r1,{r3-r6}
        SHADD16 r3, r3, r11
        SHADD16 r4, r4, r11
        SHADD16 r5, r5, r11
        SHADD16 r6, r6, r11
        STMIA   r1!,{r3-r6}
        CMP     r1,r2
        BLT     addCallBackBuffer_VolumeShiftLoop
  ]

        B     addCallBackBuffer_Exit   ; No data available

addCallBackBuffer_OK
        ; There are buffers available so use one of these

        ; r1 = Start of SoundDMA buffer
        ; r2 = End of SoundDMA buffer
        ; r6 = Length

        LDR     r5,work_CallBack_BufferVal
        ADD     r5,r5,ws
        ;       Align
        ADD     r5,r5,#63
        BIC     r5,r5,#63
        LDR     r7,[ws,#work_CallBack_CurrentSoundBuffer]
        MLA     r0,r6,r7,r5                                    ; Buffer position

        ; r0 = Source buffer
        ; r1 = DMA buffer
        ; r2 = DMA buffer end
        ; r3 = Fill flags

        ; Copy across (mixing??)

        TST     r3,#1
        BNE     addCallBackBuffer_Mix

        ; No mixing

addCallBackBuffer_Loop
        LDMIA   r0!,{r3-r6}
        STMIA   r1!,{r3-r6}

        CMP     r1,r2
        BLT     addCallBackBuffer_Loop

        B       addCallBackBuffer_Final

addCallBackBuffer_Mix
  [ NoARMv6
        Push    "ws"

        MVN     r12,#0
        MOV     r12,r12,LSL#16

addCallBackBufferMix_Loop
        LDMIA   r0!,{r3-r6}
        LDMIA   r1,{r7-r10}

        MACRO
        acbbm_l $work1,$work2,$getReg,$mixReg
        ; getReg = abcdefgh
        ; mixReg = ijklmnop
        ; target = qrstuvwx
        ; work2 = 0xFFFF0000
        AND     $work1,$work2,$getReg,ASR#1             ; work1 = (abcD0000)>>>1
        MOV     $getReg,$getReg,LSL#16                  ; getReg=  efgh00000
        MOV     $getReg,$getReg,ASR#1                   ; getReg= (efgh00000)>>>1

        ADD     $work1,$work1,$mixReg,ASR#1             ; work1 = qrstXXXX
        MOV     $mixReg,$mixReg,LSL#16                  ; work2 = mnop0000
        ADD     $getReg,$getReg,$mixReg,ASR#1           ; getReg= uvwxXXXX
        AND     $work1,$work1,$work2                    ; work1 = qrst0000
        ORR     $getReg,$work1,$getReg,LSR#16           ; work1 = qrstuvwx
        MEND

        acbbm_l R11,R12,R3,R7
        acbbm_l R11,R12,R4,R8
        acbbm_l R11,R12,R5,R9
        acbbm_l R11,R12,R6,R10

        STMIA   r1!,{r3-r6}

        CMP     r1,r2
        BLT     addCallBackBufferMix_Loop

        Pull    "ws"
  |
addCallBackBufferMix_Loop
        LDMIA   r0!,{r3-r6}
        LDMIA   r1,{r7-r10}
        SHADD16 r3, r3, r7
        SHADD16 r4, r4, r8
        SHADD16 r5, r5, r9
        SHADD16 r6, r6, r10
        STMIA   r1!,{r3-r6}
        CMP     r1,r2
        BLT     addCallBackBufferMix_Loop
  ]

addCallBackBuffer_Final
        ; Increment current SoundDMA buffer

        LDR     r7,[ws,#work_CallBack_CurrentSoundBuffer]
        LDR     r8,[ws,#work_CallBack_numCallBackBuffers]
        ADD     r7,r7,#1
        CMP     r7,r8
        MOVGE   r7,#0
        STR     r7,[ws,#work_CallBack_CurrentSoundBuffer]

        ; Decrement full count
        LDR     r8,[ws,#work_CallBack_BufferFullCount]
        SUBS    r8,r8,#1
        MOVLT   r8,#0
        STR     r8,[ws,#work_CallBack_BufferFullCount]

addCallBackBuffer_Exit
        EXIT

 ; -------------------------------

callBackHandlerProcess ROUT

        ; On entry:
        ;    r1 = base of buffer
        ;    r2 = end of buffer
        ;    r3 = flags
        ;    r4 = sample frequency
        ;    r5 = sample period

        Entry   "r0-r11,ws"

        SUB     r6,r2,r1
        STR     r6,[ws,#work_CallBack_BufferSize]
        STR     r3,[ws,#work_CallBack_Flags]
        STR     r4,[ws,#work_CallBack_SampleFrequency]
        STR     r5,[ws,#work_CallBack_SamplePeriod]

        LDR     r5,[ws,#work_callBack_Active]  ; Set the call back active flag
        CMP     r5,#1
        BEQ     callBackHandlerProcess_Exit

        MOV     r5,#1
        STR     r5,[ws,#work_callBack_Active]  ; Set the call back active flag

        ; Set up new call back

 [ doCBAI

        ; Either by CBAI

        LDR     r0,[ws,#work_CBAIActive]
        CMP     r0,#1

        ADREQ   r0,CBAIRoutine
        STREQ   r0,[ws,#work_PollWord]
        BEQ     callBackHandlerProcess_Exit

        ; Or by old style Call backs

 ]

        ADR     r0,doHandlerCallBack
        LDR     r1,[ws,#work_privateWord]

        SetMode SVC32_mode, R8, R9
        Push    "lr"

        SWI     XOS_AddCallBack

        Pull    "lr"
        RestPSR R9,,cf

callBackHandlerProcess_Exit
        EXIT

 ; -------



 ; ---------------

doHandlerCallBack ROUT
        ; Called by call back system
        ; Needs to call the handler with the right parameters
        Entry   "r0-r11,ws"

        LDR     ws,[ws]

        ; From the start and end get the length and offset into the buffer
        ; by the current OutBuffer value

        LDR     r10,[ws,#work_CallBack_BufferSize]
        LDR     r0,[ws,#work_privateWord]
        LDR     r3,[ws,#work_CallBack_Flags]
        LDR     r4,[ws,#work_CallBack_SampleFrequency]
        LDR     r5,[ws,#work_CallBack_SamplePeriod]

doHandlerCallBack_Loop
        ;       r10 = Buffer length

        LDR     r2,work_CallBack_BufferVal
        ADD     r2,r2,ws
        ;       Align
        ADD     r2,r2,#63
        BIC     r2,r2,#63

        LDR     r7,[ws,#work_CallBack_CurrentOutBuffer]
        MLA     r1,r10,r7,r2                              ; Buffer address

        ADD     r2,r1,r10

        MOV     r3,#0                           ; Buffer invalid

        LDR     r8,[ws,#work_CallBackHandlers]
        CMP     r8,#0
        MOVNE   r6,#handlerType_CallBack
        BLNE    handler

        LDR     r8,[ws,#work_ProcessHandlers]
        CMP     r8,#0
        MOVNE   r6,#handlerType_Process
        BLNE    handler

 [  :LNOT:  CBAIDisableInt
        PHPSEI  r8,r9                  ; interrupts -> disabled
 ]
        ; increment full count
        ; Increment out buffer
        LDR     r7,[ws,#work_CallBack_CurrentOutBuffer]
        LDR     r9,[ws,#work_CallBack_numCallBackBuffers]
        ADD     r7,r7,#1
        CMP     r7,r9
        MOVGE   r7,#0
        STR     r7,[ws,#work_CallBack_CurrentOutBuffer]

        LDR     r7,[ws,#work_CallBack_BufferFullCount]
        ADD     r7,r7,#1
        CMP     r7,r9
        MOVGT   r7,r9
        STR     r7,[ws,#work_CallBack_BufferFullCount]

 [  :LNOT:  CBAIDisableInt
        PLP     r8                     ; Interrupts reenabled
 ]

        ; Check for full count = max
        ; Loop round if not

        CMP     r7,r9
        BLT     doHandlerCallBack_Loop

        ; Otherwise we have filled all the buffers and can return

        MOV     r5,#0
        STR     r5,[ws,#work_callBack_Active]  ; Call back completed

        EXIT

 ; ---------------

clearCallBackBuffer ROUT
        ; Initialise the call back buffer to 0
        Entry   "r0-r11,ws"

        MOV     r0,#0
        MOV     r1,#0
        MOV     r2,#0
        MOV     r3,#0

        LDR     r4,work_CallBack_BufferVal
        ADD     r4,r4,ws

        ADD   r4,r4,#63
        BIC     r4,r4,#63

        ADD   r5,r4,#callBackBufferLen

clearCallBackBuffer_Loop
        STMIA   r4!,{r0-r3}
        CMP     r4,r5
        BLT     clearCallBackBuffer_Loop

        EXIT


 ; ---------------

setHandlerType  ROUT
        ; Set the corresponding bit for this handler's number & type
        ; On entry:
        ;    r0 = Handler number
        ;    r4 = Type
        Entry   "r0-r4"

        MOV     r1,#1
        MOV     r0,r1,LSL r0          ; As a bit

        CMP     r4,#handlerType_Immediate
        LDREQ   r1,[ws,#work_ImmediateHandlers]
        ORREQ   r1,r1,r0
        STREQ   r1,[ws,#work_ImmediateHandlers]

        CMP     r4,#handlerType_CallBack
        LDREQ   r1,[ws,#work_CallBackHandlers]
        ORREQ   r1,r1,r0
        STREQ   r1,[ws,#work_CallBackHandlers]

        CMP     r4,#handlerType_Process
        LDREQ   r1,[ws,#work_ProcessHandlers]
        ORREQ   r1,r1,r0
        STREQ   r1,[ws,#work_ProcessHandlers]

        EXIT

 ; ---------

clearHandlerType ROUT
        ; Clear the corresponding bit for this handler's number & type
        ; On entry:
        ;    r0 = Handler number
        ;    r4 = Type
        Entry   "r0-r4"

        MOV     r1,#1
        MOV     r0,r1,LSL r0          ; As a bit

        CMP     r4,#handlerType_Immediate
        LDREQ   r1,[ws,#work_ImmediateHandlers]
        BICEQ   r1,r1,r0
        STREQ   r1,[ws,#work_ImmediateHandlers]

        CMP     r4,#handlerType_CallBack
        LDREQ   r1,[ws,#work_CallBackHandlers]
        BICEQ   r1,r1,r0
        STREQ   r1,[ws,#work_CallBackHandlers]

        CMP     r4,#handlerType_Process
        LDREQ   r1,[ws,#work_ProcessHandlers]
        BICEQ   r1,r1,r0
        STREQ   r1,[ws,#work_ProcessHandlers]

        EXIT


 ; -------------------- CBAI -----------------

 [ doCBAI

InstallCBAI     ROUT
        ; Install the CBAI stuff if module exists

        Entry   "r0-r11,ws"

        MOV     r0,#0
        STR     r0,[ws,#work_PollWord]

        MOV     r0,#0
        ADR     r1,CBAIString
        SWI     XOS_SWINumberFromString

        MOVVC   r0,#1
        MOVVS   r0,#0
        STR     r0,[ws,#work_CBAIActive]

        ADDVC   r0,ws,#work_PollWord
        MOVVC   r1,#&100000       ; Scheduling class
        LDRVC   r2,[ws,#work_privateWord]
        SWIVC   XCBAI_RegisterPollWord

        EXIT

 ; -----------------

CBAIString
        =       "CBAI_RegisterPollWord"
        DCB     0
        ALIGN

 ; -----------------

RemoveCBAI      ROUT
        ; De-register the CBAI pollword
        Entry   "r0-r11,ws"

        LDR     r0,[ws,#work_CBAIActive]
        CMP     r0,#1

        ADDEQ   r0,ws,#work_PollWord
        SWIEQ   XCBAI_DeregisterPollWord

        MOV     r0,#0
        STR     r0,[ws,#work_CBAIActive]

        EXIT

 ; -----------------

CBAIRoutine     ROUT
        ; Call back routine to call call back addresses

        Push    "r0-r11,ws"

 [ CBAIDisableInt
        PHPSEI  r8,r9                  ; interrupts -> disabled
 ]

        BL      doHandlerCallBack

 [ CBAIDisableInt
        PLP     r8                     ; Interrupts reenabled
 ]

        Pull    "r0-r11,ws,pc"

 ; -----------------
 ]

;;

        END
