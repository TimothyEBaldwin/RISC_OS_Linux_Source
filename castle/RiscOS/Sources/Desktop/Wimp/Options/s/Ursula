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
; Wimp options for an Ursula build of the Window Manager
;

        Option  ChocolateScreen,        true                    ; Clean cached screen after redraw loops
        Option  ShrinkableAreas,        true                    ; Support Shrinkable Dynamic Areas
        Option  KernelLocksFreePool,    true                    ; use OS_Memory 10 to lock Free Pool for Wimp_ClaimFreeMemory

        Option  UrsulaHighlighting,     true                    ; Uses icon highlighting algorithm to suit Ursula new-look

        Option  TrueIcon2,              true :LAND: TrueIcon1   ; true colour support, phase 2
        Option  TrueIcon3,              true :LAND: TrueIcon2   ; true colour support, phase 3 (windows)
        Option  IconiseButton,          true                    ; Windows given iconise button
        Option  BounceClose,            true                    ; Furniture buttons are release-type
        Option  ForegroundWindows,      true                    ; Layering of windows within each stack
        Option  SpritePriority,         true                    ; Allow configurable sprite pool priority
        Option  Autoscr,                true                    ; Add Wimp_AutoScroll and dragbox-within-window facilities
        Option  StickyEdges,            false  ; unimplemented  ; Allow windows to "stick" when dragged over edge of screen
        Option  MultiClose,             true                    ; Allow Ctrl-Alt clicks on close/iconise buttons
        Option  PushBothBars,           true                    ; Push in both scrollbars on adjust-drags
        Option  AcceptLoosePointers,    false                   ; Sloppy "any -ve will do" checks (for 64M memory map only)
        Option  UTF8,                   true                    ; support for UTF-8 alphabet (Unicode)

        Option  RO4,                    true                    ; RISC OS 4 extensions
        Option  CanTileManually,        false                   ; retain manual tiling code incase SpriteOp 65 missing
        Option  DynamicAreaWCF,         true                    ; RISC OS 5.23 drops support for free pool locking, so use a private DA instead 

DefaultNextSlot SETA 1024*1024

        END
