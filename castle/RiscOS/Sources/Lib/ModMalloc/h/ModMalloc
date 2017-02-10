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
/*
For use by module apps which use malloc. malloc tries to use app memory
if called from user mode, so will always return 0 if the module app has
zero app space.

These malloc replacements use OS_Module 6/7 instead.

Due to problems with atexit() in module code, ModMalloc doesn't do a
'atexit( ModMalloc_FreeAll)', which would ensure all allocated memory
was freed. Instead, your module finalisation code should call
ModMalloc_FreeAll explicitly.
 */

#ifndef __ModMalloc_ModMalloc_h
#define __ModMalloc_ModMalloc_h

#include <stddef.h>

void*	ModMalloc_Malloc( size_t size);
void	ModMalloc_Free( void* ptr);
void*	ModMalloc_Realloc( void* ptr, size_t newsize);
void*	ModMalloc_Calloc( size_t n, size_t size);

void	ModMalloc_FreeDownTo( void* first);
/*
Starts freeing blocks, starting with most recent, up till and including
'first'.

Thus:

a = ModMalloc( 40*sizeof( int*));
for ( i=0; i<40; i++)	a[i] = ModMalloc( 30);
...
ModMalloc_FreeDownTo( a);

- will allocate an array and then free it completely.

Note that this won't work if a is reallocated.
 */

void	ModMalloc_FreeAll( void);
/*
Frees all blocks. Equivalent to ModMalloc_FreeDownTo( NULL);
 */


#endif
