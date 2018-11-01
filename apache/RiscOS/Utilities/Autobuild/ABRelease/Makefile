# Copyright 2009 Castle Technology Ltd
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
# Makefile for Autobuild
#
# This component should be placed into (any type of) builds as the final component
# so that it can perform any final installation tasks, such as copying files
# into archives, adding pre-built binaries, etc.
#
# If we're not running in an autobuild environemnt (i.e. AutoBuild$InstScript
# is unset) then this component will not do anything.

include StdTools

COMPONENT=ABRelease

clean clean_all export_hdrs export_libs rom install install_rom release_autobuild resources:
        @Do Set ab_csd$path <FileSwitch$CurrentFilingSystem>:|<FileSwitch$$<<FileSwitch$CurrentFilingSystem>$CSD>.
        @Set ab_res$dir     ab_csd:Resources.<Autobuild$Build>
        @Set ab_res$path    <ab_res$dir>.,ab_csd:Resources.<Build>.,ab_csd:Resources.Generic.
        @Set ab_build$dir   <AutoBuild$Root>.builds.<Autobuild$Build>
        @Set ab_build$path  <ab_build$dir>.
        @Set ab_local$zip   tmp/zip
        @Set ab_zip$file    ab_build:<Autobuild$Build>/zip
        @If "<Autobuild$Build>" <> "" Then CDir <ab_build$dir>
        @If "<Autobuild$Build>" <> "" Then IfThere ab_res:$@ Then Obey -v ab_res:$@ ${INSTDIR}
        @echo ${COMPONENT}: $@: complete
