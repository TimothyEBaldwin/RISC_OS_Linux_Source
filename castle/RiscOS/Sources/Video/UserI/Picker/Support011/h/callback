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
#ifndef callback_H
#define callback_H

/* Changed by J R C 16th Aug 1994 to return |os_error *|.
 */

#ifndef os_H
   #include "os.h"
#endif

#ifndef trace_H
   #include "trace.h"
#endif

/* The type of a callback function.
 */
typedef os_error *callback_fn (void *, void *, osbool *);

/* The type of a callback list.
 */
typedef struct callback_l *callback_l;

/* Function to create a new, empty callback list.
 */
extern os_error *callback_new (callback_l *);

/* Function to delete a callback list.
 */
extern os_error *callback_delete (callback_l);

/* Function to make all the callbacks registered in a given list for
 * the given key values.
 *
 * callback_l     the callback list to be scanned
 * void *         a handle to be passed to the functions called
 * int            the number of key values to be matched
 * ...            the keys themselves
 *
 *    Every function registered in the callback list with the given key
 * values will be called, and passed the given handle, until
 * one is claimed.
 */
extern os_error *callback (callback_l, void *, osbool *, int, ...);

/* Function to register a new callback function.
 *
 * callback_l     the callback list to be extended
 * callback_fn *  the function to call
 * void *         a handle to be passed to the function when it is called
 * int            the number of key values provided
 * ...            a list of integer key values
 *
 *    The function and handle will be registered in the callback list.
 */
extern os_error *callback_register (callback_l, callback_fn *, void *,
      int, ...);

/* Function to deregister a callback function. The callback list is
 * scanned for a single match to the (function, handle) pair at the given
 * key values, and it is deleted.
 */
extern os_error *callback_deregister (callback_l, void *, int, ...);

#if TRACE
   extern void callback_trace (callback_l);
#else
   #define callback_trace(l) SKIP
#endif

#endif
