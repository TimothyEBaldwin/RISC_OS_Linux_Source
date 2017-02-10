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

;Debug message switches
        GBLL    Dev       ; Development version or not
        GBLL    Debug     ; To debug or not
        GBLL    SpoolOff  ; True to disable SPOOL file around debug messages
        GBLL    IrqDebug  ; True to skip debug if threaded in IRQ context
Dev     SETL    {FALSE}
      [ Dev
Debug    SETL   {FALSE}
SpoolOff SETL   {FALSE}
IrqDebug SETL   {TRUE}
      ]
      
 [ Debug
 ! 0, "*** WARNING *** DEBUG ON!"
 ]
        MACRO
$a      switch  $b
        GBLL    $a
       [ Dev
        [ Debug
$a      SETL    $b
        |
$a      SETL    {FALSE}
        ]
       |
$a      SETL    {FALSE}
       ]

        MEND

Debug0   switch {FALSE} ; floppy drivers FIQ handlers
Debug1   switch {FALSE} ; floppy drivers
Debug1f  switch {FALSE} ; floppy drivers (foreground stuff only)
Debug1r  switch {FALSE} ; floppy drivers (Disc record parameters only)
Debug2   switch {FALSE} ; winnie drivers
Debug3   switch {FALSE} ; low level disc op
Debug4   switch {FALSE} ; misc op
Debug5   switch {FALSE} ; winnie drivers border colours
Debug6   switch {FALSE} ; winnie drivers tube debug
Debug9   switch {FALSE} ; useful routines
Debug10  switch {FALSE} ; 82C710 floppy drivers
Debug10a switch {FALSE} ; 82C710 floppy drivers - specifically the resubmition of DCBs for transfers
Debug10c switch {FALSE} ; 82C710 commands sent to controller
Debug10d switch {FALSE} ; 82C710 DMA manager
Debug10e switch {FALSE} ; 82C710 event timing
Debug10f switch {FALSE} ; 82C710 floppy drivers - specifically the foregroundy bits
Debug10p switch {FALSE} ; 82C710 power saving
Debug10s switch {FALSE} ; 82C710 scatter list reporting
Debug10S switch {FALSE} ; 82C710 upper level scatter list reporting
Debug10t switch {FALSE} ; 82C710 results from data transfer ops
Debug10T switch {FALSE} ; 82C710 track and seek monitoring
Debug10v switch {FALSE} ; 82C710 video DMA inhibition testing
Debug20  switch {FALSE} ; IDE winchester drivers
Debug21  switch {FALSE} ; IDE winchester drivers (basic)
Debug21a switch {FALSE} ; IDE winchester drivers (transfer length)
Debug22  switch {FALSE} ; IDE winchester drivers (IRQ processing)
Debug23  switch {FALSE} ; IDE autodetection
Debug24  switch {FALSE} ; IDE ATAPIOp
Debug25  switch {FALSE} ; IDE DMA
Debug30  switch {FALSE} ; MultiFS extras
Debug31  switch {FALSE} ; MultiFS extras (track sector IDs)
DebugI   switch {FALSE} ; Initialisation sequence (top level)

        END
