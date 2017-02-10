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
; ADFS

        GBLL    StrongARM
        GBLL    A1
        GBLL    Top16Write
        GBLL    Support1772
        GBLL    TwinIDEHardware
        GBLL    NewTransferCode
        GBLL    ByteAddressedHW
        GBLA    Override_PDevNo
        GBLL    FloppyPodule
        GBLL    FloppyPCI
        GBLL    UseDiscOp64
        GBLL    IDEDMA

        AREA    |!!!ADFSModule|,CODE,READONLY,PIC

StrongARM       SETL {TRUE}
        GET     DebugOpts.s
        GET     Ver.<Machine>
        GET     Fixes.s

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:DevNos
        GET     Hdr:Machine.<Machine>
        $GetIO
        GET     Hdr:CMOS
        GET     Hdr:Services
        GET     Hdr:ModHand
        GET     Hdr:PublicWS
        GET     Hdr:Tokens
        GET     Hdr:UpCall
        GET     Hdr:FSNumbers
        GET     Hdr:OsWords
        GET     Hdr:OsBytes
        GET     Hdr:HighFSI
        GET     Hdr:MultiFS
        GET     Hdr:FileCore
        GET     Hdr:ADFS
        GET     Hdr:MsgTrans
        GET     Hdr:NewErrors
        GET     Hdr:Portable
        GET     Hdr:Proc
        GET     Hdr:HALEntries
        GET     Hdr:PCI
        GET     Hdr:Podule
        GET     Hdr:DMA
        GET     Hdr:DMADevice
        GET     Hdr:IDEDevice
        GET     Hdr:OSRSI6
        GET     VersionASM
        
        GET     NewBits.s
        GET     ADFSMacros.s
        GET     Consts.s
        GET     ModHeader.s
        GET     ADFSErrors.s
        GET     ADFS00.s
        GET     ADFS05.s
        GET     Adfs11.s
        GET     ADFS12.s
        GET     ADFS13.s
        GET     ADFS14.s
        GET     IDEDetect.s
        GET     ATAPI.s
        GET     ADFS15.s
        GET     ADFS17.s
        GET     ADFS18.s
        GET     ADFS19.s
        GET     ADFS20.s
        GET     TokenHelp.s
        GET     ADFS50.s
        GET     MFormat.s
      [ IDEDMA
        GET     BusMaster.s
      ]
        GET     ADFS_SA.s

        END
