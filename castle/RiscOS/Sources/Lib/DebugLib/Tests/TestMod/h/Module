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
/* > module.h
 *
 *      Header file for module.
 */

#ifndef __module_h
#define __module_h

#define MODULE_NAME             "TestMod"

#define NOT_USED(v)             ((v)=(v))

#ifndef BOOL_DEFINED
#define BOOL_DEFINED
#ifndef BOOL
#define BOOL int
#define TRUE 1
#define FALSE 0
#endif
#endif

_kernel_oserror *module_finalise (int, int, void *);
_kernel_oserror *module_initialise (char *, int, void *);
_kernel_oserror *module_swi (int, _kernel_swi_regs *, void *);

#endif

/* end of module.h */
