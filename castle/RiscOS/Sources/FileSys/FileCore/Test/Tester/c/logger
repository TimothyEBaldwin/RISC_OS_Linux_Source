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
#include <stdio.h>
#include <stdarg.h>
#include <time.h>
#include "logger.h"

static FILE *logfile = NULL;
static long logsize = 0;
static time_t starttime;

int logger_start
(
        char *name,
        long size
)
{
        logsize = size;
        logfile = fopen( name, "w" );

        time( &starttime );

        return logfile != NULL;
}

void logger_stop
(
        void
)
{
        time_t stoptime;

        logprintf( "Logging started at %s\n", ctime( &starttime ));
        time( &stoptime );
        logprintf( "logging finished at %s\n", ctime( &stoptime ));

        if ( logfile )
                fclose( logfile );
}

int logprintf
(
        const char *cstr,
        ...
)
{
        va_list argp;


        if ( logfile )
        {
                if ( ftell( logfile ) > logsize )
                        fseek( logfile, 0L, SEEK_SET );

                va_start( argp, cstr );
                vfprintf( logfile, cstr, argp );

                fprintf( logfile, "END\n" );
                fseek( logfile, -4L, SEEK_CUR );
        }

        va_start( argp, cstr );
        return vprintf( cstr, argp );
}
