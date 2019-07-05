#ifndef hal_H
#define hal_H

/* C header file for HAL
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:28 2007
 * Tom Hughes, tom@compton.nu, 23 Nov 2002
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#ifndef os_H
#include "oslib/os.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  HAL_IRQEnable
#define HAL_IRQEnable                           0x1
#undef  HAL_IRQDisable
#define HAL_IRQDisable                          0x2
#undef  HAL_IRQClear
#define HAL_IRQClear                            0x3
#undef  HAL_IRQSource
#define HAL_IRQSource                           0x4
#undef  HAL_IRQStatus
#define HAL_IRQStatus                           0x5
#undef  HAL_FIQEnable
#define HAL_FIQEnable                           0x6
#undef  HAL_FIQDisable
#define HAL_FIQDisable                          0x7
#undef  HAL_FIQDisableAll
#define HAL_FIQDisableAll                       0x8
#undef  HAL_FIQClear
#define HAL_FIQClear                            0x9
#undef  HAL_FIQSource
#define HAL_FIQSource                           0xA
#undef  HAL_FIQStatus
#define HAL_FIQStatus                           0xB
#undef  HAL_Timers
#define HAL_Timers                              0xC
#undef  HAL_TimerDevice
#define HAL_TimerDevice                         0xD
#undef  HAL_TimerGranularity
#define HAL_TimerGranularity                    0xE
#undef  HAL_TimerMaxPeriod
#define HAL_TimerMaxPeriod                      0xF
#undef  HAL_TimerSetPeriod
#define HAL_TimerSetPeriod                      0x10
#undef  HAL_TimerPeriod
#define HAL_TimerPeriod                         0x11
#undef  HAL_TimerReadCountdown
#define HAL_TimerReadCountdown                  0x12
#undef  HAL_CounterRate
#define HAL_CounterRate                         0x13
#undef  HAL_CounterPeriod
#define HAL_CounterPeriod                       0x14
#undef  HAL_CounterRead
#define HAL_CounterRead                         0x15
#undef  HAL_CounterDelay
#define HAL_CounterDelay                        0x16

/********************
 * Type definitions *
 ********************/
typedef int hal_device;

typedef int hal_timer;

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      hal_irq_enable()
 *
 * Description:   Unmasks the specified IRQ source - RISC O S 5+
 *
 * Input:         device - value of R0 on entry
 *
 * Output:        was_enabled - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x1.
 */

extern os_error *xhal_irq_enable (hal_device device,
      osbool *was_enabled);
extern osbool hal_irq_enable (hal_device device);

/* ------------------------------------------------------------------------
 * Function:      hal_irq_disable()
 *
 * Description:   Masks the specified IRQ source - RISC O S 5+
 *
 * Input:         device - value of R0 on entry
 *
 * Output:        was_enabled - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x2.
 */

extern os_error *xhal_irq_disable (hal_device device,
      osbool *was_enabled);
extern osbool hal_irq_disable (hal_device device);

/* ------------------------------------------------------------------------
 * Function:      hal_irq_clear()
 *
 * Description:   Clears the specified IRQ source - RISC O S 5+
 *
 * Input:         device - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x3.
 */

extern os_error *xhal_irq_clear (hal_device device);
extern void hal_irq_clear (hal_device device);

/* ------------------------------------------------------------------------
 * Function:      hal_irq_source()
 *
 * Description:   Returns the number of the highest priority asserted IRQ -
 *                RISC O S 5+
 *
 * Output:        device - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x4.
 */

extern os_error *xhal_irq_source (hal_device *device);
extern hal_device hal_irq_source (void);

/* ------------------------------------------------------------------------
 * Function:      hal_irq_status()
 *
 * Description:   Returns non-zero if the specified device is requesting an
 *                IRQ - RISC O S 5+
 *
 * Input:         device - value of R0 on entry
 *
 * Output:        requested - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x5.
 */

extern os_error *xhal_irq_status (hal_device device,
      osbool *requested);
extern osbool hal_irq_status (hal_device device);

/* ------------------------------------------------------------------------
 * Function:      hal_fiq_enable()
 *
 * Description:   Unmasks the specified FIQ source - RISC O S 5+
 *
 * Input:         device - value of R0 on entry
 *
 * Output:        was_enabled - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x6.
 */

extern os_error *xhal_fiq_enable (hal_device device,
      osbool *was_enabled);
extern osbool hal_fiq_enable (hal_device device);

/* ------------------------------------------------------------------------
 * Function:      hal_fiq_disable()
 *
 * Description:   Masks the specified FIQ source - RISC O S 5+
 *
 * Input:         device - value of R0 on entry
 *
 * Output:        was_enabled - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x7.
 */

extern os_error *xhal_fiq_disable (hal_device device,
      osbool *was_enabled);
extern osbool hal_fiq_disable (hal_device device);

/* ------------------------------------------------------------------------
 * Function:      hal_fiq_disable_all()
 *
 * Description:   Masks all FIQ sources - RISC O S 5+
 *
 * Input:         device - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x8.
 */

extern os_error *xhal_fiq_disable_all (hal_device device);
extern void hal_fiq_disable_all (hal_device device);

/* ------------------------------------------------------------------------
 * Function:      hal_fiq_clear()
 *
 * Description:   Clears the specified FIQ source - RISC O S 5+
 *
 * Input:         device - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x9.
 */

extern os_error *xhal_fiq_clear (hal_device device);
extern void hal_fiq_clear (hal_device device);

/* ------------------------------------------------------------------------
 * Function:      hal_fiq_source()
 *
 * Description:   Returns the number of the highest priority asserted FIQ -
 *                RISC O S 5+
 *
 * Output:        device - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0xA.
 */

extern os_error *xhal_fiq_source (hal_device *device);
extern hal_device hal_fiq_source (void);

/* ------------------------------------------------------------------------
 * Function:      hal_fiq_status()
 *
 * Description:   Returns non-zero if the specified device is requesting an
 *                FIQ - RISC O S 5+
 *
 * Input:         device - value of R0 on entry
 *
 * Output:        requested - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0xB.
 */

extern os_error *xhal_fiq_status (hal_device device,
      osbool *requested);
extern osbool hal_fiq_status (hal_device device);

/* ------------------------------------------------------------------------
 * Function:      hal_timers()
 *
 * Description:   Returns number of timers - RISC O S 5+
 *
 * Output:        timers - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0xC.
 */

extern os_error *xhal_timers (int *timers);
extern int hal_timers (void);

/* ------------------------------------------------------------------------
 * Function:      hal_timer_device()
 *
 * Description:   Returns IRQ device number of the specified timer - RISC O
 *                S 5+
 *
 * Input:         timer - value of R0 on entry
 *
 * Output:        device - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0xD.
 */

extern os_error *xhal_timer_device (hal_timer timer,
      hal_device *device);
extern hal_device hal_timer_device (hal_timer timer);

/* ------------------------------------------------------------------------
 * Function:      hal_timer_granularity()
 *
 * Description:   Returns basic granularity of the specified timer in ticks
 *                per second - RISC O S 5+
 *
 * Input:         timer - value of R0 on entry
 *
 * Output:        granularity - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0xE.
 */

extern os_error *xhal_timer_granularity (hal_timer timer,
      int *granularity);
extern int hal_timer_granularity (hal_timer timer);

/* ------------------------------------------------------------------------
 * Function:      hal_timer_max_period()
 *
 * Description:   Returns maximum period of the specified timer - RISC O S
 *                5+
 *
 * Input:         timer - value of R0 on entry
 *
 * Output:        max_period - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0xF.
 */

extern os_error *xhal_timer_max_period (hal_timer timer,
      int *max_period);
extern int hal_timer_max_period (hal_timer timer);

/* ------------------------------------------------------------------------
 * Function:      hal_timer_set_period()
 *
 * Description:   Sets period of the specified timer - RISC O S 5+
 *
 * Input:         timer - value of R0 on entry
 *                period - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x10.
 */

extern os_error *xhal_timer_set_period (hal_timer timer,
      int period);
extern void hal_timer_set_period (hal_timer timer,
      int period);

/* ------------------------------------------------------------------------
 * Function:      hal_timer_period()
 *
 * Description:   Reads period of the specified timer - RISC O S 5+
 *
 * Input:         timer - value of R0 on entry
 *
 * Output:        period - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x11.
 */

extern os_error *xhal_timer_period (hal_timer timer,
      int *period);
extern int hal_timer_period (hal_timer timer);

/* ------------------------------------------------------------------------
 * Function:      hal_timer_read_countdown()
 *
 * Description:   Returns the time until the next interrupt for the
 *                specified timer - RISC O S 5+
 *
 * Input:         timer - value of R0 on entry
 *
 * Output:        time_remaining - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x12.
 */

extern os_error *xhal_timer_read_countdown (hal_timer timer,
      int *time_remaining);
extern int hal_timer_read_countdown (hal_timer timer);

/* ------------------------------------------------------------------------
 * Function:      hal_counter_rate()
 *
 * Description:   Returns the rate of the counter in ticks per second -
 *                RISC O S 5+
 *
 * Output:        rate - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x13.
 */

extern os_error *xhal_counter_rate (int *rate);
extern int hal_counter_rate (void);

/* ------------------------------------------------------------------------
 * Function:      hal_counter_period()
 *
 * Description:   Returns the period of the counter in ticks - RISC O S 5+
 *
 * Output:        period - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x14.
 */

extern os_error *xhal_counter_period (int *period);
extern int hal_counter_period (void);

/* ------------------------------------------------------------------------
 * Function:      hal_counter_read()
 *
 * Description:   Reads the current counter value - RISC O S 5+
 *
 * Output:        period - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x15.
 */

extern os_error *xhal_counter_read (int *period);
extern int hal_counter_read (void);

/* ------------------------------------------------------------------------
 * Function:      hal_counter_delay()
 *
 * Description:   Delay for at least the specified number of microseconds -
 *                RISC O S 5+
 *
 * Input:         delay - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x7A with R8 = 0x0, R9 = 0x16.
 */

extern os_error *xhal_counter_delay (int delay);
extern void hal_counter_delay (int delay);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
