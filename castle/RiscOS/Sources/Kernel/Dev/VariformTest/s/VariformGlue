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
; > s.VariformGlue

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:CPU.Arch
        GET     Hdr:Machine.<Machine>
        GET     Hdr:FSNumbers
        GET     Hdr:HighFSI
        GET     Hdr:NewErrors
        GET     Hdr:Territory
        
        EXPORT  VariformCall

        GBLL    International
International SETL {FALSE}        

        AREA    |glue$$code|, CODE, READONLY

VariformCall
        ; int8_t VariformCall(os_regset *);
        ; Change from ATPCS and back again, returns -1 if error, 0 if success
        Push    "r4-r5, r10-r11, lr"
        MOV     r5, r0
        LDMIA   r5, { r0-r4 }
        BL      VariformInternal
        STMIA   r5, { r0-r2 }
        MOVVS   r0, #-1
        MOVVC   r0, #0
        Pull    "r4-r5, r10-r11, pc"

ErrorBlock_BuffOverflow
        DCD     1111
        DCB     "Overflow", 0
        ALIGN

ErrorBlock_BadNumb
        DCD     2222
        DCB     "Bad number", 0
        ALIGN

TenTimesTable
        DCD     1                       ; 10^0
        DCD     10
        DCD     100
        DCD     1000
        DCD     10000
        DCD     100000
        DCD     1000000
        DCD     10000000
        DCD     100000000
        DCD     1000000000              ; 10^9
TenTimesBigTable
        DCQ     10000000000             ; 10^10
        DCQ     100000000000
        DCQ     1000000000000
        DCQ     10000000000000
        DCQ     100000000000000
        DCQ     1000000000000000
        DCQ     10000000000000000
        DCQ     100000000000000000
        DCQ     1000000000000000000     ; 10^18

CommaPositions
        DCD     2_01001001001001001001001001001000

SuffixSI
        DCB     "byte"        
PrefixSI
        DCB     " kMGTPE"               ; units/kilo/mega/giga/tera/peta/exa
        ALIGN
        
;
; PASTE BELOW HERE
;

        ! 1, "Paste the real 'VariformInternal' function here"
      
;
; PASTE ABOVE HERE
;

        END
