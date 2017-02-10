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
/* Title: Events.h
 *
 * Purpose: This file defines the events used by the code
 *
 * Created:
 *         02-Aug-94
 */

#ifndef __events_h
#define __events_h

/* This array is cycled through when we are setting up the event handler
 * for numbers being hit, it is terminated with -1
 */

static int number_event[]  = {pressed_0,
                              pressed_1,
                              pressed_2,
                              pressed_3,
                              pressed_4,
                              pressed_5,
                              pressed_6,
                              pressed_7,
                              pressed_8,
                              pressed_9,
                              pressed_point,
                              -1};
/* This array is cycled through when we are setting up the event handler
 * for oerators, it is terminated with -1
 */

static int operator_event[] = {pressed_add,
                               pressed_minus,
                               pressed_mult,
                               pressed_divide,
                               pressed_equal,
                               pressed_c,
                               -1};



/* This array tells toolbox initialise which wimo messages we want to know about */
static int wimp_messages[]  = {8,0};

/* This array tells toolbox initialise which toolbox events we are interested in
 * a value of 0 indicates we want all events
 */
static int toolbox_events[] = {0};

#endif
