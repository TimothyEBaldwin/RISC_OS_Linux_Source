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
        SUBT    Creation of swis.h ==> Hdr:makehswis

; ***********************************
; ***    C h a n g e   L i s t    ***
; ***********************************

; Date       Name       Description
; ----       ----       -----------
; 07-Feb-94  TMD        Created file
; 20-Jul-94  AMcC       Made compatible with Hdr file changes:
;                       - GETs Hdr:PublicWS rather than defining SoundWorkSpace.
;                       - Hdr:File has been split into Hdr:FSNumbers and Hdr:HighFSI
;                         GETs Hdr:FSNumbers (needed by NewErrors) (was GET Hdr:File).
;                       - FilerAction hdr file is now called FilerAct (was Filer).
;                       - Filter hdr file is now called Filter (was Filters).
;                       - Squash hdr file is now called Squash (was Compress).
;                       - Removed GET  Hdr:DBox
;                       - Removed GET  Hdr:ROMCache
; 22-Sep-94  AMcC       #ifdef __cplusplus lines included in derived file (from IJohnson)
; 22-Sep-94  AMcC       Generates SWI name defs for all SWIs listed in PRM (3.50 version)
; 12-Oct-94  AMcC       Added SWIs for DDT (HLLDebugger) and HostFS (Tube)
; 03-Jan-95  AMcC       Added CDROM and SCSI SWIs (as requested by SPalmer)
; 09-Jan-95  AMcC       Added #defines for INR(..) and OUTR(..)
;                       Added usage comment (for Aquarius Toolbox)
;                       Updated version and date for header of output file
;

; AAsm source file to make h.swis file from Hdr:SWIs and other headers

        GET     Hdr:ListOpts

        GBLS    SWIClass

; Now the special version of the AddSWI macro that outputs the #defines

        MACRO
        AddSWI  $SWIName,$value
        LCLA    val2
  [     "$value" = ""
$SWIClass._$SWIName # 1
  |
$SWIClass._$SWIName * $value
  ]
val2    SETA    $SWIClass._$SWIName
X$SWIClass._$SWIName * $SWIClass._$SWIName + Auto_Error_SWI_bit
        =       "#undef $SWIClass._$SWIName", 10
        =       "#define $SWIClass._$SWIName 0x$val2", 10
        MEND

        MACRO
$label  AddError $name,$text,$value
$label
   [    "$value" = ""
ErrorNumber_$name # 1
   |
ErrorNumber_$name * $value
   ]
        GBLS ErrorString_$name
ErrorString_$name SETS "$text"
        MEND

        MACRO
$label  AddError2 $name,$text,$value
$label
   [    "$value" = ""
ErrorNumber_$name # 1
   |
ErrorNumber_$name * $value
   ]
        GBLS ErrorString_$name
ErrorString_$name SETS "$text"
        MEND

        MACRO
$label  AddFSError      $class, $baseerr, $fsname, $fsnumber
$label
        LCLA    value
value   SETA    &10000 + $fsnumber*&100 + ErrorNumber_$baseerr._Pre
        LCLS    string
string  SETS    ErrorString_$baseerr._Pre :CC: "$fsname" :CC: ErrorString_$baseerr._Post
        LCLS    string2
string2 SETS    "&":CC:(:STR:value)
        AddError        $class$baseerr, "$string", $string2
        MEND

; Needed to GET Hdr:Sound without Hdr:VickySpace -> Hdr:Macros

;SoundWorkSpace * &01F04000
        GET     Hdr:PublicWS

        AREA    |Text$Data|, DATA

; First output the file header
	BIN	h.swisheader

; Now output all the SWI symbols we can access

        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:SWIs
        GET     Hdr:CPU.Generic26
        GET     Hdr:ModHand

        GET     swioptions.s

; And finally the trailing bits

        =       10
        =       "#endif", 10

; Pad to word align with harmless newlines        
        ALIGN   4, 0, 10

        END
