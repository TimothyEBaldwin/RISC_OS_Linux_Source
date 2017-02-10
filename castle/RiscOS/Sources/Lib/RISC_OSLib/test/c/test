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
#include <kernel.h>

#define double float

extern void init_unwind(_kernel_unwindblock *);
extern double get_extfp(const _extended_fp_number *);

void dump_uwb(_kernel_unwindblock *uwb)
{
    printf("v1=%08X, v2=%08X, v3=%08X, v4=%08X, v5=%08X, v6=%08X\n",
            uwb->r4, uwb->r5, uwb->r6, uwb->r7, uwb->r8, uwb->r9);
    printf("sl=%08X, fp=%08X, sp=%08X, pc=%08X\n",
            uwb->sl, uwb->fp, uwb->sp, uwb->pc);
    printf("f4=%f, f5=%f, f6=%f, f7=%f\n\n",
            get_extfp(&uwb->f4),
            get_extfp(&uwb->f5),
            get_extfp(&uwb->f6),
            get_extfp(&uwb->f7));
}

void harry(double b)
{
    static double x;
    static int dumped, t;

    _kernel_unwindblock uwb = { 0 };
    char *lang;
    x = b;
    if (dumped) return;
    init_unwind(&uwb);
    while ((t=_kernel_unwind(&uwb, &lang)) > 0)
    {
        printf("_kernel_unwind() returned %d (%s)\n", t, lang);
        dump_uwb(&uwb);
        continue;
    }
    printf("_kernel_unwind() returned %d\n", t);
    dumped = 1;
}

void jim(double a)
{
    harry(a*2);
    harry(a);
}

void fred(double a, double b, double c, int d, double e)
{
    jim(a*b*c*d*e);
    jim(a+b+c+d+e);
}

int main()
{
    fred(1,2,3,4,5);
    return 0;
}
