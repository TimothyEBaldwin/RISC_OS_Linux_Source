/* Copyright 1997 Acorn Computers Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the RISCOS library for writing applications in C for RISC OS. It may be  *
 * used freely in the creation of programs for Archimedes. It should be     *
 * used with Acorn's C Compiler Release 3 or later.                         *
 *                                                                          *
 ***************************************************************************/

/*
 * Title  : flex.h
 * Purpose: provide memory allocation for interactive programs requiring
 *          large chunks of store. Such programs must respond to memory
 *          full errors.
 *
 */

#ifndef __flex_h
#define __flex_h

#ifdef __cplusplus
extern "C" {
#endif

typedef void **flex_ptr;


/* ----------------------------- flex_alloc -------------------------------
 * Description:   Allocates n bytes of store, obtained from the Wimp.
 *
 * Parameters:    flex_ptr anchor -- to be used to access allocated store
 *                int n -- number of bytes to be allocated
 * Returns:       0 == failure, 1 == success
 * Other Info:    You should pass the & of a pointer variable as the first
 *                parameter. The allocated store MUST then be accessed
 *                indirectly, through this, ie. (*anchor)[0] ..(*anchor)[n]
 *                This is important since  the allocated store may later be
 *                moved (it's a shifting heap!!). If there's not enough
 *                store returns zero leaving anchor unchanged.
 *
 */

int flex_alloc(flex_ptr anchor, int n);


/* ------------------------------ flex_free -------------------------------
 * Description:   Frees the previously allocated store.
 *
 * Parameters:    flex_ptr anchor -- pointer to allocated store
 * Returns:       void.
 * Other Info:    *anchor will be set to 0.
 *
 */

void flex_free(flex_ptr anchor);


/* ------------------------------- flex_size ------------------------------
 * Description:   Informs caller of the number of bytes allocated
 *
 * Parameters:    flex_ptr -- pointer to allocated store
 * Returns:       number of allocated bytes.
 * Other Info:    None.
 *
 */

int flex_size(flex_ptr);


/* --------------------------- flex_extend --------------------------------
 * Description:   Extend ot truncate the store area to have a new size.
 *
 * Parameters:    flex_ptr -- pointer to allocated store
 *                int newsize -- new size of store
 * Returns:       0 == failure, 1 == success.
 * Other Info:    None.
 *
 */

int flex_extend(flex_ptr, int newsize);


/* --------------------------- flex_midextend -----------------------------
 * Description:   Extend or truncate store, at any point.
 *
 * Parameters:    flex_ptr -- pointer to allocated store
 *                int at -- location within the allocated store
 *                int by -- extent
 * Returns:       0 == failure, 1 == success
 * Other Info:    If by is +ve, then store is extended, and locations above
 *                "at" are copied up by "by".
 *                If by is -ve, then store is reduced, and any bytes beyond
 *                "at" are copied down to "at"+"by".
 *
 */

int flex_midextend(flex_ptr, int at, int by);


/* --------------------------- flex_reanchor ------------------------------
 * Description:   Move the anchor of an allocated block
 *
 * Parameters:    flex_ptr to -- new location of anchor
 *                flex_ptr from -- current location of anchor
 * Returns:       0 == failure, 1 == success
 * Other Info:    The pointer pointed to by "to" is set to point to the
 *                flex block pointed to by "from", and "to" becomes the
 *                new anchor. The block should then only be accessed via
 *                "to". To ensure this, from is set to NULL.
 *
 */

int flex_reanchor(flex_ptr to, flex_ptr from);


/* ---------------------------- flex_set_budge ----------------------------
 * Description:    Set whether to move the flex store when the C runtime
 *                 needs to extend the heap
 *
 * Parameters:     int newstate -- whether to budge
 * Returns:        previous state
 * Other Info:     If 0 is passed, if the C library needs to extend the
 *                 heap, flex will refuse to move. This means that you can
 *                 rely on pointers into flex blocks across function calls.
 *                 This is the DEFAULT state after flex_init().
 *                 If 1 is passed, this will cause flex store to be moved
 *                 up if the C library needs to extend the heap.  Note that
 *                 in this state, you can only rely on pointers into flex
 *                 blocks across function calls which do not extend the
 *                 stack and do not call malloc.
 *                 If -1 is passed, no change is made.
 *                 Whatever parameter is passed, flex_set_budge will return
 *                 the previous state, suitable for another call to
 *                 flex_setbudge.
 *
 *                 On a machine with dynamic areas, this function is
 *                 useless and harmless.
 *
 */

extern int flex_set_budge(int newstate);


/* ---------------------------- flex_init ---------------------------------
 * Description:   Initialise store allocation module.
 *
 * Parameters:    char *program_name - name of program
 *                int  *error_fd     - messages file fd.
 *                int  dynamic_size  - max size of dynamic area or 0 to use
 *                                     wimp slot.
 * Returns:       dynamic area number in use, or zero for no DA.
 * Other Info:    Must be called before any other functions in this module.
 *                program_name must point at a character string
 *                whose lifetime is the entire program (eg a string
 *                literal, or static buffer).
 *                error_fd is a pointer to a file descriptor as returned
 *                by MessageTrans_OpenFile - it will be used to report flex
 *                errors.  If it is 0, then English default messages are used.
 *
 */

int flex_init(char *program_name, int *error_fd, int dynamic_size);


/* ---------------------------- flex_save_heap_info -----------------------
 * Description:   Appends information about the flex heap to the passed
 *                file.
 *
 * Parameters:    filename.
 *
 */

void flex_save_heap_info(char * filename);


/* ---------------------------- flex_compact ------------------------------
 * Description:   Compacts the flex heap
 *
 * Returns:       0 = compaction complete
 *                1 = needs further compaction (currently never occurs)
 */

int flex_compact(void);


/* ---------------------------- flex_set_deferred_compaction --------------
 * Description:   Sets whether flex should compact its heap on every
 *                flex_free or on flex_alloc and flex_compact, flex_budge
 *                and flex_extend
 *
 * Parameters:    0 = compact on frees
 *                1 = defer compaction
 *
 * Returns:       previous state.
 */

int flex_set_deferred_compaction(int newstate);

#ifdef __cplusplus
}
#endif

#endif

/* end flex.h */
