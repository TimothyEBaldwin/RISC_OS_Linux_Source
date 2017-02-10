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
; -> Unregister.s















;       This contains code for the CD_Unregister SWI

















; by MEW of Eesox 19-Apr-93


;----------------------------------------------------------------------------------------------
cd_unregister ROUT
;
; on entry:
;           r0 -> block
;                 block + 0 = information word for CDFSDriver module
;                 block + 4 = number of times registered (should be set to zero
;                             and will be updated by CDFSDriver)
;                 block + 8 = number of drive types recognised by this driver
;           r1 -> special tag (&EE50EE50 = 1 word) followed by the handler code
;
;           r12 -> my workspace pointer
; on exit:
;          Overflow flag clear if registered OK, else set and R0->error block.
;
;----------------------------------------------------------------------------------------------

; r8 = registered count

 MOV         r6, #0


;--------------------------------------------
; Decrement the registered count
;--------------------------------------------
 LDR         r8, [ r0, #RCB_REGISTERED ]
 SUBS        r8, r8, #1

 addr        r0, not_registered, MI
 BMI         error_handler_lookup

;-------------------------------------------
; If registered more than once then leave it
;-------------------------------------------
 STRNE       r8, [ r0, #RCB_REGISTERED ]
 SWIExitVC   NE


;--------------------------------------------
; Find the handler code in the list
;--------------------------------------------
; r3 -> list
; r4  = list counter
; r5  = current handler pointer
; r6  = 0

 ADR         r3, sld_list
 MOV         r4, #MAX_NUMBER_OF_DRIVERS
02
 LDR         r5, [ r3 ], #4

 SUBS        r4, r4, #1
 addr        r0, not_registered, EQ
 BEQ         error_handler_lookup

 TEQ         r5, r1
 BNE         %BT02

;--------------------------------------------
; Remove the handler from the list
;--------------------------------------------
01

 STR         r6, [ r3, #-4 ]
 RSB         r4, r4, #MAX_NUMBER_OF_DRIVERS - 1

;--------------------------------------------
; Decrease the number of drivers
;--------------------------------------------
 LDR         r14, number_of_drivers
 SUB         r14, r14, #1
 STR         r14, number_of_drivers

;--------------------------------------------
; Remove the block pointer from the list
;--------------------------------------------
 ADR         r3, block_list
 STR         r6, [ r3, r4, LSL #2 ]

;--------------------------------------------
; Remove the workspace pointer from the list
;--------------------------------------------
 ADR        r3, wsp_list
 STR         r6, [ r3, r4, LSL #2 ]

;--------------------------------------------
; Unregistered OK
;--------------------------------------------
 STR         r8, [ r0, #RCB_REGISTERED ]

;--------------------------------------------
 SWIExitVC

;----------------------------------------------------------------------------------------------
;----------------------------------------------------------------------------------------------

 END
