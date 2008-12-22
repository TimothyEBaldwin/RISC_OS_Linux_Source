#ifndef __Desk_Print_h
#define __Desk_Print_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
#ifndef __Desk_PDriver_h
#include "Desk.PDriver.h"
#endif
typedef struct Desk_print_block {
void *reference; 
char *jobtitle; 
Desk_printer_info printerinfo; 
Desk_print_job job; 
Desk_print_job oldjob; 
}
Desk_print_block;
enum {
Desk_print_result_OK = 0, 
Desk_print_result_QUEUED, 
Desk_print_result_NEEDPRINTERMANAGER, 
Desk_print_result_PRINTERROR, 
Desk_print_result_SAVEFAILED, 
Desk_print_result_CANTSAVE, 
Desk_print_result_CANTOPENPRINTER, 
Desk_print_result_FAILED 
};
typedef int Desk_print_result;
typedef Desk_bool (*Desk_print_printfn)( Desk_print_block *print);
typedef Desk_bool (*Desk_print_savefn)( Desk_print_block *print, Desk_message_datasaveack *datasaveack);
typedef void (*Desk_print_resultfn)( Desk_print_block *print, Desk_print_result result);
void Desk_Print_StartPrint(
Desk_print_printfn printfn, 
Desk_print_savefn savefn, 
Desk_print_resultfn resulfn, 
void *reference, 
int filetype, 
int estsize, 
char *leafname, 
char *jobtitle
);
#ifdef __cplusplus
}
#endif
#endif
