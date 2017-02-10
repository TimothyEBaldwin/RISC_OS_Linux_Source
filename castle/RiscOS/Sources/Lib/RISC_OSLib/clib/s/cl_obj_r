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
; -*- Mode: Assembler -*-
;* Lastedit: 22 Feb 90 16:05:04 by Harry Meekings *
; driver code to call _main for NorCroft C system.
; Version to sit on top of shared library kernel
;
; Copyright (C) Acorn Computers Ltd., 1988.
;

        GBLL    Brazil_Compatible
        GBLS    Calling_Standard
        GBLL    ModeMayBeNonUser
        GBLL    SharedLibrary

Brazil_Compatible  SETL  {TRUE}
Calling_Standard   SETS  "APCS_U"
ModeMayBeNonUser   SETL  {FALSE}
SharedLibrary      SETL  {FALSE}

        GET     h_Regs.s
        GET     h_Brazil.s
        GET     h_objmacro.s

        Module CLib

        AREA    |C$$data|

StaticData
        GET     clib.s.cl_data

        IMPORT  |_main|
        IMPORT  |_kernel_command_string|
        IMPORT  |_armsys_lib_init|

        IMPORT  raise
        IMPORT  |_backtrace|
        IMPORT  |_kernel_entrypoint|

        GET     clib.s.cl_init

        LNK     clib.s.cl_body
