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
        SUBT    > NewSrc.SysVars

; This file deals with the specifics of setting FileSwitch system variables
;
; Construct variables of the form
;
; FileSwitch$<fs>$<dir>$Special
; and
; FileSwitch$<fs>$<dir>$DiscAndPath
;
; Where <dir> is one of:
; Current
; Previous
; UserRoot
; Root
; Library
;
fsw_dirsprefix          DCB     "FileSwitch$", 0
fsw_dirspart_separator  DCB     "$", 0
fsw_dirsspecial_postfix DCB     "$$Special", 0
fsw_dirspath_postfix    DCB     "$$DiscAndPath", 0
fsw_dirspart_current    DCB     "Current", 0
fsw_dirspart_previous   DCB     "Previous", 0
fsw_dirspart_userroot   DCB     "UserRoot", 0
fsw_dirspart_library    DCB     "Library", 0

fsw_currentfs           DCB     "FileSwitch$$CurrentFilingSystem", 0
fsw_tempfs              DCB     "FileSwitch$$TemporaryFilingSystem", 0

Default_RootD_Path              DCB     "$",CR
Default_LibD_Path               DCB     "$.Library",CR
Default_LibD_Whan_Path          DCB     "%",CR
Default_URD_Path                DCB     "$",CR
Default_URD_Whan_Path           DCB     "&",CR
Default_CSD_Path                DCB     "$",CR
Default_CSD_Whan_Path           DCB     "&",CR
Default_PSD_Path                DCB     "$",CR
Default_PSD_Whan_Path           DCB     "&",CR

        ALIGN

; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; ReadTempFS
;
; In    -
;
; Out   r0 -> tempfs or Nowt, flags preserved or
;       VS and error set
;
ReadTempFS EntryS "r1-r4, fscb"
        addr    r0, fsw_tempfs
10
        addr    r3, anull
        BL      SReadVariableToBuffer
        MOV     r4, #1                  ; Disallow :, # and -
        BLVC    FindFSName
        MOVVC   r0, fscb
        ADD     sp, sp, r2
        EXITS   VC
        EXIT

; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; ReadCurrentFS
;
; In    -
;
; Out   r0 -> currentfs or Nowt, flags preserved or
;       VS and error set
;
ReadCurrentFS ALTENTRY
        addr    r0, fsw_currentfs
        B       %BT10

; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; SetTempFS
;
; In    r2 -> tempfs to set or Nowt
;
; Out   - and TempFS set, flags preserved, or
;       VS and error set
;
SetTempFS EntryS "r0,r1,r2,r4"
        addr    r0, fsw_tempfs
10
        TEQ     r2, #Nowt
        MOVEQ   r1, #NULL
        ADDNE   r1, r2, #fscb_name
        MOV     r4, #VarType_String
 [ debugsysvars
        DSTRING r0, "Setting ",cc
        DSTRING r1, " to "
 ]
        BL      SSetVariable
        EXITS   VC
        BL      CopyErrorExternal
        STR     r0, [sp, #Proc_RegOffset]
        EXIT

; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;
; SetCurrentFS
;
; In    r2 -> currentfs to set or Nowt
;
; Out   - and CurrentFS set, or
;       VS and error set
;
SetCurrentFS ALTENTRY
        addr    r0, fsw_currentfs
        B       %BT10

        END
