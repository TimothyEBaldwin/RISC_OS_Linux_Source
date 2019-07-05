#ifndef pdumper_H
#define pdumper_H

/* C header file for PDumper
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 19 May 1995
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
#undef  PDumper_Info
#define PDumper_Info                            0x41B00
#undef  XPDumper_Info
#define XPDumper_Info                           0x61B00
#undef  PDumper_Claim
#define PDumper_Claim                           0x41B01
#undef  XPDumper_Claim
#define XPDumper_Claim                          0x61B01
#undef  PDumper_Free
#define PDumper_Free                            0x41B02
#undef  XPDumper_Free
#define XPDumper_Free                           0x61B02
#undef  PDumper_Find
#define PDumper_Find                            0x41B03
#undef  XPDumper_Find
#define XPDumper_Find                           0x61B03
#undef  PDumper_StartJob
#define PDumper_StartJob                        0x41B04
#undef  XPDumper_StartJob
#define XPDumper_StartJob                       0x61B04
#undef  PDumper_TidyJob
#define PDumper_TidyJob                         0x41B05
#undef  XPDumper_TidyJob
#define XPDumper_TidyJob                        0x61B05
#undef  PDumper_SetColour
#define PDumper_SetColour                       0x41B06
#undef  XPDumper_SetColour
#define XPDumper_SetColour                      0x61B06
#undef  PDumper_PrepareStrip
#define PDumper_PrepareStrip                    0x41B07
#undef  XPDumper_PrepareStrip
#define XPDumper_PrepareStrip                   0x61B07
#undef  PDumper_LookupError
#define PDumper_LookupError                     0x41B08
#undef  XPDumper_LookupError
#define XPDumper_LookupError                    0x61B08
#undef  PDumper_CopyFilename
#define PDumper_CopyFilename                    0x41B09
#undef  XPDumper_CopyFilename
#define XPDumper_CopyFilename                   0x61B09
#undef  Service_PDumperStarting
#define Service_PDumperStarting                 0x66
#undef  Service_PDumperDying
#define Service_PDumperDying                    0x67

/********************
 * Type definitions *
 ********************/
typedef bits pdumper_job_flags;

typedef int pdumper_device;

typedef int pdumper_strip_type;

typedef bits pdumper_features;

typedef bits pdumper_format;

typedef bits pdumper_halftone_flags;

/************************
 * Constant definitions *
 ************************/
#define error_PDUMPER_UNDECLARED                0x5D7u
#define error_PDUMPER_TOO_OLD                   0x5D8u
#define error_PDUMPER_DUPLICATE_MODULE          0x5D9u
#define error_PDUMPER_BAD_CALL                  0x5DAu
#define error_PDUMPER_BAD_STRIP                 0x5DBu
#define error_PDUMPER_BAD_PALETTE               0x5DCu
#define error_PDUMPER_NOT_LINKED                0x5DDu
#define error_PDUMPER_RESERVED                  0x5DEu
#define error_PDUMPER_BAD_OUTPUT_TYPE           0x5DFu
#define error_PDUMPER_BLOCK_NOT_FOUND           0x5E0u
#define error_PDUMPER_IN_USE                    0x5E1u
#define pdumper_DEVICE_SPRITE_DEVICE            ((pdumper_device) 0x0u)
#define pdumper_DEVICE_GENERIC_DOT_MATRIX       ((pdumper_device) 0x1u)
#define pdumper_DEVICE_LASERJET                 ((pdumper_device) 0x2u)
#define pdumper_DEVICE_IMAGEWRITER              ((pdumper_device) 0x3u)
#define pdumper_DEVICE24_PIN                    ((pdumper_device) 0x4u)
#define pdumper_DEVICE_DESKJET                  ((pdumper_device) 0x5u)
#define pdumper_STRIP_MONOCHROME                ((pdumper_strip_type) 0x0u)
#define pdumper_STRIP_GREY_SCALE                ((pdumper_strip_type) 0x1u)
#define pdumper_STRIP8_BIT                      ((pdumper_strip_type) 0x2u)
#define pdumper_STRIP24_BIT_MULTIPLE            ((pdumper_strip_type) 0x3u)
#define pdumper_STRIP16_BIT                     ((pdumper_strip_type) 0x4u)
#define pdumper_STRIP24_BIT                     ((pdumper_strip_type) 0x5u)
#define pdumper_PASS_NUMBER                     ((pdumper_strip_type) 0x7FFFFFu)
#define pdumper_FEATURE_HALFTONE_GREY           ((pdumper_features) 0x1u)
#define pdumper_FEATURE_DIFFUSED_GREY           ((pdumper_features) 0x2u)
#define pdumper_FEATURE_HALFTONE_COLOUR         ((pdumper_features) 0x4u)
#define pdumper_FEATURE_DIFFUSED_COLOUR         ((pdumper_features) 0x8u)
#define pdumper_FORMAT_HALFTONE_GREY            ((pdumper_format) 0x1u)
#define pdumper_FORMAT_DIFFUSED_GREY            ((pdumper_format) 0x2u)
#define pdumper_FORMAT_HALFTONE_COLOUR          ((pdumper_format) 0x4u)
#define pdumper_FORMAT_DIFFUSED_COLOUR          ((pdumper_format) 0x8u)
#define pdumper_HALFTONE_XRESOLUTION            ((pdumper_halftone_flags) 0xFFu)
#define pdumper_HALFTONE_XRESOLUTION_SHIFT      0
#define pdumper_HALFTONE_YRESOLUTION            ((pdumper_halftone_flags) 0xFF00u)
#define pdumper_HALFTONE_YRESOLUTION_SHIFT      8

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      pdumper_info()
 *
 * Description:   Returns information about the PDumper support module
 *
 * Output:        version - value of R0 on exit
 *                features - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x41B00.
 */

extern os_error *xpdumper_info (int *version,
      pdumper_features *features);
extern void pdumper_info (int *version,
      pdumper_features *features);

/* ------------------------------------------------------------------------
 * Function:      pdumper_claim()
 *
 * Description:   Allocates a block of memory and links it into the chain
 *
 * Input:         anchor - value of R0 on entry
 *                size - value of R3 on entry
 *                tag - value of R4 on entry
 *
 * Output:        blk - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41B01.
 */

extern os_error *xpdumper_claim (int *anchor,
      int size,
      bits tag,
      void **blk);
extern void *pdumper_claim (int *anchor,
      int size,
      bits tag);

/* ------------------------------------------------------------------------
 * Function:      pdumper_free()
 *
 * Description:   Unlinks a block of memory from the chain and releases it
 *
 * Input:         anchor - value of R0 on entry
 *                blk - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x41B02.
 */

extern os_error *xpdumper_free (int *anchor,
      void *blk);
extern void pdumper_free (int *anchor,
      void *blk);

/* ------------------------------------------------------------------------
 * Function:      pdumper_find()
 *
 * Description:   Scans the printer dumper's chain for a block of memory
 *                with the given tag
 *
 * Input:         anchor - value of R0 on entry
 *                tag - value of R2 on entry
 *
 * Output:        blk - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41B03.
 */

extern os_error *xpdumper_find (int *anchor,
      bits tag,
      void **blk);
extern void *pdumper_find (int *anchor,
      bits tag);

/* ------------------------------------------------------------------------
 * Function:      pdumper_start_job()
 *
 * Description:   Sets up any workspace that is required for a job
 *
 * Input:         anchor - value of R0 on entry
 *                flags - value of R1 on entry
 *                palette_file_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x41B04.
 */

extern os_error *xpdumper_start_job (int *anchor,
      pdumper_job_flags flags,
      char const *palette_file_name);
__swi (0x41B04) void pdumper_start_job (int *anchor,
      pdumper_job_flags flags,
      char const *palette_file_name);

/* ------------------------------------------------------------------------
 * Function:      pdumper_tidy_job()
 *
 * Description:   Releases workspace used for a job
 *
 * Input:         anchor - value of R0 on entry
 *                end_of_document - value of R2 on entry
 *                tags - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x41B05.
 */

extern os_error *xpdumper_tidy_job (int *anchor,
      osbool end_of_document,
      int const *tags);
extern void pdumper_tidy_job (int *anchor,
      osbool end_of_document,
      int const *tags);

/* ------------------------------------------------------------------------
 * Function:      pdumper_set_colour()
 *
 * Description:   Processes the colour setting required by the printer
 *                dumper
 *
 * Input:         anchor - value of R0 on entry
 *                colour - value of R1 on entry
 *                strip_type_and_pass_no - value of R2 on entry
 *                halftone_info - value of R4 on entry
 *
 * Output:        col - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x41B06.
 */

extern os_error *xpdumper_set_colour (int *anchor,
      os_colour colour,
      pdumper_strip_type strip_type_and_pass_no,
      pdumper_halftone_flags halftone_info,
      int *col);
extern int pdumper_set_colour (int *anchor,
      os_colour colour,
      pdumper_strip_type strip_type_and_pass_no,
      pdumper_halftone_flags halftone_info);

/* ------------------------------------------------------------------------
 * Function:      pdumper_prepare_strip()
 *
 * Description:   Processes a bitmap into a format suitable for printing
 *
 * Input:         anchor - value of R0 on entry
 *                image - value of R1 on entry
 *                format - value of R2 on entry
 *                width - value of R3 on entry
 *                height - value of R4 on entry
 *                stride - value of R5 on entry
 *                halftone_info - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x41B07.
 */

extern os_error *xpdumper_prepare_strip (int *anchor,
      byte const *image,
      pdumper_format format,
      int width,
      int height,
      int stride,
      pdumper_halftone_flags halftone_info);
extern void pdumper_prepare_strip (int *anchor,
      byte const *image,
      pdumper_format format,
      int width,
      int height,
      int stride,
      pdumper_halftone_flags halftone_info);

/* ------------------------------------------------------------------------
 * Function:      pdumper_lookup_error()
 *
 * Description:   Accesses the internal error handling routines within the
 *                support module
 *
 * Input:         error - value of R0 on entry
 *                arg0 - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x41B08.
 */

extern os_error *xpdumper_lookup_error (os_error const *error,
      char const *arg0);
__swi (0x41B08) void pdumper_lookup_error (os_error const *error,
      char const *arg0);

/* ------------------------------------------------------------------------
 * Function:      pdumper_copy_filename()
 *
 * Description:   Copies a specified file name into a buffer
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                file_name - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x41B09.
 */

extern os_error *xpdumper_copy_filename (char *buffer,
      int size,
      char const *file_name);
__swi (0x41B09) void pdumper_copy_filename (char *buffer,
      int size,
      char const *file_name);

/* ------------------------------------------------------------------------
 * Function:      service_pdumper_starting()
 *
 * Description:   PDriverDP module starting up
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x66.
 */

extern os_error *xservice_pdumper_starting (void);
extern void service_pdumper_starting (void);

/* ------------------------------------------------------------------------
 * Function:      service_pdumper_dying()
 *
 * Description:   PDriverDP module dying
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x67.
 */

extern os_error *xservice_pdumper_dying (void);
extern void service_pdumper_dying (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
