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
;* Shared C library for Arthur/Brazil: static data layout
;* Lastedit: 17 Mar 88 16:33:53 by Harry Meekings *
;
; Copyright (C) Acorn Computers Ltd., 1988.
; dummy byte added to solve padding problem: IDJ: 26-Apr-90

__errno         ExportedVariable
;                EXPORT  errno
;errno           *       __errno
__iob           ExportedVariable 10*16
;__stdin         Alias __iob, 0
;__stdout        Alias __iob, 10
;__stderr        Alias __iob, 20
_interrupts_off ExportedVariable
_saved_interrupt Variable
ctype_eof       Variable
__ctype         ExportedVariable 64
__huge_val      ExportedWord &7FEFFFFF
                InitWord     &FFFFFFFF
app_space_end   Variable
stack_o_flag    VariableByte
inSignalHandler VariableByte
dummybyte       VariableByte
                InitByte 1  ; to force the module version of the data area
                            ; not to be zero-initialised, so it comes first
   END
