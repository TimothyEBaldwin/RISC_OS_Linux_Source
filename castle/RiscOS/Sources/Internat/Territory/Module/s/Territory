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
; > s.Territory

;;-----------------------------------------------------------------------------
;; RISC OS Generic Territory.
;;
;; Change list:
;;
;; 0.03 24-Apr-91 Fixed bug, ConvertTimeToOrdinals returned
;;                day of year in the day of week loaction
;; 0.05 30-Apr-91 Fixed bug, more characters are punctuation.
;;
;;-----------------------------------------------------------------------------
;; Wish list
;;-----------------------------------------------------------------------------

        AREA    Module, CODE, READONLY, PIC

Module_BaseAddr

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Machine.<Machine>
        GET     Hdr:ModHand
        GET     Hdr:Services
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:Variables
        GET     Hdr:Countries
        GET     Hdr:Proc
        GET     Hdr:OsBytes
        GET     Hdr:MsgTrans
        GET     Hdr:Territory
        GET     Hdr:ResourceFS
        GET     Hdr:CMOS
        GET     Hdr:NdrDebug

        GET     VersionASM

        GBLL    debug
        GBLL    debugxx
        GBLL    hostvdu
        GBLL    debugdt

hostvdu SETL    {TRUE}
debug   SETL    {FALSE}
debugxx SETL    {FALSE}
debugdt SETL    {FALSE}          ; Date and Time.

      [ :LNOT: :DEF: standalone
        GBLL    standalone
standalone      SETL {FALSE}     ; Build-in Messages file via ResourceFS
      ]

        GBLL    CollateLatin1Ligatures
        GBLL    CollateOELigatures
        GBLL    CollateDanishAA
        GBLL    CollateThornAsTH
        GBLL    CollateGermanSharpS
        GBLL    CollateAccentsBackwards
        GBLL    JapaneseEras
        GBLA    IMESWIChunk
CollateOELigatures      SETL {FALSE}
CollateDanishAA         SETL {FALSE}
CollateThornAsTH        SETL {FALSE}
CollateGermanSharpS     SETL {FALSE}
CollateAccentsBackwards SETL {FALSE}
JapaneseEras            SETL {FALSE}

        GET     $Territory..s

CollateLatin1Ligatures SETL AlphNum = ISOAlphabet_Latin1 :LOR: AlphNum = ISOAlphabet_Latin5 :LOR: AlphNum = ISOAlphabet_Latin9

; ----------------------------------------------------------------------------------------------------------------------
        MACRO
$label  ALIGNHASH  $o,$m
      [ ((@-$o):AND:($m-1))<>0
$label  #          $m-((@-$o):AND:($m-1))
      |
$label  #          0
      ]
        MEND



; ----------------------------------------------------------------------------
;       Workspace layout


 [ JapaneseEras
max_eras        *       7 + 1 ; One for the table terminator

                ^       0
era_day         #       4
era_month       #       4
era_year        #       4
era_datasize    #       0
 ]

                ^       0,wp

wsorigin           #    0
message_file_open  #    1     ; flag
spare              #    3
message_file_block #   16     ; Message file block
timezone_name_ptr  #    4
scratch_buffer     #  180     ; Scratch buffer space.
 [ JapaneseEras
era_table          #  era_datasize * max_eras
 ]

        ALIGNHASH       wsorigin,16

max_running_work   *       (@-wsorigin)

; -----------------------------------------------------------------------------

        LNK     ModHead.s
