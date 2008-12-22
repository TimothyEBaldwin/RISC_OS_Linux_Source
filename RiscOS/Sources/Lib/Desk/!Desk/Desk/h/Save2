#ifndef __Desk_Save2_h
#define __Desk_Save2_h
#ifdef __cplusplus
extern "C" {
#endif
#include <stddef.h>
#ifndef __Desk_Dialog2_h
#include "Desk.Dialog2.h"
#endif
#ifndef __Desk_Export_h
#include "Desk.Export.h"
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
typedef struct {
Desk_dialog2_block* dialog2;
Desk_icon_handle dragsprite;
Desk_icon_handle filenameicon;
Desk_export_filesaver filesaver;
Desk_export_ramsaver ramsaver;
Desk_export_resulthandler resulthandler;
size_t estimatedsize;
int filetype;
void* reference;
int dragbutton;
}
Desk_save2_block;
Desk_save2_block* Desk_Save2_Create(
Desk_dialog2_block* dialog2,
Desk_icon_handle dragsprite,
Desk_icon_handle filenameicon,
Desk_export_filesaver filesaver,
Desk_export_ramsaver ramsaver,
Desk_export_resulthandler resulthandler,
size_t estimatedsize,
int filetype,
void* reference
);
#ifdef __cplusplus
	}
#endif
#endif
