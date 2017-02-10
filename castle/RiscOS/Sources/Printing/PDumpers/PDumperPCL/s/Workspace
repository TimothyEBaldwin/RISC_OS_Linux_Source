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
; > Workspace

                GBLL    compresscheck
compresscheck   SETL    true                    ; true then ensure output is valid

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

pdf_MultiCopies         * 1:SHL:0 ;set =>supports multi-copies sequence
pdf_Compression         * 1:SHL:1 ;set =>supports level 2 compression
pdf_NoPageEject         * 1:SHL:2 ;set =>sends page eject at the end of each page
pdf_DeciPoints          * 1:SHL:3 ;set =>cursor positioning is in decipoints
pdf_FourPlanes          * 1:SHL:4 ;set =>Use CYMK output (eg. for 550C); else RGB if colour
pdf_SupportsColour      * 1:SHL:5 ;set =>supports colour (output palette selection)
pdf_SupportsYOffset     * 1:SHL:6 ;set =>supports Y Offset raster cmd (Esc * b # Y)

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

pending_blank_lines     # 4

buffer_length           * 492                   ; buffer for characters to output with GBPB
buffer_posn             # buffer_length

palette_filename        # 256                   ; set printer data

palette_file_link       *    0                  ; Layout of a palette file workspace
palette_file_type       *    4
palette_file_small      *    8                  ; Small (4-by-4) halftone data
palette_file_large      *    8 + 4*4            ; Large (8-by-8) halftone data
palette_file_error      *   24 + 8*8            ; Error diffusion calibration (grey-scale)
palette_file_colour     *   88 + 4*(3+33+33+33) ; Colour palette data (starting with inks 0 to 7, WYMRCGBK)
palette_file_patterns   *  496 + 1024           ; Colour palette pattern data (corresponding to the palette)
palette_file_palette    * 1520 + 1024           ; 216+16 colour palette (16 grey levels, 6 each of R, G and B )
palette_file_end        * 2544 + 1024           ; End of file

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        END
