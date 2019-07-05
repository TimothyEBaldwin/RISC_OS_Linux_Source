#ifndef imagefilerender_H
#define imagefilerender_H

/* C header file for ImageFileRender
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
 * Tom Hughes, tom@compton.nu, 22 Nov 2002
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

#ifndef osspriteop_H
#include "oslib/osspriteop.h"
#endif

#ifndef pdriver_H
#include "oslib/pdriver.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  ImageFileRender_Render
#define ImageFileRender_Render                  0x562C0
#undef  XImageFileRender_Render
#define XImageFileRender_Render                 0x762C0
#undef  ImageFileRender_BBox
#define ImageFileRender_BBox                    0x562C1
#undef  XImageFileRender_BBox
#define XImageFileRender_BBox                   0x762C1
#undef  ImageFileRender_Transform
#define ImageFileRender_Transform               0x562C2
#undef  XImageFileRender_Transform
#define XImageFileRender_Transform              0x762C2
#undef  ImageFileRender_DeclareFonts
#define ImageFileRender_DeclareFonts            0x562C3
#undef  XImageFileRender_DeclareFonts
#define XImageFileRender_DeclareFonts           0x762C3
#undef  ImageFileRender_Info
#define ImageFileRender_Info                    0x562C4
#undef  XImageFileRender_Info
#define XImageFileRender_Info                   0x762C4
#undef  ImageFileRender_InfoBaseDetails
#define ImageFileRender_InfoBaseDetails         0x0
#undef  ImageFileRender_RendererInfo
#define ImageFileRender_RendererInfo            0x562C5
#undef  XImageFileRender_RendererInfo
#define XImageFileRender_RendererInfo           0x762C5
#undef  ImageFileRender_Register
#define ImageFileRender_Register                0x562C6
#undef  XImageFileRender_Register
#define XImageFileRender_Register               0x762C6
#undef  ImageFileRender_Deregister
#define ImageFileRender_Deregister              0x562C7
#undef  XImageFileRender_Deregister
#define XImageFileRender_Deregister             0x762C7
#undef  Service_ImageFileRenderStarted
#define Service_ImageFileRenderStarted          0x80D40
#undef  Service_ImageFileRenderDying
#define Service_ImageFileRenderDying            0x80D41
#undef  Service_ImageFileRenderRendererChanged
#define Service_ImageFileRenderRendererChanged  0x80D42

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct imagefilerender_fit_block        imagefilerender_fit_block;
typedef union  imagefilerender_transformation_data imagefilerender_transformation_data;
typedef struct imagefilerender_base_details     imagefilerender_base_details;
typedef struct imagefilerender_magic_           *imagefilerender_magic;
typedef struct imagefilerender_renderer         imagefilerender_renderer;
typedef struct imagefilerender_image_descriptor imagefilerender_image_descriptor;
typedef struct imagefilerender_rendering_descriptor imagefilerender_rendering_descriptor;
typedef struct imagefilerender_bbox_descriptor  imagefilerender_bbox_descriptor;
typedef struct imagefilerender_declare_fonts_descriptor imagefilerender_declare_fonts_descriptor;
typedef struct imagefilerender_info_descriptor  imagefilerender_info_descriptor;

/********************
 * Type definitions *
 ********************/
typedef int imagefilerender_sequence_number;

struct imagefilerender_fit_block
   {  int width;
      int height;
      int border;
      int angle;
   };

union imagefilerender_transformation_data
   {  imagefilerender_fit_block to_fit;
      os_factors scaled;
      os_trfm transformed;
   };

typedef int imagefilerender_query_type;

typedef bits imagefilerender_image_flags;

struct imagefilerender_base_details
   {  imagefilerender_sequence_number sequence;
      int xdpi;
      int ydpi;
      osspriteop_mode_word colour_type;
      imagefilerender_image_flags image_flags;
   };

typedef bits imagefilerender_flags;

typedef bits imagefilerender_renderer_flags;

struct imagefilerender_renderer
   {  int api_version;
      imagefilerender_renderer_flags flags;
      bits file_type;
      imagefilerender_magic magic;
      char *name;
      byte *workspace;
      void *start;
      void *stop;
      void *render;
      void *bbox;
      void *declare_fonts;
      void *info;
   };

struct imagefilerender_image_descriptor
   {  byte *data;
      int size;
      byte *extension_data;
      imagefilerender_sequence_number sequence;
      byte *private_data;
   };

struct imagefilerender_rendering_descriptor
   {  imagefilerender_flags flags;
      os_trfm trfm;
      os_box bbox;
      osspriteop_colour_mapping mapping;
   };

struct imagefilerender_bbox_descriptor
   {  imagefilerender_flags flags;
      os_trfm trfm;
      os_box bbox;
   };

struct imagefilerender_declare_fonts_descriptor
   {  imagefilerender_flags flags;
      pdriver_font_flags pdriver_flags;
   };

struct imagefilerender_info_descriptor
   {  imagefilerender_query_type query;
      int size;
      byte *data;
   };

/************************
 * Constant definitions *
 ************************/
#define imagefilerender_DEFAULT_IMAGE           ((imagefilerender_sequence_number) 0x0u)
#define imagefilerender_BASE_DETAIL_QUERY       ((imagefilerender_query_type) 0x0u)
#define imagefilerender_IMAGE_IS_SOLID          ((imagefilerender_image_flags) 0x1u)
#define imagefilerender_TRANSFORMATION_TYPE     ((imagefilerender_flags) 0x7u)
#define imagefilerender_TRANSFORMATION_TYPE_SHIFT 0
#define imagefilerender_RENDER_TO_FIT           0
#define imagefilerender_RENDER_SCALED           1
#define imagefilerender_RENDER_TRANSFORMED      2
#define imagefilerender_COLOUR_MAPPING_SUPPLIED ((imagefilerender_flags) 0x8u)
#define imagefilerender_IGNORE_DOCUMENT_ORIGIN  ((imagefilerender_flags) 0x10u)
#define imagefilerender_RETURN_OS_UNITS         ((imagefilerender_flags) 0x20u)
#define imagefilerender_QUALITY                 ((imagefilerender_flags) 0x1C0u)
#define imagefilerender_QUALITY_SHIFT           6
#define imagefilerender_DEFAULT_QUALITY         0
#define imagefilerender_LOWEST_QUALITY          1
#define imagefilerender_HIGHEST_QUALITY         15
#define imagefilerender_TRANSFORMATION_CAPABILITIES ((imagefilerender_renderer_flags) 0x3u)
#define imagefilerender_TRANSFORMATION_CAPABILITIES_SHIFT 0
#define imagefilerender_NO_TRANSFORMATION       0
#define imagefilerender_FIXED_ASPECT_RATIO      1
#define imagefilerender_ANY_ASPECT_RATIO        2
#define imagefilerender_ANY_TRANSFORMATION      3
#define imagefilerender_SUPPORTS_COLOUR_MAPPING ((imagefilerender_renderer_flags) 0x4u)
#define imagefilerender_SUPPORTS_IRREGULAR_SHAPES ((imagefilerender_renderer_flags) 0x8u)
#define imagefilerender_MAXIMUM_QUALITY_LEVEL   ((imagefilerender_renderer_flags) 0xF0u)
#define imagefilerender_MAXIMUM_QUALITY_LEVEL_SHIFT 4
#define imagefilerender_DEFAULT_QUALITY_LEVEL   ((imagefilerender_renderer_flags) 0xF00u)
#define imagefilerender_DEFAULT_QUALITY_LEVEL_SHIFT 8

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      imagefilerender_render()
 *
 * Description:   Render an image file
 *
 * Input:         flags - value of R0 on entry
 *                file_type - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *                extension_data - value of R4 on entry
 *                sequence - value of R5 on entry
 *                xorigin - value of R6 on entry
 *                yorigin - value of R7 on entry
 *                transformation_data - value of R8 on entry
 *                colour_mapping - value of R9 on entry
 *
 * Other notes:   Calls SWI 0x562C0.
 */

extern os_error *ximagefilerender_render (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      int xorigin,
      int yorigin,
      imagefilerender_transformation_data const *transformation_data,
      osspriteop_colour_mapping const *colour_mapping);
extern void imagefilerender_render (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      int xorigin,
      int yorigin,
      imagefilerender_transformation_data const *transformation_data,
      osspriteop_colour_mapping const *colour_mapping);

/* ------------------------------------------------------------------------
 * Function:      imagefilerender_bbox()
 *
 * Description:   Calculate the bounding box for a transformation operation
 *
 * Input:         flags - value of R0 on entry
 *                file_type - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *                extension_data - value of R4 on entry
 *                sequence - value of R5 on entry
 *                transformation_data - value of R6 on entry
 *                bbox - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x562C1.
 */

extern os_error *ximagefilerender_bbox (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      imagefilerender_transformation_data const *transformation_data,
      os_box *bbox);
extern void imagefilerender_bbox (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      imagefilerender_transformation_data const *transformation_data,
      os_box *bbox);

/* ------------------------------------------------------------------------
 * Function:      imagefilerender_transform()
 *
 * Description:   Calculate the transformation matrix for an operation
 *
 * Input:         flags - value of R0 on entry
 *                file_type - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *                extension_data - value of R4 on entry
 *                sequence - value of R5 on entry
 *                transformation_data - value of R6 on entry
 *                trfm - value of R7 on entry
 *
 * Output:        xdpi - value of R0 on exit
 *                ydpi - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x562C2.
 */

extern os_error *ximagefilerender_transform (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      imagefilerender_transformation_data const *transformation_data,
      os_trfm *trfm,
      int *xdpi,
      int *ydpi);
extern void imagefilerender_transform (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      imagefilerender_transformation_data const *transformation_data,
      os_trfm *trfm,
      int *xdpi,
      int *ydpi);

/* ------------------------------------------------------------------------
 * Function:      imagefilerender_declare_fonts()
 *
 * Description:   Declare fonts used by an image when printing
 *
 * Input:         flags - value of R0 on entry
 *                file_type - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *                extension_data - value of R4 on entry
 *                sequence - value of R5 on entry
 *                pdriver_flags - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x562C3.
 */

extern os_error *ximagefilerender_declare_fonts (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      pdriver_font_flags pdriver_flags);
extern void imagefilerender_declare_fonts (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      pdriver_font_flags pdriver_flags);

/* ------------------------------------------------------------------------
 * Function:      imagefilerender_info()
 *
 * Description:   Return information on an image
 *
 * Input:         flags - value of R0 on entry
 *                file_type - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *                extension_data - value of R4 on entry
 *                sequence - value of R5 on entry
 *                query - value of R6 on entry
 *                query_data - value of R7 on entry
 *                query_data_size - value of R8 on entry
 *
 * Output:        size_used - value of R8 on exit (X version only)
 *
 * Returns:       R8 (non-X version only)
 *
 * Other notes:   Calls SWI 0x562C4.
 */

extern os_error *ximagefilerender_info (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      imagefilerender_query_type query,
      byte *query_data,
      int query_data_size,
      int *size_used);
extern int imagefilerender_info (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      imagefilerender_query_type query,
      byte *query_data,
      int query_data_size);

/* ------------------------------------------------------------------------
 * Function:      imagefilerender_info_base_details()
 *
 * Description:   Return basic information on an image
 *
 * Input:         flags - value of R0 on entry
 *                file_type - value of R1 on entry
 *                data - value of R2 on entry
 *                size - value of R3 on entry
 *                extension_data - value of R4 on entry
 *                sequence - value of R5 on entry
 *                base_details - value of R7 on entry
 *                base_details_size - value of R8 on entry
 *
 * Output:        size_used - value of R8 on exit (X version only)
 *
 * Returns:       R8 (non-X version only)
 *
 * Other notes:   Calls SWI 0x562C4 with R6 = 0x0.
 */

extern os_error *ximagefilerender_info_base_details (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      imagefilerender_base_details *base_details,
      int base_details_size,
      int *size_used);
extern int imagefilerender_info_base_details (imagefilerender_flags flags,
      bits file_type,
      byte const *data,
      int size,
      byte const *extension_data,
      imagefilerender_sequence_number sequence,
      imagefilerender_base_details *base_details,
      int base_details_size);

/* ------------------------------------------------------------------------
 * Function:      imagefilerender_renderer_info()
 *
 * Description:   Return information about a renderer
 *
 * Input:         flags - value of R0 on entry
 *                file_type - value of R1 on entry
 *                magic - value of R2 on entry
 *
 * Output:        definition - value of R0 on exit (X version only)
 *                name - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x562C5.
 */

extern os_error *ximagefilerender_renderer_info (imagefilerender_flags flags,
      bits file_type,
      imagefilerender_magic magic,
      imagefilerender_renderer **definition,
      char **name);
extern imagefilerender_renderer *imagefilerender_renderer_info (imagefilerender_flags flags,
      bits file_type,
      imagefilerender_magic magic,
      char **name);

/* ------------------------------------------------------------------------
 * Function:      imagefilerender_register()
 *
 * Description:   Register a new renderer
 *
 * Input:         flags - value of R0 on entry
 *                definition - value of R1 on entry
 *
 * Output:        api_version - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x562C6.
 */

extern os_error *ximagefilerender_register (imagefilerender_flags flags,
      imagefilerender_renderer const *definition,
      int *api_version);
extern int imagefilerender_register (imagefilerender_flags flags,
      imagefilerender_renderer const *definition);

/* ------------------------------------------------------------------------
 * Function:      imagefilerender_deregister()
 *
 * Description:   Deregister a renderer
 *
 * Input:         flags - value of R0 on entry
 *                file_type - value of R1 on entry
 *                name - value of R2 on entry
 *                magic - value of R3 on entry
 *
 * Output:        api_version - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x562C7.
 */

extern os_error *ximagefilerender_deregister (imagefilerender_flags flags,
      bits file_type,
      char const *name,
      imagefilerender_magic magic,
      int *api_version);
extern int imagefilerender_deregister (imagefilerender_flags flags,
      bits file_type,
      char const *name,
      imagefilerender_magic magic);

/* ------------------------------------------------------------------------
 * Function:      service_image_file_render_started()
 *
 * Description:   ImageFileRender module has initialised
 *
 * Input:         api_version - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x80D40.
 */

extern os_error *xservice_image_file_render_started (int api_version);
extern void service_image_file_render_started (int api_version);

/* ------------------------------------------------------------------------
 * Function:      service_image_file_render_dying()
 *
 * Description:   ImageFileRender module is finalising
 *
 * Input:         api_version - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x80D41.
 */

extern os_error *xservice_image_file_render_dying (int api_version);
extern void service_image_file_render_dying (int api_version);

/* ------------------------------------------------------------------------
 * Function:      service_image_file_render_renderer_changed()
 *
 * Description:   Renderer changed
 *
 * Input:         api_version - value of R0 on entry
 *                file_type - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x80D42.
 */

extern os_error *xservice_image_file_render_renderer_changed (int api_version,
      bits file_type);
extern void service_image_file_render_renderer_changed (int api_version,
      bits file_type);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
