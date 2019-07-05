/*
 * Copyright (c) 2014, RISC OS Open Ltd
 * All rights reserved.
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

#ifndef CLASSIFY_H
#define CLASSIFY_H

#include <stdint.h>
#include <stdbool.h>

#include "shared.h"

/* decgen bits */

#define RETURNTYPE int
#define PARAMDECL uint32_t opcode
#define PARAMS opcode
#define PARAMSCOMMA ,
#define OPCODE opcode

extern RETURNTYPE classify(PARAMDECL);

/* Helper macros */

#define COMMON_sz_nonstandard(base) \
	(void) OPCODE; \
	int class = base; \
	if(nonstandard) \
		return CLASS_NOT_VFP; \
	if(sz) \
		class |= CLASS_D; \
	else \
		class |= CLASS_S;

#define COMMON_nonstandard(base) \
	(void) OPCODE; \
	int class = base; \
	if(nonstandard) \
		return CLASS_NOT_VFP; \

#define D32_CHECK(sz,high) if((sz) && (high)) class |= CLASS_D32;

#define _UNPREDICTABLE(cond) if(cond) return CLASS_NOT_VFP;

/* Which registers are valid for reading/writing (in privileged modes) */

#define VMRS_MASK ((1<<REG_FPSID)+(1<<REG_FPSCR)+(1<<REG_MVFR1)+(1<<REG_MVFR0)+(1<<REG_FPEXC)+(1<<REG_FPINST)+(1<<REG_FPINST2))
#define VMSR_MASK ((1<<REG_FPSCR)+(1<<REG_FPEXC)+(1<<REG_FPINST)+(1<<REG_FPINST2))

static inline bool privileged_mode(void)
{
	int value;
	__asm
	{
		LDR	value,[sl,#UserPSR]
	}
	return (value & 0xf);
} 

#endif
