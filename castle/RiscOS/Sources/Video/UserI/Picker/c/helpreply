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
/*helpreply.c*/

/*From CLib*/
#include <string.h>

/*From OSLib*/
#include "help.h"
#include "macros.h"
#include "os.h"
#include "wimp.h"

/*From Support*/
#include "icon.h"
#include "lookup.h"
#include "riscos.h"
#include "task.h"

/*Local*/
#include "helpreply.h"

os_error *helpreply (wimp_message *message, char *prefix,
      lookup_t messages)

{  help_message_request *request =
         (help_message_request *) &message->data;
   char token [80 + 1], *reply;
   os_error *error = NULL;

   strcpy (token, prefix);

   /*Get the name of this icon (if any).*/
   if (request->i != wimp_ICON_WINDOW)
      if ((error = icon_name (request->w, request->i,
            token + strlen (token))) != NULL)
         goto finish;

   if ((error = lookup (messages, token, (void **) &reply)) != NULL)
   {  if (error->errnum != os_GLOBAL_NO_ANY)
         goto finish;
      error = NULL;
      reply = NULL;
   }
   /*|reply| is possibly 13-terminated, possibly in read-only memory.*/

   if (reply != NULL)
      if ((error = task_send_user_message (message->sender,
            message->my_ref, message_HELP_REPLY, reply,
            ALIGN (riscos_strlen (reply) + 1))) != NULL)
         goto finish;

finish:
   return error;
}
