/*
 * Copyright (c) 2013, RISC OS Open Ltd
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
#ifndef rtclock_h
#define rtclock_h

#define FALSE       0
#define TRUE        (!FALSE)
#define UNUSED(k)   (k)=(k)
#define MAX(a,b)    ((a)>(b)?(a):(b))
#define MIN(a,b)    ((a)<(b)?(a):(b))

#define TIMER_0     0

#define ERR_NOCLOCK 0
#define ERR_HALERR  1
#define ERR_INVALID 2
#define ERR_HIPRI   3
#define ERR_OFLO    4

#ifdef DEBUG
#define DPRINTF(k)  printf k
#else
#define DPRINTF(k)  /* Nothing */
#endif

#define MY_ADJ_DURATION   (3600 * 100)
#define MY_MIN_DURATION   (60 * 100)
#define MY_SLEW_PER_THOU  20uLL /* Per thousand */
#define MY_ADJ_PRIORITY   RTCPriority_BuiltInAdjust

#define BCD8_TO_UINT8(k)  ((((k)>>4) * 10) + ((k) & 15))
#define UINT8_TO_BCD8(k)  ((((k) / 10)<<4) | ((k) % 10))

typedef union
{
	uint64_t dword;
	struct
	{
		uint32_t lo;
		uint32_t hi;
	} word;
} u32p32_t;

#endif
