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

  [ :LNOT: :DEF: OldOpt
                 GET     Hdr:ListOpts
  ]
                 GET     Hdr:PublicWS
                 GET     Hdr:OSRSI6

Module_WorkSpace EQU     16

; The bit definitions for the ClientFlags byte
ClientFlag_APCS_A  * 1 :SHL: 0     ; client is using APCS-A
ClientFlag_APCS_32 * 1 :SHL: 1     ; client is using APCS-32 (26 or 32 bit mode)
ClientFlag_Sys32   * 1 :SHL: 2     ; system is running in a 32-bit mode

                END
