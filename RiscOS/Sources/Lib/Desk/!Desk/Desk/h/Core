#ifndef __Desk_Core_h
#define __Desk_Core_h
#ifdef __cplusplus
extern "C" {
#endif
typedef enum {
Desk_bool_FALSE = 0,
Desk_FALSE = 0,
Desk_bool_TRUE = 1,
Desk_TRUE = 1
}
Desk_bool;
#include <stddef.h>
#if (defined(__CC_NORCROFT) || defined(__GNUC__))
#include "kernel.h"
typedef _kernel_oserror Desk_os_error;
#else
typedef struct
{
int errnum;
char errmess[252];
}
Desk_os_error;
#endif
#define Desk_UNUSED_ARG(x) ((x) = (x))
#define Desk_UNUSED(x) ((x) = (x))
#ifndef Desk_MAX
#define Desk_MAX(x, y) ((x) > (y) ? (x) : (y))
#define Desk_MIN(x, y) ((x) < (y) ? (x) : (y))
#endif
#if defined( Desk_SDLS_CLIENT) || defined( _DLL)
  #define Desk__using_SDLS
#endif
#if defined( Desk__MODULE_CLIENT) || defined( _DLL)
	#define Desk__Zm
#endif
#ifdef _DLL
  #define __wimp_h
  #define __os_h
  #include "DLLLib.dll.h"
  #define Desk_SDLS_dllEntry( FnName) _dllEntry( FnName)
  #define Desk_SDLS_PtrFn( staticextern, returntype, FnName)    \
  extern returntype _dllEntry( FnName) ;                            \
  extern returntype FnName
#else
  #define Desk_SDLS_dllEntry( FnName) FnName
  #define Desk_SDLS_PtrFn( staticextern, returntype, FnName) \
  staticextern returntype FnName
#endif
#ifdef __cplusplus
}
#endif
#endif
