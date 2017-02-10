#ifndef printdbox_H
#define printdbox_H

/* C header file for PrintDbox
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:54:38 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 5 Sept 1995
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

#ifndef toolbox_H
#include "oslib/toolbox.h"
#endif

#ifndef window_H
#include "oslib/window.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  PrintDbox_ClassSWI
#define PrintDbox_ClassSWI                      0x82B00
#undef  XPrintDbox_ClassSWI
#define XPrintDbox_ClassSWI                     0xA2B00
#undef  PrintDbox_PostFilter
#define PrintDbox_PostFilter                    0x82B01
#undef  XPrintDbox_PostFilter
#define XPrintDbox_PostFilter                   0xA2B01
#undef  PrintDbox_PreFilter
#define PrintDbox_PreFilter                     0x82B02
#undef  XPrintDbox_PreFilter
#define XPrintDbox_PreFilter                    0xA2B02
#undef  PrintDbox_GetWindowId
#define PrintDbox_GetWindowId                   0x0
#undef  PrintDbox_SetPageRange
#define PrintDbox_SetPageRange                  0x1
#undef  PrintDbox_GetPageRange
#define PrintDbox_GetPageRange                  0x2
#undef  PrintDbox_SetCopies
#define PrintDbox_SetCopies                     0x3
#undef  PrintDbox_GetCopies
#define PrintDbox_GetCopies                     0x4
#undef  PrintDbox_SetScale
#define PrintDbox_SetScale                      0x5
#undef  PrintDbox_GetScale
#define PrintDbox_GetScale                      0x6
#undef  PrintDbox_SetOrientation
#define PrintDbox_SetOrientation                0x7
#undef  PrintDbox_GetOrientation
#define PrintDbox_GetOrientation                0x8
#undef  PrintDbox_GetTitle
#define PrintDbox_GetTitle                      0x9
#undef  PrintDbox_SetDraft
#define PrintDbox_SetDraft                      0xA
#undef  PrintDbox_GetDraft
#define PrintDbox_GetDraft                      0xB

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct printdbox_object                 printdbox_object;
typedef struct printdbox_object_template        printdbox_object_template;
typedef struct printdbox_action_about_to_be_shown printdbox_action_about_to_be_shown;
typedef struct printdbox_action_about_to_be_shown_block printdbox_action_about_to_be_shown_block;
typedef struct printdbox_action_setup_about_to_be_shown printdbox_action_setup_about_to_be_shown;
typedef struct printdbox_action_setup_about_to_be_shown_block printdbox_action_setup_about_to_be_shown_block;
typedef struct printdbox_action_save            printdbox_action_save;
typedef struct printdbox_action_save_block      printdbox_action_save_block;
typedef struct printdbox_action_print           printdbox_action_print;
typedef struct printdbox_action_print_block     printdbox_action_print_block;

/********************
 * Type definitions *
 ********************/
typedef bits printdbox_flags;

/* ------------------------------------------------------------------------
 * Type:          printdbox_object
 *
 * Description:   Structure to describe Object for in-memory construction - referenced from Toolbox_Template
 */

struct printdbox_object
   {  printdbox_flags flags;
      int from;
      int to;
      int copies;
      int scale;
      toolbox_string_reference further_options;
      toolbox_string_reference alternative_window_name;
   };

struct printdbox_object_template
   {  toolbox_RESOURCE_FILE_OBJECT_MEMBERS
      printdbox_flags objectflags;
      int from;
      int to;
      int copies;
      int scale;
      toolbox_string_reference further_options;
      toolbox_string_reference alternative_window_name;
   };

typedef toolbox_full printdbox_full;

/* ------------------------------------------------------------------------
 * Type:          printdbox_action_about_to_be_shown
 *
 * Description:   Prefer PrintDbox_ActionAboutToBeShownBlock
 */

struct printdbox_action_about_to_be_shown
   {  toolbox_position_tag tag;
      union
      {  os_coord top_left;
         printdbox_full full;
      }
      position;
   };

struct printdbox_action_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         printdbox_full full;
      }
      position;
   };

typedef toolbox_action_header_base printdbox_action_dialogue_completed_block;

/* ------------------------------------------------------------------------
 * Type:          printdbox_action_setup_about_to_be_shown
 *
 * Description:   Prefer PrintDbox_ActionSetupAboutToBeShownBlock
 */

struct printdbox_action_setup_about_to_be_shown
   {  toolbox_o setup;
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         printdbox_full full;
      }
      position;
   };

struct printdbox_action_setup_about_to_be_shown_block
   {  toolbox_ACTION_HEADER_MEMBERS
      toolbox_o setup;
      toolbox_position_tag tag;
      union
      {  os_coord top_left;
         printdbox_full full;
      }
      position;
   };

/* ------------------------------------------------------------------------
 * Type:          printdbox_action_save
 *
 * Description:   Prefer PrintDbox_ActionSaveBlock
 */

struct printdbox_action_save
   {  int start;
      int finish;
      int copies;
      int scale_factor;
   };

struct printdbox_action_save_block
   {  toolbox_ACTION_HEADER_MEMBERS
      int start;
      int finish;
      int copies;
      int scale_factor;
   };

/* ------------------------------------------------------------------------
 * Type:          printdbox_action_print
 *
 * Description:   Prefer PrintDbox_ActionPrintBlock
 */

struct printdbox_action_print
   {  int start;
      int finish;
      int copies;
      int scale_factor;
   };

struct printdbox_action_print_block
   {  toolbox_ACTION_HEADER_MEMBERS
      int start;
      int finish;
      int copies;
      int scale_factor;
   };

/************************
 * Constant definitions *
 ************************/
#define class_PRINT_DBOX                        ((toolbox_class) 0x82B00u)
#define printdbox_GENERATE_ABOUT_TO_BE_SHOWN    ((printdbox_flags) 0x1u)
#define printdbox_GENERATE_DIALOGUE_COMPLETED   ((printdbox_flags) 0x2u)
#define printdbox_GENERATE_SHOW_SETUP_ACTION    ((printdbox_flags) 0x4u)
#define printdbox_INCLUDE_ALL_FROM_TO           ((printdbox_flags) 0x8u)
#define printdbox_INCLUDE_COPIES                ((printdbox_flags) 0x10u)
#define printdbox_INCLUDE_SCALE                 ((printdbox_flags) 0x20u)
#define printdbox_INCLUDE_ORIENTATION           ((printdbox_flags) 0x40u)
#define printdbox_INCLUDE_SAVE                  ((printdbox_flags) 0x80u)
#define printdbox_INCLUDE_SET_UP                ((printdbox_flags) 0x100u)
#define printdbox_INCLUDE_DRAFT                 ((printdbox_flags) 0x200u)
#define printdbox_SELECT_FROM_TO                ((printdbox_flags) 0x400u)
#define printdbox_SELECT_SIDEWAYS               ((printdbox_flags) 0x800u)
#define printdbox_SELECT_DRAFT                  ((printdbox_flags) 0x1000u)
#define printdbox_PRINT                         ((toolbox_c) 0x82B0000u)
#define printdbox_SAVE                          ((toolbox_c) 0x82B0001u)
#define printdbox_CANCEL                        ((toolbox_c) 0x82B0002u)
#define printdbox_FROM_TO                       ((toolbox_c) 0x82B0003u)
#define printdbox_ALL                           ((toolbox_c) 0x82B0004u)
#define printdbox_FROM                          ((toolbox_c) 0x82B0005u)
#define printdbox_TO                            ((toolbox_c) 0x82B000Du)
#define printdbox_COPIES                        ((toolbox_c) 0x82B000Eu)
#define printdbox_SCALE                         ((toolbox_c) 0x82B000Fu)
#define printdbox_UPRIGHT                       ((toolbox_c) 0x82B0009u)
#define printdbox_SIDEWAYS                      ((toolbox_c) 0x82B000Au)
#define printdbox_DRAFT                         ((toolbox_c) 0x82B000Bu)
#define printdbox_SET_UP                        ((toolbox_c) 0x82B000Cu)
#define printdbox_PERCENT                       ((toolbox_c) 0x82B0010u)
#define action_PRINT_DBOX_ABOUT_TO_BE_SHOWN     0x82B00u
#define action_PRINT_DBOX_DIALOGUE_COMPLETED    0x82B01u
#define action_PRINT_DBOX_SET_UP_ABOUT_TO_BE_SHOWN 0x82B02u
#define action_PRINT_DBOX_SAVE                  0x82B03u
#define action_PRINT_DBOX_SET_UP                0x82B04u
#define action_PRINT_DBOX_PRINT                 0x82B05u
#define printdbox_PRINT_SIDEWAYS                0x1u
#define printdbox_PRINT_DRAFT                   0x2u
#define error_PRINT_DBOX_TASKS_ACTIVE           0x80B300u
#define error_PRINT_DBOX_ALLOC_FAILED           0x80B301u
#define error_PRINT_DBOX_SHORT_BUFFER           0x80B302u
#define error_PRINT_DBOX_NO_SUCH_TASK           0x80B311u
#define error_PRINT_DBOX_NO_SUCH_METHOD         0x80B312u
#define error_PRINT_DBOX_NO_SUCH_MISC_OP_METHOD 0x80B313u
#define printdbox_PAGE_RANGE_ALL                (-1)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      printdbox_get_window_id()
 *
 * Description:   Calls reason code 0 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *
 * Output:        window - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x0.
 */

extern os_error *xprintdbox_get_window_id (bits flags,
      toolbox_o print_dbox,
      toolbox_o *window);
extern toolbox_o printdbox_get_window_id (bits flags,
      toolbox_o print_dbox);

/* ------------------------------------------------------------------------
 * Function:      printdbox_set_page_range()
 *
 * Description:   Calls reason code 1 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *                start - value of R3 on entry
 *                end - value of R4 on entry
 *
 * Other notes:   Before entry, R2 = 0x1.
 */

extern os_error *xprintdbox_set_page_range (bits flags,
      toolbox_o print_dbox,
      int start,
      int end);
extern void printdbox_set_page_range (bits flags,
      toolbox_o print_dbox,
      int start,
      int end);

/* ------------------------------------------------------------------------
 * Function:      printdbox_get_page_range()
 *
 * Description:   Calls reason code 2 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *
 * Output:        start - value of R0 on exit
 *                end - value of R1 on exit
 *
 * Other notes:   Before entry, R2 = 0x2.
 */

extern os_error *xprintdbox_get_page_range (bits flags,
      toolbox_o print_dbox,
      int *start,
      int *end);
extern void printdbox_get_page_range (bits flags,
      toolbox_o print_dbox,
      int *start,
      int *end);

/* ------------------------------------------------------------------------
 * Function:      printdbox_set_copies()
 *
 * Description:   Calls reason code 3 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *                copy_count - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x3.
 */

extern os_error *xprintdbox_set_copies (bits flags,
      toolbox_o print_dbox,
      int copy_count);
extern void printdbox_set_copies (bits flags,
      toolbox_o print_dbox,
      int copy_count);

/* ------------------------------------------------------------------------
 * Function:      printdbox_get_copies()
 *
 * Description:   Calls reason code 4 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *
 * Output:        copy_count - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x4.
 */

extern os_error *xprintdbox_get_copies (bits flags,
      toolbox_o print_dbox,
      int *copy_count);
extern int printdbox_get_copies (bits flags,
      toolbox_o print_dbox);

/* ------------------------------------------------------------------------
 * Function:      printdbox_set_scale()
 *
 * Description:   Calls reason code 5 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *                scale - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x5.
 */

extern os_error *xprintdbox_set_scale (bits flags,
      toolbox_o print_dbox,
      int scale);
extern void printdbox_set_scale (bits flags,
      toolbox_o print_dbox,
      int scale);

/* ------------------------------------------------------------------------
 * Function:      printdbox_get_scale()
 *
 * Description:   Calls reason code 6 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *
 * Output:        scale - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x6.
 */

extern os_error *xprintdbox_get_scale (bits flags,
      toolbox_o print_dbox,
      int *scale);
extern int printdbox_get_scale (bits flags,
      toolbox_o print_dbox);

/* ------------------------------------------------------------------------
 * Function:      printdbox_set_orientation()
 *
 * Description:   Calls reason code 7 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *                landscape - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0x7.
 */

extern os_error *xprintdbox_set_orientation (bits flags,
      toolbox_o print_dbox,
      osbool landscape);
extern void printdbox_set_orientation (bits flags,
      toolbox_o print_dbox,
      osbool landscape);

/* ------------------------------------------------------------------------
 * Function:      printdbox_get_orientation()
 *
 * Description:   Calls reason code 8 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *
 * Output:        landscape - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x8.
 */

extern os_error *xprintdbox_get_orientation (bits flags,
      toolbox_o print_dbox,
      osbool *landscape);
extern osbool printdbox_get_orientation (bits flags,
      toolbox_o print_dbox);

/* ------------------------------------------------------------------------
 * Function:      printdbox_get_title()
 *
 * Description:   Calls reason code 9 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        used - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0x9.
 */

extern os_error *xprintdbox_get_title (bits flags,
      toolbox_o print_dbox,
      char *buffer,
      int size,
      int *used);
extern int printdbox_get_title (bits flags,
      toolbox_o print_dbox,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      printdbox_set_draft()
 *
 * Description:   Calls reason code 10 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *                draft - value of R3 on entry
 *
 * Other notes:   Before entry, R2 = 0xA.
 */

extern os_error *xprintdbox_set_draft (bits flags,
      toolbox_o print_dbox,
      osbool draft);
extern void printdbox_set_draft (bits flags,
      toolbox_o print_dbox,
      osbool draft);

/* ------------------------------------------------------------------------
 * Function:      printdbox_get_draft()
 *
 * Description:   Calls reason code 11 of SWI 0x44EC6
 *
 * Input:         flags - value of R0 on entry
 *                print_dbox - value of R1 on entry
 *
 * Output:        draft - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Before entry, R2 = 0xB.
 */

extern os_error *xprintdbox_get_draft (bits flags,
      toolbox_o print_dbox,
      osbool *draft);
extern osbool printdbox_get_draft (bits flags,
      toolbox_o print_dbox);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
