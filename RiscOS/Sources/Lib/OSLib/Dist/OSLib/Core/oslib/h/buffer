#ifndef buffer_H
#define buffer_H

/* C header file for Buffer
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
#undef  Buffer_Create
#define Buffer_Create                           0x42940
#undef  XBuffer_Create
#define XBuffer_Create                          0x62940
#undef  Buffer_Remove
#define Buffer_Remove                           0x42941
#undef  XBuffer_Remove
#define XBuffer_Remove                          0x62941
#undef  Buffer_Register
#define Buffer_Register                         0x42942
#undef  XBuffer_Register
#define XBuffer_Register                        0x62942
#undef  Buffer_Deregister
#define Buffer_Deregister                       0x42943
#undef  XBuffer_Deregister
#define XBuffer_Deregister                      0x62943
#undef  Buffer_ModifyFlags
#define Buffer_ModifyFlags                      0x42944
#undef  XBuffer_ModifyFlags
#define XBuffer_ModifyFlags                     0x62944
#undef  Buffer_ModifyFlags2
#define Buffer_ModifyFlags2                     0x42944
#undef  XBuffer_ModifyFlags2
#define XBuffer_ModifyFlags2                    0x62944
#undef  Buffer_LinkDevice
#define Buffer_LinkDevice                       0x42945
#undef  XBuffer_LinkDevice
#define XBuffer_LinkDevice                      0x62945
#undef  Buffer_UnlinkDevice
#define Buffer_UnlinkDevice                     0x42946
#undef  XBuffer_UnlinkDevice
#define XBuffer_UnlinkDevice                    0x62946
#undef  Buffer_GetInfo
#define Buffer_GetInfo                          0x42947
#undef  XBuffer_GetInfo
#define XBuffer_GetInfo                         0x62947
#undef  Buffer_Threshold
#define Buffer_Threshold                        0x42948
#undef  XBuffer_Threshold
#define XBuffer_Threshold                       0x62948
#undef  Buffer_InternalInfo
#define Buffer_InternalInfo                     0x42949
#undef  XBuffer_InternalInfo
#define XBuffer_InternalInfo                    0x62949
#undef  InsV
#define InsV                                    0x14
#undef  InsV_Block
#define InsV_Block                              0x14
#undef  RemV
#define RemV                                    0x15
#undef  RemV_Block
#define RemV_Block                              0x15
#undef  CnpV
#define CnpV                                    0x16
#undef  Service_BufferStarting
#define Service_BufferStarting                  0x6F
#undef  Event_OutputBufferEmpty
#define Event_OutputBufferEmpty                 0x0
#undef  Event_InputBufferFull
#define Event_InputBufferFull                   0x1
#undef  Event_InputBufferFullBlockOp
#define Event_InputBufferFullBlockOp            0x1
#undef  UpCall_BufferFilling
#define UpCall_BufferFilling                    0x8
#undef  UpCall_BufferEmptying
#define UpCall_BufferEmptying                   0x9

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct buffer_b_                        *buffer_b;
typedef struct buffer_internal_id_              *buffer_internal_id;
typedef struct buffer_mouse_data                buffer_mouse_data;

/********************
 * Type definitions *
 ********************/
typedef int buffer_no;

typedef bits buffer_flags;

typedef int buffer_service_op;

struct buffer_mouse_data
   {  short x;
      short y;
      byte buttons;
      byte time [4];
   };

/************************
 * Constant definitions *
 ************************/
#define buffer_KEYBOARD                         ((buffer_no) 0x0u)
#define buffer_RS423_INPUT                      ((buffer_no) 0x1u)
#define buffer_RS423_OUTPUT                     ((buffer_no) 0x2u)
#define buffer_PRINTER                          ((buffer_no) 0x3u)
#define buffer_SOUND_CHANNEL0                   ((buffer_no) 0x4u)
#define buffer_SOUND_CHANNEL1                   ((buffer_no) 0x5u)
#define buffer_SOUND_CHANNEL2                   ((buffer_no) 0x6u)
#define buffer_SOUND_CHANNEL3                   ((buffer_no) 0x7u)
#define buffer_SPEECH                           ((buffer_no) 0x8u)
#define buffer_MOUSE                            ((buffer_no) 0x9u)
#define buffer_DORMANT                          ((buffer_flags) 0x1u)
#define buffer_EVENT_ON_EMPTY                   ((buffer_flags) 0x2u)
#define buffer_EVENT_ON_FULL                    ((buffer_flags) 0x4u)
#define buffer_UP_CALL_ON_THRESHOLD             ((buffer_flags) 0x8u)
#define error_BUFFER_MANAGER_BAD_SWI            0x20700u
      /*SWI not known*/
#define error_BUFFER_MANAGER_TOO_MANY_BUFFERS   0x20700u
      /*Too many buffers*/
#define error_BUFFER_MANAGER_BAD_BUFFER         0x20700u
      /*Bad buffer handle*/
#define error_BUFFER_MANAGER_IN_USE             0x20700u
      /*Buffer manager in use*/
#define error_BUFFER_MANAGER_UNABLE_TO_DETACH   0x20700u
      /*Unable to detach current owner*/
#define error_BUFFER_MANAGER_HANDLE_ALREADY_USED 0x20700u
      /*Buffer handle already in use*/
#define error_BUFFER_MANAGER_BUFFER_TOO_SMALL   0x20700u
      /*Buffer too small*/
#define error_BUFFER_MANAGER_BAD_PARM           0x20700u
      /*Bad parameters*/
#define buffer_SERVICE_INSERT_BYTE              ((buffer_service_op) 0x0u)
#define buffer_SERVICE_INSERT_BLOCK             ((buffer_service_op) 0x1u)
#define buffer_SERVICE_REMOVE_BYTE              ((buffer_service_op) 0x2u)
#define buffer_SERVICE_REMOVE_BLOCK             ((buffer_service_op) 0x3u)
#define buffer_SERVICE_EXAMINE_BYTE             ((buffer_service_op) 0x4u)
#define buffer_SERVICE_EXAMINE_BLOCK            ((buffer_service_op) 0x5u)
#define buffer_SERVICE_USED_SPACE               ((buffer_service_op) 0x6u)
#define buffer_SERVICE_FREE_SPACE               ((buffer_service_op) 0x7u)
#define buffer_SERVICE_PURGE_BUFFER             ((buffer_service_op) 0x8u)
#define buffer_SERVICE_NEXT_FILLED_BLOCK        ((buffer_service_op) 0x9u)
#define cnpv_COUNT_ENTRIES                      0x0u
#define cnpv_NUMBER_FREE                        0x20000000u
#define cnpv_PURGE                              0x10000000u

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      buffer_create()
 *
 * Description:   Claims an area of memory from the RMA and registers it as
 *                a buffer
 *
 * Input:         flags - value of R0 on entry
 *                size - value of R1 on entry
 *                b - value of R2 on entry
 *
 * Output:        b_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42940.
 */

extern os_error *xbuffer_create (buffer_flags flags,
      int size,
      buffer_b b,
      buffer_b *b_out);
__swi (0x42940) buffer_b buffer_create (buffer_flags flags,
      int size,
      buffer_b b);

/* ------------------------------------------------------------------------
 * Function:      buffer_remove()
 *
 * Description:   Deregisters a buffer and frees its memory
 *
 * Input:         b - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x42941.
 */

extern os_error *xbuffer_remove (buffer_b b);
__swi (0x42941) void buffer_remove (buffer_b b);

/* ------------------------------------------------------------------------
 * Function:      buffer_register()
 *
 * Description:   Registers an area of memory as a buffer
 *
 * Input:         flags - value of R0 on entry
 *                buffer - value of R1 on entry
 *                end - value of R2 on entry
 *                b - value of R3 on entry
 *
 * Output:        b_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42942.
 */

extern os_error *xbuffer_register (buffer_flags flags,
      byte *buffer,
      byte *end,
      buffer_b b,
      buffer_b *b_out);
__swi (0x42942) buffer_b buffer_register (buffer_flags flags,
      byte *buffer,
      byte *end,
      buffer_b b);

/* ------------------------------------------------------------------------
 * Function:      buffer_deregister()
 *
 * Description:   Deregisters a buffer
 *
 * Input:         b - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x42943.
 */

extern os_error *xbuffer_deregister (buffer_b b);
__swi (0x42943) void buffer_deregister (buffer_b b);

/* ------------------------------------------------------------------------
 * Function:      buffer_modify_flags()
 *
 * Description:   Modifies a buffer's flags word. Prefer
 *                Buffer_ModifyFlags2
 *
 * Input:         b - value of R0 on entry
 *                eor_mask - value of R1 on entry
 *                and_mask - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x42944.
 */

extern os_error *xbuffer_modify_flags (buffer_b b,
      bits eor_mask,
      bits and_mask);
__swi (0x42944) void buffer_modify_flags (buffer_b b,
      bits eor_mask,
      bits and_mask);

/* ------------------------------------------------------------------------
 * Function:      buffer_modify_flags2()
 *
 * Description:   Modifies a buffer's flags word and returns old and new
 *                values
 *
 * Input:         b - value of R0 on entry
 *                eor_mask - value of R1 on entry
 *                and_mask - value of R2 on entry
 *
 * Output:        old_value - value of R1 on exit
 *                new_value - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x42944.
 */

extern os_error *xbuffer_modify_flags2 (buffer_b b,
      bits eor_mask,
      bits and_mask,
      bits *old_value,
      bits *new_value);
extern void buffer_modify_flags2 (buffer_b b,
      bits eor_mask,
      bits and_mask,
      bits *old_value,
      bits *new_value);

/* ------------------------------------------------------------------------
 * Function:      buffer_link_device()
 *
 * Description:   Links a set of routines to a specified buffer
 *
 * Input:         b - value of R0 on entry
 *                wakeup_code - value of R1 on entry
 *                owner_change_code - value of R2 on entry
 *                handle - value of R3 on entry
 *                workspace - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x42945.
 */

extern os_error *xbuffer_link_device (buffer_b b,
      void const *wakeup_code,
      void const *owner_change_code,
      int handle,
      void *workspace);
extern void buffer_link_device (buffer_b b,
      void const *wakeup_code,
      void const *owner_change_code,
      int handle,
      void *workspace);

/* ------------------------------------------------------------------------
 * Function:      buffer_unlink_device()
 *
 * Description:   Unlinks a set of routines from the specified buffer
 *
 * Input:         b - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x42946.
 */

extern os_error *xbuffer_unlink_device (buffer_b b);
__swi (0x42946) void buffer_unlink_device (buffer_b b);

/* ------------------------------------------------------------------------
 * Function:      buffer_get_info()
 *
 * Description:   Returns data about the buffer
 *
 * Input:         b - value of R0 on entry
 *
 * Output:        flags - value of R0 on exit
 *                buffer - value of R1 on exit
 *                end - value of R2 on exit
 *                insertion_point - value of R3 on exit
 *                removal_point - value of R4 on exit
 *                spare - value of R5 on exit
 *                used - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x42947.
 */

extern os_error *xbuffer_get_info (buffer_b b,
      buffer_flags *flags,
      byte **buffer,
      byte **end,
      int *insertion_point,
      int *removal_point,
      int *spare,
      int *used);
extern void buffer_get_info (buffer_b b,
      buffer_flags *flags,
      byte **buffer,
      byte **end,
      int *insertion_point,
      int *removal_point,
      int *spare,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      buffer_threshold()
 *
 * Description:   Sets or reads the warning threshold of the buffer
 *
 * Input:         b - value of R0 on entry
 *                threshold - value of R1 on entry
 *
 * Output:        old_threshold - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42948.
 */

extern os_error *xbuffer_threshold (buffer_b b,
      int threshold,
      int *old_threshold);
extern int buffer_threshold (buffer_b b,
      int threshold);

/* ------------------------------------------------------------------------
 * Function:      buffer_internal_info()
 *
 * Description:   Converts a buffer handle into a buffer manager internal
 *                id - RISC O S 3.5+
 *
 * Input:         b - value of R0 on entry
 *
 * Output:        id - value of R0 on exit (X version only)
 *                service_routine - value of R1 on exit
 *                workspace - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42949.
 */

extern os_error *xbuffer_internal_info (buffer_b b,
      buffer_internal_id *id,
      void **service_routine,
      void **workspace);
extern buffer_internal_id buffer_internal_info (buffer_b b,
      void **service_routine,
      void **workspace);

/* ------------------------------------------------------------------------
 * Function:      insv()
 *
 * Description:   Called to place a byte in a buffer
 *
 * Input:         b - value of R0 on entry
 *                buffer_no - value of R1 on entry
 *
 * Output:        psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x14.
 */

extern os_error *xinsv (byte b,
      buffer_no buffer_no,
      bits *psr);
extern bits insv (byte b,
      buffer_no buffer_no);

/* ------------------------------------------------------------------------
 * Function:      insv_block()
 *
 * Description:   Called to place a block in a buffer
 *
 * Input:         buffer_no - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        end - value of R2 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R1 |= 0x80000000, R9 = 0x14.
 */

extern os_error *xinsv_block (buffer_no buffer_no,
      byte const *data,
      int size,
      byte **end,
      bits *psr);
extern bits insv_block (buffer_no buffer_no,
      byte const *data,
      int size,
      byte **end);

/* ------------------------------------------------------------------------
 * Function:      remv()
 *
 * Description:   Called to remove a byte from a buffer, or examine the
 *                next one - not implemented
 *
 * Input:         buffer_no - value of R1 on entry
 *
 * Output:        examined_b - value of R0 on exit
 *                removed_b - value of R2 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x15.
 */

extern os_error *xremv (buffer_no buffer_no,
      byte *examined_b,
      byte *removed_b,
      bits *psr);
extern bits remv (buffer_no buffer_no,
      byte *examined_b,
      byte *removed_b);

/* ------------------------------------------------------------------------
 * Function:      remv_block()
 *
 * Description:   Called to remove a block from a buffer, or examine it -
 *                not implemented
 *
 * Input:         buffer_no - value of R1 on entry
 *                buffer - value of R2 on entry
 *                byte_count - value of R3 on entry
 *
 * Output:        end - value of R2 on exit
 *                spare - value of R3 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R1 |= 0x80000000, R9 = 0x15.
 */

extern os_error *xremv_block (buffer_no buffer_no,
      byte *buffer,
      int byte_count,
      byte **end,
      int *spare,
      bits *psr);
extern bits remv_block (buffer_no buffer_no,
      byte *buffer,
      int byte_count,
      byte **end,
      int *spare);

/* ------------------------------------------------------------------------
 * Function:      cnpv()
 *
 * Description:   Called to count the entries or the number of free bytes
 *                left in a buffer, or to purge the contents of a buffer -
 *                not implemented
 *
 * Input:         buffer_no - value of R1 on entry
 *
 * Output:        lo8bits - value of R1 on exit
 *                hi24bits - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x16.
 */

extern os_error *xcnpv (buffer_no buffer_no,
      bits *lo8bits,
      bits *hi24bits);
extern void cnpv (buffer_no buffer_no,
      bits *lo8bits,
      bits *hi24bits);

/* ------------------------------------------------------------------------
 * Function:      service_buffer_starting()
 *
 * Description:   Notifies modules that the buffer manager is starting
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x6F.
 */

extern os_error *xservice_buffer_starting (void);
extern void service_buffer_starting (void);

/* ------------------------------------------------------------------------
 * Function:      event_output_buffer_empty()
 *
 * Description:   Output buffer empty
 *
 * Input:         buffer - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x0.
 */

extern os_error *xevent_output_buffer_empty (buffer_no buffer);
extern void event_output_buffer_empty (buffer_no buffer);

/* ------------------------------------------------------------------------
 * Function:      event_input_buffer_full()
 *
 * Description:   Input buffer full
 *
 * Input:         buffer - value of R1 on entry
 *                b - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x1.
 */

extern os_error *xevent_input_buffer_full (buffer_no buffer,
      byte b);
extern void event_input_buffer_full (buffer_no buffer,
      byte b);

/* ------------------------------------------------------------------------
 * Function:      event_input_buffer_full_block_op()
 *
 * Description:   Input buffer full on block operation
 *
 * Input:         buffer - value of R1 on entry
 *                data - value of R2 on entry
 *                count - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x1, R1 |= 0x80000000.
 */

extern os_error *xevent_input_buffer_full_block_op (buffer_no buffer,
      byte *data,
      int count);
extern void event_input_buffer_full_block_op (buffer_no buffer,
      byte *data,
      int count);

/* ------------------------------------------------------------------------
 * Function:      upcall_buffer_filling()
 *
 * Description:   A buffer's free space has become less than its specified
 *                threshold
 *
 * Input:         b - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x8, R2 = 0x0.
 */

extern os_error *xupcall_buffer_filling (buffer_b b);
extern void upcall_buffer_filling (buffer_b b);

/* ------------------------------------------------------------------------
 * Function:      upcall_buffer_emptying()
 *
 * Description:   A buffer's free space has become not less than its
 *                specified threshold
 *
 * Input:         b - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x9, R2 = 0xFFFFFFFF.
 */

extern os_error *xupcall_buffer_emptying (buffer_b b);
extern void upcall_buffer_emptying (buffer_b b);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
