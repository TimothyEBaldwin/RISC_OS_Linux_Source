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
/* File:    memory.h
 * Purpose: Memory allocation for client modules
 * Author:  Kevin Bracey
 * History: 22-Nov-96: KJB:   created
 *
 */

#ifndef __memory_h
#define __memory_h

extern _kernel_oserror *memory_initialise(void);
extern _kernel_oserror *memory_finalise(void);

extern _kernel_oserror *toolbox_memory_swi(_kernel_swi_regs *r);

extern void *mem_base_address(void);
extern void memory_renumber_da(int old_da, int new_da);

extern int memory_validate_address(object_t *);

#endif
