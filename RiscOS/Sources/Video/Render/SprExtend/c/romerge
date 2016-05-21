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
/* romerge.c - faster 8 & 16 & 32bpp native colour output from JPEG for common 2x2 YUV upsample */

#ifdef UPSAMPLE_MERGING_SUPPORTED

typedef void (*h2v2_merged_upsampler_method_ptr)(j_decompress_ptr, JSAMPIMAGE, JDIMENSION, JSAMPARRAY);

/* Private subobject */

typedef struct {
  struct jpeg_upsampler pub;	/* public fields */

  /* Pointer to routine to do actual upsampling/conversion of one row group */
  JMETHOD(void, upmethod, (j_decompress_ptr cinfo,
			   JSAMPIMAGE input_buf, JDIMENSION in_row_group_ctr,
			   JSAMPARRAY output_buf));

  /* Private state for YCC->RGB conversion */
  int * Cr_r_tab;		/* => table for Cr to R conversion */
  int * Cb_b_tab;		/* => table for Cb to B conversion */
  INT32 * Cr_g_tab;		/* => table for Cr to G conversion */
  INT32 * Cb_g_tab;		/* => table for Cb to G conversion */

  /* For 2:1 vertical sampling, we produce two output rows at a time.
   * We need a "spare" row buffer to hold the second output row if the
   * application provides just a one-row buffer; we also use the spare
   * to discard the dummy last row if the image height is odd.
   */
  JSAMPROW spare_row;
  boolean spare_full;		/* T if spare buffer is occupied */

  JDIMENSION out_row_width;	/* samples per output row */
  JDIMENSION rows_to_go;	/* counts rows remaining in image */
} my_upsampler;

typedef my_upsampler * my_upsample_ptr;

#define SCALEBITS		16	/* speediest right-shift on some machines */
#define ONE_HALF		((INT32) 1 << (SCALEBITS-1))
#define FIX(x)			((INT32) ((x) * (1L<<SCALEBITS) + 0.5))
#define OUTPTR_DOWN(v,p)	((v) & ~((p)-1))
#define OUTPTR_UP(v,p)		(((v) + ((p)-1)) & ~((p)-1))

/*
 * Initialize tables for YCC->RGB colorspace conversion.
 * This is taken directly from jdcolor.c; see that file for more info.
 */

LOCAL(void)
build_ycc_rgb_table (j_decompress_ptr cinfo)
{
  my_upsample_ptr upsample = (my_upsample_ptr) cinfo->upsample;
  int i;
  INT32 x;
  SHIFT_TEMPS

  upsample->Cr_r_tab = (int *)
    (*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_IMAGE,
				(MAXJSAMPLE+1) * SIZEOF(int));
  upsample->Cb_b_tab = (int *)
    (*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_IMAGE,
				(MAXJSAMPLE+1) * SIZEOF(int));
  upsample->Cr_g_tab = (INT32 *)
    (*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_IMAGE,
				(MAXJSAMPLE+1) * SIZEOF(INT32));
  upsample->Cb_g_tab = (INT32 *)
    (*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_IMAGE,
				(MAXJSAMPLE+1) * SIZEOF(INT32));

  for (i = 0, x = -CENTERJSAMPLE; i <= MAXJSAMPLE; i++, x++) {
    /* i is the actual input pixel value, in the range 0..MAXJSAMPLE */
    /* The Cb or Cr value we are thinking of is x = i - CENTERJSAMPLE */
    /* Cr=>R value is nearest int to 1.40200 * x */
    upsample->Cr_r_tab[i] = (int)
		    RIGHT_SHIFT(FIX(1.40200) * x + ONE_HALF, SCALEBITS);
    /* Cb=>B value is nearest int to 1.77200 * x */
    upsample->Cb_b_tab[i] = (int)
		    RIGHT_SHIFT(FIX(1.77200) * x + ONE_HALF, SCALEBITS);
    /* Cr=>G value is scaled-up -0.71414 * x */
    upsample->Cr_g_tab[i] = (- FIX(0.71414)) * x;
    /* Cb=>G value is scaled-up -0.34414 * x */
    /* We also add in ONE_HALF so that need not do it in inner loop */
    upsample->Cb_g_tab[i] = (- FIX(0.34414)) * x + ONE_HALF;
  }
}

METHODDEF(void) /* Start the pass */
start_pass_merged_upsample(j_decompress_ptr cinfo)
{
  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;

  /* Mark the spare buffer empty */
  upsample->spare_full = FALSE;

  /* Initialize total-height counter for detecting bottom of image */
  upsample->rows_to_go = cinfo->output_height;
}

METHODDEF(void) /* Control routine to do upsampling (and color conversion) */
merged_2v_upsample (j_decompress_ptr cinfo,
                    JSAMPIMAGE input_buf, JDIMENSION *in_row_group_ctr,
                    JDIMENSION in_row_groups_avail,
                    JSAMPARRAY output_buf, JDIMENSION *out_row_ctr,
                    JDIMENSION out_rows_avail)
{
  my_upsample_ptr upsample = (my_upsample_ptr) cinfo->upsample;
  JSAMPROW work_ptrs[2];
  JDIMENSION num_rows; /* number of rows returned to caller */

  if (upsample->spare_full)
  {
    /* If we have a spare row saved from a previous cycle, just return it. */
    jcopy_sample_rows(&upsample->spare_row, 0, output_buf + *out_row_ctr, 0,
                      1, upsample->out_row_width);
    num_rows = 1;
    upsample->spare_full = FALSE;
  }
  else
  {
    /* Figure number of rows to return to caller. */
    num_rows = 2;

    /* Not more than the distance to the end of the image. */
    if (num_rows > upsample->rows_to_go)
      num_rows = upsample->rows_to_go;

    /* And not more than what the client can accept: */
    out_rows_avail -= *out_row_ctr;
    if (num_rows > out_rows_avail)
      num_rows = out_rows_avail;

    /* Create output pointer array for upsampler. */
    work_ptrs[0] = output_buf[*out_row_ctr + 0];
    if (num_rows > 1)
    {
      work_ptrs[1] = output_buf[*out_row_ctr + 1];
    }
    else
    {
      work_ptrs[1] = upsample->spare_row;
      upsample->spare_full = TRUE;
    }

    /* Now do the upsampling. */
    (*upsample->upmethod)(cinfo, input_buf, *in_row_group_ctr, work_ptrs);
  }

  /* Adjust counts */
  *out_row_ctr += num_rows;
  upsample->rows_to_go -= num_rows;

  /* When the buffer is emptied, declare this input row group consumed */
  if (!upsample->spare_full)
    (*in_row_group_ctr)++;

  UNUSED(in_row_groups_avail);
}

METHODDEF(void) /* TBGR for most common 2x2 case */
h2v2_merged_upsample_32bpp(j_decompress_ptr cinfo,
                           JSAMPIMAGE input_buf, JDIMENSION in_row_group_ctr,
                           JSAMPARRAY output_buf)
{
  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
  int y, cb, cr;
  int cred, cgreen, cblue;
  int *outptr0, *outptr1;
  JSAMPROW inptr00, inptr01, inptr1, inptr2;
  JDIMENSION col, output_width, xmin;
  JSAMPLE *range_limit = cinfo->sample_range_limit;
  int *Crrtab = upsample->Cr_r_tab;
  int *Cbbtab = upsample->Cb_b_tab;
  INT32 *Crgtab = upsample->Cr_g_tab;
  INT32 *Cbgtab = upsample->Cb_g_tab;
  SHIFT_TEMPS

  /* Pick up pointers */
  inptr00 = input_buf[0][(in_row_group_ctr * 2) + 0];
  inptr01 = input_buf[0][(in_row_group_ctr * 2) + 1];
  inptr1 = input_buf[1][in_row_group_ctr];
  inptr2 = input_buf[2][in_row_group_ctr];
  outptr0 = (int *)output_buf[0];
  outptr1 = (int *)output_buf[1];
#ifdef LAZYDECODE
  /* Round xmin down and xmax up to nearest outptr equivalent alignment */
  xmin = OUTPTR_DOWN(cinfo->xmin, 1);
  output_width = OUTPTR_UP(cinfo->xmax, 1) - xmin;

  /* Skip lefthand pixels not needed */
  inptr1  += (xmin / 2);
  inptr2  += (xmin / 2);
  inptr00 += xmin;
  inptr01 += xmin;
  outptr0 += xmin;
  outptr1 += xmin;
#else
  output_width = cinfo->image_width;
  UNUSED(xmin);
#endif

  /* Loop for each group of output pixels */
  for (col = output_width >> 1; col > 0; col--)
  {
    /* Do the chroma part of the calculation */
    cb = GETJSAMPLE(*inptr1++);
    cr = GETJSAMPLE(*inptr2++);
    cred = Crrtab[cr];
    cgreen = (int)RIGHT_SHIFT(Cbgtab[cb] + Crgtab[cr], SCALEBITS);
    cblue = Cbbtab[cb];

    /* Fetch 4 Y values and emit 4 &BGR pixels */
    y  = GETJSAMPLE(*inptr00++);
    *outptr0 = (range_limit[y + cred]   << 0 ) |
               (range_limit[y + cgreen] << 8 ) |
               (range_limit[y + cblue]  << 16);
    outptr0++;
    y  = GETJSAMPLE(*inptr00++);
    *outptr0 = (range_limit[y + cred]   << 0 ) |
               (range_limit[y + cgreen] << 8 ) |
               (range_limit[y + cblue]  << 16);
    outptr0++;
    y  = GETJSAMPLE(*inptr01++);
    *outptr1 = (range_limit[y + cred]   << 0 ) |
               (range_limit[y + cgreen] << 8 ) |
               (range_limit[y + cblue]  << 16);
    outptr1++;
    y  = GETJSAMPLE(*inptr01++);
    *outptr1 = (range_limit[y + cred]   << 0 ) |
               (range_limit[y + cgreen] << 8 ) |
               (range_limit[y + cblue]  << 16);
    outptr1++;
  }

  /* If image width is odd, do the last output column separately */
  if (output_width & 1)
  {
    /* Do the chroma part of the calculation */
    cb = GETJSAMPLE(*inptr1);
    cr = GETJSAMPLE(*inptr2);
    cred = Crrtab[cr];
    cgreen = (int) RIGHT_SHIFT(Cbgtab[cb] + Crgtab[cr], SCALEBITS);
    cblue = Cbbtab[cb];

    /* Fetch 2 Y values and emit 2 pixels */
    y  = GETJSAMPLE(*inptr00);
    *outptr0 = (range_limit[y + cred]   << 0 ) |
               (range_limit[y + cgreen] << 8 ) |
               (range_limit[y + cblue]  << 16);
    y  = GETJSAMPLE(*inptr01);
    *outptr1 = (range_limit[y + cred]   << 0 ) |
               (range_limit[y + cgreen] << 8 ) |
               (range_limit[y + cblue]  << 16);
  }
}

METHODDEF(void) /* ABGR/ARGB/TBGR/TRGB + ordered dither for most common 2x2 case */
h2v2_merged_upsample_16bpp(j_decompress_ptr cinfo,
                           JSAMPIMAGE input_buf, JDIMENSION in_row_group_ctr,
                           JSAMPARRAY output_buf)
{
  my_upsample_ptr upsample = (my_upsample_ptr)cinfo->upsample;
  int y, cb, cr;
  int cred, cgreen, cblue;
  int rpos, gpos, bpos;
  int gtrunc, rbtrunc;
  unsigned int alpha, lo, hi;
  int *outptr0, *outptr1;
  JSAMPROW inptr00, inptr01, inptr1, inptr2;
  JDIMENSION col, output_width, xmin;
  JSAMPLE *range_limit = cinfo->sample_range_limit;
  int *Crrtab = upsample->Cr_r_tab;
  int *Cbbtab = upsample->Cb_b_tab;
  INT32 *Crgtab = upsample->Cr_g_tab;
  INT32 *Cbgtab = upsample->Cb_g_tab;
  SHIFT_TEMPS

  /* Pick up pointers */
  inptr00 = input_buf[0][(in_row_group_ctr * 2) + 0];
  inptr01 = input_buf[0][(in_row_group_ctr * 2) + 1];
  inptr1 = input_buf[1][in_row_group_ctr];
  inptr2 = input_buf[2][in_row_group_ctr];
  outptr0 = (int *)output_buf[0];
  outptr1 = (int *)output_buf[1];
#ifdef LAZYDECODE
  /* Round xmin down and xmax up to nearest outptr equivalent alignment */
  xmin = OUTPTR_DOWN(cinfo->xmin, 2);
  output_width = OUTPTR_UP(cinfo->xmax, 2) - xmin;

  /* Skip lefthand pixels not needed */
  inptr1  += (xmin / 2);
  inptr2  += (xmin / 2);
  inptr00 += xmin;
  inptr01 += xmin;
  outptr0 += (xmin / 2);
  outptr1 += (xmin / 2);
#else
  output_width = cinfo->image_width;
  UNUSED(xmin);
#endif

  /* Do factors for output variants */
  switch (cinfo->pixelformat & PixelFormat_BPPMask)
  {
    case PixelFormat_12bpp:
      rpos = 0; gpos = 4; bpos = 8;  gtrunc = 4; rbtrunc = 4;
      alpha = 0xF000F000u;
      break;
      
    default:
    case PixelFormat_15bpp:
      rpos = 0; gpos = 5; bpos = 10; gtrunc = 3; rbtrunc = 3;
      alpha = 0x80008000u;
      break;

    case PixelFormat_16bpp:
      rpos = 0; gpos = 5; bpos = 11; gtrunc = 2; rbtrunc = 3;
      alpha = 0x00000000u;
      break;
  }
  if (!(cinfo->pixelformat & PixelFormat_Alpha))
  {
    alpha = 0;
  }
  if (cinfo->pixelformat & PixelFormat_RGB)
  {
    int temp = rpos; rpos = bpos; bpos = temp;
  }

  /* Loop for each group of output pixels, the band buffer is a multiple
   * of sizeof(int) so it doesn't matter if the loop writes out 16b of
   * garbage to the right for an odd width image - round width up.
   */
  for (col = output_width >> 1; col > 0; col--)
  {
    /* Do the chroma part of the calculation */
    cb = GETJSAMPLE(*inptr1++);
    cr = GETJSAMPLE(*inptr2++);
    cred = Crrtab[cr];
    cgreen = (int)RIGHT_SHIFT(Cbgtab[cb] + Crgtab[cr], SCALEBITS);
    cblue = Cbbtab[cb];

    /* Fetch 4 Y values and emit 4x16b pixels as 2x32b words, applying
     * a Bayer ordered dither pattern of D2 = [ 3   1 ]
     *                                        [ 0   2 ]
     * to compensate for the quantisation. Really only good for 1:1 plotting
     * in 16bpp, thus a block copy can move it to the screen, and the whole
     * thing is a great deal faster.
     */
    y  = 0 + GETJSAMPLE(*inptr00++);
    lo = ((range_limit[y + cred] >> rbtrunc)  << rpos) |
         ((range_limit[y + cgreen] >> gtrunc) << gpos) |
         ((range_limit[y + cblue] >> rbtrunc) << bpos);
    y  = 4 + GETJSAMPLE(*inptr00++);
    hi = ((range_limit[y + cred] >> rbtrunc)  << rpos) |
         ((range_limit[y + cgreen] >> gtrunc) << gpos) |
         ((range_limit[y + cblue] >> rbtrunc) << bpos);
    *outptr0 = lo | (hi << 16) | alpha;
    outptr0++;
    y  = 6 + GETJSAMPLE(*inptr01++);
    lo = ((range_limit[y + cred] >> rbtrunc)  << rpos) |
         ((range_limit[y + cgreen] >> gtrunc) << gpos) |
         ((range_limit[y + cblue] >> rbtrunc) << bpos);
    y  = 2 + GETJSAMPLE(*inptr01++);
    hi = ((range_limit[y + cred] >> rbtrunc)  << rpos) |
         ((range_limit[y + cgreen] >> gtrunc) << gpos) |
         ((range_limit[y + cblue] >> rbtrunc) << bpos);
    *outptr1 = lo | (hi << 16) | alpha;
    outptr1++;
  }
}

METHODDEF(void) /* Dithered VIDC1 bytes for most common 2x2 case */
h2v2_merged_upsample_8bpp_vidc(j_decompress_ptr cinfo,
                               JSAMPIMAGE input_buf, JDIMENSION in_row_group_ctr,
                               JSAMPARRAY output_buf)
{
  int y, u, v, luma[4], cb, cr;
  int erry = 0, erru = 0, errv = 0;
  char *outptr0, *outptr1;
  size_t xpos = 0, p;
  JSAMPROW inptr00, inptr01, inptr1, inptr2;
  JDIMENSION col, output_width, xmin;
  const int *pixel_to_yuv_tab = (const int *)RELOCDATA(pixel_to_yuv_table);
  const char *yuv_to_pixel_tab = (const char *)RELOCDATA(yuv_to_pixel_table);

  /* Pick up pointers */
  inptr00 = input_buf[0][(in_row_group_ctr * 2) + 0];
  inptr01 = input_buf[0][(in_row_group_ctr * 2) + 1];
  inptr1 = input_buf[1][in_row_group_ctr];
  inptr2 = input_buf[2][in_row_group_ctr];
  outptr0 = (char *)output_buf[0];
  outptr1 = (char *)output_buf[1];
#ifdef LAZYDECODE
  /* Round xmin down and xmax up to nearest outptr equivalent alignment */
  xmin = OUTPTR_DOWN(cinfo->xmin, 2);
  output_width = OUTPTR_UP(cinfo->xmax, 2) - xmin;

  /* Skip lefthand pixels not needed */
  inptr1  += (xmin / 2);
  inptr2  += (xmin / 2);
  inptr00 += xmin;
  inptr01 += xmin;
  outptr0 += xmin;
  outptr1 += xmin;
#else
  output_width = cinfo->image_width;
  UNUSED(xmin);
#endif

  /* Loop for each group of output pixels */
  for (col = output_width >> 1; col > 0; col--)
  {
    if ((xpos % (2 * DCTSIZE)) == 0)
    {
      /* Next DCT block pair, wipe the cumulative errors */
      erry = erru = errv = 0;
    }

    /* Pick up the samples for this 2x2 patch */
    cb = GETJSAMPLE(*inptr1++);
    cr = GETJSAMPLE(*inptr2++);
    luma[1] = GETJSAMPLE(*inptr00++);
    luma[2] = GETJSAMPLE(*inptr00++);
    luma[0] = GETJSAMPLE(*inptr01++);
    luma[3] = GETJSAMPLE(*inptr01++);

    for (p = 0; p < 4; p++)
    {
      char colour;

      y = luma[p];
      u = cb;
      v = cr;

      /* Mix in the last errors and clamp */
      y += erry; if (y < 0) y = 0; if (y > 255) y = 255;
      u += erru; if (u < 0) u = 0; if (u > 255) u = 255;
      v += errv; if (v < 0) v = 0; if (v > 255) v = 255;
  
      /* Combine Y:Cr:Cb in the ratio 5:4:4, and use as an index
       * into the YUV->pixel table
       */
      colour = yuv_to_pixel_tab[((y & 0xF8) << 5) |
                                 (u & 0xF0) |
                                ((v & 0xF0) >> 4)];

      /* Reduce patterning by doing a 'n' shaped dance
       *   [ p=1  p=2 ]
       *   [ p=0  p=3 ]
       * which is a 'u' shape when the origin is in the BLHC
       */
      if ((p == 1) || (p == 2)) outptr0[(p & 2) >> 1] = colour;
      else                      outptr1[(p & 2) >> 1] = colour;

      /* Lookup backwards to calculate the error term */
      erry = y - ((pixel_to_yuv_tab[colour] >> 16) & 0xFF);
      erru = u - ((pixel_to_yuv_tab[colour] >> 8) & 0xFF);
      errv = v - ((pixel_to_yuv_tab[colour] >> 0) & 0xFF);
    }
    outptr0 += 2;
    outptr1 += 2;
    xpos    += 2;
  }
}

METHODDEF(void) /* Greyscale bytes for most common 2x2 case */
h2v2_merged_upsample_8bpp_grey(j_decompress_ptr cinfo,
                               JSAMPIMAGE input_buf, JDIMENSION in_row_group_ctr,
                               JSAMPARRAY output_buf)
{
  int y;
  int *outptr0, *outptr1;
  JSAMPROW inptr00, inptr01;
  JDIMENSION col, output_width, xmin;

  /* Pick up pointers */
  inptr00 = input_buf[0][(in_row_group_ctr * 2) + 0];
  inptr01 = input_buf[0][(in_row_group_ctr * 2) + 1];
  outptr0 = (int *)output_buf[0];
  outptr1 = (int *)output_buf[1];
#ifdef LAZYDECODE
  /* Round xmin down and xmax up to nearest outptr equivalent alignment */
  xmin = OUTPTR_DOWN(cinfo->xmin, 4);
  output_width = OUTPTR_UP(cinfo->xmax, 4) - xmin;

  /* Skip lefthand pixels not needed */
  inptr00 += xmin;
  inptr01 += xmin;
  outptr0 += (xmin / sizeof(int));
  outptr1 += (xmin / sizeof(int));
#else
  output_width = cinfo->image_width;
  UNUSED(xmin);
#endif

  /* Loop for each group of output pixels, the band buffer is a multiple
   * of sizeof(int) so it doesn't matter if the loop writes out 24b of
   * garbage to the right for an odd width image - round width up.
   */
  for (col = output_width >> 2; col > 0; col--)
  {
    /* Fetch 8 Y values and emit 8 pixels as 2x32b words */
    y = (GETJSAMPLE(inptr00[0]) << 0 ) |
        (GETJSAMPLE(inptr00[1]) << 8 ) |
        (GETJSAMPLE(inptr00[2]) << 16) |
        (GETJSAMPLE(inptr00[3]) << 24);
    inptr00 += 4;
    *outptr0 = y;
    outptr0++;
    y = (GETJSAMPLE(inptr01[0]) << 0 ) |
        (GETJSAMPLE(inptr01[1]) << 8 ) |
        (GETJSAMPLE(inptr01[2]) << 16) |
        (GETJSAMPLE(inptr01[3]) << 24);
    inptr01 += 4;
    *outptr1 = y;
    outptr1++;
  }
}

GLOBAL(void) /* Start the session */
jinit_merged_upsampler(j_decompress_ptr cinfo)
{
  my_upsample_ptr upsample;
  h2v2_merged_upsampler_method_ptr method_ptr;
  
  /* Allocate upsample struct */
  upsample = (my_upsample_ptr)(*cinfo->mem->alloc_small)((j_common_ptr) cinfo, JPOOL_IMAGE, SIZEOF(my_upsampler));
  cinfo->upsample = (struct jpeg_upsampler *)upsample;

  /* Method pointers */
  upsample->pub.start_pass = (void (*)(j_decompress_ptr))RELOCCODE(start_pass_merged_upsample);
  switch (cinfo->pixelformat & PixelFormat_BPPMask)
  {
    case PixelFormat_32bpp:
      method_ptr = h2v2_merged_upsample_32bpp;
      break;

    case PixelFormat_12bpp:
    case PixelFormat_15bpp:
    case PixelFormat_16bpp:
      method_ptr = h2v2_merged_upsample_16bpp;
      break;

    case PixelFormat_8bpp:
      if (cinfo->options & jopt_OUTBPP_8GREY)
      {
        method_ptr = h2v2_merged_upsample_8bpp_grey;
        break;
      }
      else
      {
        if (cinfo->options & jopt_OUTBPP_8YUV)
        {
          method_ptr = h2v2_merged_upsample_8bpp_vidc;
          break;
        }
      }
      /* Fall through... */
    default:
      method_ptr = NULL;
      ERREXIT(cinfo, JERR_NOT_COMPILED);
  }
  upsample->pub.upsample = (void (*)(j_decompress_ptr, JSAMPIMAGE, JDIMENSION *, JDIMENSION,
                                     JSAMPARRAY, JDIMENSION *, JDIMENSION))RELOCCODE(merged_2v_upsample);
  upsample->upmethod = (h2v2_merged_upsampler_method_ptr)RELOCCODE(method_ptr);

  /* Other state */
  upsample->pub.need_context_rows = FALSE;
  upsample->out_row_width = cinfo->output_width * cinfo->out_color_components;

  /* Allocate a spare row buffer */
  upsample->spare_row = (JSAMPROW) (*cinfo->mem->alloc_large) ((j_common_ptr) cinfo, JPOOL_IMAGE, (size_t) (upsample->out_row_width * SIZEOF(JSAMPLE)));

  /* TODO - Could share this table with jdcolor.c */
  build_ycc_rgb_table(cinfo);
}

#endif /* UPSAMPLE_MERGING_SUPPORTED */
