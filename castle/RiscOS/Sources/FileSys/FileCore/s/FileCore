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

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Machine.<Machine>
        GBLS    GetHAL
 [ HAL
GetHAL  SETS    "GET Hdr:HALEntries"
 |
GetHAL  SETS    ""
 ]
        $GetHAL
        GET     Hdr:CMOS
        GET     Hdr:Services
        GET     Hdr:ModHand
        GET     Hdr:FSNumbers
        GET     Hdr:HighFSI
        GET     Hdr:PublicWS
        GET     Hdr:Tokens
        GET     Hdr:Wimp
        GET     Hdr:UpCall
        GET     Hdr:VduExt
        GET     Hdr:LowFSI
        GET     Hdr:Heap
        GET     Hdr:FileCore
        GET     Hdr:MsgTrans
        GET     Hdr:FileTypes
        GET     Hdr:OsWords
        GET     Hdr:OsBytes
        GET     Hdr:MultiFS
        GET     Hdr:NewErrors
        GET     Hdr:Territory
        GET     Hdr:OSRSI6

        GET     VersionASM
        GET     DebugOpts.s
        GET     MyMacros.s
        GET     Defns.s
        GET     FileCore00.s
        GET     Errors.s
        GET     FileCore05.s
        GET     FileCore15.s
        GET     FileCore20.s
        GET     FileCore25.s
        GET     FileCore30.s
        GET     FileCore31.s
        GET     FileCore32.s
        GET     FileCore33.s
        GET     FileCore35.s
        GET     FileCore40.s
        GET     FileCore45.s
        GET     TokHelpSrc.s
        GET     InitDieSvc.s
        GET     Commands.s
        GET     GenSWIs.s
        GET     MsgsStuff.s
        GET     FileCore60.s
        GET     FileCore70.s
        GET     FileCore80.s
        GET     FormSrvcs.s
        GET     FormSWIs.s
        GET     Identify.s
        GET     BigDirCode.s

 [ Debug
        InsertDebugRoutines
 ]

        END
