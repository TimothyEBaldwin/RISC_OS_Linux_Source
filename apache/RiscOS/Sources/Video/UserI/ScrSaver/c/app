/*
    *   Title:      Saver Saver Animation
    *   Author:     Owen Love
    *   Date:       21st April 1997
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "swis.h"
#include "time.h"
#include "math.h"
#include "float.h"

#include "os.h"
#include "wimp.h"
#include "wimpt.h"
#include "win.h"
#include "res.h"
#include "template.h"
#include "event.h"
#include "sprite.h"
#include "bbc.h"
#include "colourtran.h"
#include "werr.h"

#define space    ' '
#define linefeed '\n'
#define c_return '\x0d'

/************************************************/
/*                  constants                   */
/************************************************/

#define APP_NAME  "SaverAni"

#define ModeFiles_SafeArea    0x4d481   /* Safe area SWI */

#define OSKB_XEIG_FN     4    /* parameters to OS_ReadModeVariable   */
#define OSKB_YEIG_FN     5    /* to read screen parameters such as   */
#define OSKB_XLIMIT_FN   11   /* number of bits per pixel and        */
#define OSKB_YLIMIT_FN   12   /* screen geometry                     */

#define SP_NAME "logo"        /* Initial name of all the sprites    */

#define STEP        10        /* How much to move each time          */
#define DELAY_TIME   2        /* Time delay before next sprite plot  */
#define LOOP_MAX     3        /* Plot x moves before changing sprite */
#define INIT_IMAGE   0        /* Initial Sprite Image                */
#define LOOP_IMAGE  12        /* First Sprite of Looping Sequence    */
#define MAX_IMAGE   18        /* Last Sprite of Looping Sequence     */

#define LEFT_WASTE    4       /* Amount of blank space left of sprite */
#define RIGHT_WASTE  16       /* Amount of blank space right of sprite */
#define TOP_WASTE     4       /* Amount of blank space at top of sprite */
#define BOTTOM_WASTE 10       /* Amount of blank space at bottom of sprite */

#define PI 3.14159265

/***************************************************************************/


/***************************************/
/********* global variables   **********/
/***************************************/

wimp_w   main_handle;             /* Main window handle           */

int *poll_word_location;       /* Location of the poll word    */

int xscreenlimit;                 /* x screen size */
int yscreenlimit;                 /* y screen size */

int ptrshape = 0;                 /* Pointer shape before removing it */

int sp_area = 0;                  /* Sprite Dyanmic Area number */
sprite_area *sp;                  /* Pointer to the sprite area */
sprite_pixtrans trans_table[256]; /* Sprite trans table */
int factors[12];                  /* Sprite scale table */

int width, height;                /* Current sprite width and height */
int xpos, ypos;                   /* Current sprite x and y pos */

int old_width, old_height;        /* Last Sprite width and height */
int old_xpos, old_ypos;           /* Last sprite x and y pos */

int x_step, y_step;               /* The current x and y step distances */

int direction;                    /* The current direction of movement */
int last_time;                    /* Time of last sprite plot */
int loop = 1;                     /* Current sequence in sprite loop */

int current_image;                /* The current image number */
BOOL intro_done = FALSE;          /* Has the intro animation been done */
BOOL sprites_loaded = FALSE;      /* Are sprites present in memory ? */

int left_edge;                    /* Left limit of movement */
int right_edge;                   /* Right limit of movement */
int top_edge;                     /* Top limit of movement */
int bottom_edge;                  /* Bottom limit of movement */

int left_safearea;                /* Left edge of safe area */
int right_safearea;               /* Right edge of safe area */
int top_safearea;                 /* Top edge of safe area */
int bottom_safearea;              /* Bottom edge of safe area */

/***************************************/

/* Read the mode variable defined in the parameter */
static int utils_read_curr_mode(int mode_var)
{
  _kernel_swi_regs regs;

  regs.r[0] = -1; /* current mode */
  regs.r[1] = mode_var;
  _kernel_swi(OS_ReadModeVariable, &regs, &regs);

  return regs.r[2];
}
      
/* Returns the scaling factor between screen co-ordinates and pixels (x) */
static int utils_read_xeig(void)
{
  return (1 << utils_read_curr_mode(OSKB_XEIG_FN));
}

/* Returns the scaling factor between screen co-ordinates and pixels (y) */
static int utils_read_yeig(void)
{
  return (1 << utils_read_curr_mode(OSKB_YEIG_FN));
}

/* Returns the width of the screen in pixels */
static int utils_read_xlimit(void)
{
  return utils_read_curr_mode(OSKB_XLIMIT_FN);
}

/* Returns the height of the screen in pixels */
static int utils_read_ylimit(void)
{
  return utils_read_curr_mode(OSKB_YLIMIT_FN);
}

/* Set up the random number generator */
void set_random_seed(void)
{
  _kernel_swi_regs r;

  _kernel_swi(OS_ReadMonotonicTime, &r, &r);
  srand(r.r[0]);
}

/* Return a random number */
int random(int given)
{
  return (int)(((float)rand()/(float)RAND_MAX)*given)+1;
}

/* Read the current time */
static int read_time(void)
{
  int time;

  os_swi1r(OS_ReadMonotonicTime, 0, &time);

  return (time);
}

/* Round a number up to the nearest even number */
static int calc_to_nearest_even_number(int value)
{
  div_t result;

  result = div(value, 2);
  if (result.rem == 1)
    value += 1;
  return (value);
}

/* Set up the safearea x,y values for the current mode */
static void set_up_safearea_values(void)
{
  _kernel_swi_regs regs;
  _kernel_oserror *err;

  err = _kernel_swi(ModeFiles_SafeArea, &regs, &regs);
  if (err)
  {
    left_safearea = 0;
    right_safearea = xscreenlimit;
    bottom_safearea = 0;
    top_safearea = yscreenlimit;
  }
  else
  {
    left_safearea = regs.r[0];
    right_safearea = regs.r[2];
    bottom_safearea = regs.r[1];
    top_safearea = regs.r[3];
  }
}

/* Calculate the max/min x/y positions for the sprite */
static void calc_max_coords_for_current_mode_and_sprite(void)
{
  set_up_safearea_values();

  left_edge = left_safearea - LEFT_WASTE;
  calc_to_nearest_even_number(left_edge);

  right_edge = right_safearea + RIGHT_WASTE;
  right_edge -= width;
  calc_to_nearest_even_number(right_edge);

  top_edge = top_safearea + TOP_WASTE;
  top_edge -= height;
  calc_to_nearest_even_number(top_edge);

  bottom_edge = bottom_safearea - BOTTOM_WASTE;
  calc_to_nearest_even_number(bottom_edge);
}

/* Open a large black window that covers the screen */
static void ensure_saver_window_at_front(void)
{
  wimp_wstate   state;

  wimp_get_wind_state(main_handle, &state);
  if (state.o.behind != -1)
  {
    state.o.behind = -1;
    wimpt_noerr(wimp_open_wind(&state.o));
  }
}

/***************************************************************************/

/* Read the current sprite size */
static void read_sprite_size(int sp_image)
{
  char name[10];
  _kernel_swi_regs r;

  sprintf(name, "%s%d", SP_NAME, sp_image);
  r.r[0] = 256 + 40;
  r.r[1] = (int) sp;
  r.r[2] = (int) name;
  _kernel_swi(OS_SpriteOp, &r, &r);
  width = r.r[3] * utils_read_xeig();
  height = r.r[4] * utils_read_yeig();
}

/* Calculate the Pixel translation and ColourTrans Tables */
static void read_pix_trans(int sp_image)
{
  char name[10];
  _kernel_swi_regs r;

  sprintf(name, "%s%d", SP_NAME, sp_image);
  
  r.r[0] = 256;
  r.r[1] = (int) sp;
  r.r[2] = (int) name;
  r.r[6] = (int) factors;
  r.r[7] = (int) trans_table;
  _kernel_swi(Wimp_ReadPixTrans, &r, &r);

  r.r[0] = (int) sp;
  r.r[1] = (int) name;
  r.r[2] = -1;
  r.r[3] = -1;
  r.r[4] = (int) trans_table;
  r.r[5] = 0;
  _kernel_swi(ColourTrans_SelectTable, &r, &r);
}

/* Plot the sprite using OS_SpriteOp 52 */
static void plot_sprite(int sp_image)
{
  char name[10];
  _kernel_swi_regs r;

  sprintf(name, "%s%d", SP_NAME, sp_image);
  r.r[0] = 256 + 52;
  r.r[1] = (int) sp;
  r.r[2] = (int) name;
  r.r[3] = xpos;
  r.r[4] = ypos;
  r.r[5] = 8;
  r.r[6] = (int) factors;
  r.r[7] = (int) trans_table;
  _kernel_swi(OS_SpriteOp, &r, &r);
}

/* Calculate the amount of x and y movement for next time across the screen */
static void calculate_step_distance(void)
{
  double rad_direction;

  rad_direction = ((double) direction / 360) * (PI * 2);
  x_step = (int) (STEP * cos(rad_direction));
  x_step = calc_to_nearest_even_number(x_step);
  y_step = (int) (STEP * sin(rad_direction));
  y_step = calc_to_nearest_even_number(y_step);
}

/* Calculate the next sprite position */
static void calculate_next_position(void)
{
  xpos += x_step;
  ypos += y_step;
  if (xpos < left_edge)
  {
    xpos = left_edge;
    direction = 170 - direction + random(20);
    calculate_step_distance();
  }
  if (xpos > right_edge)
  {
    xpos = right_edge;
    direction = 170 - direction + random(20);
    calculate_step_distance();
  }
  if (ypos < bottom_edge)
  {
    ypos = bottom_edge;
    direction = 10 - direction - random(20);
    calculate_step_distance();
  }
  if (ypos > top_edge)
  {
    ypos = top_edge;
    direction = 10 - direction - random(20);
    calculate_step_distance();
  }
}

/* Clear the remains of the last visible sprite */
static void remove_visible_last_sprite(void)
{
  bbc_gcol(0, 128);
  if (old_width > 0)
  {
    if (xpos + width < old_xpos + old_width)
    {
      bbc_move(old_xpos + old_width, old_ypos);
      bbc_plot(96+7, xpos + width, old_ypos + old_height);
    }
    if (xpos > old_xpos)
    {
      bbc_move(old_xpos, old_ypos);
      bbc_plot(96+7, xpos, old_ypos + old_height);
    }
    if (ypos > old_ypos)
    {
      bbc_move(old_xpos, old_ypos);
      bbc_plot(96+7, old_xpos + old_width, ypos);
    }
    if (ypos + height < old_ypos + old_height)
    {
      bbc_move(old_xpos, ypos + height);
      bbc_plot(96+7, old_xpos + old_width, old_ypos + old_height);
    }
  }
}

/* Change the current image to plot and update old values */
static void change_image_to_plot(void)
{
  if (loop == LOOP_MAX)
  {
    current_image += 1;
    if (current_image > MAX_IMAGE)
      current_image = LOOP_IMAGE;
    loop = 1;
  }
  else
   loop += 1;

  old_width = width;
  old_height = height;
  old_xpos = xpos;
  old_ypos = ypos;
  last_time = read_time();
}

/* Plot the introduction animation routine */
static void plot_intro_animation(void)
{
  while (current_image < LOOP_IMAGE)
  {
    if (read_time() - last_time > DELAY_TIME)
    {
      plot_sprite(current_image);
      change_image_to_plot();
    }
  }
  read_sprite_size(current_image);
  calc_max_coords_for_current_mode_and_sprite();
  xpos += (old_width - width);       /* The looping sprites are smaller */
  intro_done = TRUE;
}

/* Plot the moving animation routine */
static void plot_moving_routine(void)
{
  if (read_time() - last_time > DELAY_TIME)
  {
    calculate_next_position();
    remove_visible_last_sprite();
    plot_sprite(current_image);
    change_image_to_plot();
  }
}

/* Which sprite plot are we on ? */
static void sprite_plot_routine(void)
{
  ensure_saver_window_at_front();
  if (intro_done == FALSE)
    plot_intro_animation();
  else
    plot_moving_routine();
}

/* Initialise the sprites and set start-up values */
static void init_sprites(void)
{
  direction = random(360);
  calculate_step_distance(); 
  current_image = INIT_IMAGE;
  read_pix_trans(current_image);
  read_sprite_size(current_image);
  xpos = calc_to_nearest_even_number(xscreenlimit / 2);
  ypos = calc_to_nearest_even_number(yscreenlimit / 2);
  last_time = read_time();
}

/***************************************************************************/

/* Read the file size of a given filename */
static int read_filesize(char *filename)
{
  _kernel_swi_regs r;

  r.r[0] = 20;
  r.r[1] = (int) filename;
  _kernel_swi(OS_File, &r, &r);

  return r.r[4];
}

/* Free a dynamic area */
static void free_dynamic_area(int area)
{
  _kernel_swi_regs r;

  r.r[0] = 1;
  r.r[1] = area;
  _kernel_swi(OS_DynamicArea, &r, &r);
}

/* Create a dynamic area and load the sprite file into it */
static void load_sprite_file(void)
{
  _kernel_swi_regs r;
  int sp_size;
  int carry;

  sp_size = read_filesize("<SaverAni$Dir>.Sprites");
  sp_size += 16;

  r.r[0] = 0;
  r.r[1] = -1;
  r.r[2] = sp_size;
  r.r[3] = -1;
  r.r[4] = 128;
  r.r[5] = -1;
  r.r[6] = 0;
  r.r[7] = 0;
  r.r[8] = (int) "ScrSaver Sprites";
  _kernel_swi_c(OS_DynamicArea, &r, &r, &carry);
  if (carry == 1)
  {
    sprites_loaded = TRUE;
    sp_area = r.r[1];
    sp = (sprite_area *)r.r[3];
    sprite_area_initialise(sp, sp_size);
    sprite_area_load(sp, "<SaverAni$Dir>.Sprites");
  }
}
 
/***************************************************************************/

static void shut_down_application(void)
{
  int dummy;
  
  os_byte(106, &ptrshape, &dummy);      /* Restore pointer shape */
  if (sprites_loaded)
    free_dynamic_area(sp_area);
  exit(0);
} 

/* Open a large black window that covers the screen */
static void open_main_window(void)
{
  wimp_openstr   wind_open;

  xscreenlimit = utils_read_xlimit() * utils_read_xeig();
  yscreenlimit = utils_read_ylimit() * utils_read_yeig();
  wind_open.w = main_handle;
  wind_open.box.x0 = 0;
  wind_open.box.y0 = 0;
  wind_open.box.x1 = xscreenlimit;
  wind_open.box.y1 = yscreenlimit;
/*  wind_open.box.x1 = 500;
  wind_open.box.y1 = 500; */
  wind_open.x = 0;
  wind_open.y = 0;
  wind_open.behind = -1;
  wimpt_noerr(wimp_open_wind(&wind_open));
}

/* Receive a user message */
static void user_message(wimp_eventstr *e)
{
  switch (e->data.msg.hdr.action)
  {
    case wimp_MCLOSEDOWN:
      shut_down_application();
    break;

    default: break;
  }
}

/* Redraw the main window */
static void redraw_main_window(wimp_w window_handle)
{
  wimp_redrawstr r;
  int            more;

  r.w = window_handle;
  wimp_redraw_wind(&r, &more);
  while (more)
    wimp_get_rectangle(&r, &more);
}

/* Event handler for the main window */
static void main_wind_event_handler(wimp_eventstr *e, void *handle)
{                            
  switch (e->e)
  {
    case wimp_EREDRAW:
      redraw_main_window(e->data.o.w);
    break;

    case wimp_EBUT:
/*      shut_down_application(); */
    break;
    
    case wimp_ESEND:
    case wimp_ESENDWANTACK:
      user_message(e);
    break;

    default:   /* Ignore any other event */
      break;
  }
}

/* Create the main window */
static void create_main_window(void)
{
  template  *template;
  wimp_wind *window;

  template = template_find("main");
  window = template_syshandle("main");
  wimp_create_wind(&template->window, &main_handle);
  win_register_event_handler(main_handle, main_wind_event_handler, 0);
}

/* Unknow events handler to reieve events to plot the animation */
static BOOL events_unknown_handler(wimp_eventstr *e, void *handle)
{
  BOOL  dealt_with = FALSE;

  handle = handle;
  switch(e->e)
  {
    case wimp_ENULL:
      if (poll_word_location[0] != 0)
        shut_down_application();
      if (sprites_loaded)
        sprite_plot_routine();
      dealt_with = TRUE;
    break;

    default:
    break;
  }
  return(dealt_with);
}

/* Initialise the application */
static BOOL initialise(void)
{
  int dummy;
  
  wimpt_init(APP_NAME);
  res_init(APP_NAME);
  template_init();

  win_activeinc();                
  event_setmask((wimp_emask) 0);  /* Ensure we got polled constantly */

  win_add_unknown_event_processor(events_unknown_handler, NULL);
  set_random_seed();              /* Set up the random number generator */

  os_byte(106, &ptrshape, &dummy);    /* Store shape and then remove pointer */

  create_main_window();
  open_main_window();
  load_sprite_file();
  if (sprites_loaded)
    init_sprites();

  return TRUE;
}

/**************************************************/

int main(int argc, char **argv)
{
  if (argc > 1)
    poll_word_location = (int *) atoi(argv[1]);

  if (!initialise())
    exit(1);

  while(TRUE)
    event_process();

  return 0;
}
