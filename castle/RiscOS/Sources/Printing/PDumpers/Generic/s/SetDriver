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
; > SetDriver

;..............................................................................
;
; Handle the configuration of this PDumper, this includes the palette filename
; and configuration words.  Take copies of the important information for
; processing later on.
;
; in    R0 pdumper number
;       R1 ->RMEnsure command
;       R2 ->palette filename
;       R4 ->job workspace
;       R5 configuration word
;
; out   V =1 => R0 -> error block

SetDriver_Monochrome ROUT
SetDriver_Grey       ROUT
SetDriver_Colour256  ROUT
SetDriver_Multi		ROUT
SetDriver_16Bit		ROUT
SetDriver_24Bit		ROUT

        PDumper_Entry "R0-R2"

        ADR     R0,palette_filename     ;Pass to the support module to copy the name away
        MOV     R1,#?palette_filename
        MOV     R2,R3
        SWI     XPDumper_CopyFilename
        PDumper_Error                   ;...trap any errors returned

        PDumper_Exit                    ;Finished copying so exit

        END
