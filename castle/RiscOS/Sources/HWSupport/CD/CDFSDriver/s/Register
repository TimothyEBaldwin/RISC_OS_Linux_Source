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
; -> Register.s















;       This contains code for the CD_Register SWI

















; by MEW of Eesox 19-Apr-93


;----------------------------------------------------------------------------------------------
cd_register ROUT
;
; on entry:
;           r0 -> block
;                 block + 0 = information word for CDFSDriver module
;                 block + 4 = number of times registered (should be set to zero
;                             and will be updated by CDFSDriver)
;                 block + 8 = number of drive types recognised by this driver
;           r1 -> special tag (&EE50EE50 = 1 word) followed by the handler code
;           r2 -> workspace for soft-loadable module (this will be R12 in the handler)
;
;           r12 -> my workspace pointer
; on exit:
;          Overflow flag clear if registered OK, else set and R0->error block.
;
;----------------------------------------------------------------------------------------------

;--------------------------------------------
; Make sure that the driver code has the tag
;--------------------------------------------
 LDR         r14, [ r1 ]
 MOV         r3, #&50
 ORR         r3, r3, #&EE00
 ORR         r3, r3, r3, LSL #16
 TEQ         r3, r14
 addr        r0, driver_not_present, NE
 BNE         error_handler_lookup


; r8 = registered count

;--------------------------------------------
; Increment the registered count
;--------------------------------------------
 LDR         r8, [ r0, #RCB_REGISTERED ]
 TEQ         r8, #0
 ADD         r8, r8, #1

; If already registered then leave it, else register it
 STRNE       r8, [ r0, #RCB_REGISTERED ]
 SWIExitVC   NE


;--------------------------------------------
; Add the handler code pointer to the list
;--------------------------------------------
; r3 -> list
; r4  = list counter
; r5  = current handler pointer

 ADR         r3, sld_list
 MOV         r4, #MAX_NUMBER_OF_DRIVERS

; Look for a spare place in the list
02
 LDR         r5, [ r3 ], #4
 TEQ         r5, #0
 BEQ         %FT01

 SUBS        r4, r4, #1
 BNE         %BT02

 addr        r0, too_many_drivers
 B           error_handler_lookup

01
 STR         r1, [ r3, #-4 ]

;--------------------------------------------
; Increment the number of drivers
;--------------------------------------------
 LDR         r14, number_of_drivers
 ADD         r14, r14, #1
 STR         r14, number_of_drivers

;--------------------------------------------
; Add the block pointer to the list
;--------------------------------------------

 RSB         r4, r4, #MAX_NUMBER_OF_DRIVERS

 ADR         r3, block_list
 STR         r0, [ r3, r4, LSL #2 ]

;--------------------------------------------
; Add the workspace pointer to the list
;--------------------------------------------
 ADR         r3, wsp_list
 STR         r2, [ r3, r4, LSL #2 ]


;--------------------------------------------
; Increment registered count if all OK
;--------------------------------------------
 STR         r8, [ r0, #RCB_REGISTERED ]

;--------------------------------------------
 SWIExitVC

;----------------------------------------------------------------------------------------------

 END
