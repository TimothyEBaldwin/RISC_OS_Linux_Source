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

module
        ; Module header
        DCD     0                               ; Not an application
        DCD     initCode        - MODULE_START
        DCD     finalCode       - MODULE_START
        DCD     serviceCode     - MODULE_START
        DCD     title           - MODULE_START
        DCD     help            - MODULE_START
        DCD     0                               ; No commands
swiBaseNum
        DCD     SharedSoundSWI_Base             ; SWI Base number
        DCD     swiHandler      - MODULE_START
        DCD     swiTable        - MODULE_START  ; SWI Decode table
        DCD     0                               ; SWI Decode code
        DCD     0                               ; No messages file
        DCD     flagsWord       - MODULE_START

copyr
        = copyRightS
title
        = titleS,0
        ALIGN
help
        = "Shared Sound",9,Module_HelpVersion,variantS,0
        ALIGN

flagsWord
      [ No32bitCode
        DCD     0
      |
        DCD     ModuleFlag_32bit
      ]

        MakeInternatErrorBlock SSound_InitMem,,"NoMem"

initCode        ROUT
        Entry   "r7-r11,ws"

        BL      startMem                ; Get memory
        ADRVS   r0,ErrorBlock_SSound_InitMem
        BLVS    msgLookupErrorGlobal
        BVS     initError               ; Turns out there wasn't any

        ; r10 = private word
        ; ws = memory pointer [r10]

        BL      initWorkspace           ; Initialise workspace

      [ standalone
        ADR     r0,msgResArea
        SWI     XResourceFS_RegisterFiles
        BVS     initError
      ]
        ADD     r0,ws,#work_msgStruct
        ADR     r1,msgFileName
        MOV     r2,#0                   ; Buffer in RMA
        SWI     XMessageTrans_OpenFile
        BVS     initDeReg

 [ doCBAI
        BL      InstallCBAI
 ]

        BL      installDefaultDriver   ; Preferably Sound_LinearHandler or ChannelHandler

        ; notify TaskManager that the acknowledgements have changed
        LDR     r1,Service_TaskManagerAcknowledgementsVal
        MOV     r2,#0           ; MUST be zero to notify of change
        SWI     XOS_ServiceCall ; ignore if it failed

        ADR     R0,send_service_sound_start
        MOV     R1,#0
        SWI     XOS_AddCallBack

        CLRV                            ; Clear V
        EXIT

initDeReg
      [ standalone
        MOV     r7,r0
        ADR     r0,msgResArea
        SWI     XResourceFS_DeregisterFiles
        MOV     r0,r7
        SETV
      ]
initError
        EXIT

send_service_sound_start ROUT
        Entry   "r0-r8"
        MOV     r1,#Service_Sound                       ; Service_Sound
        MOV     r0,#Service_SharedSoundAlive            ; SharedSound starting
        SWI     XOS_ServiceCall                         ; Ignore any errors
        EXIT

 ; -------------------------------------------------

      [ standalone
msgResArea
        ResourceFile $MergedMsgs, Resources.SSound.Messages
        DCD     0
      ]
msgFileName
        DCB     "Resources:$.Resources.SSound.Messages", 0
        ALIGN
              
msgLookupErrorGlobal ROUT
        Entry   "r1-r7"
        MOV     r1, #0                  ; For errors before the messages are open
        B       %FT10
msgLookupError
        ; _kernel_oserror *msgLookupError(_kernel_oserror *err)
        ALTENTRY
        ADD     r1,ws,#work_msgStruct
10
        MOV     r2,#0
        ADRL    r4,title
        MOV     r5,#0
        MOV     r6,#0
        MOV     r7,#0
        SWI     XMessageTrans_ErrorLookup
        EXIT                            ; 26 bit case preserves flags (except V!)
                                        ; since nothing prior to the SWI corrupted them

msgLookupToken  ROUT
        ; void msgLookupToken(size_t buffersize, const char *token, char *buffer)
        Entry   "r0-r7"
        MOV     r3,r0
        ADD     r0,ws,#work_msgStruct
        MOV     r4,#0
        MOV     r5,#0
        MOV     r6,#0
        MOV     r7,#0
        SWI     XMessageTrans_Lookup
        MOVVS   r0,#0
        STRVSB  r0,[r2,#0]
        EXIT

 ; -------------------------------------------------

finalCode       ROUT
        Entry   "r0-r11,ws"

        LDR     ws,[ws]          ; Get work area

        MOV     r1,#Service_Sound                       ; Service_Sound
        MOV     r0,#Service_SharedSoundDying            ; SharedSound dying
        SWI     XOS_ServiceCall                         ; Ignore any errors

        ADR     r0,send_service_sound_start
        MOV     r1,#0
        SWI     XOS_RemoveCallBack


 [ doCBAI
        BL      RemoveCBAI
 ]
        BL      releaseDriver

        ; notify TaskManager that the acknowledgements have changed
        LDR     r1,Service_TaskManagerAcknowledgementsVal
        MOV     r2,#0 ; MUST be zero to notify of change
        SWI     XOS_ServiceCall ; ignore if it failed

        ADR     r0,serviceCode_Sound_DelayedCallback
        MOV     r1,r12
        SWI     XOS_RemoveTickerEvent

        ADR     r0,serviceCode_Sound_Callback
        MOV     r1,r12
        SWI     XOS_RemoveCallBack

 [ doCallBack
        ADRL    r0,rateChangeCallBack
        LDR     r1,[ws,#work_privateWord]
        SWI     XOS_RemoveCallBack
 ]

        ADRL    r0,doHandlerCallBack
        LDR     r1,[ws,#work_privateWord]
        SWI     XOS_RemoveCallBack

        ADD     r0,ws,#work_msgStruct
        SWI     XMessageTrans_CloseFile
      [ standalone
        ADRL    r0,msgResArea
        SWI     XResourceFS_DeregisterFiles
      ]
        CLRV                            ; Clear V
        EXIT
 ;
 ; -------------------------------------------------

        ; Service numbers, incorporating Ursula service numbers
        ASSERT  Service_Sound < Service_ResourceFSStarting
        ASSERT  Service_ResourceFSStarting < Service_TaskManagerAcknowledgements
        ASSERT  Service_TaskManagerAcknowledgements < Service_SoundDriver
UrsulaService
        DCD     0 ; flags
        DCD     serviceCode_UrsulaEntry - MODULE_START  ; the entry point

        DCD     Service_Sound
      [ standalone
        DCD     Service_ResourceFSStarting
      ]
Service_TaskManagerAcknowledgementsVal
        DCD     Service_TaskManagerAcknowledgements
Service_SoundDriverVal
        DCD     Service_SoundDriver
        DCD     0 ; table terminator
        DCD     UrsulaService           - MODULE_START  ; the table anchor

serviceCode
        MOV     r0, r0
serviceCode_UrsulaEntry
        Push    "lr"

        TEQ     R1,#Service_Sound
        BEQ     serviceCode_Sound

      [ standalone
        TEQ     R1,#Service_ResourceFSStarting
        BEQ     serviceCode_ResourceFSStarting
      ]
        LDR     lr,Service_SoundDriverVal
        TEQ     r1,lr
        BEQ     serviceCode_SoundDriver

        LDR     lr,Service_TaskManagerAcknowledgementsVal
        TEQ     r1,lr
        BEQ     serviceCode_TaskManagerAcknowledgements

        Pull    "pc"

      [ standalone
; ResourceFS started, reregister the messages
serviceCode_ResourceFSStarting
        Push    "R0"                 ; lr already stacked
        ADRL    R0, msgResArea
        MOV     lr,pc
        MOV     pc,R2
        Pull    "R0,PC"
      ]

; SoundDMA has reinitialised, so we need to stick our
; LinearHandler in place
serviceCode_Sound
        Push    "R0-R3"              ; lr already stacked
        LDR     ws,[ws]
        LDR     R14,[ws,# work_currentDriver]

; linear handler goes through level 0
; if it dies, we shutdown the current handler (for lin or log handlers)
; it it starts up, we start the current handler (for lin or log handlers)
        TEQ     R14,#2 ; linear handler
        TEQNE   R14,#1 ; log handler
        TEQEQ   R0,#Service_SoundLevel0Dying
        BEQ     serviceCode_Sound_Shutdown

        TEQ     R14,#2 ; linear handler
        TEQNE   R14,#1 ; log handler
        TEQ     R0,#Service_SoundLevel0Alive
        BEQ     serviceCode_Sound_Reinit

; log handler goes through level 1, but only after SoundChannels has
; registered itself
        TEQ     R0,#Service_SoundLevel1Dying
        TEQEQ   R14,#1 ; log handler
        BEQ     serviceCode_Sound_Shutdown

        TEQ     R0,#Service_SoundLevel1Alive
        TEQEQ   R14,#1 ; log handler

        Pull    "R0-R3,PC", NE

serviceCode_Sound_Reinit
        TEQ     r14,#1 ; log handler
        BNE     %FT10  ; linear handler can go

; SoundChannels probably hasn't received the service yet, so we need to
; delay the callback for a bit - this probably won't be noticable and
; if it is, then that's tough - probably Level1 should say that it's now
; re-registered, but we'll just cope for now.
        MOV     r0,#40-1 ; 40 cs good enough ?
        ADR     r1,serviceCode_Sound_DelayedCallback
        MOV     r2,ws
        SWI     XOS_CallAfter

        Pull    "R0-R3,PC"

10
        ADR     r0,serviceCode_Sound_Callback
        MOV     r1,ws
        SWI     XOS_AddCallBack

        Pull    "R0-R3,PC"

serviceCode_Sound_Shutdown
        Debug   gn, "shutdown: releaseDriver"
        BL      releaseDriver
        Debug   gn, "shutdown: returning",0
        Pull    "R0-R3,PC"

serviceCode_Sound_Callback ROUT
        Entry   "R0-R3"
        Debug   gn, "callback: installDefaultDriver"
        BL      installDefaultDriver
        Debug   gn, "callback: done",0

; check the install type
        LDR     R14,[ws,# work_currentDriver]
        TEQ     R14,#1 ; log driver ?
        BNE     %FT90
   [ doLog
        LDR     R14,[ws,# work_Log_InitedFully]
        TEQ     R14,#1
        BEQ     %FT90
   ]

; SoundChannels probably hasn't received the service yet, so we need to
; delay the callback for a bit - this probably won't be noticable and
; if it is, then that's tough - probably Level1 should say that it's now
; re-registered, but we'll just cope for now.
        MOV     r0,#40-1 ; 40 cs good enough ?
        ADR     r1,serviceCode_Sound_DelayedCallback
        MOV     r2,ws
        SWI     XOS_CallAfter

90
        EXIT

serviceCode_Sound_DelayedCallback ROUT
        Entry   "R0-R3"

        Debug   gn,"delayedcallback: set callback"

        ADR     r0,serviceCode_Sound_Callback
        MOV     r1,ws
        SWI     XOS_AddCallBack

        EXIT

 ; Ensure that we place messages in the acknowledgements window
serviceCode_TaskManagerAcknowledgements ROUT

        Push    "r0-r3"              ; lr already stacked
        TEQ     r2,#0
        Pull    "r0-r3,pc", EQ
        MOV     r3,r2
        MOV     r0,#&1000;TaskManager_AckGroup_System ; &1000

        ADRL    r1,title

        ADR     r2,acknowledgement
        MOV     lr,pc
        MOV     pc,r3
        Pull    "r0-r3,pc"

; the message to appear in the window
acknowledgement

        = ackS,0
        ALIGN

serviceCode_SoundDriver ROUT
        Push    "r0-r11,ws"      ; lr already stacked

        LDR     ws,[ws]          ; Get work area

        CMP     r0,#Service_SoundDriver_Start
        BEQ     serviceCode_SoundDriverStart

        CMP     r0,#Service_SoundDriver_End
        BEQ     serviceCode_SoundDriverEnd

        Pull    "r0-r11,ws,pc"

serviceCode_SoundDriverStart
        ; install into Sound Driver

        ADRL    r0,SoundDriverStart
        MOV     r1,ws

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

        Pull    "r0-r11,ws,pc"

 ; ----

serviceCode_SoundDriverEnd
        ;  Remove from Sound Driver

        BL      SoundDriverRemove

        Pull    "r0-r11,ws,pc"

 ; -----------------  SWI'S

swiTable

        = swiNameS,0
        = "InstallHandler",0
        = "RemoveHandler",0
        = "HandlerInfo",0
        = "HandlerVolume",0
        = "HandlerSampleType",0
        = "HandlerPause",0
        = "SampleRate",0
        = "InstallDriver",0
        = "RemoveDriver",0
        = "DriverInfo",0
        = "DriverVolume",0
        = "DriverMixer",0
        = "CheckDriver",0
        = "ControlWord",0
        = "HandlerType",0
 [ debugxc
        = "Test",0
        = "Info",0
 ]
        DCB 0
        ALIGN

swiHandler
    [ :LNOT: No26bitCode
      [ :LNOT: No32bitCode
        TEQ     pc,pc
        BEQ     swiHandler32
      ]
        ; Veneer for 26bit OS's, preserve NZC
        Push    "lr"
        BL      swiHandler32
        Pull    "lr"
        MOVVCS  pc, lr
        ORRVSS  pc, lr, #V_bit
swiHandler32
    ]
        MOV     r10,ws
        LDR     ws,[ws]    ; ws = pointer to RMA data block
        CMP     r11,#(EndOfJumpTable - jumpTable)/4
        ADDCC   pc,pc,r11,LSL #2
        B       UnknownSWIerror
jumpTable
        B       swiInstallHandler          ;  OK
        B       swiRemoveHandler           ;  OK
        B       swiHandlerInfo             ;  OK
        B       swiHandlerVolume           ;  OK
        B       swiHandlerSampleType       ;  not in this version
        B       swiHandlerPause            ;  not in this version
        B       swiSampleRate              ;  OK
        B       swiInstallDriver           ;  OK
        B       swiRemoveDriver            ;  OK
        B       swiDriverInfo              ;  OK
        B       swiDriverVolume            ;  OK
        B       swiDriverMixer             ;  OK
        B       driverCheck                ;
        B       swiControlWord             ;
        B       swiHandlerType             ;
 [ debugxc
        B       swiTest                    ;  For debugging only
        B       swiInfo                    ;  For debugging only
 ]

EndOfJumpTable

UnknownSWIerror
        ADR     r0,ErrorBlock_ModuleBadSWI
        B       msgLookupError

        MakeInternatErrorBlock ModuleBadSWI,,"BadSWI"

        END
