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
 * Copyright(c) 1994 Acorn Computers Ltd., Cambridge, England
 *
 * debug.h - debug control for Internet module
 *
 */
#pragma force_top_level
#pragma include_only_once

/*
 * use this to control global debug status
 */
#if 0
# define DEBUG
#endif /* 0/1 */

#ifdef DEBUG
/*
 * declaration of control variable
 */
extern int debugctrl;
extern void Printf(const char *fmt, ...);

# define DODEBUG(x)	(debugctrl & (x))

#else

# define DODEBUG(x)	(0)
#endif /* defined (DEBUG) */

#define DBGSTARTUP	(1 << 0)
#define DBGUSER		(1 << 1)
#define DBGINPUT	(1 << 2)
#define DBGOUTPUT	(1 << 3)
#define DBGARP		(1 << 4)
#define DBGMMAN		(1 << 5)
#define DBGICMP		(1 << 6)
#define DBGADDRSRCH	(1 << 7)
#define DBGTCP		(1 << 8)
#define DBGUDP		(1 << 9)
#define DBGSOCKIP	(1 << 10)
#define DBGEVENTS	(1 << 11)
#define DBGINRMX        (1 << 12)
#define DBGIGMP         (1 << 13)
#define DBGMRT          (1 << 14)
#define DBGSELECT       (1 << 15)

/* EOF debug.h */
