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
; The driver will typically be the 16 bit DMA handler with all parameters
; set as required, or the log driver for 8 bit support.
; If it is the 8 bit driver then there is some conversion required to set the
; parameters correctly.
; This is indicated by passing a call address in the driver block which would
; otherwise be 0.
;

 ; -------------------------------- Driver routines ---------------------------

        MACRO
        CallDriver $drivertbl, $entry, $extraregs
        LCLS    regs
      [ "$extraregs"=""
regs    SETS    "ws"
      |
regs    SETS    "$extraregs,ws"
      ]
        Push    "$regs"                             ; Stack ws and any other regs
        LDR     ws, [$drivertbl, #driver_Parameter] ; Called with ws = parameter
        Push    "pc"                                ; Put return address on the stack
        MOV     pc, $entry                          ; And call driver install entry
      [ NoARMv4
        MOV     r0, r0
      ]
        Pull    "$regs"                             ; Retrieve ws
        MEND

installDefaultDriver ROUT
        ;  The default driver will either be (in order of preference)
        ;      Sound_LinearHandler
        ;   or Sound_ChannelHandler

        ;  This routine looks to see what is available and installs
        ;  the appropriate driver.

        Entry

        Debug   gn,"installDefaultDriver: entered"

 [ doDMI :LAND: ( :LNOT: forceLog)

        ; See if the DMI is loaded and if so install SharedSound into it's linear handler
        MOV     R0,#0
        ADR     R1,%FT10
        SWI     XOS_SWINumberFromString
        BVS     installDefaultDriver_NoDMI

        MOV     R0,#3
        STR     R0,[R12,#work_currentDriver]

        BL      installDMIDriver

        EXIT

10
        DCB     "PowerWAVE_LinearHandler", 0 ; Name of a SWI from the module
        ALIGN

installDefaultDriver_NoDMI

 ]
        ; First see if Sound_LinearHandler exists

        ; This relies on the fact that the old SoundDMA module will respond to all
        ; SWI's outside its range with a 0
        ; but the 16 bit SoundDMA will respond with a 1 if 16 bit is on

        MOV     r0,#0

 [ :LNOT: forceLog

        SWI     XSound_Mode   ;  Check configured for 16 Bit support
        MOVVS   r0,#0         ;  if not supported, explicitly say it's log
 ]

        Debug   gn,"Sound mode =", r0

        CMP     r0,#0          ; r0 = 1 If 16 bit support is on

        MOVEQ   r1,#1  ; Log
        MOVNE   r1,#2  ; Linear

        STR     r1,[ws,#work_currentDriver]

 [ doLog
        BNE     installDefaultDriverNotLog      ; 32 bit change
        BL      installLogDriver
        EXIT
 ]

installDefaultDriverNotLog
        BL      installLinearDriver

        EXIT

 ; -----------

installDriver   ROUT
        ; Install driver
        ;  r0 = Pointer to driver table, or 0 if it's not really valid
        ;  r1 = parameter to pass driver in ws when called
        ;  r2 = flags
        ;  r3 ->Driver name
        Entry   "r0-r6"

        BL      releaseDriver                   ; release the currently active driver

        ADD     r6,ws,#work_driverTable         ; Get pointer to driver table

        STR     r0,[r6,#driver_Address]         ; Table address
        STR     r1,[r6,#driver_Parameter]       ; Driver ws parameter
        STR     r2,[r6,#driver_Flags]

        ADD     r4,r6,#driver_Name
        ADD     r5,r4,#?driver_Name - 1         ; Buffer end (inclusive)
10
        LDRB    r14,[r3],#1
        CMP     r14,#31                         ; Control terminate
        CMPHI   r5,r4                           ; Check buffer end
        MOVLS   r14,#0                          
        STRB    r14,[r4],#1
        BHI     %BT10

        MVN     r0,#0                           ; Initialise driver vol to LR = &FFFFFFFF
        STR     r0,[r6,#driver_Volume]

        BL      driverInitialise                ; Initialise this driver

        LDR     r0,[r6,#driver_Volume]
        MOV     r1,r6                           ; Driver table
        BL      driverVolume                    ; Initialise driver volume

        EXIT

 ; -----------

driverInitialise ROUT
        ; Initialise a new driver
        ;  r0 = driver table slot
        ;  Return with r0 = 0 if failed

        Entry   "r1-r11,ws"

        ADD     r6,ws,#work_driverTable         ; driver Table slot

        LDR     r0,[r6,#driver_Address]
        LDR     r2,[r0,#driverEntry_Install]    ; r2 = Call address

        BL      clearCallBackBuffer

        ADRL    r0,fill                         ; Main fill call address

        LDR     r1,[ws,#work_privateWord]       ; r1 = parameter
        CallDriver r6, r2                       ; Call r2 on driver r6

        CMP     r0,#0                           ; = 0 if install failed

        MOVNE   r0,#0
        BLNE    newSampleRate                   ; Get rate and set up sample period &
                                                ; fractions

        BL      startSound                   ; Make sure that sound is active

        EXIT

        ; ------------

driverCheck     ROUT
        ; Call initialise to make sure that the current driver is still active

        Entry   "r0-r11,ws"

        ADD     r6,ws,#work_driverTable         ; driver Table slot
        LDR     r0,[r6,#driver_Address]

        CMP     r0,#0                           ; Is there a driver installed?
        BEQ     driverCheckExit

        LDR     r2,[r0,#driverEntry_Install]    ; r2 = Call address

        ADRL    r0,fill                         ; r0 = Handler address
        LDR     r1,[ws,#work_privateWord]       ; r1 = parameter
        CallDriver r6, r2                       ; Call r2 on driver r6

        MOV     r0,#0
        STR     r0,[ws,#work_SoundPause]        ; Clear the pause flag

driverCheckExit
        CLRV
        EXIT


        ;-------------

releaseDriver   ROUT
        Entry   "r0-r11,ws"

        BL      stopSound

        ADD     r0,ws,#work_driverTable         ; driver Table slot
        LDR     r1,[r0,#driver_Address]

        CMP     r1,#0
        BEQ     releaseDriverExit

        LDR     r1,[r1,#driverEntry_Remove]
        CallDriver r0, r1                       ; Call r1 on driver r0, no other parameters 

; forget the driver we're using
        ADD     r0,ws,#work_driverTable         ; driver Table slot
        MOV     r1,#0
        STR     r1,[r0,#driver_Address]

releaseDriverExit
        EXIT

        ; ----------------

driverSampleRate ROUT
        ; Call driver sample rate entry
        ; On entry:
        ;  r0 = 0 to read
        ;     > 0 for sample frequency required
        ; On exit:
        ;  r0 = current frequency
        Entry

        ; Get or set current frequency
        ADD     r1,ws,#work_driverTable         ; driver Table slot
        LDR     r2,[r1,#driver_Address]

        CMP     r2,#0                           ; Return 0 for failed
        MOVEQ   r0,#0
        BEQ     driverSampleRateExit

        LDR     r2,[r1,#driver_Address]
        LDR     r2,[r2,#driverEntry_SampleRate]
        CallDriver r1, r2                       ; Call r2 on driver r1, no other parameters

        ; r0 = current frequency

driverSampleRateExit
        EXIT


 ; ----------

driverVolume    ROUT
        ; Set the new volume for a driver
        ; On entry:
        ;   r0 = new LR volume
        ;   r1 = driver table
        ; On exit:
        ;   r0 = volume scaling required by handler to achieve this volume
        ;   So if driver cannot scale volume then r0 = entry value and handler
        ;   will have to do all the work
        ;   If driver can scale then typically it will return &FFFFFFFF to
        ;   tell handler not to scale volume at all
        Entry   "r1-r11,ws"

        ; Get or set current volume
        ADD     r1,ws,#work_driverTable    ; driver Table slot
        LDR     r2,[r1,#driver_Address]

        CMP     r2,#0
        BEQ     driverVolumeExit

        LDR     r2,[r2,#driverEntry_Volume]     ; There may not be an entry
        CMP     r2,#0
        STR     r0,[r1,#driver_Volume]          ; Store it
        BEQ     driverVolumeStore               ; Return with r0 as set

        CallDriver r1, r2, "r1"                 ; Call r2 on driver r1, no other parameters

driverVolumeStore


        Debug   gn,"Store scaled driver volume: ", r0

        ;  r0 = actual volume

        STR     r0,[r1,#driver_VolumeScaled]    ; The volume to use when scaling handlers

driverVolumeExit
        EXIT


        ; -----------

driverMixer     ROUT
        ; Call driver's mixer entry
        ; On entry:
        ;    r0 = Function code,  0 = read,  1 = set
        ;    r1 = mixer number
        ;    r2 = value if to set
        ;    r3 = driver pointer
        ; On exit:
        ;    r1 = number of mixers
        ;    r2 = current value
        ;    r3 = mixer name

        Entry   "r4-r11,ws"

        CMP     r3,#0
        BEQ     driverMixerExit

        LDR     r4,[r3,#driver_Address]
        LDR     r4,[r4,#driverEntry_Mixer]      ; There may not be an entry
        CMP     r4,#0
        BEQ     driverMixerExit                 ; No mixer entry

        CallDriver r3, r4                       ; Call r4 on driver r3, no other parameters

driverMixerExit
        EXIT

        END
