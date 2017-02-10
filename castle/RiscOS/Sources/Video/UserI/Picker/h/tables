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
