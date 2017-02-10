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
/* rotranscode.c - transcode progressive and arithmetic to baseline */

#if defined(D_ARITH_CODING_SUPPORTED) || defined(D_PROGRESSIVE_SUPPORTED) 

void jpegtrans_make_baseline(j_decompress_ptr parent, const JOCTET **buffer, size_t *buffer_size)
{
  struct jpeg_compress_struct cinfo;
  jvirt_barray_ptr *coef_arrays;
  JOCTET *dst_buffer, *coef_buffer;
  size_t dst_buffer_size;

  /* Initialise a JPEG compression object, the decompression object
   * is inherited from rojpeg.c which has already set up the data
   * source and done jpeg_read_header() before deciding it was too hard.
   */
  cinfo.client_data = parent;
  jpeg_create_compress(&cinfo);

  /* Errors are handled inline with the various macros in jerror.h, so there
   * is no call to jpeg_std_error() since nothing uses the function pointers
   * in cinfo->err.
   */

  /* Will certainly need an area to absorb coefficients */
  coef_buffer = area_resize(AREA_COEF, NULL, 0);
  assert(coef_buffer != NULL, ERROR_NO_MEMORY);
  cinfo.mem->coef_buffer = coef_buffer;
  cinfo.mem->coef_buffer_size = 0;

  /* Slurp the source image information in raw form */
  coef_arrays = jpeg_read_coefficients(parent);
  jpeg_copy_critical_parameters(parent, &cinfo);

  /* Specify data destination as empty so it gets auto created */
  dst_buffer_size = 0;
  jpeg_mem_dest(&cinfo, (unsigned char **)&dst_buffer, (unsigned long *)&dst_buffer_size);

  /* Start compressor (note no image data is actually written here) */
  jpeg_write_coefficients(&cinfo, coef_arrays);

  /* Finish compression, this terminates the data destination properly,
   * so everything is flushed out.
   */
  jpeg_finish_compress(&cinfo);

  /* Copy over the resulting image into the parent, and destroy all the
   * memory and structures associated with transcoding.
   */
  *buffer = parent->mem->alloc_large((j_common_ptr)parent,
                                     JPOOL_IMAGE, dst_buffer_size);
  *buffer_size = dst_buffer_size;
  MEMCOPY(*buffer, dst_buffer, dst_buffer_size);

  /* Clear up */
  area_remove(AREA_TRAN);
  area_remove(AREA_COEF);

  /* Now there's a baseline version of the image, go back and handle
   * it via the normal route by going over the initial steps again.
   */
  parent->global_state = DSTATE_START;
  jpeg_mem_src(parent, (unsigned char *)*buffer, (unsigned long)*buffer_size);
  (void) jpeg_read_header(parent, TRUE);
}

#endif
