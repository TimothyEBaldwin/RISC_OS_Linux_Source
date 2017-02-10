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
 * h.newclass
 */
 
 
#ifndef __newclass_h
#define __newclass_h

#ifndef __addmethod_h
#include "addmethod.h"
#endif

/*****************************************************
 * Typedefs                                          *
 *****************************************************/
 
typedef struct NewClassMethods
{
  AddMethodBlock *method;
  
  /*-- linked list pointers --*/
  
  struct NewClassMethods *next;
  struct NewClassMethods *prev;
  
} NewClassMethods;


 
typedef struct
{
  char class_title[30];
  char needs[50];
  char source_path[50];
  int no_methods;
  char object_name[20];
  
  /*-- list of associated methods --*/
  
  NewClassMethods *methods;
  
} NewClassBlock;
 


/*****************************************************
 * Functions                                         *
 *****************************************************/
 
/*
 * Name    : newclass_delete_method
 * Desc    : deletes a method from the list for the class
 * Parms   : NewClassBlock   *nclass - pointer to class
 *           AddMethodBlock  *method - pointer to method to delete
 * Returns : none
 */
 
extern void newclass_delete_method ( NewClassBlock *nclass, AddMethodBlock *method );



/*
 * Name    : newclass_copy_method
 * Desc    : copies one method to another
 * Parms   : NewClassBlock   *nclass - pointer to class
 *           AddMethodBlock  *source - pointer to source method block
 * Returns : pointer to new method block or NULL
 */
 
extern AddMethodBlock *newclass_copy_method ( NewClassBlock *nclass, AddMethodBlock *source );


 
/*
 * Name    : newclass_add_method
 * Desc    : adds a method to the specified class' linked list
 *           of methods (or updates one)
 * Parms   : NewClassBlock  *nclass  - pointer to class
 *           AddMethodBlock **method  - pointer to method to add
 *           BOOL            new     - TRUE if it is a new method
 * Returns : True or False on result
 */
 
extern BOOL newclass_add_method ( NewClassBlock *nclass, AddMethodBlock **method, BOOL new );
 

/*
 * Name    : newclass_free
 * Desc    : free's all data associated with class
 * Parms   : NewClassBlock *nclass
 * Returns : none
 */
 
extern void newclass_free ( NewClassBlock *nclass );


/*
 * Name    : newclass_show
 * Desc    : displays the newclass dbox
 * Parms   : none
 * Returns : pointer to filled in NewClassBlock
 *
 * Other Info: returns NULL if couldn't allocate block
 *             or dbox was cancelled
 */
 
extern NewClassBlock *newclass_show ( void );



#endif

