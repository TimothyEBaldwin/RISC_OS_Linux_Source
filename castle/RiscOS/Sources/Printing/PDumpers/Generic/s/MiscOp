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
; > MiscOp

;..............................................................................
;
; Cope with calls to the MiscOp entry within the PDumper module.  These are
; filtered in from the PDriverDP module.
;
; in    as for PDriver_MiscOp
;
; out   V =1 => R0 -> error block

MiscOp_Monochrome ROUT
MiscOp_Grey       ROUT
MiscOp_Colour256  ROUT
MiscOp_Multi	ROUT
MiscOp_16Bit	ROUT
MiscOp_24Bit	ROUT

        MOV     PC,LR

        END
