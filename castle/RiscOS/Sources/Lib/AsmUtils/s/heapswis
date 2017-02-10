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
; Title:   s.heapswis
; Purpose: Assembler veneers onto OS_Heap for speed
; Author:  KJB
; History: 23-Nov-96: KJB: Created
;          20-Nov-99: SNB: 32-bitness added and rewritten for library
;

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Machine.<Machine>
        GET     Hdr:APCS.<APCS>
        GET     Hdr:Heap

        EXPORT  xosheap_initialise
        EXPORT  xosheap_alloc
        EXPORT  xosheap_free
        EXPORT  xosheap_resize
        EXPORT  xosheap_realloc
        EXPORT  xosheap_read_size

        AREA    |AsmUtils$MemSWIs1$$Code|,CODE,READONLY,PIC
xosheap_initialise
        MOV     R12,LR
        MOV     R3,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_Init
        SWI     XOS_Heap
        ASSERT  HeapReason_Init = 0
        ; MOVVC R0,#0           ; OS_Heap preserves R0
        Return  ,LinkNotStacked,,R12

        AREA    |AsmUtils$MemSWIs2$$Code|,CODE,READONLY,PIC
xosheap_alloc
        FunctionEntry
        MOV     R12,R2
        MOV     R3,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_Get
        SWI     XOS_Heap
        STRVC   R2,[R12]
        MOVVC   R0,#0
        Return

        AREA    |AsmUtils$MemSWIs3$$Code|,CODE,READONLY,PIC
xosheap_free
        MOV     R12,LR
        MOV     R2,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_Free
        SWI     XOS_Heap
        MOVVC   R0,#0
        Return  ,LinkNotStacked,,R12

        AREA    |AsmUtils$MemSWIs4$$Code|,CODE,READONLY,PIC
xosheap_resize
        MOV     R12,LR
        MOV     R3,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_ExtendHeap
        SWI     XOS_Heap
        MOVVC   R0,#0
        Return  ,LinkNotStacked,,R12

        AREA    |AsmUtils$MemSWIs5$$Code|,CODE,READONLY,PIC
xosheap_read_size
        FunctionEntry
        MOV     R12,R2
        MOV     R2,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_ReadBlockSize
        SWI     XOS_Heap
        STRVC   R3,[R12]
        MOVVC   R0,#0
        Return

        AREA    |AsmUtils$MemSWIs6$$Code|,CODE,READONLY,PIC
xosheap_realloc
        FunctionEntry
        MOV     R12,R3
        MOV     R3,R2
        MOV     R2,R1
        MOV     R1,R0
        MOV     R0,#HeapReason_ExtendBlock
        SWI     XOS_Heap
        MOVVC   R0,#0
        STRVC   R2,[R12]
        Return

        END
