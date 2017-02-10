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
; > Sources.Front

;-----------------------------------------------------------------------------
;       Useful declarations.
;

;-----------------------------------------------------------------------------
;       Workspace layout.
;
workspace       RN      R12
                ^       0,workspace
wsorigin        # 0
 [ international
message_file_open       #       4
message_file_block      #       4*4
 ]
SerialInHandle  # 4             ; File handle for serial input device.
State           # 4             ; Address of current state handler.

MouseData       # 0             ; Mouse data record.
DeltaX          # 4             ; X movement since last query from Kernel.
DeltaY          # 4             ; Y movement since last query from Kernel.
Buttons         # 4             ; Button states.

Locked          # 1             ; Re-entrancy lock.
LastButtons     # 1             ; Button states on last poll.
Byte1           # 1             ; First byte of serial mouse report.
Byte2           # 1             ; Second byte of serial mouse report.
Byte3           # 1             ; Third byte of serial mouse report.
Byte4           # 1             ; Fourth byte of serial mouse report.

                # 3:AND:(-:INDEX:@)

max_running_work   *       :INDEX:@

        ! 0, "SerialMouse workspace is ":CC:(:STR:(:INDEX:@)):CC:" bytes"

        END

