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
; > Errors



; call/return the relevant error based on the international flag.

                MACRO
$label          DoError         $cc
              [ international
$label          B$cc    MakeError
              |
                ASSERT No32bitCode
$label          ORR$cc.S pc, lr, #VFlag
              ]
                MEND


; Define error messages that appear in the 'Resources.Serial.Messages' file

              [ international
                ^ ErrorBase_Serial

                AddError Serial_NoSerialDevice,   "E01"
                AddError Serial_UnknownSerialOp,  "E02"
                AddError Serial_BadControlOp,     "E03"
                AddError Serial_BadBaud,          "E04"
                AddError Serial_BadHardware,      "E05"
                AddError Serial_NoSplitBaudRates, "E06"
                AddError Serial_InUse,            "E07"
                ASSERT   @ <= ErrorBase_Serial + ?ErrorBase_Serial

              |
                ^ ErrorBase_Serial

                AddError Serial_NoSerialDevice,   "No serial device driver installed"
                AddError Serial_UnknownSerialOp,  "Unknown SerialOp"
                AddError Serial_BadControlOp,     "Bad call to serial device"
                AddError Serial_BadBaud,          "Bad baud rate"
                AddError Serial_BadHardware,      "Unknown hardware configuration"
                AddError Serial_NoSplitBaudRates, "Split baud rates not supported"
                AddError Serial_InUse,            "Serial device is in use"
                ASSERT   @ <= ErrorBase_Serial + ?ErrorBase_Serial

              ]

                END

