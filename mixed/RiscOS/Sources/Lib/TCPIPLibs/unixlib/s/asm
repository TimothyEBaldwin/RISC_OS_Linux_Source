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
        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:APCS.<APCS>

        EXPORT  _get_t0_count
        EXPORT  _get_hal_t0_count

        AREA    |Asm$$Code|, CODE, READONLY

sb      RN      9
SB      RN      9

_get_t0_count
        MOV     ip, lr
        [ {CONFIG}<>26
        MRS     r2, CPSR
        ]
        SWI     XOS_EnterOS             ; Must be in SVC mode to peek IOC/IOMD
        MOV     r3,#IOC
; Shut off interrupts (briefly) to ensure an atomic read of these
; silly hardware registers.
        [ {CONFIG}=26
        TEQP    pc,#I_bit :OR: SVC_mode
        |
        MRS     r0, CPSR
        ORR     r0, r0, #I32_bit
        MSR     CPSR_c, r0              ; Disable interrupts
        ]
        STRB    r3,[r3,#Timer0LR]
        LDRB    r1,[r3,#Timer0CL]
        LDRB    r0,[r3,#Timer0CH]
        ORR     r0,r1,r0,LSL #8
        [ {CONFIG}<>26
        MSR     CPSR_c, r2              ; Restore entry mode and irq state
        ]
        Return  ,LinkNotStacked,,ip

; unsigned long _get_hal_t0_count(uint32_t hal_sb, void * hal_fn_ptr);
;
; Call HAL_TimerReadCountdown to get current Timer 0 countdown value.
;
;   Static base value in a1
;   Pointer to HAL_TimerReadCountdown routine in a2

_get_hal_t0_count   ROUT
; Are we in USR mode?
        [ {CONFIG} = 26
        TST     lr, #3                  ; Is mode USR26?
        |
        MRS     a3, CPSR
        TST     a3, #3                  ; Is mode USR26 or USR32?
        ]
        BEQ     %FT50

; We are in SVC mode already
        FunctionEntry   sb
        MOV     sb, a1
        MOV     a1, #0                  ; We want to read timer 0
        ADR     lr, %FT01
        MOV     pc, a2                  ; Call HAL
01
        Return  sb

50
; We are in USR mode
        [ {CONFIG} = 26
        MOV     ip, lr
        ]
        SWI     XOS_EnterOS             ; Enter SVC mode
        [ {CONFIG} = 26
        STMFD   sp!,{sb, ip}
        |
        STMFD   sp!,{a3, sb}
        ]
        MOV     sb, a1
        MOV     a1, #0                  ; We want to read timer 0
        ADR     lr, %FT51
        MOV     pc, a2                  ; Call HAL
51      
        [ {CONFIG} = 26
        Return  sb                      ; Return and restore entry mode
        |
        LDMFD   sp!,{a3, sb}
        MSR     CPSR_c, a3              ; Restore entry mode
        Return  ,LinkNotStacked
        ]

        END
