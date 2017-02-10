/*
 * Copyright (c) 2015, RISC OS Open Ltd
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met: 
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of RISC OS Open Ltd nor the names of its contributors
 *       may be used to endorse or promote products derived from this software
 *       without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
/* romemmgr.c - Memory management for JPEG for use within RISC OS */

#include <stdlib.h>
#include <stdint.h>
#include "swis.h"

struct jvirt_barray_control
{
  JBLOCKARRAY mem_buffer;      /* => the in-memory buffer */
  JOCTET     *base;            /* address of underlying store */
  JDIMENSION  rows_in_array;   /* total virtual array height */
  JDIMENSION  blocksperrow;    /* width of array (and of memory buffer) */
  JDIMENSION  maxaccess;       /* max rows accessed by access_virt_barray */
  JDIMENSION  cur_start_row;   /* first logical row # in the buffer */
  boolean     pre_zero;        /* pre-zero mode requested? */
  jvirt_barray_ptr next;       /* link to next virtual barray control block */
};

/**************************************************************************
*                                                                         *
*    JPEG memory functions.                                               *
*                                                                         *
**************************************************************************/

METHODDEF(void *) /* Small byte arrays */
alloc_small(j_common_ptr cinfo, int pool_id, size_t sizeofobject)
{
  j_decompress_ptr dinfo;
  struct jpeg_memory_mgr *mem = cinfo->mem;
  size_t free;
  void  *where;

  if (cinfo->is_decompressor)
  {
    dinfo = (j_decompress_ptr)cinfo;
  }
  else
  {
    dinfo = (j_decompress_ptr)((j_compress_ptr)cinfo)->client_data;
  }

  sizeofobject = (sizeofobject + 3) & ~3; /* Keep it all word aligned */
  free = dinfo->workspace_size - sizeof(struct jpeg_decompress_struct) - mem->high_watermark;
  if (free < sizeofobject)
  {
    void *area;

    /* No room, try resizing it.
     * This makes the (valid) assumption that resizing a dynamic area
     * doesn't change its base address.
     */
    area = area_resize(AREA_WKSP0, &dinfo->workspace_size, dinfo->workspace_size + sizeofobject + 8192 /* Slop */);
    assert(area != NULL, ERROR_NO_MEMORY);
  }
  
  /* Grab from our simple allocate only heap */
  where = (void *)((uintptr_t)mem->small_pool + mem->high_watermark);
  mem->high_watermark += sizeofobject;
  UNUSED(pool_id);
  
  return where;
}

METHODDEF(void FAR *) /* Large byte arrays */
alloc_large(j_common_ptr cinfo, int pool_id, size_t sizeofobject)
{
  /* There's no distinction here, FAR pointers are a DOS concept */
  return alloc_small(cinfo, pool_id, sizeofobject);
}

METHODDEF(JSAMPARRAY) /* 2D sample arrays */
alloc_sarray(j_common_ptr cinfo, int pool_id,
             JDIMENSION samplesperrow, JDIMENSION numrows)
{
  JSAMPARRAY result;
  JSAMPROW workspace;
  JDIMENSION rowsperchunk, currow, i;

  /* Flat memory world, no chunk considerations */
  rowsperchunk = numrows;

  /* Get space for row pointers (small object) */
  result = (JSAMPARRAY)alloc_small(cinfo, pool_id, (size_t)(numrows * sizeof(JSAMPROW)));

  /* Get the rows themselves (large objects) */
  currow = 0;
  while (currow < numrows)
  {
    rowsperchunk = MIN(rowsperchunk, numrows - currow);
    workspace = (JSAMPROW)alloc_large(cinfo, pool_id, (size_t)((size_t)rowsperchunk * (size_t)samplesperrow * sizeof(JSAMPLE)));
    for (i = rowsperchunk; i > 0; i--)
    {
      result[currow++] = workspace;
      workspace += samplesperrow;
    }
  }

  return result;
}

METHODDEF(JBLOCKARRAY) /* 2D block coefficient arrays */
alloc_barray(j_common_ptr cinfo, int pool_id,
             JDIMENSION blocksperrow, JDIMENSION numrows)
{
  JBLOCKARRAY result;
  JBLOCKROW workspace;
  JDIMENSION rowsperchunk, currow, i;

  /* Flat memory world, no chunk considerations */
  rowsperchunk = numrows;

  /* Get space for row pointers (small object) */
  result = (JBLOCKARRAY)alloc_small(cinfo, pool_id, (size_t)(numrows * sizeof(JBLOCKROW)));

  /* Get the rows themselves (large objects) */
  currow = 0;
  while (currow < numrows)
  {
    rowsperchunk = MIN(rowsperchunk, numrows - currow);
    workspace = (JBLOCKROW)alloc_large(cinfo, pool_id, (size_t)((size_t)rowsperchunk * (size_t)blocksperrow * sizeof(JBLOCK)));
    for (i = rowsperchunk; i > 0; i--)
    {
      result[currow++] = workspace;
      workspace += blocksperrow;
    }
  }

  return result;
}

METHODDEF(jvirt_barray_ptr) /* Note virtual block array request */
request_virt_barray(j_common_ptr cinfo, int pool_id, boolean pre_zero, JDIMENSION blocksperrow,
                    JDIMENSION numrows, JDIMENSION maxaccess)
{
  jvirt_barray_ptr result;

  /* Only IMAGE-lifetime virtual arrays are currently supported */
  if (pool_id != JPOOL_IMAGE)
    ERREXIT1(cinfo, JERR_BAD_POOL_ID, pool_id);

  /* Get control block */
  result = (jvirt_barray_ptr)alloc_small(cinfo, pool_id,
                                         sizeof(struct jvirt_barray_control));
  result->mem_buffer = NULL; /* Not yet realised */
  result->rows_in_array = numrows;
  result->blocksperrow = blocksperrow;
  result->maxaccess = maxaccess;
  result->pre_zero = pre_zero;

  /* Link into list */
  result->next = cinfo->mem->virt_barray_list;
  cinfo->mem->virt_barray_list = result;

  return result;
}

METHODDEF(void)
realise_virt_arrays(j_common_ptr cinfo)
{
  jvirt_barray_ptr bptr;
  size_t  total_unrealised = 0;
  JOCTET *coef_area;
  size_t  high_watermark;

  /* Total up the requests and check there's something to realise */
  for (bptr = cinfo->mem->virt_barray_list; bptr != NULL; bptr = bptr->next)
  {
    if (bptr->mem_buffer == NULL)
    {
      total_unrealised += bptr->rows_in_array *
                          bptr->blocksperrow *
                          sizeof(JBLOCK);
    }
  }
  if (total_unrealised == 0)
    return;

  /* Should only be messing with virtual arrays for coefficients */
  if (cinfo->mem->coef_buffer == NULL)
    ERREXIT(cinfo, JERR_BAD_VIRTUAL_ACCESS);

  /* Extend that much */
  high_watermark = cinfo->mem->coef_buffer_size;
  coef_area = area_resize(AREA_COEF, &cinfo->mem->coef_buffer_size,
                          high_watermark + total_unrealised);
  assert(coef_area != NULL, ERROR_NO_MEMORY);

  /* Fill them in */
  for (bptr = cinfo->mem->virt_barray_list; bptr != NULL; bptr = bptr->next)
  {
    if (bptr->mem_buffer == NULL)
    {
      JBLOCKARRAY array;
      size_t block_bytes;

      /* Get space for row pointers (small object) */
      block_bytes = bptr->rows_in_array *
                    bptr->blocksperrow *
                    sizeof(JBLOCK);
      array = (JBLOCKARRAY)alloc_small(cinfo, JPOOL_IMAGE,
                                       (size_t)(bptr->maxaccess * sizeof(JBLOCKROW)));
      bptr->mem_buffer = array;
      bptr->base = &coef_area[high_watermark];
      high_watermark += block_bytes;
      if (bptr->pre_zero)
        MEMZERO(bptr->base, block_bytes);
      bptr->cur_start_row = -1; /* Currently the JBLOCKARRAY is unset */
    }
  }
}

METHODDEF(JBLOCKARRAY)
access_virt_barray(j_common_ptr cinfo, jvirt_barray_ptr bptr,
                   JDIMENSION start_row, JDIMENSION num_rows, boolean writable)
{
  JDIMENSION end_row = start_row + num_rows;
  JDIMENSION row;

  /* TODO - this is a prime candidate for PMP dynamic areas, since the library
   * only looks through the num_rows window into the data at any one time.
   */
  if (end_row > bptr->rows_in_array || num_rows > bptr->maxaccess || bptr->mem_buffer == NULL)
    ERREXIT(cinfo, JERR_BAD_VIRTUAL_ACCESS);

  if (start_row != bptr->cur_start_row)
  {
    size_t byte_offset = start_row *
                         bptr->blocksperrow *
                         sizeof(JBLOCK);

    /* For each row, fill in the block pointers to the underlying store */
    for (row = 0; row < num_rows; row++)
    {
      bptr->mem_buffer[row] = (JBLOCKROW)&bptr->base[byte_offset];
      byte_offset += bptr->blocksperrow * sizeof(JBLOCK);
    }

    bptr->cur_start_row = start_row;
  }
  UNUSED(writable);
  UNUSED(cinfo);

  return bptr->mem_buffer;
}

METHODDEF(void) /* Free an allocation */
free_pool(j_common_ptr cinfo, int pool_id)
{
  /* Should never be called, if it is then that's an error */
  ERREXIT(cinfo, JERR_NOTIMPL);
  UNUSED(cinfo);
  UNUSED(pool_id);
}

METHODDEF(void) /* End the session */
self_destruct(j_common_ptr cinfo)
{
  if (cinfo->is_decompressor)
  {
    j_decompress_ptr state = (j_decompress_ptr)cinfo;

    /* Shrink the dynamic area back down to just contain the state struct.
     * This makes the (valid) assumption that resizing a dynamic area
     * doesn't change its base address.
     */
    area_resize(AREA_WKSP0, &state->workspace_size, sizeof(struct jpeg_decompress_struct));
  }
  else
  {
    /* Leave the parent decompressor to worry about it */
  }

  /* The memory management struct is at the end of the small pool too, so
   * doesn't need freeing, just shut up shop.
   */
  cinfo->mem = NULL;
}

GLOBAL(void) /* Start the session */
jinit_memory_mgr(j_common_ptr cinfo)
{
  j_decompress_ptr dinfo;

  if (cinfo->is_decompressor)
  {
    dinfo = (j_decompress_ptr)cinfo;
  }
  else
  {
    /* Allocate compression state from the parent decompressor */
    dinfo = (j_decompress_ptr)((j_compress_ptr)cinfo)->client_data;
    cinfo->mem = dinfo->mem;
    return;
  }

  /* Allocate memory management struct from itself */
  cinfo->mem = (struct jpeg_memory_mgr *)dinfo->small_pool;
  cinfo->mem->small_pool = (int *)((uintptr_t)cinfo->mem + sizeof(struct jpeg_memory_mgr));
  cinfo->mem->high_watermark = sizeof(struct jpeg_memory_mgr);
  cinfo->mem->virt_barray_list = NULL;
  
  /* Method pointers */
  cinfo->mem->alloc_small = (void *(*)(j_common_ptr, int, size_t))RELOCCODE(alloc_small);
  cinfo->mem->alloc_large = (void FAR *(*)(j_common_ptr, int, size_t))RELOCCODE(alloc_small);
  cinfo->mem->alloc_sarray = (JSAMPARRAY (*)(j_common_ptr, int, JDIMENSION, JDIMENSION))RELOCCODE(alloc_sarray);
  cinfo->mem->alloc_barray = (JBLOCKARRAY (*)(j_common_ptr, int, JDIMENSION, JDIMENSION))RELOCCODE(alloc_barray);
  cinfo->mem->free_pool = (void (*)(j_common_ptr, int))RELOCCODE(free_pool);
  cinfo->mem->self_destruct = (void (*)(j_common_ptr))RELOCCODE(self_destruct);
  cinfo->mem->request_virt_barray = (jvirt_barray_ptr (*)(j_common_ptr, int, boolean, JDIMENSION, JDIMENSION, JDIMENSION))RELOCCODE(request_virt_barray);
  cinfo->mem->realize_virt_arrays = (void (*)(j_common_ptr))RELOCCODE(realise_virt_arrays);
  cinfo->mem->access_virt_barray = (JBLOCKARRAY (*)(j_common_ptr, jvirt_barray_ptr, JDIMENSION, JDIMENSION, boolean))RELOCCODE(access_virt_barray);
  cinfo->mem->coef_buffer = NULL;
  cinfo->mem->coef_buffer_size = 0;
}
