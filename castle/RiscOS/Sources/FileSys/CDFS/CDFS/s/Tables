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
; Tables for CDFS

; Tables in here:
; CDFStableofswinames
; DaysInMonth

        ALIGN

;***************************************************************************
CDFStableofswinames
;***************************************************************************

        DCB     "CDFS", 0                     ; Group Name

        DCB     "ConvertDriveToDevice", 0
        DCB     "SetBufferSize", 0
        DCB     "GetBufferSize", 0
        DCB     "SetNumberOfDrives", 0
        DCB     "GetNumberOfDrives", 0
        DCB     "GiveFileType", 0
        DCB     "DescribeDisc", 0
        DCB     "WhereIsFile", 0
        DCB     "Truncation", 0
        ; Add new SWI's Here

        DCB     0    ; No more SWI's (aargh!)

;***************************************************************************

        ALIGN

DaysInMonth
        DCD     0
        DCD     31
        DCD     27 + 31
        DCD     31 + 31 + 27
        DCD     30 + 31 + 27 + 31
        DCD     31 + 31 + 27 + 31 + 30
        DCD     30 + 31 + 27 + 31 + 30 + 31
        DCD     31 + 31 + 27 + 31 + 30 + 31 + 30
        DCD     31 + 31 + 27 + 31 + 30 + 31 + 30 + 31
        DCD     30 + 31 + 27 + 31 + 30 + 31 + 30 + 31 + 31
        DCD     31 + 31 + 27 + 31 + 30 + 31 + 30 + 31 + 31 + 30
        DCD     30 + 31 + 27 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31

        END
