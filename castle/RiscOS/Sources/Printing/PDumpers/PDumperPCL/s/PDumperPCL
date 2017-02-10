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
; HzN
;
; Changes I made:
; 1. In StartJob set a flag that Job has been started
; 2. In StartPage
;    If flag that job has started then
;    - reset flag that job has started
;    - initialise printer
;    - set duplex based on PDF entry in data10:
;      N = none, S = short binding, L = long binding, R = rotating pages
;      (rotating pages since some printers like Canon iSensys MF4690PL does
;       not do long binding duplex otherwise...)
;    If rotating pages then
;    - send Esc & l 0 O on odd  pages (i.e. do not rotate)
;    - send Esc & l 2 O on even pages (i.e. rotate)
; 3. In EndPage do not send printer reset ('Esc E Esc %-12345X')

                GBLS    DirSuffix
; HzN
DirSuffix       SETS    "PCL"


; RobStrings is not used anymore
; whether to put out the enhanced LJ control strings at start and end page
;                GBLL    RobStrings
;RobStrings SETL {TRUE}




                LNK      ^.Generic.s.Header
