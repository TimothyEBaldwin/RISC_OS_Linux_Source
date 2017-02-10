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
#ifndef INTERFACE_RTCDEVICE_H
#define INTERFACE_RTCDEVICE_H

#include <stdint.h>
#include "Global/HALDevice.h"

/* RTC time structure */
struct rtctime
{
	uint8_t  Centiseconds;
	uint8_t  Seconds;
	uint8_t  Minutes;
	uint8_t  Hours;
	uint8_t  DayOfMonth;
	uint8_t  Month;
	uint8_t  YearLO;
	uint8_t  YearHI;
};

/* RTC HAL device structure */
typedef struct rtcdevice
{
	struct device dev;
	uint8_t       timeformat;
#define RTCTimeFormat_BCD                0
	uint8_t       formatflags;
#define RTCFormatFlags_BCD_1BasedDay     1
#define RTCFormatFlags_BCD_1BasedMonth   2
#define RTCFormatFlags_BCD_NeedsYearHelp 4
#define RTCFormatFlags_BCD_YearLOIsGood  8
#define RTCFormatFlags_BCD_YearFlags     (4+8)
	uint8_t       padding[2];
	int         (*readtime)(struct rtcdevice *, struct rtctime *);
	int         (*writetime)(struct rtcdevice *, const struct rtctime *);
} rtcdevice_t;

/* Return codes from readtime() and writetime() */
#define RTCRetCode_OK                    0
#define RTCRetCode_Error                -1 
#define RTCRetCode_InvalidTime          -2

#endif
