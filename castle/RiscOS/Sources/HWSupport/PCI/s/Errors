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
        SUBT    => PCI.s.Errors
        OPT     OptPage

        ^       ErrorBase_PCI
        AddError                NoSuchPCI, "PCI device doesn't exist"
        AddError                BadAccessSize, "Illegal access size"
        AddError                NoSuchAddr, "Address mapping doesn't exist"
        AddError                NoPCIBus, "No PCI bus declared"

        MakeErrorBlock          UnknownAreaHandler
        MakeInternatErrorBlock  BadAccessSize
        MakeInternatErrorBlock  NoSuchAddr
        MakeInternatErrorBlock  NoSuchPCI
        MakeInternatErrorBlock  NoPCIBus
        MakeInternatErrorBlock  BadRead
        MakeInternatErrorBlock  ECNoNet
        MakeInternatErrorBlock  NDallas
        MakeInternatErrorBlock  CDATBufferOverflow,,"BufOFlo"
        MakeErrorBlock          ModuleBadSWI

        END
