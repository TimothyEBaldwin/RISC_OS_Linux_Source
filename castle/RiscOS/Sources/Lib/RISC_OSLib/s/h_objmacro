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
        GBLS    UL
        GBLS    XXModuleName

VBar    SETS    "|"
UL      SETS    "_"

        MACRO
        Module  $name
XXModuleName SETS UL:CC:"$name":CC:UL
        MEND

        MACRO
        LoadStaticAddress $Addr, $Reg, $Ignore
        LDR     $Reg, =$Addr
        MEND

        MACRO
        LoadStaticBase $Reg, $Ignore
        LoadStaticAddress StaticData, $Reg, $Ignore
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

        END
