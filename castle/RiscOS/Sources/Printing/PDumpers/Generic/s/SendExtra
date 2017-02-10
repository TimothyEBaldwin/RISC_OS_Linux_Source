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
; > SendExtra

;;-----------------------------------------------------------------------------
;; Common routine for sending the PDumperXY$Extra variable, the routine
;;   attempts to read the variable onto the stack and then GSTran's it,
;;   finally it will spit it out into the file.
;;
;; in   -
;; out  R0 corrupt / -> error
;;-----------------------------------------------------------------------------
                             
sendextra ROUT
        
        Push    "R1-R5,LR"

        SUB     SP,SP,#512              ; allocate a temporary buffer to be used
        MOV     R5,SP

        ADRL	R0,varname              ; -> variable to be spat out
        MOV     R1,R5                   ; first buffer to be filled
        MOV     R2,#256                 ; maximum size of the buffer
        MOV     R3,#0                   ; read the first variable
        MOV     R4,#3                   ;   returning the expanded version
        SWI     XOS_ReadVarVal

        MOVVC   R0,#13
        STRVCB  R0,[R1,R2]              ; terminate the string (with a c/r)

      [ debugStartPage
        BVS     %FT10
        DebugS  StartPage,"Start page extra sequence: ",R5
10
      ]
        
        MOVVC   R0,R5
        ADDVC   R1,R5,#256              ; allocate some buffers to trans into
        MOVVC   R2,#256                 ;   quoting their size
        SWIVC   XOS_GSTrans             ;     convert away baby
        BVS     sendextra_giveup        ; haaargh it went wrong        

        Debug   StartPage,"Length of sequence to send",R2
                                                         
        ADD     R0,R5,#256              ; -> data that has been generated
        PDumper_PrintLengthString R0,R2,R1

sendextra_giveup
        DebugE  StartPage,"Sending extra went howwibly wrong: "

        ADD     SP,SP,#512              ; flatten out the stack
        Pull    "R1-R5,PC"

varname = "$PDumperTitle.$Extra",0
        ALIGN


        END
