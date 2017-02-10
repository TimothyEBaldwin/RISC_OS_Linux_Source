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
; -> Sources.Messages

        GBLS    TaskModuleCommand

TaskModuleCommand SETS "ShellCLI_Task"

        ^       TaskSWI_Base
Input   #       1
Output  #       1        ; Later these could probably become the same code
Ego     #       1        ; Name of the child
Morio   #       1        ; Application dying
Morite  #       1        ; Application to be killed
NewTask #       1        ; New task to be started (normally broadcast)
Suspend #       1        ; Suspend the running task
Resume  #       1        ; Continue the running task

        END
