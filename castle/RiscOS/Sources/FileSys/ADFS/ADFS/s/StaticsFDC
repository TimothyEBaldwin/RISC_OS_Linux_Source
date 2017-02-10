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
;>StaticsFDC
        SUBT    765 Floppy Disk driver static storage
;-----------------------------------------------------------------------;
; (C) Copyright 1990 Acorn Computers Limited,                           ;
; Fulbourn Road, Cambridge CB1 4JN, England.                            ;
; Telephone 0223 214411.                                                ;
;                                                                       ;
; All rights reserved.  The software code in this listing is proprietary;
; to Acorn Computers Ltd., and is covered by copyright protection.      ;
; The unauthorized copying, adaptation, distribution, use or display    ;
; is prohibited without prior consent.                                  ;
;-----------------------------------------------------------------------;
; Revision History:                                                     ;
; No.    Date    By     Reason                                          ;
;-----------------------------------------------------------------------;
; 01  12 Dec 90  lrust  Conception                                      ;
;_______________________________________________________________________;
;
StaticsFDCed    * 02                    ; Edition number

;-----------------------------------------------------------------------;
; This file defines all static storage used by the '765 floppy disk     ;
; driver                                                                ;
;_______________________________________________________________________;

FlpBase         a4 4                    ; Ptr-> '765 registers
 [ FloppyPCI
FlpDMAHandle    a4 4                    ; DMA manager channel handle
FlpDMATag       a4 4                    ; DMA manager transfer tag
FlpDMACount     a4 4                    ; Amount transferred by DMA
FlpDMAHandlers  a4 5*4                  ; DMA handler table
 |
FlpDACK_TC      a4 4                    ; '765 DMA ACK with TC
 ]

FlpDCBqueue     a4 4                    ; Ptr-> 1st DCB in queue
FlpState        a4 4                    ; Ptr-> FDC event handler
FlpDrive        a4 4                    ; Ptr-> motor event handler
FlpDrvMap       a4 4                    ; Logical to physical drive map
FlpMEMCstate    a4 4                    ; Save area for MEMC state
FlpFgScatter    a4 4*4                  ; Scatter list for foreground
FlpFgStatus     a4 4*4                  ; Foreground results

FlpStateTimer   # 1                     ; FDC state m/c timer
FlpMotorTimer   # 1                     ; Motor on/off timer
FlpDriveLock    # 1                     ; Drive motor lock, b0=command, b1=FileCore, b2= Empty
FlpDriveIP      # 1                     ; Index pulse counter

FlpDORimage     # 1                     ; Image of Digital O/P reg
FlpCCRimage     # 1                     ; Image of clock control reg
FlpSRTimage     # 1                     ; Last step rate selected
FlpDrvNum       # 1                     ; Last drive selected
FlpFiqMiscWs    # 4*4

FlpDCBsize      * 64                    ; DCB block size
FlpDCB          a4 FlpDCBsize           ; DCB for DiscOp use
                a4 0
 [ FloppyPCI
FlpDMAScatter   a4 8*16                 ; Scatter list for DMA_QueueTransfer
 ]

FlpFiqStackBase * FiqWorkEnd

        END
