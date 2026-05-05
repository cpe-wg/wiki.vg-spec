wiki.vg CPE Specification
=========================

The original Classic Protocol Extension spec, built into a static site hostable
on GitHub Pages and similiar hosts.

Dependencies
------------

You need a POSIX environment, pandoc and GNU Make.
If you are using Microsoft Windows 10 or newer, use Windows Subsystem for Linux (WSL).
Ports and packages of Pandoc are available for most BSD systems.

For Debian GNU/Linux and derivatives like Ubuntu:

    # apt install pandoc make

For Arch Linux and derivatives, you must have the Extras repository, then run:

    # pacman -S pandoc-cli make

For Fedora Linux:

    # dnf install pandoc-cli make
    
For Homebrew on Mac OSX:

    # brew install pandoc make

Building Instructions
---------------------

Use GNU Make to run the 'html' target

    $ make html

The static bundle will be in `build/html`.
