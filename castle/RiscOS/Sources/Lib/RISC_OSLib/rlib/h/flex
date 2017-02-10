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
 * Title  : flex.h
 * Purpose: provide memory allocation for interactive programs requiring
 *          large chunks of store. Such programs must respond to memory
 *          full errors.
 *
 */

#ifndef __flex_h
#define __flex_h

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
 * Other Info:    *anchor will be set to NULL.
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
 * Description:   Extend or truncate the store area to have a new size.
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


/* ---------------------------- flex_init ---------------------------------
 * Description:   Initialise store allocation module.
 *
 * Parameters:    void.
 * Returns:       void.
 * Other Info:    Must be called before any other functions in this module.
 *
 */

void flex_init(void);

#endif

/* end flex.h */
