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
/* Title:   auxiliary.h
 * Purpose: support functions for the FontDbox object class
 * Author:  TGR
 * History: 24-Feb-94: TGR: created
 *
 *
 */

#ifndef __auxiliary_h
#define __auxiliary_h

#include "kernel.h"

#ifndef __toolbox_h
#include "objects.toolbox.h"
#endif

#ifndef __fontdbox_h
#include "objects.fontdbox.h"
#endif

#ifndef __wimp_h
#include "twimp.h"
#endif

#ifndef __mem_h
#include "mem.h"
#endif

#include "object.h"
#include "task.h"

#define mem_freek(A) mem_free(A,"FontDbox")
#define mem_alloc(A) mem_allocate(A,"FontDbox")

#define ptr_subtract(A,B) ((int) A - (int) B)

typedef struct {
   int   number;
   char *string;
} IntString;

typedef struct {
   int        num_entries;
   IntString  array[1]; /* Why on earth C prevents arrays of zero being declared is beyond me */
} IntStringArray;

#define sizeof_IntStringArray(A) (sizeof(IntString)*A+sizeof(int))

/*
extern ObjectID          global_menu;
*/
extern FontDboxInternal *global_next;
extern char             *global_plain;
extern char             *global_system;
extern IntStringArray   *global_font_list;
extern char             *global_stringset1;
/*
extern int               global_font_change_count;
*/
extern int               global_standard_size[];
/*
extern EventInterest   messages_of_interest[];
*/
extern EventInterest   events_of_interest[];

extern EventInterest   toolbox_events_of_interest[];

/* function prototypes */

/*
extern _kernel_oserror  *dialogue_completed (ObjectID object_id);
*/
_kernel_oserror         *cache_fonts (void);
int                      find_text (IntStringArray *is_array, char *text);
int                      sizeof_current_text (char *text, char delimiter);
char                    *get_current_text (char *src, char delimiter);
char                    *eql_current_text (char *current, char *search);
char                    *diff_current_text (char *current, char *search);
char                    *cpy_current_text (char *dst, char *src);
char                    *first_to_stringset_list (IntStringArray *is_array);
char                    *second_to_stringset_list (IntStringArray *is_array, char *first);
char                    *third_to_stringset_list (IntStringArray *is_array,char *first,char *second);
_kernel_oserror         *show_actual (void);
_kernel_oserror         *update_fonts (FontDboxInternal *internal, char *buffer);
extern FontDboxInternal *find_internal (TaskDescriptor *t, ObjectID sub_object_id);

#endif
