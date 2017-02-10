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

 ; -------------------------------- Sound driver routines ------------------------

SoundDriverStart ROUT
        ; Start the SharedSound SoundDriver
        ; ws = Driver block
        Entry   "r0-r11,ws"

        MOV     r0,#0
        STR     r0,[ws,#work_RecordOn]

        ; Build a device table, and a type table
        MOV     r0,#1
        STR     r0,[ws,#work_RecordDeviceTableCount]
        STR     r0,[ws,#work_RecordTypeTableTypes]

        MOV     r0,#2                   ; 2 channels, L+R
        STR     r0,[ws,#work_RecordTypeTableChannels]

        MOV     r0,#?work_RecordTypeTableName
        ADR     r1,typeNameToken
        ADD     r2,ws,#work_RecordTypeTableName
        BL      msgLookupToken

        MOV     r0,#?work_RecordDeviceTableName
        ADR     r1,deviceNameToken
        ADD     r2,ws,#work_RecordDeviceTableName
        BL      msgLookupToken

        ; Install
        ADR     r0,SoundDriverCallTable
        MOV     r1,ws
        MOV     r2,#0
        ADRL    r3,title

                ;    r0 = Call table address
                ;    r1 = ws Parameter
                ;    r2 = Flags
                ;    r3 = Name

        SWI     XSoundDriver_Install

                ;    r0 = Driver number
                ;    r1 = Address to call with data
                ;    r2 = ws Parameter

        STR     r0,[ws,#work_RecordHandle]  ; Driver number from SoundDriver
        STR     r1,[ws,#work_RecordHandlerAddress]
        STR     r2,[ws,#work_RecordHandlerParameter]

        EXIT

deviceNameToken
        DCB     "DrvDev",0
typeNameToken
        DCB     "DrvTyp",0
        ALIGN

 ;-----------

SoundDriverRemove ROUT
        ; ws = Driver block

        Entry   "r0-r11,ws"

        LDR     r0,[ws,#work_RecordHandle]  ; Driver number

        SWI     XSoundDriver_Remove

        EXIT

 ; -----------------------

SoundDriverCallTable
        B       SoundDriver_Start
        B       SoundDriver_Stop
        B       SoundDriver_Pause
        B       SoundDriver_Volume
        B       SoundDriver_Device
        B       SoundDriver_SampleRate
        B       SoundDriver_SampleType
        B       SoundDriver_Gain

 ; ----------

SoundDriver_Start ROUT
        Entry   "r0"

        MOV     r0,#1
        STR     r0,[ws,#work_RecordOn]

        EXIT

 ; -------

SoundDriver_Stop ROUT
        Entry   "r0"

        MOV     r0,#0
        STR     r0,[ws,#work_RecordOn]

        EXIT

 ; -------

SoundDriver_Pause ROUT
        MOV     pc, lr

 ; -------

SoundDriver_Volume ROUT
        ; Read or write current input volume
        ; On entry:
        ;    r0 = Function code, 0 = Read, 1 = Write
        ;    r1 = Left Volume
        ;    r2 = Right volume
        ; On exit:
        ;    r1 = Left volume
        ;    r2 = Right volume

        MOV     r1,#&FF
        MOV     r2,#&FF

        MOV     pc, lr

 ; -------

SoundDriver_Device ROUT
        ; Read or write device
        ; On entry:
        ;    r0 = Function code, 0 = Read, 1 = Write, 2 = Info
        ; If r0 = 0,1 Then
        ;    r1 = Left Device number
        ;    r2 = Right Device number
        ; If r0 = 2 Then
        ;    r1 = Address of left device table
        ;    r2 = Address of right device table

        CMP     r0,#2
        ADDEQ   r1,ws,#work_RecordDeviceTable
        ADDEQ   r2,ws,#work_RecordDeviceTable
        BEQ     SoundDriver_Device_Exit

        MOV     r1,#0  ; Only one device
        MOV     r2,#0

SoundDriver_Device_Exit
        MOV     pc, lr

 ; -------

SoundDriver_SampleRate ROUT
        ; Get rate
        ; On entry:
        ;    r0 = Function code, 0 = Read, 1 = Write, 2 = Test
        ;    r1 = Rate
        ; On exit:
        ;    r1 = Nearest rate
        Entry   "r0,r2-r11,ws"

        CMP     r0,#0
        BEQ     SoundDriver_SampleRate_Read

        CMP     r0,#1
        BEQ     SoundDriver_SampleRate_Write

        CMP     r0,#2
        BNE     SoundDriver_SampleRate_Read

        ; Test involves setting the new one and then resetting to the old
        LDR     r2,[ws,#work_SampleFrequency]

        MOV     r0,r1
        BL      newSampleRate

        LDR     r1,[ws,#work_SampleFrequency]  ; Nearest available

        MOV     r0,r2
        BL      newSampleRate

        B       SoundDriver_SampleRate_Exit

SoundDriver_SampleRate_Write

        MOV     r0,r1
        BL      newSampleRate

SoundDriver_SampleRate_Read

        LDR     r1,[ws,#work_SampleFrequency]

SoundDriver_SampleRate_Exit

        EXIT



 ; --------

SoundDriver_SampleType ROUT
        ; On entry:
        ;    r0 = Function code, 0 = Read, 1 = Write, 2 = Info
        ;  If r0 = 0,1 then
        ;    r1 = Sample channels
        ;    r2 = Sample data type
        ;  if r0 = 2 then
        ;    r1 = -1 to read number of types
        ;       = Value from 0 to n to get name of type
        ; On exit:
        ;  IF r0 = 0,1 then
        ;    r1 = Current channels
        ;    r2 = Current Sample data type
        ;  if r0 = 2 then
        ;    r1 = Pointer to type table
        CMP     r0,#2   ; Info
        ADDEQ   r1,ws,#work_RecordTypeTable
        BEQ     SoundDriver_SampleType_Exit

        ; Cannot change channels or type
        MOV     r1,#2
        MOV     r2,#0

SoundDriver_SampleType_Exit
        MOV     pc, lr

 ; -------

SoundDriver_Gain ROUT

        ; On entry:
        ;    r0 = Function code, 0 = Read, 1 = Write, 2 = Info
        ;    r1 = Device number
        ;    r2 = Left Gain flag
        ;    r3 = Right gain flag
        ; On exit:
        ;  If r0= 0,1 then
        ;    r2,r3 = current flags
        ;  If r0 = 2  then
        ;    r2,r3 > 0 if gain available on this device (value - db's gain)

        ; No gain available
        MOV     r2,#0
        MOV     r3,#0

        MOV     pc, lr

        END
