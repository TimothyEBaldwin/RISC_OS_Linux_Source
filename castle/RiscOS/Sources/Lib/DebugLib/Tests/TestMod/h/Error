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
/* error.h
 *
 *      General purpose error header.
 */

#ifndef __error_h
#define __error_h

#define ERROR_BADSWI	0x00000112
#define ERROR_BADTYPES	0x000000AF
#define ERROR_BADPARAMS	0x000001ED
#define ERROR_LOCKED	0x000000C3
#define ERROR_BADHARD	0x00000603

/* Declare the given error in a memory efficient way.
 */
#define ERROR_STRUCT(name,text) \
        struct {int errnum; char errmess[sizeof(text)+1];} name = {ERROR_##name,text}

/* Declare the given error as external.
 */
#define ERROR_EXTERN(name) \
        extern struct {int errnum; char errmess[1];} name

#define ERROR(e)  ((_kernel_oserror *)&(e))

#endif

/* end of error.h */
