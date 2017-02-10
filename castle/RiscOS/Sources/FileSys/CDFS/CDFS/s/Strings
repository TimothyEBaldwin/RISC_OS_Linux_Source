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
; >Strings


;*****************************************************************
;*****************************************************************
; Loads of strings
;*****************************************************************
;*****************************************************************


help
        DCB     "CDFS", 9, 9, "$Module_HelpVersion", 0
        ALIGN

CDFSdriverName
        DCB     "CDFSdriver", 0
        ALIGN

NameForNoName
        DCB     "NONAME", 0             ; Call discs with no name this !
NameForNoNameEnd
        ALIGN
        
AmbiguousDiscNameError_tag
        DCD     &1009E :OR: (fsnumber_CDFS :SHL:8)
        DCB     "am", 0
        ALIGN

switoobig_tag
        DCD     &1E6
        DCB     "uk", 0
        ALIGN

invalidparameter_tag
        DCD     CDFS_ErrorBlock + 0
        DCB     "ea", 0
        ALIGN

 [ CheckConfiguredDrives
noconfigureddrives_tag
        DCD     CDFS_ErrorBlock + 1
        DCB     "eb", 0
        ALIGN
 ]

nospace_tag
        DCD     CDFS_ErrorBlock + 5
        DCB     "ef", 0
        ALIGN

baddrive_tag
        DCD     CDFS_ErrorBlock + 8
        DCB     "ei", 0

playmsf_tag             DCB "se", 0
nodrivesfound_tag       DCB "w1", 0
currentspeed_tag        DCB "w2", 0
playlist_tag            DCB "w3", 0
total_tag               DCB "w4", 0
cddevicesheader_tag     DCB "ch", 0
track_tag               DCB "w5", 0
audio_tag               DCB "w6", 0
data_tag                DCB "w7", 0
tracks2_tag             DCB "w8", 0
free_tag                DCB "fr", 0
        ALIGN
        
        END
        
