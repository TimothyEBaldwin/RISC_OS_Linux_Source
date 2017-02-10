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
; -> Strings

; This contains all of the strings and error blocks associated with the

; CD driver



;**************************************************************************
;                          Error Message Area
;**************************************************************************

 CDFSDriverError NoConfiguredDrive, "NoConfD"

 CDFSDriverError BadAlignment, "NoAlign"

 CDFSDriverError DriveNotSupported, "DrvNSup"

 CDFSDriverError BadMode, "ModNSup"

 CDFSDriverError InvalidParameter, "BadParm"

 CDFSDriverError NotAudioTrack, "CntPlay"

 CDFSDriverError NoCaddy, "DrvEmpt"

NOCADDYERRORNUMBER * CDFSDriverErrorNumber - 1

 CDFSDriverError NoDrive, "NoDrive"

 CDFSDriverError InvalidFormat, "BadMode"

 CDFSDriverError BadMinutes, "BadMins"

 CDFSDriverError BadSeconds, "BadSecs"

 CDFSDriverError BadBlocks, "BadBlks"

 CDFSDriverError PhysicalBlockError, "PhysBad"

 CDFSDriverError DrawerLocked, "DLocked"

 CDFSDriverError WrongDataMode, "BadData"

 CDFSDriverError ChannelNotSupported, "NoSubCh"

 CDFSDriverError BadDeviceID, "BadDvID"

 CDFSDriverError BadCardNumber, "BadCard"

 CDFSDriverError BadLUNNumber, "BadLUNN"

 CDFSDriverError NoSuchTrack, "NotAudi"

 CDFSDriverError FaultyDisc, "BadDisc"

 CDFSDriverError NoSuchBlock, "BadAddr"

 CDFSDriverError DriveDoesNotSupportThat, "NotSupp"

 CDFSDriverError driver_not_present, "DrNPres"

 CDFSDriverError swi_not_supported, "SWINSup"

 CDFSDriverError too_many_drivers, "NoMoreD"

 CDFSDriverError not_registered, "NotRegd"

title = "CDFSDriver", 0

 ALIGN

driver_not_present_error
 addr      r0, driver_not_present
 B         error_handler_lookup

help = "CDFSDriver",9, "$Module_HelpVersion", 0
     = " by Eesox", 0

 ALIGN

 END
