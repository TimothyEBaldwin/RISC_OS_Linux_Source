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
;-------------------------------------------------------------------------
;
; RamFS_entry
;
; Entry point for RamFS discs.
RamFS_entry

        TEQ     r0,#FreeReason_GetName
        BEQ     RamFS_GetName
        TEQ     r0,#FreeReason_GetSpace
        BEQ     RamFS_GetSpace
        TEQ     r0,#FreeReason_ComparePath
        BEQ     RamFS_ComparePath


        Pull    "PC"

;-----------------------------------------------------------------------
; RamFS_GetName
;
; Put the name of the drive specified in r3 into the buffer at r2
;
RamFS_GetName

        Push    "r1-r3"

        Debug   xx,"Get name"

        MOV     r0,r3
        ADR     r1,disc_desc
        SWI     XRamFS_DescribeDisc
        Pull    "r1-r3,PC",VS

        ADD     r4,r1,#22
        MOV     r0,r2
        MOV     r3,#10
        BL      copy_r0r4r3_space     ; Copy name to buffer

        MOV     r0,#11             ; Name is 10 chars + terminator.

        Pull    "r1-r3,PC"
;-----------------------------------------------------------------------
; RamFS_GetSpace
;
; Put the free space on the drive specified in r3 into the buffer at r2
;
RamFS_GetSpace

        Push    "r1-r3"

        Debug   xx,"Get space"


        MOV     r0,r3
        ADR     r1,disc_desc
        SWI     XRamFS_DescribeDisc
        Pull    "r1-r3,PC",VS

        LDR     r0,[r1,#16]        ; Store disc size in buffer.
        STR     r0,[r2]

        MOV     r0,r3
        SWI     XRamFS_FreeSpace
        Pull    "r1-r3,PC",VS

        STR     r0,[r2,#4]         ; Free space
        LDR     r1,[r2]
        SUB     r1,r1,r0
        STR     r1,[r2,#8]         ; used space

        Pull    "r1-r3,PC"

;-------------------------------------------------------------------------
; RamFS_ComparePath
;
;

RamFS_ComparePath

        Debug  xx,"RAMFS compare"

        CMP    r0,r0

        Pull   "PC"

        LNK     s.SCSI
