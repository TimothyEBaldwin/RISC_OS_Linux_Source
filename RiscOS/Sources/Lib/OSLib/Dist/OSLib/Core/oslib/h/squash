#ifndef squash_H
#define squash_H

/* C header file for Squash
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:29 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 Jun 1995
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Squash_CompressReturnSizes
#define Squash_CompressReturnSizes              0x42700
#undef  XSquash_CompressReturnSizes
#define XSquash_CompressReturnSizes             0x62700
#undef  Squash_Compress
#define Squash_Compress                         0x42700
#undef  XSquash_Compress
#define XSquash_Compress                        0x62700
#undef  Squash_DecompressReturnSizes
#define Squash_DecompressReturnSizes            0x42701
#undef  XSquash_DecompressReturnSizes
#define XSquash_DecompressReturnSizes           0x62701
#undef  Squash_Decompress
#define Squash_Decompress                       0x42701
#undef  XSquash_Decompress
#define XSquash_Decompress                      0x62701

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct squash_file                      squash_file;
typedef struct squash_file_base                 squash_file_base;

/********************
 * Type definitions *
 ********************/
typedef bits squash_input_status;

typedef bits squash_output_status;

#define squash_FILE_MEMBERS \
   bits id; \
   int size; \
   bits load_addr; \
   bits exec_addr; \
   int reserved;

/* Base squash_file structure without variable part */
struct squash_file_base
   {  squash_FILE_MEMBERS
   };

/* legacy structure */
struct squash_file
   {  squash_FILE_MEMBERS
      byte data [UNKNOWN];
   };

#define squash_FILE(N) \
   struct \
      {  squash_FILE_MEMBERS \
         byte data [N]; \
      }

#define squash_SIZEOF_FILE(N) \
   (offsetof (squash_file, data) + \
         (N)*sizeof ((squash_file *) NULL)->data)

/************************
 * Constant definitions *
 ************************/
#define error_SQUASH_BAD_ADDRESS                0x921u
#define error_SQUASH_BAD_INPUT                  0x922u
#define error_SQUASH_BAD_WORKSPACE              0x923u
#define error_SQUASH_BAD_PARAMETERS             0x924u
#define squash_FILE_TYPE                        0xFCAu
#define squash_INPUT_NOT_START                  ((squash_input_status) 0x1u)
#define squash_INPUT_NOT_END                    ((squash_input_status) 0x2u)
#define squash_INPUT_ALL_PRESENT                ((squash_input_status) 0x4u)
#define squash_OUTPUT_END                       ((squash_output_status) 0x1u)
#define squash_OUTPUT_MORE                      ((squash_output_status) 0x2u)
#define squash_OUTPUT_NO_MEM                    ((squash_output_status) 0x4u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      squash_compress_return_sizes()
 *
 * Description:   Returns the workspace and maximum output sizes for
 *                Squash_Compress
 *
 * Input:         input_size - value of R1 on entry
 *
 * Output:        workspace_size - value of R0 on exit
 *                output_size - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x42700 with R0 = 0x8.
 */

extern os_error *xsquash_compress_return_sizes (int input_size,
      int *workspace_size,
      int *output_size);
extern void squash_compress_return_sizes (int input_size,
      int *workspace_size,
      int *output_size);

/* ------------------------------------------------------------------------
 * Function:      squash_compress()
 *
 * Description:   Provides general compression of a lossless nature
 *
 * Input:         input_status - value of R0 on entry
 *                workspace - value of R1 on entry
 *                input - value of R2 on entry
 *                input_size - value of R3 on entry
 *                output - value of R4 on entry
 *                output_size - value of R5 on entry
 *
 * Output:        output_status - value of R0 on exit
 *                input_out - value of R2 on exit
 *                input_spare - value of R3 on exit
 *                output_out - value of R4 on exit
 *                output_spare - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x42700.
 */

extern os_error *xsquash_compress (squash_input_status input_status,
      void *workspace,
      byte const *input,
      int input_size,
      byte *output,
      int output_size,
      squash_output_status *output_status,
      byte **input_out,
      int *input_spare,
      byte **output_out,
      int *output_spare);
extern void squash_compress (squash_input_status input_status,
      void *workspace,
      byte const *input,
      int input_size,
      byte *output,
      int output_size,
      squash_output_status *output_status,
      byte **input_out,
      int *input_spare,
      byte **output_out,
      int *output_spare);

/* ------------------------------------------------------------------------
 * Function:      squash_decompress_return_sizes()
 *
 * Description:   Returns the workspace and maximum output sizes for
 *                Squash_Decompress
 *
 * Input:         input_size - value of R1 on entry
 *
 * Output:        workspace_size - value of R0 on exit
 *                output_size - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x42701 with R0 = 0x8.
 */

extern os_error *xsquash_decompress_return_sizes (int input_size,
      int *workspace_size,
      int *output_size);
extern void squash_decompress_return_sizes (int input_size,
      int *workspace_size,
      int *output_size);

/* ------------------------------------------------------------------------
 * Function:      squash_decompress()
 *
 * Description:   Decompresses data produced by Squash_Compress
 *
 * Input:         input_status - value of R0 on entry
 *                workspace - value of R1 on entry
 *                input - value of R2 on entry
 *                input_size - value of R3 on entry
 *                output - value of R4 on entry
 *                output_size - value of R5 on entry
 *
 * Output:        output_status - value of R0 on exit
 *                input_out - value of R2 on exit
 *                input_spare - value of R3 on exit
 *                output_out - value of R4 on exit
 *                output_spare - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x42701.
 */

extern os_error *xsquash_decompress (squash_input_status input_status,
      void *workspace,
      byte const *input,
      int input_size,
      byte *output,
      int output_size,
      squash_output_status *output_status,
      byte **input_out,
      int *input_spare,
      byte **output_out,
      int *output_spare);
extern void squash_decompress (squash_input_status input_status,
      void *workspace,
      byte const *input,
      int input_size,
      byte *output,
      int output_size,
      squash_output_status *output_status,
      byte **input_out,
      int *input_spare,
      byte **output_out,
      int *output_spare);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
