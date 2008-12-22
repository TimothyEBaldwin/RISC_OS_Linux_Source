#ifndef __Desk_Import2_h
#define __Desk_Import2_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_wimp_h
#include "Desk.Wimp.h"
#endif
typedef struct {
void* reference; 
size_t ram_progress; 
Desk_message_block initialdatasave;
}
Desk_Import2_clientinfo;
typedef int (*Desk_Import2_fileimporter)( Desk_message_dataload* data, Desk_Import2_clientinfo* info);
typedef void* (*Desk_Import2_ramallocator)( size_t* buffsize, Desk_Import2_clientinfo* info);
typedef void (*Desk_Import2_ramhandler)( void* buffer, int numbytes, Desk_Import2_clientinfo* info);
void Desk_Import2_ImportData(
Desk_event_pollblock* event, 
Desk_Import2_fileimporter fileimporter,
Desk_Import2_ramallocator ramallocator,
Desk_Import2_ramhandler ramhandler,
void* reference
);
void Desk_Import2_ImportData2(
Desk_event_pollblock* event, 
Desk_Import2_fileimporter fileimporter,
Desk_Import2_ramallocator ramallocator,
Desk_Import2_ramhandler ramhandler,
void* reference,
const char* filename,
Desk_bool unsafe
);
#ifdef __cplusplus
}
#endif
#endif
