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
; > AbortJob

;..............................................................................
; 
; AbortJob
;
; This code handles the aborting of a job, the call can recieve one of
; two different calls, either the inbetween pages call or the end of
; document calls.
;
; This is all processed by the Support module
;
; in    R0 ->private word for job
;       R1 handle
;       R2 strip type
;       R3 fataility indicator
;               >0 if end of document, else between pages tidy up
; 
;       R4 copy of ptr to dumper config if R3 bit 24 set
; out   V =1 => R0 -> error block

AbortJob_Monochrome ROUT
AbortJob_Grey       ROUT
AbortJob_Colour256  ROUT
AbortJob_Multi	ROUT
AbortJob_16Bit	ROUT
AbortJob_24Bit	ROUT

        PDumper_Entry "R0-R2"

        Debug   AbortJob,"(abortjob) private word,handle,strip type,fatal",R0,R1,R2,R3
        TST     R3, #1 :SHL: 24
        BEQ     %FT20           ; do not try a set printer into a sane state

        Push    "R6-R8"
        ADR     R7, pd_error_flag_set
	LDR	r6, [r7]
	ORR	r6, r6, #1	; ignore any error caused when trying to output
        STR     R6, [R7]


        MOV     R6, #&FF
        MOV     R6, R6, LSL #4
        MOV     R7, #0

        PDumper_Reset
01
        PDumper_OutputReg        R7
        BVS     %FT19

        SUBS    R6, R6, #1
        BGT     %BT01

        PDumper_EmptyBuffer
        BVS     %FT19

        BL      EndPage_Monochrome      ; send endofpage sequence

19
        ADR     R7, pd_error_flag_set
	LDR	r6, [r7]
	BIC	r6, r6, #1
        STR     R6, [R7]        ; ignore any error caused when trying to output
        Pull    "R6-R8"

20

        MOV     R1,#0           ;No dumper specific blocks have been claimed
        MOV     R2,R3           ;Get the fataility indicatior
        SWI     XPDumper_TidyJob

        Debug   AbortJob,"(abortjob) back from the tidy SWI"
        DebugE  AbortJob,"(abortjob) went wrong "   
     
        PDumper_Error

        PDumper_Exit

        END
