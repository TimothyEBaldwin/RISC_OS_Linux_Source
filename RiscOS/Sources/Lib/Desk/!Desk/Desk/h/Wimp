#ifndef __Desk_Wimp_h
#define __Desk_Wimp_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#define Desk_wimp_MAXNAME 12
typedef struct
{
int x, y;
} Desk_wimp_point;
typedef Desk_wimp_point Desk_wimp_coord;
typedef struct
{
Desk_wimp_point min;
Desk_wimp_point max;
} Desk_wimp_rect;
typedef Desk_wimp_rect Desk_wimp_box;
typedef int Desk_window_handle;
typedef int Desk_icon_handle;
typedef int Desk_task_handle;
#define Desk_colour_WHITE 0
#define Desk_colour_GREY0 0
#define Desk_colour_GREY1 1
#define Desk_colour_GREY2 2
#define Desk_colour_GREY3 3
#define Desk_colour_GREY4 4
#define Desk_colour_GREY5 5
#define Desk_colour_GREY6 6
#define Desk_colour_GREY7 7
#define Desk_colour_BLACK 7
#define Desk_colour_DARK_BLUE 8
#define Desk_colour_YELLOW 9
#define Desk_colour_GREEN 10
#define Desk_colour_RED 11
#define Desk_colour_CREAM 12
#define Desk_colour_ARMY_GREEN 13
#define Desk_colour_ORANGE 14
#define Desk_colour_LIGHT_BLUE 15
#define Desk_colour_TRANSPARENT 255
typedef union
{
int value;
struct
{
unsigned int wimpcolour : 4;
unsigned int gcolaction : 3;
unsigned int foreback : 1;
unsigned int padding : 24;
} data;
} Desk_wimp_colour;
typedef union
{
int value;
struct
{
char gcol;
char red;
char green;
char blue;
} data;
} Desk_palette_entry;
typedef struct
{
Desk_palette_entry colour[16];
Desk_palette_entry border;
Desk_palette_entry mouse1;
Desk_palette_entry mouse2;
Desk_palette_entry mouse3;
} Desk_palette_block;
#define Desk_iconbtype_NEVER 0
#define Desk_iconbtype_ALWAYS 1
#define Desk_iconbtype_AUTOREPEAT 2
#define Desk_iconbtype_CLICK 3
#define Desk_iconbtype_RELEASE 4
#define Desk_iconbtype_DOUBLECLICK 5
#define Desk_iconbtype_CLICKDRAG 6
#define Desk_iconbtype_RELEASEDRAG 7
#define Desk_iconbtype_DOUBLEDRAG 8
#define Desk_iconbtype_MENU 9
#define Desk_iconbtype_DOUBLECLICKDRAG 10
#define Desk_iconbtype_RADIO 11
#define Desk_iconbtype_RESERVED1 12
#define Desk_iconbtype_RESERVED2 13
#define Desk_iconbtype_WRITECLICKDRAG 14
#define Desk_iconbtype_WRITABLE 15
#define Desk_iconbar_RIGHT -1
#define Desk_iconbar_LEFT -2
#define Desk_window_ICONBAR -2
#define Desk_icon_TEXT 0x00000001 
#define Desk_icon_SPRITE 0x00000002 
#define Desk_icon_BORDER 0x00000004 
#define Desk_icon_HCENTRE 0x00000008 
#define Desk_icon_VCENTRE 0x00000010 
#define Desk_icon_FILLED 0x00000020 
#define Desk_icon_FONT 0x00000040 
#define Desk_icon_NEEDSHELP 0x00000080 
#define Desk_icon_INDIRECTED  0x00000100      
#define Desk_icon_RJUSTIFY    0x00000200      
#define Desk_icon_ALLOWADJUST 0x00000400      
#define Desk_icon_HALVESPRITE 0x00000800      
#define Desk_icon_BUTTONTYPE  0x00001000      
#define Desk_icon_SELECTED    0x00200000      
#define Desk_icon_SHADED      0x00400000      
#define Desk_icon_DELETED     0x00800000      
#define Desk_icon_FORECOLOUR  0x01000000      
#define Desk_icon_BACKCOLOUR  0x10000000      
#define Desk_iconvalid_ALLOW           'A'
#define Desk_iconvalid_BORDERTYPE      'R'
#define Desk_iconvalid_DISPLAY         'D'
#define Desk_iconvalid_FONTCOLOURS     'F'
#define Desk_iconvalid_LINESPACE       'L'
#define Desk_iconvalid_SPRITENAME      'S'
#define Desk_iconborder_PLINTH          0
#define Desk_iconborder_SURROUND        1
#define Desk_iconborder_OKBUTTON        2
#define Desk_iconborder_INDENT          3
typedef union
{
  unsigned int value;
  struct
  {
    unsigned int garbage1      : 6;    
    unsigned int font          : 1;    
    unsigned int garbage2      : 17;   
    unsigned int handle        : 8;    
  } font;
  struct
  {
    unsigned int text          : 1;
    unsigned int sprite        : 1;
    unsigned int border        : 1;
    unsigned int hcentre       : 1;
    unsigned int vcentre       : 1;
    unsigned int filled        : 1;
    unsigned int font          : 1;
    unsigned int needshelp     : 1;
    unsigned int indirected    : 1;
    unsigned int rightjustify  : 1;
    unsigned int allowadjust   : 1;
    unsigned int halfsize      : 1;
    unsigned int buttontype    : 4;
    unsigned int esg           : 5;
    unsigned int selected      : 1;
    unsigned int shaded        : 1;
    unsigned int deleted       : 1;
    unsigned int foreground    : 4;
    unsigned int background    : 4;
  } data;
} Desk_icon_flags;
typedef struct
{
  char         *buffer;
  char         *validstring;
  unsigned int bufflen;
} Desk_icon_indtext;
typedef struct
{
  const char   *name;
  void         *spritearea;
  unsigned int nameisname;
} Desk_icon_indsprite;
typedef union
{
  char           text[Desk_wimp_MAXNAME];
  Desk_icon_indtext   indirecttext;
  char           spritename[Desk_wimp_MAXNAME];
  Desk_icon_indsprite indirectsprite;
} Desk_icon_data;
typedef struct
{
  Desk_wimp_box   workarearect;
  Desk_icon_flags flags;
  Desk_icon_data  data;
} Desk_icon_block;
typedef struct
{
  Desk_window_handle window;
  Desk_icon_block    icondata;
} Desk_icon_createblock;
typedef union
{
  struct
  {
    unsigned int hastitle          : 1;  
unsigned int moveable : 1;
unsigned int hasvscroll : 1; 
    unsigned int hashscroll        : 1;  
unsigned int autoredraw : 1;
unsigned int pane : 1;
unsigned int nobounds : 1;
unsigned int nobackclose : 1; 
    unsigned int scrollrq          : 1;
    unsigned int scrollrqdebounced : 1;
    unsigned int realcolours       : 1;
    unsigned int backwindow        : 1;
    unsigned int hotkeys           : 1;
    unsigned int keeponscreen      : 1;
    unsigned int ignoreright       : 1;
    unsigned int ignorebottom      : 1;
    unsigned int open              : 1;
    unsigned int top               : 1;
    unsigned int fullsize          : 1;
    unsigned int istoggling        : 1;
    unsigned int focus             : 1;
    unsigned int forceonce         : 1;
    unsigned int dummy22           : 1;
    unsigned int dummy23           : 1;
    unsigned int backicon          : 1;
    unsigned int closeicon         : 1;
    unsigned int titlebar          : 1;
    unsigned int toggleicon        : 1;
    unsigned int vscroll           : 1;
    unsigned int adjusticon        : 1;
    unsigned int hscroll           : 1;
    unsigned int newflags          : 1;  
  } data;
  int value;
} Desk_window_flags;
typedef struct                
{                             
  int x : 16;                 
  int y : 16;                 
} Desk_window_minsize;
typedef enum
{
  Desk_windowcol_TITLEFORE = 0,
  Desk_windowcol_TITLEBACK,
  Desk_windowcol_WORKFORE,
  Desk_windowcol_WORKBACK,
  Desk_windowcol_SCROLLBACK,
  Desk_windowcol_SCROLLFORE,
  Desk_windowcol_TITLEHILITE
} Desk_window_colourindices;
typedef struct
{
  Desk_wimp_box       screenrect;
  Desk_wimp_point     scroll;
  Desk_window_handle  behind;
  Desk_window_flags   flags;
  char           colours[8];
  Desk_wimp_box       workarearect;
  Desk_icon_flags     titleflags;
  Desk_icon_flags     workflags;
  void           *spritearea;
  Desk_window_minsize minsize;
  Desk_icon_data      title;
  unsigned int   numicons;
  
} Desk_window_block;
typedef struct
{
Desk_window_handle window;
Desk_wimp_box screenrect;
Desk_wimp_point scroll;
Desk_window_handle behind;
} Desk_window_openblock;
typedef struct
{
Desk_window_openblock openblock;
Desk_window_flags flags;
} Desk_window_state;
typedef struct
{
Desk_window_handle window;
Desk_window_block block;
} Desk_window_info;
typedef struct
{
Desk_window_handle window;
Desk_wimp_box rect;
Desk_wimp_point scroll;
Desk_wimp_box cliprect;
} Desk_window_redrawblock;
typedef struct
{
Desk_window_handle window;
Desk_wimp_box screenrect;
} Desk_window_outline;
#define Desk_button_ADJUST 0x00000001
#define Desk_button_MENU 0x00000002
#define Desk_button_SELECT 0x00000004
#define Desk_button_DRAGADJUST 0x00000010
#define Desk_button_DRAGSELECT 0x00000040
#define Desk_button_CLICKADJUST 0x00000100
#define Desk_button_CLICKSELECT 0x00000400
#define Desk_button2_CLICKADJUST 0x00000001 
#define Desk_button2_CLICKSELECT 0x00000004 
#define Desk_button2_DRAGADJUST 0x00000010 
#define Desk_button2_DRAGSELECT 0x00000040 
#define Desk_button2_ADJUST 0x00000100 
#define Desk_button2_MENU 0x00000200 
#define Desk_button2_SELECT 0x00000400 
typedef union
{
unsigned int value;
struct
{
unsigned int adjust : 1;
unsigned int menu : 1;
unsigned int select : 1;
unsigned int dummy3 : 1;
unsigned int dragadjust : 1;
unsigned int dummy5 : 1;
unsigned int dragselect : 1;
unsigned int dummy7 : 1;
unsigned int clickadjust : 1;
unsigned int dummy9 : 1;
unsigned int clickselect : 1;
} data;
struct
{
unsigned int clickadjust : 1;
unsigned int dummy1 : 1;
unsigned int clickselect : 1;
unsigned int dummy3 : 1;
unsigned int dragadjust : 1;
unsigned int dummy5 : 1;
unsigned int dragselect : 1;
unsigned int dummy7 : 1;
unsigned int adjust : 1;
unsigned int menu : 1;
unsigned int select : 1;
}
data2; 
} Desk_button_state;
typedef struct
{
Desk_wimp_point pos;
Desk_button_state button;
Desk_window_handle window;
Desk_icon_handle icon;
} Desk_mouse_block;
typedef struct
{
int shapenumber;
char *shapedata;
unsigned int width;
unsigned int height;
Desk_wimp_point active;
} Desk_pointer_shapeblock;
typedef enum
{
Desk_drag_MOVEWINDOW = 1,
Desk_drag_RESIZEWINDOW,
Desk_drag_SCROLLX,
Desk_drag_SCROLLY,
Desk_drag_FIXEDBOX,
Desk_drag_RUBBERBOX,
Desk_drag_INVISIBLE,
Desk_drag_USERFIXEDBBOX,
Desk_drag_USERRUBBERBOX,
Desk_drag_USERFIXEDNC,
Desk_drag_USERRUBBERNC
} Desk_drag_type;
typedef struct
{
Desk_window_handle window;
Desk_drag_type type;
Desk_wimp_box screenrect;
Desk_wimp_box parent;
} Desk_drag_block;
#define Desk_error_flags_newtype_OLDERROR 0
#define Desk_error_flags_newtype_INFOREPORT 1
#define Desk_error_flags_newtype_ERROR 2
#define Desk_error_flags_newtype_PROGRAM 3
#define Desk_error_flags_newtype_QUESTION 4
typedef union
{
unsigned int value;
struct
{
unsigned int ok : 1;
unsigned int cancel : 1;
unsigned int highlightcancel : 1;
unsigned int noprompt : 1;
unsigned int noprefix : 1;
unsigned int nowait : 1;
unsigned int closebox : 1;
unsigned int nobeep : 1;
unsigned int format350 : 1;
unsigned int type350 : 3;
} data;
} Desk_error_flags;
typedef struct Desk_menu_block *Desk_menu_ptr;
typedef union
{
unsigned int value;
struct
{
unsigned int ticked : 1;
unsigned int dotted : 1;
unsigned int writable : 1;
unsigned int notifysub : 1;
unsigned int openshaded : 1;
unsigned int dummy2 : 2;
unsigned int last : 1;
unsigned int indtitle : 1;
unsigned int dummy13 : 13;
unsigned int shaded : 1;
unsigned int dummy1 : 1;
unsigned int foreground : 4;
unsigned int background : 4;
} data;
} Desk_menu_flags;
typedef union
{
Desk_menu_ptr menu;
Desk_window_handle window;
int value;
} Desk_menu_submenu;
typedef struct
{
Desk_menu_flags menuflags;
Desk_menu_submenu submenu;
Desk_icon_flags iconflags;
Desk_icon_data icondata;
} Desk_menu_item;
typedef struct Desk_menu_block
{
char title [Desk_wimp_MAXNAME];
char titlefore, titleback, workfore, workback;
unsigned int width;
unsigned int height;
unsigned int gap;
} Desk_menu_block;
typedef int Desk_key_press;
typedef struct
{
Desk_window_handle window;
Desk_icon_handle icon;
Desk_wimp_point offset;
int height;
int index;
} Desk_caret_block;
typedef struct
{
Desk_caret_block caret;
Desk_key_press code;
} Desk_key_block;
typedef struct
{
int address;
int contents;
} Desk_pollword_block;
typedef enum
{
Desk_message_QUIT = 0,
Desk_message_CLOSEDOWN = 0,
Desk_message_DATASAVE = 1,
Desk_message_DATASAVEACK = 2,
Desk_message_DATASAVEOK = 2,
Desk_message_DATALOAD = 3,
Desk_message_DATALOADACK = 4,
Desk_message_DATALOADOK = 4,
Desk_message_DATAOPEN,
Desk_message_RAMFETCH,
Desk_message_RAMTRANSMIT,
Desk_message_PREQUIT,
Desk_message_PALETTECHANGE,
Desk_message_SAVEDESK,
Desk_message_DEVICECLAIM,
Desk_message_DEVICEINUSE,
Desk_message_DATASAVED,
Desk_message_CLAIMENTITY = 15,
Desk_message_DATAREQUEST = 16,
Desk_message_RELEASEENTITY = 19,
Desk_message_FILEROPENDIR = 0x400,
Desk_message_FILERCLOSEDIR,
Desk_message_FILEROPENDIRAT,
Desk_message_FILERSELECTIONDIRECTORY,
Desk_message_FILERADDSELECTION,
Desk_message_FILERACTION,
Desk_message_FILERCONTROLACTION,
Desk_message_FILERSELECTION,
Desk_message_FILERDEVICEPATH,
Desk_message_HELPREQUEST = 0x502,
Desk_message_HELPREPLY,
Desk_message_NOTIFY = 0x40040,
Desk_message_MENUWARNING = 0x400C0,
Desk_message_MENUWARN = 0x400C0,
Desk_message_MODECHANGE,
Desk_message_TASKINITIALISE = 0x400C2,
Desk_message_INITTASK = 0x400C2,
Desk_message_TASKCLOSEDOWN = 0x400C3,
Desk_message_CLOSETASK = 0x400C3,
Desk_message_SLOTSIZE = 0x400C4,
Desk_message_SLOTCHANGE = 0x400C4,
Desk_message_SETSLOT = 0x400C5,
Desk_message_TASKNAMERQ,
Desk_message_TASKNAMEIS,
Desk_message_TASKSTARTED,
Desk_message_MENUSDELETED, 
Desk_message_WINDOWINFO = 0x400CC, 
Desk_message_POPUPRQ = 0x46D40, 
Desk_message_POPUPREQUEST = 0x46D40,
Desk_message_POPUPSTATE,
Desk_message_POPUPCLOSED,
Desk_message_PRINTFILE = 0x80140,
Desk_message_WILLPRINT,
Desk_message_PRINTSAVE,
Desk_message_PRINTINIT,
Desk_message_PRINTERROR,
Desk_message_PRINTTYPEODD,
Desk_message_PRINTTYPEKNOWN,
Desk_message_SETPRINTER,
Desk_message_PSPRINTERQUERY = 0x8014c,
Desk_message_PSPRINTERACK,
Desk_message_PSPRINTERMODIFIED,
Desk_message_PSPRINTERDEFAULTS,
Desk_message_PSPRINTERDEFAULTED,
Desk_message_PSPRINTERNOTPS,
Desk_message_RESETPRINTER,
Desk_message_PSISFONTPRINTRUNNING,
Desk_message_TASKWINDOW_INPUT = 0x808c0,
Desk_message_TASKWINDOW_OUTPUT,
Desk_message_TASKWINDOW_EGO,
Desk_message_TASKWINDOW_MORIO,
Desk_message_TASKWINDOW_MORITE,
Desk_message_TASKWINDOW_NEWTASK,
Desk_message_TASKWINDOW_SUSPEND,
Desk_message_TASKWINDOW_RESUME
} Desk_message_action;
typedef int Desk_message_destinee; 
typedef struct
{
unsigned int size;
Desk_task_handle sender;
unsigned int myref;
unsigned int yourref;
Desk_message_action action;
} Desk_message_header;
typedef struct
{
Desk_window_handle window;
Desk_icon_handle icon;
Desk_wimp_point pos;
int estsize;
int filetype;
char leafname[12];
} Desk_message_datasave;
typedef struct
{
Desk_window_handle window; 
Desk_icon_handle icon; 
Desk_wimp_point pos;
int estsize;
int filetype;
char filename[212];
} Desk_message_datasaveack;
typedef struct
{
Desk_window_handle window;
Desk_icon_handle icon;
Desk_wimp_point pos;
int size;
int filetype;
char filename[212];
} Desk_message_dataload;
typedef struct 
{
Desk_window_handle window;
Desk_icon_handle icon;
Desk_wimp_point pos;
int size;
int filetype;
char filename[212];
} Desk_message_dataloadack;
typedef Desk_message_dataload Desk_message_dataopen;
typedef struct
{
char *buffer;
int buffsize;
} Desk_message_ramfetch;
typedef struct
{
char *buffer; 
int byteswritten;
} Desk_message_ramtransmit;
typedef struct
{
int major;
int minor;
char info[228];
} Desk_message_deviceclaim;
typedef Desk_message_deviceclaim Desk_message_deviceinuse;
typedef union {
unsigned int value;
struct {
unsigned int caretorselectionclaim : 2;
unsigned int clipboardclaim : 1;
}
data;
}
Desk_message_claimentity;
typedef union	{
	unsigned int	value;
	struct	{
		unsigned int	caretorselectionrelease	: 2;
		unsigned int	clipboardrelease	: 1;
		}
		data;
	}
	Desk_message_releaseentity;
typedef struct	{
	Desk_window_handle	window;
	void*			reference;
	Desk_wimp_point		pos;
	union	{
		int	value;
		struct	{
			unsigned int	unused_0_1	: 2;
			unsigned int	clipboard	: 1;
			}
			data;
		}
		flags;
	int	filetypes[ 54];	
	}
	Desk_message_datarequest;
typedef struct
{
  Desk_mouse_block where;  
} Desk_message_helprequest;
typedef struct
{
  char text[200];
} Desk_message_helpreply;
typedef struct
{
  int filler[5];
  int filetype;
  char filename[212];
} Desk_message_print;
typedef struct
{
  int        id;                      
  Desk_wimp_point openpos;                 
  int        selection[10];           
} Desk_message_menuwarn;
typedef struct
{
  Desk_window_handle window;
  Desk_task_handle   task;
  char          title[20];
} Desk_message_iconize;
typedef struct
{
  Desk_window_handle window;
  int           dummy;
  char          spritename[8];
  char          title[20];
} Desk_message_windowinfo;
typedef struct
{
  Desk_message_header  header;
  union
  {
    char                 bytes [236];
    int                  words [59];
    Desk_message_datasave     datasave;
    Desk_message_datasaveack  datasaveack;
    Desk_message_dataload     dataload;
    Desk_message_dataopen     dataopen;
    Desk_message_ramfetch     ramfetch;
    Desk_message_ramtransmit  ramtransmit;

    Desk_message_deviceclaim  deviceclaim;
    Desk_message_deviceinuse  deviceinuse;

    Desk_message_claimentity	claimentity;
    Desk_message_releaseentity	releaseentity;
    Desk_message_datarequest	datarequest;
 
    Desk_message_helprequest  helprequest;
    Desk_message_helpreply    helpreply;
    Desk_message_print        print;
    Desk_message_menuwarn     menuwarn;
    Desk_message_iconize      iconize;
    Desk_message_windowinfo   windowinfo;
#if 0
    Desk_message_popuprequest popuprequest;    
    Desk_message_popupstate   popupstate;      
#endif
  } data;
} Desk_message_block;
#define Desk_wimp_NUMBEROFEVENTS 20
typedef enum
{
Desk_event_ANY = -99, 
Desk_event_NULL = 0,
Desk_event_REDRAW,
Desk_event_OPEN,
Desk_event_CLOSE,
Desk_event_PTRLEAVE,
Desk_event_PTRENTER,
Desk_event_CLICK = 6,
Desk_event_BUTTON = 6,
Desk_event_USERDRAG,
Desk_event_KEY,
Desk_event_MENU,
Desk_event_SCROLL,
Desk_event_LOSECARET,
Desk_event_GAINCARET,
Desk_event_NONZEROPOLLWORD,
Desk_event_USERMESSAGE = 17,
Desk_event_SEND = 17,
Desk_event_USERMESSAGERECORDED = 18,
Desk_event_SENDWANTACK = 18,
Desk_event_USERMESSAGEACK = 19,
Desk_event_ACK = 19
} Desk_event_type;
typedef union
{
unsigned int value;
struct
{
unsigned int null : 1;
unsigned int redraw : 1;
unsigned int open : 1;
unsigned int close : 1;
unsigned int ptrleave : 1;
unsigned int ptrenter : 1;
unsigned int click : 1;
unsigned int userdrag : 1;
unsigned int key : 1;
unsigned int menu : 1;
unsigned int scroll : 1;
unsigned int losecaret : 1;
unsigned int gaincaret : 1;
unsigned int nonzeropollword : 1;
unsigned int dummy14 : 1;
unsigned int dummy15 : 1;
unsigned int dummy16 : 1;
unsigned int usermessage : 1;
unsigned int usermessagerecorded : 1;
unsigned int usermessageack : 1;
unsigned int dummy20 : 1;
unsigned int dummy21 : 1;
unsigned int r3ispollwordptr : 1;
unsigned int highprioritypoll : 1;
unsigned int keepfpregisters : 1;
} data;
} Desk_event_pollmask;
typedef struct
{
Desk_window_openblock openblock;
Desk_wimp_point direction;
} Desk_scroll_rq;
typedef union
{
Desk_caret_block caret;
Desk_key_block key;
Desk_pollword_block pollword;
Desk_window_openblock openblock;
Desk_message_block message;
Desk_mouse_block mouse;
Desk_wimp_box screenrect;
int selection[10];
Desk_scroll_rq scroll;
char bytes [256];
int words [64];
} Desk_event_data;
typedef struct
{
Desk_event_type type;
Desk_event_data data;
} Desk_event_pollblock;
typedef struct
{
char fonts[256];
} Desk_font_array;
typedef struct
{
Desk_window_block *buffer;
char *workfree;
char *workend;
Desk_font_array *font;
char *name;
unsigned int index;
} Desk_template_block;
typedef struct
{
Desk_wimp_point mul;
Desk_wimp_point div;
} Desk_scale_block;
#ifdef __cplusplus
}
#endif
#endif
