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
; In    r0 -> oscli command
;       r1 -> title to give popup window if OSCLI does WriteC

; Out   VClear always: errors don't creep out of here

DoOSCLIInBoxLookup Entry "r0"

        MOV     r0, r1
        BL      messagetrans_lookup
        B       %FT10

DoOSCLIInBox ALTENTRY

 [ debug
 DSTRING r0, "oscli command ",cc
 DSTRING r1, ", window title "
 ]
        MOV     r0, r1
10
        SWI     XWimp_CommandWindow
        BVC     %FT15
        CLRV                            ; Eat error
        EXIT

15      LDR     r0, [sp]
        SWI     XOS_CLI
        BVS     %FT50

        MOV     r0, #0                  ; 'Press SPACE' if command printed 'owt
        SWI     XWimp_CommandWindow
        CLRV
        EXIT


50      BL      LocalReportError        ; Prints the error; gives 'Press SPACE'

        MOV     r0, #-1                 ; Close command window without prompt
        SWI     XWimp_CommandWindow
        CLRV
        EXIT

        END
