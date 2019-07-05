
Notes on Wimp sources
---------------------

At the bottom of the Options file, I've set a few of the options to
the values that are required for me to test the code on my RISC PC -
if you set the switch to false, it'll use the settings that were
present when I received the sources - I don't know if those are the
settings you need for the NC or not.

The debug option is also on, so you may want to turn that off as well.

Apart from that, the only other thing you need to do is to add the
following message token to the Wimp's message file:

    BadParent:Sorry, child windows cannot be nested

It's probably not worth integrating my changes with yours just yet,
since I've about to embark on the next phase of development (nested
child windows etc.).

Let me know if you have any problems compiling the Wimp with these
sources.


Summary of test routines
------------------------

The main test program is Test.Nest1, which has a whole bunch of
keyboard shortcuts with which you can insert windows inside each other
in various nefarious ways.  The actual keys are listed in the program.

Test.Many is designed to check that braindead panic redraw works with
child windows.  This is what happens when the Wimp's rectangle
arithmetic overflows its rectangle list, thus requiring a more direct
approach to redraw the screen (start at the back and redraw everything
in turn, without worrying about which bits overlap).

Note that the Wimp's new redraw algorithm is much more sophisticated
than the old one, as it collects up all Wimp_OpenWindows since the
previous Wimp_Poll and performs them together, which allows it to do
far more block-copies (rather than redraws) when moving pane windows,
and can often move a parent and all its children with a single
block-copy.

Normally the new algorithm makes better use of the rectangle area than
the old one, but since it uses two lists of invalid rectangles, it's
possible that under some circumstances it may perform worse than the
old one, in which case I'd be interested to know about it.

Test.Multi is designed to show off the new multiple-block-copying
stuff, in that a series of child windows is being moved in a circle. 
Where each rectangle overlaps the one after it, the old Wimp has no
choice but to redraw all but the first one, whereas the new code is
able to block-copy all but one of the rectangles.

