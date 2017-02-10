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
/* xmath.c - extensions to maths library. */
/* Copyright (C) Codemist Ltd, 1988 */

#include "xmath.h"
#include <math.h>

double hypot(double x, double y)
{
    double scale;
    int n1, n2;
    if (x==0.0) return fabs(y);
    else if (y==0.0) return fabs(x);
    (void) frexp(x, &n1);
    (void) frexp(y, &n2);
    if (n2>n1) n1 = n2;
/* n1 is now the exponent of the larger (in absolute value) of x, y      */
    scale = ldexp(1.0, n1);     /* can not be 0.0                        */
    x /= scale;
    y /= scale;
/* The above scaling operation introduces no rounding error (since the   */
/* scale factor is exactly a power of 2). It reduces the larger of x, y  */
/* to be somewhere near 1.0 so overflow in x*x+y*y is impossible. It is  */
/* still possible that one of x*x and y*y will underflow (but not both)  */
/* but this is harmless.                                                 */
    return scale * sqrt(x*x + y*y);
}

/* end of xmath.c */
