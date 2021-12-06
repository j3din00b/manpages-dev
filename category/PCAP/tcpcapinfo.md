tcpcapinfo(1)                                                                          User Commands                                                                         tcpcapinfo(1)

NAME
       tcpcapinfo - Pcap file dissector for debugging broken pcap files

SYNOPSIS
       tcpcapinfo [-flags] [-flag [value]] [--option-name[[=| ]value]] <pcap_file(s)>

       tcpcapinfo is a tool for decoding the structure of a pcap(3) file with a focus on finding broken pcap files and determining how two related pcap files might differ.

DESCRIPTION
       tcpcapinfo will first print out the pcap_file_header_t in human readable form followed by a per-packet summary including the pcap_pkthdr_t and simple checksum value of the packet.

OPTIONS
       -d number, --dbug=number
              Enable debugging output.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 5
              The default number for this option is:
                   0

              If configured with --enable-debug, then you can specify a verbosity level for debugging output.  Higher numbers increase verbosity.

       -V, --version
              Print version information.

       -H, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

AUTHORS
       Copyright 2000-2012 Aaron Turner Copyright 2013 Fred Klassen - AppNeta For support please use the tcpreplay-users@lists.sourceforge.net mailing list.  The latest version of this
       software is always available from: http://tcpreplay.appneta.com/

COPYRIGHT
       Copyright (C) 2000-2012 Aaron Turner and Fred Klassen all rights reserved.  This program is released under the terms of the GNU General Public License, version 3 or later.

BUGS
       Please send bug reports to: tcpreplay-users@lists.sourceforge.net

NOTES
       This manual page was AutoGen-erated from the tcpcapinfo option definitions.

Tcpreplay Suite                                                                         01 May 2021                                                                          tcpcapinfo(1)
