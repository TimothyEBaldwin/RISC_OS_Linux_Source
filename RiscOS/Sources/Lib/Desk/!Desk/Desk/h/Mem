#ifndef __Desk_Mem_h
#define __Desk_Mem_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
typedef void *Desk_mem_anchor;
  extern int Desk_mem_autocompact;
typedef enum
{
  Desk_mem_NOCOMPACT   = 0,             
  Desk_mem_FASTCOMPACT = 1,             
  Desk_mem_PARTCOMPACT = 1,
  Desk_mem_FULLCOMPACT = 2              
} Desk_mem_compaction;
  
extern Desk_bool Desk_Mem_Initialise(void);
  
extern Desk_bool Desk_Mem_Alloc(Desk_mem_anchor *anchor, int numbytes);
  
extern Desk_bool Desk_Mem_MidExtend(Desk_mem_anchor *anchor, int at, int by);
  
extern void Desk_Mem_MoveAnchor(Desk_mem_anchor *from, Desk_mem_anchor *to);
  
extern void Desk_Mem_Free(Desk_mem_anchor *anchor);
  
extern void Desk_Mem_Compact(void);
  
extern int  Desk_Mem_Size(Desk_mem_anchor *anchor);
  
extern Desk_bool Desk_Mem_CheckHeap(void);
extern int Desk_Mem_DontBudge(int n, void **a);
#ifdef Desk_DeskLib_DEBUG
#ifdef Desk__making_Mem
#include "Debug.h"
#define Desk_debug_level Desk_mem_debuglevel
#endif
extern int Desk_mem_debuglevel;
#endif
#ifdef __cplusplus
}
#endif
 
#endif
