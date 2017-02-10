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
#include <stdio.h>
#include <stdlib.h>
#include "swis.h"

#include "Global/RISCOS.h"
#include "Global/HALEntries.h"
#include "Global/Services.h"
#include "Global/OsWords.h"
#include "Global/OsBytes.h"
#include "Global/NewErrors.h"
#include "Global/CMOS.h"
#include "Interface/RTCDevice.h"
#include "Interface/RTC.h"
#include "AsmUtils/irqs.h"

#include "RTCHdr.h"
#include "rtclock.h"

static rtcdevice_t *device;
static uint32_t     upper_period, lower_period, default_t0_period;
static uint32_t     last_monotonic, last_priority, last_duration, last_t0_period;
static uint32_t     pending_adjusts = 0;
static int32_t      last_adjust;

static _kernel_oserror *rtclock_error(uint32_t which)
{
	_kernel_oserror *err;
	struct
	{
		uint32_t errnum;
		char     token[8];
	} msg_errblk;
	uint32_t msg_struct[4];

	/* Translate via MessageTrans' internal buffer */
	err = _swix(MessageTrans_OpenFile, _INR(0,2),
	            msg_struct, Module_MessagesFile, 0);
	if (err != NULL) return err;
	sprintf(msg_errblk.token, "E%02x", which);
	msg_errblk.errnum = which + ErrorBase_RTC;
	err = _swix(MessageTrans_ErrorLookup, _INR(0,7),
	            &msg_errblk, msg_struct, 0, 0, 0, 0, 0, 0);
	_swix(MessageTrans_CloseFile, _IN(0), msg_struct);

	return err;
}

static void rtclock_set_period(uint32_t p)
{
	_swix(OS_Hardware, _INR(0,1) | _INR(8,9),
	                   TIMER_0, p, OSHW_CallHAL, EntryNo_HAL_TimerSetPeriod);
	last_t0_period = p;
}

static void rtclock_set_default(void)
{
	rtclock_set_period(default_t0_period);
	_swix(OS_ReadMonotonicTime, _OUT(0), &last_monotonic);
	last_adjust = 0;
}

/* SWI RTC_Read
 * => R0 = rtctime structure pointer
 * <= R0 = error and V set, else structure updated
 */
static _kernel_oserror *rtclock_read(_kernel_swi_regs *r)
{
	struct rtctime *time = (struct rtctime *)r->r[0];
	int32_t  rc;
	uint32_t temp;
	uint32_t cmosylo, cmosyhi;
	uint8_t  flags;

	rc = device->readtime(device, time);
	if (rc == RTCRetCode_Error)
	{
		return rtclock_error(ERR_HALERR);
	}
	if (rc == RTCRetCode_InvalidTime)
	{
		return rtclock_error(ERR_INVALID);
	}

	/* Adjustments for flags */
	flags = device->formatflags;
	if ((flags & RTCFormatFlags_BCD_1BasedDay) == 0)
	{
		/* Adjust to be 1 based */
		temp = BCD8_TO_UINT8(time->DayOfMonth);
		temp++;
		time->DayOfMonth = UINT8_TO_BCD8(temp);
	}
	if ((flags & RTCFormatFlags_BCD_1BasedMonth) == 0)
	{
		/* Adjust to be 1 based */
		temp = BCD8_TO_UINT8(time->Month);
		temp++;
		time->Month = UINT8_TO_BCD8(temp);
	}

	/* Adjustments for year (or lack of) */
	_swix(OS_Byte, _INR(0,1) | _OUT(2), OsByte_ReadCMOS,
	      YearCMOS + 1, &cmosyhi);
	_swix(OS_Byte, _INR(0,1) | _OUT(2), OsByte_ReadCMOS,
	      YearCMOS + 0, &cmosylo);
	if (flags & RTCFormatFlags_BCD_NeedsYearHelp)
	{
		uint32_t year, century;
		uint32_t mask, wrap;
		int32_t  diff;

		year = cmosylo;
		century = cmosyhi;
		mask = (flags & RTCFormatFlags_BCD_YearLOIsGood) ? 0xFF : 0x3;
		wrap = (flags & RTCFormatFlags_BCD_YearLOIsGood) ? 100 : 4;
		diff = BCD8_TO_UINT8(time->YearLO) - (cmosylo & mask);
		if (diff != 0)
		{
			/* Year changed, check for carry into century */
			year = diff + cmosylo;
			if (diff < 0)
			{
				year = year + wrap;
			}
			if (year > 99)
			{
				year = year - 100;
				century++;
			}
		}
		time->YearHI = UINT8_TO_BCD8(century);
		time->YearLO = UINT8_TO_BCD8(year);
	}

	/* See if the CMOS copy of year needs updating */
	temp = BCD8_TO_UINT8(time->YearHI);
	if (cmosyhi != temp) _swix(OS_Byte, _INR(0,2), OsByte_WriteCMOS,
	                           YearCMOS + 1, temp);
	temp = BCD8_TO_UINT8(time->YearLO);
	if (cmosylo != temp) _swix(OS_Byte, _INR(0,2), OsByte_WriteCMOS,
	                           YearCMOS + 0, temp);

	return NULL;
}

/* SWI RTC_Write
 * => R0 = rtctime structure pointer
 * <= R0 = error and V set, else preserved
 */
static _kernel_oserror *rtclock_write(_kernel_swi_regs *r)
{
	struct rtctime time = *(struct rtctime *)r->r[0];
	int32_t  rc;
	uint32_t temp;
	uint8_t  flags = device->formatflags;
	uint32_t year = 0, century = 0;

	if ((time.DayOfMonth != 255) &&
	    ((flags & RTCFormatFlags_BCD_1BasedDay) == 0))
	{
		/* Adjust to be 0 based */
		temp = BCD8_TO_UINT8(time.DayOfMonth);
		temp--;
		time.DayOfMonth = UINT8_TO_BCD8(temp);
	}
	if ((time.Month != 255) &&
	    ((flags & RTCFormatFlags_BCD_1BasedMonth) == 0))
	{
		/* Adjust to be 0 based */
		temp = BCD8_TO_UINT8(time.Month);
		temp--;
		time.Month = UINT8_TO_BCD8(temp);
	}
	if ((time.YearLO != 255) &&
	    (time.YearHI != 255))
	{
		year = BCD8_TO_UINT8(time.YearLO);
		century = BCD8_TO_UINT8(time.YearHI);
		if (flags & RTCFormatFlags_BCD_NeedsYearHelp)
		{
			/* Only pass those bits that the device can store */
			time.YearHI = 0;
			if ((flags & RTCFormatFlags_BCD_YearLOIsGood) == 0)
			{
				time.YearLO = year & 0x3;
			}
		}
	}

	rc = device->writetime(device, &time);
	if (rc == RTCRetCode_Error)
	{
		return rtclock_error(ERR_HALERR);
	}

	if (year || century)
	{
		/* Write through to CMOS */
		_swix(OS_Byte, _INR(0,2), OsByte_WriteCMOS,
		      YearCMOS + 0, year);
		_swix(OS_Byte, _INR(0,2), OsByte_WriteCMOS,
		      YearCMOS + 1, century);
	}

	/* A manual set stops any in progress adjust */
	rtclock_set_default();
	DPRINTF(("Manual set\n"));

	return NULL;
}

/* SWI RTC_Adjust
 * => R0,R1 = signed time error in cs
 *    R2 = duration (in cs) over which to spread the error
 *    R3 = priority
 * <= R0 = error and V set, else preserved
 */
static _kernel_oserror *rtclock_adjust(_kernel_swi_regs *r)
{
	int64_t  correction, elapsed;
	u32p32_t term1, term2;
	uint64_t lo, hi, product;
	uint32_t now, period;
	_kernel_oserror *err;

	_swix(OS_ReadMonotonicTime, _OUT(0), &now);

	/* Simple priority logic
	 * If higher priority than current - always use that,
	 * if current expired period - accept lower,
	 * otherwise error.
	 */
	if ((r->r[3] < last_priority) &&
	    ((now - last_duration) <= last_monotonic))
	{
		DPRINTF(("Priority battle lost\n"));
		return rtclock_error(ERR_HIPRI);
	}
	last_priority = r->r[3];
	last_duration = r->r[2];
	if (last_duration < MY_MIN_DURATION) last_duration = MY_MIN_DURATION;
	if (last_duration > INT32_MAX) last_duration = INT32_MAX;

	/* Algorithm speeds up or slows down the base centisecond timer over
	 * the next period. The equation used is
	 *
	 * period = last_t0_period * P + C *     P'
	 *                           -----   ---------
	 *                             P     P'- C + W
	 * Where
	 *        P = period over which to spread the offset
	 *        P'= actual period used (incase callbacks are delayed)
	 *        C = how far ahead/behind of real time this call
	 *        W = how far ahead/behind of real time last call
	 *
	 * when behind (-ve) period gets smaller so the cs timer speeds up
	 * when ahead (+ve) period gets longer so the cs timer slows down
	 */
	correction = (uint32_t)r->r[0] | ((uint64_t)r->r[1] << 32);
	if (llabs(correction) > INT16_MAX)
	{
		uint64_t soft = OWReadRTC_5ByteInt;

		/* Massive correction, suffer a discontinuity instead */
		err = _swix(OS_Word, _INR(0,1), OsWord_ReadRealTimeClock, &soft);
		if (err != NULL) return err;
		soft = soft - correction;
		if (soft & (0xFFFFFFuLL << 40))
		{
			DPRINTF(("Attempt to use > 40b time\n"));
			return rtclock_error(ERR_OFLO);
		}
		DPRINTF(("Discontinuous time jumps to %llu\n", soft));
		rtclock_set_default();

		return _swix(Territory_SetTime, _IN(0), &soft);
	}
	DPRINTF(("Priority %u diff %lldcs over %ucs\n",
	         last_priority, correction, last_duration));

	/* P is 31 bit (max), C is 15 bit (max), promote by 32 bits */
	term1.dword = last_duration + correction;
	term1.dword = (term1.dword << 32) / last_duration;

	/* P' is 31 bit (max), W is 15 bit (max), promote by 32 bits */
	elapsed = (int32_t)(now - last_monotonic);
	term2.dword = elapsed - correction + last_adjust;
	term2.dword = (elapsed << 32) / term2.dword;

	/* Cross multiply */
	lo = (uint64_t)term1.word.lo * term2.word.lo;
	hi = (uint64_t)term1.word.lo * term2.word.hi;
	product = 0       + (hi + (lo >> 32));
	lo = (uint64_t)term1.word.hi * term2.word.lo;
	hi = (uint64_t)term1.word.hi * term2.word.hi;
	product = product + ((hi << 32) + lo);

	/* Product still has 32 fractional bits, somewhere near to 1 */
	DPRINTF(("Product %X.%08X = %X.%08X * %X.%08X\n",
	         (uint32_t)(product >> 32), (uint32_t)product,
	         term1.word.hi, term1.word.lo,
	         term2.word.hi, term2.word.lo));
	period = (uint32_t)(((product >> 1) * last_t0_period) >> 31);
	if (period > upper_period) period = upper_period;
	if (period < lower_period) period = lower_period;
	DPRINTF(("New t0 = %u\n", period));
	rtclock_set_period(period);
	last_adjust = (int32_t)correction;
	last_monotonic = now;

	return NULL;
}

_kernel_oserror *rtclock_init(const char *cmd_tail, int podule_base, void *pw)
{
	_kernel_oserror *err;
	int32_t  pos = 0;
	uint64_t slew;
	uint32_t t0tickpersec, t0max;

	while (1)
	{
		err = _swix(OS_Hardware, _INR(0,1) | _IN(8) | _OUTR(1,2),
		                         HALDeviceType_SysPeri + HALDeviceSysPeri_RTC, pos,
		                         OSHW_DeviceEnumerate,
		                         &pos, &device);
		if (err != NULL) return err;
		if (pos == -1)
		{
			/* No matches, quit */
			return rtclock_error(ERR_NOCLOCK);
		}
		if ((device->timeformat == RTCTimeFormat_BCD) &&
		    ((device->formatflags & RTCFormatFlags_BCD_YearFlags) != 0) &&
		    device->dev.Activate(&device->dev))
		{
			/* Caught a live one */
			break;
		}
	}

	/* Query the base centisecond timer */ 
	err = _swix(OS_Hardware, _IN(0) | _INR(8,9) | _OUT(0),
	                         TIMER_0, OSHW_CallHAL, EntryNo_HAL_TimerMaxPeriod,
	                         &t0max);
	if (err != NULL) return err;
	err = _swix(OS_Hardware, _IN(0) | _INR(8,9) | _OUT(0),
	                         TIMER_0, OSHW_CallHAL, EntryNo_HAL_TimerGranularity,
	                         &t0tickpersec);
	if (err != NULL) return err;

	/* Rescale from per-second to per-centisecond */
	default_t0_period = (t0tickpersec + 50) / 100;
	slew = ((default_t0_period * MY_SLEW_PER_THOU) + 500) / 1000;
	upper_period = default_t0_period + (uint32_t)slew;
	if (upper_period < default_t0_period) upper_period = UINT32_MAX; /* Overflow */
	lower_period = default_t0_period - (uint32_t)slew;
	if (lower_period > default_t0_period) lower_period = 1; /* Underflow */
	DPRINTF(("Range of slew %u < %u < %u\n", lower_period, default_t0_period, upper_period));
	rtclock_set_default();

	/* Start the default adjuster */
	_swix(OS_CallEvery, _INR(0,2), MY_ADJ_DURATION - 1, rtclock_ticker_entry, pw);

	UNUSED(podule_base);
	UNUSED(pw);
	UNUSED(cmd_tail);

	return NULL;
}

_kernel_oserror *rtclock_final(int fatal, int podule, void *pw)
{
	int32_t oldstate;

	/* Cancel the timer, callbacks, default everything */
	_swix(OS_RemoveTickerEvent, _INR(0,1), rtclock_ticker_entry, pw);
	oldstate = ensure_irqs_off();
	while (pending_adjusts)
	{
		_swix(OS_RemoveCallBack, _INR(0,1), rtclock_fg_callback_entry, pw);
		pending_adjusts--;
	}
	restore_irqs(oldstate);
	rtclock_set_default();

	UNUSED(fatal);
	UNUSED(podule);

	return NULL;
}

void rtclock_service(int service_number, _kernel_swi_regs *r, void *pw)
{
	if (service_number == Service_Reset)
	{
		/* For soft resets the module chain isn't restarted but all
		 * tickers get cancelled so the default adjuster needs restarting here.
		 * For the non soft reset case rtclock_init() has already started
		 * one. Rather than figure out which is which, just cancel and restart.
		 */
		_swix(OS_RemoveTickerEvent, _INR(0,1), rtclock_ticker_entry, pw);
		_swix(OS_CallEvery, _INR(0,2), MY_ADJ_DURATION - 1, rtclock_ticker_entry, pw);
	}
	UNUSED(r);
}

_kernel_oserror *rtclock_swis(int swi_offset, _kernel_swi_regs *r, void *pw)
{
	switch (swi_offset)
	{
		case RTC_Features - RTC_00:
			r->r[0] = 0; /* No extra features yet */
			return NULL;

		case RTC_Read - RTC_00:
			return rtclock_read(r);

		case RTC_Write - RTC_00:
			return rtclock_write(r);

		case RTC_Adjust - RTC_00:
			return rtclock_adjust(r);

		default:
			return error_BAD_SWI;
	}

	UNUSED(pw);
}

_kernel_oserror *rtclock_fg_callback(_kernel_swi_regs *r, void *pw)
{
	struct rtctime   time;
	uint64_t         hard = 0, soft = OWReadRTC_5ByteInt;
	int64_t          diff;
	uint32_t         ordinals[7];

	/* Read the two views of the time */
	r->r[0] = (int)&time;
	if ((rtclock_read(r) == NULL) &&
	    (_swix(OS_Word, _INR(0,1), OsWord_ReadRealTimeClock, &soft) == NULL))
	{
		/* Convert to centiseconds */
		ordinals[0] = BCD8_TO_UINT8(time.Centiseconds);
		ordinals[1] = BCD8_TO_UINT8(time.Seconds);
		ordinals[2] = BCD8_TO_UINT8(time.Minutes);
		ordinals[3] = BCD8_TO_UINT8(time.Hours);
		ordinals[4] = BCD8_TO_UINT8(time.DayOfMonth);
		ordinals[5] = BCD8_TO_UINT8(time.Month);
		ordinals[6] = (100 * BCD8_TO_UINT8(time.YearHI)) + BCD8_TO_UINT8(time.YearLO);
		if (_swix(Territory_ConvertTimeFormats, _INR(0,3), -1, ordinals,
		          &hard, 0x0302 /* UTC ordinals to UTC cs */) == NULL)
		{
			/* Work out the difference and use that as an adjustment */
			diff = soft - hard;
			DPRINTF(("At %02x:%02x:%02x HW=%llu SW=%llu\n",
			         time.Hours, time.Minutes, time.Seconds, hard, soft));
			r->r[0] = (int)diff;
			r->r[1] = (int)(diff >> 32);
			r->r[2] = MY_ADJ_DURATION;
			r->r[3] = MY_ADJ_PRIORITY;
			rtclock_adjust(r);
		}
	}
	UNUSED(pw);
	if (pending_adjusts) pending_adjusts--;

	return NULL;
}

_kernel_oserror *rtclock_ticker(_kernel_swi_regs *r, void *pw)
{
	/* This is the default adjuster of the lowest priority. We will require
	 * a (potentially) slow clock read, don't do that in a ticker.
	 */
	_swix(OS_AddCallBack, _INR(0,1), rtclock_fg_callback_entry, pw);
	pending_adjusts++;
	UNUSED(r);

	return NULL;
}
