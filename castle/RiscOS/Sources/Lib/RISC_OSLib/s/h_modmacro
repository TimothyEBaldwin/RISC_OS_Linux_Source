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
; Copyright (C) Acorn Computers Ltd., 1988

        GBLS    VBar
        GBLS    XXModuleName

; :OR: this with the library segment tag to bind with ROM applications only

library_segment_is_ROM_only * &80000000 ; To make ROM version
; library_segment_is_ROM_only * 0       ; To make RAM version

VBar    SETS    "|"

        MACRO
        Module  $name
XXModuleName SETS "_":CC:"$name":CC:"_"
        MEND

        MACRO
        LoadStaticAddress $Addr, $Reg, $Reg2
        LCLS    reg2
 [ "$Reg2"=""
reg2    SETS    "ip"
 |
reg2    SETS    "$Reg2"
 ]
        LDR     $Reg, =$Addr
        LDR     $reg2, [sl, #SL_Lib_Offset]
        ADD     $Reg, $Reg, $reg2
        MEND

        MACRO
        LoadStaticBase $Reg, $Reg2
        LoadStaticAddress StaticData, $Reg, $Reg2
        MEND

        MACRO
$Label  Variable $Size
        LCLS    Temps
        LCLA    Tempa
 [ "$Size"=""
Tempa   SETA    1
 |
Tempa   SETA    $Size
 ]
Temps   SETS    VBar:CC:XXModuleName:CC:"$Label":CC:VBar
        KEEP    $Temps
        ALIGN
O_$Label *      .-StaticData
$Temps  %       &$Tempa*4
        MEND

        MACRO
$Label  ExportedVariable $Size
        LCLS    Temps
        LCLA    Tempa
 [ "$Size"=""
Tempa   SETA    1
 |
Tempa   SETA    $Size
 ]
Temps   SETS    VBar:CC:"$Label":CC:VBar
        EXPORT  $Temps
        ALIGN
O_$Label *      .-StaticData
$Temps  %       &$Tempa*4
        MEND

        MACRO
$Label  ExportedWord $Value
        LCLS    Temps
Temps   SETS    VBar:CC:"$Label":CC:VBar
        EXPORT  $Temps
        ALIGN
O_$Label *      .-StaticData
$Temps   &      $Value
        MEND

        MACRO
$Label  VariableByte $Size
        LCLS    Temps
        LCLA    Tempa
 [ "$Size"=""
Tempa   SETA    1
 |
Tempa   SETA    $Size
 ]
Temps   SETS    VBar:CC:XXModuleName:CC:"$Label":CC:VBar
        KEEP    $Temps
O_$Label *      .-StaticData
$Temps  %       &$Tempa
        MEND

        MACRO
$Label  InitByte $Value
$Label  =        $Value
        MEND

        MACRO
$Label  InitWord $Value
$Label  &        $Value
        MEND

        MACRO
$Label  Keep    $Arg
        LCLS    Temps
$Label  $Arg
Temps   SETS    VBar:CC:XXModuleName:CC:"$Label":CC:VBar
        KEEP    $Temps
$Temps
        MEND

 [ :LNOT::DEF:NoStubEntries

        ; Macro for generating the library end of entrypoint tables
        ; import  non-null if the entry isn't defined in the assembler part
        ;         of the library (conventionally has the value 'import')
        ; sym2    non-null if the stub is to be patched to branch to a symbol
        ;         other than the entry name
        ; direct  null       APCS_A compatibility veneer to be used
        ;         'direct'   APCS_A compatibility entry may branch directly to
        ;                    the entry (which does not use sp, fp, ip)
        ;         other      APCS_A compatibility entry branches directly to
        ;                    this symbol.
        ;         'unveneered' no compatibility veneer entry (subsequent
        ;                    addition).
        ; args    argument count or 'varargs'.  Selects which compatability
        ;         veneer should be used (if direct is null).
        ; directlocal  if direct is <other>, and this is null, then <other>
        ;              is a local symbol, otherwise the value should be either
        ;              "EXPORT" or "IMPORT"
        ; fpabi   floating point ABI qualifier(s) to add to IMPORT/EXPORT

        MACRO
        Entry   $sym, $import, $sym2, $direct, $args, $directlocal, $fpabi
        LCLS    Temps
   [ "$sym2" <> ""
Temps   SETS    "$sym2"
     |
Temps   SETS    "$sym"
   ]
   [ "$import"<>""
        IMPORT  $Temps $fpabi
   ]
        DCD     $Temps
        MEND



        MACRO
        Entry2   $sym, $import, $sym2, $direct, $args, $directlocal, $ignore, $fpabi
        LCLS    Temps
   [ "$sym2" <> ""
Temps   SETS    "$sym2"
     |
Temps   SETS    "$sym"
   ]
   [ "$import"<>""
        IMPORT  $Temps $fpabi
   ]
        DCD     $Temps
        MEND



 ] ; :LNOT::DEF:NoStubEntries

        END
