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
        AREA    |Stub$$Data|, DATA

|_k_data_start|
        GET     kernel.s.k_data
|_k_data_end|

|_clib_data_start|
        GET     clib.s.cl_data
        GET     clib.s.clibdata
|_clib_data_end|

        GBLS    Bodge1
        GBLS    Bodge2
|_rlib_data_start|
 [ :DEF:RISC_OSStubs
Bodge1 SETS " GET     rlib.s.rl_data"
Bodge2 SETS " GET     rlib.s.rlibdata"
 |
Bodge1 SETS ""
Bodge2 SETS ""
 ]
$Bodge1
$Bodge2
|_rlib_data_end|

        END
