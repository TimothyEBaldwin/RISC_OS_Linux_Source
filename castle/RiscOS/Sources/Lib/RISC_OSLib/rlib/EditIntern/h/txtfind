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
/* -> h.txtfind
 * Title: txtfind.h
 * Purpose: Search text for string.
 * Author: AFP
 * Status: system-independent
 * Requires:
 *   h.txt
 * History:
 *   16 July 87 -- started
 *   14 December 87: AFP: converted into C.
 *   9  March 88: mega changes by igj
 *   24 Jan-90 -- new version of txtfind_find made
 */

#ifndef re__h
#include "EditIntern/txtregexp.h"
#endif

#define  txtfind_any_ch      '.'
#define  txtfind_newline_ch  '$'
#define  txtfind_alphanum_ch '@'
#define  txtfind_digit_ch    '#'
#define  txtfind_ctrl_ch     '|'
#define  txtfind_normal_ch   '\\'
#define  txtfind_setbra_ch   '['
#define  txtfind_setket_ch   ']'
#define  txtfind_not_ch      '~'
#define  txtfind_0ormore_ch  '*'
#define  txtfind_1ormore_ch  '^'
#define  txtfind_most_ch     '%'
#define  txtfind_to_ch       '-'
#define  txtfind_found_ch    '&'
#define  txtfind_field_ch    '?'
#define  txtfind_hex_ch      (0x84)

#ifdef ALLOW_OLD_PATTERNS
#define  txtfind_old_magic_ch       '\\'
#define  txtfind_old_anystring_ch   '*'
#define  txtfind_old_alphanum_ch    'a'
#define  txtfind_old_digit_ch       'd'
#define  txtfind_old_any_ch         '.'
#define  txtfind_old_newline_ch     'n'
#define  txtfind_old_ctrl_ch        'c'
#define  txtfind_old_hex_ch         'x'
#define  txtfind_old_upper_hex_ch   'X'
#define  txtfind_old_foundstring_ch '&'
#endif


extern void txtfind_build_TD1(int TD1[], Pattern *pattern, BOOL nocase);

txt_index txtfind_find(txt t, txt_index *at, Pattern *p, BOOL nocase
#ifdef FIELDNUM
, Ambiguous_entry *ambiguous
, SubPattern *sub_patterns
, BOOL rescanning
#endif
, int TD1[]
);
/*
 * Search in txt from at for a match to string s.
 * If found return the start of a matching sub-string, and move at to 
 * end of match
 */

void txtfind_replace(txt t, txt_index start, txt_index *end, char *rtemplate, BOOL magic
#ifdef FIELDNUM
, Ambiguous_entry ambiguous[]
#endif
#ifdef ALLOW_OLD_PATTERNS
, BOOL old_patterns
#endif
);

/*
 *  Called when we have found a match for ftemplate in txt t at position at
 *  We construct the appropriate string and replace the one we found.
 *  Updates the end position to reflect the end of the replacement string.
 */

Pattern *txtfind_build_pattern(char *pattern, BOOL magic, BOOL nocase
#ifdef ALLOW_OLD_PATTERNS
, BOOL old_patterns
#endif
#ifdef FIELDNUM
, SubPattern *sub_patterns
#endif
);

/*
 * Builds an NFA pattern from a text string 
 *
 */


