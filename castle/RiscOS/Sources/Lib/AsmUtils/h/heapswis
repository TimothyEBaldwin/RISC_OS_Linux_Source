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
/*
 *  AsmUtils (heapswis.h)
 *
 * Copyright (C) Pace Micro Technology plc. 1999
 *
 */
#ifndef asmutils_heapswis_h_inluded
#define asmutils_heapswis_h_inluded

#ifdef __cplusplus
extern "C" {
#endif

/* Fast veneers to OS_Heap used by various components in the build.
 * These functions correspond to the R0 sub-reason codes of OS_Heap,
 * respectively: 0 (initialise), 2 (allocate), 3 (free), 4 (resize block),
 * 5 (resize heap), 6 (read size of block).
 *
 * See PRM volume 1 for details.
 */

extern _kernel_oserror *xosheap_initialise(void *heap, size_t size);
extern _kernel_oserror *xosheap_alloc(void *heap, size_t size, void **p);
extern _kernel_oserror *xosheap_free(void *heap, void *p);
extern _kernel_oserror *xosheap_realloc(void *heap, void *p, int by, void **newp);
extern _kernel_oserror *xosheap_resize(void *heap, int by);
extern _kernel_oserror *xosheap_read_size(void *heap, void *p, size_t *size);

#ifdef __cplusplus
}
#endif

#endif
