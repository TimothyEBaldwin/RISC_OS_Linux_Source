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
#include <stdlib.h>

#include "kernel.h"
#include "swis.h"

int main(void)
{
    _kernel_swi_regs r;
    char *block;
    int i, t;

    block = malloc(1024 * 1024);
    if (!block) {
        printf("Failed to allocate 1M memory block\n");
        exit(1);
    }
    _kernel_swi(OS_ReadMonotonicTime, &r, &r);
    t = r.r[0];
    for (i = 0; i < 10; i++) {
        r.r[0] = 10;
        r.r[1] = (int)"Ram:Scrap";
        r.r[2] = 0xffd;
        r.r[4] = (int)block;
        r.r[5] = (int)block + 1024 * 1024 - 1;
        _kernel_swi(OS_File | _kernel_NONX, &r, &r);
    }
    _kernel_swi(OS_ReadMonotonicTime, &r, &r);
    t = r.r[0] - t;
    printf("Save 1M * 10: %d csec\n", t);
    _kernel_swi(OS_ReadMonotonicTime, &r, &r);
    t = r.r[0];
    for (i = 0; i < 10; i++) {
        r.r[0] = 16;
        r.r[1] = (int)"Ram:Scrap";
        r.r[2] = (int)block;
        r.r[3] = 0;
        _kernel_swi(OS_File | _kernel_NONX, &r, &r);
    }
    _kernel_swi(OS_ReadMonotonicTime, &r, &r);
    t = r.r[0] - t;
    printf("Load 1M * 10: %d csec\n", t);
    exit(0);
}
