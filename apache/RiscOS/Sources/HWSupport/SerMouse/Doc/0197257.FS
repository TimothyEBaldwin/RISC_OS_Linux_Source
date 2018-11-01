Copyright © Acorn Computers Ltd. 1992      0197,257/FS Issue 0 ****DRAFT****

.start
    Jordan Keyboard/Mouse/Serial Mouse Software Functional Specification
    ====================================================================

                -----------------------------------------
                | Drawing No : 0197,257/FS              |
                |      Issue : 0 ****DRAFT****          |
                |       Date : 18th February 1993       |
                |     Author : Steve Cormie             |
                |     Sheets : 11                       |
                | Last Issue : None                     |
                -----------------------------------------

Contents
--------

1.      History
2.      Outstanding Issues
3.      Overview
4.      Keyboard
        4.1     Overview
        4.2     Technical Background
        4.3     Programmer Interface
        4.4     Reset
        4.5     External Dependencies
        4.6     Development Test Strategy
        4.7     Organisation
        4.8     Future Enhancements
5.      Mouse
        5.1     Overview
        5.2     Technical Background
        5.3     Programmer Interface
        5.4     User Interface
        5.5     External Dependencies
        5.6     Development Test Strategy
        5.7     Organisation
        5.8     Possible Enhancements
6.      Serial Mouse
        6.1     Overview
        6.2     Programmer Interface
        6.3     Data Formats
        6.4     Protocols
        6.5     External Dependencies
        6.6     Development Test Strategy
        6.7     Organisation
        6.8     Possible Enhancements


1. History
----------

0.00 SMC 19-Nov-92 Created.
0.01 SMC 30-Nov-92 Tidied up programmer interfaces and test strategies.
0.02 SMC 07-Dec-92 Changed to use PC-AT code set 3, not 2.
0.03 SMC 10-Dec-92 Minor modifications.
0.04 SMC 14-Dec-92 Added *Configure MouseType.
0.05 SMC 08-Jan-93 Changed from INKEY numbers to low-level key numbers.
0.06 SMC 14-Jan-93 Serial mouse driver must prevent serial being closed.
                   Added mouse switching scheme (eg. with 2 serial mice).
0.07 SMC 27-Jan-93 Added comments about multiple keyboard devices.
                   Removed outstanding issue on keypad.
                   Service_SetLEDs moved to KEYV reason code.
                   Removed need for minimal driver in kernel.
                   Module name changed to Keyboard.
                   Added Shift-Break to reset options.
                   Added keyboard present reason code to KEYV.
                   LocatorV renamed PointerV.
                   Service calls merged into PointerV.
                   OS_Pointer replaces OS_Word,21 extension.
                   !Configure operation clarified.
                   Test strategies extended.
0.08 SMC 03-Feb-93 Still need minimal keyboard driver in kernel.
                   Reversed LED bit order in KEYV call.
0.09 SMC 10-Feb-93 Button states now returned via. KEYV not PointerV.
0.10 SMC 18-Feb-93 Added reason code 4 (keyboard enable) to KEYV.


.end

2. Outstanding Issues
---------------------

There are no outstanding issues.


3. Overview
-----------

This document contains the software functional specification for changes to
RISC OS for Jordan which are required to drive an IBM style PC keyboard,
quadrature mouse and serial mouse.


4. Keyboard
-----------

4.1 Overview

This section contains a specification for the incorporation of a PC AT-style
keyboard driver into RISC OS for Jordan.  The described interface allows
more than one keyboard device to provide input at any one time.  Input from
multiple devices is merged into one stream as if coming from one device,
hence strange results can be expected if keys are held down on different
devices at the same time.


4.2 Technical Background

It has been determined that IOMD will provide an interface similar to that
provided by IOC.  This includes interrupts on receiver full and transmitter
empty, independent receive and transmit data registers, automatic parity
generation on transmitted data plus status and control registers providing
the capability to drive the keyboard Clock and Data lines directly.

The existing keyboard driving software is entwined in various parts of the
RISC OS kernel.  The final aim is to remove the keyboard driver from the
kernel so that other device drivers can provide keyboard input eg. special
needs devices.  To this end it has been determined that all the kernel needs
to know is when a key is pressed or released and all it needs to tell the
keyboard driver about is the state of the LEDs.  The only function of the
keyboard driver will be to drive the device, all other functionality eg.
calling key handlers, dealing with keyboard specific OS_Byte calls etc. will
still be taken care of by the kernel.


4.3 Programmer Interface

The first stage of development will involve isolating the keyboard driving
software from the rest of the kernel into separate files (but not a new
module yet).  The only communication between the code in these files and the
rest of the kernel will be subroutine calls for informing the kernel of keys
pressed and released, a call for the kernel to set LEDs and a call for
keyboard initialisation.  This kernel, which still retains the keyboard
driver, will be used for other development work (the keyboard will still
work if the system crashes during reset or module initialisation).

While the rest of the kernel is being developed and becomes more stable the
second stage of keyboard development will continue.  This will involve
removing the keyboard driving software into a separate module.  The keyboard
initialisation sub-routine will become the initialisation code for the new
module and interfaces will be defined as follows for the required
communication with the kernel.

The PC keyboard driver will claim keyboard device interrupts using SWI
OS_ClaimDeviceVector and will use vector KEYV to notify the kernel of keys
pressed or released.  This vector is a throwback to the old BBC days and is
not used in RISC OS so will now be defined as follows.


KEYV (Vector &13)
Communication between system and keyboard drivers.

On entry:       R0 = reason code 0 (keyboard present)
                R1 = keyboard id

                R0 = reason code 1 (key released)
                R1 = key number

                R0 = reason code 2 (key pressed)
                R1 = key number

                R0 = reason code 3 (set LEDs)
                R1 = status flags (0 = LED off, 1 = LED on)
                        bit     meaning
                        0       caps lock
                        1       num lock
                        2       scroll lock
                        3-31    reserved (set to 0)

                R0 = reason code 4 (keyboard enable)
                
On exit:        All registers preserved

Interrupts:     Interrupt status remains unchanged
                Fast interrupts are enabled

Processor mode: Processor is in IRQ or SVC mode

Use:            When a keyboard driver initialises successfully then it
                should call this vector with reason code 0 to notify the
                system that the keyboard is present.  The currently defined
                keyboard id values are:

                        1       Archimedes keyboard
                        2       PC-AT keyboard

                A keyboard device driver should call this vector with reason
                code 1 or 2 to notify the system of keys released or
                pressed.  The key code is the same as those given in key up
                and key down events.  

                A keyboard device driver can also claim this vector if it
                wants to change LED states on the device.  If the vector is
                claimed then reason code 3 provides information on current
                LED states.

                Keyboard drivers should not call KEYV to notify the system
                of keys pressed or released until this vector is called
                with reason code 4.  All calls received on this vector
                should be passed on to the next claimant.


The keyboard driver will assume that the keyboard will send scan codes from
IBM-MF compatible code set 2 (standard AT code set).  If the keyboard does
not support this set then pressing certain keys may produce unexpected
results.  The PC keyboard scan codes will be converted to low-level key
numbers before the vector is called.

Most PC keyboards auto-repeat keys held down.  In order to support our
current scheme of configuring the auto-repeat delay and repeat rate this
will not be used and keys will be repeated by the kernel using the existing
mechanism (the delay and rate are specified in centiseconds and key events
are generated by a routine sitting on TickerV).  The PC keyboard driver will
disable PC keyboard auto-repeat by keeping a table of flags for key states.
If a key is already flagged as being down then KEYV will not be called.


4.4 Reset

After some initial testing it appears that concerns about not being able to
detect keys down during power-up were unfounded.  If a PC AT-style keyboard
is reset or powered-up with keys down then the reset and basic assurance
test will still succeed and then start sending scan codes for keys down.

However, it is still felt that some rationalisation of the multitude of
current reset options is required.  In order to make the system more
understandable and "easy to use" the following scheme will be used.

Power-on                        Normal reset, use boot options.
Ctrl-Break                      Normal reset, use boot options.
Reset                           Normal reset, use boot options (used when
                                the keyboard does not respond).

Modifiers which can be used during a reset (however it was generated):

Shift                           Reverse action of configured boot option.
* (keypad)                      Use boot options but boot to command line
                                instead of the configured language.

Modifiers which can be used during a power-on reset only:

Delete                          Reset CMOS RAM.
R                               Partially reset CMOS RAM.
Copy                            As Delete but configures separate sync.
T                               As R but configures separate sync.
0-9 (keypad)                    Configure monitor type.
. (keypad)                      Configure auto monitor type, sync and mode.


These are the same as the existing reset options with the exception that all
resets are effectively hard resets.  As an exception to the above scheme,
pressing Shift-Break will cause the same action as pressing Ctrl-Shift-Break
ie. reset and reverse action of the configured boot options.

Note that the concepts of hard and soft reset will no longer be used.  The
above scheme makes power-on, Ctrl-Break and the Reset button do exactly the
same thing as far as the average user is concerned ie. a reset which gets
the machine into the configured working environment.  Power-on reset will
perform additional functions such as clearing memory.  The reset button need
only be used if the machine gets into a state where the keyboard does not
respond (for whatever reason).

The power-on modifiers are provided to make initial machine configuration
easier.  Only Delete or R should normally be required but the rest are
provided so that the machine can be configured to use a specific type of
monitor if automatic monitor type detection does not work (some monitors do
not support this).  Providing these modifiers avoids the user having to type
blind.

The kernel will contain a minimal PC keyboard driver so that keys down can
be detected during reset.  It was intended that the new keyboard driver
would occupy a known position in the ROM module list so that it could be
initialised in advance and independently of other modules.  However, it has
become apparent that this is not possible at present.  See the section on
future enhancements for a fuller explanation.


4.5 External Dependencies

A development podule which mimics the IOMD keyboard interface as closely as
possible has already been produced.  This will be used for development and
testing until Jordan prototypes become available.


4.6 Development Test Strategy

A number of keyboard system bashers will be written to test the following
areas to ensure that they still function correctly after the above changes
have been made.

1) Keyboard auto-repeat delay/rate (OS_Bytes &0B,&0C,&C4,&C5).
2) Function key definitions (OS_Byte &12).
3) Set keyboard LED status (OS_Byte &76).
4) Write keys pressed (OS_Byte &78).
5) Keyboard scan (OS_Bytes &79,&7A).
6) Escape handling.
7) Read keyboard information (OS_Byte &81).
8) Keyboard enable/disable (OS_Byte &C9).
9) Set keyboard status (OS_Byte &CA).
10) Set TAB key value (OS_Byte &DB).
11) Set escape character (OS_Byte &DC).
12) Set cursor key status (OS_Byte &04).
13) Set interpretation of buffer codes (OS_Bytes &DD-&E4).
14) Set escape key status (OS_Byte &E5).
15) Set escape effects (OS_Byte &E6).
16) Set cursor key status (OS_Byte &ED).
17) Set numeric keypad interpretation (OS_Byte &EE).
18) Set Break key actions (OS_Byte &F7).
19) Read last reset type (OS_Byte &FD).
20) Set effect of Shift and Ctrl on numeric keypad (OS_Byte &FE).
21) Install keyboard handler (OS_InstallKeyHandler).
22) Read escape state (OS_ReadEscapeState).
23) Set country, keyboard/alphabet (OS_Bytes &46,&47).
24) Service_International.

The keyboard driver must be capable of processing at least 20 characters per
second.

The Keyboard module will be tested with as wide a range of PC-AT style
keyboards as possible.  The driver must operate correctly if a keyboard is
unplugged or plugged in while the driver is active.


4.7 Organisation

The Keyboard module will reside in the RISC OS ROM and will be placed in a
known place in the module list.  All tests and expected results will be
documented fully and will reside in a "Test" directory with the PC keyboard
driver sources.


4.8 Future Enhancements

The kernel will still contain a minimal keyboard driver for detecting keys
down during reset.  This is unfortunate but unavoidable given the current
reset structure and time constraints on the project.  The ideal situation
would have the kernel initialise the keyboard driver before it needs to
detect whether any keys are down.  The problem is that the keyboard driver
module cannot be initialised before the vector handler and the soft CAM map
are set up.  However, the kernel needs to detect keys down BEFORE setting
them up since the contents of CMOS RAM affects the sizes set up in the CAM
map.  It may be possible to sort this out with some reorganisation but such
extensive changes would be time consuming and could be dangerous at this
stage.


5. Mouse
--------

5.1 Overview

This section contains a specification for the incorporation of a new
quadrature mouse driver into RISC OS for Jordan.  At present the mouse
driving software is entwined in the RISC OS kernel.  In order to support
different types of pointing devices (eg. a serial mouse) a new interface is
defined which extracts mouse control from the kernel.  Multiple pointing
devices can co-exist on the machine but only one can be active at any one
time.


5.2 Technical Background

IOMD will not provide interrupt support for mouse input.  Instead, IOMD will
provide two 16-bit registers (for X and Y directions) which increment,
decrement and wrap when the mouse is moved.  The state of the mouse buttons
will be reflected in a specified memory location.  These registers must be
polled regularly by the mouse driving software.

In the following text the term "pointer device" is used rather than "mouse"
because other types of pointing device eg. graphics tablet, could use the
same interface.


5.3 Programmer Interface

The RISC OS kernel will remain responsible for registering the mouse buffer
with the buffer manager, all mouse bounding, updating the mouse pointer on
the display and responding to OS_Mouse calls.  A new vector, PointerV, will
be created so that the kernel can maintain the current mouse position.

PointerV (Vector &??)
Communication between the system and pointer device drivers.

On entry:       R0 = reason code
                Other registers as for reason code

Interrupts:     Interrupt status is undefined
                Fast interrupts are enabled

Processor mode: Processor is in SVC mode


On entry:       R0 = reason code 0 (request pointer device state)
                R1 = device type
On exit:        R2 = signed 32-bit X movement
                R3 = signed 32-bit Y movement
                All other registers preserved

Use:            PointerV is called by the RISC OS kernel with reason code 0
                on VSync to obtain the latest pointer device movements.  The
                returned values will be used to update the pointer position.

                The signed 32-bit X and Y values are the amounts by which
                the pointing device has moved since the last time PointerV
                was called.

                The device type passed in R1 determines which claimant of
                PointerV will respond to the request.  Current device types
                are:

                        0       Quadrature mouse.
                        1       Microsoft compatible mouse.
                        2       Mouse Systems Corporation compatible mouse.

                If a claimant of PointerV is called but does not understand
                the device type then the call should be passed on.  If the
                claimant responds with a report then the call should be
                intercepted.

                When a pointer device driver initialises it should check the
                configured device type using SWI OS_Pointer (see below) and
                if it is one that is understood by the driver then the
                device should be enabled.

                Third parties should number device types from 128 (&80).

                The system treats mouse buttons as if they were keys on the
                keyboard.  If a pointer device driver is enabled (see
                pointer device selected call below) then it should notify
                the system of buttons being pressed or released by calling
                KEYV (see section 4.3).  The key codes for the buttons are
                as follows:

                        Left (SELECT)           &70
                        Centre (MENU)           &71
                        Right (ADJUST)          &72

                A pointer device driver does not need to debounce button
                presses, this is done by the system.


On entry:       R0 = reason code 1 (identify pointer types)
                R1 = pointer to device type record (0 for first recipient)
On exit:        R1 = pointer to drivers device type record list
                All other registers preserved

Use:            When a pointer device driver which claims PointerV receives
                this call it should create a linked list of device type
                records (one for each device type it supports):

                        Next pointer    4 bytes
                        Flags           4 bytes
                                                bit     meaning
                                                0-31    reserved (set to 0)
                        Device type     1 byte
                        Text            0 terminated menu text

                It should store the R1 value passed to it in the "next
                pointer" field of the record at the tail of the list and set
                R1 to point to the head of the list before passing on the
                call.  This call must not be intercepted.  The records must
                be claimed from the RMA and will be freed by the caller.
                The text should be no more than 30 characters.


On entry:       R0 = reason code 2 (pointer type selected)
                R1 = device type
On exit:        All registers preserved

Use:            When a device type is selected by OS_Pointer (see below)
                this call will be issued.  All pointer device drivers
                which do not understand the device type should disable (eg.
                the serial mouse driver would close device "serial:") and
                the driver which understands the device type should enable
                (eg. the serial mouse driver would open device "serial:").
                This call must not be intercepted.

                Only a device driver which has been enabled by this call
                (or enabled on initialisation) should call KEYV to notify
                the system of buttons being pressed or released.


A new module, Mouse, will be developed which will drive a quadrature mouse
using the IOMD interface.  This module will claim PointerV on initialisation
using SWI OS_Claim, passing the address of a sub-routine which conforms to
the above interface.  This sub-routine will poll the mouse position
registers in IOMD and return mouse movements calculated by subtracting the
previous values of these registers from the new ones.

The kernel will call the registered sub-routine on VSync and will scale the
mouse movements depending on the configured mouse step.  The pointer
position will then be updated on the display.

The active pointer device driver will call KEYV to notify the kernel of
buttons being pressed or released.  The kernel will treat these as any other
key including debouncing.

So that the pointer device type can be selected during machine operation a
new SWI OS_Pointer will be created.

OS_Pointer
(SWI &??)

On entry:       R0 = reason code 0 (get pointer type)
On exit:        R0 = pointer device type
                All other registers preserved

On entry:       R0 = reason code 1 (set pointer type)
                R1 = pointer device type
On exit:        All registers preserved.

Interrupts:     Interrupt status is not altered.
                Fast interrupts are enabled.

Processor mode: Processor is in SVC mode.

Use:            This SWI can be used to obtain the type of the pointer
                device currently in use or to select the pointer device type
                to be used.  The selected device type will be passed to
                claimants of PointerV in R1 when the system calls the vector
                to update its record of the pointer position.  Selecting a
                new type will cause LocatorV to be called with reason code 2
                (pointer type selected) so that drivers can enable or
                disable.


5.4 User Interface

It must also be possible to configure the pointer device type using
!Configure.  The Mouse configuration window in !Configure will be modified
as shown in related file "MouseWin".

!Configure will be modified so that LocatorV will be called with reason code
1 (identify pointer types) when the Mouse configuration window is opened.
This call will return a pointer to a linked list of device type records
containing device number and descriptive text.  The text will be used to
construct a menu which will allow selection of a device type.  The new
device type will be selected by calling SWI OS_Pointer in the manner
described below.  When the window is closed the linked list will be freed.

When switching from one type of mouse to another which uses the same port it
would be possible for the old mouse to generate reports as it is
disconnected.  These reports would then be interpreted by the new mouse
driver with unpredictable results.  To prevent this !Configure will disable
the mouse and pop up a dialogue which asks for the new device to be
connected.  If the user presses Return then the new mouse type will be
selected using SWI OS_Pointer but if Esc is pressed then the current type
is not changed.

A new *configure type, MouseType, will be created so that the mouse type
can be configured from the command line or can be read by the *Status
command.

The configured device type will be stored in CMOS RAM and will be used by
the kernel in PointerV calls after a reset or power-on.


5.5 External Dependencies

A development podule has already been produced which simulates the IOMD
mouse interface.  This will be used until IOMD becomes available at which
time a minimum amount of work should be required to complete development.


5.6 Development Test Strategy

To ensure that the quadrature mouse driver and the kernel function together
correctly a test program will be developed which will simulate mouse
movements by writing random movements to the X,Y counters every centisecond
(twice as fast as the driver is polled).  The mouse position will be checked
as the test progresses to make sure that no transitions are lost.


5.7 Organisation

The Mouse module will reside in the RISC OS ROM.  All tests and expected
results will be documented fully and will reside in a Test directory with
the mouse driver sources.


5.8 Possible Enhancements

The new vector, PointerV, could be incorporated into RISC OS for existing
hardware platforms with a minimum amount of extra work.  This will allow
other device drivers to claim control of the pointer on all of our RISC OS
product range.

At present, if the mouse step is configured to a value larger than 1 then it
can be difficult to make fine adjustments to the pointer position on the
display using a mouse.  The RISC OS kernel could be enhanced to provide some
degree of mouse acceleration ie. small, slow mouse movements cause small
pointer movements and hence allow fine adjustment of the pointer and large,
fast movements accelerate the pointer so that it reaches its destination
more quickly.


6. Serial Mouse
---------------

6.1 Overview

This section contains a specification for the incorporation of a serial
mouse driver into RISC OS for Jordan.


6.2 Programmer Interface

A new module, SerialMouse, will be developed which will drive a serial mouse
connected to the serial port of a Jordan hardware platform.  This module
will adhere to the same interfaces as the quadrature mouse module discussed
in section 5.  On initialisation this module will claim vector PointerV and
will respond to requests for device type 1 or 2 (serial mice).

When the serial mouse driver receives a PointerV call with reason code 2
(pointer type selected) and the device type is 1 or 2 the driver will
configure the serial device using OS_SerialOp and open device "serial:" for
input.  The driver will also claim vector TickerV and will process any data
received by the serial device on centisecond clock ticks.  Mouse movements
will be amalgamated until PointerV is called with reason code 0 (request
pointer device state) at which time a report will be returned to the kernel.

The device driver will call KEYV to notify the system of changes in button
state.

The serial mouse driver will not prevent the reconfiguration of the serial
port while the driver is active but will ensure that the "serial:" device is
reopened if it is closed by an external source.

If the serial mouse driver receives a PointerV call with reason code 2
(pointer type selected) and the device type is not 1 or 2 then the driver
will release vector TickerV and close device "serial:".

The code which is called on TickerV will reenable interrupts so that
interrupt latency is not adversely affected.  In order to prevent reentrancy
the code will set a flag while it is being executed.


6.3 Data Formats

The serial mouse driver will communicate with serial mice which transmit
data in one of two formats.  The first class of mice are Microsoft
compatible and send a data report with the following format.

                Bit 6   5       4       3       2       1       0
        Byte 1  1       L       R       Y7      Y6      X7      X6
             2  0       X5      X4      X3      X2      X1      X0
             3  0       Y5      Y4      Y3      Y2      Y1      Y0
  (Optional) 4  0       M       DT4     DT3     DT2     DT1     DT0

                L,R,M   = Key data (left, right, middle), 1 = key down
                X7-X0   = X distance 8 bit value (-128 to 127)
                Y7-Y0   = Y distance 8 bit value (-128 to 127)
                DT4-DT0 = device type (0 = mouse, all others reserved)

Not all 3-button mice generate the 4th byte in a report, in some cases when
the middle button is pressed L and R are both set to 1.  With mice that
generate a 4th byte for th middle key L and R are not affected.  The driver
will detect the state of the middle key in both cases.

The second class of serial mice are Mouse Systems Corporation compatible and
send reports in Five Byte Packed Binary format.

                Bit 7   6       5       4       3       2       1       0
        Byte 1  1       0       0       0       0       L       M       R
             2  X7      X6      X5      X4      X3      X2      X1      X0
             3  Y7      Y6      Y5      Y4      Y3      Y2      Y1      Y0
             4  X7      X6      X5      X4      X3      X2      X1      X0
             5  Y7      Y6      Y5      Y4      Y3      Y2      Y1      Y0

                L,M,R   = Key data (left, middle, right), 0 = key down
                X7-X0   = X distance 8 bit value (-128 to 127)
                Y7-Y0   = Y distance 8 bit value (-128 to 127)

The second set of X,Y data (bytes 4 and 5) is not a duplicate of the first
but the movement of the mouse during transmission of the first report and
cannot be discarded.

In both formats Y movement is negative to the south and positive to the
north.


6.4 Protocols

The serial mouse driver will only accept data from mice communicating in a
stream mode operating at 1200 baud.  Some devices support higher rates but
these must be selected by sending a command to the mouse and will not be
supported.  The mouse will generate reports at rates from 10 reports/sec to
continuously, with no intervals between successive reports.  A change in the
status of the buttons will generate a report immediately.  When the mouse is
motionless and the button status is unchanged no reports will be sent.

In Microsoft compatible format data is transferred in 7-bit bytes framed
with 1 start bit and 2 stop bits with no parity.  In Mouse Systems
Corporation compatible format data is transferred in 8-bit bytes framed
with 1 start bit and 2 stop bits with no parity.


6.5 External Dependencies

The serial mouse driver will be developed on a machine from the new A3000
range as these are the only products which have a serial port powerful
enough to drive a serial mouse.  It should be possible to complete all
development work before Jordan prototypes become available, leaving only a
small amount of testing.


6.6 Development Test Strategy

A test program will be developed which generates random mouse movements and
button presses by stuffing reports into the serial input buffer.  The mouse
position will be checked to ensure that no data is missed or inaccurate.
The test will be repeated with both of the supported report formats.

The SerialMouse module will be tested with a range of serial mice which use
either of the two supported report formats.


6.7 Organisation

The SerialMouse module will reside in the RISC OS ROM.  All tests and
expected results will be documented fully and will reside in a Test
directory with the serial mouse driver sources.


6.8 Possible Enhancements

If vector PointerV is included in RISC OS for non-Jordan hardware
platforms then a serial mouse could be used on all RISC OS machines with a
serial port powerful enough to drive a serial mouse.

The serial mouse driver could be extended to support more report formats eg.
Relative Bit Pad One Packed Binary, MM Series etc.  Each format would
require a new device type.
