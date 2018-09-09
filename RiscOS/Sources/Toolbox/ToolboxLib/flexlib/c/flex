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
/* Title  > c.flex
 * Purpose: provide memory allocation for interactive programs requiring
 *          large chunks of store. Such programs must respond to memory
 *          full errors, and must not suffer from fragmentation.
 * Version: 0.1
 */

/*#define TRACE*/

/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the "cwimp" library for writing applications in C for RISC OS. It may be *
 * used freely in the creation of programs for Archimedes. It should be     *
 * used with Acorn's C Compiler Release 2 or later.                         *
 *                                                                          *
 * No support can be given to programmers using this code and, while we     *
 * believe that it is correct, no correspondence can be entered into        *
 * concerning behaviour or bugs.                                            *
 *                                                                          *
 * Upgrades of this code may or may not appear, and while every effort will *
 * be made to keep such upgrades upwards compatible, no guarantees can be   *
 * given.                                                                   *
 ****************************************************************************/

/*
 * Change list:
 *   18-Nov-88: If setting the slotsize fails, the original value is restored
 *   05-Dec-89: The concept of "budging" added. This allows the underlying C system to ask
 *     flex to move its base of memory up or down by an arbitrary amount. This
 *     allows malloc to grow and (if necessary) shrink.
 *   17-Sep-97: Defered compaction support added.
 */

#define BOOL int
#define TRUE 1
#define FALSE 0

#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <stdio.h>
#include "kernel.h"
#include "swis.h"

#include "opts.h"
#include "flex.h"
#include "swiextra.h"

/* 'Big' magic number for specifying that there is no free space in the flex heap */
#define NO_COMPACTION_NEEDED 0x7fffffff
/* Auto compaction will only take place if this amount of free space or more is in the flex heap */
#define AUTO_COMPACT_SIZE    (32*1024)

#ifdef TRACE
  static FILE *debugfileptr;
#endif

static int  flex__initialised = 0;
static char *program_name = 0;
static int  *error_fd = 0;

#define MSGS_flex1 "flex1", "Flex memory error"
#define MSGS_flex2 "flex2", "Not enough memory, or not within *desktop world"
#define MSGS_flex3 "flex3", "Flex not initialised"

/* internal versions of RISC_OSLib functions which report errors */

static void werr(int fatal, char* format, ...)

{ va_list va;
  _kernel_oserror e;
  _kernel_swi_regs r;

  e.errnum = 0;
  va_start (va, format);
  vsprintf (e.errmess, format, va);
  va_end (va);

  r.r[0] = (int)&e;
  r.r[1] = 1;
  r.r[2] = (int)program_name;
  _kernel_swi(Wimp_ReportError, &r, &r);
  if (fatal) exit (EXIT_FAILURE);
}


static char *msgs_lookup(char *tag, char *dft)
{
    _kernel_swi_regs r;
    char             buffer[128];   /* buffer for result - 128 should be plenty big enough */

    if (error_fd == 0)
        return dft;

    r.r[0] = (int)error_fd;
    r.r[1] = (int)tag;
    r.r[2] = (int)buffer;
    r.r[3] = 128;
    r.r[4] = r.r[5] = r.r[6] = r.r[7] = 0;
    if (_kernel_swi (MessageTrans_Lookup, &r, &r) != NULL)
        return dft;
    else
        return (char *)r.r[2];
}


/* This implementation goes above the original value of GetEnv,
to memory specifically requested from the Wimp (about which the
standard library, and malloc, know nothing). The heap is kept
totally compacted all the time, with pages being given back to
the Wimp whenever possible. */

typedef struct {
  flex_ptr anchor;      /* *anchor should point back to here. */
  int size;             /* in bytes. Exact size of logical area. */
                        /* then the actual store follows. */
} flex__rec;

static void flex__fail(int i)
{
  werr(TRUE, msgs_lookup(MSGS_flex1));

  i = i; /* avoid compiler warning. */

}

static void flex__check(void)
{
  if(flex__initialised == 0)
    werr(TRUE, msgs_lookup(MSGS_flex3));
}


/* IDJ macro to avoid stack usage */
#define roundup(n)  (0xfffffffc & (n + 3))

static char       * flex__base;           /* lowest flex__rec - only for budging, marking of freed     */
                                          /* blocks and debug output.                                  */
static int          flex__area_num;       /* number of allocated dynamic area (0 => using appspace).   */
static char       * flex__freep;          /* free flex memory.                                         */
static char       * flex__lim;            /* limit of flex memory.                                     */

static unsigned int flex_to_compact;      /* offset from base of flex block to first free block.       */
                                          /* or NO_COMPACTION_NEEDED if there are no free blocks.      */
static char         flex_needscompaction; /* = 1 if compaction is deferred until allocations or        */
                                          /* compaction requests.                                      */
static int          flex_freed_size;      /* Amount of freed data currently in heap                    */

/* From base upwards, it's divided into store blocks of */
/*  a flex__rec                                         */
/*  the space                                           */
/*  align up to next word.                              */

static void flex__wimpslot(char **top)
{
  /* read/write the top of available memory. *top == 0 -> just read. */
  int slot = ((int) *top);
  _kernel_oserror  *err;
  int memlim, appspace, oldmemlim;

  if (slot != -1) slot -= 0x8000;

  /* read memory limit value */
   err = _swix(OS_ChangeEnvironment, _INR(0,2)|_OUT(1), 0, 0, 0, &memlim);
   oldmemlim = memlim;

  /* read appspace value */
   err = _swix(OS_ChangeEnvironment, _INR(0,2)|_OUT(1), 14, 0, 0, &appspace);

  /* set memory limit before slot size change ... */
   if(appspace > memlim)
      err = _swix(OS_ChangeEnvironment, _INR(0,2), 0, appspace, 0);

  /* set wimpslot size  */
   err =_swix(Wimp_SlotSize, _INR(0,1)|_OUT(0), slot, -1, &slot);
  *top = (char*) slot + 0x8000;

  /* .... and set memory limit back again */
  if (appspace > memlim)
      err = _swix(OS_ChangeEnvironment, _INR(0,2), 0, oldmemlim, 0);

}



static BOOL flex__more(int n)
{
  /* Tries to get at least n more bytes, raising flex__lim and
  returning TRUE if it can. */
  char *prev = flex__lim;
  int got = 0;

  if (flex__area_num)
  {
     if (_swix(OS_ChangeDynamicArea, _INR(0,1)|_OUT(1), flex__area_num, n, &got))
        return FALSE;

     flex__lim += got;
  }
  else
  {
     flex__lim += n;
     flex__wimpslot(&flex__lim);
  }

  if (flex__lim < prev + n)
  {
   flex__lim = prev;             /* restore starting state:
                                    extra memory is useless */
   if (flex__area_num)
   {
     _swix(OS_ChangeDynamicArea, _INR(0,1), flex__area_num, -got);
   }
   else
     flex__wimpslot(&flex__lim);
   return FALSE ;
  }
  else return TRUE ;
}

static void flex__give(void)
{
  /* Gives away memory, lowering flex__lim, if possible. */

  if (flex__area_num)
  {
    int n = flex__lim - flex__freep;
    _swix(OS_ChangeDynamicArea, _INR(0,1)|_OUT(1), flex__area_num, -n, &n);
    flex__lim -= n;
  }
  else
  {
    flex__lim = flex__freep;
    flex__wimpslot(&flex__lim);
  }
}

static BOOL flex__ensure(int n)
{
  n -= flex__lim - flex__freep;
  if (n <= 0 || flex__more(n)) return TRUE; else return FALSE;
}

/*************************************************/
/* flex_alloc()                                  */
/*                                               */
/* Allocates n bytes of store, obtained from the */
/* Wimp.                                         */
/*                                               */
/* Parameters: flex_ptr anchor -- to be used to  */
/*             access allocated store            */
/*             int n -- number of bytes to be    */
/*             allocated                         */
/*                                               */
/* Returns:    0 == failure, 1 == success        */
/*************************************************/

BOOL flex_alloc(flex_ptr anchor, int n)
{
  flex__rec *p;

  #ifdef TRACE
    if (debugfileptr) fprintf(debugfileptr, "flex_alloc called\n");
  #endif

  flex__check();

  if (flex_to_compact != NO_COMPACTION_NEEDED &&
      flex_freed_size > AUTO_COMPACT_SIZE) flex_compact();

  if (n < 0 || ! flex__ensure(sizeof(flex__rec) + roundup(n)))
  {
    *anchor = 0;

    #ifdef TRACE
      if (debugfileptr) fprintf(debugfileptr, "flex_alloc unsuccessfully called\n");
    #endif


    return FALSE;
  };

  p = (flex__rec*) flex__freep;
  flex__freep += sizeof(flex__rec) + roundup(n);

  p->anchor = anchor;
  p->size = n;
  *anchor = p + 1; /* sizeof(flex__rec), that is */

  #ifdef TRACE
    if (debugfileptr) fprintf(debugfileptr, "flex_alloc finished\n");
  #endif

  return TRUE;
}


static void flex__reanchor(flex__rec *p, int by)
{
  /* Move all the anchors from p upwards. This is in anticipation
  of that block of the heap being shifted. */

  while (1)
  {
    if ((int) p >= (int) flex__freep) break;
    if (p->anchor) /* anchor == NULL when marked as freed */
    {
      if (*(p->anchor) != p + 1)
      {
        #ifdef TRACE
          if (debugfileptr) fprintf(debugfileptr, "Failed in flex_reanchor\n");
        #endif
        flex__fail(6);
      }
      *(p->anchor) = ((char*) (p + 1)) + by;
    }
    p = (flex__rec*) (((char*) (p + 1)) + roundup(p->size));
  };
}

/*************************************************/
/* flex_free()                                   */
/*                                               */
/* Frees the previously allocated store.         */
/* or flags the item as freed.                   */
/* In the second case the item will only be      */
/* properly freed at a later date when requested */
/* or when an allocation is done                 */
/*                                               */
/* Parameters: flex_ptr anchor -- pointer to     */
/*             allocated store                   */
/*************************************************/

void flex_free(flex_ptr anchor)
{
  flex__rec *p = ((flex__rec*) *anchor) - 1; /* Make p point to the flex structure for anchor */
  int roundsize = roundup(p->size);
  flex__rec *next = (flex__rec*) (((char*) (p + 1)) + roundsize);
  #ifdef TRACE
    if (debugfileptr) fprintf(debugfileptr, "flex_free called\n");
  #endif

  flex__check();

  if (p->anchor != anchor)
  {
    #ifdef TRACE
      if (debugfileptr) fprintf(debugfileptr, "Failed in flex_free\n");
    #endif
    flex__fail(0);
  }

  if (flex_needscompaction)
  {
    *anchor    = NULL; /* set anchor to null */
    p->anchor  = NULL; /* Flag item as freed */

    /* Join adjacent free blocks */

    /* If there could be a next block */
    if ((char*)next < flex__freep)
    {
      /* If next block is a free block */
      if (!next->anchor)
      {
        p->size = roundup(p->size) + sizeof(flex__rec) + roundup(next->size);
        #ifdef TRACE
          if (debugfileptr) fprintf(debugfileptr, "Free blocks joined\n");
        #endif
      }
    }

    if (flex_to_compact > ((char*)p - (char*)flex__base))
        flex_to_compact = ((char*)p - (char*)flex__base);

    flex_freed_size += p->size + sizeof(flex__rec);
  }
  else
  {
    /* Immediately free item and shuffle items down in heap */

    flex__reanchor(next, - (sizeof(flex__rec) + roundsize));
    memmove(p, next, flex__freep - (char*) next);
    flex__freep -= sizeof(flex__rec) + roundsize;
    flex__give();
    *anchor = 0;
  }

  #ifdef TRACE
    if (debugfileptr) fprintf(debugfileptr, "flex_free finished\n");
  #endif
}



/*************************************************/
/* flex_compact()                                */
/*                                               */
/* Compacts the flex heap removing all items     */
/* flagged as requiring freed                    */
/*************************************************/

int flex_compact(void)
{
  flex__rec *p, *target, *next;
  int shrinkage = 0;

  flex__check();

  #ifdef TRACE
    if (debugfileptr) fprintf(debugfileptr, "flex_compact started\n");
  #endif

  if (flex_to_compact != NO_COMPACTION_NEEDED)
  {
    p = (flex__rec*)(((char*)flex__base) + flex_to_compact);
    target = p;                                                         /* Target points to first free */

    while((char *)p < flex__freep)                                  /* While still inside flex heap */
    {
      #ifdef TRACE
        if (debugfileptr)
        {
          fprintf(debugfileptr, "Flex block at %p\n", p);
          fprintf(debugfileptr, "anchor: %p\n", p->anchor);
          if (p->anchor)
          {
            fprintf(debugfileptr, "*anchor: %p (should be same as %p)\n", *p->anchor, p+1);
          }
          else
          {
            fprintf(debugfileptr, "Freed block\n");
          }
          fprintf(debugfileptr, "size  : %d\n", p->size);
        }
      #endif

      next = (flex__rec*) (((char*) (p + 1)) + roundup(p->size));

      if (p->anchor)                                                              /* Non free block */
      {
        if ((p + 1) == *p->anchor)                                                /* Is anchor correctly linked */
        {
          *(p->anchor) = ((char*)target) + sizeof(flex__rec);                     /* move anchor point */
          memmove(target, p, roundup(p->size) + sizeof(flex__rec));
          target = (flex__rec*) (((char*) (target + 1)) + roundup(target->size)); /* Move target to after moved item */
        }
        else
        {
          #ifdef TRACE
            if (debugfileptr) fprintf(debugfileptr, "Failed in flex_compact\n");
          #endif
          flex__fail(0);
        }
      }
      else
      {
        /* Found a free block */
        shrinkage += (sizeof(flex__rec) + roundup(p->size));
      }
      p = next; /* Move p to next item in flex heap */
    }

    flex__freep -= shrinkage;
    flex__give(); /* Give back free memory */
    flex_to_compact = NO_COMPACTION_NEEDED;
    flex_freed_size = 0;
  }

  #ifdef TRACE
    if (debugfileptr) fprintf(debugfileptr, "flex_compact finished\n");
  #endif
  return 0; /* Compaction complete */
}

/*************************************************/
/* flex_size()                                   */
/*                                               */
/* Informs caller of the number of bytes         */
/* allocated                                     */
/*                                               */
/* Parameters: flex_ptr -- pointer to allocated  */
/*             store                             */
/*                                               */
/* Returns:    number of allocated bytes.        */
/*************************************************/

int flex_size(flex_ptr anchor)
{
  flex__rec *p = ((flex__rec*) *anchor) - 1;

  flex__check();
  if (p->anchor != anchor)
  {
    #ifdef TRACE
      if (debugfileptr) fprintf(debugfileptr, "Failed in flex_size\n");
    #endif
    flex__fail(4);
  }

  return(p->size);
}

/*************************************************/
/* flex_extend()                                 */
/*                                               */
/* Extend or truncate the store area to have a   */
/* new size.                                     */
/*                                               */
/* Parameters: flex_ptr -- pointer to allocated  */
/*             store                             */
/*             int newsize -- new size of store  */
/*                                               */
/* Returns:    0 == failure, 1 == success.       */
/*************************************************/

int flex_extend(flex_ptr anchor, int newsize)
{
  flex__rec *p = ((flex__rec*) *anchor) - 1;
  flex__check();

  return(flex_midextend(anchor, p->size, newsize - p->size));
}

/*************************************************/
/* flex_midextend()                              */
/*                                               */
/* Extend or truncate store, at any point.       */
/*                                               */
/* Parameters: flex_ptr -- pointer to allocated  */
/*             store                             */
/*             int at -- location within the     */
/*             allocated store                   */
/*             int by -- extent                  */
/*                                               */
/* Returns:    0 == failure, 1 == success        */
/*************************************************/

BOOL flex_midextend(flex_ptr anchor, int at, int by)
{
  flex__rec *p;
  flex__rec *next;

  flex__check();

  if (flex_to_compact != NO_COMPACTION_NEEDED &&
      flex_freed_size >  AUTO_COMPACT_SIZE &&
      by >= 0) flex_compact();

  p = ((flex__rec*) *anchor) - 1;

  if (p->anchor != anchor)
  {
    #ifdef TRACE
      if (debugfileptr) fprintf(debugfileptr, "Failed in flex_midextend (1)\n");
    #endif
    flex__fail(1);
  }

  if (at > p->size)
  {
    #ifdef TRACE
      if (debugfileptr) fprintf(debugfileptr, "Failed in flex_midextend (2)\n");
    #endif
    flex__fail(2);
  }

  if (by < 0 && (-by) > at)
  {
    #ifdef TRACE
      if (debugfileptr) fprintf(debugfileptr, "Failed in flex_midextend (3)\n");
    #endif
    flex__fail(3);
  }

  if (by == 0)
  {
    /* size to change by is zero so do nothing */
  }
  else
  {
    if (by > 0)
    { /* extend */
      int growth = roundup(p->size + by) - roundup(p->size);
      /* Amount by which the block will actually grow. */

      if (!flex__ensure(growth))
      {
        /* Cannot get extra memory required */
        return FALSE;
      }

      next = (flex__rec*) (((char*) (p + 1)) + roundup(p->size));
      /* The move has to happen in two parts because the moving
      of objects above is word-aligned, while the extension within
      the object may not be. */

      flex__reanchor(next, growth);

      memmove(((char*) next) + roundup(growth), next, flex__freep - (char*) next);

      flex__freep += growth;

      memmove(((char*) (p + 1)) + at + by, ((char*) (p + 1)) + at, p->size - at);
      p->size += by;

      /* If using deferred compaction and the offset to the first free block is above the item being extended */
      if (flex_to_compact != NO_COMPACTION_NEEDED &&
          (flex__base + flex_to_compact) > (char*)p) flex_to_compact += growth;
    }
    else
    { /* The block shrinks. */
      int shrinkage;

      next = (flex__rec*) (((char*) (p + 1)) + roundup(p->size));

      by = -by; /* a positive value now */
      shrinkage = roundup(p->size) - roundup(p->size - by); /* a positive value */

      memmove(((char*) (p + 1)) + at - by, ((char*) (p + 1)) + at, p->size - at);
      p->size -= by;

      flex__reanchor(next, -shrinkage);

      memmove(((char*) next) - shrinkage, next, flex__freep - (char*) next);

      flex__freep -= shrinkage;

      flex__give();

      if (flex_to_compact != NO_COMPACTION_NEEDED &&
          ((char*)flex__base + flex_to_compact) > (char*)p) flex_to_compact -= shrinkage;
    }
  }

  return TRUE;
}

/*************************************************/
/* flex_reanchor()                               */
/*                                               */
/* Move the anchor of an allocated block         */
/*                                               */
/* Parameters: flex_ptr to -- new location of    */
/*             anchor                            */
/*             flex_ptr from -- current location */
/*             of anchor                         */
/*                                               */
/* Returns:    0 = failure, 1 success            */
/*************************************************/

int flex_reanchor(flex_ptr to_anchor, flex_ptr from_anchor)
{
  flex__rec *p;

  flex__check();

  p = ((flex__rec*) *from_anchor) - 1;

  if (p->anchor != from_anchor)
  {
    flex__fail(1);
    #ifdef TRACE
      if (debugfileptr) fprintf(debugfileptr, "Failed in flex_reanchor\n");
    #endif
  }

  p->anchor = to_anchor;
  *to_anchor = *from_anchor;
  *from_anchor = NULL;

  return TRUE;
}


/* stack checking off */
#pragma -s1

/*************************************************/
/* flex_budge()                                  */
/*                                               */
/* Called when underlying system asks us to move */
/* all flex store up (if n +ve) or down by n     */
/* bytes. If you succeed, put the store          */
/* allocated in *a and return the size. size >=  */
/* roundup(n) on successful exit, and will be a  */
/* multiple of four. If you fail, return what we */
/* can.  If n is -ve, no result is required:     */
/* success is assumed.                           */
/* Significant stack saving done 13-12-89 -- IDJ */
/*************************************************/

static int flex_budge(int n, void **a)
{
  #ifdef TRACE
    if (debugfileptr) fprintf(debugfileptr, "flex_budge called\n");
  #endif

  if (flex_needscompaction && flex_to_compact) flex_compact();

  /* no need to check flex initialised */

  #ifdef LIB_DEBUGGING
    {
      _kernel_swi_regs r;

      /* Beep */
      r.r[0] = 0x07;
      _kernel_swi(OS_WriteC, &r, &r);
    }
  #endif

  if (n >= 0) /* all moving up */
  {
    int roundupn = roundup(n);
    int more = roundupn - (flex__lim - flex__freep);

    /* try to satisfy the request */
    if (more > 0)   /* ie we have to increase slot */
    {
      char *prev = flex__lim;
      flex__lim += more;

      #if 0
        flex__wimpslot(&flex__lim);
      #endif

      /* in-line implementation (of flex__wimpslot)  */
      /*  to reduce stack requirements -- IDJ        */
      {
        int slot = ((int) flex__lim);
        _kernel_swi_regs r;
        _kernel_oserror  *err;
        int memlim, appspace, oldmemlim;

        if (slot != -1) slot -= 0x8000;

        /* read memory limit value */
        r.r[0] = 0;
        r.r[1] = 0;
        r.r[2] = 0;
        err = _kernel_swi(OS_ChangeEnvironment, &r, &r);
        oldmemlim = memlim = r.r[1];

        /* read appspace value */
        r.r[0] = 14;  /* Application space */
        r.r[1] = 0;
        r.r[2] = 0;
        err = _kernel_swi(OS_ChangeEnvironment, &r, &r);
        appspace = r.r[1];

        /* set memory limit before slot size change ... */
        if(appspace > memlim)
        {
           r.r[0] = 0;
           r.r[1] = appspace;
           r.r[2] = 0;
           err = _kernel_swi(OS_ChangeEnvironment, &r, &r);
        }

        /* set wimpslot size */
        r.r[0] = slot;
        r.r[1] = -1;
        err =_kernel_swi(Wimp_SlotSize, &r, &r);
        slot = r.r[0];

        flex__lim = (char*) slot + 0x8000;

        /* .... and set memory limit back again */
        if (appspace > memlim)
        {
          r.r[0] = 0;
          r.r[1] = oldmemlim;
          r.r[2] = 0;
          err = _kernel_swi(OS_ChangeEnvironment, &r, &r);
        }
      }

        /* if we couldn't satisfy it, still give back what we can, */
        /* _kernel_alloc may be able to use it!!!!!                */
        if (flex__lim < prev + more)
            roundupn = flex__lim - flex__freep; /*all we got*/
    }


    {
      flex__rec *p = (flex__rec*)flex__base;
      while (1)
      {
        if ((int) p >= (int) flex__freep) break;
        *(p->anchor) = ((char*) (p + 1)) + roundupn;
        p = (flex__rec*) (((char*) (p + 1)) + roundup(p->size));
      }
    }

    memmove(flex__base + roundupn, flex__base, flex__freep - flex__base);
    *a = flex__base;
    flex__base += roundupn;
    flex__freep += roundupn;
    return(roundupn);
  }
  else
  { /* all moving down */
    int roundupn = roundup(-n); /* a +ve value */
    {
      flex__rec *p = (flex__rec*)flex__base;
      while (1)
      {
        if ((int) p >= (int) flex__freep) break;
        *(p->anchor) = ((char*) (p + 1)) + roundupn;
        p = (flex__rec*) (((char*) (p + 1)) + roundup(p->size));
      }
    }
    memmove(flex__base - roundupn, flex__base, flex__freep - flex__base);
    flex__base -= roundupn;
    flex__freep -= roundupn;
  };

  #ifdef TRACE
    if (debugfileptr) fprintf(debugfileptr, "flex_budge finished\n");
  #endif

  return(0);
}

static int flex_dont_budge(int n, void **a)
{
    return 0;

    n = n;
    a = a;
}


/* stack checks on again */
#pragma -s0

/*************************************************/
/* flex_set_budge()                              */
/*                                               */
/* Set whether to move the flex store when the C */
/* runtime needs to extend the heap.             */
/*                                               */
/* Parameters: int newstate -- whether to budge  */
/*                                               */
/* Returns:    previous state                    */
/*************************************************/

extern int flex_set_budge(int newstate)
{
    _kernel_ExtendProc *oldproc;

    if (flex__area_num)
        return -1;

    if (newstate == 0)
        oldproc = _kernel_register_slotextend(flex_dont_budge);
    else if (newstate == 1)
        oldproc = _kernel_register_slotextend(flex_budge);
    else if (newstate == -1)
        return -1;
    else
        oldproc = _kernel_register_slotextend((_kernel_ExtendProc *) newstate);

    if (oldproc == flex_budge)
        return 1;
    else if (oldproc == flex_dont_budge)
        return 0;
    else
        return (int) oldproc;
}



static void flex_final(void)
{
  if (!flex__initialised) return;
  flex__initialised = 0;
  if (flex__area_num)
     _swix(OS_DynamicArea, _INR(0,1), OS_DynamicArea_Remove, flex__area_num);

  #ifdef TRACE
    fclose(debugfileptr);
  #endif
}

/*************************************************/
/* flex_init()                                   */
/*                                               */
/* Initialise store allocation module.           */
/* Must be called before any other functions in  */
/* this module.  program_name must point at a    */
/* character string whose lifetime is the entire */
/* program (eg a string literal, or static       */
/* buffer).  error_fd is a pointer to a file     */
/* descriptor as returned by                     */
/* MessageTrans_OpenFile - it will be used to    */
/* report flex errors.  If it is 0, then English */
/* default messages are used.                    */
/*                                               */
/* Parameters: char *program_name name of        */
/*             program.                          */
/*             int *error_fd messages file fd.   */
/*             int dynamic_size                  */
/*                                               */
/* Returns:    Dynamic area number in use, or 0  */
/*             for no DA.                        */
/*************************************************/

int flex_init(char *pname, int *efd, int dynamic_size)
{
  _kernel_oserror  *err = NULL;

#ifdef TRACE
  debugfileptr = fopen("devices:parallel", "w");

  setvbuf(debugfileptr, NULL, _IONBF, 0); /* Disable buffering of parallel device stream */
#endif

  flex__lim = (char*) -1;

  if (dynamic_size)
  {
  err = _swix(OS_DynamicArea,
              _INR(0,8)|_OUT(1)|_OUT(3),
              OS_DynamicArea_Create,
              -1,
              DefaultSize,
              -1,
              OS_DynamicArea_Flags_NotDraggable,
              dynamic_size,
              0,
              0,
              pname,
              &flex__area_num,
              &flex__lim);
  }

  if (!dynamic_size || err)
  {
    flex__area_num = 0;
    flex__wimpslot(&flex__lim);
  }

  flex__freep          = flex__lim;
  flex__base           = flex__freep;
  flex_to_compact      = NO_COMPACTION_NEEDED;  /* Initially no freed blocks */
  flex_needscompaction = 0;                     /* default operation is same as old flex (ie. compacts upon every free) */
  flex_freed_size      = 0;
  flex_set_budge(0);

  atexit(flex_final);

  flex__initialised = 1;

  program_name = pname;
  error_fd = efd;

  /* Check that we're in the Wimp environment. */
  {
    void *a;
    if (! flex_alloc(&a, 1)) {
      werr(TRUE, msgs_lookup(MSGS_flex2));
    };
    flex_free(&a);
  };

  return flex__area_num;
}

/*************************************************/
/* flex_save_heap_info()                         */
/*                                               */
/* Displays details of all flex items in the     */
/* flex heap (Untested)                          */
/*************************************************/

void flex_save_heap_info(char *filename)
{
  FILE *fileptr;
  flex__rec *item;
  int count;

  fileptr = fopen(filename, "a");

  if (fileptr)

  {
    item = (flex__rec*)flex__base;
    count = 0;
    fprintf(fileptr, "Flex Heap\n");
    fprintf(fileptr, "=========\n");
    while(((int)item) < (int)flex__freep)
    {
      count++;
      fprintf(fileptr, "Flex block at %p\n", item);
      if (item->anchor)
      {
        fprintf(fileptr, "anchor: %p\n", item->anchor);
        fprintf(fileptr, "*anchor: %p\n", *(item->anchor));
        if (*(item->anchor) != item+1) fprintf(fileptr, "WRONG!\n");
      }
      else
      {
        fprintf(fileptr, "Freed item\n");
      }
      fprintf(fileptr, "size  : %d\n", item->size);
      item = (flex__rec*) (((char*) (item + 1)) + roundup(item->size));
    }
    fprintf(fileptr, "flex__freep : %p (should be %p)\n", flex__freep, item);
    fprintf(fileptr, "total items : %d\n", count);
    fclose(fileptr);
  }
}

/*************************************************/
/* flex_set_deferred_compaction()                */
/*                                               */
/* Sets whether flex should compact its heap on  */
/* every flex_free or on flex_alloc and          */
/* flex_compact                                  */
/*                                               */
/* Parameters: 0 = compact on frees              */
/*             1 = defer compaction              */
/*                                               */
/* Returns:    previous state                    */
/*************************************************/
int flex_set_deferred_compaction(int newstate)
{
  int oldstate;
  oldstate = flex_needscompaction;
  flex_needscompaction = newstate;

  if (oldstate == 1 && newstate == 0)
  {
    flex_compact();
  }

  return oldstate;
}
/* end */
