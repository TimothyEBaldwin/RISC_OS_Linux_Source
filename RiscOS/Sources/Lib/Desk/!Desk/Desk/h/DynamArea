#ifndef __Desk_DynamArea_h
#define __Desk_DynamArea_h
#ifdef __cplusplus
extern "C" {
#endif
typedef struct Desk_DynamicArea_block {
int id; 
void* data; 
size_t datasize; 
size_t size; 
struct Desk_DynamicArea_block* previous; 
}
Desk_DynamicArea_block;
void Desk_DynamicArea_Create( Desk_DynamicArea_block* da, size_t maxsize, const char* name);
void	Desk_DynamicArea_Delete( Desk_DynamicArea_block* da);
void	Desk_DynamicArea_DeleteAll( void);
void*	Desk_DynamicArea_SetSize( Desk_DynamicArea_block* da, size_t size);
#define	Desk_DynamicArea_GetSize( da)		( (da)->size)
#define	Desk_DynamicArea_GetDataSize( da)	( (da)->datasize)
#define	Desk_DynamicArea_GetData( da)		( (da)->data)
#ifdef __cplusplus
}
#endif
#endif
