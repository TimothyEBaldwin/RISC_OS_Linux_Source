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
/* Title:   glib.h
 * Purpose: glib module of GTest module
 * Author:  NK
 *
 */


#ifndef __glib_h
#define __glib_h

#include "kernel.h"

/* filter types */

typedef enum {GLib_ToolboxEvents = 0, GLib_WimpEvents = 1, GLib_WimpMessages =2} FilterTypes;

/* operations on extended gadgets */

#define GADGET_ADD      1
#define GADGET_REMOVE   2
#define GADGET_FADE     3
#define GADGET_METHOD   4
#define GADGET_MCLICK   6
#define GADGET_PLOT     9
#define GADGET_SETFOCUS 10
#define GADGET_MOVE     11
#define GADGET_POSTADD  12

/* handler types */

#define NO_HANDLER      0
#define DEFAULT_HANDLER 1
#define PRIVATE_HANDLER 2

typedef struct {
   int add:2,
   remove:2,
   postadd:2,
   method:2,
   reserved:2,
   mclick:2,
   reserved2:4,
   plot:2,
   setfocus:2,
   move:2,
   fade:2;
} FT;

typedef union {
   int mask;
   FT  bits;
} FeatureMask;

typedef struct {
  int type;
  int validflags;
  FeatureMask features;
} GadgetExtensionRecord;

/* support functions */

extern _kernel_oserror *register_gadget_types(unsigned int flags, GadgetExtensionRecord *rec,int SWIno);

extern _kernel_oserror *deregister_gadget_type(unsigned int flags, int type,int SWIno);

extern _kernel_oserror *register_gadget_type(unsigned int flags, int type,unsigned int valid, unsigned int mask,int SWIno);

void *mem_allocate(int amount);

void mem_free(void *tag);

void graphics_window(wimp_Bbox *area);

_kernel_oserror *add_task_interest(FilterTypes type, int *list, int SWI);

_kernel_oserror *remove_task_interest(FilterTypes type,int *list);

extern void work_to_screen(wimp_Bbox *box, wimp_GetWindowState *state);
extern void screen_to_work(wimp_Bbox *box, wimp_GetWindowState *state);

extern void plot_2d_scrollbar(const wimp_Bbox *, int, BOOL);

#endif
