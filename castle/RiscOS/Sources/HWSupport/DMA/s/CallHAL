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
; CallHAL
;
; On entry:
;   r0-r3 hold first 4 arguments
;   up to 4 more arguments are on the stack
;
; On exit:
;   r4-r13 are always preserved
;   optionally r0-r3 and r14 may be preserved
;
; Macro parameters:
;   $routine = name of routine to call
;   $savelist = list of additional registers to save
;               across the call (from the set r0,r1,r2,r3,r14);
;               note that if there is more than one register in the list,
;               this means that the list must be enclosed by quotes

        MACRO
$label  CallHAL $routine, $savelist
        LCLS    reglist
reglist SETS    "r12"
      [ "$savelist"<>""
reglist SETS    "$reglist,$savelist"
      ]
        Push    "$reglist"
        MOV     r14,pc
        LDR     pc,[r0,#HALDevice_$routine]
        Pull    "$reglist"
        MEND

        END
