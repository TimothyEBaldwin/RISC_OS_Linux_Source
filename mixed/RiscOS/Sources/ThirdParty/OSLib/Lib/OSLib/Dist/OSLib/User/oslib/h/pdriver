#ifndef pdriver_H
#define pdriver_H

/* C header file for PDriver
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

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#ifndef draw_H
#include "oslib/draw.h"
#endif

#ifndef font_H
#include "oslib/font.h"
#endif

#ifndef messagetrans_H
#include "oslib/messagetrans.h"
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
#undef  PDriver_Info
#define PDriver_Info                            0x80140
#undef  XPDriver_Info
#define XPDriver_Info                           0xA0140
#undef  PDriver_SetInfo
#define PDriver_SetInfo                         0x80141
#undef  XPDriver_SetInfo
#define XPDriver_SetInfo                        0xA0141
#undef  PDriver_CheckFeatures
#define PDriver_CheckFeatures                   0x80142
#undef  XPDriver_CheckFeatures
#define XPDriver_CheckFeatures                  0xA0142
#undef  PDriver_PageSize
#define PDriver_PageSize                        0x80143
#undef  XPDriver_PageSize
#define XPDriver_PageSize                       0xA0143
#undef  PDriver_SetPageSize
#define PDriver_SetPageSize                     0x80144
#undef  XPDriver_SetPageSize
#define XPDriver_SetPageSize                    0xA0144
#undef  PDriver_SelectJob
#define PDriver_SelectJob                       0x80145
#undef  XPDriver_SelectJob
#define XPDriver_SelectJob                      0xA0145
#undef  PDriver_SelectJobW
#define PDriver_SelectJobW                      0x80145
#undef  XPDriver_SelectJobW
#define XPDriver_SelectJobW                     0xA0145
#undef  PDriver_CurrentJob
#define PDriver_CurrentJob                      0x80146
#undef  XPDriver_CurrentJob
#define XPDriver_CurrentJob                     0xA0146
#undef  PDriver_CurrentJobW
#define PDriver_CurrentJobW                     0x80146
#undef  XPDriver_CurrentJobW
#define XPDriver_CurrentJobW                    0xA0146
#undef  PDriver_FontSWI
#define PDriver_FontSWI                         0x80147
#undef  XPDriver_FontSWI
#define XPDriver_FontSWI                        0xA0147
#undef  PDriver_EndJob
#define PDriver_EndJob                          0x80148
#undef  XPDriver_EndJob
#define XPDriver_EndJob                         0xA0148
#undef  PDriver_EndJobW
#define PDriver_EndJobW                         0x80148
#undef  XPDriver_EndJobW
#define XPDriver_EndJobW                        0xA0148
#undef  PDriver_AbortJob
#define PDriver_AbortJob                        0x80149
#undef  XPDriver_AbortJob
#define XPDriver_AbortJob                       0xA0149
#undef  PDriver_AbortJobW
#define PDriver_AbortJobW                       0x80149
#undef  XPDriver_AbortJobW
#define XPDriver_AbortJobW                      0xA0149
#undef  PDriver_Reset
#define PDriver_Reset                           0x8014A
#undef  XPDriver_Reset
#define XPDriver_Reset                          0xA014A
#undef  PDriver_GiveRectangle
#define PDriver_GiveRectangle                   0x8014B
#undef  XPDriver_GiveRectangle
#define XPDriver_GiveRectangle                  0xA014B
#undef  PDriver_DrawPage
#define PDriver_DrawPage                        0x8014C
#undef  XPDriver_DrawPage
#define XPDriver_DrawPage                       0xA014C
#undef  PDriver_GetRectangle
#define PDriver_GetRectangle                    0x8014D
#undef  XPDriver_GetRectangle
#define XPDriver_GetRectangle                   0xA014D
#undef  PDriver_CancelJob
#define PDriver_CancelJob                       0x8014E
#undef  XPDriver_CancelJob
#define XPDriver_CancelJob                      0xA014E
#undef  PDriver_CancelJobW
#define PDriver_CancelJobW                      0x8014E
#undef  XPDriver_CancelJobW
#define XPDriver_CancelJobW                     0xA014E
#undef  PDriver_ScreenDump
#define PDriver_ScreenDump                      0x8014F
#undef  XPDriver_ScreenDump
#define XPDriver_ScreenDump                     0xA014F
#undef  PDriver_ScreenDumpW
#define PDriver_ScreenDumpW                     0x8014F
#undef  XPDriver_ScreenDumpW
#define XPDriver_ScreenDumpW                    0xA014F
#undef  PDriver_EnumerateJobs
#define PDriver_EnumerateJobs                   0x80150
#undef  XPDriver_EnumerateJobs
#define XPDriver_EnumerateJobs                  0xA0150
#undef  PDriver_SetPrinter
#define PDriver_SetPrinter                      0x80151
#undef  XPDriver_SetPrinter
#define XPDriver_SetPrinter                     0xA0151
#undef  PDriver_CancelJobWithError
#define PDriver_CancelJobWithError              0x80152
#undef  XPDriver_CancelJobWithError
#define XPDriver_CancelJobWithError             0xA0152
#undef  PDriver_CancelJobWithErrorW
#define PDriver_CancelJobWithErrorW             0x80152
#undef  XPDriver_CancelJobWithErrorW
#define XPDriver_CancelJobWithErrorW            0xA0152
#undef  PDriver_SelectIllustration
#define PDriver_SelectIllustration              0x80153
#undef  XPDriver_SelectIllustration
#define XPDriver_SelectIllustration             0xA0153
#undef  PDriver_SelectIllustrationW
#define PDriver_SelectIllustrationW             0x80153
#undef  XPDriver_SelectIllustrationW
#define XPDriver_SelectIllustrationW            0xA0153
#undef  PDriver_InsertIllustration
#define PDriver_InsertIllustration              0x80154
#undef  XPDriver_InsertIllustration
#define XPDriver_InsertIllustration             0xA0154
#undef  PDriver_InsertIllustrationW
#define PDriver_InsertIllustrationW             0x80154
#undef  XPDriver_InsertIllustrationW
#define XPDriver_InsertIllustrationW            0xA0154
#undef  PDriver_DeclareFont
#define PDriver_DeclareFont                     0x80155
#undef  XPDriver_DeclareFont
#define XPDriver_DeclareFont                    0xA0155
#undef  PDriver_DeclareDriver
#define PDriver_DeclareDriver                   0x80156
#undef  XPDriver_DeclareDriver
#define XPDriver_DeclareDriver                  0xA0156
#undef  PDriver_RemoveDriver
#define PDriver_RemoveDriver                    0x80157
#undef  XPDriver_RemoveDriver
#define XPDriver_RemoveDriver                   0xA0157
#undef  PDriver_SelectDriver
#define PDriver_SelectDriver                    0x80158
#undef  XPDriver_SelectDriver
#define XPDriver_SelectDriver                   0xA0158
#undef  PDriver_EnumerateDrivers
#define PDriver_EnumerateDrivers                0x80159
#undef  XPDriver_EnumerateDrivers
#define XPDriver_EnumerateDrivers               0xA0159
#undef  PDriver_MiscOp
#define PDriver_MiscOp                          0x8015A
#undef  XPDriver_MiscOp
#define XPDriver_MiscOp                         0xA015A
#undef  PDriverMiscOp_AddFont
#define PDriverMiscOp_AddFont                   0x0
#undef  PDriverMiscOp_RemoveFont
#define PDriverMiscOp_RemoveFont                0x1
#undef  PDriverMiscOp_EnumerateFonts
#define PDriverMiscOp_EnumerateFonts            0x2
#undef  PDriverMiscOp_RegisterDumper
#define PDriverMiscOp_RegisterDumper            0x80000000
#undef  PDriverMiscOp_DeregisterDumper
#define PDriverMiscOp_DeregisterDumper          0x80000001
#undef  PDriverMiscOp_StripTypes
#define PDriverMiscOp_StripTypes                0x80000002
#undef  PDriver_MiscOpForDriver
#define PDriver_MiscOpForDriver                 0x8015B
#undef  XPDriver_MiscOpForDriver
#define XPDriver_MiscOpForDriver                0xA015B
#undef  PDriverMiscOpForDriver_AddFont
#define PDriverMiscOpForDriver_AddFont          0x0
#undef  PDriverMiscOpForDriver_RemoveFont
#define PDriverMiscOpForDriver_RemoveFont       0x1
#undef  PDriverMiscOpForDriver_EnumerateFonts
#define PDriverMiscOpForDriver_EnumerateFonts   0x2
#undef  PDriverMiscOpForDriver_RegisterDumper
#define PDriverMiscOpForDriver_RegisterDumper   0x80000000
#undef  PDriverMiscOpForDriver_DeregisterDumper
#define PDriverMiscOpForDriver_DeregisterDumper 0x80000001
#undef  PDriverMiscOpForDriver_StripTypes
#define PDriverMiscOpForDriver_StripTypes       0x80000002
#undef  PDriver_SetDriver
#define PDriver_SetDriver                       0x8015C
#undef  XPDriver_SetDriver
#define XPDriver_SetDriver                      0xA015C
#undef  PDriver_SetDriverExtended
#define PDriver_SetDriverExtended               0x8015C
#undef  XPDriver_SetDriverExtended
#define XPDriver_SetDriverExtended              0xA015C
#undef  PDriver_JPEGSWI
#define PDriver_JPEGSWI                         0x8015D
#undef  XPDriver_JPEGSWI
#define XPDriver_JPEGSWI                        0xA015D
#undef  PDriverJPEGSWI_Info
#define PDriverJPEGSWI_Info                     0x49980
#undef  PDriverJPEGSWIInfo_Dimensions
#define PDriverJPEGSWIInfo_Dimensions           0x1
#undef  PDriverJPEGSWI_FileInfo
#define PDriverJPEGSWI_FileInfo                 0x49981
#undef  PDriverJPEGSWIFileInfo_Dimensions
#define PDriverJPEGSWIFileInfo_Dimensions       0x1
#undef  PDriverJPEGSWI_PlotScaled
#define PDriverJPEGSWI_PlotScaled               0x49982
#undef  PDriverJPEGSWI_PlotFileScaled
#define PDriverJPEGSWI_PlotFileScaled           0x49983
#undef  PDriverJPEGSWI_PlotTransformed
#define PDriverJPEGSWI_PlotTransformed          0x49984
#undef  PDriverJPEGSWI_PlotFileTransformed
#define PDriverJPEGSWI_PlotFileTransformed      0x49985
#undef  Service_Print
#define Service_Print                           0x41
#undef  Service_PDriverStarting
#define Service_PDriverStarting                 0x65
#undef  Service_PDriverGetMessages
#define Service_PDriverGetMessages              0x78
#undef  Service_PDriverChanged
#define Service_PDriverChanged                  0x7F

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct pdriver_message_print_error      pdriver_message_print_error;
typedef struct pdriver_message_print_type_odd   pdriver_message_print_type_odd;
typedef struct pdriver_message_print_configure  pdriver_message_print_configure;
typedef struct pdriver_message_print_interrogate pdriver_message_print_interrogate;
typedef struct pdriver_message_ps_printer_query pdriver_message_ps_printer_query;
typedef struct pdriver_full_message_print_error pdriver_full_message_print_error;
typedef struct pdriver_full_message_print_type_odd pdriver_full_message_print_type_odd;
typedef struct pdriver_full_message_print_configure pdriver_full_message_print_configure;
typedef struct pdriver_full_message_print_interrogate pdriver_full_message_print_interrogate;
typedef struct pdriver_full_message_ps_printer_query pdriver_full_message_ps_printer_query;
typedef struct pdriver_configuration_info       pdriver_configuration_info;
typedef struct pdriver_configuration_info_base  pdriver_configuration_info_base;

/********************
 * Type definitions *
 ********************/
typedef int pdriver_type;

typedef bits pdriver_features;

typedef bits pdriver_font_flags;

typedef bits pdriver_font_map_flags;

typedef bits pdriver_font_add_flags;

typedef bits pdriver_enumerate_flags;

typedef int pdriver_configure_reason;

typedef int pdriver_interrogate_reason;

struct pdriver_message_print_error
   {  int errnum;
      char errmess [232];
   };

struct pdriver_message_print_type_odd
   {  byte pad [20];
      bits file_type;
      char file_name [212];
   };

struct pdriver_message_print_configure
   {  pdriver_configure_reason reason;
      union
      {  char *filename;
      }
      data;
   };

struct pdriver_message_print_interrogate
   {  pdriver_interrogate_reason reason;
      union
      {  struct
         {  int printer_id;
            int palette_number;
            int options;
            os_coord resolution;
            bits flags;
            char mode_name [208];
         }
         settings;
      }
      data;
   };

struct pdriver_message_ps_printer_query
   {  byte *buffer;
      int size;
   };

struct pdriver_full_message_print_error
   {  wimp_MESSAGE_HEADER_MEMBERS
      int errnum;
      char errmess [232];
   };

struct pdriver_full_message_print_type_odd
   {  wimp_MESSAGE_HEADER_MEMBERS
      byte pad [20];
      bits file_type;
      char file_name [212];
   };

struct pdriver_full_message_print_configure
   {  wimp_MESSAGE_HEADER_MEMBERS
      pdriver_configure_reason reason;
      union
      {  char *filename;
      }
      data;
   };

struct pdriver_full_message_print_interrogate
   {  wimp_MESSAGE_HEADER_MEMBERS
      pdriver_interrogate_reason reason;
      union
      {  struct
         {  int printer_id;
            int palette_number;
            int options;
            os_coord resolution;
            bits flags;
            char mode_name [208];
         }
         settings;
      }
      data;
   };

struct pdriver_full_message_ps_printer_query
   {  wimp_MESSAGE_HEADER_MEMBERS
      byte *buffer;
      int buffer_size;
   };

typedef bits pdriver_info_type;

typedef bits pdriver_draw_flags;

#define pdriver_CONFIGURATION_INFO_MEMBERS \
   int entry_count; \
   int block_size; \
   int entry_offsets [20];

/* Base pdriver_configuration_info structure without variable part */
struct pdriver_configuration_info_base
   {  pdriver_CONFIGURATION_INFO_MEMBERS
   };

/* legacy structure */
struct pdriver_configuration_info
   {  pdriver_CONFIGURATION_INFO_MEMBERS
      char data [UNKNOWN];
   };

#define pdriver_CONFIGURATION_INFO(N) \
   struct \
      {  pdriver_CONFIGURATION_INFO_MEMBERS \
         char data [N]; \
      }

#define pdriver_SIZEOF_CONFIGURATION_INFO(N) \
   (offsetof (pdriver_configuration_info, data) + \
         (N)*sizeof ((pdriver_configuration_info *) NULL)->data)

/************************
 * Constant definitions *
 ************************/
#define pdriver_OS_UNIT                         400
      /*1 O S unit in millipoints*/
#define pdriver_INCH                            72000
      /*1in in millipoints*/
#define pdriver_POINT                           1000
      /*1pt in millipoints*/
#define pdriver_TYPE_PS                         ((pdriver_type) 0x0u)
#define pdriver_TYPE_DM                         ((pdriver_type) 0x1u)
#define pdriver_TYPE_LJ                         ((pdriver_type) 0x2u)
#define pdriver_TYPE_IX                         ((pdriver_type) 0x3u)
#define pdriver_TYPE_FX                         ((pdriver_type) 0x4u)
#define pdriver_TYPE_LZ                         ((pdriver_type) 0x5u)
#define pdriver_TYPE_LB                         ((pdriver_type) 0x6u)
#define pdriver_TYPE_UF                         ((pdriver_type) 0x7u)
#define pdriver_TYPE_JX                         ((pdriver_type) 0x63u)
#define pdriver_TYPE_PJ                         ((pdriver_type) 0x63u)
#define pdriver_FEATURE_COLOUR                  ((pdriver_features) 0x1u)
#define pdriver_FEATURE_LIMITED_COLOURS         ((pdriver_features) 0x2u)
#define pdriver_FEATURE_DISCRETE_COLOURS        ((pdriver_features) 0x4u)
#define pdriver_FEATURE_OUTLINES_ONLY           ((pdriver_features) 0x100u)
#define pdriver_FEATURE_THIN_LINES_ONLY         ((pdriver_features) 0x200u)
#define pdriver_FEATURE_NO_OVERWRITE            ((pdriver_features) 0x400u)
#define pdriver_FEATURE_TRFM_SPRITE             ((pdriver_features) 0x800u)
#define pdriver_FEATURE_TRFM_FONT               ((pdriver_features) 0x1000u)
#define pdriver_FEATURE_DRAW_PAGE_FLAGS         ((pdriver_features) 0x2000u)
#define pdriver_FEATURE_SCREEN_DUMP             ((pdriver_features) 0x1000000u)
#define pdriver_FEATURE_GENERAL_TRFM            ((pdriver_features) 0x2000000u)
#define pdriver_FEATURE_INSERT_ILLUSTRATION     ((pdriver_features) 0x4000000u)
#define pdriver_FEATURE_MISC_OP                 ((pdriver_features) 0x8000000u)
#define pdriver_FEATURE_SET_DRIVER              ((pdriver_features) 0x10000000u)
#define pdriver_FEATURE_DECLARE_FONT            ((pdriver_features) 0x20000000u)
#define pdriver_NO_DOWNLOAD                     ((pdriver_font_flags) 0x1u)
#define pdriver_KERNED                          ((pdriver_font_flags) 0x2u)
#define pdriver_FONT_RESIDENT                   ((pdriver_font_map_flags) 0x1u)
#define pdriver_FONT_DOWNLOAD                   ((pdriver_font_map_flags) 0x2u)
#define pdriver_FONT_DOWNLOADED                 ((pdriver_font_map_flags) 0x4u)
#define pdriver_FONT_OVERWRITE                  ((pdriver_font_add_flags) 0x1u)
#define error_PDRIVER_BAD_FEATURES              0x5C0u
#define error_PDRIVER_NO_CURRENT_SPRITE         0x5C1u
#define error_PDRIVER_NO_JOB_SELECTED           0x5C2u
#define error_PDRIVER_NO_SUCH_JOB               0x5C3u
#define error_PDRIVER_NO_CURRENT_PAGE           0x5C4u
#define error_PDRIVER_PRINTING_PAGE             0x5C5u
#define error_PDRIVER_INVALID_COPIES            0x5C6u
#define error_PDRIVER_CANNOT_HANDLE             0x5C7u
#define error_PDRIVER_BAD_HALFTONE              0x5C8u
#define error_PDRIVER_CANCELLED                 0x5C9u
#define error_PDRIVER_SINGULAR_MATRIX           0x5CAu
#define error_PDRIVER_BAD_RECTANGLE             0x5CBu
#define error_PDRIVER_RECTANGLES_MISS           0x5CCu
#define error_PDRIVER_NO_FREE_MEMORY            0x5CDu
#define error_PDRIVER_NOT_ONE_PAGE              0x5CEu
#define error_PDRIVER_IN_USE                    0x5CFu
#define error_PDRIVER_OVERFLOW                  0x5D0u
#define error_PDRIVER_BAD_MISC_OP               0x5D1u
#define error_PDRIVER_NO_DUPLICATES             0x5D2u
#define error_PDRIVER_NO_CURRENT_DRIVER         0x5D3u
#define error_PDRIVER_UNKNOWN_NUMBER            0x5D4u
#define error_PDRIVER_DUPLICATE_NUMBER          0x5D5u
#define error_PDRIVER_BAD_SET_PRINTER           0x5D6u
#define message_PRINT_FILE                      0x80140u
#define message_WILL_PRINT                      0x80141u
#define message_PRINT_SAVE                      0x80142u
#define message_PRINT_INIT                      0x80143u
#define message_PRINT_ERROR                     0x80144u
#define message_PRINT_TYPE_ODD                  0x80145u
#define message_PRINT_TYPE_KNOWN                0x80146u
#define message_SET_PRINTER                     0x80147u
#define message_PRINT_INIT2                     0x80148u
#define message_PRINT_CONFIGURE                 0x8014Au
#define message_PRINT_INTERROGATE               0x8014Bu
#define message_PS_PRINTER_QUERY                0x8014Cu
#define message_PS_PRINTER_ACK                  0x8014Du
#define message_PS_PRINTER_MODIFIED             0x8014Eu
#define message_PS_PRINTER_DEFAULTS             0x8014Fu
#define message_PS_PRINTER_DEFAULTED            0x80150u
#define message_PS_PRINTER_NOT_PS               0x80151u
#define message_RESET_PRINTER                   0x80152u
#define message_PS_IS_FONTPRINT_RUNNING         0x80153u
#define pdriver_CONFIGURE_PAPER_SIZES           ((pdriver_configure_reason) 0x0u)
#define pdriver_INTERROGATE_SETTINGS            ((pdriver_interrogate_reason) 0x0u)
#define pdriver_DRAW_COPY_COUNT                 ((pdriver_draw_flags) 0xFFFFFFu)
#define pdriver_DRAW_MAY_PRESCAN                ((pdriver_draw_flags) 0x1000000u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      pdriver_info()
 *
 * Description:   Gets information on the printer manager
 *
 * Output:        type - value of R0 on exit
 *                xres - value of R1 on exit
 *                yres - value of R2 on exit
 *                features - value of R3 on exit
 *                desc - value of R4 on exit
 *                halftone_xres - value of R5 on exit
 *                halftone_yres - value of R6 on exit
 *                printer - value of R7 on exit
 *
 * Other notes:   Calls SWI 0x80140.
 */

extern os_error *xpdriver_info (pdriver_info_type *type,
      int *xres,
      int *yres,
      pdriver_features *features,
      char **desc,
      int *halftone_xres,
      int *halftone_yres,
      int *printer);
extern void pdriver_info (pdriver_info_type *type,
      int *xres,
      int *yres,
      pdriver_features *features,
      char **desc,
      int *halftone_xres,
      int *halftone_yres,
      int *printer);

/* ------------------------------------------------------------------------
 * Function:      pdriver_set_info()
 *
 * Description:   Configures the printer driver
 *
 * Input:         xres - value of R1 on entry
 *                yres - value of R2 on entry
 *                features - value of R3 on entry
 *                printer_name - value of R4 on entry
 *                halftone_xres - value of R5 on entry
 *                halftone_yres - value of R6 on entry
 *                printer - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x80141.
 */

extern os_error *xpdriver_set_info (int xres,
      int yres,
      pdriver_features features,
      char const *printer_name,
      int halftone_xres,
      int halftone_yres,
      int printer);
extern void pdriver_set_info (int xres,
      int yres,
      pdriver_features features,
      char const *printer_name,
      int halftone_xres,
      int halftone_yres,
      int printer);

/* ------------------------------------------------------------------------
 * Function:      pdriver_check_features()
 *
 * Description:   Checks the features of a printer
 *
 * Input:         features - value of R0 on entry
 *                value - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x80142.
 */

extern os_error *xpdriver_check_features (pdriver_features features,
      pdriver_features value);
__swi (0x80142) void pdriver_check_features (pdriver_features features,
      pdriver_features value);

/* ------------------------------------------------------------------------
 * Function:      pdriver_page_size()
 *
 * Description:   Finds how large the paper and printable area are
 *
 * Output:        xsize - value of R1 on exit
 *                ysize - value of R2 on exit
 *                left - value of R3 on exit
 *                bottom - value of R4 on exit
 *                right - value of R5 on exit
 *                top - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x80143.
 */

extern os_error *xpdriver_page_size (int *xsize,
      int *ysize,
      int *left,
      int *bottom,
      int *right,
      int *top);
extern void pdriver_page_size (int *xsize,
      int *ysize,
      int *left,
      int *bottom,
      int *right,
      int *top);

/* ------------------------------------------------------------------------
 * Function:      pdriver_set_page_size()
 *
 * Description:   Sets how large the paper and printable area are
 *
 * Input:         xsize - value of R1 on entry
 *                ysize - value of R2 on entry
 *                left - value of R3 on entry
 *                bottom - value of R4 on entry
 *                right - value of R5 on entry
 *                top - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x80144.
 */

extern os_error *xpdriver_set_page_size (int xsize,
      int ysize,
      int left,
      int bottom,
      int right,
      int top);
extern void pdriver_set_page_size (int xsize,
      int ysize,
      int left,
      int bottom,
      int right,
      int top);

/* ------------------------------------------------------------------------
 * Function:      pdriver_select_job()
 *
 * Description:   Makes a given print job the current one. Prefer
 *                PDriver_SelectJobW
 *
 * Input:         job - value of R0 on entry
 *                title - value of R1 on entry
 *
 * Output:        old_job - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x80145.
 */

extern os_error *xpdriver_select_job (os_f job,
      char const *title,
      os_f *old_job);
extern os_f pdriver_select_job (os_f job,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      pdriver_select_jobw()
 *
 * Description:   Makes a given print job the current one. Uses 32-bit file
 *                handles.
 *
 * Input:         job - value of R0 on entry
 *                title - value of R1 on entry
 *
 * Output:        old_job - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x80145.
 */

extern os_error *xpdriver_select_jobw (os_fw job,
      char const *title,
      os_fw *old_job);
extern os_fw pdriver_select_jobw (os_fw job,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      pdriver_current_job()
 *
 * Description:   Gets the file handle of the current job. Prefer
 *                PDriver_CurrentJobW
 *
 * Output:        job - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x80146.
 */

extern os_error *xpdriver_current_job (os_f *job);
__swi (0x80146) os_f pdriver_current_job (void);

/* ------------------------------------------------------------------------
 * Function:      pdriver_current_jobw()
 *
 * Description:   Gets the file handle of the current job. Uses 32-bit file
 *                handle.
 *
 * Output:        job - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x80146.
 */

extern os_error *xpdriver_current_jobw (os_fw *job);
__swi (0x80146) os_fw pdriver_current_jobw (void);

/* ------------------------------------------------------------------------
 * Function:      pdriver_end_job()
 *
 * Description:   Ends a print job normally. Prefer PDriver_EndJobW
 *
 * Input:         job - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x80148.
 */

extern os_error *xpdriver_end_job (os_f job);
__swi (0x80148) void pdriver_end_job (os_f job);

/* ------------------------------------------------------------------------
 * Function:      pdriver_end_jobw()
 *
 * Description:   Ends a print job normally. Uses 32-bit file handle.
 *
 * Input:         job - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x80148.
 */

extern os_error *xpdriver_end_jobw (os_fw job);
__swi (0x80148) void pdriver_end_jobw (os_fw job);

/* ------------------------------------------------------------------------
 * Function:      pdriver_abort_job()
 *
 * Description:   Ends a print job without any further output. Prefer
 *                PDriver_AbortJobW
 *
 * Input:         job - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x80149.
 */

extern os_error *xpdriver_abort_job (os_f job);
__swi (0x80149) void pdriver_abort_job (os_f job);

/* ------------------------------------------------------------------------
 * Function:      pdriver_abort_jobw()
 *
 * Description:   Ends a print job without any further output. Uses 32-bit
 *                file handle.
 *
 * Input:         job - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x80149.
 */

extern os_error *xpdriver_abort_jobw (os_fw job);
__swi (0x80149) void pdriver_abort_jobw (os_fw job);

/* ------------------------------------------------------------------------
 * Function:      pdriver_reset()
 *
 * Description:   Aborts all print jobs
 *
 * Other notes:   Calls SWI 0x8014A.
 */

extern os_error *xpdriver_reset (void);
__swi (0x8014A) void pdriver_reset (void);

/* ------------------------------------------------------------------------
 * Function:      pdriver_give_rectangle()
 *
 * Description:   Specifies a rectangle to be printed
 *
 * Input:         id - value of R0 on entry
 *                rect - value of R1 on entry
 *                trfm - value of R2 on entry
 *                pos - value of R3 on entry
 *                bg - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x8014B.
 */

extern os_error *xpdriver_give_rectangle (int id,
      os_box const *rect,
      os_hom_trfm const *trfm,
      os_coord const *pos,
      os_colour bg);
extern void pdriver_give_rectangle (int id,
      os_box const *rect,
      os_hom_trfm const *trfm,
      os_coord const *pos,
      os_colour bg);

/* ------------------------------------------------------------------------
 * Function:      pdriver_draw_page()
 *
 * Description:   Called to draw the page after all rectangles have been
 *                specified
 *
 * Input:         copies_and_flags - value of R0 on entry
 *                rect - value of R1 on entry
 *                page - value of R2 on entry
 *                page_no - value of R3 on entry
 *
 * Output:        more - value of R0 on exit (X version only)
 *                id - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8014C.
 */

extern os_error *xpdriver_draw_page (pdriver_draw_flags copies_and_flags,
      os_box *rect,
      int page,
      char const *page_no,
      osbool *more,
      int *id);
extern osbool pdriver_draw_page (pdriver_draw_flags copies_and_flags,
      os_box *rect,
      int page,
      char const *page_no,
      int *id);

/* ------------------------------------------------------------------------
 * Function:      pdriver_get_rectangle()
 *
 * Description:   Gets the next print rectangle
 *
 * Input:         rect - value of R1 on entry
 *
 * Output:        more - value of R0 on exit (X version only)
 *                id - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8014D.
 */

extern os_error *xpdriver_get_rectangle (os_box *rect,
      osbool *more,
      int *id);
extern osbool pdriver_get_rectangle (os_box *rect,
      int *id);

/* ------------------------------------------------------------------------
 * Function:      pdriver_cancel_job()
 *
 * Description:   Stops a print job from printing. Prefer
 *                PDriver_CancelJobW
 *
 * Input:         job - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x8014E.
 */

extern os_error *xpdriver_cancel_job (os_f job);
__swi (0x8014E) void pdriver_cancel_job (os_f job);

/* ------------------------------------------------------------------------
 * Function:      pdriver_cancel_jobw()
 *
 * Description:   Stops a print job from printing. Uses 32-bit file handle.
 *
 * Input:         job - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x8014E.
 */

extern os_error *xpdriver_cancel_jobw (os_fw job);
__swi (0x8014E) void pdriver_cancel_jobw (os_fw job);

/* ------------------------------------------------------------------------
 * Function:      pdriver_screen_dump()
 *
 * Description:   Outputs a screen dump to the printer. Prefer
 *                PDriver_ScreenDumpW
 *
 * Input:         job - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x8014F.
 */

extern os_error *xpdriver_screen_dump (os_f job);
__swi (0x8014F) void pdriver_screen_dump (os_f job);

/* ------------------------------------------------------------------------
 * Function:      pdriver_screen_dumpw()
 *
 * Description:   Outputs a screen dump to the printer. Uses 32-bit file
 *                handle.
 *
 * Input:         job - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x8014F.
 */

extern os_error *xpdriver_screen_dumpw (os_fw job);
__swi (0x8014F) void pdriver_screen_dumpw (os_fw job);

/* ------------------------------------------------------------------------
 * Function:      pdriver_enumerate_jobs()
 *
 * Description:   Lists existing print jobs
 *
 * Input:         context - value of R0 on entry
 *
 * Output:        context_out - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x80150.
 */

extern os_error *xpdriver_enumerate_jobs (int context,
      int *context_out);
__swi (0x80150) int pdriver_enumerate_jobs (int context);

/* ------------------------------------------------------------------------
 * Function:      pdriver_cancel_job_with_error()
 *
 * Description:   Cancels a print job - future attempts to output to it are
 *                errors. Prefer PDriver_CancelJobWithErrorW
 *
 * Input:         job - value of R0 on entry
 *                error - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x80152.
 */

extern os_error *xpdriver_cancel_job_with_error (os_f job,
      os_error const *error);
__swi (0x80152) void pdriver_cancel_job_with_error (os_f job,
      os_error const *error);

/* ------------------------------------------------------------------------
 * Function:      pdriver_cancel_job_with_errorw()
 *
 * Description:   Cancels a print job - future attempts to output to it are
 *                errors. Uses 32-bit file handle.
 *
 * Input:         job - value of R0 on entry
 *                error - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x80152.
 */

extern os_error *xpdriver_cancel_job_with_errorw (os_fw job,
      os_error const *error);
__swi (0x80152) void pdriver_cancel_job_with_errorw (os_fw job,
      os_error const *error);

/* ------------------------------------------------------------------------
 * Function:      pdriver_select_illustration()
 *
 * Description:   Makes the given print job the current one, and treats it
 *                as an illustration. Prefer PDriver_SelectIllustrationW
 *
 * Input:         job - value of R0 on entry
 *                title - value of R1 on entry
 *
 * Output:        old_job - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x80153.
 */

extern os_error *xpdriver_select_illustration (os_f job,
      char const *title,
      os_f *old_job);
__swi (0x80153) os_f pdriver_select_illustration (os_f job,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      pdriver_select_illustrationw()
 *
 * Description:   Makes the given print job the current one, and treats it
 *                as an illustration. Uses 32-bit file handle.
 *
 * Input:         job - value of R0 on entry
 *                title - value of R1 on entry
 *
 * Output:        old_job - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x80153.
 */

extern os_error *xpdriver_select_illustrationw (os_fw job,
      char const *title,
      os_fw *old_job);
__swi (0x80153) os_fw pdriver_select_illustrationw (os_fw job,
      char const *title);

/* ------------------------------------------------------------------------
 * Function:      pdriver_insert_illustration()
 *
 * Description:   Inserts a file containing an illustration into the
 *                current job's output. Prefer PDriver_InsertIllustrationW
 *
 * Input:         job - value of R0 on entry
 *                clip_path - value of R1 on entry
 *                x0 - value of R2 on entry
 *                y0 - value of R3 on entry
 *                x1 - value of R4 on entry
 *                y1 - value of R5 on entry
 *                x2 - value of R6 on entry
 *                y2 - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x80154.
 */

extern os_error *xpdriver_insert_illustration (os_f job,
      draw_path const *clip_path,
      int x0,
      int y0,
      int x1,
      int y1,
      int x2,
      int y2);
extern void pdriver_insert_illustration (os_f job,
      draw_path const *clip_path,
      int x0,
      int y0,
      int x1,
      int y1,
      int x2,
      int y2);

/* ------------------------------------------------------------------------
 * Function:      pdriver_insert_illustrationw()
 *
 * Description:   Inserts a file containing an illustration into the
 *                current job's output. Uses 32-bit file handle.
 *
 * Input:         job - value of R0 on entry
 *                clip_path - value of R1 on entry
 *                x0 - value of R2 on entry
 *                y0 - value of R3 on entry
 *                x1 - value of R4 on entry
 *                y1 - value of R5 on entry
 *                x2 - value of R6 on entry
 *                y2 - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x80154.
 */

extern os_error *xpdriver_insert_illustrationw (os_fw job,
      draw_path const *clip_path,
      int x0,
      int y0,
      int x1,
      int y1,
      int x2,
      int y2);
extern void pdriver_insert_illustrationw (os_fw job,
      draw_path const *clip_path,
      int x0,
      int y0,
      int x1,
      int y1,
      int x2,
      int y2);

/* ------------------------------------------------------------------------
 * Function:      pdriver_declare_font()
 *
 * Description:   Declares the fonts that will be used in a document
 *
 * Input:         font - value of R0 on entry
 *                font_name - value of R1 on entry
 *                flags - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x80155.
 */

extern os_error *xpdriver_declare_font (font_f font,
      char const *font_name,
      pdriver_font_flags flags);
__swi (0x80155) void pdriver_declare_font (font_f font,
      char const *font_name,
      pdriver_font_flags flags);

/* ------------------------------------------------------------------------
 * Function:      pdriver_declare_driver()
 *
 * Description:   Registers a printer driver with the PDriver sharer module
 *
 * Input:         reason - value of R0 on entry
 *                workspace - value of R1 on entry
 *                type - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x80156.
 */

extern os_error *xpdriver_declare_driver (int reason,
      void *workspace,
      pdriver_type type);
__swi (0x80156) void pdriver_declare_driver (int reason,
      void *workspace,
      pdriver_type type);

/* ------------------------------------------------------------------------
 * Function:      pdriver_remove_driver()
 *
 * Description:   Deregisters a printer driver with the PDriver sharer
 *                module
 *
 * Input:         type - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x80157.
 */

extern os_error *xpdriver_remove_driver (pdriver_type type);
__swi (0x80157) void pdriver_remove_driver (pdriver_type type);

/* ------------------------------------------------------------------------
 * Function:      pdriver_select_driver()
 *
 * Description:   Selects the specified printer driver
 *
 * Input:         type - value of R0 on entry
 *
 * Output:        old_type - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x80158.
 */

extern os_error *xpdriver_select_driver (pdriver_type type,
      pdriver_type *old_type);
__swi (0x80158) pdriver_type pdriver_select_driver (pdriver_type type);

/* ------------------------------------------------------------------------
 * Function:      pdriver_enumerate_drivers()
 *
 * Description:   Enumerates all printer drivers within the system
 *
 * Input:         context - value of R0 on entry
 *
 * Output:        context_out - value of R0 on exit (X version only)
 *                type - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x80159.
 */

extern os_error *xpdriver_enumerate_drivers (int context,
      int *context_out,
      pdriver_type *type);
extern int pdriver_enumerate_drivers (int context,
      pdriver_type *type);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscop_add_font()
 *
 * Description:   Adds a font name to a list of those known to the current
 *                printer driver
 *
 * Input:         font_name - value of R1 on entry
 *                alien_name - value of R2 on entry
 *                flags - value of R3 on entry
 *                add_flags - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x8015A with R0 = 0x0.
 */

extern os_error *xpdrivermiscop_add_font (char const *font_name,
      char const *alien_name,
      pdriver_font_map_flags flags,
      pdriver_font_add_flags add_flags);
extern void pdrivermiscop_add_font (char const *font_name,
      char const *alien_name,
      pdriver_font_map_flags flags,
      pdriver_font_add_flags add_flags);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscop_remove_font()
 *
 * Description:   Removes font name(s) from a list of those known to the
 *                current printer driver
 *
 * Input:         font_name - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x8015A with R0 = 0x1.
 */

extern os_error *xpdrivermiscop_remove_font (char const *font_name);
extern void pdrivermiscop_remove_font (char const *font_name);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscop_enumerate_fonts()
 *
 * Description:   Enumerates the font names known to the current printer
 *                driver
 *
 * Input:         buffer - value of R1 on entry
 *                size - value of R2 on entry
 *                context - value of R3 on entry
 *                flags - value of R4 on entry
 *
 * Output:        end - value of R1 on exit
 *                context_out - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8015A with R0 = 0x2.
 */

extern os_error *xpdrivermiscop_enumerate_fonts (char *buffer,
      int size,
      int context,
      pdriver_enumerate_flags flags,
      char **end,
      int *context_out);
extern int pdrivermiscop_enumerate_fonts (char *buffer,
      int size,
      int context,
      pdriver_enumerate_flags flags,
      char **end);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscop_register_dumper()
 *
 * Description:   Registers a printer dumper with the current printer
 *                driver, PDriverDP
 *
 * Input:         pdumper_no - value of R1 on entry
 *                dp_version_required - value of R2 on entry
 *                dumper_workspace - value of R3 on entry
 *                dumper_code - value of R4 on entry
 *                supported_calls - value of R5 on entry
 *                supported_strips - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x8015A with R0 = 0x80000000.
 */

extern os_error *xpdrivermiscop_register_dumper (int pdumper_no,
      int dp_version_required,
      void *dumper_workspace,
      void const *dumper_code,
      bits supported_calls,
      bits supported_strips);
extern void pdrivermiscop_register_dumper (int pdumper_no,
      int dp_version_required,
      void *dumper_workspace,
      void const *dumper_code,
      bits supported_calls,
      bits supported_strips);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscop_deregister_dumper()
 *
 * Description:   Deregisters a printer dumper with the current printer
 *                driver, PDriverDP
 *
 * Input:         pdumper_no - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x8015A with R0 = 0x80000001.
 */

extern os_error *xpdrivermiscop_deregister_dumper (int pdumper_no);
extern void pdrivermiscop_deregister_dumper (int pdumper_no);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscop_strip_types()
 *
 * Description:   Returns a bit mask showing which strip types a printer
 *                dumper supports with the current printer driver - RISC O
 *                S 3.5+
 *
 * Input:         pdumper_no - value of R1 on entry
 *
 * Output:        supported_strips - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8015A with R0 = 0x80000002.
 */

extern os_error *xpdrivermiscop_strip_types (int pdumper_no,
      bits *supported_strips);
extern bits pdrivermiscop_strip_types (int pdumper_no);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscopfordriver_add_font()
 *
 * Description:   Adds a font name to a list of those known to a specified
 *                printer driver
 *
 * Input:         font_name - value of R1 on entry
 *                alien_name - value of R2 on entry
 *                flags - value of R3 on entry
 *                add_flags - value of R4 on entry
 *                type - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x8015B with R0 = 0x0.
 */

extern os_error *xpdrivermiscopfordriver_add_font (char const *font_name,
      char const *alien_name,
      pdriver_font_map_flags flags,
      pdriver_font_add_flags add_flags,
      pdriver_type type);
extern void pdrivermiscopfordriver_add_font (char const *font_name,
      char const *alien_name,
      pdriver_font_map_flags flags,
      pdriver_font_add_flags add_flags,
      pdriver_type type);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscopfordriver_remove_font()
 *
 * Description:   Removes font name(s) from a list of those known to a
 *                specified printer driver
 *
 * Input:         font_name - value of R1 on entry
 *                type - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x8015B with R0 = 0x1.
 */

extern os_error *xpdrivermiscopfordriver_remove_font (char const *font_name,
      pdriver_type type);
extern void pdrivermiscopfordriver_remove_font (char const *font_name,
      pdriver_type type);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscopfordriver_enumerate_fonts()
 *
 * Description:   Enumerates the font names known to a specified printer
 *                driver
 *
 * Input:         buffer - value of R1 on entry
 *                size - value of R2 on entry
 *                context - value of R3 on entry
 *                flags - value of R4 on entry
 *                type - value of R8 on entry
 *
 * Output:        end - value of R1 on exit
 *                context_out - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8015B with R0 = 0x2.
 */

extern os_error *xpdrivermiscopfordriver_enumerate_fonts (char *buffer,
      int size,
      int context,
      pdriver_enumerate_flags flags,
      pdriver_type type,
      char **end,
      int *context_out);
extern int pdrivermiscopfordriver_enumerate_fonts (char *buffer,
      int size,
      int context,
      pdriver_enumerate_flags flags,
      pdriver_type type,
      char **end);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscopfordriver_register_dumper()
 *
 * Description:   Registers a printer dumper a specified printer driver,
 *                PDriverDP
 *
 * Input:         pdumper_no - value of R1 on entry
 *                dp_version_required - value of R2 on entry
 *                dumper_workspace - value of R3 on entry
 *                dumper_code - value of R4 on entry
 *                supported_calls - value of R5 on entry
 *                supported_strips - value of R6 on entry
 *                type - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x8015A with R0 = 0x80000000.
 */

extern os_error *xpdrivermiscopfordriver_register_dumper (int pdumper_no,
      int dp_version_required,
      void *dumper_workspace,
      void const *dumper_code,
      bits supported_calls,
      bits supported_strips,
      pdriver_type type);
extern void pdrivermiscopfordriver_register_dumper (int pdumper_no,
      int dp_version_required,
      void *dumper_workspace,
      void const *dumper_code,
      bits supported_calls,
      bits supported_strips,
      pdriver_type type);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscopfordriver_deregister_dumper()
 *
 * Description:   Deregisters a printer dumper with a specified printer
 *                driver, PDriverDP
 *
 * Input:         pdumper_no - value of R1 on entry
 *                type - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x8015A with R0 = 0x80000001.
 */

extern os_error *xpdrivermiscopfordriver_deregister_dumper (int pdumper_no,
      pdriver_type type);
extern void pdrivermiscopfordriver_deregister_dumper (int pdumper_no,
      pdriver_type type);

/* ------------------------------------------------------------------------
 * Function:      pdrivermiscopfordriver_strip_types()
 *
 * Description:   Returns a bit mask showing which strip types a printer
 *                dumper supports with a specified printer driver - RISC O
 *                S 3.5+
 *
 * Input:         pdumper_no - value of R1 on entry
 *                type - value of R8 on entry
 *
 * Output:        supported_strips - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8015A with R0 = 0x80000002.
 */

extern os_error *xpdrivermiscopfordriver_strip_types (int pdumper_no,
      pdriver_type type,
      bits *supported_strips);
extern bits pdrivermiscopfordriver_strip_types (int pdumper_no,
      pdriver_type type);

/* ------------------------------------------------------------------------
 * Function:      pdriver_set_driver()
 *
 * Description:   Configures the current printer driver
 *
 * Input:         pdumper_no - value of R1 on entry
 *                ensure_command - value of R2 on entry
 *                configuration_data1 - value of R3 on entry
 *                configuration_data2 - value of R4 on entry
 *                configuration_word - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x8015C.
 */

extern os_error *xpdriver_set_driver (int pdumper_no,
      char const *ensure_command,
      byte const *configuration_data1,
      byte const *configuration_data2,
      int configuration_word);
extern void pdriver_set_driver (int pdumper_no,
      char const *ensure_command,
      byte const *configuration_data1,
      byte const *configuration_data2,
      int configuration_word);

/* ------------------------------------------------------------------------
 * Function:      pdriver_set_driver_extended()
 *
 * Description:   Configures the current printer driver
 *
 * Input:         pdumper_no - value of R1 on entry
 *                ensure_command - value of R2 on entry
 *                configuration_data1 - value of R3 on entry
 *                configuration_data2 - value of R4 on entry
 *                configuration_word - value of R5 on entry
 *                configuration_info - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x8015C.
 */

extern os_error *xpdriver_set_driver_extended (int pdumper_no,
      char const *ensure_command,
      byte const *configuration_data1,
      byte const *configuration_data2,
      int configuration_word,
      pdriver_configuration_info const *configuration_info);
extern void pdriver_set_driver_extended (int pdumper_no,
      char const *ensure_command,
      byte const *configuration_data1,
      byte const *configuration_data2,
      int configuration_word,
      pdriver_configuration_info const *configuration_info);

/* ------------------------------------------------------------------------
 * Function:      pdriverjpegswiinfo_dimensions()
 *
 * Description:   Returns the dimensions of a JPEG image in memory - RISC O
 *                S 3.6+
 *
 * Input:         image - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        info_flags - value of R0 on exit (X version only)
 *                width - value of R2 on exit
 *                height - value of R3 on exit
 *                xdpi - value of R4 on exit
 *                ydpi - value of R5 on exit
 *                workspace_size - value of R6 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8015D with R0 = 0x1, R8 = 0x49980.
 */

extern os_error *xpdriverjpegswiinfo_dimensions (jpeg_image const *image,
      int size,
      jpeg_info_flags *info_flags,
      int *width,
      int *height,
      int *xdpi,
      int *ydpi,
      int *workspace_size);
extern jpeg_info_flags pdriverjpegswiinfo_dimensions (jpeg_image const *image,
      int size,
      int *width,
      int *height,
      int *xdpi,
      int *ydpi,
      int *workspace_size);

/* ------------------------------------------------------------------------
 * Function:      pdriverjpegswifileinfo_dimensions()
 *
 * Description:   Returns the dimensions of a JPEG image in a file - RISC O
 *                S 3.6+
 *
 * Input:         file_name - value of R1 on entry
 *
 * Output:        info_flags - value of R0 on exit (X version only)
 *                width - value of R2 on exit
 *                height - value of R3 on exit
 *                xdpi - value of R4 on exit
 *                ydpi - value of R5 on exit
 *                workspace_size - value of R6 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x8015D with R0 = 0x1, R8 = 0x49981.
 */

extern os_error *xpdriverjpegswifileinfo_dimensions (char const *file_name,
      jpeg_info_flags *info_flags,
      int *width,
      int *height,
      int *xdpi,
      int *ydpi,
      int *workspace_size);
extern jpeg_info_flags pdriverjpegswifileinfo_dimensions (char const *file_name,
      int *width,
      int *height,
      int *xdpi,
      int *ydpi,
      int *workspace_size);

/* ------------------------------------------------------------------------
 * Function:      pdriverjpegswi_plot_scaled()
 *
 * Description:   Plots a JPEG image from memory - RISC O S 3.6+
 *
 * Input:         image - value of R0 on entry
 *                x - value of R1 on entry
 *                y - value of R2 on entry
 *                factors - value of R3 on entry
 *                size - value of R4 on entry
 *                flags - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x8015D with R8 = 0x49982.
 */

extern os_error *xpdriverjpegswi_plot_scaled (jpeg_image const *image,
      int x,
      int y,
      os_factors const *factors,
      int size,
      jpeg_scale_flags flags);
extern void pdriverjpegswi_plot_scaled (jpeg_image const *image,
      int x,
      int y,
      os_factors const *factors,
      int size,
      jpeg_scale_flags flags);

/* ------------------------------------------------------------------------
 * Function:      pdriverjpegswi_plot_file_scaled()
 *
 * Description:   Plots a JPEG image from a file - RISC O S 3.6+
 *
 * Input:         file_name - value of R0 on entry
 *                x - value of R1 on entry
 *                y - value of R2 on entry
 *                factors - value of R3 on entry
 *                flags - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x8015D with R8 = 0x49983.
 */

extern os_error *xpdriverjpegswi_plot_file_scaled (char const *file_name,
      int x,
      int y,
      os_factors const *factors,
      jpeg_scale_flags flags);
extern void pdriverjpegswi_plot_file_scaled (char const *file_name,
      int x,
      int y,
      os_factors const *factors,
      jpeg_scale_flags flags);

/* ------------------------------------------------------------------------
 * Function:      pdriverjpegswi_plot_transformed()
 *
 * Description:   Plots a JPEG image from memory using a transformation
 *                matrix - RISC O S 3.6+
 *
 * Input:         image - value of R0 on entry
 *                flags - value of R1 on entry
 *                trfm_or_rect - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x8015D with R8 = 0x49984.
 */

extern os_error *xpdriverjpegswi_plot_transformed (jpeg_image const *image,
      jpeg_transform_flags flags,
      os_trfm const *trfm_or_rect,
      int size);
extern void pdriverjpegswi_plot_transformed (jpeg_image const *image,
      jpeg_transform_flags flags,
      os_trfm const *trfm_or_rect,
      int size);

/* ------------------------------------------------------------------------
 * Function:      pdriverjpegswi_plot_file_transformed()
 *
 * Description:   Plots a JPEG image from a file using a transformation
 *                matrix - RISC O S 3.6+
 *
 * Input:         file_name - value of R0 on entry
 *                flags - value of R1 on entry
 *                trfm_or_rect - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x8015D with R8 = 0x49985.
 */

extern os_error *xpdriverjpegswi_plot_file_transformed (char const *file_name,
      jpeg_transform_flags flags,
      os_trfm const *trfm_or_rect);
extern void pdriverjpegswi_plot_file_transformed (char const *file_name,
      jpeg_transform_flags flags,
      os_trfm const *trfm_or_rect);

/* ------------------------------------------------------------------------
 * Function:      service_print()
 *
 * Description:   For internal use only
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x41.
 */

extern os_error *xservice_print (void);
extern void service_print (void);

/* ------------------------------------------------------------------------
 * Function:      service_pdriver_starting()
 *
 * Description:   PDriver sharer module started
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x65.
 */

extern os_error *xservice_pdriver_starting (void);
extern void service_pdriver_starting (void);

/* ------------------------------------------------------------------------
 * Function:      service_pdriver_get_messages()
 *
 * Description:   Get common messages file
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                common_cb - value of R3 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x78.
 */

extern os_error *xservice_pdriver_get_messages (osbool *unclaimed,
      messagetrans_control_block **common_cb);
extern osbool service_pdriver_get_messages (messagetrans_control_block **common_cb);

/* ------------------------------------------------------------------------
 * Function:      service_pdriver_changed()
 *
 * Description:   The currently selected printer driver has changed
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x7F.
 */

extern os_error *xservice_pdriver_changed (void);
extern void service_pdriver_changed (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#ifndef pdriver32_H
#include "oslib/pdriver32.h"
#endif

#endif
