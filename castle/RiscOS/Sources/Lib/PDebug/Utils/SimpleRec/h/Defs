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
#ifndef __BackTrace_Defs_h
#define __BackTrace_Defs_h

/* PCMask masks out status and mode bits to give a 26 bit program counter */
/* (We're assuming the 26-bit PC APCS variant. The alternative is the 32-bit variant)
 */
#define Mask26Bits ((1u<<26)-1)
#define PCMask (Mask26Bits & ~3)


/* The save code pointer points 3 words into the function */
#define SaveCodePointerOffset 2


/* We need to search back from the instruction that created a frame until we
 * find the name information word. NameInfoSearchWordLimit is the maximum number
 * of words that we should search through
 */
#define NameInfoSearchWordLimit 4


/* The following information is stored after the function name */

typedef struct
{
  unsigned int length:24; /* Number of bytes used to store function name (includes 0 padding) */
  unsigned int Desk_ff_code:8; /* Should be 0xff if there is a function name before this information */
}Desk_function_name_info;


#ifdef MemCheck_MEMCHECK
  #pragma -c0
  /*
    Turn off memory checking in stack-walking code - MemCheck doesn't like all the reads of the stack...
  */
#endif

#endif
