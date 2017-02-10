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
/*main.c - test programme for colour picker*/

/*From CLib*/
#include <stdio.h>

/*From OSLib*/
#include "help.h"
#include "os.h"
#include "wimp.h"
#include "wimpreadsy.h"

/*From Support*/
#include "application.h"
#include "callback.h"
#include "m.h"
#include "riscos.h"
#include "trace.h"

/*Local*/
#include "colourpick.h"

bool fn1_ (void *a, void *b) {return a == b;}

bool fn2_ (void *a, void *b) {return a != b;}

int main (void)

{  callback_l list;
   void *d = (void *) &d;
   os_error *error = NULL;

   if ((list = callback_new ()) == NULL)
   {  error = riscos_error_lookup (1, "NoMem");
      goto finish;
   }

   m_SUMMARY ();

   if
   (  callback_register (list, &fn1_, d, 3, 9,9,9) == NULL ||
      callback_register (list, &fn1_, d, 2, 1,9) == NULL ||
      callback_register (list, &fn1_, d, 2, 9,1) == NULL ||
      callback_register (list, &fn2_, 0, 2, 1,1) == NULL ||
      callback_register (list, &fn1_, d, 1, 2) == NULL ||
      callback_register (list, &fn1_, d, 2, 9,2) == NULL ||
      callback_register (list, &fn1_, d, 0) == NULL
   )
   {  error = riscos_error_lookup (1, "NoMem");
      goto finish;
   }

   m_SUMMARY ();

   callback_trace (list);
   callback_deregister (list, d, 0);
   callback_trace (list);

   m_SUMMARY ();

   callback_delete (list);

   m_SUMMARY ();

finish:
   application_report_error (error);
   return 0;
}
