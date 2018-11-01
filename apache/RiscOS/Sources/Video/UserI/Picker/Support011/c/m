/* Copyright 1996 Acorn Computers Ltd
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
/*m.c - redirection for memory allocation functions*/

#undef  TRACE
#define TRACE 1

#if TRACE
/*#define XTRACE*/
#endif

/*From CLib*/
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*From OSLib*/
#include "macros.h"
#include "os.h"
#include "wimp.h"

/*From Support*/
#include "m.h"
#include "riscos.h"
#include "trace.h"

#define JUNK 0xA5 /*used to initialise and clear blocks*/
#define GUARD 0xACCE55ED /*set at the head of each block*/
#define EXTRA 4 /*bytes extra on each block*/

#define m_ASSERT(file, line, c) \
      (!(c)? m_assert (file, line, #c): (void) 0)

typedef struct Block *Block;

struct Block
   {  int guard;
      Block next;
      Block prev;
      int size;
      char *file;
      int line;
      char (data) [UNKNOWN];
   };

#define BLOCK(N) \
      struct \
         {  int guard; \
            Block next; \
            Block prev; \
            int size; \
            char *file; \
            int line; \
            char (data) [N]; \
         }

#define sizeof_BLOCK(N) \
      (offsetof (struct Block, data) + (N)*sizeof ((Block) NULL)->data)

static int Byte_Count = 0, Block_Count = 0;

static Block List;
/*------------------------------------------------------------------------*/
static void m_assert (char *file, int line, char *msg)

{  os_error error;

   trace_f (file, line, "m_assert %s\n", msg);

   error.errnum = 1;
   sprintf (error.errmess, "%s,%d: Assertion failure: %s",
         file, line, msg);

   xwimp_report_error (&error, NONE, "Colour Picker", NULL);
}
/*------------------------------------------------------------------------*/
static void Check (char *file, int line)

{  Block block;
   int count = 0, size = 0, i;

#ifdef XTRACE
   trace_f (file, line, "m: Check\n");
#endif

   /*To check the list in order of allocation, first find its start.*/
   block = List;
   if (block != NULL)
      while (block->prev != NULL)
         block = block->prev;

   /*Then scan through it.*/
   while (block != NULL)
   {  count++;
      size += block->size;

      m_ASSERT (file, line, block->guard == GUARD);
      m_ASSERT (file, line, block->size != 0);
      m_ASSERT (file, line, strlen (block->file) < FILENAME_MAX);

      if (block->next != NULL)
         m_ASSERT (file, line, block->next->prev == block);

      if (block->prev != NULL)
         m_ASSERT (file, line, block->prev->next == block);

      for (i = 0; i < EXTRA; i++)
         m_ASSERT (file, line, block->data [block->size + i] == JUNK);

      block = block->next;
   }

   m_ASSERT (file, line, count == Block_Count);
   m_ASSERT (file, line, size == Byte_Count);
}
/*------------------------------------------------------------------------*/
void *m_alloc (char *file, int line, int size)

{  Block block;

   Check (file, line);

   if (size != 0 && (block = malloc (sizeof_BLOCK (size + EXTRA))) != NULL)
   {  Block_Count++;
      Byte_Count += size;

      /*guard*/
      block->guard = GUARD;

      /*next*/
      block->next = NULL;

      /*prev*/
      block->prev = List;

      /*size*/
      block->size = size;

      /*file*/
      block->file = file;

      /*line*/
      block->line = line;

      /*data*/
      memset (block->data, JUNK, size + EXTRA);

      /*Link it to the rest of the world.*/
      if (List != NULL) List->next = block;
      List = block;

   #ifdef XTRACE
      trace_f (file _ line _ "m_ALLOC (%d) -> 0x%X\n" _
            size _ block->data);
   #endif
      return block->data;
   }
   else
   {  /*0 bytes requested, or allocation failed.*/
   #ifdef XTRACE
      trace_f (file _ line _ "m_ALLOC (%d): no store\n" _ size);
   #endif
      return NULL;
}  }
/*------------------------------------------------------------------------*/
void m_free (char *file, int line, void *ptr, int size)

{  Block block;

   NOT_USED (file) /*maybe*/
   NOT_USED (line) /*maybe*/
   NOT_USED (size)

   Check (file, line);

   if (ptr != NULL)
   {  /*block->data == ptr, therefore*/
      block = (Block) ((char *) ptr - offsetof (struct Block, data));

      if (block->next != NULL)
         block->next->prev = block->prev;

      if (block->prev != NULL)
         block->prev->next = block->next;

      if (List == block) List = block->prev;

      Block_Count--;
      Byte_Count -= block->size;

      memset (block, JUNK, sizeof_BLOCK (block->size));

      free (block);

   #ifdef XTRACE
      trace_f (file _ line _ "m_FREE (0x%X)\n" _ ptr);
   #endif
   }
   else
   {
   #ifdef XTRACE
      trace_f (file _ line _ "m_FREE (NULL)\n");
   #endif
}  }
/*------------------------------------------------------------------------*/
void *m_realloc (char *file, int line, void *ptr, int old_size, int size)

{  if (ptr != NULL && size != 0)
   {  void *tmp;

      if ((tmp = m_alloc (file, line, size)) == NULL)
         return NULL;

      memcpy (tmp, ptr, size);

      m_free (file, line, ptr, old_size);

      return tmp;
   }
   else if (size != 0)
      return m_alloc (file, line, size);
   else
   {  /*ptr != NULL*/
      m_free (file, line, ptr, old_size);
      return NULL;
}  }
/*------------------------------------------------------------------------*/
void m_summary (char *file, int line)

{  Block block;
   int i = 0, size = 0;

   trace_f (file _ line _ "m_SUMMARY\n");

   Check (file, line);

   /*To print out the list in order of allocation, first find its start.*/
   block = List;
   if (block != NULL)
      while (block->prev != NULL)
         block = block->prev;

   /*Then scan through it.*/
   while (block != NULL)
   {  if (i%20 == 0)
         trace_f (NULL _ 0 _ "   %-*s   %*s   %s,%s\n" _
               DEC_WIDTH _ "block no" _ DEC_WIDTH _ "bytes" _
               "file" _ "line");

      trace_f (NULL _ 0 _ "   %-*d   %*d   %s,%d\n" _
            DEC_WIDTH _ i _ DEC_WIDTH _ block->size _
            block->file _ block->line);

      i++;
      size += block->size;
      block = block->next;
   }

   trace_f (file _ line _ "total: Block_Count %d, Byte_Count %d\n" _
         Block_Count _ Byte_Count);

   m_ASSERT (file, line, i == Block_Count);
   m_ASSERT (file, line, size == Byte_Count);
}
/*------------------------------------------------------------------------*/
void *m_validate_address (char *file, int line, void *ptr)

{  Block block;

   trace_f (file _ line _ "m_VALIDATE_ADDRESS\n");

   Check (file, line);

   /*Scan through it.*/
   for (block = List; block != NULL; block = block->prev)
      if ((void *) block->data <= ptr &&
            ptr < (void *) &block->data [block->size])
         return ptr;

   abort ();
   return SKIP;
}
