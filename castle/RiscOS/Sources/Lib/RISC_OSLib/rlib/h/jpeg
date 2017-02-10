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

/* Title:   jpeg.h
 * Purpose: rendering of JPEG format images with SpriteExtend
 *
 */

#ifndef __jpeg_h
#define __jpeg_h

#ifndef BOOL
#define BOOL int
#define TRUE 1
#define FALSE 0
#endif

#ifndef __sprite_h
#include "sprite.h"
#endif
                                      

/********************* Flag bit definitions and structures *****************/

typedef enum
{
  jpeg_id_name = 0,
  jpeg_id_addr = 0x6745704A /* 'Magic' number ("JpEg") to test against */
} jpeg_type;

typedef enum
{
  jpeg_encoding_BASELINE = 0,
  jpeg_encoding_EXTENDED_SEQUENTIAL_HUFFMAN,
  jpeg_encoding_PROGRESSIVE_HUFFMAN,
  jpeg_encoding_LOSSLESS_HUFFMAN,
  jpeg_encoding_NOT_JPEG4,
  jpeg_encoding_DIFFERENTIAL_SEQUENTIAL_HUFFMAN,
  jpeg_encoding_DIFFERENTIAL_PROGRESSIVE_HUFFMAN,
  jpeg_encoding_DIFFERENTIAL_LOSSLESS_HUFFMAN,
  jpeg_encoding_RESERVED,
  jpeg_encoding_EXTENDED_SEQUENTIAL_ARITHMETIC,
  jpeg_encoding_PROGRESSIVE_ARITHMETIC,
  jpeg_encoding_LOSSLESS_ARITHMETIC,
  jpeg_encoding_NOT_JPEG12,
  jpeg_encoding_DIFFERENTIAL_SEQUENTIAL_ARITHMETIC,
  jpeg_encoding_DIFFERENTIAL_PROGRESSIVE_ARITHMETIC,
  jpeg_encoding_DIFFERENTIAL_LOSSLESS_ARITHMETIC
} jpeg_encoding;

typedef enum
{
  jpeg_colour_GREYSCALE = 0,
  jpeg_colour_YUV,
  jpeg_colour_CMYK
} jpeg_colour;

typedef void *jpeg_ptr;

typedef struct
{
  jpeg_ptr     addr;
  int          size;
} jpeg_image;

typedef struct
{
  union
  {
    char      *name; /* Can use either filename of JPEG or address (faster) */
    jpeg_image image;
  } s;
  jpeg_type    tag;  /* User must tag the use of this structure manually */
} jpeg_id;

typedef struct
{
  int width;
  int height;
  int xdensity;
  int ydensity;
  int extraworkspace;
  jpeg_encoding encoding;
  jpeg_colour colourspace;
} jpeg_info;

typedef int jpeg_put_flags;

#define jpeg_PUT_DITHER_ENABLE                  ((jpeg_put_flags)1)
#define jpeg_PUT_ERROR_DIFFUSED_DITHER          ((jpeg_put_flags)2)


/***************************** Library functions ***************************/

/* ------------------------ jpeg_readinfo --------------------------------
 * Read the size, dots per inch, and format information for the specified
 * jpeg_id. If the JPEG is not valid, the resultinfo is not updated.
 *
 */
extern os_error * jpeg_readinfo (const jpeg_id *id, jpeg_info *resultinfo);

/* ------------------------ jpeg_arbitrary_trans_supported ---------------
 * Determine if arbitrary transforms are possible on JPEGs or
 * whether jpeg_put_trans only supports simple scaling.
 *
 */
extern BOOL jpeg_arbitrary_trans_supported (void);

/* ------------------------ jpeg_put_scaled ------------------------------
 * Plot the specified JPEG at (x,y) using the overwrite action, and scaled
 * using the given scale factors.
 *
 */
extern os_error * jpeg_put_scaled (const jpeg_id *id, int x, int y,
                                   const sprite_factors *factors,
                                   jpeg_put_flags flags);

/* ------------------------ jpeg_put_trans -------------------------------
 * Put a box from the JPEG through a transformation matrix.
 *
 */
extern os_error * jpeg_put_trans (const jpeg_id *id, jpeg_put_flags flags,
                                  const sprite_box *box,
                                  const sprite_transmat *trans_mat);

#endif

/* end of jpeg.h */
