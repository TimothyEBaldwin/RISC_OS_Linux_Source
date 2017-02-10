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
; > Sources.Front


;******************************************************************************
;
; Module workspace layout
;
                ^       0,R12
MsgTransBlk     #       16      ; for MessageTrans calls
CPUClkDevice    #       4       ; HALDevice_CPUClk ptr
CPUSpeed_Slow   #       4       ; 'slow' speed (table index)
CPUSpeed_Fast   #       4       ; 'fast' speed (table index)
CPUSpeed        #       4       ; Portable_Speed flags
BMUDevCount     #       4       ; Number of known BMU HAL devices
BMUDevList      #       4       ; List of BMU HAL devices
BMUDev0         #       4       ; HAL device used for BMU 0
Idle            #       4       ; WFI routine
DSB_Write       #       4       ; DSB_Write ARMop ptr
 [ DebugSpeed
LastTimer       #       4       ; Last value of the timer we're using to time stuff
FastTime        #       4       ; Cumulative time spent fast (incl. Idle)
SlowTime        #       4       ; Cumulative time spent slow (incl. Idle)
ChangeTime      #       4       ; Cumulative time spent changing speed
FastIdle        #       4       ; Cumulative time spent in Idle while fast
SlowIdle        #       4       ; Cumulative time spent in Idle while slow
 ]
;
 [ Erratum_486865 = "Workaround"
WFI_code_size   *       9*4
WFI_code        #       28+WFI_code_size  ; max 28 bytes to align to cache line
 ]
MemNeeded       *       :INDEX:@


;******************************************************************************

        END
