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
; > StartPage

;..............................................................................
;
; call: StartPage_Code
;
; in:   r0   = copies to do
;       r1   = file handle
;       r2   = strip type
;       r3   = number of blank pixel rows before start of data
;       r4  -> our private pdumper word for job
;       r5   = job workspace
;       r6   = number of blank pixels before start of line
;       r7   = horizontal and vertical resolution packed into a single word.
;
; out:  V clear;
;         r0 = number of copies to be performed
;         r3 = number of blank pixel rows before start of of image
;
;       V set;
;         r0 -> error block.
;                  
; Routine to output the control block for the sprite - attempt to claim
; a suitable block and then setup our configuration into it.
;
; When the end of day occurs we then re-write the header block back into
; the file and truncate to include only the suitable data.
;  

StartPage_Colour256 ROUT
StartPage_Multi		ROUT
StartPage_16Bit		ROUT
StartPage_24Bit		ROUT
        B       BadStripType

StartPage_Monochrome ROUT
StartPage_Grey ROUT
                         
        PDumper_Entry "R0-R2,R7"

        STR     R1,FileHandle           ;Stash the file handle
                             
        PDumper_Reset                   ;Reset buffering pointers

        LDR     R3,=&0ACE0000           ;Spit out suitable tag
        PDumper_PrintBinaryWord R3,R14
        MOV     R3,R3,LSR #16
        PDumper_PrintBinaryWord R3,R14

        PDumper_PrintBinaryWord R7,R14  ;Spit out the resolution

        PDumper_EmptyBuffer             ;Flush the buffers

        MOV     R3,#0                   ;Skip has already been performed
        PDumper_Exit

        END

