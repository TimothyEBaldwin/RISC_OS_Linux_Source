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

#include <SDL.h>
#include <SDL_scancode.h>
#include <stdio.h>
#include "Keyboard.h"

struct keys { int sdl, ro; };

struct keys sdl2key[] = {
  {SDL_SCANCODE_A, KeyNo_LetterA},
  {SDL_SCANCODE_B, KeyNo_LetterB},
  {SDL_SCANCODE_C, KeyNo_LetterC},
  {SDL_SCANCODE_D, KeyNo_LetterD},
  {SDL_SCANCODE_E, KeyNo_LetterE},
  {SDL_SCANCODE_F, KeyNo_LetterF},
  {SDL_SCANCODE_G, KeyNo_LetterG},
  {SDL_SCANCODE_H, KeyNo_LetterH},
  {SDL_SCANCODE_I, KeyNo_LetterI},
  {SDL_SCANCODE_J, KeyNo_LetterJ},
  {SDL_SCANCODE_K, KeyNo_LetterK},
  {SDL_SCANCODE_L, KeyNo_LetterL},
  {SDL_SCANCODE_M, KeyNo_LetterM},
  {SDL_SCANCODE_N, KeyNo_LetterN},
  {SDL_SCANCODE_O, KeyNo_LetterO},
  {SDL_SCANCODE_P, KeyNo_LetterP},
  {SDL_SCANCODE_Q, KeyNo_LetterQ},
  {SDL_SCANCODE_R, KeyNo_LetterR},
  {SDL_SCANCODE_S, KeyNo_LetterS},
  {SDL_SCANCODE_T, KeyNo_LetterT},
  {SDL_SCANCODE_U, KeyNo_LetterU},
  {SDL_SCANCODE_V, KeyNo_LetterV},
  {SDL_SCANCODE_W, KeyNo_LetterW},
  {SDL_SCANCODE_X, KeyNo_LetterX},
  {SDL_SCANCODE_Y, KeyNo_LetterY},
  {SDL_SCANCODE_Z, KeyNo_LetterZ},
  {SDL_SCANCODE_0, KeyNo_Digit0},
  {SDL_SCANCODE_1, KeyNo_Digit1},
  {SDL_SCANCODE_2, KeyNo_Digit2},
  {SDL_SCANCODE_3, KeyNo_Digit3},
  {SDL_SCANCODE_4, KeyNo_Digit4},
  {SDL_SCANCODE_5, KeyNo_Digit5},
  {SDL_SCANCODE_6, KeyNo_Digit6},
  {SDL_SCANCODE_7, KeyNo_Digit7},
  {SDL_SCANCODE_8, KeyNo_Digit8},
  {SDL_SCANCODE_9, KeyNo_Digit9},
  {SDL_SCANCODE_BACKSPACE, KeyNo_BackSpace},
  {SDL_SCANCODE_SPACE, KeyNo_Space},
  {SDL_SCANCODE_TAB, KeyNo_Tab},
  {SDL_SCANCODE_RETURN, KeyNo_Return},
  {SDL_SCANCODE_COMMA, KeyNo_Comma},
  {SDL_SCANCODE_PERIOD, KeyNo_Dot},
  {SDL_SCANCODE_SLASH, KeyNo_Slash},
  {SDL_SCANCODE_RIGHT, KeyNo_CursorRight},
  {SDL_SCANCODE_LEFT, KeyNo_CursorLeft},
  {SDL_SCANCODE_DOWN, KeyNo_CursorDown},
  {SDL_SCANCODE_UP, KeyNo_CursorUp},
  {SDL_SCANCODE_LSHIFT, KeyNo_ShiftLeft},
  {SDL_SCANCODE_RSHIFT, KeyNo_ShiftRight},
  {SDL_SCANCODE_LCTRL, KeyNo_CtrlLeft},
  {SDL_SCANCODE_RCTRL, KeyNo_CtrlRight},
  {SDL_SCANCODE_LALT, KeyNo_AltLeft},
  {SDL_SCANCODE_RALT, KeyNo_AltRight},
  {SDL_SCANCODE_LGUI, KeyNo_AcornLeft},
  {SDL_SCANCODE_RGUI, KeyNo_AcornRight},
  {SDL_SCANCODE_F1,  KeyNo_Function1},
  {SDL_SCANCODE_F2,  KeyNo_Function2},
  {SDL_SCANCODE_F3,  KeyNo_Function3},
  {SDL_SCANCODE_F4,  KeyNo_Function4},
  {SDL_SCANCODE_F5,  KeyNo_Function5},
  {SDL_SCANCODE_F6,  KeyNo_Function6},
  {SDL_SCANCODE_F7,  KeyNo_Function7},
  {SDL_SCANCODE_F8,  KeyNo_Function8},
  {SDL_SCANCODE_F9,  KeyNo_Function9},
  {SDL_SCANCODE_F10, KeyNo_Function10},
  {SDL_SCANCODE_F11, KeyNo_Function11},
  {SDL_SCANCODE_F12, KeyNo_Function12},
  {SDL_SCANCODE_MINUS,          KeyNo_Minus},
  {SDL_SCANCODE_EQUALS,         KeyNo_Equals},
  {SDL_SCANCODE_LEFTBRACKET,    KeyNo_OpenSquare},
  {SDL_SCANCODE_RIGHTBRACKET,   KeyNo_CloseSquare},
  {SDL_SCANCODE_BACKSLASH,      KeyNo_BackSlash},
  {SDL_SCANCODE_SEMICOLON,      KeyNo_SemiColon},
  {SDL_SCANCODE_APOSTROPHE,     KeyNo_Tick},
  {SDL_SCANCODE_GRAVE,          KeyNo_BackTick},
  {SDL_SCANCODE_NONUSBACKSLASH, KeyNo_NotFittedLeft}
};

int out[SDL_NUM_SCANCODES];

int main() {
  for(int i = 0; i < sizeof(sdl2key) / sizeof(sdl2key[0]); ++i)
    out[sdl2key[i].sdl] = sdl2key[i].ro;

  printf("int sdl2key[%i] = {\n",  SDL_NUM_SCANCODES);

  for(int i = 0; i < SDL_NUM_SCANCODES; ++i)
    printf("  %i,\n", out[i]);

  printf("};\n#define KeyNo_Function12 (%i)\n", KeyNo_Function12);

}
