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
#include <setjmp.h>
#include <signal.h>
#include <stdio.h>

jmp_buf top;

int depth;

int foo(void)
{
    char fred[8000];
    int i, j=0;

    printf(".");
    if (depth++ == 1000)
        return 0;

    for (i=0; i < 8000; i++)
        j+=fred[i];

    return j + foo();
}

void stkovf(int s)
{
    longjmp(top, 1);
}

int main()
{
    signal(SIGSTAK, stkovf);

    if (setjmp(top))
    {
        printf("Overflow");
    }

    return foo();
}
