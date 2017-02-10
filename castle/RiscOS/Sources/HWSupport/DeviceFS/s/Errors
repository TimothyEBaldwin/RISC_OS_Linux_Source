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
; > Errors (errors - strange really?!)



; call/return the relevant error from DeviceFS based on the international flag.

                MACRO
$label          DoError         $cc
              [ international
$label          B$cc    MakeError
              |
$label          RETURNVS        $cc
              ]
                MEND


; define error messages used by DeviceFS based on the internationalisation flag.

              [ international
                ^ ErrorBase_DeviceFS

                AddError DeviceFS_BadSWI,                 "BadSWI"
                AddError DeviceFS_BadOp,                  "BadFSOp"
                AddError DeviceFS_InUse,                  "E02"
                AddError DeviceFS_DeviceInUse,            "E03"
                AddError DeviceFS_BadHandle,              "E04"
                AddError DeviceFS_DeviceNotKnown,         "E05"
                AddError DeviceFS_SpecialFieldSyntax,     "E06"
                AddError DeviceFS_BadValidation,          "E07"
                AddError DeviceFS_BadReserved,            "E08"
                AddError DeviceFS_OnlyCharDevices,        "E09"
                AddError DeviceFS_Escape,                 "Escape",17   ; Return error number 17.
                AddError DeviceFS_MustBeBuffered,         "E0B"
                AddError DeviceFS_CannotDetach,           "E0C"
		AddError DeviceFS_BadIOCtlReasonCode,     "E0D"
		AddError DeviceFS_BadIOCtlParameter,      "E0E"
                AddError DeviceFS_Timeout,                "E0F"
              |
                ^ ErrorBase_DeviceFS

                AddError DeviceFS_BadSWI,                 "SWI value out of range for module DeviceFS"
                AddError DeviceFS_BadOp,                  "Bad operation on devices:"
                AddError DeviceFS_InUse,                  "DeviceFS in use"
                AddError DeviceFS_DeviceInUse,            "Device currently in use"
                AddError DeviceFS_BadHandle,              "Unknown handle"
                AddError DeviceFS_DeviceNotKnown,         "Device not found"
                AddError DeviceFS_SpecialFieldSyntax,     "Syntax error in special field"
                AddError DeviceFS_BadValidation,          "Validation string contains illegal character"
                AddError DeviceFS_BadReserved,            "Reserved fields non-zero"
                AddError DeviceFS_OnlyCharDevices,        "Block devices are not supported"
                AddError DeviceFS_Escape,                 "Escape",17
                AddError DeviceFS_MustBeBuffered,         "Must be a buffered stream to set threshold"
                AddError DeviceFS_CannotDetach,           "Unable to detach current owner of this buffer"
		AddError DeviceFS_BadIOCtlReasonCode,     "Unknown ioctl reason code"
		AddError DeviceFS_BadIOCtlParameter,      "Bad ioctl parameter"
                AddError DeviceFS_Timeout,                "The device has timed out"
              ]

                END
