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
/* File:     objsupport.h
 * Purpose:  Standard Dialogue support library.
 * Author:   Neil Kelleher
 * History:  5-Jul-1994 : NK: created
 */

#include "stddef.h"
#include "objects/toolbox.h"
#include "objects/window.h"

/* copies named template to a buffer, returns NULL if can't find or no memory */

char *copy_template(char *name);

/* creates object from buffer then frees it */

_kernel_oserror *create_from_template(char *template_id, ObjectID *handle);

/* zaps gadget attributes, NOTE: use macro form below */

_kernel_oserror *__zap_gadget(char *tm,ComponentID id,int off,int val);
_kernel_oserror *__zap_gadget_string(char *tm,ComponentID id,int off,const char* val,int offlen);
int *__read_gadget(char *tm,ComponentID id,int off);

/* zaps window template, NOTE: use macro form below */

_kernel_oserror *__zap_window(char *tm,int off,int val);
int *__read_window(char *tm,int off);

/* deletes a gadget from a template */

_kernel_oserror *delete_gadget(char *tm,ComponentID id);

/* zap_gadget(char *template,typedef GadgetType, ComponentID component, structure member, value */

#define zap_gadget(a,b,c,d,e) __zap_gadget(a,c,sizeof(GadgetHeader) + offsetof(b,d),(int) (e))

/* zap_gadget_string(char *template,typedef GadgetType, ComponentID component, structure member, value, structure member (length)
 * This is used to up the max buffer length if the string was too long to fit in the buffer.
 * This avoids problems of too small buffer lengths in Res files causing problems.
 */

#define zap_gadget_string(a,b,c,d,e,f) __zap_gadget_string(a,c,sizeof(GadgetHeader) + offsetof(b,d),(e), sizeof(GadgetHeader)+offsetof(b,f))


#define zap_gadget_header(a,c,d,e) __zap_gadget(a,c, offsetof(GadgetHeader,d),(int) (e))

/* zap_window(char *template,WindowTemplate structure member,value) */

#define zap_window(a,d,e) __zap_window(a,offsetof(WindowTemplate,d),(int) (e))

#define read_gadget(a,b,c,d) __read_gadget(a,c,sizeof(GadgetHeader) + offsetof(b,d))

#define read_gadget_header(a,c,d) __read_gadget(a,c, offsetof(GadgetHeader,d))

#define read_window(a,d) __read_window(a,offsetof(WindowTemplate,d))
