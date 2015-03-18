@ Copyright (c) 2020, Timothy Baldwin
@
@ Licensed under the Apache License, Version 2.0 (the "License");
@ you may not use this file except in compliance with the License.
@ You may obtain a copy of the License at
@
@     http://www.apache.org/licenses/LICENSE-2.0
@
@ Unless required by applicable law or agreed to in writing, software
@ distributed under the License is distributed on an "AS IS" BASIS,
@ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@ See the License for the specific language governing permissions and
@ limitations under the License.


@ Exit codes
@ 0 - success
@ 1 - Fail, EABI system calls don't work
@ 2 - Fail, Mystery SIGILL
@ 3 - Fail, QEMU hack interpreted as EABI system call
@ 4 - Fail, SIGILL from QEMU hack
@ 5 - Fail, QEMU hack returns ENOSYS
@ 6 - Fail, FPA instructions don't cause SIGILL
@ 7 - Fail, Unable to map low address space, try "sudo sysctl vm.mmap_min_addr=12288"

        udf
sigact:
        .long   handler, 0, 0, 0

        .global _start
_start:
        @ Install signal handler
        mov     r9, #2
        mov     r0, #4          @ SIGILL
        adr     r1, sigact
        mov     r2, #0
        mov     r7, #67         @ sigaction
        swi     0x900043        @ OABI sigaction

        mov     r9, #1
        mov     r7, #20         @ getpid
        mov     r0, #-1
        swi     0
        adds    r0, r0, #0x1000
        bcs     handler
        mov     r9, #2

        @ Test for SECCOMP
        @ ENOSYS or EINVAL if not present (old Linux or QEMU)
        mov     r0, #22         @ PR_SET_SECCOMP
        mov     r1, #2          @ SECCOMP_MODE_FILTER
        mov     r7, #172        @ prctl
        swi     0
        cmp     r0, #-38        @ -ENOSYS
        cmpne   r0, #-22        @ -EINVAL

        @ Test for ptrace
        @ ENOSYS if not present (QEMU)
        mov     r0, #12         @ PTRACE_GETREGS
        mov     r1, #0
        mov     r2, #0
        mov     r3, #0
        mov     r7, #26         @ ptrace
        swieq   0
        cmpeq   r0, #-38        @ -ENOSYS

        @ Test for QEMU hack
        @ Exit, ENOSYS or SIGILL if not present
        mov     r0, #3
        mov     r1, #0xFFFFFFFF

        mov     r7, #248        @ exit_group
        mov     r9, #4
        swieq   0xC0001         @ Enable qemu hack
        cmpeq   r0, #-38        @ -ENOSYS
        moveq   r9, #5
        beq     handler

        @ Test for mmap low memory
        mov     r0, #0x3000
        mov     r1, #0x5000
        mov     r2, #3          @ PROT_READ | PROT_WRITE
        mov     r3, #0x32       @ MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS
        mov     r4, #-1
        mov     r5, #0
        mov     r7, #192        @ mmap2
        mov     r9, #2
        swi     0
        teq     r0, #0x3000
        movne   r9, #7
        bne     handler

        @ Test mapped memory
        str     r1, [r0]
        ldr     r1, [r0, #4]

        @ Test for FPA instrction support - not wanted
        mov     r9, #0
        .long   0xEE008108      @ mvfs    f0, #1

        @ Reached if FPA works
        mov     r9, #6

handler:
        mov     r0, r9
        mov     r7, #1          @ exit
        swi     0x900001
        str     r0, [r0, -r0]   @ If exit doesn't work, try segfault
