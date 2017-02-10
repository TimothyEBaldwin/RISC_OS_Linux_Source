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
; >Tables

; TABLES:
;        table of SWI names
;        tables of OpCodes
;        table of parameter block size
;        table of number of bytes returned
;        table of readwritenodata
;        table of storageareas

;        table of IBMfile extensions
;        table of relating Archy file types

;**************************************************************************
tableofswinames              ; List of SWI names
;**************************************************************************

 = "CD", 0           ;   GROUP NAME

  = "Version",0              ; 0
  = "ReadData",0             ; 1
  = "SeekTo",0               ; 2
  = "DriveStatus",0          ; 3
  = "DriveReady",0           ; 4
  = "GetParameters",0        ; 5
  = "SetParameters",0        ; 6
  = "OpenDrawer",0           ; 7
  = "EjectButton",0          ; 8
  = "EnquireAddress",0       ; 9
  = "EnquireDataMode",0      ; 10
  = "PlayAudio",0            ; 11
  = "PlayTrack",0            ; 12
  = "AudioPause",0           ; 13
  = "EnquireTrack",0         ; 14
  = "ReadSubChannel",0       ; 15
  = "CheckDrive",0           ; 16
  = "DiscChanged", 0         ; 17
  = "StopDisc", 0            ; 18
  = "DiscUsed", 0            ; 19 Read capacity
  = "AudioStatus", 0         ; 20 Playback status
  = "Inquiry", 0             ; 21 returns information about device
  = "DiscHasChanged", 0      ; 22 tells me that the disc has changed
  = "Control", 0             ; 23 actually does SCSI_Control for Acorn card
  = "Supported", 0           ; 24 returns commands supported
  = "Prefetch", 0            ; 25 drive seeks and buffers data
  = "Reset", 0               ; 26 resets the drive
  = "CloseDrawer", 0         ; 27 on SONY will not work
  = "IsDrawerLocked", 0      ; 28 returns locked/unlocked
  = "AudioControl", 0        ; 29 sets audio parameters
  = "LastError", 0           ; 30 returns number of last error
  = "AudioLevel", 0          ; 31 sets volume level
  = "Register", 0            ; 32
  = "Unregister", 0          ; 33
  = "ByteCopy", 0            ; 34 Copy bytes in memory
  = "Identify", 0            ; 35 get the driver to identify the drive type
  = "ConvertToLBA", 0        ; 36
  = "ConvertToMSF", 0        ; 37
  = "ReadAudio", 0           ; 38
  = "ReadUserData", 0        ; 39
  = "SeekUserData", 0        ; 40
  = "GetAudioParms", 0       ; 41
  = "SetAudioParms", 0       ; 42
  = "SCSIUserOp", 0          ; 43

                     ;   ADD NEW SWI'S HERE

NUMBEROFSWIS * 44

 = 0

 ALIGN



 END
