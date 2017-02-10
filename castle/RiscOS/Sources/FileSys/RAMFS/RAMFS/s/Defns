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
; >Defns

        TTL     "Declarations and workspace allocation"

; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Switches
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        GBLL    BigDir                  ; if this is true then we use big directories
BigDir  SETL    {TRUE}

        GBLL    BigDisc                 ; if this is true then we use new filecore
BigDisc SETL    {TRUE}

        GBLL    BigDisc2                ; WIP support for ram disc size > 512MB
BigDisc2 SETL   {FALSE}

        GBLL    BigMaps                 ; support longer idlen
BigMaps SETL    {TRUE}

        GBLL    PMP                     ; Support use of physical memory pool DA. Code remains compatible with non-PMP DA.
PMP     SETL    {TRUE}

; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Data areas & register allocation
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SB              RN 12

                ^ 0, SB
BufferStart     # 4
BufferSize      # 4
ScatterPair     # 8
FileCorePrivate # 4
                AlignSpace 64
MyPrivate       # 4
                AlignSpace 64
message_file_block  # 16                ; File handle for MessageTrans
message_file_open   # 4                 ; Opened message file flag
 [ PMP
PageFlags       # 4                     ; Flags to use when mapping pages
PMPSize         # 4                     ; Logical size of PMP (page count)
LRUCache        # 4                     ; Array of (log page, phys page) pairs
 ]
WorkSize        # 0

; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Debugging
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        GBLL    Dev                     ; Extra code to do postmortem when things go bang
Dev     SETL    {FALSE}

        GBLL    Debug                   ; Debugging printout
Debug   SETL    {FALSE} :LOR: Dev

        MACRO
$a      switch  $b
        GBLL    $a
$a      SETL    $b :LAND: Debug
        MEND

        GBLL    Debug3
        GBLL    Debug4
        GBLL    Debug9
        GBLL    DebugPMP
Debug3  switch  {TRUE}                  ; low level op
Debug4  switch  {TRUE}                  ; misc op
Debug9  switch  {TRUE}                  ; useful routines
DebugPMP switch {TRUE}

        GBLS    NeedHdrDebug
        GBLS    NeedHdrHostFS
      [ Debug
NeedHdrDebug    SETS "GET Hdr:Debug"
      |
NeedHdrDebug    SETS "; No"
      ]
      [ :DEF: Host_Debug
Host_Debug      SETL {FALSE}
Debug_MaybeIRQ  SETL {FALSE}
NeedHdrHostFS   SETS "GET Hdr:HostFS"
      |
NeedHdrHostFS   SETS "; No"
      ]
        $NeedHdrDebug
        $NeedHdrHostFS

; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Constants
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

OldDirSize               * &500
NewDirSize               * &800
BigDirMinSize            * 2048

        ASSERT  SzDiscRecSigSpace = 60
Zone0DiscRecSz           * 60
Zone0Bits                * Zone0DiscRecSz * 8 

MyMaxSupportedDiscOp     * DiscOp_ReadTrk
MyMaxSupportedDrive      * 0
MyMinSupportedDriveSize  * 8 * 1024
MyLog2SectorSize         * 10       ; 9 = 512, 10 = 1024
; n.b. 512 byte sector has max disc size approx 256MB. 1024 max is 512MB

ChangeDyn_RamFS          * 5 ; Our DA number

        END
