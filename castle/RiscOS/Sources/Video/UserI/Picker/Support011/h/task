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
#ifndef task_H
#define task_H

/*From OSLib*/
#ifndef os_H
   #include "os.h"
#endif

#ifndef wimp_H
   #include "wimp.h"
#endif

/*Local*/
#ifndef callback_H
   #include "callback.h"
#endif

#define task_SHIFT ((bits) 0x1u)
#define task_CTRL  ((bits) 0x2u)
#define task_ALT   ((bits) 0x4u)

/*Type of a task descriptor.*/
typedef struct task_r *task_r;

/*Type of a function that handles a message reply or bounce.*/
typedef os_error *task_message_fn (void *, wimp_block *);

extern os_error *task_new (char *programme, wimp_t task, task_r *r_out);

extern os_error *task_delete (task_r r);

extern wimp_t task_info_task (task_r);

/* ------------------------------------------------------------------------
 * Function to process one event. Used in filters that need to handle
 * multiple callback lists (for multiple tasks).
 */

extern os_error *task_callback (task_r r, callback_l list, int event,
      wimp_block *block, osbool *unclaimed);

/* ------------------------------------------------------------------------
 * Function to call Wimp_ReportError (on a deprocedured argument,
 * usually) if necessary.
 */

extern os_error *task_report_error (task_r r, os_error *error);

/* ------------------------------------------------------------------------
 * Functions to claim and release events. Reference counts are maintained
 * for each. This is not really a very good interface to the WIMP's
 * facilities because:
 *
 *    - there is no way to mask out the message events (since they start
 *      out unmasked with a reference count of 0)
 *    - there is no way to set the Wimp_P bit of the mask
 *    - there is no way to set the Wimp_GivenPollword or
 *         Wimp_PollHighPriority bits of the mask.
 *
 * All these return the state of the mask (after the operation, if any).
 */

extern bits task_claim (task_r r, int event),
      task_release (task_r r, int event),
      task_mask (task_r r);

extern callback_l task_list (task_r r);

extern os_error *task_send_user_message
      (wimp_t to, int ref,
      int action, ...);

extern os_error *task_send_user_message_recorded
      (wimp_t to, int ref,
      task_r r, task_message_fn *reply_fn, task_message_fn *bounce_fn,
      void *h, int action, ...);

extern os_error *task_send_user_message_acknowledge
      (wimp_t to, int ref,
      int action, ...);

extern os_error *task_send_user_message_to_window
      (wimp_w to_w, wimp_i to_i, int ref,
      int action, ...);

extern os_error *task_send_user_message_recorded_to_window
      (wimp_w to_w, wimp_i to_i, int ref,
      task_r r, task_message_fn *reply_fn, task_message_fn *bounce_fn,
      void *h, int action, ...);

extern os_error *task_send_user_message_acknowledge_to_window
      (wimp_w to_w, wimp_i to_i, int ref,
      int action, ...);

#endif
