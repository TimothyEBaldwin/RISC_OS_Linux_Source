#ifndef __Desk_Error_h
#define __Desk_Error_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
extern void Desk_Error_ReportInternal(int errornum, const char *report, ...);
extern void Desk_Error_ReportFatalInternal(int errornum, const char *report, ...);
extern void Desk_Error_Report(int errornum, const char *report, ...);
extern void Desk_Error_ReportFatal(int errornum, const char *report, ...);
extern Desk_bool Desk_Error_Check( const Desk_os_error *error);
extern void Desk_Error_CheckFatal( const Desk_os_error *error);
extern Desk_bool Desk_Error_OutOfMemory(Desk_bool fatal, const char *place);
#define Desk_error__SR(x)	Desk_error__VL(x)
#define Desk_error__VL(x)	#x
#define Desk_error_PLACE	"File '" __FILE__ "', line " Desk_error__SR( __LINE__) ". "
#ifdef Desk__using_SDLS
extern Desk_os_error *Desk_Error__Ref_global( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_Error)
#define Desk_error_global (*Desk_Error__Ref_global())
#else
extern Desk_os_error Desk_error_global;
#endif
#define Desk_error_FIXED( id, number, description) \
const struct { \
int errnum; \
char errmess[ 1 + sizeof( description)]; \
} \
id##_= { number, description}; \
Desk_os_error *id = (Desk_os_error *) &id##_
#define Desk_error_STATIC( id, number, description) \
  static const struct {                              \
    int  errnum;                              \
    char errmess[ 1 + sizeof( description)];  \
    }                                         \
  id##_= { number, description};              \
  static Desk_os_error *id = (Desk_os_error *) &id##_
#ifdef __cplusplus
}
#endif
#endif
