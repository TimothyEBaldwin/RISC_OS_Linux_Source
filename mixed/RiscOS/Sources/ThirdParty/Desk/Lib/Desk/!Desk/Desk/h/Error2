#ifndef __Desk_Error2_h
#define __Desk_Error2_h
#ifdef __cplusplus
	extern "C" {
#endif
#include <stdio.h>
#include <stdarg.h>
#ifndef __Desk_Error_h
	#include "Error.h"
#endif
#ifndef __Desk_Jump_h
	#include "JumpRaw.h"
#endif
typedef enum	{
	Desk_error2_type_NONE		= 0,
	Desk_error2_type_MISC		= 1, 	
	Desk_error2_type_OSERROR	= 2, 	
	Desk_error2_type_DESKMEM	= 3, 	
	Desk_error2_type_SIGNAL		= 4, 	
	Desk_error2_type_MEM		= 5, 	
	Desk_error2_type_TEXT		= 6,	
	Desk_error2_type_WASSERT	= 7	
	}
	Desk_error2_type;
typedef struct	Desk_error2_block	{
	Desk_error2_type	type;
	union	{
		void*				misc;
		const Desk_os_error*			oserror;
		struct Desk_deskmem_errorblock*	deskmem;
		int				signal;
		
		const char*			text;
		struct Desk_wassert_error* wassert;
		}
		data;
	}
	Desk_error2_block;
void	Desk_Error2_Init_JumpSig( void);
void	Desk_Error2_Handle( Desk_error2_block* error);
#define Desk_Error2_Try Desk_JumpAuto_Try
#define Desk_Error2_Catch Desk_JumpAuto_Catch
#define Desk_Error2_EndCatch Desk_JumpAuto_EndCatch
#define Desk_Error2_TryCatch Desk_JumpAuto_TryCatch
Desk_error2_block *Desk_Error2_Exit( Desk_error2_block *error);
Desk_error2_block	*Desk_Error2_VerboseExit( Desk_error2_block *error);
typedef int (*Desk_Error2_vprintf_fn)( void* reference, const char* format, va_list va);
typedef int (*Desk_Error2_printf_fn)( void* reference, const char* format, ...);
void Desk_Error2_VDescribe( Desk_Error2_vprintf_fn fn, void* reference, const Desk_error2_block* error);
void Desk_Error2_FDescribe( Desk_Error2_printf_fn fn, void* reference, const Desk_error2_block* error);
void Desk_Error2_Describe( FILE* stream, const Desk_error2_block* error);
typedef Desk_error2_block* (*Desk_error2_handler)( Desk_error2_block *error);
#define Desk_error2_HANDLED (NULL)
#define Desk_Error2_SetHandler( handlerfn) Desk_error2__handlerfn = (handlerfn)
#define Desk_Error2_GetHandler() Desk_error2__handlerfn
int Desk_Error2_GetNewErrorType( void);
void Desk_Error2_CheckOS( const Desk_os_error *error);
void Desk_Error2_CheckOS_Debug( const Desk_os_error *error, const char *place);
#if defined( Desk_DeskLib_DEBUG) && !defined( Desk__making_Error2)
#define Desk_Error2_CheckOS( oserror) Desk_Error2_CheckOS_Debug( oserror, Desk_error_PLACE)
#endif
void Desk_Error2_CheckBOOL( Desk_bool error);
void Desk_Error2_HandleText( const char* text);
void Desk_Error2_HandleTextf( const char* text, ...);
void	Desk_Error2_SignalHandler( int signalnumber);
void Desk_Error2_HandleAllSignals( void);
void Desk_Error2_ClearErrorBlock( Desk_error2_block *error);
#ifdef Desk__using_SDLS
extern Desk_error2_block* Desk_Error2__Ref_globalblock( void);
extern Desk_error2_handler* Desk_Error2__Ref__handlerfn( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_Error2)
#define Desk_error2_globalblock (*Desk_Error2__Ref_globalblock())
#define Desk_error2__handlerfn (*Desk_Error2__Ref__handlerfn())
#else
extern Desk_error2_block Desk_Error2_globalblock;
extern Desk_error2_handler Desk_error2__handlerfn;
#endif
#define Desk_Error2_ReThrow() Desk_Error2_Handle( &Desk_Error2_globalblock)
extern const char *Desk_Error2_signalnames[];
void Desk_Error2_ConvertToOS( Desk_os_error* oserror, Desk_error2_block* error2);
#define Desk_Error2_ConvertToOS2() (Desk_Error2_ConvertToOS( &Desk_error_global, &Desk_Error2_globalblock), &Desk_error_global)
void Desk_Error2_MsgTransInit( const char* filename);
void Desk_Error2_MsgTransFinal( void);
void Desk_Error2_MsgTransHandle( const char* token, const char* p0, const char* p1, const char* p2, const char* p3);
void Desk_Error2_MsgTransHandle0( const char* token);
void Desk_Error2_MsgTransHandlef( const char* token, ...);
#ifdef __cplusplus
}
#endif
#endif
