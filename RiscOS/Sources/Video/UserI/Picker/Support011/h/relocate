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
#ifndef relocate_H
#define relocate_H

typedef
   struct relocate_frame
   {  int client_offset;
      int lib_offset;
   #ifdef SMALL_STUBS
      int stub_entries;
   #endif
   }
   relocate_frame;

extern void relocate_begin (void *workspace, relocate_frame *);

extern void relocate_end (relocate_frame *frame);

#endif
