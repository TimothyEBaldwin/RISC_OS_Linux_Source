#ifndef __Desk_Module_h
#define __Desk_Module_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#include "stdbool.h"
extern void Desk_Module_Claim(unsigned size, void **block);
extern void Desk_Module_Free(void *block);
typedef struct Desk_module_info
{
char titlestring[120];
char helpstring[120];
enum
{
Desk_module_notfound,
Desk_module_found,
Desk_module_inrom
} status;
} Desk_module_info;
double Desk_Module_VersionString(char *string);
int Desk_Module_InfoDisc(char *path,Desk_module_info *result);
bool Desk_Module_EnsureSWI( char const *swiname);
#ifdef __cplusplus
}
#endif
#endif
