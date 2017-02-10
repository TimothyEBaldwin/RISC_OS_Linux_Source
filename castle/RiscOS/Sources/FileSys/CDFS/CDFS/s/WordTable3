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
; -> WordTable3


;----------------------------------------------------------------------------
; This contains blocks to describe the *commands *** RISC OS 3 ONLY ***
;----------------------------------------------------------------------------

KeywordTable

      [ bufferlist              ; This bit only works during debugging
        Command "Buf",          0, 0, FS_Command_Flag
      ]
      [ international_help
        Command "Bye",          0, 0, International_Help + FS_Command_Flag
        Command "CDFS",         0, 0, International_Help
        Command "CDDevices",    0, 0, International_Help
        Command "CDROMBuffers", 1, 1, International_Help + Status_Keyword_Flag
        Command "CDROMDrives",  1, 1, International_Help + Status_Keyword_Flag
        Command "CDSpeed",      2, 0, International_Help + FS_Command_Flag
        Command "Dismount",     1, 0, International_Help + FS_Command_Flag :OR: (1:SHL:8)
        Command "Drive",        1, 1, International_Help + FS_Command_Flag
        Command "Eject",        1, 0, International_Help + FS_Command_Flag
        Command "Free",         1, 0, International_Help + FS_Command_Flag
        Command "Lock",         1, 0, International_Help + FS_Command_Flag
        Command "Mount",        1, 0, International_Help + FS_Command_Flag :OR: (1:SHL:8)
        Command "Play",         2, 1, International_Help + FS_Command_Flag
        Command "PlayList",     1, 0, International_Help + FS_Command_Flag
        Command "PlayMSF",      3, 2, International_Help + FS_Command_Flag
        Command "Stop",         1, 0, International_Help + FS_Command_Flag
        Command "Supported",    0, 0, International_Help + FS_Command_Flag
        Command "Unlock",       1, 0, International_Help + FS_Command_Flag
        Command "WhichDisc",    1, 0, International_Help + FS_Command_Flag
      |
        Command "Bye",          0, 0, Help_Is_Code_Flag + FS_Command_Flag 
        Command "CDFS",         0, 0, Help_Is_Code_Flag
        Command "CDDevices",    0, 0, Help_Is_Code_Flag
        Command "CDROMBuffers", 1, 1, Help_Is_Code_Flag + Status_Keyword_Flag
        Command "CDROMDrives",  1, 1, Help_Is_Code_Flag + Status_Keyword_Flag
        Command "CDSpeed",      2, 0, Help_Is_Code_Flag + FS_Command_Flag
        Command "Dismount",     1, 0, Help_Is_Code_Flag + FS_Command_Flag :OR: (1:SHL:8)
        Command "Drive",        1, 1, Help_Is_Code_Flag + FS_Command_Flag
        Command "Eject",        1, 0, Help_Is_Code_Flag + FS_Command_Flag
        Command "Free",         1, 0, Help_Is_Code_Flag + FS_Command_Flag
        Command "Lock",         1, 0, Help_Is_Code_Flag + FS_Command_Flag
        Command "Mount",        1, 0, Help_Is_Code_Flag + FS_Command_Flag :OR: (1:SHL:8)
        Command "Play",         2, 1, Help_Is_Code_Flag + FS_Command_Flag
        Command "PlayList",     1, 0, Help_Is_Code_Flag + FS_Command_Flag        
        Command "PlayMSF",      3, 2, Help_Is_Code_Flag + FS_Command_Flag
        Command "Stop",         1, 0, Help_Is_Code_Flag + FS_Command_Flag
        Command "Supported",    0, 0, Help_Is_Code_Flag + FS_Command_Flag
        Command "Unlock",       1, 0, Help_Is_Code_Flag + FS_Command_Flag
        Command "WhichDisc",    1, 0, Help_Is_Code_Flag + FS_Command_Flag
      ]
        DCB     0                       ;   NO MORE *COMMANDS
        ALIGN

        END

