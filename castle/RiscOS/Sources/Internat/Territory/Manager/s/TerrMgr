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
; > s.TerrMgr

;;-----------------------------------------------------------------------------
;       RISC OS Territory manager.

        AREA    |!!!Module$Code|, CODE, READONLY, PIC

Module_BaseAddr

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Machine.<Machine>
        GET     Hdr:UserIF.<UserIF>
        GET     Hdr:ModHand
        GET     Hdr:OsWords
        GET     Hdr:Services
        GET     Hdr:VduExt
        GET     Hdr:Countries
        GET     Hdr:FSNumbers
        GET     Hdr:HighFSI
        GET     Hdr:NewErrors
        GET     Hdr:Variables
        GET     Hdr:Proc
        GET     Hdr:Sprite
        GET     Hdr:Wimp
        GET     Hdr:CMOS
        GET     Hdr:OsBytes
        GET     Hdr:MsgTrans
        GET     Hdr:Squash
        GET     Hdr:ColourTran
        GET     Hdr:Internatio
        GET     Hdr:Territory
        GET     Hdr:NdrDebug

        GET     VersionASM

        GBLL    debug
        GBLL    debugxx
        GBLL    debugad
        GBLL    debugmsg
        GBLL    hostvdu

hostvdu         SETL    {TRUE}
debug           SETL    {FALSE}
debugxx         SETL    {FALSE}
debugmsg        SETL    {FALSE}
debugad         SETL    {FALSE}

      [ :LNOT: :DEF: international_help
        GBLL    international_help
international_help SETL {TRUE}           ; Default to RISC OS 3.60+ internationalisation
      ]

;;-----------------------------------------------------------------------------
;       Territory client module node layout

entry_points *  26

                ^       0
next_ptr        #       4                ; Pointer to next in chain (-1 if none)
t_number        #       4                ; Territory number.
t_wsptr         #       4                ; Module workspace pointer
t_entries       #       4 * entry_points ; Entry points.

t_block_size    *  @-next_ptr

        ASSERT  next_ptr=0

;;-----------------------------------------------------------------------------
;       Workspace layout

                ^       0, wp
wsorigin           #    0
tzone_index        #    4      ; Timezone within the territory, -1 for custom
tzone_centis       #    4      ; Signed
last_tzone_centis  #    4
last_dst_bits      #    1
                   #    3
dst_start          #    5      ; Rule for this year
                   #    3
dst_stop           #    5
                   #    2
message_file_open  #    1      ; Flag
message_file_block #   16      ; Message file block and flag
message_custom     #   20      ; Cache of unknown timezone text
territories        #    4      ; Head of list.
scratch_buffer     #   32      ; Scratch buffer space.
configured_territory #  4      ; Configured territory.
error_buffer       #  100      ; Space for errors.

        AlignSpace 16, :INDEX:wsorigin

max_running_work   *       (@-wsorigin)

        LNK     ModHead.s

