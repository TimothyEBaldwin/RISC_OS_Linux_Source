#ifndef textgadgets_H
#define textgadgets_H

/* C header file for TextGadgets
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:38 2007
 * Tom Hughes, tom@compton.nu, 29 Mar 1999
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

#ifndef toolbox_H
#include "oslib/toolbox.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  TextGadgets_TextArea
#define TextGadgets_TextArea                    0x140180
#undef  XTextGadgets_TextArea
#define XTextGadgets_TextArea                   0x160180
#undef  TextGadgets_TextField
#define TextGadgets_TextField                   0x140181
#undef  XTextGadgets_TextField
#define XTextGadgets_TextField                  0x160181
#undef  TextGadgets_ScrollList
#define TextGadgets_ScrollList                  0x140182
#undef  XTextGadgets_ScrollList
#define XTextGadgets_ScrollList                 0x160182
#undef  TextGadgets_Scrollbar
#define TextGadgets_Scrollbar                   0x140183
#undef  XTextGadgets_Scrollbar
#define XTextGadgets_Scrollbar                  0x160183
#undef  TextGadgets_Filter
#define TextGadgets_Filter                      0x140185
#undef  XTextGadgets_Filter
#define XTextGadgets_Filter                     0x160185

/************************************
 * Structure and union declarations *
 ************************************/
typedef union  textgadgets_window               textgadgets_window;

/********************
 * Type definitions *
 ********************/
union textgadgets_window
   {  toolbox_o toolbox;
      wimp_w wimp;
   };

typedef bits textgadgets_redraw_all_flags;

/************************
 * Constant definitions *
 ************************/
#define textgadgets_REDRAW_ALL_WIMP_HANDLE      ((textgadgets_redraw_all_flags) 0x1u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      textgadgets_redraw_all()
 *
 *
 * Input:         flags - value of R0 on entry
 *                window - value of R1 on entry
 */

extern os_error *xtextgadgets_redraw_all (textgadgets_redraw_all_flags flags,
      textgadgets_window window);
__swi (0x140184) void textgadgets_redraw_all (textgadgets_redraw_all_flags flags,
      textgadgets_window window);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
