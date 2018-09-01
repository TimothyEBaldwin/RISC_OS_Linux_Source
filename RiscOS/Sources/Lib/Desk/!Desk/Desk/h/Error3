#ifndef __Desk_Error3_h
#define __Desk_Error3_h
#ifdef __cplusplus
extern "C" {
#endif
#include <stdio.h>
#include "Error2.h"
typedef void * Desk_error3_fnptr;
#define	Desk_Error3_UseError3()	Desk_Error2_SetHandler( Desk_Error3__Dispatch);
typedef Desk_error2_block*	(*Desk_error3_handler)( Desk_error2_block *error, void *reference);
void	Desk_Error3_ClaimFunction( Desk_error3_fnptr function, Desk_error3_handler handler, void *reference);
void	Desk_Error3_ClaimType( Desk_error2_type type, Desk_error3_handler handler, void *reference);
void	Desk_Error3_ClaimMisc( Desk_error3_handler handler, void *reference);
void	Desk_Error3_ReleaseFunction( Desk_error3_fnptr function, Desk_error3_handler handler, void *reference);
void Desk_Error3_ReleaseType( Desk_error2_type type, Desk_error3_handler handler, void *reference);
void	Desk_Error3_ReleaseMisc( Desk_error3_handler handler, void *reference);
Desk_error2_block* Desk_Error3__Dispatch( Desk_error2_block* error);
struct Desk_error3_defhandlerinfo
{
char fatalmessage[128];
char deskmemfail[52];
char assertfail[52];
};
Desk_error2_block * Desk_Error3_DefHandler(Desk_error2_block *error,
void *reference);
#ifdef __cplusplus
}
#endif
#endif
