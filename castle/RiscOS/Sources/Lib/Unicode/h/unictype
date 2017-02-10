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
/* > unictype.h */

/**************************************************************************/
/*                                                                        */
/* Copyright [1997-2003] All rights reserved.                             */
/*                                                                        */
/* This file may be included in profit making or non profit making        */
/* software on any system running any version of RISC OS, provided it was */
/* used along with a licensed binary of Unicode Lib                       */
/* It is supplied "as is" without warranty, express or implied, of        */
/* merchantability for any purpose.                                       */
/* No liability can be claimed for any direct or indirect loss            */
/**************************************************************************/

/*
 * Unicode character type definitions and prototypes
 */

#ifndef unicode_unictype_h
#define unicode_unictype_h

#include "iso10646.h"

#define unictype_UNKNOWN		0
#define unictype_SEPARATOR_SPACE	1
#define unictype_SEPARATOR_PARA		2
#define unictype_PUNCTUATION_OPEN	3
#define unictype_PUNCTUATION_CLOSE	4
#define unictype_PUNCTUATION_DASH	5
#define unictype_LETTER			6
#define unictype_NUMBER			7
#define unictype_SYMBOL			8
#define unictype_OTHER			9
#define unictype_MARK			10

/* Return whether the given character is ideographic */

extern int unictype_is_ideograph(UCS2 u);

/* Pass in a UC2 character and return a character type as given above */

extern int unictype_lookup(UCS2 c);

/* This function must be called before using unictype_lookup() to
 * initialise the pointers */

extern void unictype_init(void);

#endif

/* eof unictype.h */

