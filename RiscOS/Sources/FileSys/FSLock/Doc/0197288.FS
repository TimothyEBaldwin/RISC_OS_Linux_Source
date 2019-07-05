Copyright (C) Acorn Computers Ltd. 1993     0197,288/FS Issue 1             

                   FSLock and Reset Functional Specification
                   =========================================

                   -----------------------------------------
                   | Drawing No : 0197,288/FS              |
                   |      Issue : B                        |
                   |       Date : 19th October 1993        |
                   |     Author : Jonathan Roach           |
                   |     Sheets :                          |
                   | Change No  :                          |
                   |  Last Issue: None                     |
                   -----------------------------------------

 Contents
 ========

 1 History

 2 Outstanding Issues

 3 Overview

 4 Technical Background

 5 Reset Behaviour

 6 The FSLock Module
    6.1 SWIs
         6.1.1 FSLock_Version
         6.1.2 FSLock_Status
         6.1.3 FSLock_ChangeStatus
    6.2 FSLock Commands
         6.2.1 FSLock_Lock
         6.2.2 FSLock_ChangePassword
         6.2.3 FSLock_Unlock
         6.2.4 FSLock_Status
    6.3 FSLock Errors

 7 Development Test Strategy
    7.1 FSLock SWI Testing
    7.2 FSLock Command Testing
    7.3 FSLock Interaction Testing

 8 Organisation


1 History
=========

A 07 October 1993  JSR  Turned into functional spec from notes.
B 19 October 1993  HSR  Install the changes from the spec review.

2 Outstanding Issues
====================

None

3 Overview
==========

This functional specification covers the action of the FSLock feature of
Medusa, and the changes to the behaviour of Reset. The reason these have
been described together is that the Reset changes have been largely
triggered by the FSLock requirements.

Note that the user interface for locking, unlocking and password change is
covered elsewhere (see 0197,289/FS: Medusa !Boot Functional Specification).

FSLock provides protection against inadvertent (and malicious) changing of
the CMOS RAM contents and hard disc contents. To do this is intercepts the
SWIs to update CMOS RAM and hard disc contents and returns an error instead.
Of course, a machine which allowed no hard disc updates is not very useful,
so two areas of the disc have been left unprotected:
$.public
$.!Boot.Resources.!Scrap.ScrapDir
The first is to allow general file storage, the second is to allow Scrap
transfers of files between applications.

The system is not designed to be fool-proof, but is intended to protect
against accidental attempts to change hard disc or CMOS RAM contents, and
against malicious attempts by unsophisticated users.

Only FileCore-based filing systems can be protected, and the user interface
(!Configure) further assumes that the system to be protected is ADFS. This
means, for example, that the only way to protect a SCSI disc instead of an
ADFS disc is to use *-commands.

The changes to Reset behaviour are to close the loophole of delete-power-on
and to ensure a reset really always starts the machine afresh.

4 Technical Background
======================

On RISC OS 3.10 Reset performed the following functions:

Power-On-Self-Test (POST) (1)
Clear RAM (2)
Check keyboard for CMOS RAM clearing
Initialise the OS

(1) POST was performed on power-on resets only.

(2) Clearing RAM depended on whether *fx200,2 had been done before the
reset, and whether it was a power-on reset or not.

This whole sequence had many variantions depending on whether it was a
power-on reset, ordinary reset or break style reset, whether *fx200,2 had
been done before the reset, and so on. To most users this degree of
flexibility was never useful simply because it was so complex.


5 Reset Behaviour
=================

In Medusa the reset is going to be rationalised down to the following cases:

Reset caused by pressing the reset button at the back of the case and Reset
caused by powering the machine on will perform the same function. This will
be ensured by the hardware only ever generating the 'power on' flavour of
reset. The full sequence of reset operations will be performed. This means
that all power-on and reset button resets will:

* Perform power-on self test
* clear RAM
* check for CMOS RAM clearing
* initialisae the OS

Reset cause by Break being pressed in combination with one or other of Ctrl
or Shift will skip the POST and CMOS RAM clearing, but otherwise function
the same. In other words this sort of reset will:

* clear RAM
* initialise the OS

CMOS RAM clearing will be controlled by what keys are held down, and by the
state of the protected connector inside the machine. The protected connector
is new to Medusa. With the protected connector in the unprotected position
the CMOS RAM clearing funtions in the same way as it did in RISC OS 3.10.
With the protection connector in the protected position the machine's CMOS
RAM is protected against being altered in this way. No matter what keys are
held down, if the protection connector is in the protected position CMOS RAM
will not be changed in any way as part of any reset sequence.

As a consequence of these changes OS_Byte &FD which reads last reset type
will always return 1, ie "power-on reset".

6 The FSLock Module
===================

This module performs the function of protecting the CMOS RAM and hard disc
against unwanted modification. It is a derivative of a product called
FSLock developed in New Zealand which was bought by Acorn UK. The Medusa
version will be internationalised - the two unprotected directories' names
will be held in the messages file. The $.Public directory will be provided
on the hard disc as shipped with instructions in the manual about removing
it.

The FSLock module operates in three states:

Fully unlocked

In this state the machine has no password allocated to it. The machine can
have its hard discs or configuration modified. This state persists over any
sort of reset. A delete-power-on will set the machine to this state.

Partially unlocked

In this state the machine has a password allocated to it. The machine can
have its hard discs (1) and configuration modified, although if reset the
machine will revert to being locked.

Locked

In this state the machine has a password allocated to it. The machine is
protected against having its hard discs (2) or configuration modified. The
machine will stay in this state if it is reset.

1) Not all discs on all filing systems are protected. The FSLock module will
protect drives 4-7 on any one filing system. The Medusa !Configure sets
FSLock to protect the ADFS hard discs 4-7.

2) It should be noted that if the whole hard disc was protected against
modification that the system would be fairly useless. To get around this
FSLock permits writing to anything with the following directories: $.Public
$.!Boot.Resources.!Scrap.ScrapDir

Changing the password or dropping the protection level will require the old
password to be given. As far as the SWIs are concerned this password can be
any 0-terminated string. However, the !Configure application restricts the
password to more than 4 non-space characters acceptable in a writeable icon.
The password is checked in a case-sensitive fashion. It is recommended that
an application using the SWIs should not provide passwords which can't be
entered in a writeable icon in the desktop. This is to avoid locking the
machine with an untypable password.

6.1 SWIs
--------

In these SWIs the lock status is one of these values:
 0 - Fully Unlocked
 1 - Partially unlocked
 2 - Locked

The module will only contain a text entry for FSLock_Version to further
hinder the curious tinkerer from breaking the protection. All the FSLock
SWIs will respond to being invoked by SWI number, but only FSLock_Version
will respond to the SWI name.

6.1.1 FSLock_Version (&44780)
.............................

In
  R0 = flags:
        bit     meaning
        0-31    reserved for future use - set to 0
Out
  R0 = version number * 100
  R1 = Pointer to module's workspace

This SWI returns information describing the module. R0 gives the module's
version number and r1 gives a pointer to the module's workspace.


6.1.2 FSLock_Status (&44781)
............................

In
  R0 = flags:
        bit     meaning
        0-31    reserved for future use - set to 0
Out
  R0 = lock status
  R1 = filing system locked (undefined if status = 0)

This SWI returns the current lock status and the filing system which has
been locked. The filing system number of the locked filing system is given.


6.1.3 FSLock_ChangeStatus (&44782)
..................................

In
  R0 = new status
  R1 = old password (*)
  R2 = new password (*)
  R3 = new filing system number (*)
  R4 = flags:
        bit     meaning
        0-31    reserved for future use - set to 0
Out
  -

(*) This table describes when the passwords must be given:

        Old lock status
            0       1       2
New    0    -       O       O
lock   1    N       ON      O
status 2    N       -       ON

O - Old password must be given
N - new password and filing system number must be given

If the old password is needed and not given correctly an error will be
returned. If a filing system number is needed then a check will be made for
that filing system's existance.


6.2 FSLock Commands
-------------------


6.2.1 FSLock_Lock
.................

Syntax:
FSLock_Lock

This command will lock the machine from the partially unlocked state. If the
machine is fully unlocked or locked then a suitable error message will be
given.


6.2.2 FSLock_ChangePassword
...........................
                     
Syntax:
FSLock_ChangePassword <FSName> <0 to 3 password>

This command changes the filing system which is locked and the password it
is locked with. The following table describes the changes of state which
apply and which passwords are needed:

Old State         New state         Passwords
unlocked          partially locked  the new one twice
partially locked  partially locked  the new one twice and the old one
locked            locked            the new one twice and the old one

If any of the passwords needed aren't supplied in the command then FSLock
will prompt the user to type them in. The characters typed will be echoed
back with '-' characters. The new password is required to be entered twice
so that if the user mistypes this will be caught. This is important to do
because unlocking a machine who's password isn't known because it was
mistyped could be very hard.

6.2.3 FSLock_Unlock
...................

Syntax:
FSLock_Unlock [-full] [Password]

This unlocks the machine. If the -full switch is given then the machine will
be fully unlocked, otherwise a partial unlock will be done. If the password
is not given then the user will be prompted for the password. At this prompt
all characters are displayed as hyphens ('-') so that reading over the
shoulder won't work. If the machine is already in the required state
(partially or fully unlocked) then an appropriate error will be given.


6.2.4 FSLock_Status
...................

Syntax:
FSLock_Status

This command displays the machine's status:

Unlocked:
No filing system is currently locked.

Partially locked:
The filing system ADFS is temporarily unlocked.

Locked:
The filing system ADFS is currently locked.


FSLock Errors
-------------

&806500 : SWI value out of range for module FSLock
          An unknown FSLock SWI has arrived for decoding.

&806501 : A filing system is already locked.
          Only one FS is allowed to be locked at a time, and this must be
          unlocked before a new one can be locked.

&806502 : This filing system is not currently active.
          An attempt was made to lock a filing system the kernel currently
          knows nothing of (poosibly because it is still dormant). Or you
          screwed up when typing in the name.

&806503 : This filing system cannot be locked.
           An attempt was made to lock a filing system for which locking is
           pointless, eg. ramfs, printer, vdu, kbd etc.

&806504 : No filing system is currently locked.
          An attempt was made to unlock a filing system when no FS is
          currently locked.

&806505 : The disc is write protected.
          An attempt was made to write to/modify the contents of a locked
          hard drive.

&806506 : FSLock cannot be killed.
          An attempt was made to kill the FSLock module permanently.

&806507 : FSLock_ChangeStatus parameters not recognised.

&806508 : Password not recognised.
          An attempt to do something which needed a password was made, bu
          the password given was incorrect.

&806509 : The configuration is protected against changes.
        The CMOS RAM is currently protected.

&80650A : The system must be given a password to perform this operation.
        You can't lock the system without a password.

&80650B : The new password cannot be set as the two copies are not the same.
        In FSLock_ChangePassword the two passwords must be the same.

7 Development Test Strategy
===========================

7.1 FSLock SWI Testing
----------------------

A PHTester script will be written which exercises all the SWIs. In
particular, it will verify that undefined SWIs in the same SWI chunk come
back with the correct error. It will check that invalid parameters are
errored. It will check that operations which require passwords fail if an
incorrect password is given and succeed if a correct password is given. SWIs
which move from state to state will be checked that they move between the
states they claim they have done, and all state changes will be checked as
the number of states is small enough to do this.

7.2 FSLock Command Testing
--------------------------

A PHTester script will be written to do a similar set of tests as the SWI
testing script.

7.3 FSLock Interaction Testing
------------------------------

Other software will be tested against FSLock to ensure the interactions are
clean. In particular:
Applications which write to CMOS RAM will be checked that they remain
healthy when the CMOS RAM is locked. In particular the FIler and CDFS will
be checked.
FSLock will be checked that it behaves sensibly when it is requested to lock
a non-FileCore/ADFS based filing system. In particular SCSIFS, NetFS and
ResourceFS will be checked.

8 Organisation
==============

The FSLock module and kernel are both in the ROM. The FSLock locking and
unlocking user interface for the desktop is inside !Configure which is on
the disc.
