Since there is a lot of activity in using the FD-2 and/or PT69-5 to read/write tracks,
I will report this error before it causes someone problems.

Pins 14 and 15 are reversed on the 4049.  This results in there being no delay on head
load.  This probably will not cause any problems unless you were using a drive which
has a head load solenoid.  

In reality by the time  the FD-2 was released there were few drives that still loaded
the head on drive select.  Mostly SSSD drives used a head load and if you were using
a FD2, you wanted DSDD drives.  So with over 500 FD-2 boards sold, this problem was
never noticed.

The error was found when someone copied the FD-2 board and during troubleshooting
noticed  that pins 14 and 15 were reversed.  The pin numbers are wrong in the FD-2
schematic including the updated one.

BTW the FD-2A does not suffer from this problem.  The 4049 was replaced by a 74LS04
and a modern schematic entry/layout program (Eagle) prevents making this type of error.

 

Frederic Brown