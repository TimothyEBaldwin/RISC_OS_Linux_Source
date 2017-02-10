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
 ; ------------------- SWI Code --------------

swiControlWord  ROUT
        ; Provides the address of a control word
        ; used by Replay for 1 of n playback
        ; On entry:
        ;    none
        ; On exit:
        ;    r0 = control word address
        ADD     r0,ws,#work_ControlWord
        MOV     pc,lr

 ; -------------

 [ debugxc

swiTest ROUT
        ; Test stuff
        Entry


        EXIT

 ;----------

swiInfo ROUT
        ; Get info
        Entry

        LDR     r0,[ws,#work_SampleFrequency]
        LDR     r1,[ws,#work_SamplePeriod]

        EXIT


 ; ---------

 ]

swiInstallHandler ROUT
        ; Install a linear handler
        ; On entry:
        ;  r0 = Handler address
        ;  r1 = parameter to pass
        ;  r2 = flags
        ;  r3 = name of handler
        ;  r4 = Type if bit 0 of flags = 1
        ; On exit:
        ;  r0 = Handler number
        Entry   "r1-r11,ws"

        Debug   sw,"Install handler"

        CMP     r0,#0                     ; Check handler address non-zero
        BEQ     swiInstallHandlerExitExit

        ADD     r8,ws,#work_handlerTable ; Get address of table
        MOV     r6,#handlerMax            ; Maximum number available

        ; Look first for handler already exists

swiInstallHandlerCheckSlot
        LDR     r5,[r8,#handler_Address]
        CMP     r5,r0                         ; Check address
        BNE     swiInstallHandlerCheckNext   ; Not equal

        LDR     r7,[r8,#handler_Parameter]   ; Check parameter
        CMP     r7,r1
        BEQ     swiInstallHandlerGo          ; Address & Parameter are same so tidy rest of entry

swiInstallHandlerCheckNext
        ADD     r8,r8,#handlerTableLen   ; Try next slot
        SUBS    r6,r6,#1
        BNE     swiInstallHandlerCheckSlot

        ; OK so doesn't already exist
        ; Now look for an empty slot
        ADD     r8,ws,#work_handlerTable ; Get address of table
        MOV     r6,#handlerMax            ; Maximum number available

swiInstallHandlerFindSlot
        LDR     r5,[r8,#handler_Address]
        CMP     r5,#0
        BEQ     swiInstallHandlerGo       ; Free slot

        ADD     r8,r8,#handlerTableLen   ; Try next slot
        SUBS    r6,r6,#1
        BNE     swiInstallHandlerFindSlot

        ; No more slots available

        B       installMaxError

swiInstallHandlerGo
        ; OK So enter new handler
        ; r8 = slot pointer
        BL      stopSound                ; Make sure nothing happening

        STR     r0,[r8,#handler_Address]
        STR     r1,[r8,#handler_Parameter]
        STR     r2,[r8,#handler_Flags]

        TST     r2,#1    ; Type in r4 if flags bit 0 set, otherwise set to 0 (immediate)
        MOVEQ   r4,#handlerType_Default
        STR     r4,[r8,#handler_Type]     ; Type

        ; Set handler type variables
        RSB     r0,r6,#handlerMax    ; Handler number

        BL      setHandlerType

        ; Name
        ADD     r5,r8,#handler_Name       ; Position of name
        MOV     r2,#handlerNameLen        ; Make sure we don't overflow
        SUB     r2,r2,#1

swiInstallHandlerNameLoop
        LDRB    r7,[r3],#1
        STRB    r7,[r5],#1
        SUBS    r2,r2,#1     ; If we have reached 31 then force a 0 into name buffer
        MOVEQ   r7,#0
        STREQB  r7,[r5]

        CMPNE   r7,#0        ; Look for 0 terminator if end of name length not reached
        BNE     swiInstallHandlerNameLoop  ; Carry on with name


        ; And initialise the other parameters in the table
        MOV     r0,#0                       ; Volume LR
        SUB     r0,r0,#1                    ; = &FFFF FFFF
        STR     r0,[r8,#handler_Volume]

        MOV     r0,r8                       ; Set up scaled volume
        BL      scaleHandlerVolume

        MOV     r0,#0
        STR     r0,[r8,#handler_SampleFrequency] ; Rate not defined

        MOV     r0,#1<<24
        STR     r0,[r8,#handler_Fraction]   ; Initialise fraction to 1


swiInstallHandlerExit
        BL      startSound                   ; Set sound going again and provoke a driver check

        RSB     r0,r6,#handlerMax            ; Return handler number
        ADD     r0,r0,#1                      ; In the range 1 - handlerMax
swiInstallHandlerExitExit
        CLRV
        EXIT

 ;

installMaxError

        PullEnv
        ADR     r0,ErrorBlock_SSound_MaxHandlers
        B       msgLookupError

        MakeInternatErrorBlock SSound_MaxHandlers,,EMaxH

 ; -----------

swiRemoveHandler ROUT
        ; Remove a particular handler
        ; Slot number in r0, 1 - 10
        Entry   "r0-r11,ws"

        Debug   sw,"Remove handler"

        ADD     r1,ws,#work_handlerTable
        SUB     r0,r0,#1                   ; 1-10 becomes 0-9

        CMP     r0,#handlerMax            ; If > max then error
        BHS     swiHandlerNumError

        MOV     r3,#handlerTableLen
        MLA     r2,r3,r0,r1

        LDR     r1,[r2,#handler_Address]   ; Does this handler exist?
        CMP     r1,#0
        BEQ     swiHandlerExistError       ; If not then exit

        ; r0 = Handler number (0-n)

        LDR     r4,[r2,#handler_Type]
        BL      clearHandlerType

        BL      stopSound         ; Stop sound and wait for end of buffer fill

        MOV     r0,#0                       ; Remove involves simply setting Address to 0
        STR     r0,[r2,#handler_Address]

        BL      startSound

        CLRV
        EXIT

 ;
swiHandlerNumError
        PullEnv
swiHandlerNumError1
        ADR     r0,ErrorBlock_SSound_BadHandler
        B       msgLookupError

        MakeInternatErrorBlock SSound_BadHandler,,EOutR

swiHandlerExistError
        PullEnv
swiHandlerExistError1
        ADR     r0,ErrorBlock_SSound_NoSuchHandler
        B       msgLookupError

        MakeInternatErrorBlock SSound_NoSuchHandler,,ENIns
        
 ; -----------

swiHandlerType  ROUT
        ; Set the type of the handler
        ; On entry:
        ;    r0 = handler number
        ;    r1 = Type
        ; On exit:
        Entry   "r6-r11,ws"

        MOV     r7,r1   ; Type into r7

        ADD     r1,ws,#work_handlerTable
        SUB     r0,r0,#1                   ; 1-10 becomes 0-9

        CMP     r0,#handlerMax            ; If > max then error
        PullEnv HS
        BHS     swiHandlerNumError1

        MOV     r3,#handlerTableLen
        MLA     r6,r3,r0,r1

        LDR     r1,[r6,#handler_Address]   ; Does this handler exist?
        CMP     r1,#0
        PullEnv EQ
        BEQ     swiHandlerExistError1       ; If not then exit

        ; r0 = Handler number (0-n)

        LDR     r4,[r6,#handler_Type]
        BL      clearHandlerType

        STR     r7,[r6,#handler_Type]
        MOV     r4,r7
        BL      setHandlerType

        EXIT


 ; -----------

swiHandlerInfo  ROUT
        ; r0 = handler number
        ; On exit:
        ;  r0 = number of next available handler or 0 for none
        ;  r1 = flags
        ;  r2 = name
        ;  r3 = Sample frequency
        ;  r4 = Sample type
        ;  r5 = Volume

        Entry   "r6-r11,ws"

        Debug   sw,"Handler info"

        ADD     r1,ws,#work_handlerTable
        SUB     r0,r0,#1                   ; 1-10 becomes 0-9

        ; RJW; if r0 = 0 (so -1 now) on entry return number of first handler in r0
        CMN     r0,#1
        BEQ     swiHandlerInfoFindFirst

        CMP     r0,#handlerMax            ; If > max then error
        PullEnv HS
        BHS     swiHandlerNumError1

        MOV     r3,#handlerTableLen
        MLA     r6,r3,r0,r1

        LDR     r1,[r6,#handler_Address]   ; Does this handler exist?
        CMP     r1,#0
        PullEnv EQ
        BEQ     swiHandlerExistError1       ; If not then exit

        ; Get handler values
        LDR     r1,[r6,#handler_Flags]
        ADD     r2,r6,#handler_Name
        LDR     r3,[r6,#handler_SampleFrequency]
        LDR     r4,[r6,#handler_Type]
        LDR     r5,[r6,#handler_Volume]

        ; Now find next handler

swiHandlerInfoLoop
        ADD     r0,r0,#1
        CMP     r0,#handlerMax
        MOVEQ   r0,#0
        BEQ     swiHandlerInfoExit

        ADD     r6,r6,#handlerTableLen    ; Try next one
        LDR     r7,[r6,#handler_Address]  ; Does it exist?
        CMP     r7,#0
        BEQ     swiHandlerInfoLoop        ; No, then try next one

        ; RJW; Put result back into 1-10 range.
        ADD     R0,R0,#1

swiHandlerInfoExit
        CLRV
        EXIT

swiHandlerInfoFindFirst
        ; r0 = -1
        ; r1 = pointer to work_handlerTable
        ADD     r0,r0,#1
swiHandlerInfoFindFirst_lp
        ; r0 = handler number we are checking (0-9)
        ADD     r0,r0,#1                ; r0 = handler number in (1-10)
        CMP     r0,#handlerMax
        MOVEQ   r0,#0
        BEQ     swiHandlerInfoExit

        LDR     r2,[r1,#handler_Address]
        ADD     r1,r1,#handlerTableLen
        CMP     r2,#0
        BEQ     swiHandlerInfoFindFirst_lp

        CLRV
        EXIT

 ; -----------

swiSampleRate   ROUT
        ; Either set the current driver rate
        ; or set the rate for a particular handler
        ; On entry:
        ;  r0 = 0 for set driver rate
        ;     > 0 for handler number
        ;  r1 = sample frequency required
        ;       if 0 then use current rate
        ; On exit:
        ;  r1 = actual sample rate
        ;  r2 = sample period
        ;  r3 = fractional step used get the required rate

        Entry   "r4-r11,ws"

        Debug   sw,"Sample rate"

        CMP     r0,#0
        BNE     swiSampleRateDo

        ; Set driver rate
        MOV     r0,r1              ; Move rate into r0
        BL      newSampleRate     ; Sets new rate across all handlers
                              ; all registers preserved

        ;LDR    r0,[ws,#work_SampleFrequency]

        Debug   sw,"Sample rate =",r0

        BL      sampleRateFraction      ; Get fraction value with r0 = frequency
                                        ; return fraction in r0
        B       swiSampleRateExit


swiSampleRateDo
        ; Find handler

        ADD     r2,ws,#work_handlerTable
        SUB     r0,r0,#1                   ; 1-10 becomes 0-9

        CMP     r0,#handlerMax            ; If > max then error
        PullEnv HS
        BHS     swiHandlerNumError1

        MOV     r3,#handlerTableLen
        MLA     r6,r3,r0,r2

        LDR     r2,[r6,#handler_Address]   ; Does this handler exist?
        CMP     r2,#0
        PullEnv EQ
        BEQ     swiHandlerExistError1       ; If not then exit

        ; Get fraction
        CMP     r1,#0
        LDREQ   r0,[ws,#work_SampleFrequency]
        MOVNE   r0,r1
        BL      sampleRateFraction          ; Return fraction in r0

        ;  Store values in handler table

        CMP     r1,#0
        LDREQ   r1,[ws,#work_SampleFrequency]
        STR     r1,[r6,#handler_SampleFrequency]
        STR     r0,[r6,#handler_Fraction]

swiSampleRateExit
        MOV     r3,r0                         ; Set up return values
        LDR     r1,[ws,#work_SampleFrequency]
        LDR     r2,[ws,#work_SamplePeriod]

        CLRV
        EXIT

 ; -----------

swiHandlerVolume ROUT
        ; Set a handler's volume
        ; On entry:
        ;  r0 = handler number
        ;  r1 = LR volume to set
        ; On exit:
        ;  r1 = current volume

        Entry   "r0,r2-r11,ws"

        Debug   sw,"Handler Volume"

        ; Find handler
        ADD     r4,ws,#work_handlerTable
        SUB     r0,r0,#1                   ; 1-10 becomes 0-9

        CMP     r0,#handlerMax            ; If > max then error
        PullEnv HS
        BHS     swiHandlerNumError1

        MOV     r3,#handlerTableLen
        MLA     r6,r3,r0,r4

        LDR     r4,[r6,#handler_Address]   ; Does this handler exist?
        CMP     r4,#0
        PullEnv EQ
        BEQ     swiHandlerExistError1       ; If not then exit

        STR     r1,[r6,#handler_Volume]     ; Set volume
        MOV     r0,r6
        BL      scaleHandlerVolume          ; r0 = handler table entry ptr

        LDR     r1,[r6,#handler_Volume]     ; Read result

        CLRV
        EXIT

 ; -----------

swiHandlerSampleType ROUT
         ; Not in this version

        Entry

        Debug   sw,"Handler sample type"

        EXIT

 ; -----------

swiHandlerPause ROUT
        ; Not in this version

        Entry

        Debug   sw,"Handler pause"

        EXIT

 ; -----------

swiInstallDriver ROUT
        ; Install or make active a driver
        ;  r0 = Pointer to driver table address
        ;       or 1 = Linear
        ;       or 2 = Log
        ;  r1 = parameter to pass driver in ws when called
        ;  r2 = flags
        ;  r3 = Volume

        Entry   "r0-r11,ws"

        Debug   sw,"Install driver"

        ; If r0 = 1 or 2 then Linear or Log
        ; Otherwise regard this as a new driver
        CMP     r0,#2
        BHI     swiInstallDriverTable   ; >2 is a pointer

        CMP     r0,#1
        BHI     swiInstallDriverLog     ; =2
        BLEQ    installLinearDriver     ; =1
        B       swiInstallDriverExit    ; =0

swiInstallDriverLog

 [ doLog
        BL      installLogDriver
 ]
        B       swiInstallDriverExit

swiInstallDriverTable
        BL      installDriver               ; Simply pass on to this routine

swiInstallDriverExit
        CLRV
        EXIT

 ; -----------

swiRemoveDriver ROUT
        ; Remove a driver from the driver table
        ; On entry:
        ;   r0 = driver number
        ;        cannot remove driver 1 as this is the default driver

        Entry   "r0-r11,ws"

        Debug   sw,"Remove Driver"

        ; First check parameter
        ADD     r4,ws,#work_driverTable
        SUBS    r0,r0,#1                   ; 1-10 becomes 0-9

        BEQ     swiRemoveDriverError      ; = 0 , cannot remove the default driver

        CMP     r0,#driverMax             ; >= max
        BHS     swiDriverNumError

        ; Does the driver exist?

        MOV     r3,#driverTableLen
        MLA     r6,r3,r0,r4

        LDR     r4,[r6,#driver_Address]     ; Does this handler exist?
        CMP     r4,#0
        BEQ     swiDriverExistError         ; If not then exit

        ; is driver current

        SUB     r4,r6,ws
        LDR     r0,[ws,#work_currentDriver]
        CMP     r4,r0
        BNE     swiRemoveDriverNext

        ; if it is then release it first
        BL      releaseDriver

        ; and make sure at least the default driver is installed instead
        MOV     r0,#1              ; Default driver
        BL      swiInstallDriver

swiRemoveDriverNext
        ; Now remove the driver entry
        MOV     r0,#0
        STR     r0,[r6,#driver_Address]

        CLRV
        EXIT

 ; -----------

swiDriverNumError
        PullEnv
swiDriverNumError1
        ADR     r0,ErrorBlock_SSound_BadDriver
        B       msgLookupError

        MakeInternatErrorBlock SSound_BadDriver,,EDNum

swiDriverExistError
        PullEnv
swiDriverExistError1
        ADR     r0,ErrorBlock_SSound_NoSuchDriver
        B       msgLookupError

        MakeInternatErrorBlock SSound_NoSuchDriver,,ENoDr

swiRemoveDriverError
        PullEnv
        ADR     r0,ErrorBlock_SSound_CannotRemoveDriver
        B       msgLookupError

        MakeInternatErrorBlock SSound_CannotRemoveDriver,,ECant

 ; -----------

swiDriverInfo   ROUT
        ;  r0 = driver number
        ; On exit:
        ;  r0 = number of next available driver or 0 for none
        ;  r1 = flags
        ;  r2 ->name
        ;  r3 = Volume
        ;  r4 = Overrun count

        Entry   "r5-r11,ws"

        Debug   sw,"Driver info"

        ADD     r4,ws,#work_driverTable
        SUB     r0,r0,#1                   ; 1-10 becomes 0-9

        CMP     r0,#driverMax             ; >= max
        PullEnv HS
        BHS     swiDriverNumError1

        ; Does the driver exist?
        MOV     r3,#driverTableLen
        MLA     r6,r3,r0,r4

        LDR     r4,[r6,#driver_Address]     ; Does this handler exist?
        CMP     r4,#0
        PullEnv EQ
        BEQ     swiDriverExistError1         ; If not then exit

        ; Get driver values

        ;LDR    r1,[r6,#driver_Flags]
        LDR     r4,[ws,#work_currentDriver] ; Set flag according to = current driver
        ADD     r4,r4,ws
        CMP     r4,r6
        MOVEQ   r1,#1        ; 1 if current
        MOVNE   r1,#0        ; 0 if not

        ADD     r2,r6,#driver_Name
        LDR     r3,[r6,#driver_Volume]

        ; Now find next driver, if it exists

swiDriverInfoLoop
        ADD     r0,r0,#1
        CMP     r0,#driverMax
        MOVEQ   r0,#0
        BEQ     swiDriverInfoExit

        ADD   r6,r6,#driverTableLen    ; Try next one
        LDR     r7,[r6,#driver_Address]  ; Does it exist?
        CMP     r7,#0
        BEQ     swiDriverInfoLoop        ; No, then try next one

swiDriverInfoExit
        LDR     r4,[ws,#work_callBack_Count]

        CLRV
        EXIT

 ; -----------

swiDriverVolume ROUT
        ; Set the volume for a driver
        ; On entry:
        ;    r0 = driver number
        ;    r1 = new volume
        ; On exit:
        ;    r0 = current volume
        Entry   "r1-r11,ws"

        Debug   sw,"Driver volume"

        ADD     r4,ws,#work_driverTable
        SUB     r0,r0,#1                   ; 1-10 becomes 0-9

        CMP     r0,#driverMax             ; >= max
        PullEnv HS
        BHS     swiDriverNumError1

        ; Does the driver exist?
        MOV     r3,#driverTableLen
        MLA     r6,r3,r0,r4

        LDR     r4,[r6,#driver_Address]     ; Does this handler exist?
        CMP     r4,#0
        PullEnv EQ
        BEQ     swiDriverExistError1         ; If not then exit

        MOV     r0,r1      ; Volume
        MOV     r1,r6      ; Table address
        BL      driverVolume                 ; Set driver volume to r0

        ; Note that when the driver's volume changes, all handler scaled
        ; volumes may need to be reset

        LDR     r0,[ws,#work_currentDriver] ; Is this driver current?
        ADD     r0,r0,ws
        CMP     r0,r6

        BLEQ    scaleAllHandlerVolumes       ; If so scale all volumes

        LDR     r0,[r6,#driver_Volume]       ; Return volume

        CLRV
        EXIT

 ; ----------------

swiDriverMixer  ROUT
        ; Set or read the mixer for a driver
        ; On entry:
        ;    r0 = driver number
        ;    r1 = function   0 = read, 1 = set
        ;    r2 = mixer number
        ;    r3 = value if set
        ; On exit:
        ;    r0 preserved
        ;    r1 = no of mixers
        ;    r2 = value
        ;    r3 = name

        Entry   "r0,r4-r11,ws"

        Debug   sw,"Driver mixer"

        ADD     r4,ws,#work_driverTable
        SUB     r0,r0,#1                   ; 1-10 becomes 0-9

        CMP     r0,#driverMax             ; >= max
        PullEnv HS
        BHS     swiDriverNumError1

        ; Does the driver exist?
        MOV     r3,#driverTableLen
        MLA     r6,r3,r0,r4

        LDR     r4,[r6,#driver_Address]     ; Does this handler exist?
        CMP     r4,#0
        PullEnv EQ
        BEQ     swiDriverExistError1         ; If not then exit

        MOV     r0,r1         ; Function code
        MOV     r1,r2         ; Mixer number
        MOV     r2,r3         ; Value
        MOV     r3,r6         ; Driver table pointer

        BL    driverMixer

        CLRV
        EXIT

        END
