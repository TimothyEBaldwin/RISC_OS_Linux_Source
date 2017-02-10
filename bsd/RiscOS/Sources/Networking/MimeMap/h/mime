/*
 * Copyright (c) 2014, RISC OS Open Ltd
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met: 
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of RISC OS Open Ltd nor the names of its contributors
 *       may be used to endorse or promote products derived from this software
 *       without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
#ifndef mime_h
#define mime_h

#define FALSE       0
#define TRUE        (!FALSE)
#define UNUSED(k)   (k)=(k)

#define MAX_LINE    256
#define MAX_EXTS    16 /* More than MAX_EXTS extensions for one type needs a new line */

void *Resources(void); /* From ResGen */

typedef enum
{
	MAPPING_HAS_NO_CHECKS      = 0,
	MAPPING_HAS_VALID_RISCOS   = (1 << 0), /* Has a vaild RISC OS file type */
	MAPPING_HAS_VALID_MIME     = (1 << 1), /* Has a vaild MIME type */
	MAPPING_HAS_VALID_DOT_EXTN = (1 << 2)  /* Has a valid dot extension */
} mimeflag_t;

#define MAPPING_FILETYPE_WILDCARDED     -1
#define MAPPING_FILETYPE_INVALID        -2
#define MAPPING_FILE                    "<Inet$MimeMappings>"

#define ErrorBase_ANTMimeMap    0xB00000
#define ERR_BAD_FILE            0
#define ERR_BAD_REASON          1
#define ERR_LOOKUP_FAILED       2
#define ERR_NO_MEM              3 /* "Out of memory" */
#define ERR_BAD_FILE_CANON      4 /* "Bad filename (could not canonicalise)" */

typedef struct mimeentry
{
	char    *major;
	char    *minor;
	uint32_t filetype;
	size_t   num_exts;
	char   **exts;
	struct mimeentry *next;
} mimeentry_t;

#endif
