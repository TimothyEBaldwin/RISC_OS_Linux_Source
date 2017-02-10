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
 ; ------------------------- Linear driver --------------------------

 ; ---------
installLinearDriver ROUT
        ; Set up the registers and table for
        ; Sound_LinearHandler and call installDriver
        Entry   , 32

        MOV     r0,#32
        ADR     r1,linearDriverToken
        MOV     r2,sp
        BL      msgLookupToken
        MOV     r3,sp                           ; Driver name

        ADD     r0,ws,#work_DriverEntryTable    ; Get table address

        ADR     r1,linearDriverInstall          ; Install entry
        STR     r1,[r0,#driverEntry_Install]

        ADR     r1,linearDriverRemove           ; Remove entry
        STR     r1,[r0,#driverEntry_Remove]

        ADR     r1,linearDriverSampleRate       ; Sample rate entry
        STR     r1,[r0,#driverEntry_SampleRate]

        MOV     r1,#0                           ; No volume entry
        STR     r1,[r0,#driverEntry_Volume]

        MOV     r1,#0
        STR     r1,[r0,#driverEntry_Mixer]      ; No mixer entry

        LDR     r1,[ws,#work_privateWord]       ; Parameter

        MOV     r2,#0                           ; Flags

        Debug   gn, "Install linear driver....."
        Debug   gn, " Table =",r0
        Debug   gn, " Parameter =",r1
        Debug   gn, " Flags =",r2
        DebugS  gn, " Name =",r3

        BL      installDriver

        EXIT

linearDriverToken
        DCB     "NmLin",0
        ALIGN

 ; ------

linearDriverInstall ROUT
        ; Install driver using Sound_LinearHandler
        ;  r0  = Handler address
        ;  r1  = Parameter to pass
        ;  ws = parameter for driver
        ;  lr already on stack
        Push    "r1-r11,ws"

        MOV     r5,r0                   ; Temorary store r0 and r1
        MOV     r6,r1

        MOV     r0,#0                   ; Get current handler to see if already installed
        SWI     XSound_LinearHandler

        CMP     r1,r5                   ; Same handler?
        CMPEQ   r2,r6                   ; Same parameter?

        BEQ     linearDriverInstallExit ; Jump out 'cos already there

        ; Now install new driver

        MOV     r0,#1                   ; Function code install
        MOV     r1,r5                   ; Address
        MOV     r2,r6                   ; Parameter
        SWI     XSound_LinearHandler

        MOV     r0,r5                   ; Restore r0 if successful
        MOVVS   r0,#0                   ; Or 0 if error

linearDriverInstallExit
        Pull    "r1-r11,ws,pc"

 ; -----------

linearDriverRemove ROUT
        ; Remove driver using Sound_LinearHandler
        ; lr already on stack
        Push    "r0-r2"

        ; To remove handler set new handler to 0
        MOV     r0,#1       ; Function code install
        MOV     r1,#0       ; Null handler
        MOV     r2,#0
        SWI     XSound_LinearHandler

        Pull    "r0-r2,pc"

 ; -----------

linearDriverSampleRate ROUT
        ; Choose rate and/or return current rate
        ;  r0 = 0 to read
        ;     > 0 to set to r0 = frequency
        ; On exit:
        ;  r0 = current frequency
        Push    "r1-r11,ws"

        CMP     r0,#0
        BEQ     linearDriverSampleRateRead
        ; Set the rate to r0
        ; Find the nearest
        MOV     r4,r0              ; r4 = rate required

        MOV     r0,#0              ; Read number of rates available
        SWI     XSound_SampleRate  ; r1 = number of rates available
        BVS     linearDriverSampleRateFailed

        MOV     r5,r1              ; r5 = Upper limit

linearDriverSampleRateLoop
        MOV     r0,#2              ; Convert from index to rate
        SWI     XSound_SampleRate  ; r2 = rate
        BVS     linearDriverSampleRateFailed
        CMP     r2,r4
        BLT     linearDriverSampleRateClosest  ; Best rate is between r1 and r5

        CMP     r1,#1              ; Are there any more rates
        MOVNE   r5,r1              ; Change upper limit
        MOVNE   r6,r2              ; Store upper rate
        SUBNE   r1,r1,#1           ; decrement index
        BNE     linearDriverSampleRateLoop  ; Try again

linearDriverSampleRateClosest
        ; Check for nearest between r1 and r5

        CMP     r1,r5                      ; No range to check
        BEQ     linearDriverSampleRateSet

        ; r2 = lower rate, r1 = index
        ; r6 = upper rate, r5 = index

        SUB     r2,r4,r2
        SUB     r6,r6,r4

        CMP     r2,r6       ; Who is nearest
        MOVGT   r1,r5       ; If nearest to r6 then set index to r5

linearDriverSampleRateSet
        ; Chosen index is r1
        MOV     r0,#3              ; Select rate from index in r1
        SWI     XSound_SampleRate
        BVS     linearDriverSampleRateFailed

linearDriverSampleRateRead
        MOV     r0,#1
        SWI     XSound_SampleRate  ; Frequency returned in r2
        BVS     linearDriverSampleRateFailed

        MOV     r0,r2               ; Return it in r0

linearDriverSampleRateExit
        Pull    "r1-r11,ws,pc"

linearDriverSampleRateFailed
        MOV     r0, #0 ; indicates failure
        B       linearDriverSampleRateExit

 ; -----------

        END
