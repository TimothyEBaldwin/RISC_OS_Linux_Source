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
; > GetAll

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:CPU.Arch
        GET     Hdr:Machine.<Machine>
        GET     Hdr:HALSize.<HALSize>
        GET     Hdr:ImageSize.<ImageSize>
        GET     Hdr:UserIF.<UserIF>
        $GetCPU
        $GetIO
        $GetMEMC
        $GetMEMM
        $GetVIDC

        GET     hdr.Options

; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; now get the headers
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


        GET     Hdr:CMOS
        GET     Hdr:Heap
        GET     Hdr:Sprite
        GET     Hdr:PublicWS
        GET     Hdr:KernelWS
        GET     Hdr:HALEntries
        GET     Hdr:HALDevice
        GET     Hdr:OSEntries
        GET     Hdr:Services
        GET     Hdr:FSNumbers
        GET     Hdr:HighFSI
        GET     Hdr:NewErrors
        GET     Hdr:Proc
        GET     Hdr:KeyWS
        GET     Hdr:RS423
        GET     Hdr:ModHand
        GET     Hdr:Variables
        GET     Hdr:EnvNumbers
        GET     Hdr:UpCall
        GET     Hdr:Sound
        GET     Hdr:Pointer
        GET     Hdr:Podule
        GET     Hdr:VduExt
        GET     Hdr:Buffer
        GET     Hdr:Font
        GET     Hdr:DevNos
        GET     Hdr:OsBytes
        GET     Hdr:Internatio
        GET     Hdr:Territory
        GET     Hdr:Countries
        GET     Hdr:Portable
        GET     Hdr:MsgTrans
        GET     Hdr:PaletteV
        GET     Hdr:GraphicsV
        GET     Hdr:VIDCList
        GET     Hdr:Wimp
        GET     Hdr:ColourTran
        GET     Hdr:Debug
        GET     Hdr:FileTypes
        GET     Hdr:RTC
        GET     Hdr:SerialOp
        GET     Hdr:Keyboard
        GET     Hdr:OSMem
        GET     Hdr:OSMisc
        GET     Hdr:OSRSI6
        GET     Hdr:PL310

; now the main parts of the MOS

        GET     hdr.Copro15ops ; some macros
        GET     hdr.ARMops

        GET     s.Kernel
        GET     s.ARMops
        GET     s.NewIRQs
        GET     s.Oscli
        GET     s.SysComms
        GET     s.HeapMan
        GET     s.ModHand
        $GetUnsqueeze
        GET     s.ArthurSWIs
        $GetKernelMEMC
        GET     s.Exceptions
        GET     s.ChangeDyn
        GET     s.HAL
        GET     s.Arthur2
        GET     s.LibKern
        GET     s.Utility
        GET     s.MoreComms
        GET     s.Convrsions
        GET     s.MoreSWIs
        GET     s.ExtraSWIs
        GET     s.HeapSort
        GET     s.Arthur3
        GET     s.SWINaming
        GET     s.TickEvents
        GET     s.NewReset
        $GetMessages
        GET     s.Middle
        GET     s.Super1
        GET     s.MemInfo
        GET     s.CPUFeatures
        GET     s.MemMap2
        ! 0, "Main kernel size = &" :CC: :STR: (.-KernelBase)
StartOfVduDriver
        GET     s.vdu.VduDriver
        GET     s.vdu.VduSWIs
        GET     s.vdu.VduPalette
        GET     s.vdu.vdupalxx
        GET     s.vdu.VduPlot
        GET     s.vdu.VduGrafA
        GET     s.vdu.VduGrafB
        GET     s.vdu.VduGrafC
        GET     s.vdu.VduGrafD
        GET     s.vdu.VduGrafE
        GET     s.vdu.VduGrafF
        GET     s.vdu.VduGrafG
        GET     s.vdu.VduGrafH
        GET     s.vdu.VduGrafI
        GET     s.vdu.VduGrafJ
        GET     s.vdu.VduGrafK
        GET     s.vdu.VduGrafL
        GET     s.vdu.VduGrafV
        GET     s.vdu.VduGrafHAL
        GET     s.vdu.VduWrch
        GET     s.vdu.Vdu23
        GET     s.vdu.VduPointer
        GET     s.vdu.Vdu5
        GET     s.vdu.VduCurSoft
        GET     s.vdu.VduTTX
        GET     s.vdu.VduFontL1

        ! 0, "Vdu section size = &" :CC: :STR: (.-StartOfVduDriver)

StartOfPMF
        GET     s.PMF.osinit
        GET     s.PMF.oseven
        GET     s.PMF.osbyte
        GET     s.PMF.osword
        GET     s.PMF.realtime
        GET     s.PMF.i2cutils
        GET     s.PMF.IIC
        GET     s.PMF.oswrch
        GET     s.PMF.buffer
        GET     s.PMF.key
        GET     s.PMF.mouse
        ALIGN
EndOfPMF

        ! 0, "PMF section size = &" :CC: :STR: (EndOfPMF - StartOfPMF)

StartOfAMB
        GET     s.AMBControl.AMB
EndOfAMB

        ! 0, "AMB section size = &" :CC: :STR: (EndOfAMB - StartOfAMB)

EndOfKernel
        DCD     0

        END
