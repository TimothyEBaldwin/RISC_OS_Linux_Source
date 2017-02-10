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
#ifndef __modmem_h
#define __modmem_h

typedef void	**modmem_anchor;

#ifndef __toolbox_h
typedef struct
{
    int			data [4];
} MessagesFD;
#endif

_kernel_oserror *modmem_init(const char *name, MessagesFD *mfd);
_kernel_oserror *modmem_die(void);
_kernel_oserror *modmem_alloc(modmem_anchor anchor, int size);
_kernel_oserror *modmem_free(modmem_anchor anchor);
int modmem_get_size(modmem_anchor anchor);
_kernel_oserror *modmem_set_size(modmem_anchor anchor, int size);
_kernel_oserror *modmem_midextend(modmem_anchor anchor, int at, int by);

#endif
