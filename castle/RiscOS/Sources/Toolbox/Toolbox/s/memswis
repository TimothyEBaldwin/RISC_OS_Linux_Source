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
; Title:   s.memswis
; Purpose: Assembler veneers onto OS_Heap for speed
; Author:  KJB
; History: 23-Nov-96: KJB: Created
;

        AREA    MemSWIs,CODE,READONLY,PIC

        EXPORT  xosheap_initialise
        EXPORT  xosheap_alloc
        EXPORT  xosheap_free
        EXPORT  xosheap_realloc
        EXPORT  xosheap_resize
        EXPORT  xosheap_read_size
        EXPORT  xosmodule_realloc

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Heap
        GET     Hdr:ModHand

        MACRO
        MOVRet  $lr,$cond
        [ {CONFIG}=26
        MOV$cond.S    pc,$lr
        |
        MOV$cond      pc,$lr
        ]
        MEND

        MACRO
        LDMRet
        [ {CONFIG}=26
        Pull          "pc",,^
        |
        Pull          "pc"
        ]
        MEND


xosheap_initialise
        MOV     R12,LR
        MOV     R3,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_Init
        SWI     XOS_Heap
        ASSERT  HeapReason_Init = 0
        ; MOVVC R0,#0           ; Not needed because R0 will be preserved
        MOVRet  R12

xosheap_alloc
        Push    "LR"
        MOV     R12,R2
        MOV     R3,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_Get
        SWI     XOS_Heap
        STRVC   R2,[R12]
        MOVVC   R0,#0
        LDMRet

xosheap_free
        MOV     R12,LR
        MOV     R2,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_Free
        SWI     XOS_Heap
        MOVVC   R0,#0
        MOVRet  R12

xosheap_realloc
        Push    "LR"
        MOV     R12,R3
        MOV     R3,R2
        MOV     R2,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_ExtendBlock
        SWI     XOS_Heap
        STRVC   R2,[R12]
        MOVVC   R0,#0
        LDMRet

xosheap_resize
        MOV     R12,LR
        MOV     R3,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_ExtendHeap
        SWI     XOS_Heap
        MOVVC   R0,#0
        MOVRet  R12

xosheap_read_size
        Push    "LR"
        MOV     R12,R2
        MOV     R2,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_ReadBlockSize
        SWI     XOS_Heap
        STRVC   R3,[R12]
        MOVVC   R0,#0
        LDMRet

xosmodule_realloc
        MOV     R12,LR
        MOV     R3,R1
        MOV     R1,R2
        MOV     R2,R0
        MOV     R0,#ModHandReason_ExtendBlock
        SWI     XOS_Module
        STRVC   R2,[R1]
        MOVVC   R0,#0
        MOVRet  R12

        END
