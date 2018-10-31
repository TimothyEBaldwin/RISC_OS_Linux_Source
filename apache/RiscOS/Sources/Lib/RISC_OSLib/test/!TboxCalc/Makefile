# Copyright 2003 Tematic Ltd
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
# Project: !TboxCalc


# Toolflags:
CCflags = -c -g -depend !Depend -Itbox:,C: -throwback
Linkflags = -d -o $@ 
Squeezeflags = -f $@

# Final targets:
@.!RunImage: @.o.Main @.o.Calc @.o.foo @.^.^.lib.ansilib tbox:o.toolboxlib
       Link $(Linkflags) @.o.Main  @.o.Calc @.o.foo @.^.^.lib.ansilib tbox:o.toolboxlib tbox:o.eventlib tbox:o.wimplib
       
       
# User-editable dependencies:


# Static dependencies:
@.o.Main:     @.c.Main
           cc $(ccflags) -o @.o.Main @.c.Main
           
@.o.Calc:     @.c.Calc
           cc $(ccflags) -o @.o.Calc @.c.Calc

@.o.foo:      @.s.foo
           objasm $(asflags) -o @.o.foo @.s.foo           
           
# Dynamic dependencies:
