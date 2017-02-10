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
/*-*-C-*-
 * Interface to the font registry
 */

#include "module.h"
#include "registry.h"
#include "swicall.h"

Bool getnext(int *handle,       /* updated with next handle, or 0 */
             char **local,      /* points to RMA storage */
             char **foreign,    /* which we do not own */
             int flags)         /* Only return entries that match this */
{
    int left, buf[3];
    do
    {
        swi (PDriver_MiscOp,  R0, MiscOp_EnumerateFonts, 
             R1, buf,  R2, sizeof(buf),  R3, *handle,  R4, 0,
             OUT,  R2, &left,  R3, handle,  END);
        if (left == 0 && buf[2] == flags)
        {
            *local = (char *) buf[0];
            *foreign = (char *) buf[1];
            return TRUE;
        }
    } while (*handle);
    return FALSE;
}

char *addrecord(char *local, char *foreign, int flags, Bool overwrite)
{
    char *lp, *fp;
    int handle = 0;
    if (swi(PDriver_MiscOp,  R0, MiscOp_AddFont,  R1, local,  R2, foreign,
            R3, flags,  R4, overwrite ? MiscOp_AddFont_Overwrite : 0,  END))
        return NULL;
    do
        if (getnext(&handle, &lp, &fp, flags))
            if (compare(lp, local) == 0)
                return fp;
    while (handle);
    return NULL;
}

#if DEBUG
seethem (int flags)
{
        char *lp, *fp;
        int han = 0;
        do
                if (getnext(&han, &lp, &fp, flags))
                {
                        dstringc("CheckEntry: *");
                        dstringc(lp); dstringc("* -> *");
                        dstringc(fp); dstring("*");
                }
        while (han);
}
#endif
