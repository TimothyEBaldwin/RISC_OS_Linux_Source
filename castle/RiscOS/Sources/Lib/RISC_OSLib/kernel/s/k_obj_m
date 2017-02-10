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
;* Shared library kernel: unshared (Brazil/Arthur) version
;* Lastedit: 22 Feb 90 15:47:53 by Harry Meekings *
;
; Copyright (C) Acorn Computers Ltd., 1988.
;

        GBLL    Brazil_Compatible
        GBLS    Calling_Standard
        GBLL    ModeMayBeNonUser
        GBLL    SharedLibrary
        GBLL    DDE

Brazil_Compatible  SETL  {TRUE}
Calling_Standard   SETS  "APCS_U"
ModeMayBeNonUser   SETL  {TRUE}
SharedLibrary      SETL  {FALSE}
DDE                SETL  {TRUE}

        GET     h_Regs.s
        GET     h_Brazil.s
        GET     h_objmacro_m.s

        Module  kernel

        AREA    |K$$Data|, DATA

        GET     kernel.s.k_data

        AREA    |K$$Code|, CODE, READONLY

        GET     kernel.s.k_init

        LNK     kernel.s.k_body
