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
/* Title:   tberror.h
 * Purpose: generating errors for the Toolbox
 * Author:  IDJ
 * History: 27-Sep-93: IDJ: created
 *
 */

#ifndef __tberror_h
#define __tberror_h

#include "kernel.h"

#define GLOBERR   0
#define TBERR     !0

/* global error file messages */

#define E_NoMem   "\x00\x00\x00\x70" "NoMem"
#define E_BadSWI  "\x01\x00\x00\x70" "BadSWI"


/* Toolbox error messages */

#define E_InvalidObjectID  "\x02\x00\x00\x70" "InvalidObjectID"
#define E_NotaToolboxTask  "\x03\x00\x00\x70" "NotaToolboxTask"
#define E_NoDirName        "\x04\x00\x00\x70" "NoDirName"
#define E_NoMsgsFD         "\x05\x00\x00\x70" "NoMsgsFD"
#define E_NoIDBlock        "\x06\x00\x00\x70" "NoIDBlock"
#define E_BadResFile       "\x07\x00\x00\x70" "BadResFile"


_kernel_oserror *tberror_make (char *num_and_tag, int where, int num_args, ...);

    /*
     * Function to make up an error message.  We get MessageTrans to use
     * its own buffer to hold the resulting error message.  Errnum and
     * tag are held in the module's code area.  If "where" is 0, then we
     * use the global error file, otherwise our own file registered with
     * MessageTrans.  Up to four word size params can also be passed as
     * varargs arguments to pass to MessageTrans in regs R4-R7.
     */

#endif
