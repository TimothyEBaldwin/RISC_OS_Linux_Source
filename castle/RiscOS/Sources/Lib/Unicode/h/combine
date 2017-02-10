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
/* > Unicode/combine.h */

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

 * Function to combine characters

 */

#ifndef unicode_combine_h
#define unicode_combine_h

#ifndef unicode_iso10646_h
#include "iso10646.h"
#endif

#define combine_NOT_COMBINING	0 /* combiner is not a combining character,
				     combiner in *replacement */
#define combine_NO_MATCH	1 /* combiner is combining but not with previous,
				     combiner + space in *replacement */
#define combine_COMBINED	2 /* combination possible,
				     new character in *replacement */

extern int combine_characters(UCS4 previous, UCS4 combiner, UCS4 *replacement);

#endif /* unicode_combine_h */

/* eof combine.h */
