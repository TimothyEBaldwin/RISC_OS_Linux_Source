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
/*realloc.c - portable realloc with no bugs!*/

#include <stdlib.h>
#include <string.h>

#include "realloc.h"

void *REALLOC (void *ptr, size_t size)

{  if (ptr != NULL && size != 0)
   {  void *tmp;

      if ((tmp = malloc (size)) == NULL)
         return NULL;

      memcpy (tmp, ptr, size);

      free (ptr);

      return tmp;
   }
   else if (size != 0)
      return malloc (size);
   else
   {  /*ptr != NULL*/
      free (ptr);
      return NULL;
}  }
