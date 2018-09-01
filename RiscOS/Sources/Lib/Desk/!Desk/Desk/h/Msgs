#ifndef __Desk_Msgs_h
#define __Desk_Msgs_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
extern Desk_bool Desk_Msgs_Lookup(const char *tag, char *result, int maxlength);
extern void Desk_Msgs_printf(char *result, const char *formattag, ...);
extern Desk_bool Desk_Msgs_LoadFile(const char *leafname);
extern void Desk_Msgs_DropGroup(const char *grouptag);
extern void Desk_Msgs_Report(int errnum, const char *tag, ...);
extern void Desk_Msgs_ReportFatal(int errnum, const char *tag, ...);
 
#ifdef __cplusplus
}
#endif
#endif
