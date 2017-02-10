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
        Provide debugging for Filer_Action.
*/

#include <stdio.h>
#include <stdarg.h>

#include "os.h"

#include "debug.h"

#ifdef debug

#ifdef debugfile
FILE *debugf = NULL;
#endif

void
dprintf( const char *str, ... )
{
        va_list arg_pointer;

#ifdef debugfile
        if ( debugf == NULL ) debugf = fopen( debugfile, "w" );
        if ( debugf == NULL ) return;
#else
#ifdef debugtube
        os_swi0( 0x40100 );
#endif
#endif

        va_start( arg_pointer, str );

#ifdef debugfile
        vfprintf( debugf, str, arg_pointer );
#else
        vprintf( str, arg_pointer );
#endif

        va_end( arg_pointer );

#ifndef debugfile
#ifdef debugtube
        os_swi0( 0x40101 );
#endif
#endif
}

#endif
