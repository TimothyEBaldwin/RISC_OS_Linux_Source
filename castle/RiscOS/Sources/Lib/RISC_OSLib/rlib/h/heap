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
/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the RISCOS library for writing applications in C for RISC OS. It may be  *
 * used freely in the creation of programs for Archimedes. It should be     *
 * used with Acorn's C Compiler Release 3 or later.                         *
 *                                                                          *
 ***************************************************************************/
/*
 * Title:   heap.h
 * Purpose: provide malloc-style heap allocation in a flex block
 *
 */

# ifndef __heap_h
# define __heap_h

# ifndef __os_h
# include "os.h"
# endif


/* ---------------------------- heap_init ----------------------------------
 * Description:   Initialises the heap allocation system.
 *
 * Parameters:    BOOL heap_shrink -- if TRUE, the flex block will be shrunk
 *                                    when possible after heap_free()
 * Returns:       void.
 * Other Info:    You must call flex_init before calling this routine.
 *
 */

void heap_init(BOOL heap_shrink);


/* ---------------------------- heap_alloc ---------------------------------
 * Description:   Allocates a block of storage from the heap.
 *
 * Parameters:    unsigned int size -- size of block to be allocated
 * Returns:       pointer to allocated block (or 0 if failed).
 * Other Info:    This uses the flex module to allocate wimp-supplied heap
 *                space. If the heap moves as the result of an extension
 *                or flex can't extend the heap then 0 is returned.
 *
 */

void *heap_alloc(unsigned int size);


/* ---------------------------- heap_free ----------------------------------
 * Description:   Free previously allocated block of heap storage.
 *
 * Parameters:    void *heapptr -- pointer to block to be freed
 * Returns:       possible error condition.
 * Other Info:    none.
 *
 */

void heap_free(void *heapptr);

#endif

/* end of heap.h */
