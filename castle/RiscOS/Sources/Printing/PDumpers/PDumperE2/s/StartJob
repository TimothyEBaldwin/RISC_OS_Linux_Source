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
; > StartJob

;..............................................................................
; 
; Handle the starting of a job.  This simply involves loading the palette
; file and attachig it to the private word associated with the job.  This
; is handled by the Support module.
;
; in    R0 ->private word
;       R2 strip type
;
; out   V =1 => R0 -> error block
                      
StartJob_Monochrome ROUT
StartJob_Grey       ROUT
StartJob_Colour256  ROUT
StartJob_Multi	ROUT
StartJob_16Bit	ROUT
StartJob_24Bit	ROUT

        PDumper_Entry ""

        ADR     R2, pd_error_flag_set
	LDR	r1, [r2]		; ensure that PDumper_OutputReg does not ignore error
	BIC	r1, r1, #3		; (clears error-this-job and GBPB-error-this-job)
        STR     R1, [R2]

        MOV     R1, #0
        STR     R1, pending_line_ends

        MOV     R1,#0                   ;Flags for this call are zero
        ADR     R2,palette_filename     ;->Filename for the job
        SWI     XPDumper_StartJob
        PDumper_Error

        PDumper_Exit

        END
