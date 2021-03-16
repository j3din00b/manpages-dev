cbm(1)                                                     display in real time the network traffic speed                                                     cbm(1)

NAME
       cbm - display in real time the network traffic speed

SYNOPSIS
       cbm [--help] [--version]

DESCRIPTION
       Color Bandwidth Meter (CBM) displays the current traffic on all network devices.

       This program is so simple that it should be self-explanatory.

OPTIONS
       --help Display some help and exit.

       --version
              Display version information and exit.

INTERACTIVE CONTROL
       cbm can be controlled with the following keys:

       Up/Down
              Select an interface to show details about.

       q      Exit from the program.

       b      Switch between bits per second and bytes per second.

       +      Increase the update delay by 100ms.

       -      Decrease the update delay by 100ms.

AUTHOR
       cbm  was originally developed by Aaron Isotton <aaron@isotton.com>. You may use it under the terms of the GNU General Public License, version 2. The original
       website was http://www.isotton.com/utils/cbm/

       Currently, source code and newer versions are available at https://github.com/resurrecting-open-source-projects/cbm

       This manpage was written by Aaron Isotton and updated by Joao Eriberto Mota Filho.

cbm-0.2                                                                     09 Feb. 2019                                                                      cbm(1)
