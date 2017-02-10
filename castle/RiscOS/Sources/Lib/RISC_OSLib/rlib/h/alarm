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
/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the RISCOS library for writing applications in C for RISC OS. It may be  *
 * used freely in the creation of programs for Archimedes. It should be     *
 * used with Acorn's C Compiler Release 3 or later.                         *
 *                                                                          *
 ***************************************************************************/
/*
 * Title:    alarm.h
 * Purpose:  alarm facilities for wimp programs, using non-busy waiting
 *
 */

#ifndef __alarm_h
#define __alarm_h

# ifndef BOOL
# define BOOL int
# define TRUE 1
# define FALSE 0
# endif

typedef void (*alarm_handler)(int called_at, void *handle);


/* ----------------------------- alarm_init --------------------------------
 * Description:   Initialise the alarm system. 
 * 
 * Parameters:    void
 * Returns:       void.
 * Other Info:    If this call is made more than once, then any pending
 *                alarms are cancelled. 
 *
 */

void alarm_init(void);


/* ----------------------------- alarm_timenow -----------------------------
 * Description:   Reports the current monotonic time.
 * 
 * Parameters:    void
 * Returns:       the current monotonic time.
 * Other Info:    none.
 *
 */

int alarm_timenow(void);


/* --------------------------- alarm_timedifference ------------------------
 * Description:   Returns difference between two times.
 *
 * Parameters:    int t1 -- the earlier time
 *                int t2 -- the later time
 * Returns:       difference between t1 and t2.
 * Other Info:    Times are as in SWI OS_ReadMonotonicTime. Deals with wrap
 *                round of timer.
 *
 */

int alarm_timedifference(int t1, int t2);


/* ------------------------------ alarm_set --------------------------------
 * Description:   Set an alarm at the given time.
 *
 * Parameters:    int at -- time at which alarm should occur
 *                alarm_handler proc -- function to be called at alarm time
 *                void *handle -- caller-supplied handle to be passed to 
 *                                function
 * Returns:       void.
 * Other Info:    The supplied function is called before passing the event 
 *                on to any idle event claimer windows. 
 *                "at" is in terms of the monotonic centi-second timer.
 *                The supplied function is passed the time at which it was
 *                called. If you have enabled idle events, then these are
 *                still returned to you; if not, RISC_OSlib uses idle events
 *                internally to implement alarm calls (using non-busy
 *                waiting via wimp_pollidle()).
 *
 */

void alarm_set(int at, alarm_handler proc, void *handle);


/* ----------------------------- alarm_remove ------------------------------
 * Description:   Removes an alarm which was set for a given time with a
 *                given handle.
 *
 * Parameters:    int at -- the time at which the alarm was to be made
 *                void *handle -- the given handle
 * Returns:       void.
 * Other Info:    If no such alarm exists this call has no effect.
 *
 */

void alarm_remove(int at, void *handle);


/* --------------------------- alarm_removeall -----------------------------
 * Description:   Removes all alarms which have a given handle.
 *
 * Parameters:    void *handle -- the handle to search for.
 * Returns:       void.
 * Other Info:    none.
 *
 */

void alarm_removeall(void *handle);


/* ---------------------------- alarm_anypending ---------------------------
 * Description:   Returns whether an alarm is pending with a given handle
 *
 * Parameters:    void *handle -- the handle.
 * Returns:       TRUE if there are any pending alarms for this handle.
 * Other Info:    none.
 *
 */

BOOL alarm_anypending(void *handle);


/* ----------------------------- alarm_next --------------------------------
 * Description:   Informs caller whether an alarm is pending and, if so, for
 *                when it is.
 *
 * Parameters:    int *result -- time for which alarm is pending
 * Returns:       TRUE if an alarm is pending.
 * Other Info:    This should be used by polling loops (if you use the
 *                standard "while(TRUE) event_process();" loop then this is
 *                done for you). If a polling loop finds that an alarm is set
 *                it should use wimp_pollidle(with earliest time set to
 *                *result of alarm_next()) rather than wimp_poll to do its
 *                polling.  If you handle idle events yourself, then your
 *                handler should use call_next to call the next alarm
 *                function upon receiving an idle event (ie. wimp_ENULL).
 *
 */

BOOL alarm_next(int *result);


/* ---------------------------- alarm_callnext -----------------------------
 * Description:   Calls the next alarm handler function.
 *
 * Parameters:    void
 * Returns:       void.
 * Other Info:    This is done for you if you use event_process() to do your
 *                polling (or even if you sink down as far as using wimpt
 *                for polling).
 *
 */

void alarm_callnext(void);

#endif

/* end of alarm.h */
