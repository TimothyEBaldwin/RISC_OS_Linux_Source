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
Address_IO              *       1
Address_Prefetchable    *       8

                        ^       0
PCIAddress_Base         #       4
PCIAddress_Size         #       4
PCIAddress_Flags        #       1
                        AlignSpace
PCIAddress_size         #       0


                        ^       0
PCIDesc_VendorID        #       2
PCIDesc_DeviceID        #       2
PCIDesc_SubsystemVendorID #     2
PCIDesc_SubsystemID     #       2
PCIDesc_ClassCode       #       4
PCIDesc_RevisionID      #       1
PCIDesc_HeaderType      #       1
PCIDesc_IntLine         #       1
PCIDesc_Slot            #       1
PCIDesc_SlotFlags       #       1
PCIDesc_MSICap          #       1
PCIDesc_DevFn           #       1       ; Ensure half-word aligned
PCIDesc_Bus             #       1
                        AlignSpace
PCIDesc_Addresses       #       PCIAddress_size * 6
PCIDesc_ROMAddress      #       PCIAddress_size
                        AlignSpace
PCIDesc_size            #       0

                        END
