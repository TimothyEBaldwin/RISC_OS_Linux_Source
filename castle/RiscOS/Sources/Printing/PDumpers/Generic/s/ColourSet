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
; > ColourSet

;..............................................................................
; 
; General colour setting routine, processed by the support module.  This call
; simply modifies the entry parameters ready to pass onto the support
; module.
;
; in    R0 physical colour
;       R2 strip type + pass number in top 8 bits.
;       R3 ->out private pdumper word for the job
;       R4 x halftone in lo-byte, y halftone in byte 1
;       
; out:  R3 colour number (meaining dependings on strip type).

ColourSet_Monochrome ROUT
ColourSet_Grey       ROUT
ColourSet_Colour256  ROUT
ColourSet_Multi		ROUT
ColourSet_16Bit		ROUT
ColourSet_24Bit		ROUT
          
        PDumper_Entry "R0-R2"

        MOV     R1,R0
        MOV     R0,R3                   ;Move anchor word and physical colour
        SWI     XPDumper_SetColour      ;then process the set colour request
        PDumper_Error          

        PDumper_Exit                    ;Return errors aswell

        END
