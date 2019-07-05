#ifndef __Desk_Export_h
#define __Desk_Export_h
#ifndef __Desk_wimp_h
#include "Desk.Wimp.h"
#endif
typedef int (*Desk_export_filesaver)( const char *filename, void *reference);
typedef int (*Desk_export_ramsaver)( Desk_message_block* ramfetch, int progress, void* reference);
typedef enum	{
	Desk_export_result_OK	= 0,
	Desk_export_result_RECEIVERFAILED,
	Desk_export_result_FILESAVERFAILED,
	Desk_export_result_RAMSAVERFAILED
	}
	Desk_export_result;
typedef void (*Desk_export_resulthandler)( Desk_export_result result, void *reference);
void	Desk_Export_ExportData(
			Desk_event_pollblock*		event,		
			Desk_mouse_block*		mouse,		
const char* leafname,
Desk_export_filesaver filesaver,
Desk_export_ramsaver ramsaver,
Desk_export_resulthandler resulthandler,
size_t estimatedsize,
int filetype,
void* reference
);
void Desk_Export_ExportData2(
Desk_event_pollblock* event, 
Desk_mouse_block* mouse, 
const char* leafname,
Desk_export_filesaver filesaver,
Desk_export_ramsaver ramsaver,
Desk_export_resulthandler resulthandler,
size_t estimatedsize,
int filetype,
void* reference,
Desk_message_action initial_messageaction,
Desk_task_handle destination
);
#endif
