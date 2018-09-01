#ifndef osheap_H
#define osheap_H

/* C header file for OSHeap
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:28 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 12 June 1996
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
#undef  OS_Heap
#define OS_Heap                                 0x1D
#undef  XOS_Heap
#define XOS_Heap                                0x2001D
#undef  OSHeap_ResizeNoFail
#define OSHeap_ResizeNoFail                     0x5
#undef  OSHeap_Initialise
#define OSHeap_Initialise                       0x0
#undef  OSHeap_Describe
#define OSHeap_Describe                         0x1
#undef  OSHeap_Alloc
#define OSHeap_Alloc                            0x2
#undef  OSHeap_Free
#define OSHeap_Free                             0x3
#undef  OSHeap_Realloc
#define OSHeap_Realloc                          0x4
#undef  OSHeap_Resize
#define OSHeap_Resize                           0x5
#undef  OSHeap_ReadSize
#define OSHeap_ReadSize                         0x6

/************************
 * Constant definitions *
 ************************/
#define error_HEAP_BAD_REASON                   0x180u
#define error_HEAP_INIT                         0x181u
#define error_HEAP_BAD_DESC                     0x182u
#define error_HEAP_BAD_LINK                     0x183u
#define error_HEAP_ALLOC                        0x184u
#define error_HEAP_NOT_ABLOCK                   0x185u
#define error_HEAP_BAD_EXTEND                   0x186u
#define error_HEAP_EXCESSIVE_SHRINK             0x187u
#define error_HEAP_HEAP_LOCKED                  0x188u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      osheap_resize_no_fail()
 *
 * Description:   Extends or shrinks a heap without throwing an error if
 *                shrink failed (PRM 1-375)
 *
 * Input:         heap - value of R1 on entry
 *                size_increase - value of R3 on entry
 *
 * Output:        size_increase_out - number of bytes actually increased (negative if shrunk) (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1D with R0 = 0x5.
 */

extern os_error *xosheap_resize_no_fail (byte *heap,
      int size_increase,
      int *size_increase_out);
extern int osheap_resize_no_fail (byte *heap,
      int size_increase);

/* ------------------------------------------------------------------------
 * Function:      osheap_initialise()
 *
 * Description:   Initialises a heap (PRM 1-370)
 *
 * Input:         heap - value of R1 on entry
 *                size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x1D with R0 = 0x0.
 */

extern os_error *xosheap_initialise (byte *heap,
      int size);
extern void osheap_initialise (byte *heap,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osheap_describe()
 *
 * Description:   Describes a heap (PRM 1-371)
 *
 * Input:         heap - value of R1 on entry
 *
 * Output:        max - value of R2 on exit
 *                free - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1D with R0 = 0x1.
 */

extern os_error *xosheap_describe (byte const *heap,
      int *max,
      int *free);
extern int osheap_describe (byte const *heap,
      int *max);

/* ------------------------------------------------------------------------
 * Function:      osheap_alloc()
 *
 * Description:   Gets a heap block (PRM 1-372)
 *
 * Input:         heap - value of R1 on entry
 *                size - value of R3 on entry
 *
 * Output:        blk - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1D with R0 = 0x2.
 */

extern os_error *xosheap_alloc (byte *heap,
      int size,
      void **blk);
extern void *osheap_alloc (byte *heap,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osheap_free()
 *
 * Description:   Frees a heap block (PRM 1-373)
 *
 * Input:         heap - value of R1 on entry
 *                blk - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x1D with R0 = 0x3.
 */

extern os_error *xosheap_free (byte *heap,
      void *blk);
extern void osheap_free (byte *heap,
      void *blk);

/* ------------------------------------------------------------------------
 * Function:      osheap_realloc()
 *
 * Description:   Extends or shrinks a heap block (PRM 1-374)
 *
 * Input:         heap - value of R1 on entry
 *                blk - value of R2 on entry
 *                size_increase - value of R3 on entry
 *
 * Output:        blk_out - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1D with R0 = 0x4.
 */

extern os_error *xosheap_realloc (byte *heap,
      void *blk,
      int size_increase,
      void **blk_out);
extern void *osheap_realloc (byte *heap,
      void *blk,
      int size_increase);

/* ------------------------------------------------------------------------
 * Function:      osheap_resize()
 *
 * Description:   Extends or shrinks a heap (PRM 1-375)
 *
 * Input:         heap - value of R1 on entry
 *                size_increase - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x1D with R0 = 0x5.
 */

extern os_error *xosheap_resize (byte *heap,
      int size_increase);
extern void osheap_resize (byte *heap,
      int size_increase);

/* ------------------------------------------------------------------------
 * Function:      osheap_read_size()
 *
 * Description:   Reads a heap block size (PRM 1-376)
 *
 * Input:         heap - value of R1 on entry
 *                blk - value of R2 on entry
 *
 * Output:        size - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1D with R0 = 0x6.
 */

extern os_error *xosheap_read_size (byte const *heap,
      void *blk,
      int *size);
extern int osheap_read_size (byte const *heap,
      void *blk);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
