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
 *
 * ShowStat - DCI4 driver/MbufManager statistics gathering
 *
 *
 * Copyright (C) Element 14 Ltd.
 *
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "sys/types.h"
#include "sys/dcistructs.h"

#include "msgs.h"

/* Pull in the strings */
#include "VersionNum"
#include "LocalRes:Strings"


#define array_count(a) (sizeof(a)/sizeof(*(a)))


const char *msgs_get_banner(void)
{
        return application_banner;
}

const char *msgs_get_help(void)
{
        return application_help;
}

size_t msgs_max_width(void)
{
        size_t offset = 0, i;
        const size_t max = array_count(standard_msgs);

        for (i=0; i < max; ++i) {
                size_t len = strlen(msgs_get((msg_id) i));
                if (len > offset) offset = len;
        }

        return offset + 1;
}

static const char *lookup(const char **msgs, size_t id, size_t max, const char *unkmsg)
{
        if (id < max) {
                return msgs[id];
        }
        else {
	        static char unknown[BUFSIZ];

	        (void) sprintf(unknown, unkmsg, id);
	        return unknown;
        }
}

const char *msgs_get(msg_id m)
{
        return lookup(standard_msgs, m, array_count(standard_msgs), unknown_message);
}

const char *values_get(val_id m)
{
        return lookup(standard_values, m, array_count(standard_values), unknown_value);
}

const char *feature_name(size_t bit)
{
	return lookup(feature_flags, bit, array_count(feature_flags), feature_unknown);
}

const char *interface_type(unsigned int id)
{
        return lookup(interface_types, id, array_count(interface_types), interface_type_unknown);
}
