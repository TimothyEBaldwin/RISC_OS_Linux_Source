#ifndef zlib_H
#define zlib_H

/* C header file for ZLib
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:44 2007
 * Tom Hughes, tom@compton.nu, 22 Sep 2002
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

#ifndef fileswitch_H
#include "oslib/fileswitch.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  ZLib_Compress
#define ZLib_Compress                           0x53AC0
#undef  XZLib_Compress
#define XZLib_Compress                          0x73AC0
#undef  ZLib_Decompress
#define ZLib_Decompress                         0x53AC1
#undef  XZLib_Decompress
#define XZLib_Decompress                        0x73AC1
#undef  ZLib_CRC32
#define ZLib_CRC32                              0x53AC2
#undef  XZLib_CRC32
#define XZLib_CRC32                             0x73AC2
#undef  ZLib_Adler32
#define ZLib_Adler32                            0x53AC3
#undef  XZLib_Adler32
#define XZLib_Adler32                           0x73AC3
#undef  ZLib_Version
#define ZLib_Version                            0x53AC4
#undef  XZLib_Version
#define XZLib_Version                           0x73AC4
#undef  ZLib_ZCompress
#define ZLib_ZCompress                          0x53AC5
#undef  XZLib_ZCompress
#define XZLib_ZCompress                         0x73AC5
#undef  ZLib_ZCompress2
#define ZLib_ZCompress2                         0x53AC6
#undef  XZLib_ZCompress2
#define XZLib_ZCompress2                        0x73AC6
#undef  ZLib_ZUncompress
#define ZLib_ZUncompress                        0x53AC7
#undef  XZLib_ZUncompress
#define XZLib_ZUncompress                       0x73AC7
#undef  ZLib_DeflateInit
#define ZLib_DeflateInit                        0x53AC8
#undef  XZLib_DeflateInit
#define XZLib_DeflateInit                       0x73AC8
#undef  ZLib_InflateInit
#define ZLib_InflateInit                        0x53AC9
#undef  XZLib_InflateInit
#define XZLib_InflateInit                       0x73AC9
#undef  ZLib_DeflateInit2
#define ZLib_DeflateInit2                       0x53ACA
#undef  XZLib_DeflateInit2
#define XZLib_DeflateInit2                      0x73ACA
#undef  ZLib_InflateInit2
#define ZLib_InflateInit2                       0x53ACB
#undef  XZLib_InflateInit2
#define XZLib_InflateInit2                      0x73ACB
#undef  ZLib_Deflate
#define ZLib_Deflate                            0x53ACC
#undef  XZLib_Deflate
#define XZLib_Deflate                           0x73ACC
#undef  ZLib_DeflateEnd
#define ZLib_DeflateEnd                         0x53ACD
#undef  XZLib_DeflateEnd
#define XZLib_DeflateEnd                        0x73ACD
#undef  ZLib_Inflate
#define ZLib_Inflate                            0x53ACE
#undef  XZLib_Inflate
#define XZLib_Inflate                           0x73ACE
#undef  ZLib_InflateEnd
#define ZLib_InflateEnd                         0x53ACF
#undef  XZLib_InflateEnd
#define XZLib_InflateEnd                        0x73ACF
#undef  ZLib_DeflateSetDictionary
#define ZLib_DeflateSetDictionary               0x53AD0
#undef  XZLib_DeflateSetDictionary
#define XZLib_DeflateSetDictionary              0x73AD0
#undef  ZLib_DeflateCopy
#define ZLib_DeflateCopy                        0x53AD1
#undef  XZLib_DeflateCopy
#define XZLib_DeflateCopy                       0x73AD1
#undef  ZLib_DeflateReset
#define ZLib_DeflateReset                       0x53AD2
#undef  XZLib_DeflateReset
#define XZLib_DeflateReset                      0x73AD2
#undef  ZLib_DeflateParams
#define ZLib_DeflateParams                      0x53AD3
#undef  XZLib_DeflateParams
#define XZLib_DeflateParams                     0x73AD3
#undef  ZLib_InflateSetDictionary
#define ZLib_InflateSetDictionary               0x53AD4
#undef  XZLib_InflateSetDictionary
#define XZLib_InflateSetDictionary              0x73AD4
#undef  ZLib_InflateSync
#define ZLib_InflateSync                        0x53AD5
#undef  XZLib_InflateSync
#define XZLib_InflateSync                       0x73AD5
#undef  ZLib_InflateReset
#define ZLib_InflateReset                       0x53AD6
#undef  XZLib_InflateReset
#define XZLib_InflateReset                      0x73AD6
#undef  ZLib_GZOpen
#define ZLib_GZOpen                             0x53AD7
#undef  XZLib_GZOpen
#define XZLib_GZOpen                            0x73AD7
#undef  ZLib_GZRead
#define ZLib_GZRead                             0x53AD8
#undef  XZLib_GZRead
#define XZLib_GZRead                            0x73AD8
#undef  ZLib_GZWrite
#define ZLib_GZWrite                            0x53AD9
#undef  XZLib_GZWrite
#define XZLib_GZWrite                           0x73AD9
#undef  ZLib_GZFlush
#define ZLib_GZFlush                            0x53ADA
#undef  XZLib_GZFlush
#define XZLib_GZFlush                           0x73ADA
#undef  ZLib_GZClose
#define ZLib_GZClose                            0x53ADB
#undef  XZLib_GZClose
#define XZLib_GZClose                           0x73ADB
#undef  ZLib_GZError
#define ZLib_GZError                            0x53ADC
#undef  XZLib_GZError
#define XZLib_GZError                           0x73ADC
#undef  ZLib_GZSeek
#define ZLib_GZSeek                             0x53ADD
#undef  XZLib_GZSeek
#define XZLib_GZSeek                            0x73ADD
#undef  ZLib_GZTell
#define ZLib_GZTell                             0x53ADE
#undef  XZLib_GZTell
#define XZLib_GZTell                            0x73ADE
#undef  ZLib_GZEOF
#define ZLib_GZEOF                              0x53ADF
#undef  XZLib_GZEOF
#define XZLib_GZEOF                             0x73ADF
#undef  ZLib_TaskAssociate
#define ZLib_TaskAssociate                      0x53ADF
#undef  XZLib_TaskAssociate
#define XZLib_TaskAssociate                     0x73ADF

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct zlib_stream_control_block        zlib_stream_control_block;
typedef struct zlib_gzip_handle_                *zlib_gzip_handle;

/********************
 * Type definitions *
 ********************/
typedef int zlib_data_type;

typedef int zlib_flush_type;

typedef int zlib_compression_level;

typedef int zlib_compression_strategy;

typedef int zlib_compression_method;

typedef int zlib_memory_level;

typedef int zlib_window_bits;

typedef int zlib_return_code;

typedef int zlib_seek_type;

struct zlib_stream_control_block
   {  int next_in;
      int avail_in;
      int total_in;
      int next_out;
      int avail_out;
      int total_out;
      char *msg;
      int state;
      byte *zalloc;
      byte *zfree;
      byte *opaque;
      zlib_data_type data_type;
      int adler;
      int reserved;
   };

/************************
 * Constant definitions *
 ************************/
#define zlib_BINARY_DATA                        ((zlib_data_type) 0x0u)
#define zlib_ASCII_DATA                         ((zlib_data_type) 0x1u)
#define zlib_UNKNOWN_DATA                       ((zlib_data_type) 0x2u)
#define zlib_NO_FLUSH                           ((zlib_flush_type) 0x0u)
#define zlib_PARTIAL_FLUSH                      ((zlib_flush_type) 0x1u)
#define zlib_SYNC_FLUSH                         ((zlib_flush_type) 0x2u)
#define zlib_FULL_FLUSH                         ((zlib_flush_type) 0x3u)
#define zlib_FINISH                             ((zlib_flush_type) 0x4u)
#define zlib_NO_COMPRESSION                     ((zlib_compression_level) 0x0u)
#define zlib_BEST_SPEED                         ((zlib_compression_level) 0x1u)
#define zlib_BEST_COMPRESSION                   ((zlib_compression_level) 0x9u)
#define zlib_DEFAULT_COMPRESSION                ((zlib_compression_level) 0xFFFFFFFFu)
#define zlib_DEFAULT_STRATEGY                   ((zlib_compression_strategy) 0x0u)
#define zlib_FILTERED                           ((zlib_compression_strategy) 0x1u)
#define zlib_HUFFMAN_ONLY                       ((zlib_compression_strategy) 0x2u)
#define zlib_DEFLATED                           ((zlib_compression_method) 0x8u)
#define zlib_OK                                 ((zlib_return_code) 0x0u)
#define zlib_STREAM_END                         ((zlib_return_code) 0x1u)
#define zlib_NEED_DICT                          ((zlib_return_code) 0x2u)
#define zlib_ERRNO                              ((zlib_return_code) 0xFFFFFFFFu)
#define zlib_STREAM_ERROR                       ((zlib_return_code) 0xFFFFFFFEu)
#define zlib_DATA_ERROR                         ((zlib_return_code) 0xFFFFFFFDu)
#define zlib_MEM_ERROR                          ((zlib_return_code) 0xFFFFFFFCu)
#define zlib_BUF_ERROR                          ((zlib_return_code) 0xFFFFFFFBu)
#define zlib_VERSION_ERROR                      ((zlib_return_code) 0xFFFFFFFAu)
#define zlib_SEEK_ABSOLUTE                      ((zlib_seek_type) 0x0u)
#define zlib_SEEK_RELATIVE                      ((zlib_seek_type) 0x1u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      zlib_compress_return_sizes()
 *
 *
 * Input:         input_size - value of R1 on entry
 *
 * Output:        workspace_size - value of R0 on exit
 *                output_size - value of R1 on exit
 *
 * Other notes:   Before entry, R0 = 0x8.
 */

extern os_error *xzlib_compress_return_sizes (int input_size,
      int *workspace_size,
      int *output_size);
extern void zlib_compress_return_sizes (int input_size,
      int *workspace_size,
      int *output_size);

/* ------------------------------------------------------------------------
 * Function:      zlib_compress()
 *
 * Description:   Simple Squash-like compression
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                input - value of R2 on entry
 *                input_size - value of R3 on entry
 *                output - value of R4 on entry
 *                output_size - value of R5 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *                unused_input - value of R2 on exit
 *                unused_input_size - value of R3 on exit
 *                unused_output - value of R4 on exit
 *                unused_output_size - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AC0.
 */

extern os_error *xzlib_compress (bits flags,
      byte *workspace,
      byte const *input,
      int input_size,
      byte *output,
      int output_size,
      bits *status,
      byte **unused_input,
      int *unused_input_size,
      byte **unused_output,
      int *unused_output_size);
extern bits zlib_compress (bits flags,
      byte *workspace,
      byte const *input,
      int input_size,
      byte *output,
      int output_size,
      byte **unused_input,
      int *unused_input_size,
      byte **unused_output,
      int *unused_output_size);

/* ------------------------------------------------------------------------
 * Function:      zlib_decompress_return_sizes()
 *
 *
 * Input:         input_size - value of R1 on entry
 *
 * Output:        workspace_size - value of R0 on exit
 *                output_size - value of R1 on exit
 *
 * Other notes:   Before entry, R0 = 0x8.
 */

extern os_error *xzlib_decompress_return_sizes (int input_size,
      int *workspace_size,
      int *output_size);
extern void zlib_decompress_return_sizes (int input_size,
      int *workspace_size,
      int *output_size);

/* ------------------------------------------------------------------------
 * Function:      zlib_decompress()
 *
 * Description:   Simple Squash-like decompression
 *
 * Input:         flags - value of R0 on entry
 *                workspace - value of R1 on entry
 *                input - value of R2 on entry
 *                input_size - value of R3 on entry
 *                output - value of R4 on entry
 *                output_size - value of R5 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *                unused_input - value of R2 on exit
 *                unused_input_size - value of R3 on exit
 *                unused_output - value of R4 on exit
 *                unused_output_size - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AC1.
 */

extern os_error *xzlib_decompress (bits flags,
      byte *workspace,
      byte const *input,
      int input_size,
      byte *output,
      int output_size,
      bits *status,
      byte **unused_input,
      int *unused_input_size,
      byte **unused_output,
      int *unused_output_size);
extern bits zlib_decompress (bits flags,
      byte *workspace,
      byte const *input,
      int input_size,
      byte *output,
      int output_size,
      byte **unused_input,
      int *unused_input_size,
      byte **unused_output,
      int *unused_output_size);

/* ------------------------------------------------------------------------
 * Function:      zlib_crc32()
 *
 * Description:   Calculate a CRC32 checksum for a given data buffer
 *
 * Input:         continuation_value - value of R0 on entry
 *                data_start - value of R1 on entry
 *                data_end - value of R2 on entry
 *
 * Output:        crc32 - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AC2.
 */

extern os_error *xzlib_crc32 (int continuation_value,
      byte const *data_start,
      byte const *data_end,
      int *crc32);
__swi (0x53AC2) int zlib_crc32 (int continuation_value,
      byte const *data_start,
      byte const *data_end);

/* ------------------------------------------------------------------------
 * Function:      zlib_adler32()
 *
 * Description:   Calculate a Adler32 checksum for a given data buffer
 *
 * Input:         continuation_value - value of R0 on entry
 *                data_start - value of R1 on entry
 *                data_end - value of R2 on entry
 *
 * Output:        crc32 - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AC3.
 */

extern os_error *xzlib_adler32 (int continuation_value,
      byte const *data_start,
      byte const *data_end,
      int *crc32);
__swi (0x53AC3) int zlib_adler32 (int continuation_value,
      byte const *data_start,
      byte const *data_end);

/* ------------------------------------------------------------------------
 * Function:      zlib_version()
 *
 * Description:   Return the version of ZLib in use
 *
 * Output:        version - value of R0 on exit
 *
 * Other notes:   Calls SWI 0x53AC4.
 */

extern os_error *xzlib_version (char **version);
__swi (0x53AC4) void zlib_version (char **version);

/* ------------------------------------------------------------------------
 * Function:      zlib_zcompress()
 *
 * Description:   Compress a source buffer
 *
 * Input:         output - value of R0 on entry
 *                output_size - value of R1 on entry
 *                input - value of R2 on entry
 *                input_size - value of R3 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *                output_used - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AC5.
 */

extern os_error *xzlib_zcompress (byte *output,
      int output_size,
      byte const *input,
      int input_size,
      zlib_return_code *return_code,
      int *output_used);
extern zlib_return_code zlib_zcompress (byte *output,
      int output_size,
      byte const *input,
      int input_size,
      int *output_used);

/* ------------------------------------------------------------------------
 * Function:      zlib_zcompress2()
 *
 * Description:   Compress a source buffer
 *
 * Input:         output - value of R0 on entry
 *                output_size - value of R1 on entry
 *                input - value of R2 on entry
 *                input_size - value of R3 on entry
 *                compression_level - value of R4 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *                output_used - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AC6.
 */

extern os_error *xzlib_zcompress2 (byte *output,
      int output_size,
      byte const *input,
      int input_size,
      zlib_compression_level compression_level,
      zlib_return_code *return_code,
      int *output_used);
extern zlib_return_code zlib_zcompress2 (byte *output,
      int output_size,
      byte const *input,
      int input_size,
      zlib_compression_level compression_level,
      int *output_used);

/* ------------------------------------------------------------------------
 * Function:      zlib_zuncompress()
 *
 * Description:   Uncompress a source buffer
 *
 * Input:         output - value of R0 on entry
 *                output_size - value of R1 on entry
 *                input - value of R2 on entry
 *                input_size - value of R3 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *                output_used - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AC7.
 */

extern os_error *xzlib_zuncompress (byte *output,
      int output_size,
      byte const *input,
      int input_size,
      zlib_return_code *return_code,
      int *output_used);
extern zlib_return_code zlib_zuncompress (byte *output,
      int output_size,
      byte const *input,
      int input_size,
      int *output_used);

/* ------------------------------------------------------------------------
 * Function:      zlib_deflate_init()
 *
 * Description:   Initialise a stream for compression
 *
 * Input:         scb - value of R0 on entry
 *                compression_level - value of R1 on entry
 *                version_expected - value of R2 on entry
 *                scb_size - value of R3 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AC8.
 */

extern os_error *xzlib_deflate_init (zlib_stream_control_block *scb,
      zlib_compression_level compression_level,
      char const *version_expected,
      int scb_size,
      zlib_return_code *return_code);
__swi (0x53AC8) zlib_return_code zlib_deflate_init (zlib_stream_control_block *scb,
      zlib_compression_level compression_level,
      char const *version_expected,
      int scb_size);

/* ------------------------------------------------------------------------
 * Function:      zlib_inflate_init()
 *
 * Description:   Initialise a stream for decompression
 *
 * Input:         scb - value of R0 on entry
 *                version_expected - value of R1 on entry
 *                scb_size - value of R2 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AC9.
 */

extern os_error *xzlib_inflate_init (zlib_stream_control_block *scb,
      char const *version_expected,
      int scb_size,
      zlib_return_code *return_code);
__swi (0x53AC9) zlib_return_code zlib_inflate_init (zlib_stream_control_block *scb,
      char const *version_expected,
      int scb_size);

/* ------------------------------------------------------------------------
 * Function:      zlib_deflate_init2()
 *
 * Description:   Initialise a stream for compression with control over
 *                parameters
 *
 * Input:         scb - value of R0 on entry
 *                compression_level - value of R1 on entry
 *                compression_method - value of R2 on entry
 *                window_bits - value of R3 on entry
 *                memory_level - value of R4 on entry
 *                compression_strategy - value of R5 on entry
 *                version_expected - value of R6 on entry
 *                scb_size - value of R7 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ACA.
 */

extern os_error *xzlib_deflate_init2 (zlib_stream_control_block *scb,
      zlib_compression_level compression_level,
      zlib_compression_method compression_method,
      zlib_window_bits window_bits,
      zlib_memory_level memory_level,
      zlib_compression_strategy compression_strategy,
      char const *version_expected,
      int scb_size,
      zlib_return_code *return_code);
extern zlib_return_code zlib_deflate_init2 (zlib_stream_control_block *scb,
      zlib_compression_level compression_level,
      zlib_compression_method compression_method,
      zlib_window_bits window_bits,
      zlib_memory_level memory_level,
      zlib_compression_strategy compression_strategy,
      char const *version_expected,
      int scb_size);

/* ------------------------------------------------------------------------
 * Function:      zlib_inflate_init2()
 *
 * Description:   Initialise a stream for decompression with control over
 *                parameters
 *
 * Input:         scb - value of R0 on entry
 *                window_bits - value of R1 on entry
 *                version_expected - value of R2 on entry
 *                scb_size - value of R3 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ACB.
 */

extern os_error *xzlib_inflate_init2 (zlib_stream_control_block *scb,
      zlib_window_bits window_bits,
      char const *version_expected,
      int scb_size,
      zlib_return_code *return_code);
__swi (0x53ACB) zlib_return_code zlib_inflate_init2 (zlib_stream_control_block *scb,
      zlib_window_bits window_bits,
      char const *version_expected,
      int scb_size);

/* ------------------------------------------------------------------------
 * Function:      zlib_deflate()
 *
 * Description:   Continue a stream compression
 *
 * Input:         scb - value of R0 on entry
 *                flush_type - value of R1 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ACC.
 */

extern os_error *xzlib_deflate (zlib_stream_control_block *scb,
      zlib_flush_type flush_type,
      zlib_return_code *return_code);
__swi (0x53ACC) zlib_return_code zlib_deflate (zlib_stream_control_block *scb,
      zlib_flush_type flush_type);

/* ------------------------------------------------------------------------
 * Function:      zlib_deflate_end()
 *
 * Description:   Terminate a stream compression
 *
 * Input:         scb - value of R0 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ACD.
 */

extern os_error *xzlib_deflate_end (zlib_stream_control_block *scb,
      zlib_return_code *return_code);
__swi (0x53ACD) zlib_return_code zlib_deflate_end (zlib_stream_control_block *scb);

/* ------------------------------------------------------------------------
 * Function:      zlib_inflate()
 *
 * Description:   Continue a stream decompression
 *
 * Input:         scb - value of R0 on entry
 *                flush_type - value of R1 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ACE.
 */

extern os_error *xzlib_inflate (zlib_stream_control_block *scb,
      zlib_flush_type flush_type,
      zlib_return_code *return_code);
__swi (0x53ACE) zlib_return_code zlib_inflate (zlib_stream_control_block *scb,
      zlib_flush_type flush_type);

/* ------------------------------------------------------------------------
 * Function:      zlib_inflate_end()
 *
 * Description:   Terminate a stream decompression
 *
 * Input:         scb - value of R0 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ACF.
 */

extern os_error *xzlib_inflate_end (zlib_stream_control_block *scb,
      zlib_return_code *return_code);
__swi (0x53ACF) zlib_return_code zlib_inflate_end (zlib_stream_control_block *scb);

/* ------------------------------------------------------------------------
 * Function:      zlib_deflate_set_dictionary()
 *
 * Description:   Initialise a string dictionary for a stream compression
 *
 * Input:         scb - value of R0 on entry
 *                dictionary - pointer to a dictionary block
 *                dictionary_size - length of block in bytes
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AD0.
 */

extern os_error *xzlib_deflate_set_dictionary (zlib_stream_control_block *scb,
      byte const *dictionary,
      int dictionary_size,
      zlib_return_code *return_code);
__swi (0x53AD0) zlib_return_code zlib_deflate_set_dictionary (zlib_stream_control_block *scb,
      byte const *dictionary,
      int dictionary_size);

/* ------------------------------------------------------------------------
 * Function:      zlib_deflate_copy()
 *
 * Description:   Copy the compression state
 *
 * Input:         destination - value of R0 on entry
 *                source - value of R1 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AD1.
 */

extern os_error *xzlib_deflate_copy (zlib_stream_control_block *destination,
      zlib_stream_control_block const *source,
      zlib_return_code *return_code);
__swi (0x53AD1) zlib_return_code zlib_deflate_copy (zlib_stream_control_block *destination,
      zlib_stream_control_block const *source);

/* ------------------------------------------------------------------------
 * Function:      zlib_deflate_reset()
 *
 * Description:   Reset the internal compression state
 *
 * Input:         scb - value of R0 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AD2.
 */

extern os_error *xzlib_deflate_reset (zlib_stream_control_block *scb,
      zlib_return_code *return_code);
__swi (0x53AD2) zlib_return_code zlib_deflate_reset (zlib_stream_control_block *scb);

/* ------------------------------------------------------------------------
 * Function:      zlib_deflate_params()
 *
 * Description:   Modifies compression parameters
 *
 * Input:         scb - value of R0 on entry
 *                compression_level - value of R1 on entry
 *                compression_strategy - value of R2 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AD3.
 */

extern os_error *xzlib_deflate_params (zlib_stream_control_block *scb,
      zlib_compression_level compression_level,
      zlib_compression_strategy compression_strategy,
      zlib_return_code *return_code);
__swi (0x53AD3) zlib_return_code zlib_deflate_params (zlib_stream_control_block *scb,
      zlib_compression_level compression_level,
      zlib_compression_strategy compression_strategy);

/* ------------------------------------------------------------------------
 * Function:      zlib_inflate_set_dictionary()
 *
 * Description:   Initialise a string dictionary for a decompression stream
 *
 * Input:         scb - value of R0 on entry
 *                dictionary - pointer to a dictionary block
 *                dictionary_size - length of block in bytes
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AD4.
 */

extern os_error *xzlib_inflate_set_dictionary (zlib_stream_control_block *scb,
      byte const *dictionary,
      int dictionary_size,
      zlib_return_code *return_code);
__swi (0x53AD4) zlib_return_code zlib_inflate_set_dictionary (zlib_stream_control_block *scb,
      byte const *dictionary,
      int dictionary_size);

/* ------------------------------------------------------------------------
 * Function:      zlib_inflate_sync()
 *
 * Description:   Re-synchronise decompression stream
 *
 * Input:         scb - value of R0 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AD5.
 */

extern os_error *xzlib_inflate_sync (zlib_stream_control_block *scb,
      zlib_return_code *return_code);
__swi (0x53AD5) zlib_return_code zlib_inflate_sync (zlib_stream_control_block *scb);

/* ------------------------------------------------------------------------
 * Function:      zlib_inflate_reset()
 *
 * Description:   Reset the decompression stream state
 *
 * Input:         scb - value of R0 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AD6.
 */

extern os_error *xzlib_inflate_reset (zlib_stream_control_block *scb,
      zlib_return_code *return_code);
__swi (0x53AD6) zlib_return_code zlib_inflate_reset (zlib_stream_control_block *scb);

/* ------------------------------------------------------------------------
 * Function:      zlib_gz_open()
 *
 * Description:   Open a GZip file for reading or writing
 *
 * Input:         filename - value of R0 on entry
 *                mode - value of R1 on entry
 *                load_address_in - value of R2 on entry
 *                exec_address_in - value of R3 on entry
 *                size_in - value of R4 on entry
 *                attr_in - value of R5 on entry
 *
 * Output:        handle - value of R0 on exit (X version only)
 *                load_address_out - value of R2 on exit
 *                exec_address_out - value of R3 on exit
 *                size_out - value of R4 on exit
 *                attr_out - value of R5 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AD7.
 */

extern os_error *xzlib_gz_open (char const *filename,
      char const *mode,
      bits load_address_in,
      bits exec_address_in,
      int size_in,
      fileswitch_attr attr_in,
      zlib_gzip_handle *handle,
      bits *load_address_out,
      bits *exec_address_out,
      int *size_out,
      fileswitch_attr *attr_out);
extern zlib_gzip_handle zlib_gz_open (char const *filename,
      char const *mode,
      bits load_address_in,
      bits exec_address_in,
      int size_in,
      fileswitch_attr attr_in,
      bits *load_address_out,
      bits *exec_address_out,
      int *size_out,
      fileswitch_attr *attr_out);

/* ------------------------------------------------------------------------
 * Function:      zlib_gz_read()
 *
 * Description:   Read data from a GZip file
 *
 * Input:         handle - value of R0 on entry
 *                data - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        read - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AD8.
 */

extern os_error *xzlib_gz_read (zlib_gzip_handle handle,
      byte *data,
      int size,
      int *read);
__swi (0x53AD8) int zlib_gz_read (zlib_gzip_handle handle,
      byte *data,
      int size);

/* ------------------------------------------------------------------------
 * Function:      zlib_gz_write()
 *
 * Description:   Write data to a GZip file
 *
 * Input:         handle - value of R0 on entry
 *                data - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        written - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53AD9.
 */

extern os_error *xzlib_gz_write (zlib_gzip_handle handle,
      byte const *data,
      int size,
      int *written);
__swi (0x53AD9) int zlib_gz_write (zlib_gzip_handle handle,
      byte const *data,
      int size);

/* ------------------------------------------------------------------------
 * Function:      zlib_gz_flush()
 *
 * Description:   Flush all pending data to a GZip file
 *
 * Input:         handle - value of R0 on entry
 *                flush_type - value of R1 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ADA.
 */

extern os_error *xzlib_gz_flush (zlib_gzip_handle handle,
      zlib_flush_type flush_type,
      zlib_return_code *return_code);
__swi (0x53ADA) zlib_return_code zlib_gz_flush (zlib_gzip_handle handle,
      zlib_flush_type flush_type);

/* ------------------------------------------------------------------------
 * Function:      zlib_gz_close()
 *
 * Description:   Close a GZip file
 *
 * Input:         handle - value of R0 on entry
 *
 * Output:        return_code - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ADB.
 */

extern os_error *xzlib_gz_close (zlib_gzip_handle handle,
      zlib_return_code *return_code);
__swi (0x53ADB) zlib_return_code zlib_gz_close (zlib_gzip_handle handle);

/* ------------------------------------------------------------------------
 * Function:      zlib_gz_error()
 *
 * Description:   Return the last error message returned by a GZip
 *                operation
 *
 * Input:         handle - value of R0 on entry
 *
 * Output:        message - value of R0 on exit (X version only)
 *                return_code - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ADC.
 */

extern os_error *xzlib_gz_error (zlib_gzip_handle handle,
      char **message,
      zlib_return_code *return_code);
extern char *zlib_gz_error (zlib_gzip_handle handle,
      zlib_return_code *return_code);

/* ------------------------------------------------------------------------
 * Function:      zlib_gz_seek()
 *
 * Description:   Move to a specific location in a GZip file
 *
 * Input:         handle - value of R0 on entry
 *                position - value of R1 on entry
 *                seek_type - value of R2 on entry
 *
 * Output:        new_position - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ADD.
 */

extern os_error *xzlib_gz_seek (zlib_gzip_handle handle,
      int position,
      zlib_seek_type seek_type,
      int *new_position);
__swi (0x53ADD) int zlib_gz_seek (zlib_gzip_handle handle,
      int position,
      zlib_seek_type seek_type);

/* ------------------------------------------------------------------------
 * Function:      zlib_gz_tell()
 *
 * Description:   Return the current position in a GZip file
 *
 * Input:         handle - value of R0 on entry
 *
 * Output:        position - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ADE.
 */

extern os_error *xzlib_gz_tell (zlib_gzip_handle handle,
      int *position);
__swi (0x53ADE) int zlib_gz_tell (zlib_gzip_handle handle);

/* ------------------------------------------------------------------------
 * Function:      zlib_gzeof()
 *
 * Description:   Check whether the end of file has been reached
 *
 * Input:         handle - value of R0 on entry
 *
 * Output:        eof - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x53ADF.
 */

extern os_error *xzlib_gzeof (zlib_gzip_handle handle,
      osbool *eof);
__swi (0x53ADF) osbool zlib_gzeof (zlib_gzip_handle handle);

/* ------------------------------------------------------------------------
 * Function:      zlib_task_associate()
 *
 * Description:   Check whether the end of file has been reached
 *
 * Input:         scb - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x53ADF.
 */

extern os_error *xzlib_task_associate (zlib_stream_control_block *scb);
__swi (0x53ADF) void zlib_task_associate (zlib_stream_control_block *scb);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
