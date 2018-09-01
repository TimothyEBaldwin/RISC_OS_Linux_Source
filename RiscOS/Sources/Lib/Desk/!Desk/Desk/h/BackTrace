#ifndef __Desk_BackTrace_h
#define __Desk_BackTrace_h
#include <stdio.h>
#include "kernel.h"
#ifdef __cplusplus
	extern "C"	{
#endif
void	Desk_BackTrace_SupportCurrentFrame( _kernel_unwindblock *frame);
void	Desk_BackTrace_OutputToStdErr( void);
void	Desk_BackTrace_OutputToStreamWithPrefix( FILE* stream, const char* prefix);
typedef int (*Desk_backtrace_printf_fn)( void* reference, const char* format, ...);
void	Desk_BackTrace_OutputToFFunctionWithPrefix( Desk_backtrace_printf_fn fn, void* reference, const char* prefix);
extern unsigned int	Desk_BackTrace_GetPC( void);
extern unsigned int	Desk_BackTrace_GetSL( void);
extern unsigned int Desk_BackTrace_GetPC2(void);
int	Desk_BackTrace_GetNestingDepth( void);
typedef struct	{
	int		n;
	unsigned int**	functions;
	}
	Desk_BackTrace_functionlist;
#define	Desk_BackTrace_MAXFNS 256
const Desk_BackTrace_functionlist*	Desk_BackTrace_GetCurrentFunctions( void);
const char*	Desk_BackTrace_GetFunctionName( const void* ptr);
#ifdef __cplusplus
}
#endif
#endif
