        SUBT    ==> BootNet.s.Commands

ModuleTitle
        ; Shared with the command table

UtilsCommands

        ; Configuration and Status commands

        DCB     "BootNet", 0
        ALIGN
        DCD     ConfigureBootNet - Origin

      [ international_help
        InfoWord 1, 1, Status_Keyword_Flag :OR: International_Help
        DCD     SyntaxOfConfigureBootNet - Origin
        DCD     HelpForConfigureBootNet - Origin
      |
        InfoWord 1, 1, Status_Keyword_Flag :OR: Help_Is_Code_Flag
        DCD     SyntaxOfConfigureBootNet - Origin
        DCD     DoConfigureBootNetHelp - Origin
      ]

        DCD     0                                       ; Terminate table

ConfigureBootNet ROUT
        Push    "r0-r4, lr"
        LDR     wp, [ r12 ]
        CMP     r0, #1
        BHI     DoConfigureBootNet                      ; *Configure BootNet
        BEQ     StatusOfBootNet                         ; *Status BootNet
        ADR     r0, SyntaxOnlyOfConfigureBootNet        ; Bare *Configure (show syntax)
        B       PrintMessageAndExit

SyntaxOnlyOfConfigureBootNet                           
        DCB     "BootNet    On|Off",0                   ; Command keyword and its switches cannot
Status_Common                                           ; be internationalised, like all other commands
        DCB     "BootNet    O", 0
Status_BootNetOff
        DCB     "ff", 0
Status_BootNetOn
        DCB     "n", 0
        ALIGN

StatusOfBootNet                                         ; Print the status
        ADR     r0, Status_Common
        SWI     XOS_Write0
        BLVC    ReadConfiguration
        BVS     ExitConfigure
        ADREQ   r0, Status_BootNetOff
        ADRNE   r0, Status_BootNetOn
PrintMessageAndExit
        SWI     XOS_Write0
PrintNewLineAndExit
        SWIVC   XOS_NewLine
        B       ExitConfigure

      [ :LNOT: international_help
DoConfigureBootNetHelp
        Push    "lr"
        ADR     r0, HelpForConfigureBootNet
        MOV     r1, #0
        SWI     XOS_PrettyPrint                         ; Help
        ADRL    r0, SyntaxOfConfigureBootNet
        SWI     XOS_Write0                              ; Syntax
        SWI     XOS_NewLine
        MOV     r0, #0
        CLRV
        Pull    "pc"
      ]

DoConfigureBootNet
        LDRB    r1, [ r0 ], #1
        TEQ     r1, #"o"
        TEQNE   r1, #"O"
        BNE     SyntaxError
        LDRB    r1, [ r0 ], #1
        TEQ     r1, #"f"
        TEQNE   r1, #"F"
        BNE     TestForN
        LDRB    r1, [ r0 ], #1
        TEQ     r1, #"f"
        TEQNE   r1, #"F"
        BNE     SyntaxError
20
        LDRB    r1, [ r0 ], #1
        CMP     r1, #" "
        BEQ     %20                                     ; Skip trailing spaces
        BGT     SyntaxError

        MOV     r0, #ReadCMOS
        MOV     r1, #SystemSpeedCMOS
        SWI     XOS_Byte
        BICVC   r2, r2, #1                              ; Reset the relevant bit
        MOVVC   r0, #WriteCMOS
        SWIVC   XOS_Byte
        B       ExitConfigure

TestForN
        TEQ     r1, #"n"
        TEQNE   r1, #"N"
        BNE     SyntaxError
40
        LDRB    r1, [ r0 ], #1
        CMP     r1, #" "
        BEQ     %40                                     ; Skip trailing spaces
        BGT     SyntaxError

        MOV     r0, #ReadCMOS
        MOV     r1, #SystemSpeedCMOS
        SWI     XOS_Byte
        ORRVC   r2, r2, #1                              ; Set the relevant bit
        MOVVC   r0, #WriteCMOS
        SWIVC   XOS_Byte
ExitConfigure
        STRVS   r0, [ sp ]
        Pull    "r0-r4, pc"

SyntaxError
      [ international_help
        ADRL    r0, SyntaxOfConfigureBootNetError
        BL      MessageTransErrorLookupOnce
        B       ExitConfigure
      |
        ADRL    r0, SyntaxOfConfigureBootNetError
        SETV
        B       ExitConfigure
      ]

ReadConfiguration
        ;       Returns the bit in R0 and Z is the result
        ;       of TEQing with zero
        ;       Bit 0 => Acorn Universal Network ROMBoot (0=>disabled, 1=>enabled)
        ;       All other registers preserved
        Push    "r1, r2, lr"
        MOV     r0, #ReadCMOS
        MOV     r1, #SystemSpeedCMOS
        SWI     XOS_Byte
        ANDVCS  r0, r2, #1
        Pull    "r1, r2, pc"

        LTORG

        END
