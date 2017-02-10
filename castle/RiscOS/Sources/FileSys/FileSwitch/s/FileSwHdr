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
        SUBT    > Sources.FileSwHdr - for standalone assembly

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Other implementation modifiers

                GBLL    appendhandle       ; Append channel number to error messages?
appendhandle    SETL    {FALSE}

                                           ; Ursula performance enhancements
                GBLL    MercifulToSysHeap  ; attempt to avoid very frequent OS_Heap
                                           ; claims and releases for sytem heap
                GBLL    MercifulTracing    ; tracing for diagnostics only
MercifulToSysHeap SETL  {TRUE}
MercifulTracing   SETL  {FALSE} :LAND: MercifulToSysHeap

                GBLL    CatExLong
CatExLong       SETL    {TRUE}             ; if this is set to TRUE, then *cat, *ex, etc, will attempt
                                           ; to make the display look better with long filenames

                GBLL    ChopOffTheGoolies
ChopOffTheGoolies SETL  {FALSE}            ; For deviant OS debugging versions

                GBLL    chopoffdollarfrompaths
chopoffdollarfrompaths  SETL     {FALSE}

                GBLL    sparebuffer
sparebuffer     SETL    {TRUE}

                GBLL    osfile5cache
osfile5cache    SETL    {TRUE}

                GBLL    kludgeforNFS
kludgeforNFS    SETL    {FALSE}

		GBLL	StrongARM
		GBLL	SASTMhatbroken
StrongARM	SETL	{TRUE}
SASTMhatbroken	SETL	{TRUE} :LAND: StrongARM

                GBLL    Use_fsfile_Save
Use_fsfile_Save SETL    {TRUE}             ; Indicates whether fsfile_Save reason is used, or create, open, GBPB, close

        GBLL    Use_fsfile_Load
Use_fsfile_Load SETL    {TRUE}             ; Indicates whether fsfile_Load reason is used, or open, GBPB, close

	GBLL	UseDynamicAreas
UseDynamicAreas	SETL	{TRUE}

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Flags to strip out copy + wipe for MOS debugging versions

                GBLL    hascopy
                GBLL    haswipe
                GBLL    hascount
                GBLL    hasutil

 [ ChopOffTheGoolies ; For Sam MOS debugging versions
hascopy         SETL    {FALSE}
haswipe         SETL    {FALSE}
hascount        SETL    {FALSE}
 |
hascopy         SETL    {TRUE}
haswipe         SETL    {TRUE}
hascount        SETL    {TRUE}
 ]
hasutil         SETL    hascopy :LOR: haswipe :LOR: hascount

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; One or two header definitions

        GET     Hdr:ListOpts
        OPT     OptNoList
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Machine.<Machine>
        GET     Hdr:UserIF.<UserIF>
        GET     Hdr:ImageSize.<ImageSize>

      [ :LNOT: No26bitCode            ; Get brutal with 32-bitness - use 26-bit code unless 
No32bitCode     SETL {TRUE}           ; we really mustn't, as 32-bit is a performance drain.
      ]                               ; Can't really softload FileSwitch anyway.

        GET     Hdr:CMOS
        GET     Hdr:ModHand
        GET     Hdr:Services
        GET     Hdr:FSNumbers
        GET     Hdr:HighFSI
        GET     Hdr:NewErrors
        GET     Hdr:Heap
        GET     Hdr:Variables
        GET     Hdr:EnvNumbers
        GET     Hdr:Proc
        GET     Hdr:PublicWS          ; Import ScratchSpace
        GET     Hdr:Tokens
        GET     Hdr:FileTypes
        GET     Hdr:VduExt
        GET     Hdr:UpCall
        GET     Hdr:LowFSI
        GET     Hdr:Wimp              ; It happens to us all in the end ...
        GET     Hdr:MsgTrans
        GET     Hdr:Territory
        GET     Hdr:OSRSI6            ; Import DomainId
        GET     VersionASM

        OPT     OptList + OptPage

        END
