# Copyright 2022 RISC OS Open Ltd
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

COMPONENT = AtomicTest
OBJS = module atomic1 bench
LIBS += ${ASMUTILS}
CMHGFILE = modhdr
CMHGDEPENDS = module
CUSTOMRES = custom
CFLAGS += -DNOMAIN

# The default is to use stdatomic.h & test the running CLib
# Enable this to directly include the stdatomic implementation
#OBJS += roatomic
#CFLAGS += -DUSE_ROATOMIC

include CModule

# Dynamic dependencies:
