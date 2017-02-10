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
/* Territory reason codes for use in C Library */

#define TERRITORY_UK                1
#define TERRITORY_TZ_API_EXT        0x454E4F5AuL

/* Packed locale integer which encodes the territory and timezone */
#define TERRITORY_EXTRACT(loc)      ((loc) & 0x3FF)
#define TERRITORY_TZ_EXTRACT(loc)   ((loc) >> 10)
#define TERRITORY_ENCODE(terr,tz)   ((terr) | ((tz) << 10))

#define TERRITORY_DECIMAL_POINT     0
#define TERRITORY_THOUSANDS_SEP     1
#define TERRITORY_GROUPING          2
#define TERRITORY_INT_CURR_SYMBOL   3
#define TERRITORY_CURRENCY_SYMBOL   4
#define TERRITORY_MON_DECIMAL_POINT 5
#define TERRITORY_MON_THOUSANDS_SEP 6
#define TERRITORY_MON_GROUPING      7
#define TERRITORY_POSITIVE_SIGN     8
#define TERRITORY_NEGATIVE_SIGN     9
#define TERRITORY_INT_FRAC_DIGITS   10
#define TERRITORY_FRAC_DIGITS       11
#define TERRITORY_P_CS_PRECEDES     12
#define TERRITORY_P_SEP_BY_SPACE    13
#define TERRITORY_N_CS_PRECEDES     14
#define TERRITORY_N_SEP_BY_SPACE    15
#define TERRITORY_P_SIGN_POSN       16
#define TERRITORY_N_SIGN_POSN       17

#define TERRITORY_PROPERTY_CONTROL     0
#define TERRITORY_PROPERTY_UPPERCASE   1
#define TERRITORY_PROPERTY_LOWERCASE   2
#define TERRITORY_PROPERTY_ALPHA       3
#define TERRITORY_PROPERTY_PUNCTUATION 4
#define TERRITORY_PROPERTY_SPACE       5
#define TERRITORY_PROPERTY_DIGIT       6
#define TERRITORY_PROPERTY_XDIGIT      7
