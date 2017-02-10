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
#include <stdlib.h>
#include <stdio.h>

#include "throwback.h"

#ifdef UNIX

void throwback_send(int severity, int line, const char *msg, const char *sourcefile, const char *current)
{
  (void) severity;
  (void) line;
  (void) msg;
  (void) sourcefile;
  (void) current;
}

const char *dependfilename;

void add_dependency(const char *target, const char *filename)
{
  (void) target;
  (void) filename;
}

#else

#define Throwback_Start       0x42587
#define Throwback_Send        0x42588
#define Throwback_End         0x42589

#include "swis.h"

#define Throwback_ReasonProcessing   0
#define Throwback_ReasonErrorDetails 1

static int throwback_id;
static int sent_procfile_msg;

static void throwback_exit(void)
{
    if (throwback_id >= 0)
        _swix(Throwback_End, _IN(0), throwback_id);
}

static void throwback_start(void)
{
    atexit(throwback_exit);
    if (!_swix(Throwback_Start, 0))
        throwback_id = 1;
}

void throwback_send(int severity, int line, const char *msg, const char *sourcefile, const char *current)
{
    if (!sent_procfile_msg) {
        throwback_start();
        sent_procfile_msg = 1;
        if (throwback_id >= 0) {
            _swix(Throwback_Send, _INR(0,2),
                  Throwback_ReasonProcessing, throwback_id, sourcefile);
        }
    }
    if (throwback_id >= 0) {
        _swix(Throwback_Send, _INR(0,5),
              Throwback_ReasonErrorDetails, throwback_id, current,
              line, severity, msg);
    }
}

const char *dependfilename;

void add_dependency(const char *target, const char *filename)
{
    static FILE *dependfile;

    if (!dependfile)
    {
        dependfile = fopen(dependfilename, "w");
        if (!dependfile) return;
    }


    fprintf(dependfile, "%s: %s\n", target, filename);
}
#endif /* UNIX */
