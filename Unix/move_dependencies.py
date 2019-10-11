#!/usr/bin/python3
#
# Copyright (c) 2019, Timothy Baldwin
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

# Runs on Python 3 on unix or possibly Windows.
# Run with path to "RiscOS" directory as first argument

import os
import sys
import glob

os.chdir(sys.argv[1])

def paths():
    with open("BuildSys/ModuleDB") as components:
        for component in components:
            component = component.strip()
            if component == "" or component.startswith("#"):
                continue
            component = component.split()
            yield component[2].replace(".", "/").replace("^", "..")

for path in paths():
    try:
        with open(path + "/Makefile", mode="r+b") as mf:
            print("Processing", path)
            p = 0
            include_last = False
            while True:
                line = mf.readline()
                if line == b"":
                    # EOF, so no dynamic dependencies, so go to next component
                    raise StopIteration()

                if line.startswith(b"# Dynamic dependencies:"):
                    break

                # Record location to truncate to
                # But not for blank lines the follow lanes that begin with "include"
                if not include_last or line != b"\n":
                    p = mf.tell()
                    include_last = line.startswith(b"include")

            mf.seek(p)
            mf.write(b"include Depends\n")
            mf.truncate()

        for of in glob.glob(glob.escape(path) + "/*,fd7"):
            with open(of, mode="r+b") as of:
                lines = list(of)
                of.seek(0)
                of.truncate()
                ensured = False
                for line in lines:
                    line2 = line.rstrip()
                    if line2 == b"stripdepnd" or line2 == b"stripdepnd Makefile":
                        line = b"Remove Depends\n"
                    if line.lower().startswith(b"amu") and not ensured:
                        line = b"EnsureDepends Depends\n" + line
                        ensured = True
                    of.write(line)

    except (StopIteration, FileNotFoundError):
        pass
