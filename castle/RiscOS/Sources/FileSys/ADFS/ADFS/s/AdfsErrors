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
;> AdfsErrors

; Change record
; =============
;
; CDP - Christopher Partington, Cambridge Systems Design
;
;
; 08-Apr-91  13:00  CDP
; Added error DriverInUse.
;
; 11-Apr-91  13:29  CDP
; Added BadAddress error block.
;
; 16-Apr-91  16:01  CDP
; Added BadSWI error block.
; BadSWI and BadAddress changed to use MakeInternatErrorBlock.
;
; 19-Apr-91  15:11  CDP
; BadSWI changed to use MakeErrorBlock to get tag right.
; BadAddress still uses MakeInternatErrorBlock because that should work.
;
;
;*End of change record*


MaxDiscErr      * 2_00111111

ExternalErrorBit bit 30
DiscErrorBit     bit 31
NewDiscErrorBit  bit 0

AdfsModuleNum   * &108

;ErrorTable
IntEscapeErr    * &80

        GET     Hdr:FileCoreErr
        GET     Hdr:ADFSErr
        
        MACRO
        ADFSErrorBlock $name, $alttag
      [ "$alttag" <> ""
$name.ErrBlk MakeInternatErrorBlock adfs$name,, $alttag
      |
$name.ErrBlk MakeInternatErrorBlock adfs$name,, $name
      ]
        MEND
        
        ADFSErrorBlock ExtEscape, Escape
      [ fix_4
        ADFSErrorBlock FormatEsc, FormEsc
      ]
        ADFSErrorBlock FormatNotSupportedOnWinnie, WinForm
        ADFSErrorBlock DensityNotSupported, BadDens
        ADFSErrorBlock SectorSizeNotSupported, BadSS
        ADFSErrorBlock TooManySectors, BadSPT
        ADFSErrorBlock BadFormat, BadForm
        ADFSErrorBlock TooManyDefects2, Defects
        ADFSErrorBlock NoFloppy
        ADFSErrorBlock DriverInUse, InUse
        ADFSErrorBlock BadParms
        ADFSErrorBlock BadDrive, BadDrv
        ADFSErrorBlock Disc
        ADFSErrorBlock BadName
        ADFSErrorBlock BadCom
 
; System errors

BadAddressErrBlk        MakeInternatErrorBlock  BadAddress
BadSWIErrBlk            MakeErrorBlock          ModuleBadSWI

        END
