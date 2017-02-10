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
;> Errors

; error codes are 32 bits and have different internal and external formats

; Internal format
; b31=1 => disc error
;  b0  to b20 disc byte address / 256
;  b21 t0 b23 drive
;  b24 to b29 disc error num
;  b30        0 (to distinguish from other peoples errors)
; b31=0 => not disc error
;  b0  to b6  error num
;  b8  to b29 clear
;  b30        0 (to distinguish from other peoples errors)
;  b31 set if disc error

; External Format
;  b0  to b7  error num
;  b8  to b29 module number
;  b30 1
;  b31 0

 [ BigDisc
; b31=1 & x30=1  => extended disc error
;  b0 to b29 -> error block (!!!! 32-bit problem !!!!)
;  error block word 0    b0 to b5 disc error num
;                        b6 to b31 clear
;  error block word 1    b0 to b28 disc sector address
;                        b29 to b31 drive
 ]

;except for 'escape' and 'disc error' internal error num = external error num

MaxDiscErr      * 2_00111111

ExternalErrorBit bit 30
DiscErrorBit     bit 31

NewDiscErrorBit  bit 0

FileCoreModuleNum   * &108

ErrorTable
IntEscapeErr    * &80

        ; Define all the 1-byte error numbers
        GET     Hdr:FileCoreErr
 
        ; Now allocate an error block for each one
fcerror SETS    "FileCoreErrBlk"

        MACRO
$num    FileCoreErrBlk $name, $str
$name.ErrBlk MakeInternatErrorBlock adfs$name,, $name
        MEND
        
        GET     Hdr:ADFSErr ; the table uses ADFS errors, patched up later
        GET     Hdr:FileCoreErr
 
        &       FileCoreModuleNum :SHL: 8 ;end of table marker
        =       "FileCoreError",0         ;failsafe in case no match found
        ALIGN
        
        END
