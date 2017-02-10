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
; -> Variables


;-----------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------


                         ^ 0, r12  ; Link R12 to workspace ( variables )

Start                    #      0

;-----------------------------------------------------------------------------------------------
; words
;-----------------------------------------------------------------------------------------------

number_of_drivers        #      4 ;
LastErrorNumber          #      4 ; Last error number to reach the user

;-----------------------------------------------------------------------------------------------
; x bytes
;-----------------------------------------------------------------------------------------------
control_block            #      control_block_size         ; Copy of control block for driver
sld_list                 #      MAX_NUMBER_OF_DRIVERS * 4  ; Memory pointers to soft-load drivers
wsp_list                 #      MAX_NUMBER_OF_DRIVERS * 4  ; Workspace pointer FOR soft-load drvs
block_list               #      MAX_NUMBER_OF_DRIVERS * 4  ; Block pointer FOR soft-load drvs
buffer                   #      2340                       ; General work area


;-----------------------------------------------------------------------------------------------

EndOfRMA                 #      0

SizeOfWorkSpace          *      EndOfRMA - Start

 END
