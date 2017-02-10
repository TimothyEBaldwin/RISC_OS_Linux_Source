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
; Note that the module header only needs to know that the
; size of the block has to be stored in its 1st word, with the
; 2 relocation offsets following immediately after.

                ^       0               ; Offsets in global workspace
blocksize       #       4
libRelocation   #       4
clientRelocation #      4
fixedwssize     #       0

        GBLS    VBar
VBar    SETS    "|"

        MACRO
        Entry   $sym, $import, $sym2, $direct, $varargs, $directlocal, $fpabi
        LCLS    temps
temps   SETS    "$sym"
        EXPORT  $temps $fpabi
$temps  MOV     pc, #0
        MEND

        MACRO
        Entry2  $sym, $import, $sym2, $direct, $varargs, $directlocal, $alias, $fpabi
        LCLS    temps
        LCLS    temps1
temps   SETS    "$sym"
temps1  SETS    "$alias"
        EXPORT  $temps $fpabi
        EXPORT  $temps1 $fpabi
$temps1
$temps  MOV     pc, #0
        MEND



        MACRO
$Label  Variable $Size
        LCLA    Tempa
        LCLS    Temps
 [ "$Size"=""
Tempa   SETA    1
 |
Tempa   SETA    $Size
 ]
Temps   SETS    VBar:CC:"_stub_$Label":CC:VBar
        KEEP    $Temps
        ALIGN
$Temps  %       &$Tempa*4
        MEND

        MACRO
$Label  Alias $VariableName, $WordOffset
        LCLS    Temps
Temps   SETS    VBar:CC:"$Label":CC:VBar
        EXPORT  $Temps
$Temps   *      $VariableName + 4*$WordOffset
        MEND

        MACRO
$Label  ExportedVariable $Size
        LCLA    Tempa
        LCLS    Temps
 [ "$Size"=""
Tempa   SETA    1
 |
Tempa   SETA    $Size
 ]
Temps   SETS    VBar:CC:"$Label":CC:VBar
        EXPORT  $Temps
        ALIGN
$Temps  %       &$Tempa*4
        MEND

        MACRO
$Label  ExportedWord $Value
        LCLS    Temps
Temps   SETS    VBar:CC:"$Label":CC:VBar
        EXPORT  $Temps
        ALIGN
$Temps  %       4
        MEND

        MACRO
$Label  VariableByte $Size
        LCLA    Tempa
        LCLS    Temps
 [ "$Size"=""
Tempa   SETA    1
 |
Tempa   SETA    $Size
 ]
Temps   SETS    VBar:CC:"_stub_$Label":CC:VBar
        KEEP    $Temps
$Temps  %       &$Tempa
        MEND

        MACRO
$Label  InitByte $Value
$Label  VariableByte 1
        MEND

        MACRO
$Label  InitWord $Value
$Label  %      4
        MEND

        END
