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
