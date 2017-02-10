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
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                GBLL    debug
;debug           SETL    False
debug           SETL    False

                GBLL    debugalloc
debugalloc      SETL    debug :LAND: False

                GBLL    debugapplic
debugapplic     SETL    debug :LAND: False

                GBLL    debugbox
debugbox        SETL    debug :LAND: False

                GBLL    debugredraw
debugredraw     SETL    debug :LAND: False

                GBLL    debugclosedir
debugclosedir   SETL    debug :LAND: False

                GBLL    debugmenu
debugmenu       SETL    debug :LAND: False

                GBLL    debugsel
debugsel        SETL    debug :LAND: False

                GBLL    debugpoll
debugpoll       SETL    debug :LAND: False

                GBLL    debugtask
debugtask       SETL    debug :LAND: False

                GBLL    debugrecache
debugrecache    SETL    debug :LAND: False

                GBLL    debugupcall
debugupcall     SETL    debug :LAND: False

                GBLL    debugaccess
debugaccess     SETL    debug :LAND: False

                GBLL    debugsched
debugsched      SETL    debug :LAND: False

                GBLL    debugcmds
debugcmds       SETL    debug :LAND: False

                GBLL    debugnk
debugnk         SETL    debug :LAND: False

addr_verbose    SETA    0


        GBLS    Debug_Inclusion
Debug_Inclusion SETS "; No debug wanted"
 [ debug
Debug_Inclusion SETS " GET Hdr:Debug"
 ]
$Debug_Inclusion


Debug_Inclusion SETS "; No Host debug wanted"
 [ debug
Host_Debug SETL True
Debug_MaybeIRQ  SETL    True

  [ Host_Debug
Debug_Inclusion SETS " GET Hdr:HostFS"
  ]
 ]
$Debug_Inclusion
        END
