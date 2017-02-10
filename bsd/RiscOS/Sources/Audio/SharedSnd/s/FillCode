; Copyright (c) 1995, Expressive Software Projects
; All rights reserved.
; 
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
;     * Redistributions of source code must retain the above copyright
;       notice, this list of conditions and the following disclaimer.
;     * Redistributions in binary form must reproduce the above copyright
;       notice, this list of conditions and the following disclaimer in the
;       documentation and/or other materials provided with the distribution.
;     * Neither the name of Expressive Software Projects nor the names of its
;       contributors may be used to endorse or promote products derived from
;       this software without specific prior written permission.
; 
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
; DISCLAIMED. IN NO EVENT SHALL EXPRESSIVE SOFTWARE PROJECTS BE LIABLE FOR ANY
; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
; ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
; 
; SharedSound provided fill code.
;

; FIXME: Note we're assuming that the buffer is aligned which isn't
;        guarenteed by the interface description below - either this
;        routine, or the interface description should be updated
fill_silence
        TST     r3,#1           ; If we are being asked to mix, then nothing to do.
        MOVNE   r1,r2           ; Pretend we filled!
        MOVNE   r0, r3          ; return the flags too!
        MOVNE   PC,R14
        CMP     R1,R2           ; check whether already complete
        MOVHS   r0, r3          ; if already complete, return flags properly
        MOVHS   PC,R14          ; Already full!
        MOV     R0,#0


   [ {FALSE}
; Old routine to fill the silence
fs_lp
        STR     R0,[R1],#4
        CMP     R1,R2
        BMI     fs_lp

   |

; slightly twiddled about version to unroll the loop a little
; => r0 = 0
;    r1-> start of buffer to fill
;    r2-> end of buffer to fill (exclusive)
; Possibly consider using more registers and STMIA although we would have
; to stack more registers
fs_lp_large
        ADD     r1,r1,#32
        CMP     r1,r2
        BHI     fs_lp_small_start
        STR     r0,[r1,#-32]
        STR     r0,[r1,#-28]
        STR     r0,[r1,#-24]
        STR     r0,[r1,#-20]
        STR     r0,[r1,#-16]
        STR     r0,[r1,#-12]
        STR     r0,[r1,#-8]
        STR     r0,[r1,#-4]
        B       fs_lp_large
; finish off any remaining bits
fs_lp_small_start
        SUB     r1,r1,#32
fs_lp_small
        CMP     R1,R2
        STRLO   R0,[R1],#4
        BLO     fs_lp_small
   ]

        ORR     R0,R3,#1        ; R0 = flags + MIX set
        MOV     PC,R14

        ; On Entry:
        ;  r1 = Pointer to buffer to fill
        ;  r2 = Pointer to byte after end of buffer to fill
        ;  r3 = flags
        ;        bit     0 = Mix
        ;       [bit     1 = Quality                                            ] Unimplemented
        ;       [bits  3-7 = Overrun count (0 = None, 1-30 = 1-30, 31 = > 30)   ] but reserved
        ;       [bit    29 = Reversed stereo                                    ] for future.
        ;        bit    30 = Use volume in R7
        ;        bit    31 = Mute if set
        ;  R4 = Pointer to base of buffer to fill from
        ;  R5 = Pointer to byte after end of buffer to fill from
        ;  R6 = fractional step as specified by SharedSound_SampleRate
        ;  R7 = LR volume (if bit 30 of R2 is set).
        ;  R9 = Fractional Accumulator
        ; [R10= Left VU value ] Possible future extensions
        ; [R11= Right VU value]
        ; On Exit:
        ;  R0 = new flags value (to be returned to return for it to return to SharedSound)
        ;  R1 = pointer to next byte to be filled
        ;  R4 = pointer to next byte in the buffer
        ;  R9 = New fractional Accumulator
        ;  R2,R3,R5,R6,R7,R8,R12 preserved

        ; Now follow many variants of fillcode.
        ; Key:  F = Fill, M = Mix.
        ;       L = Low quality (no interpolation), H (*) = high quality (interpolated)
        ;       mute = muted (increments fill buffer).
        ;       V = volume scales (otherwise assumes max volume)
        ;       R (*) = reversed
        ; (* = Not yet implemented as the bits can never be set by SharedSound)
fill_data
        Entry   "R5"
        ; How many stereo samples (4 bytes) will this fill routine use?
        ; We are never going to be asked to fill more than 256K.
        SUBS    R2,R2,R1                ; R2 = number of output bytes required.
        BMI     fill_return             ; We have already filled it!
        MOV     R2,R2,LSR#2             ; R2 = number of words.

        ; For R6 = AAAAaaaa, R2 = 0000bbbb, find R6*R2+R9
        MOV     R0,R6,LSR#16            ; R0 = AAAA
        BIC     R14,R6,R0,LSL#16        ; R14= aaaa
        MLA     R14,R2,R14,R9           ; R14= aaaa*bbbb+R9
        MUL     R0,R2,R0                ; R0 = AAAA*bbbb
        ADDS    R14,R14,R0,LSL#16       ; Add in to form lower word
        MOV     R0,R0,LSR#16            ; Throw away bottom 16 bits of top word
        ADC     R0,R0,#0                ; Allow for carry

        MOV     R14,R14,LSR#24          ; Throw away fractions
        ORR     R14,R14,R0,LSL#8        ; R14= Number of samples consumed.

        ADD     R2,R1,R2,LSL#2          ; Reconstitute R2 = End of buffer to fill.

        SUBS    R0,R5,R4                ; R0 = Number of bytes of data available.
        BMI     fill_return             ; No data! just return

        ;  r1 = Pointer to buffer to fill
        ;  r2 = Pointer to byte after end of buffer to fill
        ;  r3 = flags
        ;        bit     0 = Mix
        ;       [bit     1 = Quality                                            ] Unimplemented
        ;       [bits  3-7 = Overrun count (0 = None, 1-30 = 1-30, 31 = > 30)   ] but reserved
        ;       [bit    29 = Reversed stereo                                    ] for future.
        ;        bit    30 = Use volume in R7
        ;        bit    31 = Mute if set
        ;  R4 = Pointer to base of buffer to fill from
        ;  R5 = Pointer to byte after end of buffer to fill from
        ;  R6 = fractional step as specified by SharedSound_SampleRate
        ;  R7 = LR volume (if bit 30 of R2 is set).
        ;  R9 = Fractional Accumulator
        ;  R10= Left VU value
        ;  R11= Right VU value
        ; On Exit:
        ;  R0 = new flags value (to be returned to return for it to return to SharedSound)
        ;  R1 = pointer to next byte to be filled
        ;  R4 = pointer to next byte in the buffer
        ;  R9 = New fractional Accumulator
        ;  R2,R3,R5,R6,R7,R8,R12 preserved
        CMP     R14,R0,ASR#2            ; If R14 > R0 then we need more than we have.
        AND     R0,R3,#&C0000001
        ORRHI   R0,R0,#1<<29            ; Use the data limited cases
        ADD     PC,PC,R0,ROR#27
        DCD     0
fill_code_table
        B       ssh_FL          ; 0 = Max Vol,   No Mute, Fill
        B       sshD_FL         ; 1 = Max Vol,   No Mute, Fill, Data limited
        B       ssh_VFL         ; 2 = Vol Scale, No Mute, Fill
        B       sshD_VFL        ; 3 = Vol Scale, No Mute, Fill, Data limited
        B       ssh_Fmute       ; 4 = Max Vol,   Mute,    Fill
        B       ssh_Fmute       ; 5 = Max Vol,   Mute,    Fill, Data limited
        B       ssh_Fmute       ; 6 = Vol Scale, Mute,    Fill
        B       ssh_Fmute       ; 7 = Vol Scale, Mute,    Fill, Data limited
        B       ssh_ML          ; 8 = Max Vol,   No Mute, Mix
        B       sshD_ML         ; 9 = Max Vol,   No Mute, Mix,  Data limited
        B       ssh_VML         ; 10= Vol Scale, No Mute, Mix
        B       sshD_VML        ; 11= Vol Scale, No Mute, Mix,  Data limited
        B       ssh_Mmute       ; 12= Max Vol,   Mute,    Mix
        B       ssh_Mmute       ; 13= Max Vol,   Mute,    Mix,  Data limited
        B       ssh_Mmute       ; 14= Vol Scale, Mute,    Mix
        B       ssh_Mmute       ; 15= Vol Scale, Mute,    Mix,  Data limited

fill_return
        ORR     r0,r3,#1        ; r0 = flags on entry + MIX.
        EXIT

; --------------------------------------------------------------------------------
; OK. Of the 32 cases above, half are muted, so resolve to just one case, leaving 16 others.
; We are going to ignore the reversed cases so that leaves just 8 cases.
; We are also going to ignore oversampling, hence 4 cases. But we are still WAY too lazy to
; write (or too sensible to try to maintain) 4 sets of code. So we do it by smoke, mirrors
; and macros. We have a magic FillCode macro that generates all the different cases we need,
; by invoking submacros for the actual filling/mixing/scaling etc.
;
; The next bit is the definition of the two toplevel magic macros.
; During the following routine we tend to use:
; r1 = buffer pointer
; r2 = buffer end
; r3 = flags
; r4 = base of buffer fill ptr
; r5 = top of buffer fill ptr (stop when r5 == r4)
; r6 = fractional step
; r7 = volume
; r9 = accumulator
; r14= scratch

; This macro is called when we fill up to the end of the buffer (i.e. R1 >= R2)
        MACRO
        FillCode        $name
ssh_$name
        MakeSpace$name

ssh_lp0_$name
        RealFillCode$name

        CMP     R1,R2
        BMI     ssh_lp0_$name

        UnMakeSpace$name

        ORR     r0,r3,#1        ; r0 = flags on entry + MIX.
        EXIT

        MEND

; This macro is called when we fill up to the end of the data (i.e. R4 >= R5)
        MACRO
        FillCodeD       $name
sshD_$name
        MakeSpace$name

sshD_lp0_$name
        RealFillCode$name

        CMP     R4,R5
        BMI     sshD_lp0_$name

        UnMakeSpace$name

        ORR     r0,r3,#1        ; r0 = flags on entry + MIX.
        EXIT

        MEND

;--------------------------------------------------------------------------------
; And here we define the submacros for each of the different fill routines.
; The RealFillCodeXX macro that actually does the filling. This can use R0, R10, R11, R14
; as scratch, together with R2 and R12 if it is prepared to save them.
; If it uses these temporary registers, then the other two macros MakeSpaceXX and
; UnMakeSpaceXX must save and reload the ones it uses.
;
; MakeSpaceXX can also setup and constants needed by the fillcode.
;
; FL = Fill, Low Quality.

        MACRO
        RealFillCodeFL

        ADD     r9,r9,r6                ; accum += frac
        AND     r14,r9,#&FF000000       ; r14 = integer inc
        LDR    R0,[R4],r14,LSR#22
        BIC     r9,r9,#&FF000000        ; keep just the fractional bit
        STR    R0,[R1],#4

        MEND

        MACRO
        MakeSpaceFL
        MEND
        MACRO
        UnMakeSpaceFL
        MEND

; VFL = Volume Scale,Fill, Low Quality.

        MACRO
        MakeSpaceVFL

        MOV     r10,R7,LSR#16           ; r10 = Left Vol
        BIC     r11,r7,r10,LSL#16       ; r11 = Right Vol

        MEND

        MACRO
        RealFillCodeVFL

        ADD     r9,r9,r6                ; accum += frac
        AND     r14,r9,#&FF000000       ; r14 = integer inc
        LDR     R0,[R4],r14,LSR#22
        BIC     r9,r9,#&FF000000        ; keep just the fractional bit
    [ NoARME
        MOV     R14,R0,ASR#16
        MUL     R14,R10,R14             ; R14= LLLLxxxx = Scaled L volume
        MOV     R0,R0,LSL#16
        MOV     R0,R0,ASR#16
        MUL     R0,R11,R0               ; T3 = RRRRxxxx = Scaled R volume
        MOV     R14,R14,LSR#16
        MOV     R0,R0,LSR#16
        ORR     R0,R0,R14,LSL#16
    |
        SMULWT  R14,R10,R0              ; R14 = ssssLLLL (signed)
        SMULWB  R0,R11,R0               ; R0 = ssssRRRR
      [ NoARMv6
        MOV     R14,R14,LSL #16
        MOV     R0,R0,LSL #16
        ORR     R0,R14,R0,LSR #16
      |
        PKHBT   R0,R0,R14,LSL #16       ; R0 = LLLLRRRR
      ]
    ]
        STR     R0,[R1],#4

        MEND

        MACRO
        UnMakeSpaceVFL

        MEND

; ML = Mix, Low Quality

        MACRO
        MakeSpaceML
      [ NoARMv6
        MOV     R10,#1<<31
      ]
        MEND

        MACRO
        RealFillCodeML

        ADD     R9,R9,R6                ; accum += frac
        AND     R14,R9,#&FF000000       ; r14= integer inc
        LDR     R0,[R4],r14,LSR#22      ; R0 = AAAABBBB = Our samples
        LDR     R14,[R1]                ; R14= CCCCDDDD = Current samples
        BIC     R9,R9,#&FF000000        ; keep just the fractional bit
      [ NoARMv6
        MOV     R0,R0,ROR#16            ; R0 = BBBBAAAA
        ADDS    R11,R14,R0,LSL#16      ; T2 = eeeexxxx (where eeee = AAAA+CCCC)
        SBCVS   R11,R10,#0              ; T2 = EEEExxxx (where EEEE = Clip[AAAA+CCCC])
        ADDS    R0,R0,R14,LSL#16        ; R0 = DDDD0000+BBBB000
        SBCVS   R0,R10,#0               ; R0 = FFFF0000 (where FFFF = Clip[DDDD+CCCC])
        AND     R11,R11,R10,ASR#15      ; T2 = EEEE0000
        ORR     R0,R11,R0,LSR#16        ; R0 = EEEEFFFF
      |
        QADD16  R0,R0,R14               ; Signed saturating halfword addition
      ]
        STR     R0,[R1],#4

        MEND

        MACRO
        UnMakeSpaceML
        MEND

; VML = Volume Scale, Mix, Low Quality
; r1 = buffer pointer
; r2 = buffer end
; r3 = flags
; r4 = base of buffer fill ptr
; r5 = top of buffer fill ptr (stop when r5 == r4)
; r6 = fractional step
; r7 = volume
; r9 = accumulator
; r14= scratch
;

        MACRO
        MakeSpaceVML
    [ NoARME
        MOV     r10,R7,LSR#16           ; r10 = Left Vol
        BIC     r11,r7,r10,LSL#16       ; r11 = Right Vol
        Push    "R7,R12"
        MOV     R12,#1<<31
    |
      [ NoARMv6
        Push    "R7,R12"
        LDR     r12,=&ffff<<15
        AND     r10,r12,r7,LSR #1       ; r10 = Left Vol
        AND     r11,r12,r7,LSL #15      ; r11 = Right Vol
      |
        MOV     r10,R7,LSR#16           ; r10 = Left Vol
        BIC     r11,r7,r10,LSL#16       ; r11 = Right Vol
        Push    "R12"
      ]
    ]
        MEND

        MACRO
        RealFillCodeVML

        ADD     R9,R9,R6                ; accum += frac
        AND     R14,R9,#&FF000000       ; r14= integer inc
        LDR     R0,[R4],r14,LSR#22      ; R0 = AAAABBBB = Our samples
        BIC     R9,R9,#&FF000000        ; keep just the fractional bit
    [ NoARME
        MOV     r14,R0,ASR#16
        MUL     R7,R10,R14              ; R7 = AAAAxxxx
        LDR     R14,[R1]                ; R14= CCCCDDDD = Current samples
        MOV     R0,R0,LSL#16
        MOV     R0,R0,ASR#16
        MUL     R0,R11,R0               ; R0 = BBBBxxxx
        ADDS    R7,R14,R7               ; R7 = eeeexxxx (where eeee = AAAA+CCCC)
        SBCVS   R7,R12,#0               ; R7 = EEEExxxx (where EEEE = Clip[AAAA+CCCC])
        ADDS    R0,R0,R14,LSL#16        ; R0 = DDDD0000+BBBB000
        SBCVS   R0,R12,#0               ; R0 = FFFF0000 (where FFFF = Clip[DDDD+BBBB])
        AND     R7,R7,R12,ASR#15        ; R7 = EEEE0000
        ORR     R0,R7,R0,LSR#16         ; R0 = EEEEFFFF
    |
      [ NoARMv6
        SMULWT  R14,R10,R0              ; R14= AAAAxxxx >> 1
        LDR     R7,[R1]                 ; R7 = CCCCDDDD = Current samples
        SMULWB  R0,R11,R0               ; R0 = BBBBxxxx >> 1
        BIC     R14,R14,R12,LSR #16     ; R14= AAAA0000 >> 1 (must mask off to avoid potential overflow from interaction with low bits of R7)
        QDADD   R14,R7,R14              ; R14= EEEExxxx (where EEEE = Clip[AAAA+CCCC])
        MOV     R7,R7,LSL #16
        QDADD   R0,R7,R0                ; R0 = FFFFxxxx (where FFFF = Clip[DDDD+BBBB])
        AND     R14,R14,R12,LSL #1      ; R14= EEEE0000
        ORR     R0,R14,R0,LSR #16       ; R0 = EEEEFFFF
      |
        SMULWT  R14,R10,R0              ; R14= ssssAAAA
        LDR     R7,[R1]                 ; R7 = CCCCDDDD = Current samples
        SMULWB  R0,R11,R0               ; R0 = ssssBBBB
        PKHBT   R0,R0,R14,LSL #16       ; R0 = AAAABBBB
        QADD16  R0,R0,R7                ; R0 = EEEEFFFF
      ]
    ]
        STR     R0,[R1],#4

        MEND
        MACRO
        UnMakeSpaceVML
      [ NoARMv6
        Pull    "R7,R12"
      |
        Pull    "R12"
      ]
        MEND

; Fmute = zero fill

        MACRO
        MakeSpaceFmute
        MOV     R0,#0
        MEND
        MACRO
        RealFillCodeFmute

        ADD     R9,R9,R6                ; accum += frac
        STR     R0,[R1],#4

        MEND
        MACRO
        UnMakeSpaceFmute

        BIC     R9,R9,#&FF000000        ; keep just the fractional bit

        MEND

; Mmute = zero fill

        MACRO
        MakeSpaceMmute
        MEND
        MACRO
        RealFillCodeMmute

        ADD     R9,R9,R6                ; accum += frac
        ADD     R1,R1,#4

        MEND
        MACRO
        UnMakeSpaceMmute

        BIC     R9,R9,#&FF000000        ; keep just the fractional bit

        MEND

;--------------------------------------------------------------------------------
; And finally we invoke the macro to generate code as required.

        FillCode        FL
        FillCodeD       FL
        FillCode        ML
        FillCodeD       ML
        FillCode        VFL
        FillCodeD       VFL
        FillCode        VML
        FillCodeD       VML
        FillCode        Fmute
        FillCode        Mmute

        END
