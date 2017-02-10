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
        SUBT    > Sources.DebugOpts

; Debug flags taken here in version 170

        GBLL    anyfiledebug            ; Debug permitted or not
anyfiledebug SETL False
;anyfiledebug SETL True

 [ AssemblingArthur
                GBLL    anyfiledebug
anyfiledebug    SETL    False	        ; Debug not permitted in the ROM
 ]

; ++++++++++++++++++++++++ Section debug switches +++++++++++++++++++++++++++++

        MACRO
$l      MakeDebug $t
        GBLL    $l
$l      SETL    anyfiledebug :LAND: ($t)
        MEND

debugdontworryresourcefs MakeDebug      False

debugosfile             MakeDebug       False
debugosfileentry        MakeDebug       debugosfile :LOR: False
debugfile5cache         MakeDebug       False
debugosfind             MakeDebug       False
debugosfindentry        MakeDebug       debugosfind :LOR: False
debugstream             MakeDebug       False
debugosargs             MakeDebug       False
debugosargsentry        MakeDebug       debugosargs :LOR: False
debugosargsstamp        MakeDebug       False
debugosbget             MakeDebug       False
debugosbgetentry        MakeDebug       debugosbget :LOR: False
debugosbgetcache        MakeDebug       debugosbget :LAND: False
debugosbput             MakeDebug       False
debugosbputentry        MakeDebug       debugosbput :LOR: False
debugosbputcache        MakeDebug       debugosbput :LAND: False
debugosgbpb             MakeDebug       False
debugosgbpbentry        MakeDebug       debugosgbpb :LOR: False
debugdaftgbpb           MakeDebug       False
debugcontrol            MakeDebug       False
debugmultifs            MakeDebug       False
debugcontrolentry       MakeDebug       debugcontrol :LOR:False
debugrun                MakeDebug       False
debugservices           MakeDebug       False

debugcopy       MakeDebug       False
debugwipe       MakeDebug       False
debugcount      MakeDebug       False
debugutil       MakeDebug       debugcopy :LOR: debugwipe :LOR: debugcount

debugheap       MakeDebug       False
debugheapK      MakeDebug       False
debugpath       MakeDebug       False
debugensure     MakeDebug       False
debugcanonical  MakeDebug       False
debugname       MakeDebug       False
debugsysvars    MakeDebug       False
debugdirstore   MakeDebug       False

debuglowfile    MakeDebug       False
debuglowfunc    MakeDebug       False
debuglowosfind  MakeDebug       False
debuglowxfer    MakeDebug       False
debuglowosargs  MakeDebug       False
debuglowspecial MakeDebug       False
debugdollarstrip MakeDebug      False
debugupcall     MakeDebug       False

paranoid        MakeDebug       False
debuginit       MakeDebug       False
debuginittime   MakeDebug       False
debugservice    MakeDebug       False
debugvector     MakeDebug       False
debugerror      MakeDebug       False
debugreturnparams MakeDebug     False
debugmsgstuff   MakeDebug       False

debugosgbpbirq  MakeDebug       False
debugframe      MakeDebug       False

debugsarm	MakeDebug	False

Proc_Debug      SETL anyfiledebug :LAND: False

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; Includes as specified by how we're debugging:
;

        GBLS    GetAroundBleedingAAsmYetAgain
 [ anyfiledebug
GetAroundBleedingAAsmYetAgain SETS " GET Hdr:Debug"
 |
GetAroundBleedingAAsmYetAgain SETS "; No debug required"
 ]
$GetAroundBleedingAAsmYetAgain


; +++++++++++++++++++++++ For Tube work: ++++++++++++++++++++++++++++++++++++++

 [ anyfiledebug
; Set to true for dubugging through the tube
Host_Debug SETL False
 ]

        GBLS    Host_Inclusion
Host_Inclusion SETS "; No Host debug wanted"
 [ anyfiledebug
  [ Host_Debug
Host_Inclusion SETS " GET Hdr:HostFS"
  ]
 ]
$Host_Inclusion

; +++++++++++++++++++++++ For DebugIt module: +++++++++++++++++++++++++++++++++

 [ anyfiledebug

; Set to true to send debug output to the DebugIt module
Debug_Module SETL True

  [ Debug_Module
XDebugIt_WriteC  EQU  &0004ba82 + Auto_Error_SWI_bit
  ]

 ]

        END
