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
;-*- Mode: Assembler -*-
; Last modified 09 Feb 88 11:04:33 by HCMM
;
; Copyright (C) Acorn Computers Ltd., 1988.
;
; Add new entries ONLY AT THE END of the list

        Entry   _kernel_init   , , , direct, 0
        Entry   _kernel_exit   , , ,  , 1
        Entry   _kernel_setreturncode   , , , , 1
        Entry   _kernel_exittraphandler , , , , 0
        Entry   _kernel_unwind          , , , , 2
        Entry   _kernel_procname        , , , , 1
        Entry   _kernel_language        , , , , 1

        Entry   _kernel_command_string  , , , , 0
        Entry   _kernel_hostos          , , , , 0
        Entry   _kernel_swi             , , , , 3
        Entry   _kernel_osbyte          , , , , 3
        Entry   _kernel_osrdch          , , , , 0
        Entry   _kernel_oswrch          , , , , 1
        Entry   _kernel_osbget          , , , , 1
        Entry   _kernel_osbput          , , , , 2
        Entry   _kernel_osgbpb          , , , , 3
        Entry   _kernel_osword          , , , , 2
        Entry   _kernel_osfind          , , , , 2
        Entry   _kernel_osfile          , , , , 3
        Entry   _kernel_osargs          , , , , 3
        Entry   _kernel_oscli           , , , , 1
        Entry   _kernel_last_oserror    , , , , 0
        Entry   _kernel_system          , , , , 2
        Entry   _kernel_getenv          , , , , 3
        Entry   _kernel_setenv          , , , , 2

        Entry   _kernel_register_allocs , , , , 2
        Entry   _kernel_alloc           , , , , 2

        Entry   _kernel_stkovf_split_0frame, , , _kernel_stkovfs_0v, , EXPORT
        Entry   _kernel_stkovf_split       , , , _kernel_stkovfs_v, , EXPORT
        Entry   _kernel_stkovf_copyargs    , , , _kernel_NoVeneer, , EXPORT
        Entry   _kernel_stkovf_copy0args   , , , _kernel_NoVeneer

        Entry   _kernel_udiv   , , |_kernel_udiv$variant|, , 2
        Entry   _kernel_urem   , , , , 2
        Entry2   _kernel_udiv10 , , |_kernel_udiv10$variant|, direct, 1, ,__rt_udiv10
        Entry   _kernel_sdiv   , , |_kernel_sdiv$variant|, , 2
        Entry   _kernel_srem   , , , , 2
        Entry2  _kernel_sdiv10 , , |_kernel_sdiv10$variant|, direct, 1, ,__rt_sdiv10

        Entry   _kernel_fpavailable , , , , 0
        Entry   _kernel_moduleinit  , , , unveneered

        Entry   _kernel_irqs_on  , , |_kernel_irqs_on$variant|, unveneered
        Entry   _kernel_irqs_off , , |_kernel_irqs_off$variant|, unveneered
        Entry   _kernel_irqs_disabled , , , unveneered

        Entry   _kernel_entermodule , , , unveneered
        Entry   _kernel_escape_seen , , , unveneered

        Entry   _kernel_current_stack_chunk , , , unveneered
        Entry   _kernel_swi_c , , , unveneered
        Entry   _kernel_register_slotextend, , , unveneered

        Entry   _kernel_raise_error, , , unveneered

        END
