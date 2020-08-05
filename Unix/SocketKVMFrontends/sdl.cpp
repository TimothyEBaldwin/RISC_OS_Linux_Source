/*
 * Copyright (c) 2016-2018, Timothy Baldwin
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <SDL.h>
#include <SDL_video.h>
#include <SDL_surface.h>

#include "sdlkey.h"
#include "frontend_common.h"

#include <getopt.h>
#include <poll.h>

#include <cstring>
#include <iostream>
#include <thread>
#include <atomic>

using std::cerr;
using std::endl;

namespace {

const int refresh_period = 50;
const int mode_change = 5555;
const int screen_update = 5554;
std::atomic<int> updates_pending;
bool use_close_message;
int log2bpp = 3;
int height = 480;
int width = 640;
int no_updates = 0;
SDL_Window *window;
SDL_Surface *screen;
int client_version;

void update_screen() {
  if (no_updates >= 0) {
    no_updates -= refresh_period * updates_pending.exchange(0);
  } else {
    updates_pending = 0;
  }

  if (no_updates <= 0 && get_file_size(screen_fd) >= (height * width) << log2bpp >> 3 ) {
    SDL_BlitSurface(screen, nullptr, SDL_GetWindowSurface(window), nullptr);
    SDL_UpdateWindowSurface(window);
  }
}

void watcher() {
  SDL_Event e;
  e.type = mode_change;
  SDL_Delay(1500);
  while(true) {
    struct pollfd pfd[] = {
      {sig_fd, POLLIN, 0},
      {sockets[0], POLLIN, 0},
    };
    poll(pfd, 2, 1000000000);
    SDL_PushEvent(&e);
  }
}

void refresh() {
  SDL_Event e;
  e.type = screen_update;
  while (true) {
    if (!updates_pending++) SDL_PushEvent(&e);
    SDL_Delay(refresh_period);
  }
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
        sdl2key[SDL_SCANCODE_F10] = KeyNo_Function12;
        sdl2key[SDL_SCANCODE_F11] = KeyNo_Function12;
        break;
    }
  }

  run_RISC_OS(argv + optind);

  SDL_SetHint(SDL_HINT_VIDEO_ALLOW_SCREENSAVER, "1");
  SDL_Init(SDL_INIT_VIDEO);
  window = SDL_CreateWindow("RISC OS", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);


  int cursor_active_x = 0;
  int cursor_active_y = 0;
  SDL_Surface* cursor_surface = SDL_CreateRGBSurface(0, 32, 32, 8,  0, 0, 0, 0);
  cursor_surface->format->palette->colors[0].a = 0;
  SDL_Cursor* cursor = nullptr;


  SDL_Palette *palette = SDL_AllocPalette(256);

  new std::thread {refresh};
  //new std::thread {watcher};

  uint32_t buttons = 0;
  while(true) {
    report r;

    exit_poll();

    while (true) {
      command c;


      int s = read_msg(c);
      if (s < 4) break;

      switch (c.reason) {
        case command::c_mode_change:
          height = c.mode.vidc[11];
          width = c.mode.vidc[5];
          log2bpp = c.mode.vidc[1];
          //cerr << "Set mode " << log2bpp << ' ' << height << ' ' << width << endl;
          SDL_FreeSurface(screen);
          screen = nullptr;
          switch (log2bpp) {
            case 3:
              screen = SDL_CreateRGBSurfaceFrom(pixels, width, height, 8, width, 0, 0, 0, 0);
              SDL_SetSurfacePalette(screen, palette);
              break;
            case 4:
              screen = SDL_CreateRGBSurfaceFrom(pixels, width, height, 16, width * 2,  0x1F, 0x1F << 5, 0x1F << 10, 0);
              break;
            case 5:
              screen = SDL_CreateRGBSurfaceFrom(pixels, width, height, 32, width * 4,  0xFF, 0xFF00, 0xFF0000, 0);
              break;
          }
          SDL_SetWindowSize(window, width, height);
          if (no_updates < 200) no_updates = 200;
          r.reason = report::ev_mode_sync;
          write(sockets[0], &r.reason, sizeof(r.reason));
          break;
        case command::c_suspend:
          no_updates = c.suspend.delay;
          update_screen();
          break;
        case command::c_set_palette: {
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
          SDL_SetSurfacePalette(screen, palette);
          break;
        }
        case command::c_pointer: {
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
        }
        update_cursor: {
          SDL_Cursor* cursor2 = SDL_CreateColorCursor(cursor_surface, cursor_active_x, cursor_active_y);
          SDL_SetCursor(cursor2);
          SDL_FreeCursor(cursor);
          cursor = cursor2;
          break;
        }
        case command::c_close_ctl:
          use_close_message = c.close_ctl.use_message;
          break;
        case command::c_version: {
          resend_keys();
          client_version = c.version.version;
          report r;
          r.reason = report::ev_version;
          r.version.version = 1;
          send_report(r);
          break;
        }
      }
    }

    SDL_Event e;
    SDL_WaitEvent(&e);
    switch(e.type) {
      case mode_change:
        break;
      case screen_update:
        update_screen();
        break;
      case SDL_WINDOWEVENT:
        switch(e.window.event) {
          case SDL_WINDOWEVENT_RESIZED: {
            report r;
            r.reason = report::ev_resize;
            r.mouse.x = e.window.data1;
            r.mouse.y = e.window.data2;
            send_report(r);
            if (no_updates < 200) no_updates = 200;
            break;
          }
          case SDL_WINDOWEVENT_EXPOSED:
            SDL_UpdateWindowSurface(window);
            break;
        }
        break;
      case SDL_QUIT:
        if (use_close_message) {
          report r;
          r.reason = report::ev_close;
          send_report(r);
        } else {
          kill(pid, SIGTERM);
        }
        break;
      case SDL_KEYDOWN:
        report_key(sdl2key[e.key.keysym.scancode], true);
        break;
      case SDL_KEYUP:
        report_key(sdl2key[e.key.keysym.scancode], false);
        break;

      case SDL_MOUSEBUTTONDOWN:
        report_key(KeyNo_LeftMouse + e.button.button - 1, true);
        break;
      case SDL_MOUSEBUTTONUP:
        report_key(KeyNo_LeftMouse + e.button.button - 1, false);
        break;
      case SDL_MOUSEMOTION:
        buttons = static_cast<uint32_t>(e.motion.state);
        r.reason = report::ev_mouse;
        r.mouse.x = static_cast<uint32_t>(e.motion.x);
        r.mouse.y = client_version >= 2 ? static_cast<uint32_t>(e.motion.y):  (height - static_cast<uint32_t>(e.motion.y));
        r.mouse.buttons = buttons;
        send_report(r);
        //std::cerr << "Motion " << r.x << ' ' << r.y << ' ' << r.buttons << std::endl;
        break;
    }
  }
}
