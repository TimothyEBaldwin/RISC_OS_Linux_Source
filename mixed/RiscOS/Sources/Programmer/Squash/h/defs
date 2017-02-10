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
/* -> h.defs
 *
 * LZW compressor, optimised for 12 bits.
 * Compess store store restartable
 * Contains state to make it restartable
 * Author: Jon Thackray
 * Copyright (C) 1990 Jon Thackray
 */

#ifndef defs_h
#define defs_h

#define INIT_BITS       9
#define BITS            12
#define HSIZE           (1 << BITS)
#define HASH_RETRY      5003
#define CHECK_GAP       32768
#define FIRST           257
#define CLEAR           256

typedef enum {
        output_ok,
        output_input_failed,
        output_failed,
        output_ws_corrupt
} output_result;

typedef enum {
        zcat_ok,
        zcat_input_failed,
        zcat_failed,
        zcat_input_corrupt,
        zcat_ws_corrupt
} zcat_result;

#endif

/* End defs.h */
