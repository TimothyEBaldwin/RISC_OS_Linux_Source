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
#ifndef m_H
#define m_H

/*m.h - redirection for memory allocation functions*/

/*From CLib*/
#include <stdlib.h>

/*From Support*/
#ifndef realloc_H
   #include "realloc.h"
#endif

#ifndef trace_H
   #include "trace.h"
#endif

/*To use this module, you must call m_ALLOC, m_FREE, m_REALLOC in place
   of malloc, free, realloc at ALL PLACES in the programme. Then it is
   possible to change your allocation discipline by changing the values of
   these macros.*/

#if TRACE
   extern void *m_alloc (char *file, int line, int);

   extern void m_free (char *file, int line, void *ptr, int size);

   extern void *m_realloc (char *file, int line, void *ptr, int old_size,
         int size);

   extern void m_summary (char *file, int line);

   extern void *m_validate_address (char *file, int line, void *ptr);

   #define m_ALLOC(size) \
         m_alloc (__FILE__, __LINE__, size)

   #define m_FREE(ptr, size) \
         m_free (__FILE__, __LINE__, ptr, size)

   #define m_REALLOC(ptr, old_size, size) \
         m_realloc (__FILE__, __LINE__, ptr, old_size, size)

   #define m_SUMMARY() \
         m_summary (__FILE__, __LINE__)

   #define m_VALIDATE_ADDRESS(ptr) \
         m_validate_address (__FILE__, __LINE__, ptr)
#else
   #define m_ALLOC(size)                  malloc (size)
   #define m_FREE(ptr, size)              free (ptr)
   #define m_REALLOC(ptr, old_size, size) REALLOC (ptr, size)
   #define m_SUMMARY()                    SKIP
   #define m_VALIDATE_ADDRESS(ptr)        ((void *) (ptr))
#endif

#endif
