#ifndef __Desk_Import_h
#define __Desk_Import_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
typedef void (*Desk_import_fileimporter)( Desk_message_dataload *data, void *reference);
typedef void *Desk_import_ramimporter;
void Desk_Import_RegisterFileLoader(
Desk_import_fileimporter fn,
Desk_import_ramimporter ramfn,
Desk_window_handle window,
Desk_icon_handle icon,
void *reference
);
#ifdef __cplusplus
}
#endif
#endif
