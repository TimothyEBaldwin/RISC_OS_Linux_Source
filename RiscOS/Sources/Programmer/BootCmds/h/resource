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
#ifndef resource_H
#define resource_H

#ifndef os_H
   #include "os.h"
#endif

#ifndef wimp_H
   #include "wimp.h"
#endif

#ifndef lookup_H
   #include "lookup.h"
#endif

   /* Types for the functions declared in this header.
   */

typedef os_error *resource_loader (lookup_t, char *);
typedef os_error *resource_unloader (lookup_t);

typedef
   struct resource_template
      {  int data_size;
         char *data;
         wimp_window window;
         /*data lives here*/
      }
      resource_template;

   /* Function to open a message file and copy it into memory if neccesary.
      All the tokens in the file are added to the lookup table: if the file
      was on disc, the lookup table will contain pointers into a block of
      heap memory, oherwise into the R M A or ROM. The message file is then
      closed, which means that MessageTrans_Lookup etc cannot be used.
   */

extern resource_loader resource_messages_alloc;

   /* Function to free the memory used by a messages resource. It is the
      client's responsibility to delete the lookup table.
   */

extern resource_unloader resource_messages_free;

   /* Function to open a sprite file and read it into memory if necessary,
      merging it with any sprite ares there may be from earlier calls to this
      function, using OSSpriteOp_MergeSpriteFile. All the sprite names in the
      merged file are inserted into the lookup table: the result of looking
      them up is a pointer to the OSSpriteOp_Header structure, ready to be
      passed to any OSSpriteOp SWI that requires one.
   */

extern resource_loader resource_sprites_alloc;

   /* Function to frees the memory used by this sprite resource. It is the
      client's responsibility to delete the lookup table.
   */

extern resource_unloader resource_sprites_free;

   /* Function to open a template file and read it into memory. Because of
      the way the WIMP works, a copy must be made even if the original is in
      memory already. Each template in the file is inserted into the lookup
      table, and stored in a block of malloc memory along with its indirected
      data. The result of looking up a name is a pointer to a structure
      containing the wimp_window and the indirected data.
      Resource_create_window() should be used to open the window.
   */

extern resource_loader resource_templates_alloc;

   /* Function to free the memory used by a template resource. It is the
      client's responsibility to delete the lookup table.
   */

extern resource_unloader resource_templates_free;

extern os_error *resource_create_window (resource_template *, wimp_w *,
      char **);

extern os_error *resource_delete_window (wimp_w, char *);

#endif
