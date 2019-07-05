#ifndef compressjpeg_H
#define compressjpeg_H

/* C header file for CompressJPEG
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 24 May 1995
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#ifndef os_H
#include "oslib/os.h"
#endif

#ifndef jpeg_H
#include "oslib/jpeg.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  CompressJPEG_Start
#define CompressJPEG_Start                      0x4A500
#undef  XCompressJPEG_Start
#define XCompressJPEG_Start                     0x6A500
#undef  CompressJPEG_WriteLine
#define CompressJPEG_WriteLine                  0x4A501
#undef  XCompressJPEG_WriteLine
#define XCompressJPEG_WriteLine                 0x6A501
#undef  CompressJPEG_Finish
#define CompressJPEG_Finish                     0x4A502
#undef  XCompressJPEG_Finish
#define XCompressJPEG_Finish                    0x6A502
#undef  CompressJPEG_Comment
#define CompressJPEG_Comment                    0x4A503
#undef  XCompressJPEG_Comment
#define XCompressJPEG_Comment                   0x6A503
#undef  CompressJPEG_WriteLineExtended
#define CompressJPEG_WriteLineExtended          0x4A504
#undef  XCompressJPEG_WriteLineExtended
#define XCompressJPEG_WriteLineExtended         0x6A504
#undef  CompressJPEG_Transcode
#define CompressJPEG_Transcode                  0x4A510
#undef  XCompressJPEG_Transcode
#define XCompressJPEG_Transcode                 0x6A510

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct compressjpeg_tag_                *compressjpeg_tag;
typedef struct compressjpeg_parameters          compressjpeg_parameters;
typedef struct compressjpeg_scan_description    compressjpeg_scan_description;
typedef struct compressjpeg_scan_description_base compressjpeg_scan_description_base;

/********************
 * Type definitions *
 ********************/
struct compressjpeg_parameters
   {  int width;
      int height;
      int quality;
      int bytes_per_pixel;
      int xdpi;
      int ydpi;
   };

#define compressjpeg_SCAN_DESCRIPTION_MEMBERS \
   int scan_count;

/* Base compressjpeg_scan_description structure without variable part */
struct compressjpeg_scan_description_base
   {  compressjpeg_SCAN_DESCRIPTION_MEMBERS
   };

/* legacy structure */
struct compressjpeg_scan_description
   {  compressjpeg_SCAN_DESCRIPTION_MEMBERS
      struct \
   {  int components; \
      int r; \
      int g; \
      int b; \
      int ss; \
      int se; \
      int ah; \
      int al; \
   } \
   scan_data [UNKNOWN];
   };

#define compressjpeg_SCAN_DESCRIPTION(N) \
   struct \
      {  compressjpeg_SCAN_DESCRIPTION_MEMBERS \
         struct \
   {  int components; \
      int r; \
      int g; \
      int b; \
      int ss; \
      int se; \
      int ah; \
      int al; \
   } \
   scan_data [N]; \
      }

#define compressjpeg_SIZEOF_SCAN_DESCRIPTION(N) \
   (offsetof (compressjpeg_scan_description, scan_data) + \
         (N)*sizeof ((compressjpeg_scan_description *) NULL)->scan_data)

typedef bits compressjpeg_comment_flags;

typedef bits compressjpeg_write_line_flags;

typedef bits compressjpeg_transcode_flags;

/************************
 * Constant definitions *
 ************************/
#define compressjpeg_CONTROL_TERMINATED         ((compressjpeg_comment_flags) 0x1u)
#define compressjpeg_SOURCE_TYPE                ((compressjpeg_write_line_flags) 0x7u)
#define compressjpeg_SOURCE_TYPE1_BPP           ((compressjpeg_write_line_flags) 0x0u)
#define compressjpeg_SOURCE_TYPE2_BPP           ((compressjpeg_write_line_flags) 0x1u)
#define compressjpeg_SOURCE_TYPE4_BPP           ((compressjpeg_write_line_flags) 0x2u)
#define compressjpeg_SOURCE_TYPE8_BPP           ((compressjpeg_write_line_flags) 0x3u)
#define compressjpeg_SOURCE_TYPE16BPP           ((compressjpeg_write_line_flags) 0x4u)
#define compressjpeg_SOURCE_TYPE32BPP           ((compressjpeg_write_line_flags) 0x5u)
#define compressjpeg_SOURCE_TYPE_RGB_TRIPLES    ((compressjpeg_write_line_flags) 0x7u)
#define compressjpeg_HAS_DOUBLE_ENTRIES         ((compressjpeg_write_line_flags) 0x8u)
#define compressjpeg_IGNORE_HIGH_BYTE           ((compressjpeg_write_line_flags) 0x10u)
#define compressjpeg_IS_RGB                     ((compressjpeg_write_line_flags) 0x20u)
#define compressjpeg_GENERATE_PROGRESSIVE       ((compressjpeg_transcode_flags) 0x1u)
#define compressjpeg_OPERATION_ON_UNKNOWNS      ((compressjpeg_transcode_flags) 0x6u)
#define compressjpeg_OPERATION_ON_UNKNOWNS_SHIFT 1
#define compressjpeg_TRANSFORMATION_TYPE        ((compressjpeg_transcode_flags) 0x78u)
#define compressjpeg_TRANSFORMATION_TYPE_SHIFT  3
#define compressjpeg_TRIM_EDGES                 ((compressjpeg_transcode_flags) 0x80u)
#define compressjpeg_GENERATE_GREYSCALE         ((compressjpeg_transcode_flags) 0x100u)
#define compressjpeg_OPTIMISE_FOR_SMALLER       ((compressjpeg_transcode_flags) 0x200u)
#define compressjpeg_COPY_NO_ADDITIONAL         ((compressjpeg_transcode_flags) 0x0u)
      /*shift by CompressJPEG_OperationOnUnknownsShift*/
#define compressjpeg_COPY_COMMENTS              ((compressjpeg_transcode_flags) 0x1u)
      /*shift by CompressJPEG_OperationOnUnknownsShift*/
#define compressjpeg_COPY_ALL_ELEMENTS          ((compressjpeg_transcode_flags) 0x3u)
      /*shift by CompressJPEG_OperationOnUnknownsShift*/
#define compressjpeg_NO_TRANSFORMATION          ((compressjpeg_transcode_flags) 0x0u)
      /*shift by CompressJPEG_TransformationTypeShift*/
#define compressjpeg_FLIP_HORIZONTALLY          ((compressjpeg_transcode_flags) 0x1u)
      /*shift by CompressJPEG_TransformationTypeShift*/
#define compressjpeg_FLIP_VERTICALLY            ((compressjpeg_transcode_flags) 0x2u)
      /*shift by CompressJPEG_TransformationTypeShift*/
#define compressjpeg_ROTATE90_CLOCKWISE         ((compressjpeg_transcode_flags) 0x3u)
      /*shift by CompressJPEG_TransformationTypeShift*/
#define compressjpeg_ROTATE180                  ((compressjpeg_transcode_flags) 0x4u)
      /*shift by CompressJPEG_TransformationTypeShift*/
#define compressjpeg_ROTATE90_ANTI_CLOCKWISE    ((compressjpeg_transcode_flags) 0x5u)
      /*shift by CompressJPEG_TransformationTypeShift*/
#define compressjpeg_TRANSPOSE                  ((compressjpeg_transcode_flags) 0x6u)
      /*shift by CompressJPEG_TransformationTypeShift*/
#define compressjpeg_TRANSVERSE_TRANSPOSE       ((compressjpeg_transcode_flags) 0x7u)
      /*shift by CompressJPEG_TransformationTypeShift*/
#define error_COMPRESS_JPEG_BAD_BPP             0x8183C0u
#define error_COMPRESS_JPEG_BAD_LINE_COUNT      0x8183C1u
#define error_COMPRESS_JPEG_BAD_BUFFER          0x8183C2u
#define error_COMPRESS_JPEG_BAD_SIZE            0x8183C3u
#define error_COMPRESS_JPEG_ARITH_NOT_IMPL      0x81A881u
#define error_COMPRESS_JPEG_BAD_ALIGN_TYPE      0x81A882u
#define error_COMPRESS_JPEG_BAD_ALLOC_CHUNK     0x81A883u
#define error_COMPRESS_JPEG_BAD_BUFFER_MODE     0x81A884u
#define error_COMPRESS_JPEG_BAD_COMPONENT_ID    0x81A885u
#define error_COMPRESS_JPEG_BAD_DCT_SIZE        0x81A886u
#define error_COMPRESS_JPEG_BAD_IN_COLOUR_SPACE 0x81A887u
#define error_COMPRESS_JPEG_BAD_KCOLOUR_SPACE   0x81A888u
#define error_COMPRESS_JPEG_BAD_LENGTH          0x81A889u
#define error_COMPRESS_JPEG_BAD_MCU_SIZE        0x81A88Au
#define error_COMPRESS_JPEG_BAD_POOL_ID         0x81A88Bu
#define error_COMPRESS_JPEG_BAD_PRECISION       0x81A88Cu
#define error_COMPRESS_JPEG_BAD_SAMPLING        0x81A88Du
#define error_COMPRESS_JPEG_BAD_STATE           0x81A88Eu
#define error_COMPRESS_JPEG_BAD_VIRTUAL_ACCESS  0x81A88Fu
#define error_COMPRESS_JPEG_BUFFER_SIZE         0x81A890u
#define error_COMPRESS_JPEG_CANT_SUSPEND        0x81A891u
#define error_COMPRESS_JPEGCCIR601_NOT_IMPL     0x81A892u
#define error_COMPRESS_JPEG_COMPONENT_COUNT     0x81A893u
#define error_COMPRESS_JPEG_CONVERSION_NOT_IMPL 0x81A894u
#define error_COMPRESS_JPEGDAC_INDEX            0x81A895u
#define error_COMPRESS_JPEGDAC_VALUE            0x81A896u
#define error_COMPRESS_JPEGDHT_INDEX            0x81A897u
#define error_COMPRESS_JPEGDQT_INDEX            0x81A898u
#define error_COMPRESS_JPEG_EMPTY_IMAGE         0x81A899u
#define error_COMPRESS_JPEGEOI_EXPECTED         0x81A89Au
#define error_COMPRESS_JPEG_FILE_READ           0x81A89Bu
#define error_COMPRESS_JPEG_FILE_WRITE          0x81A89Cu
#define error_COMPRESS_JPEG_FRACT_SAMPLE_NOT_IMPL 0x81A89Du
#define error_COMPRESS_JPEG_HUFF_CLEN_OVERFLOW  0x81A89Eu
#define error_COMPRESS_JPEG_HUFF_MISSING_CODE   0x81A89Fu
#define error_COMPRESS_JPEG_IMAGE_TOO_BIG       0x81A8A0u
#define error_COMPRESS_JPEG_INPUT_EMPTY         0x81A8A1u
#define error_COMPRESS_JPEG_INPUT_EOF           0x81A8A2u
#define error_COMPRESS_JPEG_NOT_IMPL            0x81A8A3u
#define error_COMPRESS_JPEG_NOT_COMPILED        0x81A8A4u
#define error_COMPRESS_JPEG_NO_BACKING_STORE    0x81A8A5u
#define error_COMPRESS_JPEG_NO_HUFF_TABLE       0x81A8A6u
#define error_COMPRESS_JPEG_NO_IMAGE            0x81A8A7u
#define error_COMPRESS_JPEG_NO_QUANT_TABLE      0x81A8A8u
#define error_COMPRESS_JPEG_NO_SOI              0x81A8A9u
#define error_COMPRESS_JPEG_OUT_OF_MEMORY       0x81A8AAu
#define error_COMPRESS_JPEG_QUANT_COMPONENTS    0x81A8ABu
#define error_COMPRESS_JPEG_QUANT_FEW_COLOURS   0x81A8ACu
#define error_COMPRESS_JPEG_QUANT_MANY_COLOURS  0x81A8ADu
#define error_COMPRESS_JPEGSOF_DUPLICATE        0x81A8AEu
#define error_COMPRESS_JPEGSOF_NO_SOS           0x81A8AFu
#define error_COMPRESS_JPEGSOF_UNSUPPORTED      0x81A8B0u
#define error_COMPRESS_JPEGSOI_DUPLICATE        0x81A8B1u
#define error_COMPRESS_JPEGSOS_NO_SOF           0x81A8B2u
#define error_COMPRESS_JPEG_TOO_LITTLE_DATA     0x81A8B3u
#define error_COMPRESS_JPEG_UNKNOWN_MARKER      0x81A8B4u
#define error_COMPRESS_JPEG_VIRTUAL_BUG         0x81A8B5u
#define error_COMPRESS_JPEG_WIDTH_OVERFLOW      0x81A8B6u
#define error_COMPRESS_JPEG_BAD_DCT_COEF        0x81A8B7u
#define error_COMPRESS_JPEG_BAD_HUFF_TABLE      0x81A8B8u
#define error_COMPRESS_JPEG_BAD_PROGRESSION     0x81A8B9u
#define error_COMPRESS_JPEG_BAD_PROG_SCRIPT     0x81A8BAu
#define error_COMPRESS_JPEG_BAD_SCAN_SCRIPT     0x81A8BBu
#define error_COMPRESS_JPEG_MISMATCHED_QUANT_TABLE 0x81A8BCu
#define error_COMPRESS_JPEG_MISSING_DATA        0x81A8BDu
#define error_COMPRESS_JPEG_MODE_CHANGE         0x81A8BEu
#define error_COMPRESS_JPEGW_BUFFER_SIZE        0x81A8BFu

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      compressjpeg_start()
 *
 * Description:   Starts the JPEG compression process and sets up various
 *                parameters
 *
 * Input:         image - value of R0 on entry
 *                image_size - value of R1 on entry
 *                parameters - value of R2 on entry
 *                workspace - value of R3 on entry
 *                workspace_size - value of R4 on entry
 *
 * Output:        tag - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4A500.
 */

extern os_error *xcompressjpeg_start (jpeg_image const *image,
      int image_size,
      compressjpeg_parameters const *parameters,
      void *workspace,
      int workspace_size,
      compressjpeg_tag *tag);
extern compressjpeg_tag compressjpeg_start (jpeg_image const *image,
      int image_size,
      compressjpeg_parameters const *parameters,
      void *workspace,
      int workspace_size);

/* ------------------------------------------------------------------------
 * Function:      compressjpeg_write_line()
 *
 * Description:   Compresses one row of source pixels into the JPEG buffer
 *
 * Input:         tag - value of R0 on entry
 *                pixels - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x4A501.
 */

extern os_error *xcompressjpeg_write_line (compressjpeg_tag tag,
      byte const *pixels);
__swi (0x4A501) void compressjpeg_write_line (compressjpeg_tag tag,
      byte const *pixels);

/* ------------------------------------------------------------------------
 * Function:      compressjpeg_finish()
 *
 * Description:   Tidies up JPEG buffer
 *
 * Input:         tag - value of R0 on entry
 *
 * Output:        image_size - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4A502.
 */

extern os_error *xcompressjpeg_finish (compressjpeg_tag tag,
      int *image_size);
__swi (0x4A502) int compressjpeg_finish (compressjpeg_tag tag);

/* ------------------------------------------------------------------------
 * Function:      compressjpeg_comment()
 *
 * Description:   Add a textual comment to a JPEG - RISC O S Select
 *
 * Input:         tag - value of R0 on entry
 *                flags - value of R1 on entry
 *                comment - value of R2 on entry
 *                comment_size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x4A503.
 */

extern os_error *xcompressjpeg_comment (compressjpeg_tag tag,
      compressjpeg_comment_flags flags,
      char const *comment,
      int comment_size);
__swi (0x4A503) void compressjpeg_comment (compressjpeg_tag tag,
      compressjpeg_comment_flags flags,
      char const *comment,
      int comment_size);

/* ------------------------------------------------------------------------
 * Function:      compressjpeg_write_line_extended()
 *
 * Description:   Compresses multiple rows of (paletted) source pixels into
 *                the JPEG buffer - RISC O S Select
 *
 * Input:         tag - value of R0 on entry
 *                flags - value of R1 on entry
 *                image_data - value of R2 on entry
 *                palette_data - value of R3 on entry
 *                lines - value of R4 on entry
 *                bytes_between_lines - value of R5 on entry
 *
 * Output:        image_data_end - value of R2 on exit (X version only)
 *                lines_written - value of R4 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4A504.
 */

extern os_error *xcompressjpeg_write_line_extended (compressjpeg_tag tag,
      compressjpeg_write_line_flags flags,
      byte const *image_data,
      byte const *palette_data,
      int lines,
      int bytes_between_lines,
      byte **image_data_end,
      int *lines_written);
extern byte *compressjpeg_write_line_extended (compressjpeg_tag tag,
      compressjpeg_write_line_flags flags,
      byte const *image_data,
      byte const *palette_data,
      int lines,
      int bytes_between_lines,
      int *lines_written);

/* ------------------------------------------------------------------------
 * Function:      compressjpeg_transcode()
 *
 * Description:   Transcodes a JPEG from one form to another - RISC O S
 *                Select
 *
 * Input:         flags - value of R0 on entry
 *                source_data - value of R1 on entry
 *                source_size - value of R2 on entry
 *                destination_data - value of R3 on entry
 *                destination_size - value of R4 on entry
 *                workspace - value of R5 on entry
 *                workspace_size - value of R6 on entry
 *                scans - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x4A510.
 */

extern os_error *xcompressjpeg_transcode (compressjpeg_transcode_flags flags,
      byte const *source_data,
      int source_size,
      byte *destination_data,
      int destination_size,
      byte *workspace,
      int workspace_size,
      compressjpeg_scan_description const *scans);
extern void compressjpeg_transcode (compressjpeg_transcode_flags flags,
      byte const *source_data,
      int source_size,
      byte *destination_data,
      int destination_size,
      byte *workspace,
      int workspace_size,
      compressjpeg_scan_description const *scans);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
