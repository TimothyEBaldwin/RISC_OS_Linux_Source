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
;* module header for shared C and RISCOS library module
;* Created 26-10-89 by IDJ
;
; 23-11-89  JSR  Moved version information into s.version
;
; Copyright (C) Acorn Computers Ltd., 1988.
;

                AREA |!!!Module$$Header|, CODE, READONLY

                GBLS ModuleName
ModuleName      SETS "SharedCLibrary"
                GBLS ModuleHelpName
ModuleHelpName  SETS "C Library"

; **************************************************************************

Lib_Init        * &80680
TAB             * 9
CR              * 13
ModuleFlag_32bit * 1

; *********************** Module code starts here *****************************

        IMPORT  |_Shared_Lib_Module_SWI_Code|
        IMPORT  |_Shared_Lib_Module_Init_Code|
        IMPORT  |_Shared_Lib_Module_Die_Code|

Code_ModuleBase
        DCD     Code_StartEntry   -Code_ModuleBase
        DCD     Code_InitEntry    -Code_ModuleBase
        DCD     Code_DieEntry     -Code_ModuleBase
        DCD     Code_ServiceEntry -Code_ModuleBase
        DCD     Code_TitleString  -Code_ModuleBase
        DCD     Code_HelpString   -Code_ModuleBase
        DCD     Code_CommandTable -Code_ModuleBase
        DCD     Lib_Init
        DCD     Code_SWICode      -Code_ModuleBase
        DCD     SWI_Table         -Code_ModuleBase
        DCD     0
        DCD     0
        DCD     Code_ModuleFlags  -Code_ModuleBase

Code_TitleString
        DCB     "$ModuleName", 0
SWI_Table
        DCB     "$ModuleName", 0
        DCB     "LibInitAPCS_A", 0
        DCB     "LibInitAPCS_R", 0
        DCB     "LibInitModule", 0
        DCB     "LibInitAPCS_32", 0
        DCB     "LibInitModuleAPCS_32", 0
        DCB     0

Code_HelpString
        DCB     "$ModuleHelpName"
        DCB     TAB
    [ :LEN: "$ModuleHelpName" < 8
        DCB     TAB
    ]
        GET     Version.s
        DCB     0
        ALIGN

Code_ModuleFlags
    [ {CONFIG}=26
        DCD     0
    |
        DCD     ModuleFlag_32bit
    ]

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Code_StartEntry   * Code_ModuleBase
Code_CommandTable * Code_ModuleBase
Code_ServiceEntry * Code_ModuleBase

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Code_InitEntry    B     |_Shared_Lib_Module_Init_Code|
Code_DieEntry     B     |_Shared_Lib_Module_Die_Code|
Code_SWICode      B     |_Shared_Lib_Module_SWI_Code|

        END
