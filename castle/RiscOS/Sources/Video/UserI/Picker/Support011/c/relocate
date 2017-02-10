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
/*relocate.c - change module context to allow inter-module procedure calls*/

#include "relocate.h"
#include "trace.h"

typedef
   struct Workspace
      {
         #ifndef SMALL_STUBS
         int filler;
         #endif
         relocate_frame frame;
      }
   Workspace;

/*------------------------------------------------------------------------*/
void relocate_begin (void *workspace, relocate_frame *frame)

{  tracef ("relocate_begin\n");

   relocate_frame *relocate_limit = (relocate_frame *) ((((unsigned int) &relocate_limit) >> 20) << 20);

   /*Save the current offsets on the stack.*/
   *frame = *relocate_limit;

   /*Update the offsets used by the shared C library.*/
   *relocate_limit = (*(Workspace **) workspace)->frame;
}
/*------------------------------------------------------------------------*/
void relocate_end (relocate_frame *frame)

{
   relocate_frame *relocate_limit = (relocate_frame *) ((((unsigned int) &relocate_limit) >> 20) << 20);
   
   /*Set the library offsets to the saved values.*/
   *relocate_limit = *frame;

   tracef ("relocate_end\n");
}
