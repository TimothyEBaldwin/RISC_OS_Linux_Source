/* Copyright 1996 Acorn Computers Ltd
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
#pragma force_top_level
#pragma include_only_once

/*
 * Copyright (c) 1989 Acorn Computers Ltd., Cambridge, England
 */

typedef char *va_list;
#define  va_dcl            int va_alist;
#define  va_start(list)    list = (char *) &va_alist
#define  va_end(list)
#define  va_arg(list,mode) ((mode *)(list += sizeof(mode)))[-1]
