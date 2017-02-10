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
/* trace.c
 *
 *      General purpose debugging code.
 */

/* From CLib */
#include <stdio.h>
#include <stdarg.h>
#include "swis.h"

#ifdef DEBUG

#ifdef DEBUGLIB

#include "<Lib$Dir>.DebugLib/DebugLib.h"

void trace_initialise(void)
{
  	debug_initialise("nvram", "NULL:", "");
  	debug_set_device(PRINTF_OUTPUT);
}

#endif

#include "trace.h"

int _trace_on = 0;

#ifdef DEBUG_TO_SCREEN
void
_tracef( char *fmt, ... )
{
        va_list ap;

        va_start(ap, fmt);

        vprintf(fmt, ap);

        /* _swix(OS_Byte, _IN(0), 19); */
        /* _swix(OS_Byte, _IN(0), 19); */
        /* _swix(OS_Byte, _IN(0), 19); */
        /* _swix(OS_Byte, _IN(0), 19); */

        va_end(ap);
}

#else

#ifdef DEBUGLIB

void
_tracef( char *fmt, ... )
{
	__va_list args;

	va_start( args, fmt );
	dvprintf(( "", fmt, args ));
	va_end( args );
}

#else
void
_tracef( char *fmt, ... )
{
	if ( _trace_on )
	{
		__va_list args;

		(void)_swix( 0x40100, 0 );
		va_start( args, fmt );
		vprintf( fmt, args );
		va_end( args );
		(void)_swix( 0x40101, 0 );
	}
}

#endif

#endif

#endif
