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
/* -> c.cssr
 *
 * LZW compressor, optimised for 12 bits.
 * Compess store store restartable
 * Contains state to make it restartable
 * Author: Jon Thackray
 * Copyright (C) 1990 Jon Thackray
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"

#include "debug.h"
#include "cssr.h"

typedef enum {
        normal,
        output_not_started,
        output_clear,
        output_last_code,
        output_terminate,
        output_input_empty,
        output_input_exhausted
} output_call_position;

static int *hash_table;
static short *code_table;
static char *buf;
static int offset = 0;
static int free_entry = FIRST; /* First free code */
static int maxcode;

static void
update_the_state
(
        compress_state *the_state,
        output_call_position where,
        int code_size,
        int in_count,
        int previous,
        int current,
        int checkpoint,
        int fcode,
        int hash
)
{
        the_state->starting = 0;
        the_state->output_caller = where;
        the_state->offset = offset;
        the_state->code_size = code_size;
        the_state->free_entry = free_entry;
        the_state->in_count = in_count;
        the_state->previous = previous;
        the_state->current = current;
        the_state->checkpoint = checkpoint;
        the_state->fcode = fcode;
        the_state->hash = hash;
        the_state->maxcode = maxcode;
}

static output_result
output_code
(
        int code,
        unsigned int *code_size,
        char **output,
        unsigned int* output_length,
        unsigned int max_output,
        int clear_flag
)
{
        char *bp = buf + (offset >> 3);

        if ( code < 0 )
        {
                /* Last byte */

                if ( offset )
                {
                        /* Clear buffer */

                        if ( *output_length + ((offset + 7) >> 3) > max_output )
                                return output_failed;

                        offset = (offset + 7) >> 3;
                        memcpy( *output, buf, offset );
                        *output_length += offset;
                        *output += offset;
                }

                return output_ok;
        }

        if ( offset & 7 )
        {
                *(bp++) |= code << (offset & 7);
                code >>= 8 - (offset & 7);
        }

        memcpy( bp, &code, (*code_size + 7) >> 3 );
        offset += *code_size;

        if ( offset == *code_size << 3 )
        {
                /* Got a byte boundary worth */

                if ( *output_length + *code_size > max_output )
                {
                        offset -= *code_size;
                        return output_failed;
                }

                memcpy( *output, buf, *code_size );
                *output_length += *code_size;
                *output += *code_size;
                offset = 0;
        }

/*
 * Now check to see if the code just generated will overflow
 * the allowed size when it's output.
 */
        if ( free_entry > maxcode || clear_flag )
        {
                if ( offset )
                {
                        /* Clear buffer */
                        int i;

                        if ( *output_length + *code_size > max_output )
                        {
                                offset -= *code_size;
                                return output_failed;
                        }

                        for ( i = (offset + 7) >> 3; i < *code_size; i++ )
                                buf[i] = 0x0;

                        /* Avoid non-determinism in output */
                        memcpy( *output, buf, *code_size );
                        *output_length += *code_size;
                        *output += *code_size;
                        offset = 0;
                }

                if ( clear_flag )
                        *code_size = INIT_BITS;
                else
                        (*code_size)++;

                maxcode = (*code_size == BITS) ? (1 << BITS)  : (1 << *code_size) - 1;
        }

        return output_ok;
}

static void
clear_tables( void )
{
        unsigned int i = 0;

        while ( i < HASH_RETRY )
                hash_table[i++] = -1;
        free_entry = FIRST;
}

output_result
compress_store_store
(
        char **input,
        unsigned int input_length,
        char *output,
        unsigned int *output_length,
        compress_state *workspace,
        int allow_continuation
)
{
/*
 * Does the actual compression.
 */
        int     previous,
                in_count = 0,
                current = 0,
                checkpoint = CHECK_GAP,
                fcode = 0,
                hash = 0;
        unsigned int    code_size = INIT_BITS;
        unsigned int    length = 0,
                        my_input_length = input_length;

        hash_table = workspace->hash_table;
        code_table = workspace->code_table;
        buf = workspace->buf;

        if ( workspace->starting )
        {

output_not_started_label:
output_input_empty_label:

                if ( my_input_length == 0 )
                {
                        *output_length = 0;

                        if ( allow_continuation )
                        {
                                update_the_state( workspace, output_input_empty, 0, in_count, 0, 0, 0, 0, 0 );

                                /* Nothing set yet! */
                                return output_input_failed;
                        }

                        return output_ok;
                }

                if ( *output_length < 3 )
                {
                        update_the_state( workspace, output_not_started, 0, in_count, 0, 0, 0, 0, 0 );

                        /* Nothing set yet! */
                        *output_length = 0;
                        return output_failed;
                }

                clear_tables();
                offset = 0;
                in_count = 0;
                *((output)++) = 0x1f;
                *((output)++) = 0x9d;
                *((output)++) = 0x80 | BITS;
                length = 3;
                previous = *((*input)++);
                my_input_length--;
                in_count = 1;
                workspace->starting = 0;
                maxcode = (1 << INIT_BITS) - 1;
        }
        else
        {
                offset = workspace->offset;
                code_size = workspace->code_size;
                free_entry = workspace->free_entry;
                in_count = workspace->in_count;
                previous = workspace->previous;
                current = workspace->current;
                checkpoint = workspace->checkpoint;
                maxcode = workspace->maxcode;
                fcode = workspace->fcode;
                hash = workspace->hash;

                switch ( workspace->output_caller )
                {
                        case normal:
                                goto normal_label;
                        case output_not_started:
                                goto output_not_started_label;
                        case output_clear:
                                goto output_clear_label;
                        case output_last_code:
                                goto output_last_code_label;
                        case output_terminate:
                                goto output_terminate_label;
                        case output_input_empty:
                                goto output_input_empty_label;
                        case output_input_exhausted:
                                goto output_input_exhausted_label;
                        default:
                                return output_ws_corrupt;
                }
        }

output_input_exhausted_label:

        while ( my_input_length-- )
        {
                current = *((*input)++);
                in_count++;
                fcode = (current << BITS) + previous;
                hash = (current << (BITS-8)) ^ previous;

                if ( hash_table[hash] == fcode )
                {
                        previous = code_table[hash];
                        continue;
                }

                if ( hash_table[hash] >= 0 )
                {
                        int displacement = (hash) ? HASH_RETRY - hash : 1;

                        for (;;)
                        {
                                hash -= displacement;

                                if ( hash < 0 )
                                        hash += HASH_RETRY;

                                if ( hash_table[hash] < 0 || hash_table[hash] == fcode )
                                        break;
                        }

                        if ( hash_table[hash] == fcode )
                        {
                                previous = code_table[hash];
                                continue;
                        }
                }

normal_label:

                if ( output_code( previous, &code_size, &output, &length, *output_length, 0 ) )
                {
                        update_the_state( workspace, normal, code_size, in_count, previous, current,
                                                checkpoint, fcode, hash );
                        *output_length = length;
                        return output_failed;
                }

                previous = current;

                /* Check here for table full */
                if ( free_entry < 1 << BITS )
                {
                        code_table[hash] = free_entry++;
                        hash_table[hash] = fcode;
                }
                else
                        if (in_count >= checkpoint)
                        {
                                clear_tables();

output_clear_label:

                                if ( output_code( CLEAR, &code_size, &output, &length, *output_length, 1 ) )
                                {
                                        update_the_state( workspace, output_clear, code_size, in_count, previous,
                                                                current, checkpoint, fcode, hash );
                                        *output_length = length;
                                        return output_failed;
                                }

                                checkpoint = in_count + CHECK_GAP;
                        }
        } /* while */

        if ( allow_continuation )
        {
                update_the_state( workspace, output_input_exhausted, code_size, in_count,
                                        previous, current, checkpoint, fcode, hash );
                *output_length = length;
                return output_input_failed;
        }

output_last_code_label:

        if ( output_code( previous, &code_size, &output, &length, *output_length, 0 ) )
        {
                update_the_state( workspace, output_last_code, code_size, in_count, previous,
                                        current, checkpoint, fcode, hash );
                *output_length = length;
                return output_failed;
        }

output_terminate_label:

        if ( output_code( -1, &code_size, &output, &length, *output_length, 0 ) )
        {
                update_the_state( workspace, output_terminate, code_size, in_count, previous,
                                        current, checkpoint, fcode, hash );
                *output_length = length;
                return output_failed;
        }

        *output_length = length;
        return output_ok;
}

/* End cssr.c */
