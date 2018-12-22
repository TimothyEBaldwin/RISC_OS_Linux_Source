/*
 * Copyright (c) 2016, Timothy Baldwin
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of RISC OS Open Ltd nor the names of its contributors
 *       may be used to endorse or promote products derived from this software
 *       without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 */

#define max_keycode (105)
#include "frontend_common.h"

#include <GL/glut.h>
#include <GL/freeglut.h>
#include <unistd.h>
#include <thread>
#include <array>
#include <algorithm>
#include <iostream>
#include <cstring>

#include <sys/uio.h>
#include <poll.h>

#include <getopt.h>

using std::cerr;
using std::endl;

#define NUM_SCREENS 3 

#include <chrono>


const int refresh_period = 20;
const int mode_change = 5555;
const int screen_update = 5554;
int log2bpp = 3;
int height = 480;
int width = 640;
int no_updates = 0;

// Display size
#define SCREEN_WIDTH 2560
#define SCREEN_HEIGHT 1440

void setupTexture();
volatile int draw_pixels=1;
void *current_pixels;


static unsigned short keycode[256];
static unsigned short shctrl[256];



void init_keyboard(){
  for (int i=0;i<256;i++)
  {
    keycode[i]=0;
    shctrl[i]=0;
  }
  keycode['a']=KeyNo_LetterA;
  keycode['b']=KeyNo_LetterB;
  keycode['c']=KeyNo_LetterC;
  keycode['d']=KeyNo_LetterD;
  keycode['e']=KeyNo_LetterE;
  keycode['f']=KeyNo_LetterF;
  keycode['g']=KeyNo_LetterG;
  keycode['h']=KeyNo_LetterH;
  keycode['i']=KeyNo_LetterI;
  keycode['j']=KeyNo_LetterJ;
  keycode['k']=KeyNo_LetterK;
  keycode['l']=KeyNo_LetterL;
  keycode['m']=KeyNo_LetterM;
  keycode['n']=KeyNo_LetterN;
  keycode['o']=KeyNo_LetterO;
  keycode['p']=KeyNo_LetterP;
  keycode['q']=KeyNo_LetterQ;
  keycode['r']=KeyNo_LetterR;
  keycode['s']=KeyNo_LetterS;
  keycode['t']=KeyNo_LetterT;
  keycode['u']=KeyNo_LetterU;
  keycode['v']=KeyNo_LetterV;
  keycode['w']=KeyNo_LetterW;
  keycode['x']=KeyNo_LetterX;
  keycode['y']=KeyNo_LetterY;
  keycode['z']=KeyNo_LetterZ;
  keycode[' ']=KeyNo_Space;
  
  
  
  
  keycode['1'] = keycode['!'] = KeyNo_Digit1;shctrl['!']=1;
  keycode['2'] = keycode['@'] = KeyNo_Digit2;shctrl['@']=1;
  keycode['3'] = keycode['#'] = KeyNo_Digit3;shctrl['#']=1;
  keycode['4'] = keycode['$'] = KeyNo_Digit4;shctrl['$']=1;
  keycode['5'] = keycode['%'] = KeyNo_Digit5;shctrl['%']=1;
  keycode['6'] = keycode['^'] = KeyNo_Digit6;shctrl['^']=1;
  keycode['7'] = keycode['&'] = KeyNo_Digit7;shctrl['&']=1;
  keycode['8'] = keycode['*'] = KeyNo_Digit8;shctrl['*']=1;
  keycode['9'] = keycode['('] = KeyNo_Digit9;shctrl['(']=1;
  keycode['0'] = keycode[')'] = KeyNo_Digit0;shctrl[')']=1;


  keycode['-'] = keycode['_'] = KeyNo_Minus;shctrl['_']=1;
  keycode['='] = keycode['+'] = KeyNo_Equals;shctrl['+']=1;
  keycode['\\'] = keycode['|'] = KeyNo_BackSlash;shctrl['|']=1;
  keycode['['] = keycode['{'] = KeyNo_OpenSquare;shctrl['{']=1;
  keycode[']'] = keycode['}'] = KeyNo_CloseSquare;shctrl['}']=1;
  keycode[';'] = keycode[':'] = KeyNo_SemiColon;shctrl[';']=1;
  keycode['\''] = keycode['"'] = KeyNo_Tick;shctrl['"']=1;
  keycode[','] = keycode['<'] = KeyNo_Comma;shctrl['<']=1;
  keycode['.'] = keycode['>'] = KeyNo_Dot;shctrl['>']=1;
  keycode['/'] = keycode['?'] = KeyNo_Slash;shctrl['?']=1;
  

  for (int k=0;k<26;k++)
    { keycode[k+'A']=keycode[k+'a'];shctrl[k+'A']=1;
      keycode[k+1]=keycode[k+'a'];}
  keycode['\b']=KeyNo_BackSpace;
  keycode['\r']=KeyNo_Return;
  keycode['\t']=KeyNo_Tab;
  keycode[27] = KeyNo_Escape;
}
static int oldscreennumber=0,screennumber=0,display_size=1;
int display_width=SCREEN_WIDTH,display_height=SCREEN_HEIGHT;
static volatile int buttons=0;
bool shiftkey=false;

void OnMouseClick(int button, int state, int, int)
{
   report r;
   buttons=button;
     
   switch (state) {
     case GLUT_DOWN:
        report_key(KeyNo_LeftMouse + button, true);
        break;
      case GLUT_UP:
        report_key(KeyNo_LeftMouse + button, false);
        break;
     }
}

void My_mouse_routine(int x, int y){
  report r;
  r.reason = report::ev_mouse;
  r.mouse.x = x * width / display_width;
  r.mouse.y = height - y * height / display_height;
  r.mouse.buttons = buttons;
  send_report(r);

}

void mouseWheel(int button, int dir, int x, int y)
{
    if (dir > 0)
    {
        // Zoom in
    }
    else
    {
        // Zoom out
    }
    return;
}

void myupfunc(unsigned char key, int x, int y){
    report_key(keycode[key], false);
}

void mydownfunc(unsigned char key, int x, int y){
    report_key(keycode[key], true);
    if (keycode[key]==0)
      cerr << "Key pressed:" << (unsigned int) key << "\n";
}

unsigned short special_to_code(int key) {
  switch(key) {
    case GLUT_KEY_F1:         return KeyNo_Function1;// F1 function key.
    case GLUT_KEY_F2:         return KeyNo_Function2;// F2 function key.
    case GLUT_KEY_F3:         return KeyNo_Function3;// F3 function key.
    case GLUT_KEY_F4:         return KeyNo_Function4;// F4 function key.
    case GLUT_KEY_F5:         return KeyNo_Function5;// F5 function key.
    case GLUT_KEY_F6:         return KeyNo_Function6;// F6 function key.
    case GLUT_KEY_F7:         return KeyNo_Function7;// F7 function key.
    case GLUT_KEY_F8:         return KeyNo_Function8;// F8 function key.
    case GLUT_KEY_F9:         return KeyNo_Function9;// F9 function key.
    case GLUT_KEY_F10:        return KeyNo_Function10;// F10 function key.
    case GLUT_KEY_F11:        return KeyNo_Function11;// F11 function key.
    case GLUT_KEY_F12:        return KeyNo_Function12; // F12 function key.
    case GLUT_KEY_LEFT:       return KeyNo_CursorLeft; // Left directional key.
    case GLUT_KEY_UP:         return KeyNo_CursorUp;// Up directional key.
    case GLUT_KEY_RIGHT:      return KeyNo_CursorRight;// Right directional key.
    case GLUT_KEY_DOWN:       return KeyNo_CursorDown;// Down directional key.
    case GLUT_KEY_PAGE_UP:    return KeyNo_PageUp; // Page up directional key.
    case GLUT_KEY_PAGE_DOWN:  return KeyNo_PageDown;// Page down directional key.
    case GLUT_KEY_HOME:       return KeyNo_Home;// Home directional key.
    case GLUT_KEY_END:        return KeyNo_Break;// End directional key.
    case GLUT_KEY_INSERT:     return KeyNo_Insert; //Inset directional key.
    case 112:                 return KeyNo_ShiftLeft;
    case 113:                 return KeyNo_ShiftRight;
    case 114:                 return KeyNo_CtrlLeft;
    case 115:                 return KeyNo_CtrlRight;
    case 116:                 return KeyNo_AltLeft;
    case 117:                 return KeyNo_AltRight;
     
    default:
      break;
  }
  return 0;
}

void myspecialup(int key, int x, int y)
{
  int k = special_to_code(key);
  if (k != 0)
    report_key(k, false);
  else
    cerr << " KEYup " << key <<"\n";

}
void myspecialdown(int key, int x, int y)
{
  int k = special_to_code(key);
  if (k != 0)
    report_key(k, true);
  else
    cerr << " KEYdown " << key <<"\n";
}

// Setup Texture
void setupTexture()
{
    // Create a texture 
    glTexImage2D(GL_TEXTURE_2D, 0, 3, SCREEN_WIDTH, SCREEN_HEIGHT, 0, GL_RGBA, GL_UNSIGNED_INT_8_8_8_8, current_pixels);
 
    // Set up the texture
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP); 
 
    // Enable textures
    glEnable(GL_TEXTURE_2D);
        draw_pixels=1;
}
 
void updateTexture()
{   
    display_width = glutGet(GLUT_WINDOW_WIDTH);
    display_height = glutGet(GLUT_WINDOW_HEIGHT);
    
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0, display_width, display_height, 0);        
    glMatrixMode(GL_MODELVIEW);
    glViewport(0, 0, display_width, display_height);
    // Update Texture
    switch(log2bpp) {
      case 3:
        
        glTexSubImage2D(GL_TEXTURE_2D, 0 ,0, 0, width, height, GL_RGB,  GL_UNSIGNED_BYTE_3_3_2, current_pixels);
        break;
      case 4:
        glTexSubImage2D(GL_TEXTURE_2D, 0 ,0, 0, width, height, GL_RGBA, GL_UNSIGNED_SHORT_1_5_5_5_REV, current_pixels);
        break;
      default:
        glTexSubImage2D(GL_TEXTURE_2D, 0 ,0, 0, width, height, GL_RGBA, GL_UNSIGNED_INT_8_8_8_8_REV, current_pixels);
        break;
    }
 

    glBegin( GL_QUADS );
    
        glTexCoord2d(0.0, 0.0);                                           glVertex2d(0.0, 0.0);
        glTexCoord2d(1.0*width/SCREEN_WIDTH, 0.0);                        glVertex2d(display_width, 0.0);
        glTexCoord2d(1.0*width/SCREEN_WIDTH, 1.0*height/SCREEN_HEIGHT);   glVertex2d(display_width, display_height);
        glTexCoord2d(0.0, 1.0*height/SCREEN_HEIGHT);                      glVertex2d(0.0, display_height);

    glEnd();
}
 
void display()
{
  // Clear framebuffer
  //glClear(GL_COLOR_BUFFER_BIT);
  // Draw pixels to texture
  updateTexture();
  // Swap buffers!
  glutSwapBuffers();    
}
 
void reshape_window(GLsizei w, GLsizei h)
{
    glClearColor(0.0f, 0.0f, 0.5f, 0.0f);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0, w, h, 0);        
    glMatrixMode(GL_MODELVIEW);
    glViewport(0, 0, w, h);
 
    // Resize quad
    display_width = w;
    display_height = h;
    draw_pixels=1;
    glutPostRedisplay();
}

int init_my_GL(int argc, char **argv) 
{       
    // Setup OpenGL
    glutInit(&argc, argv);          
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA);
 
    glutInitWindowSize(width, height);
    glutInitWindowPosition(320, 320);
    glutCreateWindow("RISC OS 5");
 
    glutDisplayFunc(display);
    glutMouseFunc(OnMouseClick);
    glutMotionFunc( My_mouse_routine );
    glutPassiveMotionFunc( My_mouse_routine );   
    glutReshapeFunc(reshape_window);
    
    glutKeyboardUpFunc(myupfunc);
    glutKeyboardFunc(mydownfunc);
    glutMouseWheelFunc(mouseWheel);
    glutSpecialFunc(myspecialdown);
    glutSpecialUpFunc(myspecialup);
    
    setupTexture();

    return 0;
}

auto start = std::chrono::steady_clock::now();
void interact_rule()
{
  
    report r;

    exit_poll();


      command c;
      int numscr;

      int s = read_msg(c);

      if (s >= 4) {


      switch (c.reason) {
        case command::c_mode_change:
          height = c.mode.vidc[11];
          width = c.mode.vidc[5];
          log2bpp = c.mode.vidc[1];
          cerr << "Set mode " << log2bpp << ' ' << height << ' ' << width << endl;

          switch (log2bpp) {
            case 3:
              display_size = width*height;
              break;
            case 4:
              display_size = width*height*2;
              break;
            case 5:
              display_size = width*height*4;
              break;
          }
          current_pixels = pixels;
          if (width==SCREEN_WIDTH && height == SCREEN_HEIGHT)
            glutFullScreen();
          else
            glutReshapeWindow(width, height);
          
          glutPostRedisplay();
          r.reason = report::ev_mode_sync;
          write(sockets[0], &r.reason, sizeof(r.reason));
          break;
        case command::c_activescreen:
          // swap buffer, ensure no unauthorised memory access.
          if (c.activescreen.address + display_size <= screen_size) {
            current_pixels = pixels + static_cast<uint32_t>(c.activescreen.address);
          }
          break;
        case command::c_suspend:
          no_updates = c.suspend.delay;
          //update_screen();
          break;
        case command::c_set_palette: {
          /*
          SDL_Palette *p;
          if (c.palette.type == 0) {
            p = palette;
          } else if (c.palette.type == 2) {
            p = cursor_surface->format->palette;
          } else {
            break;
          }
          p->colors[c.palette.index].r = 0xFF & (c.palette.colour >> 8);
          p->colors[c.palette.index].g = 0xFF & (c.palette.colour >> 16);
          p->colors[c.palette.index].b = 0xFF & (c.palette.colour >> 24);
          if (c.palette.type == 2) goto update_cursor;
          for (numscr=0;numscr<NUM_SCREENS;numscr++)
              SDL_SetSurfacePalette(screen[numscr], palette);
          */
          break;
        }
        case command::c_pointer: {
          /*
          uint8_t *src = c.pointer.data;
          uint8_t *dst = (uint8_t *)cursor_surface->pixels;
          int i = c.pointer.height * 8;
          do {
            int j = 4;
            unsigned s = *src++;
            do {
              *dst++ = s & 3;
              s >>= 2;
            } while (--j);
          } while(--i);
          std::memset(dst, 0, (32 - c.pointer.height) * 32);
          cursor_active_x = c.pointer.active_x;
          cursor_active_y = c.pointer.active_y;
          */
          }
        update_cursor: {
          /*
          SDL_Cursor* cursor2 = SDL_CreateColorCursor(cursor_surface, cursor_active_x, cursor_active_y);
          SDL_SetCursor(cursor2);
          SDL_FreeCursor(cursor);
          cursor = cursor2;
          */
          break;
        }
      }
    }
    auto thismoment = std::chrono::steady_clock::now();
    std::chrono::duration<double> diff = thismoment-start;
    if (diff.count() >0.02) {
       display();
       start=thismoment;
     }
}



int main(int argc, char **argv) {

  struct option opts[] = {
    {"chromebook", no_argument, nullptr, 'c'},
    {"swapmouse", no_argument, nullptr, 's'},
    {nullptr, 0, nullptr, 0}
  };

  int opt;
  while ((opt = getopt_long(argc, argv, "+cs", opts, nullptr)) != -1) {
    switch (opt) {
      case 's':
        swapmouse = true;
        break;
      case 'c':
        break;
    }
  }

  
  run_RISC_OS(argv + optind);

  int cursor_active_x = 0;
  int cursor_active_y = 0;

  current_pixels = pixels;
  init_keyboard();
  init_my_GL(argc,argv);

  uint32_t buttons = 0;
  glutIdleFunc(interact_rule);
  glutMainLoop();
}
