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
; FSEntry_Args

;***************************************************************************
ReadSizeAllocatedToFile   ; 4   ; 7
;***************************************************************************

; FSEntry_Args 7 also comes through here, R2 = size of file to ensure

; on entry:
;       R0 = 4
;       R1 = file handle

; on exit:
;       R2 = size allocated to file by filing system

        ADR     R5, OpenFileList - 4         ; R6 -> my little buffer of entry details
        LDR     R6, [ R5, R1, ASL #2 ]       ;
                
        LDR     R2, [ R6, #SIZEOFFILEOPEN ]
                
        STR     R2, [R13, #2*4]
                
        PullAllFromFrameAndExit

;***************************************************************************
ReadFileDateStamp   ; 9
;***************************************************************************

; on entry:
;       R0 = 9
;       R1 = file handle

; on exit:
;       R2 = load address of file ( or 0 )
;       R3 = execution address of file ( or 0 )

        PullAllFromFrame
        
        MOV     R2, #0
        MOV     R3, #0
                
        MOV     PC, R14

;***************************************************************************
;***************************************************************************
;***************************************************************************

        LTORG

        END



