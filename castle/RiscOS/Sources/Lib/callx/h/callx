/* This source code in this file is licensed to You by Castle Technology
 * Limited ("Castle") and its licensors on contractual terms and conditions
 * ("Licence") which entitle you freely to modify and/or to distribute this
 * source code subject to Your compliance with the terms of the Licence.
 * 
 * This source code has been made available to You without any warranties
 * whatsoever. Consequently, Your use, modification and distribution of this
 * source code is entirely at Your own risk and neither Castle, its licensors
 * nor any other person who has contributed to this source code shall be
 * liable to You for any loss or damage which You may suffer as a result of
 * Your use, modification or distribution of this source code.
 * 
 * Full details of Your rights and obligations are set out in the Licence.
 * You should have received a copy of the Licence with this source code file.
 * If You have not received a copy, the text of the Licence is available
 * online at www.castle-technology.co.uk/riscosbaselicence.htm
 */
/* File:    callx.h
 * Purpose: Interface to callx library
 * Author:  Ben Laughton
 * History:
 *
 * 1997-08-17: BAL
 * Created.
 */

#ifndef callx_h
#define callx_h

/* =============================================================================
 * Include header files
 */

/* CLib */
#include "kernel.h"




/* =============================================================================
 * Define types
 */

/* Return code not currently used.  All handlers should return NULL */
typedef _kernel_oserror* (*callx_handler_fn) (_kernel_swi_regs *  r,
                                              void *              pw,
                                              void *              handle);




/* =============================================================================
 * Declare function prototypes
 */

#ifdef __cplusplus
extern "C"
{
#endif

extern void callx_init (void *const pw);

extern _kernel_oserror *callx_add_callback (callx_handler_fn handler,
                                            void *data);

extern _kernel_oserror *callx_add_callback_irqsoff (callx_handler_fn handler,
                                            void *data);

extern _kernel_oserror *callx_remove_callback (callx_handler_fn handler,
                                               void *data);

extern _kernel_oserror *callx_remove_all_callbacks (void);

extern _kernel_oserror *callx_add_callafter (const unsigned int time,
                                             callx_handler_fn handler,
                                             void *data);

extern _kernel_oserror *callx_remove_callafter (callx_handler_fn handler,
                                                void *data);

extern _kernel_oserror *callx_remove_all_callafters (void);

extern _kernel_oserror *callx_add_callevery (const unsigned int time,
                                             callx_handler_fn handler,
                                             void *data);

extern _kernel_oserror *callx_remove_callevery (callx_handler_fn handler,
                                                void *data);

extern _kernel_oserror *callx_remove_all_calleverys (void);

#ifdef __cplusplus
}
#endif

#endif
