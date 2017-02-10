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
/*
 * h.codegen
 */
 
 
#ifndef __codegen_h
#define __codegen_h

#ifndef __newclass_h
#include "newclass.h"
#endif


/******************************************
 * Functions                              *
 ******************************************/
 
/*
 * Name   : codegen_generate_source
 * Desc   : generates source for a class
 * Parms  : NewClassBlock *nclass - pointer to class
 * Returns: True or False on result
 */
 
extern BOOL codegen_generate_source ( NewClassBlock *nclass );


 
 
/*
 * Name   : codegen_generate_prototypes
 * Desc   : generates prototypes for a class
 * Parms  : NewClassBlock  *nclass
 * Returns: True or False on result
 */

extern BOOL codegen_generate_prototypes ( NewClassBlock *nclass );


/*
 * Name    : codegen_set_veneer_type
 * Desc    : sets the type of veneers that codegen generates
 * Parms   : BOOL asm
 * Returns : none
 */
 
extern void codegen_set_veneer_type ( BOOL asm );
 
 
 
#endif
