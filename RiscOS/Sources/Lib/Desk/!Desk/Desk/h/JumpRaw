#ifndef __Desk_JumpRaw_h
#define __Desk_JumpRaw_h
#ifdef __cplusplus
	extern "C" {
#endif
#include <setjmp.h>
#ifndef __Desk_Debug_h
	#include "Desk/Debug.h"
#endif
typedef struct {
jmp_buf jmpbuf;
#ifdef Desk__using_SDLS
int Desk_jump__sdls_stackptr;
#endif
}
Desk_jump_buf;
#ifdef Desk__using_SDLS
#include "Desk.Core.h"
#define Desk_Jump_SetJmp( buf) ((buf).Desk_jump__sdls_stackptr=_dll_setjmp(), setjmp( (buf).jmpbuf))
#define Desk_Jump_ReceiveLongJmp( buf) _dll_longjmped( (buf).Desk_jump__sdls_stackptr)
#else
#define Desk_Jump_SetJmp( buf) setjmp( (buf).jmpbuf)
#define Desk_Jump_ReceiveLongJmp( buf)
#endif
#define Desk_Jump_LongJmp( buf, val) longjmp( (buf).jmpbuf, val)
typedef struct Desk_jumpauto_buf {
Desk_jump_buf jumpbuf;
struct Desk_jumpauto_buf* previous;
}
Desk_jumpauto_buf;
#ifdef Desk__using_SDLS
	extern Desk_jumpauto_buf**	Desk_Jump__Ref_autonewestbuf( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_Jump)
	#define	Desk_jumpauto_newestbuf	(*Desk_Jump__Ref_autonewestbuf())
#else
	extern	Desk_jumpauto_buf	*Desk_jumpauto_newestbuf;
#endif
#define	Desk_JumpAuto__EscapeFromNestedTryUsingReturnOrBreak()	\
	(Desk_jumpauto_newestbuf!=&Desk_jumpauto__localbuf)
#define	Desk_JumpAuto__Push( jumpautobuf)			\
	(jumpautobuf).previous = Desk_jumpauto_newestbuf;	\
	Desk_jumpauto_newestbuf = &(jumpautobuf)
#define Desk_JumpAuto__Pop( jumpautobuf) \
Desk_jumpauto_newestbuf = (jumpautobuf).previous
#define	Desk_JumpAuto_Try								\
	{										\
	Desk_jumpauto_buf	Desk_jumpauto__localbuf;				\
	volatile int	Desk_jumpauto_val;						\
	Desk_JumpAuto__Push( Desk_jumpauto__localbuf);					\
	Desk_jumpauto_val = Desk_Jump_SetJmp( Desk_jumpauto__localbuf.jumpbuf);		\
		\
	if (!Desk_jumpauto_val)	{
#define	Desk_JumpAuto_Catch									\
				\
			\
		Desk_JumpAuto__Pop( Desk_jumpauto__localbuf);					\
		}									\
	else	{									\
							\
		Desk_JumpAuto__Pop( Desk_jumpauto__localbuf);					\
		Desk_Jump_ReceiveLongJmp( Desk_jumpauto__localbuf.jumpbuf);
#define	Desk_JumpAuto_EndCatch	\
		}		\
	}
#define	Desk_JumpAuto_Throw( val)		Desk_Jump_LongJmp( Desk_jumpauto_newestbuf->jumpbuf, val)
#define Desk_JumpAuto_TryCatch( trycode, catchcode) \
Desk_JumpAuto_Try { trycode } \
Desk_JumpAuto_Catch { catchcode } \
Desk_JumpAuto_EndCatch
#ifdef __cplusplus
	}
#endif
#endif
