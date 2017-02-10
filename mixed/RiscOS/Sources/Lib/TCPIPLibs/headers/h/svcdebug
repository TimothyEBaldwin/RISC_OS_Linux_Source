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
/* -*-C-*-
 *
 * svcdebug.h - minimal debug support using SVC printf routines
 *
 * Copyright (c) 1995 Acorn Computers Ltd., Cambridge, England
 *
 * :RCS Log discontinued:
 * Revision 1.1  95/01/11  10:21:40  kwelton
 * Initial revision
 *
 */

#ifdef DEBUG
extern int debug;
#else
# define debug 0
#endif

extern void Printf(const char *format, ...);

#define PRINTF	if (debug) Printf
#define N(x)	(x ? x : "NULL")

/*
 * trigger level for "super debugs"
 */
extern int superdebug;
#define SDBTRIGGER 16

/* EOF svcdebug.h */
