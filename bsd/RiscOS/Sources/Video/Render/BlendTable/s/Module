; 
; Copyright (c) 2013, RISC OS Open Ltd
; All rights reserved.
; 
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met: 
;     * Redistributions of source code must retain the above copyright
;       notice, this list of conditions and the following disclaimer.
;     * Redistributions in binary form must reproduce the above copyright
;       notice, this list of conditions and the following disclaimer in the
;       documentation and/or other materials provided with the distribution.
;     * Neither the name of RISC OS Open Ltd nor the names of its contributors
;       may be used to endorse or promote products derived from this software
;       without specific prior written permission.
; 
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; POSSIBILITY OF SUCH DAMAGE.
; 

        AREA    |!!!ModuleHeader|, CODE, READONLY, PIC

Module_BaseAddr
        &       0
        &       InitModule - Module_BaseAddr
        &       KillModule - Module_BaseAddr
        &       0
        &       ModuleTitle - Module_BaseAddr
        &       HelpString - Module_BaseAddr
        &       0
        &       BlendTableSWI_Base
        &       SWIEntry - Module_BaseAddr
        &       SWINameTable - Module_BaseAddr
        &       0
 [ (International_Help <> 0) :LAND: HaveMessages
        DCD     MessageFilename - Module_BaseAddr
 |
        DCD     0
 ]
        &       ModuleFlags - Module_BaseAddr

HelpString
        =       "BlendTable", 9, "$Module_MajorVersion ($Module_Date)"
        [       Module_MinorVersion <> ""
        =       " $Module_MinorVersion"
        ]
        =       0
ModuleTitle
SWINameTable
        =       "BlendTable", 0
        =       "GenerateTable", 0
        =       "UnlockTable", 0
        =       0
        ALIGN
        
ModuleFlags
        &       ModuleFlag_32bit

CacheSizeLimit        * 160*1024 ; Large enough for two 256x256 tables and a few smaller ones
CacheCountLimit       * 32 ; If this is too big, walking the linked list could become a performance issue

; Workspace

                      ^ 0, wp
 [ HaveMessages
MessageFile_Block     # 16
MessageFile_Open      # 4
 ]
CachedTables          # 4 ; Head of cached table list
CacheSize             # 4 ; Total size of cache in bytes
CacheCount            # 4 ; Number of entries in cache
                      
WSSize                * :INDEX: @

; Module code

InitModule      ROUT
        Entry
 [ standalone :LAND: HaveMessages
        ADRL    R0,ResourceFSFiles
        SWI     XResourceFS_RegisterFiles
        EXIT    VS
 ]
        MOV     r0, #ModHandReason_Claim
        LDR     r3, =WSSize
        SWI     XOS_Module
        EXIT    VS
        STR     r2, [r12]
        MOV     r12, r2

        MOV     r0, #0
10      SUBS    r3, r3, #4
        STR     r0, [r12, r3]
        BNE     %BT10

        EXIT

KillModule      ROUT
        Entry
        LDR     wp, [r12]

        ; Free all cache entries
        ADR     r0, CachedTables
05
        LDR     r1, [r0]
        CMP     r1, #0
        ADRNE   lr, %BT05
        BNE     Cache_FreeEntry
 [ HaveMessages
        BL      CloseMessages
  [ standalone
        ADRL    R0,ResourceFSFiles
        SWI     XResourceFS_DeregisterFiles
  ]
 ] 
        CLRV
        EXIT

SWIEntry
        LDR     wp, [r12]
        CMP     r11, #(EndOfJumpTable-JumpTable)/4
        ADDLO   pc, pc, r11, LSL #2
        B       UnknownSWI
JumpTable
        B       SWI_GenerateTable
        B       SWI_UnlockTable
EndOfJumpTable

UnknownSWI
        ADRL    r0, ErrorBlock_ModuleBadSWI
        B       ReturnError_LR

SWI_GenerateTable ROUT
;  in: R0 = flags
;           b0 = R2 is pointer to sprite, not name
;           b1 = R4 is pointer to sprite, not name
;           b2 = Lock table after creation
;           other bits reserved, sbz
;      R1,R2 = source mode/sprite
;      R3,R4 = dest mode/sprite
;      R5 = translucency: 0 = 100% src, 256 = 100% dest
;      R6 = buffer for returned table, or 0 to determine size
;           ignored if locking table
; out: R0 = number of colours in source
;      R1 = number of colours in dest
;      R2 = size of buffer required/used
;      R6 = preserved if R0 b2 clear, else pointer to cached table
;
; ROL spec says {R1,R2} & {R3,R4} are either:
; {mode, 0} for mode number (using what palette?)
; {area, name} for sprite name ptr
; {area, sprite} for sprite ptr (if relevant bit of R5 set)
;
; In our version we allow all the same combinations as ColourTrans_ReadPalette.
; This is essentially a superset of what's laid out in ROL's spec, and I suspect
; it's what they're using internally anyway. The only incompatibility might be
; if they really do require R2/R4 to be 0 when specifying modes (and if 0
; doesn't mean 'use default palette' as it does with ColourTrans)

        ; Validate args
        CMP     r0, #BlendTable_SrcSpritePointer+BlendTable_DestSpritePointer+BlendTable_Lock
        CMPLS   r5, #256
        BHI     %FT90
        ; Get source & dest palettes. Use ColourTrans for simplicity.
        Push    "r0-r9,lr"
        MOV     r9, sp
        TST     r0, #BlendTable_Lock
        MOV     r8, r0
        MVNNE   r6, #0 ; use R6 as flag for whether we need palette entries or we're just reading size
        TEQ     r6, #0
        SUBNE   sp, sp, #2048
        ASSERT  BlendTable_SrcSpritePointer = 1
        AND     r4, r0, #BlendTable_SrcSpritePointer
        MOV     r0, r1
        MOV     r1, r2
        TEQ     r6, #0
        MOVNE   r2, sp
        MOVNE   r3, #2048
        MOVEQ   r2, #0
        SWI     XColourTrans_ReadPalette
        BVS     %FT95
        TEQ     r6, #0
        SUBNE   r7, r2, sp ; Compute src palette size from adjusted pointer
        MOVEQ   r7, r3 ; Get size directly
        AND     r4, r8, #BlendTable_DestSpritePointer
        LDR     r0, [r9, #12] ; dest mode/area
        ASSERT  BlendTable_DestSpritePointer = 2
        MOV     r4, r4, LSR #1 ; shift flag down
        LDR     r1, [r9, #16] ; dest palette/sprite
        SWI     XColourTrans_ReadPalette
        BVS     %FT95
        ; Were we just reading the size?
        CMP     r6, #0
        BEQ     %FT85
        TST     r8, #BlendTable_Lock
        MOVNE   r6, #0 ; r6 now zero if we want to lock a table!
        SUB     r8, r2, sp
        SUB     r8, r8, r7 ; Dest palette size
        MOV     r9, sp
        ; r5 = translucency
        ; r6 = dest ptr, or 0 to allocate & lock
        ; r7 = src palette size
        ; r8 = dest palette size
        ; r9 = palettes
        ; Get or generate a cache entry
        BL      GetCacheEntry
        BVS     %FT94
        ADD     sp, sp, #2048
        ADD     r9, r4, #CachedTable_Data
        CMP     r6, #0
        MOV     r0, r7, LSR #2 ; src colour count
        ADD     r9, r9, r7
        MOV     r1, r8, LSR #2 ; dest colour count
        ADD     r9, r9, r8 ; r9 -> lookup table
        MUL     r2, r0, r1 ; table size
        ADRNE   lr, %FT80
        BNE     Memcpy
        LDR     r5, [r4, #CachedTable_LockCount]
        ADD     r5, r5, #1
        STR     r9, [sp, #6*4] ; return our copy of buffer
        STR     r5, [r4, #CachedTable_LockCount]
80
        ADD     sp, sp, #12
        Pull    "r3-r9,pc"
        
85
        MOV     r0, r7, LSR #2 ; src colour count
        MOV     r1, r3, LSR #2 ; dest colour count
        MUL     r2, r0, r1 ; table size
        ADD     sp, sp, #12
        Pull    "r3-r9,pc"
        
90
        ADRL    r0, ErrorBlock_BadParm
        B       ReturnError_LR

94
        ADD     r9, sp, #2048
95
        MOV     sp, r9
        STR     r0, [r9]
        Pull    "r0-r9,pc"

SWI_UnlockTable ROUT
;  in: R0 = table ptr
        Entry   "r1-r4"
        ; Walk the table list to ensure the pointer is still valid
        LDR     r4, CachedTables
10
        CMP     r4, #0
        EXIT    EQ
        LDMIA   r4, {r1-r3}
        ASSERT  CachedTable_Next = 0
        ASSERT  CachedTable_SrcNColour = 4
        ASSERT  CachedTable_DestNColour = 8
        ADD     lr, r4, #CachedTable_Data
        ADD     lr, lr, r2, LSL #2
        ADD     lr, lr, r3, LSL #2
        CMP     lr, r0
        MOVNE   r4, r1
        BNE     %BT10
        LDR     lr, [r4, #CachedTable_LockCount]
        SUBS    lr, lr, #1
        STRGE   lr, [r4, #CachedTable_LockCount]
        EXIT

Cache_FreeEntry ROUT
;  in: R0 = pointer to pointer to cache entry
; out: [R0] updated
        Entry   "r0,r2-r4"
        ; Unlink from list
        ASSERT  CachedTable_Next = 0
        LDR     r2, [r0]
        LDR     lr, [r2]
        STR     lr, [r0]
        ; Update cache size
        LDR     r4, CacheSize
        LDR     r3, [r2, #CachedTable_SrcNColour]
        LDR     lr, [r2, #CachedTable_DestNColour]
        SUB     r4, r4, #CachedTable_Data
        SUB     r4, r4, r3, LSL #2
        SUB     r4, r4, lr, LSL #2
        MUL     r3, lr, r3
        SUBS    r4, r4, r3
        MOVLT   r4, #0 ; Just in case!
        STR     r4, CacheSize
        LDR     r4, CacheCount
        SUBS    r4, r4, #1
        STRGE   r4, CacheCount
        ; Free the memory
        MOV     r0, #ModHandReason_Free
        SWI     XOS_Module
        EXIT

GetCacheEntry ROUT
;  in: r5 = translucency
;      r7 = src palette size (bytes)
;      r8 = dest palette size (bytes)
;      r9 = palette data
; out: r4 = cache entry
        LDR     r4, CachedTables
        CMP     r4, #0
        BEQ     MakeTable
        Entry   "r0-r3"
10
        LDMIA   r4, {r0-r3}
        ASSERT  CachedTable_Next = 0
        ASSERT  CachedTable_SrcNColour = 4
        ASSERT  CachedTable_DestNColour = 8
        ASSERT  CachedTable_Translucency = 12
        CMP     r1, r7, LSR #2
        CMPEQ   r2, r8, LSR #2
        CMPEQ   r3, r5
        BNE     %FT90
        ; Check palette data
        ADD     r2, r7, r8
        ADD     r1, r4, #CachedTable_Data
        SUB     r2, r2, #4
20
        LDR     r3, [r1, r2]
        LDR     lr, [r9, r2]
        CMP     r3, lr
        BNE     %FT90
        SUBS    r2, r2, #4
        BGE     %BT20
        ; Found a match!
        EXIT
90
        MOVS    r4, r0
        BNE     %BT10
        PullEnv
        ; ... fall through

MakeTable ROUT
;  in: r5 = translucency
;      r7 = src palette size (bytes)
;      r8 = dest palette size (bytes)
;      r9 = palette data
; out: r4 = cache entry
;
; Note: r12 is reused in this routine!
        Entry   "r0-r12"
        ; Work out how much memory we need
        MUL     r3, r7, r8
        ADD     r3, r7, r3, LSR #4
        ADD     r3, r3, r8
        ADD     r3, r3, #CachedTable_Data
        ; Check if there's enough space in the cache
        LDR     r4, CacheSize
        LDR     r6, CacheCount
        ADD     r4, r4, r3
        CMP     r4, #CacheSizeLimit
        CMPLT   r6, #CacheCountLimit-1
        BLGT    FlushCache
        MOV     r0, #ModHandReason_Claim
        SWI     XOS_Module
        STRVS   r0, [sp]
        EXIT    VS
        STR     r2, [sp, #4*4] ; Set up return value
        ; Copy over the palette data
        ADD     r6, r2, #CachedTable_Data
        ADD     r2, r7, r8
        BL      Memcpy
        ; Fill in the other details
        STR     r5, [r6, #CachedTable_Translucency-CachedTable_Data]
        MOV     r7, r7, LSR #2
        MOV     r8, r8, LSR #2
        STR     r7, [r6, #CachedTable_SrcNColour-CachedTable_Data]
        STR     r8, [r6, #CachedTable_DestNColour-CachedTable_Data]
        MOV     r0, #0
        STR     r0, [r6, #CachedTable_LockCount-CachedTable_Data]
        ADD     r10, r9, r7, LSL #2 ; r10 -> dest palette
        ADD     r6, r6, r2 ; r6 -> table data
        ; Examine dest palette to work out which algorithm to use
        ; We currently have three choices:
        ; 'full' is the slowest, as it does up to dest*src*dest iterations
        ; 'grey' is fastest but for greyscale only, it does 256*dest + src*dest iterations
        ; '15bpp' is fast for 256 colour modes. It uses ColourTrans to generate a LUT for the target mode. The LUT generation is slow, but once it's generated ColourTrans will cache it - speeding up any further cases where we need to blend in that mode.
        ; We only use 'grey' for 256 colour destinations. For 16 colour (or less) the gains are minimal.

        ; If dest has <256 colours go straight to the 'full' algorithm
        CMP     r8, #256
        BLO     MakeTable_Full
        ; Examine dest palette to determine if greyscale
        MOV     r11, #255
        MOV     r4, #0
10
        LDR     r0, [r10, r11, LSL #2]
        EOR     r14, r0, r0, LSL #8
        CMP     r14, #&10000
        BHS     MakeTable_15bpp ; Dest isn't greyscale, go to 15bpp algo
        SUBS    r11, r11, #1
        BGE     %BT10
        ; Dest is greyscale - use our fast and accurate greyscale code
        B       MakeTable_Grey

        ; On entry to all algorithms:
        ; r5 = dest amount
        ; r6 = output table ptr
        ; r7 = src ncolour
        ; r8 = dest ncolour
        ; r9 = src palette
        ; r10 = dest palette
        ; r12 = workspace

MakeTable_Full ROUT
        ; Generate a table using the 'full' algorithm
        ; This does a full scan of the dest palette for each blended colour value
        ; The error value for a colour is just the sum of the squares of the
        ; per-component errors; no weighting is applied, although it probably
        ; should be, in order to match ColourTrans (when ColourTrans decides
        ; to use weighting, at least!)
        RSB     r4, r5, #256 ; r4 -> src amount
        MOV     r11, #0 ; current dest entry
10
        ; Get destination entry
        LDR     r0, [r10, r11, LSL #2]
        ; Multiply by r5
        AND     r1, r0, #&FF0000
        MOV     r0, r0, LSR #8
        MUL     r1, r5, r1 ; GGgg0000
        BIC     r0, r0, #&FF00
        MUL     r0, r5, r0 ; BBbbRRrr
        Push    "r5, r11" ; Free up some registers for the inner loop
20
        ; Get source entry
        LDR     r2, [r9], #4
        ; Multiply & accumulate
        AND     r3, r2, #&FF0000
        MOV     r2, r2, LSR #8
        MLA     r3, r4, r3, r1 ; GGgg0000
        BIC     r2, r2, #&FF00
        MLA     r2, r4, r2, r0 ; BBbbRRrr
        ; Get final 8 bit RGB value in seperate registers
        MOV     r3, r3, LSR #24 ; green
        MOV     r5, r2, LSR #24 ; blue
        AND     r2, r2, #&FF00 ; red
        MOV     r2, r2, LSR #8
        ; Search for closest colour in dest palette
        SUB     r7, r8, #1 ; Current index
        MOV     r11, #256*256*3 ; Closest error
        MOV     r14, #0 ; Closest index
        Push    "r0, r1, r4" ; Free up more registers!
30
        LDR     r12, [r10, r7, LSL #2]
        AND     r1, r12, #&FF00 ; red
        SUB     r0, r2, r1, LSR #8
        AND     r1, r12, #&FF0000 ; green
        MOV     r4, r0
        SUB     r1, r3, r1, LSR #16
        MUL     r0, r4, r0
        MOV     r4, r1
        SUB     r12, r5, r12, LSR #24 ; blue
        MLA     r0, r4, r1, r0
        MOV     r4, r12
        MLAS    r0, r4, r12, r0
        MOVEQ   r14, r7
        BEQ     %FT35 ; Early-exit if we find an exact match
        CMP     r0, r11
        MOVLT   r14, r7
        MOVLT   r11, r0
        SUBS    r7, r7, #1
        BGE     %BT30
35
        STRB    r14, [r6], #1
        CMP     r9, r10
        Pull    "r0, r1, r4"
        BNE     %BT20
        Pull    "r5, r11"
        LDR     r14, [sp, #7*4] ; Recover src palette size
        ADD     r11, r11, #1 ; Increase dest index
        CMP     r11, r8
        SUB     r9, r9, r14 ; Rewind to point to first entry of src
        BLT     %BT10
        
MakeTable_Done ROUT
        ; Generation complete, now hook it into the list
        ; r6 must point to just beyond end of table!
        LDR     r12, [sp, #12*4] ; recover workspace pointer
        LDR     r4, [sp, #4*4] ; recover entry pointer
        LDR     r0, CachedTables
        STR     r0, [r4, #CachedTable_Next]
        STR     r4, CachedTables
        LDR     r2, CacheSize
        SUB     r3, r6, r4 ; Compute size of cache entry (r6 should be left pointing just beyond end)
        ADD     r2, r2, r3
        STR     r2, CacheSize
        LDR     r2, CacheCount
        ADD     r2, r2, #1
        STR     r2, CacheCount
        EXIT

MakeTable_Grey ROUT
        ; Generate a table using the 'grey' algorithm
        ; We generate a 256*3 entry LUT to map greyscale values to the destination palette
        ; Note using 256*3 so we don't have to worry about dividing by 3
        MOV     r0, sp ; LUT write ptr
        SUB     sp, sp, #256*3
        MOV     r1, #255 ; dest palette index/offset
        ADD     r10, r10, #3 ; Adjust table to point at high byte of dest entries
        MOV     r2, #256 ; best error value
        MOV     r3, #255 ; search index
        MOV     r4, #0 ; best index
10
        LDRB    r11, [r10, r3, LSL #2] ; Get a greyscale byte
        SUBS    r11, r11, r1
        RSBLT   r11, r11, #0
        CMP     r11, r2
        MOVLE   r4, r3
        MOVLES  r2, r11
        BEQ     %FT20
        SUBS    r3, r3, #1
        BGE     %BT10
20
        STRB    r4, [r0, #-1]!
        MOV     r2, #256
        STRB    r4, [r0, #-1]!
        MOV     r3, #255
        STRB    r4, [r0, #-1]!
        MOV     r4, #0
        CMP     r0, sp
        SUB     r1, r1, #1
        BNE     %BT10
        ; LUT generated, now for the main table
        RSB     r4, r5, #256 ; r4 -> src amount
        MOV     r11, #0 ; current dest entry
30
        ; Get destination entry
        ORR     r10, r10, #3
        LDRB    r0, [r10, r11, LSL #2]
        BIC     r10, r10, #3
        ; Multiply by r5
        MUL     r0, r5, r0 ; 0000IIii
        MOV     r0, r0, LSR #8 ; 000000II
        ADD     r0, r0, r0, LSL #1 ; *3
40
        ; Get source entry
        LDR     r2, [r9], #4
        ; Multiply & accumulate
        AND     r3, r2, #&FF0000
        MOV     r2, r2, LSR #8
        MUL     r3, r4, r3 ; GGgg0000
        BIC     r2, r2, #&FF00
        ADD     r3, r0, r3, LSR #24
        MUL     r2, r4, r2 ; BBbbRRrr
        ADD     r3, r3, r2, LSR #24
        AND     r2, r2, #&FF00
        ADD     r3, r3, r2, LSR #8
        ; Grab the palette index and store it
        LDRB    r14, [sp, r3]
        STRB    r14, [r6], #1
        CMP     r9, r10
        BNE     %BT40
        ADD     r11, r11, #1 ; Increase dest index
        CMP     r11, r8
        SUB     r9, r9, r7, LSL #2 ; Rewind to point to first entry of src
        BLT     %BT30
        ADD     sp, sp, #256*3
        B       MakeTable_Done

MakeTable_15bpp ROUT
        ; Use ColourTrans to generate a 32K entry table, and use that for our
        ; lookups.
        ;
        ; Note we could use InverseTable_SpriteTable here, except that:
        ;
        ; (a) that would require us to cache the 32K table ourselves (hassle!)
        ; (b) we know that InverseTable just calls through to ColourTrans anyway
        ; (c) InverseTable_SpriteTable might not be available if we've been
        ;     softloaded
        ;
        ; So it's better to just cut out the middleman and call ColourTrans
        ; directly
        ;
        ; Also note that we're choosing 15bpp here (as opposed to 16bpp) as we
        ; also know ColourTrans has a builtin 15bpp table for the default 8bpp
        ; palette, so in most cases there shouldn't be any delay in fetching
        ; the table.
        Push    "r5"
        LDR     r0, =(SpriteType_New16bpp<<27) + 1 ; 32K colour source
        MOV     r1, #-1 ; Default palette (i.e. none)
        LDR     r2, =(SpriteType_New8bpp<<27) + 1 ; 8bpp dest
        MOV     r3, r10 ; Dest palette
        MOV     r4, r6 ; Should be a large enough buffer
        MOV     r5, #0
        SWI     XColourTrans_SelectTable
        Pull    "r5"
        BVS     MakeTable_Full ; Give up and use the full algorithm.
        ; Make sure we were returned a 32K table
        LDMIA   r4, {r0-r2}
        LDR     r3, magicword
        TEQ     r0, r3
        TEQEQ   r2, r3
        BNE     MakeTable_Full ; Don't understand table, give up
        ; Great, we have a lookup table. Now just blend everything to 15bpp
        RSB     r4, r5, #256 ; r4 -> src amount
        MOV     r11, #0 ; current dest entry
        MOV     r14, r1 ; table pointer
10
        ; Get destination entry
        LDR     r0, [r10, r11, LSL #2]
        ; Multiply by r5
        AND     r1, r0, #&FF0000
        MOV     r0, r0, LSR #8
        MUL     r1, r5, r1 ; GGgg0000
        BIC     r0, r0, #&FF00
        MUL     r0, r5, r0 ; BBbbRRrr
20
        ; Get source entry
        LDR     r2, [r9], #4
        ; Multiply & accumulate
        AND     r3, r2, #&FF0000
        MOV     r2, r2, LSR #8
        MLA     r3, r4, r3, r1 ; GGgg0000
        BIC     r2, r2, #&FF00
        MLA     r2, r4, r2, r0 ; BBbbRRrr
        ; Get final 15bpp RGB value
        AND     r3, r3, #&F8000000 ; GGGGG000 00000000 00000000 00000000
        AND     r7, r2, #&F8000000 ; BBBBB000 00000000 00000000 00000000
        ORR     r3, r7, r3, LSR #5 ; BBBBBGGG GG000000 00000000 00000000
        AND     r2, r2, #&0000F800 ; 00000000 00000000 RRRRR000 00000000
        ORR     r3, r3, r2, LSL #6 ; BBBBBGGG GGRRRRR0 00000000 00000000
        ; Get entry in dest palette
        LDRB    r3, [r14, r3, LSR #17]
        CMP     r9, r10
        STRB    r3, [r6], #1
        BNE     %BT20
        LDR     r2, [sp, #7*4] ; Recover src palette size
        ADD     r11, r11, #1 ; Increase dest index
        CMP     r11, r8
        SUB     r9, r9, r2 ; Rewind to point to first entry of src
        BLT     %BT10
        B       MakeTable_Done

Memcpy ROUT
;  in: r2 = bytes (multiple of 4)
;      r6 = dest
;      r9 = src
        Entry   "r0-r9"
        TST     r2, #4
        LDRNE   r0, [r9], #4
        SUBNE   r2, r2, #4
        STRNE   r0, [r6], #7
        TST     r2, #8
        LDMNEIA r9!, {r0,r1}
        SUBNE   r2, r2, #8
        STMNEIA r6!, {r0,r1}
        TST     r2, #16
        LDMNEIA r9!, {r0,r1,r3,r4}
        SUBNE   r2, r2, #16
        STMNEIA r6!, {r0,r1,r3,r4}
        CMP     r2, #0
        EXIT    EQ
10
        LDMIA   r9!, {r0,r1,r3,r4,r5,r7,r8,lr}
        SUBS    r2, r2, #32
        STMIA   r6!, {r0,r1,r3,r4,r5,r7,r8,lr}
        BNE     %BT10
        EXIT

FlushCache ROUT
;  in: r3 = amount of memory needed
;
; Free unlocked cache entries until we have enough memory available, and at
; least 1 free slot
;
; This is a bit of a nasty routine. To try and make the cache somewhat fair we
; want to free the oldest entries. But it's a singly-linked list and new entries
; are inserted at the front, so we have to walk the entire list to find entries
; to free.
        Entry   "r0-r2"
10
        ADR     r0, CachedTables
        MOV     r1, #0 ; Candidate
20
        ASSERT  CachedTable_Next = 0
        LDR     r2, [r0]
        CMP     r2, #0
        BEQ     %FT30
        LDR     lr, [r2, #CachedTable_LockCount]
        CMP     lr, #0
        MOVEQ   r1, r0
        MOV     r0, r2
        B       %BT20
30
        MOVS    r0, r1
        EXIT    EQ
        BL      Cache_FreeEntry
        ; Now check limits
        LDR     r0, CacheSize
        LDR     r1, CacheCount
        ADD     r0, r0, r3
        CMP     r0, #CacheSizeLimit
        CMPLT   r1, #CacheCountLimit-1
        BGT     %BT10
        EXIT        

magicword = "32K."        

        LTORG

        [ standalone :LAND: HaveMessages
ResourceFSFiles
        ResourceFile    $MergedMsgs, Resources.BlendTable.Messages
        DCD     0
        ]

        END
