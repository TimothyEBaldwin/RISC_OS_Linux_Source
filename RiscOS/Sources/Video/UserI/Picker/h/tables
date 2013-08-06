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
#ifndef tables_H
#define tables_H

/*tables.h*/

/*History

   15th Sep 1994 J R C Started

*/

/*From OSLib*/
#ifndef os_H
   #include "os.h"
#endif

#ifndef osspriteop_H
   #include "osspriteop.h"
#endif

/* Used in the following way:
      Call tables_initialise();
            now the mode variables are set up.
      Call tables_mode_change() on a mode change to keep them
            up-to-date.
      If you want the tables, call tables_ensure() before you use
            them. It doesn't matter if you call this lots, the work
            will only be done once, but they are thrown away
            automatically on a mode change.
      Call tables_terminate() at the end: this will throw away the
            tables if they have been "ensured."
*/

extern int tables_xeig, tables_yeig, tables_log2_bpp, tables_ncolour;

extern osspriteop_trans_tab *tables_translation, *tables_injection,
      *tables_surjection;

extern os_error *tables_initialise (void);

extern os_error *tables_terminate (void);

extern os_error *tables_ensure (void);

extern os_error *tables_mode_change (void);

#endif
