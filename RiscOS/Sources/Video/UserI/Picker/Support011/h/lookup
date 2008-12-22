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
#ifndef lookup_H
#define lookup_H

/*lookup.h - simple lookup facilities*/

#ifndef os_H
   #include "os.h"
#endif

typedef struct lookup_t *lookup_t;

extern os_error *lookup_new (lookup_t *, int);

extern os_error *lookup_delete (lookup_t);

extern os_error *lookup (lookup_t, char *, void **);

extern os_error *lookup_insert (lookup_t, char *, void *);

extern os_error *lookup_enumerate (lookup_t, char **, void **, void **);

#endif
