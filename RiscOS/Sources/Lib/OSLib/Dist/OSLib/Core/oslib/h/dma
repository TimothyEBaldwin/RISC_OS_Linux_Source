#ifndef dma_H
#define dma_H

/* C header file for DMA
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:27 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 June 1995
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
#undef  DMA_RegisterChannel
#define DMA_RegisterChannel                     0x46140
#undef  XDMA_RegisterChannel
#define XDMA_RegisterChannel                    0x66140
#undef  DMA_DeregisterChannel
#define DMA_DeregisterChannel                   0x46141
#undef  XDMA_DeregisterChannel
#define XDMA_DeregisterChannel                  0x66141
#undef  DMA_QueueTransfer
#define DMA_QueueTransfer                       0x46142
#undef  XDMA_QueueTransfer
#define XDMA_QueueTransfer                      0x66142
#undef  DMA_TerminateTransfer
#define DMA_TerminateTransfer                   0x46143
#undef  XDMA_TerminateTransfer
#define XDMA_TerminateTransfer                  0x66143
#undef  DMA_SuspendTransfer
#define DMA_SuspendTransfer                     0x46144
#undef  XDMA_SuspendTransfer
#define XDMA_SuspendTransfer                    0x66144
#undef  DMA_ResumeTransfer
#define DMA_ResumeTransfer                      0x46145
#undef  XDMA_ResumeTransfer
#define XDMA_ResumeTransfer                     0x66145
#undef  DMA_ExamineTransfer
#define DMA_ExamineTransfer                     0x46146
#undef  XDMA_ExamineTransfer
#define XDMA_ExamineTransfer                    0x66146

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct dma_c_                           *dma_c;
typedef struct dma_tag_                         *dma_tag;
typedef struct dma_routines                     dma_routines;
typedef struct dma_scatter                      dma_scatter;
typedef struct dma_scatter_list                 dma_scatter_list;
typedef struct dma_scatter_list_base            dma_scatter_list_base;

/********************
 * Type definitions *
 ********************/
struct dma_routines
   {  void *enable;
      void *disable;
      void *start;
      void *completed;
      void *sync;
   };

struct dma_scatter
   {  byte *address;
      int size;
   };

struct dma_scatter_list
   {  dma_scatter s [UNKNOWN];
   };

#define dma_SCATTER_LIST(N) \
   struct \
      {  dma_scatter s [N]; \
      }

#define dma_SIZEOF_SCATTER_LIST(N) \
   ((N)*sizeof ((dma_scatter_list *) NULL)->s)

typedef bits dma_register_channel_flags;

typedef bits dma_queue_flags;

typedef bits dma_suspend_flags;

typedef bits dma_resume_flags;

typedef bits dma_examine_flags;

/************************
 * Constant definitions *
 ************************/
#define dma_QUEUE_WRITE                         ((dma_queue_flags) 0x1u)
#define dma_QUEUE_CIRCULAR_LIST                 ((dma_queue_flags) 0x2u)
#define dma_QUEUE_USE_SYNC                      ((dma_queue_flags) 0x4u)
#define dma_SUSPEND_START_NEXT                  ((dma_suspend_flags) 0x1u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      dma_register_channel()
 *
 * Description:   Registers a client device as the controller of a logical
 *                channel - RISC O S 3.5+
 *
 * Input:         flags - value of R0 on entry
 *                log_channel - value of R1 on entry
 *                cycle_speed - value of R2 on entry
 *                transfer_size - value of R3 on entry
 *                control_routines - value of R4 on entry
 *                workspace - value of R5 on entry
 *
 * Output:        channel - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x46140.
 */

extern os_error *xdma_register_channel (dma_register_channel_flags flags,
      int log_channel,
      int cycle_speed,
      int transfer_size,
      dma_routines const *control_routines,
      void *workspace,
      dma_c *channel);
extern dma_c dma_register_channel (dma_register_channel_flags flags,
      int log_channel,
      int cycle_speed,
      int transfer_size,
      dma_routines const *control_routines,
      void *workspace);

/* ------------------------------------------------------------------------
 * Function:      dma_deregister_channel()
 *
 * Description:   Deregisters a client device previously registered by
 *                DMA_RegisterChannel - RISC O S 3.5+
 *
 * Input:         channel - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x46141.
 */

extern os_error *xdma_deregister_channel (dma_c channel);
__swi (0x46141) void dma_deregister_channel (dma_c channel);

/* ------------------------------------------------------------------------
 * Function:      dma_queue_transfer()
 *
 * Description:   Queues a DMA transfer request for a logical channel -
 *                RISC O S 3.5+
 *
 * Input:         flags - value of R0 on entry
 *                channel - value of R1 on entry
 *                workspace - value of R2 on entry
 *                scatter_list - value of R3 on entry
 *                transfer_size - value of R4 on entry
 *                buffer_size - value of R5 on entry
 *                sync_size - value of R6 on entry
 *
 * Output:        tag - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x46142.
 */

extern os_error *xdma_queue_transfer (dma_queue_flags flags,
      dma_c channel,
      void *workspace,
      dma_scatter_list const *scatter_list,
      int transfer_size,
      int buffer_size,
      int sync_size,
      dma_tag *tag);
extern dma_tag dma_queue_transfer (dma_queue_flags flags,
      dma_c channel,
      void *workspace,
      dma_scatter_list const *scatter_list,
      int transfer_size,
      int buffer_size,
      int sync_size);

/* ------------------------------------------------------------------------
 * Function:      dma_terminate_transfer()
 *
 * Description:   Terminates a DMA transfer - RISC O S 3.5+
 *
 * Input:         error - value of R0 on entry
 *                tag - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x46143.
 */

extern os_error *xdma_terminate_transfer (os_error const *error,
      dma_tag tag);
__swi (0x46143) void dma_terminate_transfer (os_error const *error,
      dma_tag tag);

/* ------------------------------------------------------------------------
 * Function:      dma_suspend_transfer()
 *
 * Description:   Suspends a DMA transfer - RISC O S 3.5+
 *
 * Input:         flags - value of R0 on entry
 *                tag - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x46144.
 */

extern os_error *xdma_suspend_transfer (dma_suspend_flags flags,
      dma_tag tag);
__swi (0x46144) void dma_suspend_transfer (dma_suspend_flags flags,
      dma_tag tag);

/* ------------------------------------------------------------------------
 * Function:      dma_resume_transfer()
 *
 * Description:   Resumes a previously suspended DMA transfer - RISC O S
 *                3.5+
 *
 * Input:         flags - value of R0 on entry
 *                tag - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x46145.
 */

extern os_error *xdma_resume_transfer (dma_resume_flags flags,
      dma_tag tag);
__swi (0x46145) void dma_resume_transfer (dma_resume_flags flags,
      dma_tag tag);

/* ------------------------------------------------------------------------
 * Function:      dma_examine_transfer()
 *
 * Description:   Returns the progress of a DMA transfer - RISC O S 3.5+
 *
 * Input:         flags - value of R0 on entry
 *                tag - value of R1 on entry
 *
 * Output:        transferred_size - value of R0 on exit
 *
 * Other notes:   Calls SWI 0x46146.
 */

extern os_error *xdma_examine_transfer (dma_examine_flags flags,
      dma_tag tag,
      int *transferred_size);
__swi (0x46146) void dma_examine_transfer (dma_examine_flags flags,
      dma_tag tag,
      int *transferred_size);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
