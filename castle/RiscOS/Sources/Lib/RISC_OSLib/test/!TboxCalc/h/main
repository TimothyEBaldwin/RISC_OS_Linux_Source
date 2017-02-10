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
/* Title: Main.h
 *
 * Purpose: This file defines various bits and pieces
 * that are useful to us in our code
 *
 * Created:
 *         02-Aug-94
 */

#ifndef __main_h
#define __main_h

/* Within our window object (calc_win)
 * we have defined a number of user events to be generated
 * when action buttons are selected, this is in conjunction
 * with a number of keyboard shortcuts
 * The following is a list of those events corresponding
 * to what happended i.e. 0x100 means 0 was pressed
 */

#define pressed_0      0x100
#define pressed_1      0x101
#define pressed_2      0x102
#define pressed_3      0x103
#define pressed_4      0x104
#define pressed_5      0x105
#define pressed_6      0x106
#define pressed_7      0x107
#define pressed_8      0x108
#define pressed_9      0x109
#define pressed_point  0x10a
#define pressed_c      0x10b
#define pressed_divide 0x10c
#define pressed_add    0x10d
#define pressed_minus  0x10e
#define pressed_mult   0x110
#define pressed_equal  0x111
#define display        0x0             /* The component id of the display field */
#define menu_quit_event 0x99           /*The event returned when quit is selected from our menu*/

#define wimp_version 310               /* The current wimp version we know about */
#define our_directory "<TboxCalc$Dir>" /* The name of our application direcory */
#define task_name "!TboxCalc"          /* the name of our task */

/*
 * These macros provide a means of checking whether we must
 * call our error handler or not.
 * The second macro causes the program to exit.
 */


#define E_CHECK(a) if((a) != NULL) { wimp_error(a); }
#define E_CHECK_ABORT(a) if((a) != NULL) { wimp_error(a);exit(0);}

#endif

