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
/*
 * The mrouted program is covered by the license in the accompanying file
 * named "LICENSE".  Use of the mrouted program represents acceptance of
 * the terms and conditions listed in that file.
 *
 * The mrouted program is COPYRIGHT 1989 by The Board of Trustees of
 * Leland Stanford Junior University.
 *
 *
 * igmpv2.h,v 3.8.4.1 1997/11/18 23:25:58 fenner Exp
 */

/*
 * Constants for IGMP Version 2.  Several of these, especially the
 * robustness variable, should be variables and not constants.
 */
#define	IGMP_ROBUSTNESS_VARIABLE		2
#define	IGMP_QUERY_INTERVAL			125
#define	IGMP_QUERY_RESPONSE_INTERVAL		10
#define	IGMP_GROUP_MEMBERSHIP_INTERVAL		(IGMP_ROBUSTNESS_VARIABLE * \
					IGMP_QUERY_INTERVAL + \
					IGMP_QUERY_RESPONSE_INTERVAL)
#define	IGMP_OTHER_QUERIER_PRESENT_INTERVAL	(IGMP_ROBUSTNESS_VARIABLE * \
					IGMP_QUERY_INTERVAL + \
					IGMP_QUERY_RESPONSE_INTERVAL / 2)
						/* Round to the nearest TIMER_INTERVAL */
#define	IGMP_STARTUP_QUERY_INTERVAL		(((IGMP_QUERY_INTERVAL / 4) \
							/ TIMER_INTERVAL) * TIMER_INTERVAL)
#define	IGMP_STARTUP_QUERY_COUNT		IGMP_ROBUSTNESS_VARIABLE
#define	IGMP_LAST_MEMBER_QUERY_INTERVAL		1
#define	IGMP_LAST_MEMBER_QUERY_COUNT		IGMP_ROBUSTNESS_VARIABLE

/*
 * OLD_AGE_THRESHOLD is the number of IGMP_QUERY_INTERVAL's to remember the
 * presence of an IGMPv1 group member.  According to the IGMPv2 specification,
 * routers remember this presence for [Robustness Variable] * [Query Interval] +
 * [Query Response Interval].  However, OLD_AGE_THRESHOLD is in units of
 * [Query Interval], so doesn't have sufficient resolution to represent
 * [Query Response Interval].  When the timer mechanism gets an efficient
 * method of refreshing timers, this should get fixed.
 */
#define OLD_AGE_THRESHOLD		IGMP_ROBUSTNESS_VARIABLE
