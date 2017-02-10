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

 ; -------------------------------- Volume routines ------------------------


scaleAllHandlerVolumes ROUT
        ; Set the actual volumes for all handlers
        ; typically called after driver volume has changed
        ; should also be called when System volume has changed
        Entry   "r0-r11,ws"

        ADD     r0,ws,#work_handlerTable   ; Get handler table
        MOV     r6,#handlerMax              ; Count

scaleAllHandlerVolumesLoop
        LDR     r1,[r0,#handler_Address]    ; Is there a driver here?
        CMP     r1,#0
        BLNE    scaleHandlerVolume

        ADD     r0,r0,#handlerTableLen
        SUBS    r6,r6,#1
        BNE     scaleAllHandlerVolumesLoop

        EXIT

 ; ----------

scaleHandlerVolume ROUT
        ; Using all available volume info
        ; set up the real volume for the handler
        ; as passed to fill routine
        ; On entry r0 = handler table
        Entry   "r0-r5"

        LDR     r4,[r0,#handler_Volume]

        ; Scale according to r0 = Driver volume (if driver cannot use it)
        ;                    r4 = Handler volume
        MOV     r5,r0         ; Store handler address

        ; Get the driver scaled volume
        ADD     r0,ws,#work_driverTable
        LDR     r1,[r0,#driver_Address]
        CMP     r1,#0                        ; Check driver exists
        BEQ     scaleHandlerVolumeStore     ; Don't change volume if no driver

        LDR     r0,[r0,#driver_VolumeScaled]   ; Driver scaled volume

        Debug   gn,"Driver volume =",r0

        MOV     r1,#0
        SUB     r1,r1,#1
        CMP     r0,r1                   ; No driver scaling required

        BEQ     scaleHandlerVolumeStore

        ;     r0 = LR, r4 = LR, Scale accordingly....

        MOV     r1,r0,LSR #16  ; r1 = L1
        MOV     r0,r0,LSL #16
        MOV     r0,r0,LSR #16  ; r0 = r1

        MOV     r3,r4,LSR #16  ; r3 = L2
        MOV     r4,r4,LSL #16
        MOV     r4,r4,LSR #16  ; r4 = r2

        MUL     r2,r0,r4
        MOV     r2,r2,LSR #16  ; r2 = R

        MUL     r0,r1,r3
        MOV     r0,r0,LSR #16  ; r0 = L

        ADD     r4,r2,r0,LSL #16 ; r4 = LLRR

scaleHandlerVolumeStore


        Debug   gn,"Scaled volume =",r4

        STR     r4,[r5,#handler_VolumeScaled]

        EXIT

        END
