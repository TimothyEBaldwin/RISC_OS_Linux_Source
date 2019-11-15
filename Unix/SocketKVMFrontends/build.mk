#!/usr/bin/make -f
#
# Copyright (c) 2013-2018, Timothy Baldwin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

frontend_depends := Unix/SocketKVMFrontends/Keyboard.h Unix/SocketKVMFrontends/frontend_common.h Unix/SocketKVMFrontends/SocketKVM_Protocol.h $(lib_depends)

all: sdl

sdl: Built/sdl
	ln -sf Built/sdl sdl

opengl: Built/opengl
	ln -sf Built/opengl opengl

Built/sdl: Unix/SocketKVMFrontends/sdl.cpp Built/sdlkey.h $(frontend_depends)
	g++ --std=c++11 -Wall -pthread -g -O2 -IBuilt Unix/SocketKVMFrontends/sdl.cpp  `sdl2-config --cflags --libs` -o Built/sdl

Built/opengl: Unix/SocketKVMFrontends/opengl.cpp $(frontend_depends)
	g++ -pthread -g -O2 --std=c++11 Unix/SocketKVMFrontends/opengl.cpp -lGL -lGLU -lglut -o Built/opengl

Built/sdlkey.h: Unix/SocketKVMFrontends/sdlkey.c $(lib_depends) Unix/SocketKVMFrontends/Keyboard.h | Built
	gcc -std=gnu99 -Wall -IBuilt Unix/SocketKVMFrontends/sdlkey.c `sdl2-config --cflags --libs` -o Built/sdlkey
	Built/sdlkey > $@
