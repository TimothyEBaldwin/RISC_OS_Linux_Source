# Copyright 2008 Castle Technology Ltd
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
# Makefile for the Build System Binary Build Environment
#
# $Id: Makefile,v 1.1 2008/10/14 21:29:40 bavison Exp $
#

BBETYPE = env
bbe-env: bbe-generic-resources-get-alias
  BBE_Export_File ${ENVFILE}
  BBE_Export_File !Common
  ${CP} MakefileBBE ${BBEDIR}.Makefile ${CPFLAGS}
  BBE_Export_File VersionNum


# Determine whether the macro processor in amu works or not
FIXED = no
find-amu-version:
  @set BuildSys$AMU$Fixed ${FIXED}
