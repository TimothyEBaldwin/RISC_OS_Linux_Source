#ifndef filter_H
#define filter_H

/* C header file for Filter
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 17 May 1995
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Filter_RegisterPreFilter
#define Filter_RegisterPreFilter                0x42640
#undef  XFilter_RegisterPreFilter
#define XFilter_RegisterPreFilter               0x62640
#undef  Filter_RegisterPostFilter
#define Filter_RegisterPostFilter               0x42641
#undef  XFilter_RegisterPostFilter
#define XFilter_RegisterPostFilter              0x62641
#undef  Filter_DeRegisterPreFilter
#define Filter_DeRegisterPreFilter              0x42642
#undef  XFilter_DeRegisterPreFilter
#define XFilter_DeRegisterPreFilter             0x62642
#undef  Filter_DeRegisterPostFilter
#define Filter_DeRegisterPostFilter             0x42643
#undef  XFilter_DeRegisterPostFilter
#define XFilter_DeRegisterPostFilter            0x62643
#undef  Filter_RegisterRectFilter
#define Filter_RegisterRectFilter               0x42644
#undef  XFilter_RegisterRectFilter
#define XFilter_RegisterRectFilter              0x62644
#undef  Filter_DeRegisterRectFilter
#define Filter_DeRegisterRectFilter             0x42645
#undef  XFilter_DeRegisterRectFilter
#define XFilter_DeRegisterRectFilter            0x62645
#undef  Filter_RegisterCopyFilter
#define Filter_RegisterCopyFilter               0x42646
#undef  XFilter_RegisterCopyFilter
#define XFilter_RegisterCopyFilter              0x62646
#undef  Filter_DeRegisterCopyFilter
#define Filter_DeRegisterCopyFilter             0x42647
#undef  XFilter_DeRegisterCopyFilter
#define XFilter_DeRegisterCopyFilter            0x62647
#undef  Filter_RegisterPostRectFilter
#define Filter_RegisterPostRectFilter           0x42648
#undef  XFilter_RegisterPostRectFilter
#define XFilter_RegisterPostRectFilter          0x62648
#undef  Filter_DeRegisterPostRectFilter
#define Filter_DeRegisterPostRectFilter         0x42649
#undef  XFilter_DeRegisterPostRectFilter
#define XFilter_DeRegisterPostRectFilter        0x62649
#undef  Filter_RegisterPostIconFilter
#define Filter_RegisterPostIconFilter           0x4264A
#undef  XFilter_RegisterPostIconFilter
#define XFilter_RegisterPostIconFilter          0x6264A
#undef  Filter_DeRegisterPostIconFilter
#define Filter_DeRegisterPostIconFilter         0x4264B
#undef  XFilter_DeRegisterPostIconFilter
#define XFilter_DeRegisterPostIconFilter        0x6264B
#undef  Service_FilterManagerInstalled
#define Service_FilterManagerInstalled          0x87
#undef  Service_FilterManagerDying
#define Service_FilterManagerDying              0x88

/************************
 * Constant definitions *
 ************************/
#define filter_NAME_LIMIT                       40
#define filter_ALL_TASKS                        ((wimp_t) 0x0u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      filter_register_pre_filter()
 *
 * Description:   Adds a new pre-filter to the list of pre-filters
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *                task - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x42640.
 */

extern os_error *xfilter_register_pre_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);
__swi (0x42640) void filter_register_pre_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      filter_register_post_filter()
 *
 * Description:   Adds a new post-filter to the list of post-filters
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *                task - value of R3 on entry
 *                mask - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x42641.
 */

extern os_error *xfilter_register_post_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task,
      wimp_poll_flags mask);
extern void filter_register_post_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task,
      wimp_poll_flags mask);

/* ------------------------------------------------------------------------
 * Function:      filter_de_register_pre_filter()
 *
 * Description:   Removes a pre-filter from the list of pre-filters
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *                task - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x42642.
 */

extern os_error *xfilter_de_register_pre_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);
__swi (0x42642) void filter_de_register_pre_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      filter_de_register_post_filter()
 *
 * Description:   Removes a post-filter from the list of post-filters
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *                task - value of R3 on entry
 *                mask - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x42643.
 */

extern os_error *xfilter_de_register_post_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task,
      wimp_poll_flags mask);
extern void filter_de_register_post_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task,
      wimp_poll_flags mask);

/* ------------------------------------------------------------------------
 * Function:      filter_register_rect_filter()
 *
 * Description:   Adds a new get-rectangle filter to the list of
 *                get-rectangle filters
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *                task - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x42644.
 */

extern os_error *xfilter_register_rect_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);
__swi (0x42644) void filter_register_rect_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      filter_de_register_rect_filter()
 *
 * Description:   Removes a get-rectangle filter from the list of
 *                get-rectangle filters
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *                task - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x42645.
 */

extern os_error *xfilter_de_register_rect_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);
__swi (0x42645) void filter_de_register_rect_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      filter_register_copy_filter()
 *
 * Description:   Adds a new rectangle-copy filter to the list of
 *                rectangle-copy filters
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x42646.
 */

extern os_error *xfilter_register_copy_filter (char const *filter_name,
      void const *code,
      byte *handle);
__swi (0x42646) void filter_register_copy_filter (char const *filter_name,
      void const *code,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      filter_de_register_copy_filter()
 *
 * Description:   Removes a rectangle-copy filter from the list of
 *                rectangle-copy filters
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x42647.
 */

extern os_error *xfilter_de_register_copy_filter (char const *filter_name,
      void const *code,
      byte *handle);
__swi (0x42647) void filter_de_register_copy_filter (char const *filter_name,
      void const *code,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      filter_register_post_rect_filter()
 *
 * Description:   Adds a new post-rectangle filter to the list of
 *                post-rectangle filters
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *                task - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x42648.
 */

extern os_error *xfilter_register_post_rect_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);
__swi (0x42648) void filter_register_post_rect_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      filter_de_register_post_rect_filter()
 *
 * Description:   Removes a post-rectangle filter from the list of
 *                post-rectangle filters
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *                task - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x42649.
 */

extern os_error *xfilter_de_register_post_rect_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);
__swi (0x42649) void filter_de_register_post_rect_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      filter_register_post_icon_filter()
 *
 * Description:   Adds a new post-icon filter to the list of post-icon
 *                filters - requires Wimp 3.86+
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *                task - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x4264A.
 */

extern os_error *xfilter_register_post_icon_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);
__swi (0x4264A) void filter_register_post_icon_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      filter_de_register_post_icon_filter()
 *
 * Description:   Removes a post-icon filter to the list of post-icon
 *                filters - requires Wimp 3.86+
 *
 * Input:         filter_name - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *                task - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x4264B.
 */

extern os_error *xfilter_de_register_post_icon_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);
__swi (0x4264B) void filter_de_register_post_icon_filter (char const *filter_name,
      void const *code,
      byte *handle,
      wimp_t task);

/* ------------------------------------------------------------------------
 * Function:      service_filter_manager_installed()
 *
 * Description:   Filter Manager starting up
 *
 * Input:         version - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x87.
 */

extern os_error *xservice_filter_manager_installed (int version);
extern void service_filter_manager_installed (int version);

/* ------------------------------------------------------------------------
 * Function:      service_filter_manager_dying()
 *
 * Description:   Filter Manager dying
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x88.
 */

extern os_error *xservice_filter_manager_dying (void);
extern void service_filter_manager_dying (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
