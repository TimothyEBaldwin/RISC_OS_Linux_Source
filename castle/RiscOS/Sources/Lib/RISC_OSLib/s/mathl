; This source code in this file is licensed to You by Castle Technology
; Limited ("Castle") and its licensors on contractual terms and conditions
; ("Licence") which entitle you freely to modify and/or to distribute this
; source code subject to Your compliance with the terms of the Licence.
; 
; This source code has been made available to You without any warranties
; whatsoever. Consequently, Your use, modification and distribution of this
; source code is entirely at Your own risk and neither Castle, its licensors
; nor any other person who has contributed to this source code shall be
; liable to You for any loss or damage which You may suffer as a result of
; Your use, modification or distribution of this source code.
; 
; Full details of Your rights and obligations are set out in the Licence.
; You should have received a copy of the Licence with this source code file.
; If You have not received a copy, the text of the Licence is available
; online at www.castle-technology.co.uk/riscosbaselicence.htm
; 
; As long double is the same as double, all the long double <math.h> and
; <complex.h> functions can just bounce to the double ones. These bounces are
; included in ANSILib and the stubs as is - the Shared C Library doesn't
; contain or export them.

        AREA    |C$$code|, CODE, READONLY

        MACRO
        DoL     $func
        EXPORT  $func.l
        IMPORT  $func
$func.l B       $func
        MEND

        DoL     acos
        DoL     asin
        DoL     atan
        DoL     atan2
        DoL     cos
        DoL     sin
        DoL     tan

        DoL     acosh
        DoL     asinh
        DoL     atanh
        DoL     cosh
        DoL     sinh
        DoL     tanh

        DoL     exp
        DoL     exp2
        DoL     expm1
        DoL     frexp
        DoL     ilogb
        DoL     ldexp
        DoL     log
        DoL     log10
        DoL     log1p
        DoL     log2
        DoL     logb
        DoL     modf
        DoL     scalbn
        DoL     scalbln

        DoL     cbrt
        DoL     fabs
        DoL     hypot
        DoL     pow
        DoL     sqrt

        DoL     erf
        DoL     erfc
        DoL     lgamma
        DoL     tgamma

        DoL     ceil
        DoL     floor
        DoL     nearbyint
        DoL     rint
        DoL     lrint
        DoL     llrint
        DoL     round
        DoL     lround
        DoL     llround
        DoL     trunc

        DoL     fmod
        DoL     remainder
        DoL     remquo

        DoL     copysign
        DoL     nan
        DoL     nextafter
        DoL     nexttoward

        DoL     fdim
        DoL     fmax
        DoL     fmin

        DoL     fma

        DoL     cacos
        DoL     casin
        DoL     catan
        DoL     ccos
        DoL     csin
        DoL     ctan

        DoL     cacosh
        DoL     casinh
        DoL     catanh
        DoL     ccosh
        DoL     csinh
        DoL     ctanh

        DoL     cexp
        DoL     clog

        DoL     cabs
        DoL     cpow
        DoL     csqrt

        DoL     carg
        DoL     cimag
        DoL     conj
        DoL     cproj
        DoL     creal

        EXPORT  strtold
        IMPORT  strtod
strtold B       strtod

        END
