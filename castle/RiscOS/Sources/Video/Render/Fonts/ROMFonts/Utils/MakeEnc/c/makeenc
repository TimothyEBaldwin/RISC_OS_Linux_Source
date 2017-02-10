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
#include <string.h>
#include <stdio.h>

#include "Unicode/iso10646.h"

#include "throwback.h"

static char *charname[0x10000];
char used[0x10000];

const char *current_file, *current_output_file;
FILE *current_output_handle;
static int line;
static int throwback;

void error(const char *p)
{
    fprintf(stderr, "%s, line %d: %s\n", current_file, line, p);
    if (throwback)
        throwback_send(1, line, p, current_file, current_file);
    fclose(current_output_handle);
    remove(current_output_file);
    exit(1);
}


char *getline(char *p, size_t plen, FILE *f)
{
    char *ret;
    int l;

    do
    {
        line++;
        ret = fgets(p, plen, f);
        if (!ret) return NULL;

        l = strlen(p);
        if (p[l-1] == '\n')
            p[--l] = '\0';

        while (l && p[l-1] == ' ')
            p[--l] = '\0';

    } while (l == 0);

    return p;
}

void load_utf8_file()
{
    FILE *uf;
    char buffer[400];
    UCS4 u;
    char *p;

    current_file = "Font:Encodings.UTF8";
    uf = fopen("Font:Encodings.UTF8", "r");
    while (getline(buffer, sizeof buffer, uf))
    {
        if (strstr(buffer, "Zapf Dingbats"))
            break;

        if (buffer[0] == '#' || buffer[0] == '%')
            continue;

        p = strtok(buffer, ";");
        if (!p)  error("Syntax error");
        u = strtol(p, NULL, 16);
        if (u >= 0x10000) error("UCS code out of range");
        p = strtok(NULL, ";");
        if (!p) error("Syntax error");
        if (charname[u]) error("UCS code already named");
        charname[u] = malloc(strlen(p)+1);
        if (!charname[u]) error("Out of memory");
        strcpy(charname[u], p);
    }
}

void process_encoding(FILE *in, FILE *out)
{
    char buffer[400];
    UCS4 u;

    fprintf(out, "%% Acorn_/Base32Encoding 1.00 0\n"
                 "\n"
                 "%%%%RISCOS_Alphabet 32\n\n");

    while (getline(buffer, sizeof buffer, in))
    {
        if (buffer[0] == '#')
            continue;

        if (buffer[0] == '-')
        {
            fprintf(out, "/.notdef\n");
            continue;
        }

        u = strtol(buffer, NULL, 16);
        if (u == 0 || u >= 0x10000) error("Invalid code");
        if (used[u]) error("Duplicate entry");
        if (charname[u])
            fprintf(out, "/%s\n", charname[u]);
        else
            fprintf(out, "/uni%04X\n", u);
        used[u] = 1;
    }
}

int main(int argc, char **argv)
{
    FILE *in, *out;

    if (argc >= 2 && strcmp(argv[1], "-throwback")==0)
    {
        throwback = 1;
        argv++;
        argc--;
    }

    if (argc != 3)
    {
        fprintf(stderr, "Usage: makeenc [-throwback] input-file output-file\n");
        exit(1);
    }

    in = fopen(argv[1], "r");
    if (!in)
    {
        perror(argv[1]);
        exit(1);
    }

    out = fopen(argv[2], "w");
    if (!out)
    {
        perror(argv[2]);
        exit(1);
    }

    load_utf8_file();

    current_file = argv[1];
    line = 0;
    current_output_handle = out;
    current_output_file = argv[2];

    process_encoding(in, out);

    return 0;

}
