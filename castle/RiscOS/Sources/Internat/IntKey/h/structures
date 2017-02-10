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
#include "Unicode/iso10646.h"

#include <stdbool.h>

#define MAXKEYS 0x400
#define MAXLAYERS 2

typedef int LLK;

typedef struct KeyInfo
{
    UCS4 character[MAXLAYERS][8];
    unsigned caps[MAXLAYERS];
    bool defined;
    LLK tablenum; /* Note - not a key number, but has same range as LLK */
    bool definedinlayer[MAXLAYERS];
    LLK fn;
    bool easych[MAXLAYERS][8];
    char easylayer[MAXLAYERS];
    bool easy;
}
KeyInfo;

typedef struct Keyboard
{
    char type[64];
    int country;
    char id[64]; /* Code identifier, combination of type & country */
    int layers;
    int numkeys;
    int maxkeys;
    bool fnused;
    KeyInfo key[MAXKEYS];
    unsigned char keypad[2][17];
    bool custompad;
    bool needcodetable;
    bool needshiftinglist;
    bool leftaltlayerswitch;
    int flags; /* KVFlags value */
}
Keyboard;
