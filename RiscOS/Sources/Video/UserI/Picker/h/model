/* Copyright 1996 Acorn Computers Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
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
