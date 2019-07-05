#ifndef __Desk_PopUp_h
#define __Desk_PopUp_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Wimp_h
	#include "Desk.Wimp.h"
#endif
typedef int Desk_popup_handle;
#define Desk_popup_ISLEAF   (0x01)
#define Desk_popup_ISSTATIC (0x02)
#define Desk_popup_STANDALONE (0x00)
#define Desk_popup_MENULEAF   (0x01)
#define Desk_popup_STATIC     (0x02)
typedef struct
{
  int mul, div;
  int minmul, maxmul;
  int mindiv, maxdiv;
} Desk_popup_magnify;
typedef struct
{
  char appname[32];
  char purpose[32];
  char author[32];
  char version[32];
} Desk_popup_proginfo;
typedef struct
{
  struct
  {
    unsigned int cancel     : 1;    
    unsigned int ok         : 1;    
    unsigned int reserved   : 6;
    unsigned int userhandle : 24;   
  } flags;
  char oktext[12];                  
  char canceltext[12];              
  char appname[12];                 
  char message[188];                
} Desk_popup_report;
typedef struct
{
  char iconsprite[12];              
char filename[212]; 
} Desk_popup_saveas; 
typedef struct
{
struct
{ 
unsigned int wasdragged : 1; 
unsigned int shiftdown : 1; 
    unsigned int reserved   : 30;
  } flags;
  int  reserved;
  char filename[212];              
} Desk_popup_saveasreturn;
typedef struct
{
  char colour;                     
} Desk_popup_wimpcolour;
typedef struct
{
  unsigned int transparency : 8;
  unsigned int red          : 8;
  unsigned int green        : 8;
  unsigned int blue         : 8;
} Desk_colour_rgb;
typedef struct
{
  unsigned int value        : 8;    
  unsigned int saturation   : 8;    
  unsigned int hue          : 16;   
} Desk_colour_hsv;
typedef struct
{
  unsigned int key          : 8;
  unsigned int yellow       : 8;
  unsigned int magenta      : 8;
  unsigned int cyan         : 8;
} Desk_colour_cmyk;
#define Desk_popuptc_RGB  0
#define Desk_popuptc_HSV  1
#define Desk_popuptc_CMYK 2
#define Desk_popuptc_TRANSPARENT0   0x00000
#define Desk_popuptc_TRANSPARENT1   0x10000
#define Desk_popuptc_TRANSPARENT256 0x20000
typedef struct
{
  int colourmodel;                
  union
  {
    Desk_colour_rgb  rgb;
    Desk_colour_hsv  hsv;
    Desk_colour_cmyk cmyk;
  } colour;
 
  int transparency;                 
} Desk_popup_truecolour;
typedef struct
{
  char       name[12];              
  Desk_wimp_point openpos;               
  char       flags;                 
  char       reserved1, reserved2, reserved3;
} Desk_popup_header;
typedef union
{
  Desk_popup_magnify    magnify;
  Desk_popup_proginfo   proginfo;
  Desk_popup_report     report;
  Desk_popup_saveas     saveas;
  Desk_popup_wimpcolour wimpcolour;
  Desk_popup_truecolour truecolour;
} Desk_popup_data;                               
typedef struct
{
  Desk_popup_magnify    magnify;
  Desk_popup_report     report;
  Desk_popup_saveas     saveasreturn;
  Desk_popup_wimpcolour wimpcolour;
  Desk_popup_truecolour truecolour;
} Desk_popup_returndata;                     
typedef struct
{
  Desk_window_handle window;                
  Desk_wimp_point    openpos;               
} Desk_message_popuprequest;
typedef struct
{
  Desk_popup_handle     handle;                
  char             name[12];              
  Desk_popup_returndata data;                  
} Desk_message_popupstate;
typedef struct
{
  Desk_popup_header header;
  Desk_popup_data   data;
} Desk_popup_block;                                
extern Desk_popup_handle Desk_PopUp_Open(Desk_popup_block *params);
  
extern void Desk_PopUp_Close(Desk_popup_handle handle);
extern Desk_popup_handle Desk_PopUp_ShowMenuLeaf(char *name, Desk_popup_data *definition,
                                       Desk_message_menuwarn *msg);
 
extern Desk_popup_handle Desk_PopUp_ShowPtr(char *name, Desk_bool isstatic,
                                  Desk_popup_data *definition);
 
#define Desk_PopUp_ShowStandalone(N, D) Desk_PopUp_ShowPtr(N, 0, D)
#define Desk_PopUp_ShowStatic(N, D) Desk_PopUp_ShowPtr(N, 1, D)
#ifdef __cplusplus
}
#endif
 
#endif
