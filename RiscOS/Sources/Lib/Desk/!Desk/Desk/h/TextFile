#ifndef __Desk_TextFile_h
#define __Desk_TextFile_h
#ifdef __cplusplus
extern "C" {
#endif
#include <stdio.h>
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#define Desk_TextFile_Lowercase(x) (((x)>='A' && (x)<='Z') ? (x)+32 : (x))
extern void Desk_TextFile_SkipBlanks(FILE *infile);
extern void Desk_TextFile_GetToken(FILE *infile, char delimiter,
char *token, Desk_bool lowercase);
extern void Desk_TextFile_ReadToDelimiter(FILE *infile, char delimiter,
char *line, int maxlength);
#ifdef __cplusplus
}
#endif
#endif
