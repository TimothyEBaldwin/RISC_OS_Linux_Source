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
/* Title:   MemMan.h
 * Purpose: Header file for the Memory manager module.
 *
 * Revision History
 * rlougher  Nov 96  Created
 */

#include "kernel.h"

/* The handle structure through which clients access the memory block. */

typedef struct
{
    char *base;
    int  size;
    int  free;
} Handle;

typedef int HandleId;

/* Function prototypes */

_kernel_oserror *initialise_memory(char *name);
_kernel_oserror *release_memory(void);
_kernel_oserror *create_block(int block_size, HandleId *handle);
_kernel_oserror *delete_block(HandleId handle);
_kernel_oserror *extend_block(HandleId handle, int pos, int size);
_kernel_oserror *shrink_block(HandleId handle, int pos, int size);
Handle *get_handle(HandleId handle); /* Note: Pointer may be invalidated by create/delete calls */

void print_info(FILE *out);

