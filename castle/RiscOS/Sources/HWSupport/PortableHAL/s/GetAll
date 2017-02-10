; This source code in this file is licensed to You by Castle Technology
; Limited ("Castle") and its licensors on contractual terms and conditions
; ("Licence") which entitle you freely to modify and/or to distribute this
; source code subject to Your compliance with the terms of the Licence.
; 
; This source code has been made available to You without any warranties
; whatsoever. Consequently, Your use, modification and distribution of this
; source code is entirely at Your own risk and neither Castle, its licensors
; nor any other person who has contributed to this source code shall be
; liable to You for any loss or damage which You may suffer as a result of
; Your use, modification or distribution of this source code.
; 
; Full details of Your rights and obligations are set out in the Licence.
; You should have received a copy of the Licence with this source code file.
; If You have not received a copy, the text of the Licence is available
; online at www.castle-technology.co.uk/riscosbaselicence.htm
; 
; > Sources.GetAll

;---------------------------------------------------------------------------
;       Portable support code
;---------------------------------------------------------------------------

;Module_BaseAddr

;---------------------------------------------------------------------------
;       Get the headers.
;
        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:ModHand
        GET     Hdr:Services
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:MsgTrans
        GET     Hdr:Proc
        GET     Hdr:Portable
        GET     Hdr:HALEntries
        GET     Hdr:CPUClkDevice
        GET     Hdr:BMUDevice
        GET     Hdr:OSMisc

        GET     VersionASM

;---------------------------------------------------------------------------
;       Define global variables.
;
        GBLL    Debug
Debug           SETL    {FALSE} ;{TRUE}

        GBLL    DebugSpeed
DebugSpeed      SETL    {FALSE}

 [ DebugSpeed
DebugTimer * 6 ; Which HAL timer to use with DebugSpeed
 ]

        GBLL    Speed
Speed           SETL    {TRUE}

        GBLS    Erratum_486865 ; ARM1176 WFI erratum - workaround needed to avoid deadlock
                ; NA -> use regular CP15 WFI
                ; Workaround -> use ARM's erratum workaround
                ; Disable -> disable WFI
 [ SupportARMv6 :LAND: NoARMv7
Erratum_486865  SETS    "Disable" ; On a Raspberry Pi 1B, reading a constant stream of data from the serial port was observed to eventually result in a deadlock within the WFI code (it can take anywhere from several minutes to ~20 hours of testing before failure occurs). Several different tweaks to the routine were tried without success, so I'm going with the safest approach of just disabling WFI for ARM11.
 |
Erratum_486865  SETS    "NA"      ; ARMv6 not supported by this module build, so no need for any workarounds
 ]

;---------------------------------------------------------------------------
;       Get the sources.
;
        GET     Front.s
        GET     StPortable.s    ;Module header and misc. functions.


        END
