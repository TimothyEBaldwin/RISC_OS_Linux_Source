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
 *  DHCP (dhcpconsts.h)
 *
 * Copyright (C) Element 14 Ltd. 1999
 *
 */
#ifndef dhcpconsts_h_included
#define dhcpconsts_h_included

#ifdef __cplusplus
extern "C" {
#endif

/* All timeouts are specified in CENTISECONDS, not seconds */

enum {
	/* Timeouts for DHCPDISCOVER messages */
        discover_INITIAL_RETRY = 250,
        discover_TOTAL_TIMEOUT = 2000,

	/* Timeouts for DHCPREQUEST (when in REBOOTING state) */
	initreboot_INITIAL_RETRY = 250,
	initreboot_TOTAL_TIMEOUT = 2000,

        /* Timeouts for SELECTING state */
        selecting_TIME_LIMIT_AFTER_FIRST_OFFER = 400,

	/* Timeouts for DHCPREQUEST messages */
        request_INITIAL_RETRY = 25,
        request_TOTAL_TIMEOUT = 6144,

	/* Timeouts for DHCPDECLINE messages */
        decline_QUIET_DELAY = 1000,

	/* Timeouts for DHCPRELEASE messages */
        release_QUIET_DELAY = 1000
};

enum {
        transmit_DEFAULT_INITIAL_RETRY = 50,
        transmit_BACKOFF_LIMIT = 6400
};

/* These are the values for the OPTION_OPTIONOVERLOAD option. */
enum {
        dhcpoverload_NONE,
        dhcpoverload_FILE,
        dhcpoverload_SNAME,
        dhcpoverload_BOTH
};


#ifdef __cplusplus
}
#endif

#endif
