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

include Built/SDL_flags

all: sdl

sdl: Built/sdl
	ln -sf Built/sdl sdl

opengl: Built/opengl
	ln -sf Built/opengl opengl

Built/sdl: Unix/SocketKVMFrontends/sdl.cpp Built/sdlkey.h $(frontend_depends)
	g++ --std=c++11 -Wall -pthread -g -O2 -IBuilt Unix/SocketKVMFrontends/sdl.cpp $(SDL_FLAGS) -o Built/sdl

Built/opengl: Unix/SocketKVMFrontends/opengl.cpp $(frontend_depends)
	g++ -pthread -g -O2 --std=c++11 Unix/SocketKVMFrontends/opengl.cpp -lGL -lGLU -lglut -o Built/opengl

Built/sdlkey.h: Unix/SocketKVMFrontends/sdlkey.c $(lib_depends) Unix/SocketKVMFrontends/Keyboard.h Built/SDL_flags $(SDL_DEPS) | Built
	gcc -std=gnu99 -Wall -IBuilt Unix/SocketKVMFrontends/sdlkey.c $(SDL_FLAGS) -o Built/sdlkey
	Built/sdlkey > $@

Built/SDL_flags: Unix/SocketKVMFrontends/build.mk $(call pathsearch sdl2-config) | Built
	exec > $@
	if [[ "$$(sdl2-config --version)" != "2.0.12" ]]; then
	  echo SDL_FLAGS=`sdl2-config --cflags --libs`
	else
	  echo SDL_FLAGS=-Wl,-rpath,$(CURDIR)/Built/SDL/usr/lib -LBuilt/SDL/usr/lib -IBuilt/SDL/usr/include/SDL2 -D_REENTRANT -lSDL2
	  echo SDL_DEPS=Built/SDL/stamp
	  echo -n DEBARCH=
	  dpkg --print-architecture || { gcc Unix/SocketKVMFrontends/identify_abi.c -o Built/idenify_abi.c; Built/idenify_abi.c; }
	fi

Built/SDL/stamp: $(HOME)/Downloads/libsdl2-dev_2.0.9+dfsg1-1_$(DEBARCH).deb $(HOME)/Downloads/libsdl2-2.0-0_2.0.9+dfsg1-1_$(DEBARCH).deb
	set -o pipefail
	rm -rf Built/SDL
	mkdir -p Built/SDL
	cd Built/SDL
	echo -e '$(foreach t,$^,\n$($(t)) *$(t)\n)' | sha256sum -c
	for i in $^; do
	  ar x "$$i" data.tar.xz
	  tar xf data.tar.xz
	  rm data.tar.xz
	done
	mv usr/lib/*/* usr/lib/
	touch stamp

define debpkg1
$(HOME)/Downloads/$(1) := $(2)
$(HOME)/Downloads/$(1):
	sh Unix/LinuxSupport/download.sh '$(HOME)/Downloads/$(1)' '$(3)$(1)' '$(2)'
endef

debpkg = $(call debpkg1,$(1),$(2),http://deb.debian.org/debian/pool/main/libs/libsdl2/)

$(eval $(call debpkg,libsdl2-dev_2.0.9+dfsg1-1_amd64.deb,3ea18e9ddf0df52fe9cf37758f2ad364f7be9ece9bdbcd7de00dc98704ebf2a2))
$(eval $(call debpkg,libsdl2-2.0-0_2.0.9+dfsg1-1_amd64.deb,a058eaa5f38e0400fd1ffc6ea275c1cca52893955220ddcf4684c2d64af9aa19))

$(eval $(call debpkg,libsdl2-dev_2.0.9+dfsg1-1_arm64.deb,f234435019e3178c4f89afe7fd2f38d098a016d0c2aafbadeaf87e8743839098))
$(eval $(call debpkg,libsdl2-2.0-0_2.0.9+dfsg1-1_arm64.deb,9b6095f134e3d65edd789ffc44a5ea727ebf6b30e5bc84af5068769f5499027f))

$(eval $(call debpkg,libsdl2-dev_2.0.9+dfsg1-1_armel.deb,d18ca3e76d7fee99cad078205f51d119d081b666962044e19ac7808913daab95))
$(eval $(call debpkg,libsdl2-2.0-0_2.0.9+dfsg1-1_armel.deb,38d282189dd6d898248b8b71df5b90b28feebc624f6c8812eb20d4e0e842367d))

$(eval $(call debpkg1,libsdl2-dev_2.0.9+dfsg1-1_armhf.deb,f723196925eda4a1bb37a3585163eb57ca38099fa6a0cf382994a7bbfa562fd8,http://raspbian.raspberrypi.org/raspbian/pool/main/libs/libsdl2/))
$(eval $(call debpkg1,libsdl2-2.0-0_2.0.9+dfsg1-1_armhf.deb,fd46961feb1e227c096afd0ae550329733715f8d00223107508e881998f3c3cb,http://raspbian.raspberrypi.org/raspbian/pool/main/libs/libsdl2/))

$(eval $(call debpkg,libsdl2-dev_2.0.9+dfsg1-1_i386.deb,5bfffa26614b0fbbff12607a46d7e36e430da06e276a48e0a45d361353f2238c))
$(eval $(call debpkg,libsdl2-2.0-0_2.0.9+dfsg1-1_i386.deb,326b253877d642e0a45dba39fc91498177048b800293ebc9e36b499510cbf1cc))

$(eval $(call debpkg,libsdl2-dev_2.0.9+dfsg1-1_mips.deb,5de4de3e70f4cf58dad5f3d5d5fb8fd91dc9b9705fd78ce22c4e952c1b9a2d9a))
$(eval $(call debpkg,libsdl2-2.0-0_2.0.9+dfsg1-1_mips.deb,290dae8ca690d97830ef093a8e7ca6c82ca838a8ec38f5aa10aebf0d6eebaf4d))

$(eval $(call debpkg,libsdl2-dev_2.0.9+dfsg1-1_mips64el.deb,ebaba448fc73ed61979c809772e7bf8c0030e530db7f1cb1fd34d2d70871bcd8))
$(eval $(call debpkg,libsdl2-2.0-0_2.0.9+dfsg1-1_mips64el.deb,6684ba254813657d33eabafdd906de07b738259b4b561344575cfccc8bc250ad))

$(eval $(call debpkg,libsdl2-dev_2.0.9+dfsg1-1_mipsel.deb,8b3c4d2bedcbb7ae3bb171752ea9f3dea2d27ad86aa8e65854934cffd5e191ae))
$(eval $(call debpkg,libsdl2-2.0-0_2.0.9+dfsg1-1_mipsel.deb,a195df28a75848fcc8d41cfac5b878fcbc9c21f15aab556658ef9cf4a98c1d1a))

$(eval $(call debpkg,libsdl2-dev_2.0.9+dfsg1-1_ppc64el.deb,b7cd3ae12a0b620e6a6e1dce4e893e5e0f0fd7dfd44f0130ac7c91ef33ae9131))
$(eval $(call debpkg,libsdl2-2.0-0_2.0.9+dfsg1-1_ppc64el.deb,d67bc55a715f538e34e43e0fe0838fffa632be2ce0f79e8bbfabfea58e93d14c))

$(eval $(call debpkg,libsdl2-dev_2.0.9+dfsg1-1_s390x.deb,21274c7f6188427b5f753c7fdb15f1ce275d94614435b97b0418e1b9a060b225))
$(eval $(call debpkg,libsdl2-2.0-0_2.0.9+dfsg1-1_s390x.deb,2fb9893a63c2b442cdddc38f333bfd92636b26ed1e6884f35108960b94f65318))
