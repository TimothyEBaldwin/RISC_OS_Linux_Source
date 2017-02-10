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
; Error tokens for C

        EXPORT  mb_malloc_failed
        EXPORT  mb_unexpected_state
        EXPORT  mb_slotsize_too_small
        EXPORT  mb_broken_templates

        AREA    Error_Blocks, READONLY, PIC, REL
mblock_slotsize_too_small
        DCB     "ER0", 0

mblock_malloc_failed
        DCB     "ER1", 0


mblock_unexpected_state
        DCB     "ER2", 0

mblock_broken_templates
        DCB     "ER3", 0

        AREA    Error_Block_Pointers, REL, DATA

mb_malloc_failed        DCD     mblock_malloc_failed
mb_unexpected_state     DCD     mblock_unexpected_state
mb_slotsize_too_small   DCD     mblock_slotsize_too_small
mb_broken_templates     DCD     mblock_broken_templates

        END

