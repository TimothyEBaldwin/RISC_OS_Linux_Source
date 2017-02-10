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
;
; Wimp options for a RISC OS 3.50 build of the Window Manager
;

module_postfix	SETS	" RISC OS 3.5"

	Option	Stork,			false			; try saving power by calling Portable_Idle

        Option  international_help,     false                   ; Kernel looks up help in the Messages file
	Option	PlotSpritesFromPalette, false			; Use palette entries, not translation table
                                            			; (this means funny paletted sprites plot
                                            			; better in 16bpp+ modes)
	Option	UseAMBControl,		false			; delegate task memory management to OS_AMBControl

        Option  TrueIcon2,              true :LAND: TrueIcon1   ; true colour support, phase 2
        Option  TrueIcon3,              true :LAND: TrueIcon2   ; true colour support, phase 3 (windows)
        Option  IconiseButton,          true                    ; Windows given iconise button
        Option  LongCommandLines,       false                   ; Save some RAM
        Option  BounceClose,            true                    ; Furniture buttons are release-type
        Option  ForegroundWindows,      true                    ; Layering of windows within each stack
        Option  SpritePriority,         true                    ; Allow configurable sprite pool priority
        Option  Autoscr,                true                    ; Add Wimp_AutoScroll and dragbox-within-window facilities
        Option  StickyEdges,            false  ; unimplemented  ; Allow windows to "stick" when dragged over edge of screen
        Option  MultiClose,             true                    ; Allow Ctrl-Alt clicks on close/iconise buttons
        Option  PushBothBars,           true                    ; Push in both scrollbars on adjust-drags

        Option  RO4,                    true                    ; RISC OS 4 extensions

        Option  Sprites11,              false                   ; Kernel can't render new format sprites

        END
