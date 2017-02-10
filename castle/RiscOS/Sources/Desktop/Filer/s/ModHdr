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
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;                          Filer module header
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

 ASSERT (.=Module_BaseAddr)

        ENTRY

        DCD     Filer_Start        -Module_BaseAddr
        DCD     Filer_Init         -Module_BaseAddr
        DCD     Filer_Die          -Module_BaseAddr
        DCD     Filer_Service      -Module_BaseAddr
        DCD     Filer_TitleString  -Module_BaseAddr
        DCD     Filer_HelpString   -Module_BaseAddr
        DCD     Filer_CommandTable -Module_BaseAddr
        DCD     0
        DCD     0
        DCD     0
        DCD     0
 [ International_Help <> 0
        DCD     messages_file      -Module_BaseAddr
 |
        DCD     0
 ]
        DCD     Filer_ModuleFlags  -Module_BaseAddr

Filer_CommandTable ; Name Max min

        Command Filer_OpenDir,  14, 1, International_Help
        Command Filer_CloseDir, 1, 1, &100:OR: International_Help
        Command Filer_Run, 2, 1, International_Help
        Command Filer_Boot, 1, 1, &100 :OR:International_Help

        Command Filer_Truncation, 6, 2, International_Help
        Command Filer_Options, 6, 0, International_Help
        Command Filer_Layout, 4, 1, International_Help
        Command Filer_DClickHold, 1, 1, International_Help

        Command Desktop_Filer,  0, 0, International_Help
Filer_StarCommand * Command_LastName + Module_BaseAddr ; Saves a string
Filer_TitleString * Filer_StarCommand + :LEN:"Desktop_" ; And another

        DCB     0                       ; End of table

        GET     TokHelpSrc.s

Filer_HelpString
        DCB     "Filer", TAB, TAB, "$Module_HelpVersion", 0
        ALIGN

Filer_ModuleFlags
      [ No32bitCode
        DCD     0
      |
        DCD     ModuleFlag_32bit
      ]
;

        END
