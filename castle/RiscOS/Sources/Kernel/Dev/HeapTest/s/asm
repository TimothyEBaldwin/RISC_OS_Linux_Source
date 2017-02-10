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

; Assembler gubbins to allow a local copy of the heap manager to be used by
; the testbed application


        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:CPU.Arch
        GET     Hdr:Machine.<Machine>
        GET     Hdr:Heap
        GET     Hdr:Proc
        GET     Hdr:FSNumbers
        GET     Hdr:HighFSI
        GET     Hdr:NewErrors
        GET     Hdr:MsgTrans

; Disable internationalisation
              GBLL International
International SETL {FALSE}

; Indicate we're compiling the testbed
            GBLL HeapTestbed
HeapTestbed SETL {TRUE}

; Heap debugging disabled for now
           GBLL DebugHeaps
DebugHeaps SETL {FALSE}

; Fake zero page workspace

                    ^ 0
IRQsema             # 4
HeapSavedReg_R0     # 4
HeapSavedReg_R1     # 4
HeapSavedReg_R2     # 4
HeapSavedReg_R3     # 4
HeapSavedReg_R4     # 4
HeapSavedReg_R13    # 4
HeapReturnedReg_R0  # 4
HeapReturnedReg_R1  # 4
HeapReturnedReg_R2  # 4
HeapReturnedReg_R3  # 4
HeapReturnedReg_R4  # 4
HeapReturnedReg_R13 # 4
HeapReturnedReg_PSR # 4
ZeroPageSize        * @

; Macros and other bits

        MACRO
        assert  $condition
 [ :LNOT: ($condition)
 ! 1,"Assert failed: $condition"
 ]
        MEND

SVC2632 * SVC32_mode


        AREA    testbeddata, DATA

ZeroPage   % ZeroPageSize

HeapBackgroundError  % 256

        AREA    testbedcode, CODE

; C interface

          EXPORT  CallHeap
CallHeap  ROUT
          ; r0 = _kernel_swi_regs ptr for input/output
          ; Returns error ptr in r0
          Push    "r0,r4-r11,lr"
          LDMIA   r0,{r0-r9}
          SWI     OS_EnterOS ; Call in SVC mode?
          BL      DoCallXOSHeap
          MOVVS   r10,r0
          MOVVC   r10,#0
          SWI     OS_LeaveOS
          Pull    "r11"
          STMIA   r11,{r0-r9}
          MOV     r0,r10
          Pull    "r4-r11,pc"

; Assembler bits for use by heap code

DoCallXOSHeap
          ; Fake an XOS_Heap SWI
          ; Preserve r10-r12 and enter with PSR in lr
          Push    "r10-r12,lr"
          MRS     lr,CPSR
          B       HeapEntry

; Main heap manager code

        GET      ^.^.s.HeapMan

        END
