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
; >SharedSnd
; SharedSound module
;
; To new spec from 0.12 onwards
; 0.46 Uses CBAI if availble
; 0.49 Added PowerWAVE links
; 0.50 Testing CBAI again
; 0.51 Testing log stuff - Sound_Configure problems
; 0.52 SoundDriver code added
; 0.53 SoundDriver de-bugged...
; 0.55 Mod for log through SoundDMAx
; 0.56 Sample rate from SoundDriver implemented
; 0.57 Ty to sort out Restart hang
; 0.58 CBAI With registered SWI chunk - for RiscOSLtd
; 0.58b JRF- Added TaskManagerAcknowledgements service
; 0.59 Initialise all workspace to 0 - with log & DMI
; 0.60 RJW: Sample rate callback fixes.
;           ObjAsm'd source (credit to JRF)
;           Sends Service_Sound 6 on init.
;           Sends Service_Sound 7 on finalisation.
; 0.61 RJW: Merged with Pace source (for 32bitedness)

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:PublicWS
        GET     Hdr:ModHand
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:Sound
        GET     Hdr:ResourceFS
        GET     Hdr:MsgTrans
        GET     Hdr:Proc
        GET     Hdr:NdrDebug
        GET     Hdr:Services

        GET     VersionAsm

        GBLS    copyRightS
        GBLS    ackS
        GBLS    variantS
        GBLS    titleS
        GBLS    swiNameS
copyRightS      SETS "© Expressive Software Projects, Nottingham."
ackS            SETS "Copyright © 1995-2002 Expressive Software Projects"
variantS        SETS ""
titleS          SETS "SharedSound"
swiNameS        SETS "SharedSound"

        GBLL    forceLog
        GBLL    doLogDirect
        GBLL    doDMI
        GBLL    doCallBack
        GBLL    doCBAI
      [ :LNOT::DEF: standalone
        GBLL    standalone
standalone      SETL {FALSE}
      ]
      [ :LNOT::DEF: doLog
        GBLL    doLog
doLog           SETL {FALSE}
      |
doLog           SETL doLog :LAND: standalone ; Uses PC relative workspace!
      ]
forceLog        SETL {FALSE}
doLogDirect     SETL {FALSE}
doDMI           SETL {TRUE}
doCallBack      SETL {TRUE}
doCBAI          SETL {FALSE}

        GBLL    debugxc
        GBLL    debugsw
        GBLL    debuggn
debug           SETL {FALSE}
debuggn         SETL {FALSE} ; General debug
debugsw         SETL {FALSE} ; SWI entries
debugxc         SETL {FALSE} ; Extra commands

ws RN 12

        AREA    |!!Module$$Code|, CODE, READONLY

MODULE_START
        GET     Vars.s
        GET     Module.s
        GET     SWIS.s
        GET     Memory.s
        GET     SampleRate.s
        GET     Volume.s
        GET     Drivers.s
        GET     Linear.s
      [ doLog
        GET     Log.s
      ]
      [ doDMI
        GET     PowerWave.s
      ]
        GET     SoundDrv.s
        GET     Handler.s
        GET     FillCode.s

      [ debug
        InsertNDRDebugRoutines
      ]

        END
