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
; > OutputDump

;------------------------------------------------------------------------------
;
; Generic Dot Matrix device
; -------------------------
;
; This module contains the code for both the Epson/IBM compatible and also
; the Intergrex.
;
; The configuration word contains a set of control flags which are used
; to indicate which type of dump is to be performed:
;
;       bit 0 set   => IX compatible (intergrex etc..
;             clear => JX compatible (epson etc..
;
;       bit 1 set   => don't perform start of page feed (for roll devices)
;
;
;------------------------------------------------------------------------------

        GET     ^.Generic.OutputDump.s

        GET     DumpIX.s
        GET     DumpJX.s

;..............................................................................

output_mono_sprite ROUT
        LDRB    R1,[R7,#pd_private_flags]
        TST     R1,#df_HorizontalRaster
        BEQ     dumpJX_Monochrome
        B       dumpIX_Monochrome

;..............................................................................

output_grey_sprite ROUT
        LDRB    R1,[R7,#pd_private_flags]
        TST     R1,#df_HorizontalRaster
        BEQ     dumpJX_Grey
        B       dumpIX_Grey

;..............................................................................

output_colour_sprite ROUT
        LDRB    R1,[R7,#pd_private_flags]
        TST     R1,#df_HorizontalRaster
        BEQ     dumpJX_Colour256
        B       dumpIX_Colour256

;..............................................................................

        END
