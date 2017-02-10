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
/* File:        mem.h
 * Purpose:     memory allocation in the Toolbox
 * Author:      Ian Johnson
 * History:     6-Aug-93: IDJ: created
 */



/*
 * This is a central memory allocation place for the Toolbox core module.
 * A doubly-linked list of all allocated blocks is kept (maybe remove this
 * if using too much memory!).
 * To enable debugging of memory allocation, the calling functions should be
 * compiled without -ff, so that fn names are in the code area.  Compile
 * this code with -DDEBUG_MEMORY.
 * Memory tracing is turned on by setting the letter 'm' in the central
 * debug string (got by calling debugging('m')).
 *
 * Calling code will always call the debugging versions eg
 *       b = memory_allocate (1024, &fn, "some extra info");
 * Macros ensure the debugging code is removed.
 *
 */

#ifndef __mem_h
#define __mem_h


extern void mem_free_all (void);
extern void mem_init (void);



extern void mem_i_am_the_toolbox (void);

/*
 * Description:  for internal use by the Toolbox module ONLY.
 *               in order to enable it to initialise the mem library
 *               correctly.
 *
 * Parameters:   None
 *
 * Returns:      void
 *
 */



#define CHECK_HEAP       (1u << 0)
#define CHECK_NONZERO    (1u << 1)



#ifdef DEBUG_MEMORY

extern void mem_chk (void *p, unsigned int flags, int line, char *file);
#define mem_chk(p,f) mem_chk ((void *)p, f, __LINE__, __FILE__)

/*
 * Description:  checks a memory pointer.
 *
 * Parameters:   p      - the pointer
 *               flags  - what sort of checking
 *               line   - line number in source file
 *               file   - source filename
 *
 * Returns:      void
 *
 */


extern void mem_print_list (void);

/*
 * Description:  prints out all allocated memory blocks.
 *
 * Parameters:   none
 *
 * Returns:      void
 *
 */

extern void mem_free (void *block, char *msg);

/*
 * Description:  frees a block of memory.
 *
 * Parameters:   void *block  - the block to be freed
 *               char *msg    - informational message from caller
 *
 * Returns:      void
 *
 */

extern void *mem_allocate(unsigned int size, char *tag);

/*
 * Description:  allocates block of memory of 'size' bytes, with debug
 *               info - size, name of calling fn, and tag.
 *
 * Parameters:   unsigned int size  - size of block to be allocated
 *               char *tag          - extra info to be stored in block
 *                                    (eg line nunber of caller?)
 *
 * Returns:      pointer to allocated block (without header).
 *
 */

extern void *mem_extend(void *p, int by);

/*
 * Description:  extends an existing block block of memory by "by" bytes,
 *               with debug info.
 *
 * Parameters:   void *p   - the previously allocated block
 *               int by    - amount of bytes to extend by
 *
 * Returns:      pointer to extended block (without header).
 *
 */


#else

#define mem_print_list()  ((void)0)
#define mem_chk(p,f) ((void)0)

extern void mem_free (void *block);
#define mem_free(a,b) mem_free(a)

/*
 * Description:  frees a block of memory.
 *
 * Parameters:   void *block  - the block to be freed
 *
 * Returns:      void
 *
 */

extern void *mem_allocate (unsigned int size);
#define mem_allocate(a,b) mem_allocate(a)

/*
 * Description:  allocates block of memory of 'size' bytes.
 *
 * Parameters:   unsigned int size  - size of block to be allocated
 *
 * Returns:      pointer to allocated block (without header).
 *
 */

extern void *mem_extend(void *p, int by);
#define mem_extend(a,b) mem_extend(a,b)

/*
 * Description:  extends an existing block block of memory by "by" bytes.
 *
 * Parameters:   void *p   - the previously allocated block
 *               int by    - amount of bytes to extend by
 *
 * Returns:      pointer to extended block (without header).
 *
 */

#endif

#endif
