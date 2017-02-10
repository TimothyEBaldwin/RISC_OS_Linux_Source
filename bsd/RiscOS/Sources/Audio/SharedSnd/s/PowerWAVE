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
 [ doDMI
installDMIDriver ROUT
        ; Set up the registers and table for
        ; PowerWAVE_LinearHandler and call installDriver
        Entry   , 32

        MOV     r0,#32
        ADR     r1,DMIDriverToken
        MOV     r2,sp
        BL      msgLookupToken
        MOV     r3,sp                           ; Driver name

        ADD     R0,R12,#work_DriverEntryTable  ; Get table address

        ADR     R1,DMIDriverInstall           ; Install entry
        STR     R1,[R0,#driverEntry_Install]

        ADR     R1,DMIDriverRemove            ; Remove entry
        STR     R1,[R0,#driverEntry_Remove]

        ADR     R1,DMIDriverSampleRate        ; Sample rate entry
        STR     R1,[R0,#driverEntry_SampleRate]

        MOV     R1,#0                             ; No volume entry
        STR     R1,[R0,#driverEntry_Volume]

        MOV     R1,#0
        STR     R1,[R0,#driverEntry_Mixer]       ; No mixer entry


        LDR     R1,[R12,#work_privateWord]       ; Parameter

        MOV     R2,#0                             ; Flags

        Debug   gn,"Install DMI driver....."
        Debug   gn, " Table =",r0
        Debug   gn, " Parameter =",r1
        Debug   gn, " Flags =",r2
        DebugS  gn, " Name =",r3

        BL      installDriver

        EXIT

DMIDriverToken
        DCB     "NmPow",0
        ALIGN

; ------

DMIDriverInstall ROUT
        ; Install driver using PowerWAVE_LinearHandler
        ;  R0  = Handler address
        ;  R1  = Parameter to pass
        ;  R12 = parameter for driver
        ;  R14 already on stack
        Push    "R1-R12"

        MOV     R5,R0                   ; Temorary store R0 and R1
        MOV     R6,R1

        MOV     R0,#0                   ; Get current handler to see if already installed
        SWI     XPowerWAVE_LinearHandler

        Debug   gn," Current handler =",r1

        CMP     R1,R5                   ; Same handler?
        CMPEQ   R2,R6                   ; Same parameter?

        BEQ     DMIDriverInstallExit ; Jump out 'cos already there

        Debug   gn, " Install new handler =",r5

        ; Now install new driver
        MOV     R0,#1                   ; Function code install
        MOV     R1,R5                   ; Address
        MOV     R2,R6                   ; Parameter
        SWI     XPowerWAVE_LinearHandler

        MOV     R0,R5                   ; Restore R0 if successful
        MOVVS   R0,#0                   ; Or 0 if error

DMIDriverInstallExit

        Pull    "R1-R12,PC"

; -----------

DMIDriverRemove ROUT
        ; Remove driver using PowerWAVE_LinearHandler
        ;  R14 already on stack

        Push    "R0-R2"

        ; To remove handler set new handler to 0
        MOV     R0,#1       ; Function code install
        MOV     R1,#0       ; Null handler
        MOV     R2,#0
        SWI     XPowerWAVE_LinearHandler

        Pull    "R0-R2,PC"

; -----------

DMIDriverSampleRate ROUT
        ; Choose rate and/or return current rate
        ;  R0 = 0 to read
        ;     > 0 to set to R0 = frequency
        ; On exit:
        ;  R0 = current frequency
        Push    "R1-R12"

        CMP     R0,#0
        BEQ     DMIDriverSampleRateRead

        ; Set the rate to R0
        ; Find the nearest
        MOV     R4,R0              ; R4 = rate required

        MOV     R0,#0              ; Read number of rates available
        SWI     XPowerWAVE_SampleRate  ; R1 = number of rates available

        MOV     R5,R1              ; R5 = Upper limit

DMIDriverSampleRateLoop
        MOV     R0,#2              ; Convert from index to rate
        SWI     XPowerWAVE_SampleRate  ; R2 = rate
        CMP     R2,R4
        BLT     DMIDriverSampleRateClosest  ; Best rate is between R1 and R5

        CMP     R1,#1              ; Are there any more rates
        MOVNE   R5,R1              ; Change upper limit
        MOVNE   R6,R2              ; Store upper rate
        SUBNE   R1,R1,#1           ; decrement index
        BNE     DMIDriverSampleRateLoop  ; Try again

DMIDriverSampleRateClosest   ; Check for nearest between R1 and R5
        CMP     R1,R5                      ; No range to check
        BEQ     DMIDriverSampleRateSet

        ; R2 = lower rate, R1 = index
        ; R6 = upper rate, R5 = index
        SUB     R2,R4,R2
        SUB     R6,R6,R4

        CMP     R2,R6       ; Who is nearest
        MOVGT   R1,R5       ; If nearest to R6 then set index to R5

DMIDriverSampleRateSet
        ; Chosen index is R1

        MOV     R0,#3              ; Select rate from index in R1
        SWI     XPowerWAVE_SampleRate

DMIDriverSampleRateRead
        MOV     R0,#1
        SWI     XPowerWAVE_SampleRate  ; Frequency returned in R2

        MOV     R0,R2               ; Return it in R0

        Pull    "R1-R12,PC"

; -----------

DMIDriverName
        = "PowerWAVE Linear Handler",0
        ALIGN
 ]
        END
