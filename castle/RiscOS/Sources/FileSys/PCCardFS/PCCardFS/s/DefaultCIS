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
;***********************
;Default CIS information
;***********************

;This is the CIS laid onto a completely blank card....

	EXPORT 	Default_CIS
	EXPORT	Default_CIS_End

        AREA    |C$$code|, CODE, READONLY

        AREA    |C$$data|, DATA

	ALIGN

Default_CIS

DEV_ID	= &01, &03, &61, &00, &ff
LEV1    = &15, &10, &04, &01, "Unknown", &00, "SRAM", &00, &ff
LEV2    = &40, &27, &00, &00, &00, &01, &00, &00, &00, &00, &01, "Acorn Computers Ltd.", &00, "PCCardFS", &00
FORMAT 	= &41, &14, &00, &00, &00, &01, &00, &00, &00, &00, &00, &00, &00, &02, &00, &00, &00, &00, &00, &00, &00, &00
TPLORG	= &46, &0a, &00, "PCCARDFS", &00
ENDCIS	= &ff

Default_CIS_End

DUMMY   = &ff
	ALIGN

	END

