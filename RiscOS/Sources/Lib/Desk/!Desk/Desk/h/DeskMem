#ifndef __Desk_DeskMem_h
#define __Desk_DeskMem_h
#ifdef __cplusplus
extern "C" {
#endif
#include <stdlib.h>
#include <stddef.h>
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
void *Desk_DeskMem_Malloc( size_t size);
void	*Desk_DeskMem_Calloc( size_t num, size_t size);
void *Desk_DeskMem_Realloc( void *ptr, size_t size);
void	Desk_DeskMem_Free( void *ptr);
#define Desk_DeskMem_MallocType( type)	(type *) Desk_DeskMem_Malloc( sizeof( type))
#define	Desk_DeskMem_CallocType( n, type)	((type *) Desk_DeskMem_Calloc( n, sizeof( type)))
typedef struct Desk_deskmem_errorblock	{
	size_t	size;
	void*	ptr;
	}
	Desk_deskmem_errorblock;
#ifdef Desk__using_SDLS
extern Desk_deskmem_errorblock* Desk_DeskMem__Ref_errorblock( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_DeskMem)
#define Desk_deskmem_globalerror (*Desk_DeskMem__Ref_errorblock())
#else
extern Desk_deskmem_errorblock Desk_deskmem_globalerror;
#endif
#ifdef Desk_DeskLib_DEBUG
extern int Desk_deskmem_debuglevel;
#endif
typedef void*	(*Desk_deskmem_mallocfn)	( size_t);		
typedef void*	(*Desk_deskmem_reallocfn)	( void *, size_t);	
typedef void*	(*Desk_deskmem_callocfn)	( size_t, size_t);	
typedef void	(*Desk_deskmem_freefn)	( void *);		
typedef struct	{
	Desk_deskmem_mallocfn	malloc;
	Desk_deskmem_reallocfn	realloc;
	Desk_deskmem_callocfn	calloc;
	Desk_deskmem_freefn		free;
	}
	Desk_deskmem_functionsblock;
void	Desk_DeskMem_SetAllocFunctions(
		Desk_deskmem_mallocfn	m,
		Desk_deskmem_reallocfn	r,
		Desk_deskmem_callocfn	c,
		Desk_deskmem_freefn		f,
		Desk_deskmem_functionsblock*	oldfunctions
		);
#ifdef Desk__using_SDLS
	extern	Desk_deskmem_functionsblock*	Desk_DeskMem__Ref_functionsblock( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_DeskMem)
	#define	Desk_deskmem__functions	(*Desk_DeskMem__Ref_functionsblock())
#else
	extern	Desk_deskmem_functionsblock	Desk_deskmem__functions;
#endif
#define Desk_DeskMem_RawMalloc( size) (Desk_deskmem__functions.malloc( size))
#define Desk_DeskMem_RawRealloc( ptr, size) (Desk_deskmem__functions.realloc( ptr, size))
#define Desk_DeskMem_RawCalloc( num, size) (Desk_deskmem__functions.calloc( num, size))
#define Desk_DeskMem_RawFree( ptr) (Desk_deskmem__functions.free( ptr))
typedef struct {
void* data;
int size;
int datasize;
int increment;
}
Desk_deskmem_buffer;
void Desk_DeskMem_BufferInit( Desk_deskmem_buffer* buffer, int increment);
void Desk_DeskMem_BufferFree( Desk_deskmem_buffer* buffer);
void	Desk_DeskMem_BufferEnsure( Desk_deskmem_buffer* buffer, int min);
void	Desk_DeskMem_BufferEnsureExtra( Desk_deskmem_buffer *buffer, int extra);
#define	Desk_DeskMem_BufferGetSize( buffer)	( (buffer)->size)
#define	Desk_DeskMem_BufferGetDataSize( buffer)	( (buffer)->datasize)
#define Desk_DeskMem_BufferGetString( buffer)	( (char*) (buffer)->data)
#define Desk_DeskMem_BufferGetIntArray( buffer)	( (int*) (buffer)->data)
#define Desk_DeskMem_BufferGetDoubleArray( buffer)	( (double*) (buffer)->data)
void	Desk_DeskMem_BufferStrCat( Desk_deskmem_buffer* buffer, const char* extra);
void	Desk_DeskMem_BufferStrNCat( Desk_deskmem_buffer* buffer, const char* extra, int extralen);
void	Desk_DeskMem_BufferStrCpy( Desk_deskmem_buffer* buffer, const char* s);
void	Desk_DeskMem_BufferMidExtend( Desk_deskmem_buffer* buffer, int at, int by);
#ifdef __cplusplus
}
#endif
#endif
