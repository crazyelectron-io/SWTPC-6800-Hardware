# CT-1024

The SWTPC CT-1024 Terminal.

## TV Typewriter II (1975) Back Panel

The Southwest Technical Products CT-1024 TV Typewriter did not come with a case, just the circuit boards.
You had to build your own.
I restored three of these and built cases out of sheet aluminum.
For the back panel I made a paper template, I used Microsoft Word and an 11 x 17 printer.
I taped the template to the aluminum and drilled pilot holes.

### Back Panel Template

With a drill, a Dremel Tool, and some files, I made the back panel in a few hours.
Tools needed to make back panel

This worked but there were no labels.
In the 1970s I used a Leroy Lettering set to hand letter labels in ink.
I was looking into decal sheets that work with an inkjet printer.
I found a online front panel shop that would make one-off front panels for a reasonable price (www.frontpanelexpress.com).
They provide design software for doing the layout.
You can use it to make a paper template so you can do your own cutting and filing.

I found the software easy to use and I had the design done in a few hours.
This panel cost about $45 for one.
(Download this design file.)
This is a very good price for custom machine work.
I had the panel back in about a week (They happen to be in Seattle about 30 miles from my house).

### Fix =ing a death CT-1024

There were many problems with your CT-1024. Here is a summary of what I did.

I never powered up the unit as you sent it. I built a second case and
mounted the power supply and made new cables for the power and video out.
This is identical to my other restored CT-1024.

I then put the main board on it and powered it up.  There was no scan or
video, IC20 gate D (7405 inverter OC) was dead killing the dot clock. I put
a second 7405 on top of IC20 and replaced the gate, I soldered just 4 leads
with the rest in the air. This restored the scan but there was still no
video.

The character generator, IC22, had a good output but the shifter register
chain (IC24 and IC23) was not  working. IC 24 seemed OK but pin 10 of IC23
as stuck. I clipped the pins on the 7495 (IC23) and unsoldered the remaining
leads. I put a socket in and a new 7495 IC. I then had a screen full of
random characters.

I then hooked up the keyboard. Nothing. I tried the keyboard on another
CT-1024 and found the keypress jumper was set to + instead of -. I swapped
that.

I noticed there was no blinking cursor. I redrew the cursor portion of the
schematic to understand how it worked. I used a test lead to ground the
cursor inputs and found the cursor would come and go.

I installed the cursor control board and found the cursor did not work on
even addresses.  The A0 compare circuit uses an XOR gate made of IC40C,
IC40D, IC33E, and IC33F. I found the pin 5 of IC40 was floating and not
connected to A0. This 7403 was in a socket. The trace to pin 5 was cut so I
replaced it.

The keyboard would now enter characters but the cursor did not advance to
the next position. IC20 is also in this path so I replaced the 7405 and then
the cusor advanced with each character.

The keyboard doesn't produce all of the letters so I still need to fix that.

To get this far I had to replace two ICs (IC20 and IC23) and fix one cut
trace.
