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
r0              RN      0
r1              RN      1
r2              RN      2
r3              RN      3
r4              RN      4
r5              RN      5
r6              RN      6
r7              RN      7
r8              RN      8
r9              RN      9
r10             RN      10
r11             RN      11
r12             RN      12
sp              RN      13
lr              RN      14
pc              RN      15

XMessageTrans_ErrorLookup EQU &61506
MessageTrans_ErrorLookup  EQU &41506

                IMPORT  |_clib_initialisemodule|

                EXPORT  |_inet_initialisemodule|

                AREA    |C$$Code|, CODE, READONLY

|_inet_initialisemodule|
                ADR     r7, |_inet_initialisemodule|
                LDR     r8, |_inet_initialisemodule_adcon|
                CMP     r7, r8
                BEQ     |_clib_initialisemodule|
 ! 0 , "Softload decided upon 0x3800000 as the base of ROM"
                CMP     r8, #&03800000
                BLT     |_clib_initialisemodule|
                ADR     r0, module_ramload_error
                MOV     r1, #0
                MOV     r2, #0
                ADR     r4, titlestr
                MOV     r5, #0
                MOV     r6, #0
                MOV     r7, #0
                SWI     XMessageTrans_ErrorLookup
                LDMIA   sp!, {r7-r11, pc}

|_inet_initialisemodule_adcon|
                DCD     |_inet_initialisemodule|

module_ramload_error
                DCD     &800e0a
                DCB     "RAMLoadC", 0

titlestr
                DCB     "Internet", 0

                END
