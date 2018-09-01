#ifndef cache_H
#define cache_H

/* C header file for Cache
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:27 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 21 Aug 1995
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
#undef  Cache_Control
#define Cache_Control                           0x280
#undef  XCache_Control
#define XCache_Control                          0x20280
#undef  Cache_Cacheable
#define Cache_Cacheable                         0x281
#undef  XCache_Cacheable
#define XCache_Cacheable                        0x20281
#undef  Cache_Updateable
#define Cache_Updateable                        0x282
#undef  XCache_Updateable
#define XCache_Updateable                       0x20282
#undef  Cache_Disruptive
#define Cache_Disruptive                        0x283
#undef  XCache_Disruptive
#define XCache_Disruptive                       0x20283
#undef  Cache_Flush
#define Cache_Flush                             0x284
#undef  XCache_Flush
#define XCache_Flush                            0x20284

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      cache_control()
 *
 * Description:   Turns the cache on or off - RISC O S 3.1
 *
 * Input:         eor_mask - value of R0 on entry
 *                and_mask - value of R1 on entry
 *
 * Output:        old_state - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x280.
 */

extern os_error *xcache_control (bits eor_mask,
      bits and_mask,
      bits *old_state);
__swi (0x280) bits cache_control (bits eor_mask,
      bits and_mask);

/* ------------------------------------------------------------------------
 * Function:      cache_cacheable()
 *
 * Description:   Controls which area of memory may be cached - RISC O S
 *                3.1
 *
 * Input:         eor_mask - value of R0 on entry
 *                and_mask - value of R1 on entry
 *
 * Output:        old_state - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x281.
 */

extern os_error *xcache_cacheable (bits eor_mask,
      bits and_mask,
      bits *old_state);
__swi (0x281) bits cache_cacheable (bits eor_mask,
      bits and_mask);

/* ------------------------------------------------------------------------
 * Function:      cache_updateable()
 *
 * Description:   Controls which area of memory will be automatically
 *                updated in the cache - RISC O S 3.1
 *
 * Input:         eor_mask - value of R0 on entry
 *                and_mask - value of R1 on entry
 *
 * Output:        old_state - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x282.
 */

extern os_error *xcache_updateable (bits eor_mask,
      bits and_mask,
      bits *old_state);
__swi (0x282) bits cache_updateable (bits eor_mask,
      bits and_mask);

/* ------------------------------------------------------------------------
 * Function:      cache_disruptive()
 *
 * Description:   Controls which areas of memory cause automatic flushing
 *                of the cache on a write - RISC O S 3.1
 *
 * Input:         eor_mask - value of R0 on entry
 *                and_mask - value of R1 on entry
 *
 * Output:        old_state - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x283.
 */

extern os_error *xcache_disruptive (bits eor_mask,
      bits and_mask,
      bits *old_state);
__swi (0x283) bits cache_disruptive (bits eor_mask,
      bits and_mask);

/* ------------------------------------------------------------------------
 * Function:      cache_flush()
 *
 * Description:   Flushes the cache - RISC O S 3.1
 *
 * Other notes:   Calls SWI 0x284.
 */

extern os_error *xcache_flush (void);
__swi (0x284) void cache_flush (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
