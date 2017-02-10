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
#ifndef main_h_included
#define main_h_included

typedef enum {
	type_SUPPLIER,
	type_PROTOCOL,
	type_DRIVER,
	type_MBUFMANAGER
} spctl_type;

typedef struct spctl spctl;

struct spctl {
        spctl		*next;
        unsigned int	i_version;
        unsigned int	features;
        unsigned int	swi_num;
        unsigned int	max_stat; /* inclusive */
	spctl_type	type;
	unsigned int	version;
	const char 	*module;
	const char	*title;
	const char	*description;
	unsigned int 	reset[2];
};

typedef enum {
        st_UNUSED,
        st_BOOL,
        st_STRING,
        st_INT8,
        st_INT16,
        st_INT32,
        st_INT64
} stattype;

typedef enum {
	st_BOOL_NORMAL,
        st_BOOL_INVERTED,

	st_INT_NORMAL = 0,
        st_INT_UNSIGNED,
        st_INT_BIGENDIAN,

        st_STRING_ZEROTERM = 0
} statformat;

typedef enum {
        st_BOOL_ON_OFF,
        st_BOOL_YES_NO,
        st_BOOL_TRUE_FALSE,
        st_BOOL_ALWAYS_NEVER,
        st_BOOL_ONE_ZERO,

        st_INT_HEX = 0,
        st_INT_DECIMAL,
        st_INT_DOTTED,

        st_STRING_LITERAL = 0
} statpresentation;

typedef enum {
        st_VOL_STATIC,
        st_VOL_VARIABLE,
        st_VOL_VOLATILE
} statvolatility;

typedef struct statistic {
        stattype		type;
        statformat		format;
        statpresentation	presentation;
        size_t			size;
        statvolatility		volatility;
        const char		*name;
        const char		*name_tag;
        unsigned int		_unused;
} statistic;

typedef union statvalue {
        int64_t			i64;
        u_int64_t		ui64;
        unsigned long		ul32[2];
        int32_t			i32;
        u_int32_t		ui32;
        int16_t			i16;
        u_int16_t		ui16;
        signed char		i8;
        unsigned char		ui8;
        const char		string[1];
        struct in_addr		in4;
        bool			bool1;
} statvalue;

#endif
