#ifndef __Desk_Debug_h
#define __Desk_Debug_h
#ifdef __cplusplus
	extern "C" {
#endif
#include <stdio.h>
#include <stdarg.h>
#ifndef __Desk_Core_h
	#include "Desk.Core.h"
#endif
typedef void (*Desk_debug_signalhandlerfn)( int sig, void *reference);
#if !defined( Desk_DEBUG) && !defined( Desk__making_Debug)
	#define Desk_Debug_Initialise()
	
	#define Desk_Debug_InitialiseSignal()
	#define Desk_Debug_ClaimSignal( fn, reference)
	#define Desk_Debug_ReleaseSignal()
	
	#define	Desk_Debug_Finalise()
	
	#define Desk_Debug_Assert( expression)
	
	#define Desk_Debug_Error_CheckFatal( errfn)	Desk_Error_CheckFatal( errfn)
	
	#define Desk_Debug_Print( text)
	
	#define	Desk_Debug_DumpRegistersToFile()
	
	#define	Desk_Debug_SetNestingIndentation( indentstring)
	
	#define	Desk_Debug_DescribeError2( error)
	
	#define	Desk_Debug_SetLevel( level)
	
	#define	Desk_Debug_BackTrace()
	#define	Desk_Debug_PrintMemory( start, size)
	
	#define Desk_Debug_Printf 	Desk_Debug_Dummyf
	#define Desk_Debug1_Printf	Desk_Debug_Dummyf
	#define Desk_Debug2_Printf	Desk_Debug_Dummyf
	#define Desk_Debug3_Printf 	Desk_Debug_Dummyf
	#define Desk_Debug4_Printf 	Desk_Debug_Dummyf
	#define Desk_Debug5_Printf 	Desk_Debug_Dummyf
	
	#define Desk_Debug_VPrintf 	Desk_Debug_Dummyf
	#define Desk_Debug1_VPrintf	Desk_Debug_Dummyf
	#define Desk_Debug2_VPrintf	Desk_Debug_Dummyf
	#define Desk_Debug3_VPrintf 	Desk_Debug_Dummyf
	#define Desk_Debug4_VPrintf 	Desk_Debug_Dummyf
	#define Desk_Debug5_VPrintf 	Desk_Debug_Dummyf
	
	#define	Desk_Debug_RedirectToFilename( filename)
	
	
#else
	
	void	Desk_Debug_Initialise( void);
	
	
	void	Desk_Debug_Finalise( void);
	
	
	void	Desk_Debug_InitialiseSignal( void);
	
	
	void	Desk_Debug_ClaimSignal( Desk_debug_signalhandlerfn fn, void *reference);
	
	
	void	Desk_Debug_ReleaseSignal( void);
	
	
	int	Desk_Debug_Printf( const char *format, ...);
	
	
	int	Desk_Debug_VPrintf( const char *format, va_list va);
	
	
	void	Desk_Debug_Print( const char *text);
	
	
	void	Desk_Debug_DumpRegistersToFile( void);
	
	
	void	Desk_Debug_SetNestingIndentation( const char* prefix);
	
	
	struct Desk_error2_block;
	void	Desk_Debug_DescribeError2( const struct Desk_error2_block* error);
	
	
	
	#define	Desk_Debug_SetLevel( level)	Desk_debug_level = (level)
	
	
	int	Desk_Debug_PrintfRef( void* reference, const char *format, ...);
	
	
	
	void	Desk_Debug_BackTrace( void);
	
	
	
	
	#define Desk_Debug_Error_CheckFatal( errfn)		\
		do	{					\
			Desk_os_error	*Desk_debug__e = errfn;	\
				if ( Desk_debug__e)	{	\
				Desk_Error_ReportFatal( 	\
					Desk_debug__e->errnum, 	\
					Desk_error_PLACE "%s", 	\
					Desk_debug__e->errmess	\
					);			\
				}				\
			}					\
			while (0)
	
	
	void	Desk_Debug__Assert( const char *expression, const char *sourcefile, int line);
	
	
	
	void	Desk_Debug_PrintMemory( void* start, int size);
	
	void	Desk_Debug_RedirectToFilename( const char* filename);
	
	
	#define Desk_Debug_Assert( expression)					\
		(								\
			(expression) 						\
				? 						\
				(void) 0	 				\
				: 						\
				Desk_Debug__Assert( #expression, __FILE__, __LINE__)	\
		)
	
	
	#define Desk_Debug1_Printf (Desk_debug_level<1) ? 0 : Desk_Debug_Printf
	
	
	#define Desk_Debug2_Printf (Desk_debug_level<2) ? 0 : Desk_Debug_Printf
	
	
	#define Desk_Debug3_Printf (Desk_debug_level<3) ? 0 : Desk_Debug_Printf
	
	
	#define Desk_Debug4_Printf (Desk_debug_level<4) ? 0 : Desk_Debug_Printf
	
	
	#define Desk_Debug5_Printf (Desk_debug_level<5) ? 0 : Desk_Debug_Printf
	
	
	
	
#endif
#define Desk_Debug_Dummyf (Desk_bool_TRUE) ? 0 : printf
extern int	Desk_debug_level;
#ifdef __cplusplus
}
#endif
#endif
