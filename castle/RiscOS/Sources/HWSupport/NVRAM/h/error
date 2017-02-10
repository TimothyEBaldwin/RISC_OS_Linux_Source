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

/* We use top bit of error number to flag whether error needs   */
/* to be looked up before being returned to the OS.             */
#define ERROR_LOOKUP_BIT        (1U<<30)

#define ERROR_BASE              0x00819200

/* Our errors. */
#define ERROR_NOMEM             (ERROR_BASE+0)
#define ERROR_NOTAG             (ERROR_BASE+1)
#define ERROR_LOCKED            (ERROR_BASE+2)
#define ERROR_READBUF           (ERROR_BASE+4)
#define ERROR_NOTBYTE           (ERROR_BASE+5)
#define ERROR_NEEDBUF           (ERROR_BASE+6)

/* Declare the given error in a memory efficient way. */
#define ERROR_STRUCT(prefix,name,text) \
        prefix struct {int errnum; char errmess[sizeof(text)];} name = {ERROR_LOOKUP_BIT | ERROR_##name,text}
#define ERROR_EXTERN(name) \
        extern struct {int errnum; char errmess[1];} name;

#define ERROR(e)  ((_kernel_oserror *)&(e))
