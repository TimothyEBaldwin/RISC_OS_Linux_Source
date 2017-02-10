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
#include <locale.h>
#include <string.h>
#include <time.h>
#include <ctype.h>
#include "swis.h"

char *str[20000];
char buffer[256];

int compare(const void *s1, const void *s2)
{
    const char *st1, *st2, *stx1, *stx2;
    int d, d2, n1, n2;
    st1 = *(const char **) s1;
    st2 = *(const char **) s2;
    stx1 = ((const char **) s1)[1];
    stx2 = ((const char **) s2)[1];
    n1 = (char **) s1 - str;
    n2 = (char **) s2 - str;
    //printf("%p,%p; %p,%p\n", s1, st1, s2, st2);
    d = strcoll(st1, st2);
    d2 = strcmp(stx1, stx2);
    if (d < 0 && d2 >= 0 || d == 0 && d2 != 0 || d > 0 && d2 <= 0)
        printf("%d \"%s\" : %d \"%s\" -> \"%s\" : \"%s\" Whoops (%d,%d)\n", n1, st1, n2, st2, stx1, stx2, d, d2);
    //printf("\"%s\" %c \"%s\"\n", st1, d == 0 ? '=' : d < 0 ? '<' : '>', st2);
    return d;
}

size_t Strxfrm(char *s1, const char *s2, size_t n)
{
    return _swi(Territory_TransformString, _INR(0,3)|_RETURN(0), 1, s1, s2, n);
}

int main()
{
    int i;

    setlocale(LC_ALL, "UK");

    Strxfrm(buffer, "Héllo", 256);

    printf("Strxfrm(\"Héllo\")=\"%s\"\n", buffer);

    printf("str=%p\n", str);

    srand(time(NULL));

    for (i=0; i<20000; i+=2)
    {
        int l = rand() % 5 + 1;
        int p, d, d2;
        str[i] = malloc(l+1);
        if (!str[i]) return 1;
        for (p=0; p<l; p++)
        {
            int c=0;
            /*while (!isalpha(c))*/ c = rand() % 256;
            str[i][p] = c;
        }
        str[i][l] = 0;

        l = Strxfrm(NULL, str[i], 0);
        str[i+1] = malloc(l+1);
        if (!str[i+1]) return 1;
        if (Strxfrm(str[i+1], str[i], l+1) != l) printf("Aaargh!\n");
        /*d = strcoll(str[i], str[0]);
        d2 = strcmp(strx[i], strx[0]);
        printf("\"%s\" -> \"%s\"\n", str[i], strx[i]);
        if (d < 0 && d2 >= 0 || d == 0 && d2 != 0 || d > 0 && d2 <= 0)
            printf("Whoops\n");*/
    }

    qsort(str, 10000, 8, compare);

    for (i=0; i<10000; i++)
        printf("%s\n", str[i*2]);

    return 0;
}
