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
        GBLA    logBits
        GBLA    errorBase
        GBLA    XPowerWAVE_LinearHandler
        GBLA    XPowerWAVE_SampleRate
        GBLA    XCBAI_RegisterPollWord
        GBLA    XCBAI_DeregisterPollWord
        GBLA    XSoundDriver_Install
        GBLA    XSoundDriver_Remove
        GBLA    Service_SoundDriver
        GBLA    Service_SoundDriver_Start
        GBLA    Service_SoundDriver_End
        GBLA    Service_TaskManagerAcknowledgements
        GBLA    soundFlag_Mix
        GBLA    soundFlag_Period
        GBLA    soundFlag_Log
        GBLA    handler_Address
        GBLA    handler_Parameter
        GBLA    handler_Flags
        GBLA    handler_SampleFrequency
        GBLA    handler_Volume
        GBLA    handler_Type
        GBLA    handler_Fraction
        GBLA    handler_VolumeScaled
        GBLA    handler_Name
        GBLA    handlerNameLen
        GBLA    handlerTableLen
        GBLA    handlerMax
        GBLA    handlerType_Immediate
        GBLA    handlerType_CallBack
        GBLA    handlerType_Process
        GBLA    handlerType_Default
        GBLA    d
        GBLA    driverMax
        GBLA    driverEntry_Install
        GBLA    driverEntry_Remove
        GBLA    driverEntry_Fill
        GBLA    driverEntry_SampleRate
        GBLA    driverEntry_Volume
        GBLA    driverEntry_Mixer
        GBLA    driverEntryLen
        GBLA    A
        GBLA    Log16BitBufferSize
        GBLA    defaultNumCallBackBuffers
        GBLA    callBackBufferLen
;
; The workspace for SharedSound represents the workspace for one driver
; activity with a number of associated streams and handlers.
; The same code could be used with another instantiation to control the
; activity via another output driver.
;
;

errorBase                       SETA &817240 ; length = &40, allocated to ROL

XPowerWAVE_LinearHandler        SETA &6AA60
XPowerWAVE_SampleRate           SETA &6AA5E

XCBAI_RegisterPollWord          SETA &72000
XCBAI_DeregisterPollWord        SETA &72001

XSoundDriver_Install            SETA &6DBC0
XSoundDriver_Remove             SETA &6DBC1

; Service calls  ------------

Service_SoundDriver             SETA &80481
Service_SoundDriver_Start       SETA 0
Service_SoundDriver_End         SETA 1

Service_TaskManagerAcknowledgements SETA &42680

; -------- Sound flags

soundFlag_Mix                   SETA 1
soundFlag_Period                SETA 1 :SHL: 8
soundFlag_Log                   SETA 1 :SHL: 9

; --------- Handler table stuff

handler_Address                 SETA 0
handler_Parameter               SETA 4
handler_Flags                   SETA 8
handler_SampleFrequency         SETA 12
handler_Volume                  SETA 16
handler_Type                    SETA 20
handler_Fraction                SETA 24
handler_VolumeScaled            SETA 28
handler_Name                    SETA 32

handlerNameLen                  SETA 32
handlerTableLen                 SETA handler_Name+handlerNameLen

handlerMax                      SETA 10
;  Maximum number of handlers

handlerType_Immediate           SETA 0
handlerType_CallBack            SETA 1
handlerType_Process             SETA 2

handlerType_Default             SETA handlerType_Immediate

; ---------- Error numbers
;
                                ^ errorBase
ErrorNumber_SSound_InitMem             # 1
ErrorNumber_SSound_CannotInstallDriver # 1 ; Unused
ErrorNumber_SSound_MaxHandlers         # 1
ErrorNumber_SSound_BadHandler          # 1
ErrorNumber_SSound_NoSuchHandler       # 1
ErrorNumber_SSound_BadDriver           # 1
ErrorNumber_SSound_NoSuchDriver        # 1
ErrorNumber_SSound_CannotRemoveDriver  # 1
ErrorNumber_SSound_NoLinearHandler     # 1 ; Unused

; ---------- Driver table stuff

                        ^ 0
driver_Address          # 4
driver_Parameter        # 4
driver_Flags            # 4
driver_Volume           # 4
driver_VolumeScaled     # 4
driver_Name             # 24
driverTableLen          # 0

driverMax SETA 1 ; Maximum number of drivers

; Call entries in table

A SETA 0
driverEntry_Install     SETA A
A SETA A + 4
driverEntry_Remove      SETA A
A SETA A + 4
driverEntry_Fill        SETA A
A SETA A + 4
driverEntry_SampleRate  SETA A
A SETA A + 4
driverEntry_Volume      SETA A
A SETA A + 4
driverEntry_Mixer       SETA A
A SETA A + 4

driverEntryLen          SETA A


; --------- Workspace variable offsets

                               ^ 0
work_memSize                   # 4  ; Current memory size
work_privateWord               # 4  ; R12 module private word pointer
work_msgStruct                 # 16 ; MessageTrans block
work_currentDriver             # 4  ; Driver = 1,2 or External, 0 = none
work_SoundPause                # 4  ; Pause flag for handler fill code
work_SoundActive               # 4  ; Flag set by handler fill code when active
work_SampleFrequency           # 4  ; Current sample frequency
work_SamplePeriod              # 4  ; Current sample period

work_ImmediateHandlers         # 4  ; Bit map of immediate handlers
work_CallBackHandlers          # 4  ; Bit map of call back handlers
work_ProcessHandlers           # 4  ; Bit map of process handlers

work_RecordHandle              # 4  ; Sound Driver stuff
work_RecordHandlerAddress      # 4
work_RecordHandlerParameter    # 4
work_RecordOn                  # 4
work_RecordTypeTable           # 0
work_RecordTypeTableChannels   # 4
work_RecordTypeTableTypes      # 4
work_RecordTypeTableName       # 24
work_RecordDeviceTable         # 0
work_RecordDeviceTableCount    # 4
work_RecordDeviceTableName     # 24

work_ControlWord               # 4  ; Control word for Replay

work_FillcodeTable             # 12

work_DriverEntryTable          # driverEntryLen

work_handlerTable              # (handlerTableLen*handlerMax)
work_driverTable               # (driverTableLen*driverMax)


; Call back stuff

work_callBack_Active           # 4
work_callBack_Count            # 4
work_CallBack_BufferFullCount  # 4
work_CallBack_CurrentSoundBuffer  # 4
work_CallBack_CurrentOutBuffer    # 4
work_CallBack_BufferSize          # 4
work_CallBack_Flags               # 4
work_CallBack_SampleFrequency     # 4
work_CallBack_SamplePeriod        # 4
work_CallBack_numCallBackBuffers  # 4
 [ doCBAI
work_CBAIActive                   # 4
work_PollWord                     # 4
 ]

defaultNumCallBackBuffers SETA 2
; Was 4
callBackBufferLen SETA 416*4

 [ doLog

 ; Log stuff

logBits SETA 13

work_Log_Handler        # 4
work_Log_Parameter      # 4

work_Log_InitedFully    # 4
work_Log_OldConfigure   # 4*5  ; The five parameters for Sound_Configure
work_Log_OldLeft        # 4
work_Log_OldRight       # 4
work_Log_ChanTable      # 16
work_OldLogFill         # 4
Log16BitBufferSize SETA 4000
work_Log_16BitBuffer    # Log16BitBufferSize  ; This will be the start of the buffer if required

 ]

; Make sure the value is Quad word aligned
              AlignSpace 64

work_CallBack_Buffer   # ((callBackBufferLen*defaultNumCallBackBuffers)+64)
memoryStart            # 0






; ---------




;
 END
