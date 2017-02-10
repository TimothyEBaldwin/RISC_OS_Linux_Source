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
 * h.addmethod
 */
 
#ifndef __addmethod_h
#define __addmethod_h


/*****************************************************
 * Typedefs                                          *
 *****************************************************/
 
typedef struct
{
  char var_type[30];
  char var_name[30];
  BOOL ptr;
} AddMethodRegister;

#define RegisterSet_r0 (1u<<0)
#define RegisterSet_r1 (1u<<1)
#define RegisterSet_r2 (1u<<2)
#define RegisterSet_r3 (1u<<3)
#define RegisterSet_r4 (1u<<4)
#define RegisterSet_r5 (1u<<5)
#define RegisterSet_r6 (1u<<6)
#define RegisterSet_r7 (1u<<7)
#define RegisterSet_r8 (1u<<8)
#define RegisterSet_r9 (1u<<9)


typedef struct
{
  unsigned int regs_set; /*-- flags word as above --*/

  AddMethodRegister r0;
  AddMethodRegister r1;
  AddMethodRegister r2;
  AddMethodRegister r3;
  AddMethodRegister r4;
  AddMethodRegister r5;
  AddMethodRegister r6;
  AddMethodRegister r7;
  AddMethodRegister r8;
  AddMethodRegister r9;  
} AddMethodRegisterSet;
    


typedef struct
{
  char method_name[30];
  char source_file[30];  
  char description[80];
  
  /*-- register blocks --*/
  
  AddMethodRegisterSet input;
  AddMethodRegisterSet output;
  
} AddMethodBlock;


/*-- update function --*/

typedef void (*AddMethodFunc)(BOOL new, AddMethodBlock *method, void *handle);



/*****************************************************
 * Functions                                         *
 *****************************************************/

/*
 * Name    : addmethod_close
 * Desc    : closes the addmethod window and free's any workspace
 * Parms   : none
 * Returns : none
 */
 
extern void addmethod_close ( void );


/*
 * Name    : addmethod_show
 * Desc    : shows a window for editing a method
 * Parms   : AddMethodBlock *edit - pointer to method to edit
 *           AddMethodFunc func   - update function
 *           void         *handle - user defined handle
 * Returns : True or False on result
 */
 
extern BOOL addmethod_show ( AddMethodBlock *edit, AddMethodFunc func, void *handle );



/*
 * Name    : addmethod_show_new
 * Desc    : shows the window for adding a new method
 * Parms   : AddMethodFunc func   - update function
 *           void         *handle - user defined handle
 * Returns : True or False on result
 */
 
extern BOOL addmethod_show_new ( AddMethodFunc func, void *handle );


/*
 * Name    : addmethod_init
 * Desc    : inits the 'addmethod' module
 * Parms   : none
 * Returns : none
 */ 

extern void addmethod_init ( void );


#endif
