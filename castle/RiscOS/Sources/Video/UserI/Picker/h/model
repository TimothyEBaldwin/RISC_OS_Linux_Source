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
#ifndef model_H
#define model_H

/*model.h - functions to handle colourpicker model registration*/

/*The type of a list of pointers to such arrays*/
typedef
   struct model_list
   {  int model_no;
      colourpicker_model *model;
      void *workspace;
      struct model_list *next;
   }
   *model_list;

/*The model list*/
extern model_list model_registry, *model_last;

/*Ths largest size of any extent.*/
extern os_coord model_bound;

extern os_error *model_initialise (void);

extern os_error *model_terminate (void);

extern void model_loaded_service (int, colourpicker_model *, void *,
      void *);

extern os_error *model_register (int, colourpicker_model *, void *);

extern os_error *model_deregister (int);

extern osbool model_in_use (int);

extern os_error *model_set_colour (bits flags, colourpicker_colour *);

#endif
