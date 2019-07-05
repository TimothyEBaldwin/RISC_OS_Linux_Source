; Assembler source for FPA support code and emulator
; ==================================================
; Code to check requested assembly options for consistency, etc.
;
; Copyright (C) Advanced RISC Machines Limited, 1992-7 (now named ARM Limited).
; All rights reserved.
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
;
;     * Redistributions of source code must retain the above copyright notice,
;       this list of conditions and the following disclaimer.
;     * Redistributions in binary form must reproduce the above copyright
;       notice, this list of conditions and the following disclaimer in the
;       documentation and/or other materials provided with the distribution.
;     * Neither the name of Advanced RISC Machines Limited nor ARM Limited nor
;       the names of its contributors may be used to endorse or promote
;       products derived from this software without specific prior written
;       permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; POSSIBILITY OF SUCH DAMAGE.
;===========================================================================

; System ID definitions that need to be made here rather than in the more
; natural "fpadefs" file.

SysID_FPA       EQU     0x81

;===========================================================================

; If we're being asked to assume particular hardware present, check (a) that
; it is known hardware; (b) that the correct assembly-time options are being
; chosen for it.

        [ :DEF:AssumedHardware

          GBLL    AssumedHardwareKnown
AssumedHardwareKnown SETL {FALSE}

          [ AssumedHardware = -1
AssumedHardwareKnown SETL {TRUE}
            [ (:LNOT:FPEWanted) :LOR: FPASCWanted
              ! 0,"Note: Only FPE will be assembled because of AssumedHardware value"
            ]
FPEWanted   SETL    {TRUE}
FPASCWanted SETL    {FALSE}
          ]

          [ AssumedHardware = SysID_FPA
AssumedHardwareKnown SETL {TRUE}
            [ FPEWanted :LOR: (:LNOT:FPASCWanted)
              ! 0,"Note: Only FPASC will be assembled because of AssumedHardware value"
            ]
FPEWanted   SETL    {FALSE}
FPASCWanted SETL    {TRUE}
          ]

          [ :LNOT:AssumedHardwareKnown
            ! 4,"Unimplemented value for 'AssumedHardware'"
          ]

        ]

;===========================================================================

; Determine various useful information about the set of undefined
; instruction handlers requested.

; Is hardware support code requested?

                GBLL    SCWanted
SCWanted        SETL    FPASCWanted

; How many undefined instruction handlers are wanted?

                GBLA    UndefHandCount
UndefHandCount  SETA    0
                [       FPEWanted
UndefHandCount  SETA    UndefHandCount+1
                ]
                [       FPASCWanted
UndefHandCount  SETA    UndefHandCount+1
                ]

;===========================================================================

; Bad assembly options if no undefined instruction handlers requested.

        [ UndefHandCount=0
        ! 4,"At least one of FPEWanted and FPASCWanted should be set"
        ]

        [ DynamicRounding :LAND: FPASCWanted
        ! 0,"Note: Dynamic rounding modes will be ignored by FPA hardware"
        ]

;===========================================================================

; Determine how signalling NaN copies by STFs and MVFs will be handled when
; no change of format is involved.

                GBLL    SigNaNCopy_OK
                GBLL    SigNaNCopy_Bad
SigNaNCopy_OK   SETL    {FALSE}
SigNaNCopy_Bad  SETL    {FALSE}

; Hardware support options.

                [ FPASCWanted
SigNaNCopy_OK   SETL    {TRUE}
                ]

; Decide on FPE behaviour - we choose the "copying without change of format
; doesn't generate an exception" option unless the veneer writer forces the
; other behaviour. (If future hardware implements the other behaviour, we
; will generally try to make the FPE match any hardware present.)

                [ FPEWanted
                  [ :LNOT::DEF:FPESigNaNCopy_Invalid
                    GBLL    FPESigNaNCopy_Invalid
FPESigNaNCopy_Invalid SETL  SigNaNCopy_Bad :LAND: :LNOT:SigNaNCopy_OK
                  ]

                  [ FPESigNaNCopy_Invalid
SigNaNCopy_Bad      SETL    {TRUE}
                  |
SigNaNCopy_OK       SETL    {TRUE}
                  ]
                ]

; If precisely one of SigNaNCopy_OK and SigNaNCopy_Bad is set by now, we
; have a system with completely consistent behaviour. If both are set, the
; system will behave differently depending on what hardware is present. (If
; neither is set, something has gone badly wrong above.)

                [ SigNaNCopy_OK :LAND: SigNaNCopy_Bad
                  ! 0,"NOTE: SigNaN copying will vary according to presence of hardware"
                ]

;===========================================================================

        END
