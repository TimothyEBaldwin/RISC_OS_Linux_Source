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
#include <swis.h>
#include <unixlib.h>

unsigned int sleep(unsigned int n)
{
    unsigned int t1, t, dt;

    _swix(OS_ReadMonotonicTime, _OUT(0), &t1);
    t = t1;
    dt = t1 + n * 100;

    do
    {
        int escape;
        int wait = dt - t;

        if (wait >= 0x8000) wait = 0x7FFF;
        _swix(OS_Byte, _INR(0,2)|_OUT(2), 129, wait & 0xFF, wait >> 8, &escape);
        _swix(OS_ReadMonotonicTime, _OUT(0), &t);
        if (escape == 0x1B)
            break;
    } while (t - t1 < n * 100);

    return (signed)(dt - t) <= 0 ? 0 : (dt - t) / 100;
}
