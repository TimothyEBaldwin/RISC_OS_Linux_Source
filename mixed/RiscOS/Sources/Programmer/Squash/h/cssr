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
/* -> h.cssr
 *
 * LZW compressor, optimised for 12 bits.
 * Compress store store restartable
 * Contains state to make it restartable
 * Author: Jon Thackray
 * Copyright (C) 1990 Jon Thackray
 */

#ifndef cssr_h
#define cssr_h

#include "defs.h"

typedef struct {
        int     starting:1,             /* A flag to say if we've just started */
                output_caller:3;        /* Where output_code was called from */
        int     offset;                 /* The bit position in the output mini buffer */
        char    buf[BITS + 1];          /* The output buffer */
        /* State for the compress itself */
        int     code_size;              /* The number of bits per code at present */
        int     free_entry;             /* The next code number to be generated */
        int     in_count,               /* Amount of input read so far */
                previous,               /* The last char or code */
                current,                /* The current char (never a code) */
                checkpoint,             /* Where to reset next */
                maxcode,                /* The maximum allowable code at present */
                fcode,                  /* The combined code being produced */
                hash;                   /* Its hash value */
        int     hash_table[HASH_RETRY];
        short   code_table[HASH_RETRY];
} compress_state;                       /* The state to be maintained between calls to compress */

extern output_result compress_store_store
(
        char **input,                   /* Updated to show first byte unused */
        unsigned int input_length,
        char *output,
        unsigned int *output_length,    /* Updated to show amount of output used */
        compress_state *workspace,
        int allow_continuation
);

#endif

/* End cssr.h */
