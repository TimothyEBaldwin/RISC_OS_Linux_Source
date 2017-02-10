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
 *  DHCP (module.h)
 *
 * Copyright (C) Element 14 Ltd. 1999
 *
 */
#ifndef dhcpmodule_h_included
#define dhcpmodule_h_included

#ifdef __cplusplus
extern "C" {
#endif

extern void module_reschedule(int, void *);
extern void module_notify_dynamic_boot_start(dhcp_interface *);
extern void module_notify_dhcp_request(dhcp_interface *);
extern int module_notify_dhcp_offer(dhcp_interface *, DHCP *);
extern void module_apply_private_ip(Dib *dib);
extern _kernel_oserror *module_make_error(int);
extern const char *module_lookup_msg(const char *);

enum moduleidle_reason {
        mir_WAKEUP,
        mir_IDLE,
        mir_THREAD,
        mir_UNTHREAD
};

extern void module_idle(enum moduleidle_reason);

enum dhcpexecutecmd_flags {
        decf_SET_ERROR = 1, /* -e */
        decf_BLOCK = 2,     /* -b */
        decf_WAIT = 4,      /* -w */
        decf_PRIVATE = 8    /* -p */
};

#define SYSVAR_ERROR "Inet$Error"
extern void *Resources(void); /* From 'resgen' */

/* Errors */
#define dhcperror_BASE                    (0x816c00)
#define ErrorNumber_DHCP_NoSuchInterface  (dhcperror_BASE + 0)
#define ErrorNumber_DHCP_BadOption        (dhcperror_BASE + 1)
#define ErrorNumber_DHCP_OptionNotPresent (dhcperror_BASE + 2)
#define ErrorNumber_DHCP_OptionNotAdded   (dhcperror_BASE + 3)

#ifdef __cplusplus
}
#endif

#endif
