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
; ADFS_SA (StrongARM)

  [ StrongARM

ARM_config_cp        CP 15  ;coprocessor number for configuration control

ARM_ID_reg           CN  0  ;processor ID

ARM8A_cache_reg      CN  7  ;cache operations, ARMs 8 or StrongARM


C0  CN  0
C1  CN  1
C2  CN  2
C3  CN  3
C4  CN  4
C5  CN  5
C6  CN  6
C7  CN  7
C8  CN  8
C9  CN  9
C10 CN 10
C11 CN 11
C12 CN 12
C13 CN 13
C14 CN 14
C15 CN 15

; local version of SynchroniseCodeAreas (avoids calling a SWI,
; which busts things with background operations)
;
; entry: r0 = low addr
;        r1 = high addr (inclusive)
;
; exit:  corrupts r0,r1,r2
;
ADFSsync ROUT
 [ HAL
        Push    "lr"
        MOV     r0, #1
        MOV     r1, r0
        MOV     r2, r1
        SWI     XOS_SynchroniseCodeAreas
        Pull    "pc"
 |
        MRC     ARM_config_cp,0,r2,ARM_ID_reg,C0,0
        AND     r2,r2,#&F000
        CMP     r2,#&A000
        BNE     %FT02        ;not SA

        BIC     r0,r0,#31    ;align down to 8-word (1 cache line) boundary
        ADD     r1,r1,#31
        BIC     r1,r1,#31    ;align up to 8-word boundary
01
        MCR     ARM_config_cp,0,r0,ARM8A_cache_reg,C10,1   ;clean DC entry
        ADD     r0,r0,#32    ;next line
        CMP     r0,r1
        BLO     %BT01
        MCR ARM_config_cp,0,R0,ARM8A_cache_reg,C10,4         ;drain WB
        MCR ARM_config_cp,0,R0,ARM8A_cache_reg,C5,0          ;flush IC
        MOV     r0,r0
        MOV     r0,r0
        MOV     r0,r0

        MOV     pc,lr

  ] ;HAL

  ] ;StrongARM

        END
