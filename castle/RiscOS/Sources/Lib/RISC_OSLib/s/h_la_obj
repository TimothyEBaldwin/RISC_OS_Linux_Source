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
;;; h_la_obj.s
;;; Copyright (C) Advanced RISC Machines Ltd., 1991

        MACRO
        DataArea
        AREA    |C$$data|, DATA
        MEND

 [ make <> "shared-library"

        MACRO
        CodeArea
        AREA    |C$$code|, CODE, READONLY
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
        AdconTable
        MEND

        MACRO
        Function $name, $type
        LCLS    Temps
Temps   SETS    VBar:CC:"$name":CC:VBar
        EXPORT  $Temps
$Temps
        MEND

 |

        MACRO
        CodeArea
        AREA    |C$$code|, CODE, READONLY, REENTRANT, PIC
        MEND

        MACRO
        AdconTable
        AREA    |sb$$adcons|, DATA, READONLY, BASED sb
        MEND

        MACRO
        Function $name, $type
        LCLS    Temps
Temps   SETS    VBar:CC:"$name":CC:VBar
 [ "$type" = ""
        EXPORT  $Temps
 |
        EXPORT  $Temps[$type]
 ]
$Temps
        MEND

 ]
        END
