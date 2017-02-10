#ifndef __Desk_LinkList_h
#define __Desk_LinkList_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
typedef struct Desk_linklist_header
{
  struct Desk_linklist_header *next;
  struct Desk_linklist_header *previous;
} Desk_linklist_header ;
extern void Desk_LinkList_AddToHead(Desk_linklist_header *anchor, Desk_linklist_header *item);
extern void Desk_LinkList_AddToTail(Desk_linklist_header *anchor, Desk_linklist_header *item);
extern void Desk_LinkList_InsertBefore(Desk_linklist_header *anchor,
                                  Desk_linklist_header *pos,
                                  Desk_linklist_header *item);
extern void Desk_LinkList_InsertAfter(Desk_linklist_header *anchor,
                                 Desk_linklist_header *pos,
                                 Desk_linklist_header *item);
extern Desk_bool Desk_LinkList_InList( const Desk_linklist_header *anchor, const Desk_linklist_header *item);
  
extern int Desk_LinkList_ListLength( const Desk_linklist_header *anchor);
  
extern void Desk_LinkList_Unlink(Desk_linklist_header *anchor, Desk_linklist_header *item);
  
#define Desk_LinkList_FirstItem(x) ((void *)(x)->next)
  
#define Desk_LinkList_LastItem(x) ((void *)(x)->previous)
  
#define Desk_LinkList_Init(x)  \
  {                       \
    (x)->next = NULL;     \
    (x)->previous = NULL; \
  }
  
#define Desk_LinkList_InitItem(x) \
  {                          \
    (x)->next = NULL;        \
    (x)->previous = NULL;    \
  }
  
#define Desk_LinkList_NextItem(x) ((void *) ((Desk_linklist_header *)(x))->next)
  
#define Desk_LinkList_PreviousItem(x) ((void *) ((Desk_linklist_header *)(x))->previous)
  
#ifdef __cplusplus
}
#endif
#endif
