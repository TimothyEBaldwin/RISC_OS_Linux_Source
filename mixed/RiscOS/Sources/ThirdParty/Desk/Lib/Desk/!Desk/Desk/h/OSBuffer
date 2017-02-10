#ifndef __Desk_OSBuffer_h
#define __Desk_OSBuffer_h
typedef struct {
void* id;
void (*serviceroutine)( void);
void* pw;
}
Desk_osbuffer_block;
Desk_osbuffer_block* Desk_OSBuffer_Init( int bufferhandle);
void Desk_OSBuffer_Final( Desk_osbuffer_block* osbuffer);
int Desk_OSBuffer_InsertByte( Desk_osbuffer_block* osbuffer, int byte);
int Desk_OSBuffer_InsertBlock( Desk_osbuffer_block* osbuffer, void* data, int numbytes);
int Desk_OSBuffer_RemoveByte( Desk_osbuffer_block* osbuffer);
int Desk_OSBuffer_RemoveBlock( Desk_osbuffer_block* osbuffer, void* buffer, int numbytes);
int Desk_OSBuffer_ExamineByte( Desk_osbuffer_block* osbuffer);
int Desk_OSBuffer_ExamineBlock( Desk_osbuffer_block* osbuffer, void* buffer, int numbytes);
int Desk_OSBuffer_ReturnUsedSpace( Desk_osbuffer_block* osbuffer);
int Desk_OSBuffer_ReturnFreeSpace( Desk_osbuffer_block* osbuffer);
void Desk_OSBuffer_PurgeBuffer( Desk_osbuffer_block* osbuffer);
void* Desk_OSBuffer_NextFilledBlock( Desk_osbuffer_block* osbuffer, int* numbytes);
#endif
