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
#include <stdio.h>
#include "kernel.h"
#include "swis.h"

int  blk[64];
int  idblk[6];
int  fd[4];
char buffer[256];

int main()
{
    _kernel_swi_regs r;
    _kernel_oserror *e;

    r.r[0] = 0;
    r.r[1] = 310;
    r.r[2] = r.r[3] = 0;
    r.r[4] = (int)"<test$dir>";
    r.r[5] = (int)fd;
    r.r[6] = (int)idblk;
    if ((e = _kernel_swi(0x44ec0+15, &r, &r)) != NULL)
        printf ("%s\n", e->errmess);

    /* ask about this task */
    r.r[0] = 0;
    r.r[1] = (int)buffer;
    r.r[2] = 256;
    if ((e = _kernel_swi(0x44ec0+14, &r, &r)) != NULL)
        printf ("%s\n", e->errmess);
    else
        printf ("Task %s\n", buffer);
    
    r.r[0] = 1;
    r.r[1] = (int)fd;
    if ((e = _kernel_swi(0x44ec0+14, &r, &r)) != NULL)
        printf ("%s\n", e->errmess);
    else
        printf ("Fd %d %d %d %d\n", fd[0], fd[1], fd[2], fd[3]);

    r.r[0] = 2;
    r.r[1] = (int)buffer;
    r.r[2] = 256;
    if ((e = _kernel_swi(0x44ec0+14, &r, &r)) != NULL)
        printf ("%s\n", e->errmess);

    r.r[0] = 3;
    r.r[1] = (int)buffer;
    r.r[2] = 256;
    if ((e = _kernel_swi(0x44ec0+14, &r, &r)) != NULL)
        printf ("%s\n", e->errmess);

    r.r[0] = 4;
    r.r[1] = (int)buffer;
    r.r[2] = 256;
    if ((e = _kernel_swi(0x44ec0+14, &r, &r)) != NULL)
        printf ("%s\n", e->errmess);

    while (1)
    {
        r.r[0] = 0;
        r.r[1] = (int)&blk;
        _kernel_swi (Wimp_Poll, &r, &r);

        if ((r.r[0] == 17 || r.r[0] == 18) && blk[4] == 0)
            exit(0);
    }
}
