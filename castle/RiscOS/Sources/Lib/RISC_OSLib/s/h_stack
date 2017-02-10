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
; Copyright (C) Acorn Computers Ltd., 1988
SL_Lib_Offset     *      -540
SL_Client_Offset  *      -536

; Stack chunks
                ^       0
SC_mark         #       4
SC_next         #       4
SC_prev         #       4
SC_size         #       4
SC_deallocate   #       4
SC_LibOffset    #       4
SC_ClientOffset #       4
SC_veneerStaticLink #   4
SC_veneerStkexLink  #   4
SC_DescSize     #       0

SC_SLOffset     *       560
IsAStackChunk   *       &f60690ff

ChunkChange     *       &00000001       ; marker in FP values in stack

RootStackSize   *       4*1024
OldRootStackSize *      16*1024         ; release 3 value
SafeStackSize   *       RootStackSize-SC_SLOffset

; The size of a private stack chunk, used purely for allocating new
; stack chunks (in GetStackChunk).
ExtendStackSize *       150*4 + SC_DescSize

; A stack frame, relative to its fp value
frame_entrypc   *       0
frame_link      *       -4
frame_sp        *       -8
frame_prevfp    *       -12

        END
