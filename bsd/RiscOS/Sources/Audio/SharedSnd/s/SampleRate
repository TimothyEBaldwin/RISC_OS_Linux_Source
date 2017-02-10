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
 ; ------------------------------- Sample rate routines ----------------------

newRate ROUT
        ; Used from handler routine to sort out details
        ;  r0 = New frequency
        Entry   "r0-r11,ws"

        ; Need new sample period in r1

        LDR     r6,rateConst
        MOV     r2,r0
        BL      clockCalc

        MOV     r1,r3   ; Return sample period in r1

 ;      LDR     r3,rateConst   \ r3.r2
 ;      MOV     r2,#0
 ;      MOV     r4,r0    \ DIV frequency
 ;
 ;      BL      div      \ r3 = Sample period
 ;
 ;      MOV     r1,r3

        BL      newSampleRateSet

        EXIT



 ; ------------------



newSampleRate   ROUT
        ; The sample rate has changed,  sort it out
        ; On entry r0 = 0 to read, >0 to set new rate = r0

        Entry   "r0-r11,ws"

        Debug   gn,"New sample rate"

        BL      sampleRate  ; Returns r0 = frequency, r1 = period

        LDR     r2,[ws,#work_SampleFrequency] ; Has the rate changed?
        CMP     r0,r2
        BEQ     newSampleRateExit  ; Nothing to do

        BL      stopSound        ; Stop play and wait for fill to finish

        STR     r0,[ws,#work_SampleFrequency]  ; Store frequency
        STR     r1,[ws,#work_SamplePeriod]     ; Store sample period

        ; then calculate the fractional step for each handler

        ADD     r1,ws,#work_handlerTable   ; Get handler table

        MOV     r6,#handlerMax              ; Count

newSampleRateLoop
        LDR     r0,[r1,#handler_Address]    ; Is there a handler here?
        CMP     r0,#0
        BEQ     newSampleRateNext

        LDR     r0,[r1,#handler_SampleFrequency]
        CMP     r0,#0
        BEQ     newSampleRateNext                    ; No rate stored

        BL      sampleRateFraction

        STR     r0,[r1,#handler_Fraction]

newSampleRateNext
        ADD     r1,r1,#handlerTableLen
        SUBS    r6,r6,#1
        BNE     newSampleRateLoop

        BL      startSound       ; Start sound again

newSampleRateExit
        EXIT

 ; ---------

newSampleRateSet ROUT
        Entry

        STR     r0,[ws,#work_SampleFrequency]  ; Store frequency
        STR     r1,[ws,#work_SamplePeriod]     ; Store sample period

        ; then calculate the fractional step for each handler
        ADD     r1,ws,#work_handlerTable   ; Get handler table

        MOV     r6,#handlerMax              ; Count

newSampleRateSetLoop
        LDR     r0,[r1,#handler_Address]    ; Is there a handler here?
        CMP     r0,#0
        BEQ     newSampleRateSetNext

        LDR     r0,[r1,#handler_SampleFrequency]
        CMP     r0,#0
        BEQ     newSampleRateSetNext                    ; No rate stored

        BL      sampleRateFraction

        STR     r0,[r1,#handler_Fraction]

newSampleRateSetNext
        ADD     r1,r1,#handlerTableLen
        SUBS    r6,r6,#1
        BNE     newSampleRateSetLoop

        EXIT

 ; ---------

sampleRate      ROUT
        ; Set or read sample rate

        ; On entry:
        ;  r0 = 0 to read
        ;     > 0 for sample frequency required
        ; On exit:
        ;  r0 = current frequency      (provided by driver)
        ;  r1 = current sample period  (calculated by shared sound)
        Entry   "r2-r11,ws"

        BL      driverSampleRate                ; Get current rate from driver
        CMP     r0,#0                            ; Failed if 0
        BEQ     sampleRateExit

        ; r0  will return sample frequency.....

        ; Now calculate sample period

;       LDR     r3,rateConst   \ r3.r2
;       MOV     r2,#0
;       MOV     r4,r0    \ DIV frequency
;
;       BL      div

        LDR     r6,rateConst
        MOV     r2,r0
        BL      clockCalc

        MOV     r1,r3   ; Return sample period in r1

sampleRateExit
        EXIT

 ;----------

sampleRateFraction
        ; Get the fractional step required for given rate and current rate
        ; On entry:
        ;   r0 = Frequency required
        ; On exit:
        ;   r0 = Fraction in 8.24
        Entry   "r1-r11,ws"

        LDR     r2,[ws,#work_SampleFrequency]    ; Current frequency
        MOV     r6,r0                              ; Frequency required

        BL      clockCalc       ; Returns fraction in r3

        MOV     r0,r3            ; Return in r0

        EXIT

 ; ------------------

rateConst
        DCD     &3D090000

clockCalc       ROUT
        ; Calculate  fraction count
        ; Pass rate in r6, actual rate in r2
        Entry

        MOV     r9,r2      ; Store actual rate
        MOV     r4,r2      ; actual rate ready for next calculation

        MOV     r2,#0      ; Calculate whole part
        MOV     r3,r6
        ; r4=actual rate
        BL      div
        MOV     r10,r3
                         ; Calculate fraction
                         ; r2 = Remainder from above
        MOV     r3,#0
        ; r4=actual rate
        MOV     r4,r9
        BL      div

        MOV     r3,r3,LSR #8 ; 24 Bit fraction
        ADD     r3,r3,r10,LSL #24 ; 8 Bit whole part

        EXIT

div     ROUT
        ; Divide r3.r2 by r4 , r3 = result, r2 = remainder
        MOV     r5,#32 ; Number of bits in divisor
dloop
        MOVS    r3,r3,LSL #1
        MOV     r2,r2,LSL #1
        ORRCS   r2,r2,#1
        CMPS    r2,r4
        BCC     dnext
        SBC     r2,r2,r4
        ADD     r3,r3,#1
dnext
        SUBS    r5,r5,#1
        BNE     dloop
        MOV     pc,lr

        END
