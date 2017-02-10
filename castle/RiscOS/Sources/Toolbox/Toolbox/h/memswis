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
/* Title:   memswis.h
 * Purpose: veneers onto the OS_Heap swis for speed
 * Author:  KJB
 * History: 23-Nov-96: KJB: created
 *
 */

extern _kernel_oserror *xosheap_initialise(void *heap, size_t size);
extern _kernel_oserror *xosheap_alloc(void *heap, size_t size, void **p);
extern _kernel_oserror *xosheap_free(void *heap, void *p);
extern _kernel_oserror *xosheap_realloc(void *heap, void *p, int by, void **newp);
extern _kernel_oserror *xosheap_resize(void *heap, int by);
extern _kernel_oserror *xosheap_read_size(void *heap, void *p, size_t *size);
extern _kernel_oserror *xosmodule_realloc(void *p, int by, void **newp);
