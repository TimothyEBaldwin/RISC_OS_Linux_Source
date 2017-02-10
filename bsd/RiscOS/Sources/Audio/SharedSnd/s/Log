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
 [ doLog

installLogDriver ROUT
        ; Set up the registers and table for
        ; Sound_ChannelHandler and call installDriver
        Entry   , 32

        MOV     r0,#32
        ADR     r1,logDriverToken
        MOV     r2,sp
        BL      msgLookupToken
        MOV     r3,sp                           ; Driver name

        MOV     r0,#0
        STR     r0,[r12,#work_Log_InitedFully]

        ADD     R0,R12,#work_DriverEntryTable   ; Get table address

        ADR     R1,logDriverInstall             ; Install entry
        STR     R1,[R0,#driverEntry_Install]

        ADR     R1,logDriverRemove              ; Remove entry
        STR     R1,[R0,#driverEntry_Remove]

        ADR     R1,logDriverSampleRate          ; Sample rate entry
        STR     R1,[R0,#driverEntry_SampleRate]

        MOV     R1,#0                           ; No volume entry
        STR     R1,[R0,#driverEntry_Volume]

        MOV     R1,#0
        STR     R1,[R0,#driverEntry_Mixer]      ; No mixer entry

        LDR     R1,[R12,#work_privateWord]      ; Parameter
        MOV     R2,#0                           ; Flags

        Debug   gn, "Install log driver....."
        Debug   gn, " Table =",r0
        Debug   gn, " Parameter =",r1
        Debug   gn, " Flags =",r2
        DebugS  gn, " Name =",r3

        BL      installDriver

        EXIT

logDriverToken
        DCB     "NmLog",0
        ALIGN

; -----------

work_Log_OldConfigureVal
        DCD     work_Log_OldConfigure

work_Log_ChanTableVal
        DCD     work_Log_ChanTable

; ---------------

logDriverInstall ROUT
        ; Install driver using Sound_LinearHandler
        ;  R0  = Handler address
        ;  R1  = Parameter to pass
        ;  R12 = parameter for driver
        ;  R14 already on stack
        Push    "R1-R12"

        Debug   gn,"logDriverInstall: entered"

        LDR     R12,[R12]

        MOV     R6,R0

        ; For log driver we need to store the handle address provided and install
        ; our own code into Sound_Configure
        ; this routine will then provide a 16 bit buffer to the original handle and then
        ; convert it into the 8 bit buffer
        STR     R0,[R12,#work_Log_Handler]        ; Store handler and parameter to be called by log fill code
        STR     R1,[R12,#work_Log_Parameter]

        LDR     R0,[R12,#work_privateWord]        ; Need this for access to above and other values
        STR     R0,logDriver_WorkPtr              ; in a fixed location as ChannelHandler does not provide it

        ;BL     getLogLinPtr
        ;STR    R0,logLinTable_Ptr

        ; Check to see if the log handler is already in action and buffer set up
        MOV     R0,#0
        MOV     R1,#0
        MOV     R2,#0
        MOV     R3,#0
        MOV     R4,#0
        SWI     XSound_Configure

        TEQ     r3,#&FC000003 ; is it 'unset' (26-bit OS value) ?
        TEQNE   r3,#SoundSystemNIL ; check modern value
        TEQNE   r3,#0         ; in case anyone used 0 as well.
        MOVEQ   r0,#0

        DebugIf EQ,gn,"installLogDriver: Can't, no entry point"
        BEQ     installLogDriver_Cant

        LDR     R5,work_Log_OldConfigureVal
        ADD     R5,R12,R5 ; Preserve old values
        STMIA   R5,{R0-R4}

        ; Value for R3 is a table......
        LDR     R0,work_Log_ChanTableVal
        ADD     R0,R12,R0  ; Channel Handler table pointer

        CMP     R0,R3            ; Is it already installed?

        BEQ     logDriverInstallExit

        ; Set up Channel Handler table

 [ doLogDirect
        ADR     R1,logFillCode   ; Pointer to fill code
        STR     R1,[R0]

        ADR     R1,logNullCode   ; Overrun code
        STR     R1,[R0,#4]

        MOV     R1,#0
        STR     R1,[R0,#8]        ; Linear to log table
        STR     R1,[R0,#12]       ; Log scale table

        STR     R1,[R12,#work_OldLogFill]

        MOV     R3,R0   ; Put address into R3
 |
        LDR     R1,[R3]
        STR     R1,[R12,#work_OldLogFill]

        ADR     R1,logFillCode   ; Pointer to fill code
        STR     R1,[R3]

        ;ADR    R1,logNullCode   ; Overrun code
        ;STR    R1,[R0,#4]
        ;
        ;LDR    R1,[R3,#8]
        ;STR    R1,[R0,#8]        ; Linear to log table
        ;
        ;LDR    R1,[R3,#12]
        ;STR    R1,[R0,#12]       ; Log scale table
        ;
        ;MOV    R3,R0   ; Put address into R3

        MOV     R3,#0
 ]

        MOV     R0,#2+(1<<31)   ; Set for two channels (LR Stereo), top bit set to force SoundDMAx to pass it on
        MOV     R1,#0
        MOV     R2,#0

        ;MOV    R4,#&FC000003           ; no scheduler
        MOV     R4,#0

        SWI     XSound_Configure

        ; Now set the stereo positions
        MOV     R0,#1   ; Channel 0
        MVN     R1,#126 ; Full left
        SWI     XSound_Stereo
        STR     R1,[R12,#work_Log_OldLeft] ; Preserve old value

        MOV     R0,#2   ; Channel 1
        MOV     R1,#127   ; Full right
        SWI     XSound_Stereo
        STR     R1,[R12,#work_Log_OldRight] ; Preserve old vlaue

; mark us as fully initialised
        MOV     r0,#1
        STR     r0,[r12,#work_Log_InitedFully]

        MOV     R0,R6                   ; Restore R0 if successful
        ;MOVVS  R0,#0                   ; Or 0 if error

        ; ---- Now done by SoundDMAx module
        ;MOV    R0,#18
        ;ADR    R1,soundDMATitle
        ;SWI    "OS_Module"
        ;
        ;LDR    R2,[R3,#&20]    ; Get pointer to SWI handler
        ;ADD    R2,R2,R3
        ;LDR    R1,term         ; Get alternative
        ;STR    R1,[R2,#&14]    ; and patch in to Sound Configure branch code

installLogDriver_Cant

logDriverInstallExit

        Debug   gn,"logDriverInstall: exiting"

        Pull    "R1-R12,PC"

; ---

logDriver_WorkPtr
        DCD     0
; soundDMATitle
;       = "SoundDMA"
;       DCD     0

; -----------

logDriverRemove ROUT
        ; Remove driver using Sound_LinearHandler
        ; R14 already on stack

        Push    "R0-R5"

        LDR     R12,[R12]

; if we're not fully initialied, don't do anything
        LDR     r0,[r12,#work_Log_InitedFully]
        TEQ     r0,#1
        BNE     %FT90

        MOV     R0,#1   ; Channel 0
        LDR     R1,[R12,#work_Log_OldLeft] ; Preserve old value
        SWI     XSound_Stereo

        MOV     R0,#2   ; Channel 1
        LDR     R1,[R12,#work_Log_OldRight] ; Preserve old vlaue
        SWI     XSound_Stereo

        LDR     R5,work_Log_OldConfigureVal
        ADD     R5,R12,R5 ; Get old values
        LDMIA   R5,{R0-R4}

        ORR     R0,R0,#1<<31      ; Force SoundDMAx to pass it on
        SWI     XSound_Configure

        LDR     R0,[R12,#work_OldLogFill]
        STR     R0,[R3]

90
        Pull    "R0-R5,PC"

; -----------

logDriverSampleRate
        ; Choose rate and/or return current rate
        ;  R0 = 0 to read
        ;     > 0 to set to R0 = frequency
        ; On exit:
        ;  R0 = current frequency
        Push    "R1-R12"

        CMP     R0,#0
        BEQ     logDriverSampleRateRead

        ; Set the rate to R0
        ; Do this by calculating the period from the frequency

        LDR   R3,rateConst   ; R3.R2
        MOV     R2,#0
        MOV     R4,R0    ; DIV frequency

        BL      div

        ; R3 = nearest sample period, R2 = Remainder
        TST     R2,#1<<24
        ADDNE   R3,R3,#1

        MOV     R0,#0+(1<<31)  ; Force SoundDMAx to pass it on
        MOV     R1,#0
        MOV     R2,R3   ; New rate in r2
        MOV     R3,#0
        MOV     R4,#0

        SWI     XSound_Configure  ; Set new sample period
        BVS     logDriverSampleRateFailed

logDriverSampleRateRead
        MOV     R0,#0
        MOV     R1,#0
        MOV     R2,#0
        MOV     R3,#0
        MOV     R4,#0

        SWI     XSound_Configure  ; Get current sample period
        BVS     logDriverSampleRateFailed

        ; Sample period in R2
        ; Convert it into rate
        LDR     R3,rateConst
        MOV     R4,R2
        MOV     R2,#0
        BL      div

        ; Frequency in R3
        MOV     R0,R3               ; Return it in R0

logDriverSampleRateExit
        Pull    "R1-R12,PC"

logDriverSampleRateFailed
        MOV     r0, #0 ; indicates failure
        B       logDriverSampleRateExit

;------------

work_Log_16BitBufferVal
        DCD     work_Log_16BitBuffer

logFillR12
        DCD     0
logFillTemp
        DCD     0
logSoundOn
        DCD     0

; -------------

logNullCode


        MOV     PC,R14


; ----------

logFillCode     ROUT
        ; Entry point for channel handler call
        ; Will be called with Channel handler register settings
        ; Needs to then call SharedSound fill routine with modified parameters
        LDR     R0,logSoundOn
        CMP     R0,#1
        MOVEQ   PC,R14

        MOV     R0,#1
        STR     R0,logSoundOn

        Entry   "R0-R12"

        ; R8  = Sample period
        ; R10 = end of buffer
        ; R12 = start of buffer

        STR     R12,logFillR12

        LDR     R12,logDriver_WorkPtr
        LDR     R12,[R12]              ; Get SharedSound workspace pointer

        ; Either call old log code or SharedSound handler

        ; If there are no handlers installed then call the log code
        ; otherwise call SharedSound, but not both
        ADD     R0,R12,#work_handlerTable       ; Address of table
        MOV     R1,#handlerMax                  ; Handler count

logFillCode_CheckLoop

        LDR     R2,[R0,#handler_Address]        ; Does this slot contain a handler?
        CMP     R2,#0
        BNE     logFillCode_CallSharedSound

        ADD     R0,R0,#handlerTableLen
        SUBS    R1,R1,#1
        BNE     logFillCode_CheckLoop

        ; No handlers so use log code

        LDR     R2,[R12,#work_OldLogFill]
        CMP     R2,#0
        BEQ     logFillCode_chandReturn

        LDR     R12,logFillR12    ; Put start back at R12

        ;ADR   R14,logFillCode_chandReturn  ; StrongARM compliant
        MOV     R14,PC
        MOV     PC,R2                         ; And call old channel handler

logFillCode_chandReturn
        B       logFillCode_Exit

; ---

logFillCode_CallSharedSound   ; There are some handlers installed, so call those

        LDR     R9,logFillR12    ; Get old R12 into R9

        ; Call SharedSound code with:
        ;    R0 = parameter, this should be the SharedSound R12 value
        ;    R1 = base of buffer
        ;    R2 = end of buffer
        ;    R3 = flags
        ;    R4 = sample frequency
        ;    R12= workspace ptr
        ;    R14= return address

        ; See if sample period has changed
        MOV   R8,#48

        LDR     R6,[R12,#work_SamplePeriod]
        CMP     R6,R8                        ; Has it changed?
        LDREQ   R4,[R12,#work_SampleFrequency]
        BEQ     logFillCode_RateNoChange
;       STR     R8,[R12,#work_SamplePeriod]

        LDR     R3,rateConst
        MOV     R2,#0
        MOV     R4,R8
        BL      div
;       STR     R3,[R12,#work_SampleFrequency]
        MOV     R4,R3   ; Return sample frequency in R4


logFillCode_RateNoChange
        ; R4 = Sample frequency
        ; Address of shared sound routine
        ; Set up buffer stuff - length will depend on values passed by ChannelH
        ; Start of buffer
        LDR     R2,work_Log_16BitBufferVal
        ADD     R1,R12,R2

        SUB     R2,R10,R9        ; Buffer length
        ADD     R2,R1,R2,LSL #1  ; * 2 for 16 bit

        ; Actually need to get data from old buffer at R9

        ; Zero buffer

        MOV     R5,#0
        MOV     R6,#0
        MOV     R7,#0
        MOV     R8,#0
        MOV     R11,R1

logFillCode_ZeroLoop

        STMIA   R11!,{R5-R8}
        CMP     R11,R2
        BLT     logFillCode_ZeroLoop

        MOV     R3,#2   ; Flags

        LDR     R0,[R12,#work_Log_Parameter]

        Push    "R1,R2,R9" ; Store 8 bit buffer stuff

        LDR     R5,[R12,#work_Log_Handler]
;       ADR     R14,logFillCode_Return
        MOV     R14,PC
        MOV     PC,R5


logFillCode_Return

        Pull    "R1,R2,R10"

        ; R1  = Start of 16 Bit buffer
        ; R2  = End of 16 bit buffer
        ; R3  = Returned flags
        ; R10 = Start of 8 bit buffer

;       CMP   R3,#1  ; Data exists and must be mixed   - Not fully supported by SharedSound calling routines....!!!
;       If this was working we would not need to zero buffer as above
;
;       BNE   logFillCode_Exit  ; If none then return

        ; Then fill the channel handler buffer with logged versions of the 16 bit data

        ; Get log table pointer into R4

        ADR  R4,logTable

        ; Convert data

logFillCode_loop
        LDMIA   R1!,{R0,R3,R9,R11}   ; get 4 output values

        MOV     R5,R0,LSR#16
        SUB     R0,R0,R5,LSL#16
        LDRB    R6,[R4,R5,LSR#(16-logBits)]
        LDRB    R7,[R4,R0,LSR#(16-logBits)]
        MOV     R5,R3,LSR#16
        ORR     R6,R6,R7,LSL#8
        LDRB    R7,[R4,R5,LSR#(16-logBits)]
        SUB     R0,R3,R5,LSL#16
        LDRB    R0,[R4,R0,LSR#(16-logBits)]
        ORR     R6,R6,R7,LSL#16
        ORR     R6,R6,R0,LSL#24

        MOV     R5,R9,LSR#16
        SUB     R0,R9,R5,LSL#16
        LDRB    R7,[R4,R5,LSR#(16-logBits)]
        LDRB    R8,[R4,R0,LSR#(16-logBits)]
        MOV     R5,R11,LSR#16
        ORR     R7,R7,R8,LSL#8
        LDRB    R8,[R4,R5,LSR#(16-logBits)]
        SUB     R0,R11,R5,LSL#16
        ORR     R7,R7,R8,LSL#16
        LDRB    R8,[R4,R0,LSR#(16-logBits)]
        CMP     R1,R2
        ORR     R7,R7,R8,LSL#24

        STMIA   R10!,{R6,R7}
        BLT     logFillCode_loop
logFillCode_Exit
        ; And return
        MOV   R0,#0
        STR   R0,logSoundOn

        EXIT                            ; flags on exit have always been ignored

; --------------------

logTable ; 8K Lookup table using 13 bits of 16 bit number as lookup
        DCD &06040200
        DCD &0E0C0A08
        DCD &16141210
        DCD &1E1C1A18
        DCD &24222220
        DCD &28262624
        DCD &2C2A2A28
        DCD &302E2E2C
        DCD &34323230
        DCD &38363634
        DCD &3C3A3A38
        DCD &403E3E3C
        DCD &42424240
        DCD &44444442
        DCD &46464644
        DCD &48484846
        DCD &4A4A4A48
        DCD &4C4C4C4A
        DCD &4E4E4E4C
        DCD &5050504E
        DCD &52525250
        DCD &54545452
        DCD &56565654
        DCD &58585856
        DCD &5A5A5A58
        DCD &5C5C5C5A
        DCD &5E5E5E5C
        DCD &6060605E
        DCD &62626260
        DCD &62626262
        DCD &64646462
        DCD &64646464
        DCD &66666664
        DCD &66666666
        DCD &68686866
        DCD &68686868
        DCD &6A6A6A68
        DCD &6A6A6A6A
        DCD &6C6C6C6A
        DCD &6C6C6C6C
        DCD &6E6E6E6C
        DCD &6E6E6E6E
        DCD &7070706E
        DCD &70707070
        DCD &72727270
        DCD &72727272
        DCD &74747472
        DCD &74747474
        DCD &76767674
        DCD &76767676
        DCD &78787876
        DCD &78787878
        DCD &7A7A7A78
        DCD &7A7A7A7A
        DCD &7C7C7C7A
        DCD &7C7C7C7C
        DCD &7E7E7E7C
        DCD &7E7E7E7E
        DCD &8080807E
        DCD &80808080
        DCD &82828280
        DCD &82828282
        DCD &82828282
        DCD &82828282
        DCD &84848482
        DCD &84848484
        DCD &84848484
        DCD &84848484
        DCD &86868684
        DCD &86868686
        DCD &86868686
        DCD &86868686
        DCD &88888886
        DCD &88888888
        DCD &88888888
        DCD &88888888
        DCD &8A8A8A88
        DCD &8A8A8A8A
        DCD &8A8A8A8A
        DCD &8A8A8A8A
        DCD &8C8C8C8A
        DCD &8C8C8C8C
        DCD &8C8C8C8C
        DCD &8C8C8C8C
        DCD &8E8E8E8C
        DCD &8E8E8E8E
        DCD &8E8E8E8E
        DCD &8E8E8E8E
        DCD &9090908E
        DCD &90909090
        DCD &90909090
        DCD &90909090
        DCD &92929290
        DCD &92929292
        DCD &92929292
        DCD &92929292
        DCD &94949492
        DCD &94949494
        DCD &94949494
        DCD &94949494
        DCD &96969694
        DCD &96969696
        DCD &96969696
        DCD &96969696
        DCD &98989896
        DCD &98989898
        DCD &98989898
        DCD &98989898
        DCD &9A9A9A98
        DCD &9A9A9A9A
        DCD &9A9A9A9A
        DCD &9A9A9A9A
        DCD &9C9C9C9A
        DCD &9C9C9C9C
        DCD &9C9C9C9C
        DCD &9C9C9C9C
        DCD &9E9E9E9C
        DCD &9E9E9E9E
        DCD &9E9E9E9E
        DCD &9E9E9E9E
        DCD &A0A0A09E
        DCD &A0A0A0A0
        DCD &A0A0A0A0
        DCD &A0A0A0A0
        DCD &A2A2A2A0
        DCD &A2A2A2A2
        DCD &A2A2A2A2
        DCD &A2A2A2A2
        DCD &A2A2A2A2
        DCD &A2A2A2A2
        DCD &A2A2A2A2
        DCD &A2A2A2A2
        DCD &A4A4A4A2
        DCD &A4A4A4A4
        DCD &A4A4A4A4
        DCD &A4A4A4A4
        DCD &A4A4A4A4
        DCD &A4A4A4A4
        DCD &A4A4A4A4
        DCD &A4A4A4A4
        DCD &A6A6A6A4
        DCD &A6A6A6A6
        DCD &A6A6A6A6
        DCD &A6A6A6A6
        DCD &A6A6A6A6
        DCD &A6A6A6A6
        DCD &A6A6A6A6
        DCD &A6A6A6A6
        DCD &A8A8A8A6
        DCD &A8A8A8A8
        DCD &A8A8A8A8
        DCD &A8A8A8A8
        DCD &A8A8A8A8
        DCD &A8A8A8A8
        DCD &A8A8A8A8
        DCD &A8A8A8A8
        DCD &AAAAAAA8
        DCD &AAAAAAAA
        DCD &AAAAAAAA
        DCD &AAAAAAAA
        DCD &AAAAAAAA
        DCD &AAAAAAAA
        DCD &AAAAAAAA
        DCD &AAAAAAAA
        DCD &ACACACAA
        DCD &ACACACAC
        DCD &ACACACAC
        DCD &ACACACAC
        DCD &ACACACAC
        DCD &ACACACAC
        DCD &ACACACAC
        DCD &ACACACAC
        DCD &AEAEAEAC
        DCD &AEAEAEAE
        DCD &AEAEAEAE
        DCD &AEAEAEAE
        DCD &AEAEAEAE
        DCD &AEAEAEAE
        DCD &AEAEAEAE
        DCD &AEAEAEAE
        DCD &B0B0B0AE
        DCD &B0B0B0B0
        DCD &B0B0B0B0
        DCD &B0B0B0B0
        DCD &B0B0B0B0
        DCD &B0B0B0B0
        DCD &B0B0B0B0
        DCD &B0B0B0B0
        DCD &B2B2B2B0
        DCD &B2B2B2B2
        DCD &B2B2B2B2
        DCD &B2B2B2B2
        DCD &B2B2B2B2
        DCD &B2B2B2B2
        DCD &B2B2B2B2
        DCD &B2B2B2B2
        DCD &B4B4B4B2
        DCD &B4B4B4B4
        DCD &B4B4B4B4
        DCD &B4B4B4B4
        DCD &B4B4B4B4
        DCD &B4B4B4B4
        DCD &B4B4B4B4
        DCD &B4B4B4B4
        DCD &B6B6B6B4
        DCD &B6B6B6B6
        DCD &B6B6B6B6
        DCD &B6B6B6B6
        DCD &B6B6B6B6
        DCD &B6B6B6B6
        DCD &B6B6B6B6
        DCD &B6B6B6B6
        DCD &B8B8B8B6
        DCD &B8B8B8B8
        DCD &B8B8B8B8
        DCD &B8B8B8B8
        DCD &B8B8B8B8
        DCD &B8B8B8B8
        DCD &B8B8B8B8
        DCD &B8B8B8B8
        DCD &BABABAB8
        DCD &BABABABA
        DCD &BABABABA
        DCD &BABABABA
        DCD &BABABABA
        DCD &BABABABA
        DCD &BABABABA
        DCD &BABABABA
        DCD &BCBCBCBA
        DCD &BCBCBCBC
        DCD &BCBCBCBC
        DCD &BCBCBCBC
        DCD &BCBCBCBC
        DCD &BCBCBCBC
        DCD &BCBCBCBC
        DCD &BCBCBCBC
        DCD &BEBEBEBC
        DCD &BEBEBEBE
        DCD &BEBEBEBE
        DCD &BEBEBEBE
        DCD &BEBEBEBE
        DCD &BEBEBEBE
        DCD &BEBEBEBE
        DCD &BEBEBEBE
        DCD &C0C0C0BE
        DCD &C0C0C0C0
        DCD &C0C0C0C0
        DCD &C0C0C0C0
        DCD &C0C0C0C0
        DCD &C0C0C0C0
        DCD &C0C0C0C0
        DCD &C0C0C0C0
        DCD &C2C2C2C0
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C2C2C2C2
        DCD &C4C4C4C2
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C4C4C4C4
        DCD &C6C6C6C4
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C6C6C6C6
        DCD &C8C8C8C6
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &C8C8C8C8
        DCD &CACACAC8
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CACACACA
        DCD &CCCCCCCA
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CCCCCCCC
        DCD &CECECECC
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &CECECECE
        DCD &D0D0D0CE
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D0D0D0D0
        DCD &D2D2D2D0
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D2D2D2D2
        DCD &D4D4D4D2
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D4D4D4D4
        DCD &D6D6D6D4
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D6D6D6D6
        DCD &D8D8D8D6
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &D8D8D8D8
        DCD &DADADAD8
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DADADADA
        DCD &DCDCDCDA
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DCDCDCDC
        DCD &DEDEDEDC
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &DEDEDEDE
        DCD &E0E0E0DE
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E0E0E0E0
        DCD &E2E2E2E0
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E2E2E2E2
        DCD &E4E4E4E2
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E4E4E4E4
        DCD &E6E6E6E4
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E6E6E6E6
        DCD &E8E8E8E6
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &E8E8E8E8
        DCD &EAEAEAE8
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &EAEAEAEA
        DCD &ECECECEA
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &ECECECEC
        DCD &EEEEEEEC
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &EEEEEEEE
        DCD &F0F0F0EE
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F0F0F0F0
        DCD &F2F2F2F0
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F2F2F2F2
        DCD &F4F4F4F2
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F4F4F4F4
        DCD &F6F6F6F4
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F6F6F6F6
        DCD &F8F8F8F6
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &F8F8F8F8
        DCD &FAFAFAF8
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FAFAFAFA
        DCD &FCFCFCFA
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FCFCFCFC
        DCD &FEFEFEFC
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FEFEFEFE
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FFFFFFFF
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FDFDFDFD
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &FBFBFBFB
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F9F9F9F9
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F7F7F7F7
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F5F5F5F5
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F3F3F3F3
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &F1F1F1F1
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EFEFEFEF
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EDEDEDED
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &EBEBEBEB
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E9E9E9E9
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E7E7E7E7
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E5E5E5E5
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E3E3E3E3
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &E1E1E1E1
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DFDFDFDF
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DDDDDDDD
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &DBDBDBDB
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D9D9D9D9
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D7D7D7D7
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D5D5D5D5
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D3D3D3D3
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &D1D1D1D1
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CFCFCFCF
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CDCDCDCD
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &CBCBCBCB
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C9C9C9C9
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C7C7C7C7
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C5C5C5C5
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C3C3C3C3
        DCD &C1C1C1C1
        DCD &C1C1C1C1
        DCD &C1C1C1C1
        DCD &C1C1C1C1
        DCD &C1C1C1C1
        DCD &C1C1C1C1
        DCD &C1C1C1C1
        DCD &C1C1C1C1
        DCD &BFBFBFBF
        DCD &BFBFBFBF
        DCD &BFBFBFBF
        DCD &BFBFBFBF
        DCD &BFBFBFBF
        DCD &BFBFBFBF
        DCD &BFBFBFBF
        DCD &BFBFBFBF
        DCD &BDBDBDBD
        DCD &BDBDBDBD
        DCD &BDBDBDBD
        DCD &BDBDBDBD
        DCD &BDBDBDBD
        DCD &BDBDBDBD
        DCD &BDBDBDBD
        DCD &BDBDBDBD
        DCD &BBBBBBBB
        DCD &BBBBBBBB
        DCD &BBBBBBBB
        DCD &BBBBBBBB
        DCD &BBBBBBBB
        DCD &BBBBBBBB
        DCD &BBBBBBBB
        DCD &BBBBBBBB
        DCD &B9B9B9B9
        DCD &B9B9B9B9
        DCD &B9B9B9B9
        DCD &B9B9B9B9
        DCD &B9B9B9B9
        DCD &B9B9B9B9
        DCD &B9B9B9B9
        DCD &B9B9B9B9
        DCD &B7B7B7B7
        DCD &B7B7B7B7
        DCD &B7B7B7B7
        DCD &B7B7B7B7
        DCD &B7B7B7B7
        DCD &B7B7B7B7
        DCD &B7B7B7B7
        DCD &B7B7B7B7
        DCD &B5B5B5B5
        DCD &B5B5B5B5
        DCD &B5B5B5B5
        DCD &B5B5B5B5
        DCD &B5B5B5B5
        DCD &B5B5B5B5
        DCD &B5B5B5B5
        DCD &B5B5B5B5
        DCD &B3B3B3B3
        DCD &B3B3B3B3
        DCD &B3B3B3B3
        DCD &B3B3B3B3
        DCD &B3B3B3B3
        DCD &B3B3B3B3
        DCD &B3B3B3B3
        DCD &B3B3B3B3
        DCD &B1B1B1B1
        DCD &B1B1B1B1
        DCD &B1B1B1B1
        DCD &B1B1B1B1
        DCD &B1B1B1B1
        DCD &B1B1B1B1
        DCD &B1B1B1B1
        DCD &B1B1B1B1
        DCD &AFAFAFAF
        DCD &AFAFAFAF
        DCD &AFAFAFAF
        DCD &AFAFAFAF
        DCD &AFAFAFAF
        DCD &AFAFAFAF
        DCD &AFAFAFAF
        DCD &AFAFAFAF
        DCD &ADADADAD
        DCD &ADADADAD
        DCD &ADADADAD
        DCD &ADADADAD
        DCD &ADADADAD
        DCD &ADADADAD
        DCD &ADADADAD
        DCD &ADADADAD
        DCD &ABABABAB
        DCD &ABABABAB
        DCD &ABABABAB
        DCD &ABABABAB
        DCD &ABABABAB
        DCD &ABABABAB
        DCD &ABABABAB
        DCD &ABABABAB
        DCD &A9A9A9A9
        DCD &A9A9A9A9
        DCD &A9A9A9A9
        DCD &A9A9A9A9
        DCD &A9A9A9A9
        DCD &A9A9A9A9
        DCD &A9A9A9A9
        DCD &A9A9A9A9
        DCD &A7A7A7A7
        DCD &A7A7A7A7
        DCD &A7A7A7A7
        DCD &A7A7A7A7
        DCD &A7A7A7A7
        DCD &A7A7A7A7
        DCD &A7A7A7A7
        DCD &A7A7A7A7
        DCD &A5A5A5A5
        DCD &A5A5A5A5
        DCD &A5A5A5A5
        DCD &A5A5A5A5
        DCD &A5A5A5A5
        DCD &A5A5A5A5
        DCD &A5A5A5A5
        DCD &A5A5A5A5
        DCD &A3A3A3A3
        DCD &A3A3A3A3
        DCD &A3A3A3A3
        DCD &A3A3A3A3
        DCD &A3A3A3A3
        DCD &A3A3A3A3
        DCD &A3A3A3A3
        DCD &A3A3A3A3
        DCD &A1A1A1A1
        DCD &A1A1A1A1
        DCD &A1A1A1A1
        DCD &A1A1A1A1
        DCD &9F9F9F9F
        DCD &9F9F9F9F
        DCD &9F9F9F9F
        DCD &9F9F9F9F
        DCD &9D9D9D9D
        DCD &9D9D9D9D
        DCD &9D9D9D9D
        DCD &9D9D9D9D
        DCD &9B9B9B9B
        DCD &9B9B9B9B
        DCD &9B9B9B9B
        DCD &9B9B9B9B
        DCD &99999999
        DCD &99999999
        DCD &99999999
        DCD &99999999
        DCD &97979797
        DCD &97979797
        DCD &97979797
        DCD &97979797
        DCD &95959595
        DCD &95959595
        DCD &95959595
        DCD &95959595
        DCD &93939393
        DCD &93939393
        DCD &93939393
        DCD &93939393
        DCD &91919191
        DCD &91919191
        DCD &91919191
        DCD &91919191
        DCD &8F8F8F8F
        DCD &8F8F8F8F
        DCD &8F8F8F8F
        DCD &8F8F8F8F
        DCD &8D8D8D8D
        DCD &8D8D8D8D
        DCD &8D8D8D8D
        DCD &8D8D8D8D
        DCD &8B8B8B8B
        DCD &8B8B8B8B
        DCD &8B8B8B8B
        DCD &8B8B8B8B
        DCD &89898989
        DCD &89898989
        DCD &89898989
        DCD &89898989
        DCD &87878787
        DCD &87878787
        DCD &87878787
        DCD &87878787
        DCD &85858585
        DCD &85858585
        DCD &85858585
        DCD &85858585
        DCD &83838383
        DCD &83838383
        DCD &83838383
        DCD &83838383
        DCD &81818181
        DCD &81818181
        DCD &7F7F7F7F
        DCD &7F7F7F7F
        DCD &7D7D7D7D
        DCD &7D7D7D7D
        DCD &7B7B7B7B
        DCD &7B7B7B7B
        DCD &79797979
        DCD &79797979
        DCD &77777777
        DCD &77777777
        DCD &75757575
        DCD &75757575
        DCD &73737373
        DCD &73737373
        DCD &71717171
        DCD &71717171
        DCD &6F6F6F6F
        DCD &6F6F6F6F
        DCD &6D6D6D6D
        DCD &6D6D6D6D
        DCD &6B6B6B6B
        DCD &6B6B6B6B
        DCD &69696969
        DCD &69696969
        DCD &67676767
        DCD &67676767
        DCD &65656565
        DCD &65656565
        DCD &63636363
        DCD &63636363
        DCD &61616161
        DCD &5F5F5F5F
        DCD &5D5D5D5D
        DCD &5B5B5B5B
        DCD &59595959
        DCD &57575757
        DCD &55555555
        DCD &53535353
        DCD &51515151
        DCD &4F4F4F4F
        DCD &4D4D4D4D
        DCD &4B4B4B4B
        DCD &49494949
        DCD &47474747
        DCD &45454545
        DCD &43434343
        DCD &3F3F4141
        DCD &3B3B3D3D
        DCD &37373939
        DCD &33333535
        DCD &2F2F3131
        DCD &2B2B2D2D
        DCD &27272929
        DCD &23232525
        DCD &1B1D1F21
        DCD &13151719
        DCD &0B0D0F11
        DCD &03050709
 ]
        END
