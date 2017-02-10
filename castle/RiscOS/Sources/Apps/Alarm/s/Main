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
; > Sources.Main

; *********************************
; ***    C h a n g e   L i s t  ***
; *********************************

; Date       Description
; ----       -----------
; 19-Feb-90     0.01    File created
;

        AREA    |Alarm$$Code|, CODE, READONLY, PIC

Module_BaseAddr

        GET     AppName.s         ; read ApplicationName

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:ModHand
        GET     Hdr:Services
        GET     Hdr:Proc
        GET     Hdr:ResourceFS
        GET     VersionASM

; **************** Module code starts here **********************

        ASSERT  (.-Module_BaseAddr) = 0

        DCD     0 ; App_Start    - Module_BaseAddr
        DCD     App_Init     - Module_BaseAddr
        DCD     App_Die      - Module_BaseAddr
        DCD     App_Service  - Module_BaseAddr
        DCD     App_Title    - Module_BaseAddr
        DCD     App_HelpStr  - Module_BaseAddr
        DCD     0
      [ :LNOT: No32bitCode
        DCD     0
        DCD     0
        DCD     0
        DCD     0
        DCD     0
        DCD     App_ModFlag  - Module_BaseAddr
      ]


      [ :DEF: standalone
App_Title       DCB     "!$ApplicationName:CC:Resources",0
      |
App_Title       DCB     "!$ApplicationName", 0
      ]
App_HelpStr     DCB   "!$ApplicationName", 9, 9, "$Module_MajorVersion ($Module_Date)", 0
                ALIGN

; *****************************************************************************
;
; Module flags.  Bit 0 set means module is 32-bit aware and safe
;
      [ :LNOT: No32bitCode
App_ModFlag     DCD     ModuleFlag_32bit
      ]

; *****************************************************************************
;
;       App_Init - Initialisation entry
;

App_Init Entry "r0"

        ADR     R0, resourcefsfiles
        SWI     XResourceFS_RegisterFiles   ; ignore errors (starts on Service_ResourceFSStarting)
        CLRV
        EXIT

; *****************************************************************************
;
;       App_Die - Die entry
;

App_Die Entry "r0"

        ADR     R0, resourcefsfiles
        SWI     XResourceFS_DeregisterFiles
        CLRV

        EXIT                    ; ignore errors (ResourceFS might be dead)

; *****************************************************************************
;
;       App_Service - Main entry point for services
;

;Ursula format
App_ServTab
        DCD     0                                   ;flags
        DCD     App_UService - Module_BaseAddr      ;handler
        DCD     Service_ResourceFSStarting
        DCD     0                                   ;terminator
        DCD     App_ServTab - Module_BaseAddr       ;anchor
App_Service ROUT
        MOV     r0, r0                              ;magic instruction
        TEQ     R1, #Service_ResourceFSStarting
        MOVNE   PC, LR
App_UService

; In    R2 -> address inside ResourceFS module to call
;       R3 = workspace pointer for module
; Out   R2 called with R0 -> files, R3 -> workspace

svc_resourcefsstarting Entry "R0-R3"

        ADR     R0, resourcefsfiles
        MOV     LR, PC                          ; get return address
        MOV     PC, R2                          ; R2 = address to call

        EXIT

resourcefsfiles
        GET     ResFiles.s
        DCD     0

        END
