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
;* Lastedit: 08 Mar 90 15:18:04 by Harry Meekings *
;* Shared C library: stub for clients to link with
;  2-Mar-89: IDJ: taken for RISC_OSLib purposes
;
; Copyright (C) Acorn Computers Ltd., 1988.
;

        GBLL    Brazil_Compatible
        GBLL    ModeMayBeNonUser
        GBLL    SharedLibrary

Brazil_Compatible  SETL  {FALSE}
ModeMayBeNonUser   SETL  {TRUE}
SharedLibrary      SETL  {TRUE}

        GET     h_Regs.s
        GET     h_Brazil.s
        GET     h_stubs.s
        GET     h_stack.s
        GET     h_workspc.s

        AREA    |Stub$$Init|, CODE, READONLY

        &       5
        &       |_clib_entries2_start|
        &       |_clib_entries2_end|
        &       0
        &       0

        AREA    |Stub$$Entries|, CODE, READONLY

; Don't GET the stub entries if in ROM


        GBLS    GetRoundObjAsm
|_clib_entries2_start|
      [ Code_Destination = "RAM"
GetRoundObjAsm SETS "        GET     clib.s.cl_entry2"
      |
GetRoundObjAsm SETS ""
      ]
$GetRoundObjAsm
|_clib_entries2_end|
      [ Code_Destination = "RAM" :LAND: APCS_Type <> "APCS-R"
        %       |_clib_entries2_end| - |_clib_entries2_start|
      ]

        END
