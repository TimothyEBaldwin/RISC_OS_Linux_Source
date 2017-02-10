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
; -*-As-*-
;
; > riscos.s.STB400
;
; Copyright (c) 1994 Acorn Computers Ltd., Cambridge, England.
;
; Assembler source for FPA support code and emulator
; ==================================================
; Header file for the riscos veneer.
;

                GBLS    VeneerName      ;The name of the veneer to use
VeneerName      SETS    "riscos"

                GBLS    CoreDir
CoreDir         SETS    "^.coresrc.s."  ;RISC OS uses "." as the directory
                                        ; separator character

                GBLS    VeneerDir
VeneerDir       SETS    "^.vensrc.$VeneerName.."
                                        ;NB first "." after "$VeneerName"
                                        ; terminates the variable name, the
                                        ; second is the directory separator

                GBLS    FileExt
FileExt         SETS    ""              ;RISC OS doesn't use filename
                                        ; extensions

;
; Controls for veneer sources
;
	GBLS	Flavour
Flavour	SETS	"HardOnly"

	GBLL	Arm600
Arm600	SETL	{TRUE}

        LNK     $CoreDir.main$FileExt
