#ifndef __Desk_Str_h
#define __Desk_Str_h
#ifdef __cplusplus
extern "C" {
#endif
#include <stddef.h>
extern int Desk_strlencr(const char *s);
extern int Desk_strcmpcr(const char *s1, const char *s2);
extern char *Desk_strcatcr(char *s1, const char *s2);
extern char *Desk_strcpycr(char *s1, const char *s2);
extern char *Desk_strncpycr(char *s1, const char *s2, int n);
extern char *Desk_Str_LeafName(const char *path);
#define Desk_LeafName Desk_Str_LeafName
extern int Desk_stricmp(const char *s1, const char *s2);
extern int Desk_strnicmp(const char *s1, const char *s2, size_t n);
extern int Desk_stricmpcr(const char *s1, const char *s2);
extern int Desk_strnicmpcr(const char *s1, const char *s2, size_t n);
extern char *Desk_strdup( const char *s);
extern void Desk_Str_MakeCR(char *s, int Desk_max_len);
extern void Desk_Str_MakeASCIIZ(char *s, int Desk_max_len);
extern char Desk_Str_MakeHex(int n);
extern int Desk_Str_DecodeHex(char digit);
extern char *Desk_Str_StrNCpy0( char *s1, const char *s2, int n);
#define Desk_strncpy0( s1, s2, n) Desk_Str_StrNCpy0( s1, s2, n)
char* Desk_Str_strdupcr( const char* s);
#ifdef __cplusplus
}
#endif
#endif
