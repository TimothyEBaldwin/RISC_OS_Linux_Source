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
#include "kernel.h"
#include "swis.h"
#include "Tester.h"
#include "logger.h"


void os_bput( int *file, char byte )
{
        _kernel_oserror *err;
        _kernel_swi_regs r;
        _kernel_swi_regs newr;
        unsigned int old_sfp;
        char read_buffer = ~byte;       /* to ensure different data in the read buffer */

        logprintf( "os_bput( %d, %d ) ", *file, (int)byte );

        r.r[0] = 0;
        r.r[1] = *file;

        err = _kernel_swi( OS_Args, &r, &r );

        if ( err )
        {
                pout_error( err );
                logprintf( "while getting sequential file pointer before operation\n" );
                return;
        }

        old_sfp = (unsigned int)r.r[2];

        r.r[0] = (int)byte;
        r.r[1] = *file;

        err = _kernel_swi( OS_BPut, &r, &newr );

        if ( err )
        {
                if ( err->errnum == Error_NotOpenForUpdate )
                {
                        /* do nothing */
                }
                else
                {
                        pout_error( err );
                }
        }
        else
        {
                check_regs_unchanged( &r, &newr, 0x7 );

                r.r[0] = 3;
                r.r[1] = *file;
                r.r[2] = (int)&read_buffer;
                r.r[3] = 1;
                r.r[4] = (int)old_sfp;

                err = _kernel_swi( OS_GBPB, &r, &r );

                if ( err )
                {
                        if ( err->errnum == Error_NotOpenForReading )
                        {
                                /* do nothing */
                        }
                        else
                        {
                                pout_error( err );
                                logprintf( "while reading byte back " );
                        }
                }
                else
                {
                        if ( read_buffer != byte )
                        {
                                problems++;
                                logprintf( "byte did not read back correctly : new value is %d ", read_buffer );
                        }
                }
        }

        logprintf( "\n" );
}
