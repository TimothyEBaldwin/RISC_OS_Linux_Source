#ifndef __Desk_PDriver_h
#define __Desk_PDriver_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
typedef int Desk_print_job; 
typedef struct
{
int xx;
int xy;
int yx;
int yy;
} Desk_print_transformation; 
#define Desk_printdriver_POSTSCRIPT 0
#define Desk_printdriver_FX80 1
#define Desk_printdriver_LASERJET 2
#define Desk_printdriver_INTEGREX 3
#define Desk_printdriver_FAXMODEM 4
#define Desk_printdriver_DIRECTDRIVELASER 5
#define Desk_printdriver_CASPELGRAPHLANG 6
#define Desk_printdriver_PDUMPER 7
#define Desk_printdriver_EPSONJX 99
#define Desk_printdriver_STARLC10 99
#define Desk_printdriver_PAINTJET 99
#define Desk_printfeat_COLOUR 0x00000001
#define Desk_printfeat_LIMITED 0x00000002
#define Desk_printfeat_DISCRETE 0x00000004
#define Desk_printfeat_NOFILL 0x00000100
#define Desk_printfeat_NOTHICKNESS 0x00000200
#define Desk_printfeat_NOOVERWRITE 0x00000400
#define Desk_printfeat_TRANSSPRITE 0x00000800
#define Desk_printfeat_NEWFONTMANAGER 0x00001000
#define Desk_printfeat_SCREENDUMP 0x01000000
#define Desk_printfeat_TRANSFORMS 0x02000000
#define Desk_printfeat_ILLUSTRATIONS 0x04000000
#define Desk_printfeat_MISCOP 0x08000000
#define Desk_printfeat_SETDRIVER 0x10000000
#define Desk_printfeat_DECLAREFONT 0x20000000
typedef union
{
int value;
struct
{
unsigned int colour : 1;
unsigned int limited : 1;
unsigned int discrete : 1;
unsigned int filler1 : 5; 
unsigned int nofill : 1;
unsigned int nothickness : 1;
unsigned int nooverwrite : 1;
unsigned int transsprite : 1;
unsigned int newfontmanager : 1;
unsigned int filler2 : 3; 
unsigned int filler3 : 8; 
unsigned int screendump : 1;
unsigned int transforms : 1;
unsigned int illustrations : 1;
unsigned int miscop : 1;
unsigned int setdriver : 1;
unsigned int declarefont : 1;
unsigned int filler4 : 2; 
} data;
} Desk_print_features;
typedef struct
{
unsigned int version : 16;
int drivertype : 16;
Desk_wimp_point resolution;
Desk_print_features features;
char *description;
Desk_wimp_point Desk_halftone_res;
int Desk_id_number;
} Desk_printer_info; 
void Desk_PDriver_Info(Desk_printer_info *block);
extern char *Desk_PDriver_PrinterName(void);
Desk_os_error *Desk_PDriver_CheckFeatures(Desk_print_features mask, Desk_print_features value);
void	Desk_PDriver_PageSize(Desk_wimp_point *size, Desk_wimp_rect *printable);
void	Desk_PDriver_SelectJob(Desk_print_job newjob, char *title, Desk_print_job *oldjob);
void	Desk_PDriver_CurrentJob(Desk_print_job *current);
void	Desk_PDriver_EndJob(Desk_print_job job);
void	Desk_PDriver_AbortJob(Desk_print_job job);
void	Desk_PDriver_GiveRectangle(int Desk_rectangle_id, Desk_wimp_rect *rectangle,
                                Desk_print_transformation *matrix,
                                Desk_wimp_point *position,
                                unsigned int Desk_background_colour);
void	Desk_PDriver_DrawPage(int copies, Desk_wimp_rect *Desk_rectangle_to_print,
                           int Desk_sequence_no, char *page,
                           int *finished, int *Desk_rectangle_id);
void	Desk_PDriver_GetRectangle(Desk_wimp_rect *Desk_rectangle_to_print,
                               int *finished, int *Desk_rectangle_id);
void	Desk_PDriver_CancelJob(Desk_print_job job);
void	Desk_PDriver_ScreenDump(Desk_print_job job);
void	Desk_PDriver_EnumerateJobs(Desk_print_job *handle);
void	Desk_PDriver_CancelJobWithError(Desk_print_job job, Desk_os_error *error);
void	Desk_PDriver_SelectIllustration(Desk_print_job newjob, char *title,
                                     Desk_print_job *oldjob);
void	Desk_PDriver_InsertIllustration(int Desk_illustration_handle, void *drawpath,
                                     Desk_wimp_point *Desk_bottom_left,
                                     Desk_wimp_point *Desk_bottom_right,
                                     Desk_wimp_point *Desk_top_left);
#ifdef __cplusplus
}
#endif
#endif
