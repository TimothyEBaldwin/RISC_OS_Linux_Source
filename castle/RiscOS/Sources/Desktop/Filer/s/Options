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

; !Help support
        GBLL    interactive_help
interactive_help        SETL    {TRUE}

; Don't be paranoid at all after an upcall modified file
        GBLL    less_upcall_paranoia
less_upcall_paranoia      SETL    {TRUE}

; stamp option
        GBLL    stamp_option
stamp_option    SETL    {TRUE}

; disallow recursive copies
        GBLL    disallow_recursive_copies
disallow_recursive_copies       SETL    {TRUE}

; disallow very long path names
        GBLL    disallow_longpaths
disallow_longpaths      SETL    {TRUE}

; Opendir/Closedir request order
        GBLL    opendir_request_order
opendir_request_order   SETL    {TRUE}

; action window handling
        GBLL    actionwind
actionwind      SETL    {TRUE}

; Handling of *filer_opendir with position and displaymode
        GBLL    openat
openat  SETL    {TRUE}

; Centralise handling of directory viewer wrapping
        GBLL    centralwrap
centralwrap     SETL    {TRUE}

; Correct handling of dvr_rhsgap
        GBLL    bug1596
bug1596 SETL    {TRUE}

; Drag to Icon bar Data_Opens applications and files
        GBLL    dragtobar
dragtobar       SETL    {TRUE}

; Default directory window width of four columns?
                 GBLL fourcolumnwidth
fourcolumnwidth  SETL {TRUE}

; Message_FilerSelection with extra pointer information?
                         GBLL NewMessageFilerSelection
NewMessageFilerSelection SETL {TRUE}

; Shift-EXTend-close on a directory viewer leaves child open, and
; opens parent
        GBLL    shfextclose
shfextclose     SETL    {TRUE}

; Allow set type on files
        GBLL    settype
settype SETL    {TRUE}

; Dragging a sprite rather than an outline
        GBLL    DragASprite
DragASprite     SETL    {TRUE}

; Use open directory icons for open directories,
        GBLL    ShowOpenDirs
ShowOpenDirs    SETL    {TRUE}

; Add "Set directory" menu item
        GBLL    AddSetDirectory
AddSetDirectory SETL    {TRUE}

; If "Set directory" comes before "Open parent"
        GBLL    SetDirectoryComesFirst
SetDirectoryComesFirst SETL    {TRUE}

; Change the 16bit filename offset into a 32 bit one
        GBLL    not_16bit_offsets
not_16bit_offsets SETL    {TRUE}

        GBLL    includeresources
  [ :DEF: standalone
includeresources SETL   standalone
  |
includeresources SETL   {FALSE}
  ]

; Support for TinyDirs
                GBLL    hastiny
hastiny         SETL    {FALSE}

; This is NOT implemented properly and is just a quick hack for GBartram 
                GBLL    fonthack
fonthack        SETL    {FALSE}

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Ursula flags

; Using Ursula wimp?
        GBLL    ursulawimp
ursulawimp      SETL    {TRUE}

; Autoscrolling windows?
        GBLL    autoscroll
autoscroll      SETL    ursulawimp

; MenuClearsSelection
; If set, then if a click with Menu on a file in a different viewer will remove
; the selection in any other viewer and select the new file.
                    GBLL    MenuClearsSelection
MenuClearsSelection SETL    {TRUE}

; OptionsAreInRAM
; If set, use RAM instead of CMOS to store options
                    GBLL    OptionsAreInRAM
OptionsAreInRAM     SETL    {TRUE}

; AltRenaming - do Alt + Click renaming of files
; Don't trust this - some AltRenaming stuff isn't conditional on it.
                    GBLL    AltRenaming
AltRenaming         SETL    {TRUE}

; Ursula DragASprite
                  GBLL ursuladragasprite
ursuladragasprite SETL {TRUE}

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Retain or clear selections after file actions

        GBLL    retainsel
retainsel SETL  {TRUE}

        GBLL    clearsel_copymove
        GBLL    clearsel_file_access
        GBLL    clearsel_file_copy
        GBLL    clearsel_file_count
        GBLL    clearsel_file_delete
        GBLL    clearsel_file_help
        GBLL    clearsel_file_find
        GBLL    clearsel_file_rename
        GBLL    clearsel_file_stamp
        GBLL    clearsel_file_settype
        GBLL    clearsel_newdir

clearsel_copymove       SETL (:LNOT: retainsel) :LOR: {TRUE}
clearsel_file_access    SETL (:LNOT: retainsel) :LOR: {FALSE}
clearsel_file_copy      SETL (:LNOT: retainsel) :LOR: {FALSE}
clearsel_file_count     SETL (:LNOT: retainsel) :LOR: {FALSE}
clearsel_file_delete    SETL (:LNOT: retainsel) :LOR: {FALSE}
clearsel_file_help      SETL (:LNOT: retainsel) :LOR: {TRUE}
clearsel_file_find      SETL (:LNOT: retainsel) :LOR: {FALSE}
clearsel_file_rename    SETL (:LNOT: retainsel) :LOR: {FALSE}
clearsel_file_stamp     SETL (:LNOT: retainsel) :LOR: {FALSE}
clearsel_file_settype   SETL (:LNOT: retainsel) :LOR: {FALSE}
clearsel_newdir         SETL (:LNOT: retainsel) :LOR: {FALSE}

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Emit and incompatibility warnings

        [ ursulawimp
        ! 0, ""
        ! 0, "WARNING - This version only suitable for use with Ursula WIMP or later"
        |
        ! 0, ""
        ! 0, "WARNING - Why aren't you using the Ursula WIMP?"
        ]

        [ includeresources
        ! 0, ""
        ! 0, "WARNING - Filer includes own resources, please turn off."
        ]
        ! 0, ""
        
        END
