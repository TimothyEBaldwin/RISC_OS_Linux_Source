# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
#
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
#
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
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
