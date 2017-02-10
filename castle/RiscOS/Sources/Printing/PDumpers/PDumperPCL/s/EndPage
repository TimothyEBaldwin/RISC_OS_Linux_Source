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
; > EndPage

;..............................................................................;
;
; call: EndPage_Code
;
; in:   r1   = file handle
;       r2   = strip type
;       r3  -> out private pdumper word for the job.
;       r4  -> job workspace.
;
; out:  -
;
; THis code handles the output code for the end of page.
;
EndPage_Colour256 ROUT
EndPage_Monochrome ROUT
EndPage_Grey ROUT
EndPage_Multi	ROUT
EndPage_16Bit	ROUT
EndPage_24Bit	ROUT
                    
        PDumper_Entry "R0-R1"
                     
        STR     R1,FileHandle           ;Stash the file handle
        PDumper_Reset

        ADRL	R0,pageend              ;End of page sequence
        PDumper_PrintCountedString R0,R1,LR

      [ sendformfeed
        LDRB    R0,[R4,#pd_private_flags]
        TST     R0,#pdf_NoPageEject     ;Should I send a form feed.
        BNE     skipformfeed
                      
        MOV     R0,#12                  ;Bit clear, so send the form feed
        PDumper_OutputReg R0
      ]

skipformfeed
; HzN - do not reset printer at end of page since that makes e.g. duplex impossible!
;       ADRL	R0,pageend2
;       PDumper_PrintCountedString R0,R1,LR

        PDumper_EmptyBuffer        
        PDumper_Error

        PDumper_Exit

pageend  = 4,27,"*rB"
; HzN
; [ RobStrings
;pageend2 = 16,27,"&a0C",27,"E",27,"%-12345X"
; |
;pageend2 = 7,27,"&a0C",27,"E"
; ]
        ALIGN

        END
