/* 
 * Copyright (c) 1990, Jon Thackray
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the copyright holder nor the names of their
 *       contributors may be used to endorse or promote products derived from
 *       this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/* -> h.zssr
 *
 * LZW decompressor, optimised for 12 bits.
 * Decompress store store restartable
 * Contains state to make it restartable
 * Author: Jon Thackray
 * Copyright (C) 1990 Jon Thackray
 */

#ifndef zssr_h
#define zssr_h

#include "defs.h"

typedef struct {
        int     starting:1,             /* A flag to say if we've just started */
                input_caller:3;         /* Where input_code was called from */
        int     offset;                 /* The bit position in the output mini buffer */
        /* State for the decompress itself */
        int     code_size;              /* The number of bits per code at present */
        int     free_entry;             /* The next code number to be generated */
        int     codemask,               /* The input mask */
                maxcode,                /* The maximum allowable code at present */
                final_char,             /* The character at the end of a code */
                in_code,                /* The code input */
                previous_code;          /* The prefix portion of the current code */
        unsigned int in_count,          /* The amount of input read so far */
                buf_size,               /* Amount still in buffer */
                stack_offset;           /* Offset within decode stack */
        char    buf[BITS + 1];          /* The partial input buffer */
        short   prefixes[HSIZE];        /* The preceding code of a code */
        char    suffixes[HSIZE];        /* The final character of a code */
        char    stack[HSIZE];           /* The order reversal stack */
} zcat_state;

extern unsigned int zcat_store_store
(
        char *input,
        char *output,
        unsigned int *input_length,
        unsigned int output_length,
        int allow_input_continuation,
        zcat_state *workspace,
        zcat_result *result
);

#endif

/* End zssr.h */
