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
/*-*-C-*-
 *
 * use existing Type1 file found in the font directory.
 */

#include "module.h"
#include "use.h"

#define LINESIZE 100
#define SLASHFONTNAME "/FontName"

/* NOTE: the two following entries MUST be the same length */
#define EXITSERVER   "exitserver"
#define NOEXITSERVER "pop end   "


/*
 * Check to see if a given font has a Type1 file associated with it.  If so,
 * return its filename (as a malloc string which the caller should free).  If
 * not, then return NULL.
 */

char *type1filename (char *outlines)
{
    char *dot, *name = malloc(strlen(outlines) + 1);
    if (!name) return NULL;
    strcpy(name, outlines);
    if ((dot = strrchr(name, '.')) != NULL)
    {
        strcpy(dot, ".Type1");      /* XXXX .Type1 shorter that .Outlines */
        if (filesize(name) != -1)
            return name;
    }
    free(name);
    return NULL;
}


static char * fgrep (char *line, char *key, int keylen)
{
    char *lp = line;
    char *kp = key;
    char *ep = line + strlen(line) - keylen;

    if (line > ep) return NULL;
    for (;;)
    {
        char l = *lp++;
        char k = *kp++;
        if (k == 0)            
            return line;            /* matched at line */
        else if (l == 0)
            return NULL;            /* not found */
        else if (l != k)
        {
            if ((lp = ++line) > ep) return NULL;
            kp = key;
        }
    }
}


/*
 * If there is a Type1 file for this font, send it to the output stream
 * replacing certain fields with new values:-
 *  %...             -- removed (if at start of line)
 *  exitserver       -- replaced with "pop end"
 *  /FontName <blah> -- replaced with /FontName <foreign>
 *
 * Return TRUE if it could be done, else FALSE.
 */

Bool sendtype1file (FILE *output, char *foreign, char *name)
{
    char line[LINESIZE], *where;
    FILE *t1;
    int seenexitserver = 0, seenfontname = 0;

    t1 = fopen(name, "r");
    if (t1 == NULL)
        return FALSE;
    
    while (fgets(line, sizeof(line), t1) != NULL)
    {
        if (*line == '%')
            continue;

        else if (!seenfontname && (where = fgrep (line, SLASHFONTNAME, sizeof(SLASHFONTNAME) - 1)) != NULL)
        {
            /* Expect /FontName, whitespace, name, whitespace, def.  Assume that
             * it will all be on one line.
             */
            *where = 0;              /* Output line up to /FontName, if any */
            fputs(line, output);

            where += sizeof(SLASHFONTNAME) - 1;
            while (*where && isspace(*where)) where++;
            while (*where && !isspace(*where)) where++;
            while (*where && isspace(*where)) where++;

            fprintf(output, "%s /%s %s", SLASHFONTNAME, foreign, where);

            seenfontname = TRUE;
        }

        else if (!seenexitserver && (where = fgrep (line, EXITSERVER, sizeof(EXITSERVER) - 1)) != NULL)
        {
            /* The two strings must be the same length! */
            strncpy(where, NOEXITSERVER, sizeof(NOEXITSERVER) - 1);
            fputs(line, output);
            seenexitserver = TRUE;
        }

        else
            fputs(line, output);
    }
    fclose(t1);
    return TRUE;
}



