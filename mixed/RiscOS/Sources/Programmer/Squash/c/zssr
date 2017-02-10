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
/* -> c.zssr
 *
 * LZW decompressor, optimised for 12 bits.
 * Contains state to make it restartable
 * Author: Jon Thackray
 * Copyright (C) 1990 Jon Thackray
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"

#include "debug.h"
#include "zssr.h"

typedef enum {
        input_not_started,
        first_input,
        main_input,
        clear_table,
        output_exhausted_stack,
        output_exhausted_start
} input_call_position;

static short *prefixes;    /* The preceding code of a code */
static char *suffixes;     /* The final character of a code */

static char *buf;
static int offset = 0;
static int buf_size = 0;
static int free_entry = FIRST; /* First free code */
static int maxcode;
static int codemask = ((1 << INIT_BITS) - 1);
static unsigned int in_count;

static void
update_the_state
(
        input_call_position where,
        int code_size,
        int final_char,
        int previous_code,
        int in_code,
        unsigned int stack_offset,
        zcat_state *the_state
)
{
        the_state->starting = 0;
        the_state->input_caller = where;
        the_state->offset = offset;
        the_state->code_size = code_size;
        the_state->free_entry = free_entry;
        the_state->in_count = in_count;
        the_state->codemask = codemask;
        the_state->maxcode = maxcode;
        the_state->final_char = final_char;
        the_state->previous_code = previous_code;
        the_state->in_code = in_code;
        the_state->stack_offset = stack_offset;
        the_state->buf_size = buf_size;
        memcpy( the_state->buf, buf, code_size );
}

static int
input_code_from_store
(
        unsigned int *code_size,
        char **input,
        unsigned int* input_length,
        int clear_flag,
        int allow_continuation
)
/*
 * Get the next code from the store input stream.
 * Interruptible.
 * Returns -1 on either input exhausted,
 * or insufficient input for next buffer if continuation allowed.
 */
{
        char    *bp;
        int     code,
                bits = *code_size,
                i = 0;

        if ( clear_flag || offset >= buf_size || free_entry > maxcode )
        {
                if ( allow_continuation )
                {
                        if ( ((free_entry > maxcode) ? bits+1 : (clear_flag) ? INIT_BITS : bits) > *input_length )
                                return -1; /* So we only test on EOF returns */
                }

                if ( free_entry > maxcode )
                {
                        *code_size = ++bits;
                        maxcode = (bits == BITS) ? 1 << BITS : (1 << bits) - 1;
                        codemask = (1 << bits) - 1;
                }

                /* Size of codes about to change */
                if ( clear_flag )
                {
                        /* Table reset */
                        *code_size = INIT_BITS;
                        codemask = (1 << INIT_BITS) - 1;
                        bits = INIT_BITS;
                }

                if ( !*input_length )
                        return -1;              /* EOF */

                buf = *input;
                buf_size = (*input_length >= bits) ? bits : (int)*input_length;
                *input += buf_size;
                *input_length -= buf_size;
                in_count += buf_size;
                offset = 0;
                buf_size = (buf_size << 3) - (bits - 1);
                /* Ignore bits on end of buffer if any */
        }

        bp = buf + (offset >> 3);               /* The first byte with some information available */
        code = *(bp++);                         /* Get the leading bits */
        bits -= 8 - (offset & 7);

        while ( bits > 0 )
        {
                code += *(bp++) << (8*++i);
                bits -= 8;
        }

        code >>= (offset & 7);
        offset += *code_size;
        return code & codemask;
}

static void
clear_tables( void )
{
        unsigned int i;

        for ( i = 0; i <= 255; i++ )
        {
                prefixes[i] = 0;
                suffixes[i] = (char)i;
        }

        maxcode = (1 << INIT_BITS) -1;
}

unsigned int
zcat_store_store
(
        char *input,
        char *output,
        unsigned int *input_length,
        unsigned int output_length,
        int allow_input_continuation,
        zcat_state *workspace,
        zcat_result *result
)
{
/*
 * Does the actual decompression.
 */
        int     final_char = 0,
                in_code = 0,
                code,
                previous_code = 0;
        unsigned int    code_size = INIT_BITS;
        unsigned int    length = 0,
                        my_input_length = *input_length;
        char    *stack = workspace->stack;
        char    *stackp = stack;

        *result = zcat_ok;
        prefixes = workspace->prefixes;
        suffixes = workspace->suffixes;

        if ( workspace->starting )
        {

input_not_started_label:

                if ( my_input_length < 3 )
                {
                        if ( allow_input_continuation )
                        {
                                update_the_state( input_not_started, code_size, final_char,
                                                        previous_code, in_code, 0, workspace );
                                *result = zcat_input_failed;
                        }
                        else
                        {
                                *result = zcat_input_corrupt;
                        }

                        *input_length = my_input_length;
                        return length; /* EOF already! */
                }

                if ( output_length < 1 )
                {
                        update_the_state( input_not_started, code_size, final_char,
                                                previous_code, in_code, 0, workspace );
                        *result = zcat_failed;
                        *input_length = my_input_length;
                        return length;
                }

                /* Now get header */
                if ( input[2] != (0x80 | BITS) )
                {
                        *result = zcat_input_corrupt;
                        return 0;
                }

                /* Ignore header now */
                input += 3;
                my_input_length -= 3;
                buf = input;
                clear_tables();
                in_count = 3;
                offset = 0;
                free_entry = FIRST; /* First free code */
                buf_size = 0;
                codemask = ((1 << INIT_BITS) - 1);
        }
        else
        {
                /* Update everything from the state */
                offset = workspace->offset;
                code_size = workspace->code_size;
                free_entry = workspace->free_entry;
                in_count = workspace->in_count;
                codemask = workspace->codemask;
                maxcode = workspace->maxcode;
                final_char = workspace->final_char;
                previous_code = workspace->previous_code;
                in_code = workspace->in_code;
                workspace->buf_size = buf_size;
                stackp = stack + workspace->stack_offset;
                buf = workspace->buf;

                switch ( workspace->input_caller )
                {
                        case input_not_started:
                                goto input_not_started_label;
                        case first_input:
                                goto first_input_label;
                        case main_input:
                                goto main_input_label;
                        case clear_table:
                                goto clear_table_label;
                        case output_exhausted_start:
                                goto output_exhausted_start_label;
                        case output_exhausted_stack:
                                goto output_exhausted_stack_label;
                        default:
                                *result = zcat_ws_corrupt;
                                return 0;
                }
        }

first_input_label:

        final_char = previous_code = input_code_from_store( &code_size, &input,
                                                &my_input_length, 0, allow_input_continuation );

        if ( final_char < 0 )
        {
                if ( allow_input_continuation )
                {
                        update_the_state( first_input, code_size, final_char,
                                                previous_code, in_code, 0, workspace );
                }

                *result = zcat_input_failed;
                *input_length = my_input_length;
                return length;                          /* EOF already! */
        }

output_exhausted_start_label:

        if ( output_length-- )
        {
                *(output++) = final_char;
                length++;
        }
        else
        {
                update_the_state( output_exhausted_start, code_size, final_char,
                                        previous_code, in_code, 0, workspace );
                *result = zcat_failed;
                *input_length = my_input_length;
                return length;
        }

main_input_label:

        for (;;)
        {
                code = input_code_from_store( &code_size, &input, &my_input_length, 0,
                                                allow_input_continuation );

                if ( code < 0 )
                {
                        if ( allow_input_continuation )
                        {
                                update_the_state( main_input, code_size, final_char, previous_code,
                                                        in_code, 0, workspace );
                                *result = zcat_input_failed;
                        }

                        break;
                }

                if ( code == CLEAR )
                {
                        clear_tables();
                        free_entry = FIRST - 1; /* To allow for a code being made from the CLEAR */

clear_table_label:

                        if ( code = input_code_from_store( &code_size, &input, &my_input_length, 1,
                                                                allow_input_continuation), code < 0 )
                        {
                                if ( allow_input_continuation )
                                {
                                        update_the_state( clear_table, code_size, final_char, previous_code,
                                                                in_code, 0, workspace );
                                        *result = zcat_input_failed;
                                }

                                break;          /* Unexpected death? */
                        }
                }

                in_code = code;         /* To remember it for later */

                /* Now the wacky case aaaaaa */
                if ( code >= free_entry )
                {
                        /* Either this is an input error, or the one code we don't yet know */

                        if ( code == free_entry )
                        {
                                *(stackp++) = final_char;
                                code = previous_code;
                        }
                        else
                        {
                                *result = zcat_input_corrupt;
                                return 0;
                        }
                }

                /* Now stack up the current code, for output in the opposite order */

                while ( code >= 256 )
                {
                        *(stackp++) = suffixes[code];
                        code = prefixes[code];
                }

                *(stackp++) = final_char = code;

                /* Now output them */

output_exhausted_stack_label:

                do
                {
                        if ( output_length-- )
                        {
                                *(output++) = *--stackp;
                                length++;
                        }
                        else
                        {
                                update_the_state( output_exhausted_stack, code_size, final_char,
                                                        previous_code, in_code, stackp - stack, workspace );
                                *result = zcat_failed;
                                *input_length = my_input_length;
                                return length;
                        }
                } while (stackp > stack);

                /* Now put the new entry in the table */

                if ( code = free_entry, code < 1 << BITS )
                {
                        prefixes[code] = previous_code;
                        suffixes[code] = final_char;
                        free_entry = code + 1;
                }

                /* Remember last code read */
                previous_code = in_code;

        } /* Loop */

        *input_length = my_input_length;
        return length;
}

/* End zssr.c */
