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
#ifndef helpreply_H
#define helpreply_H

/*helpreply.h*/

/*From OSLib*/
#ifndef os_H
   #include "os.h"
#endif
#ifndef wimp_H
   #include "wimp.h"
#endif

/*From Support*/
#ifndef lookup_H
   #include "lookup.h"
#endif

extern os_error *helpreply (wimp_message *, char *prefix, lookup_t);
   /*Given a prefix and a lookup table, reply to a help request
      by finding the icon name and looking <prefix><name> up in
      the table.*/

#endif
