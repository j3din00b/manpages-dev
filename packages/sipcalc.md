  SIPCALC
 
## NAME
        sipcalc - IP subnet calculator
 
## SYNOPSIS
        sipcalc [ -abcdehiInrsStuvx46 ] <[ADDRESS] [INTERFACE] ... | [ - ]>
 
## DESCRIPTION
        Sipcalc  is  an  ip  subnet  calculator consisting of two parts.  A plain text based console version, and web (cgi) based counterpart.  This manpage only ad‐
        dresses the console based version.  Sipcalc, in its simplest form takes an ip-address and a subnet mask on the commandline and outputs information about  the
        subnet.  Sipcalc has support for both IPv4 and IPv6 addresses.
 
        Sipcalc can take input in three forms, an ip-address/netmask, an interface or via stdin using the special character -.
 
        Address-IPv4
               Address must be given in the "standard" dotted quad format, ie.: xxx.xxx.xxx.xxx with an optional netmask that can be given in three different ways:
                - CIDR, ex. /n where n >= 0 <= 32.
                - Dotted quad, ex. xxx.xxx.xxx.xxx.
                - A hex value, ex 0xnnnnnnnn or nnnnnnnn.
 
        Address-IPv6
               Addresses  may  be  given  in  any of the forms defined in RFC2373, the netmask (prefix) must be given in CIDR notation.  Valid values for the netmask
               range from n >= 0 <= 128, default value if netmask is omitted is 128.
 
        Interface
               Instead of taking address information from the commandline sipcalc can  obtain relevant information by looking at a specified interface on the system.
               Sipcalc  then uses this information to calculate output values. This option is currently only available for IPv4 addresses, work is being done to sup‐
               port IPv6 here also.
 
        -      Further arguments will be read from stdin, this can be useful for example for cat(1) ing a list of addresses stored in a file to sipcalc.   Each  line
               sent to sipcalc should contain one address/netmask or interface.
 
        Any  number/combination  of  Address  and Interface arguments can exist on the commandline, however, the special character - must be the first argument or it
        will be parsed as an interface.  All options following the - character will be discarded.
 
        Features (IPv4) -
 
        *      Multiple address and netmask input formats.
 
        *      Retrieving of address information from interfaces.
 
        *      Classfull and CIDR output.
 
        *      Multiple address and netmask output formats (dotted quad, hex, number of bits).
 
        *      Output of broadcast address, network class, Cisco wildcard, hosts/range, network range.
 
        *      Output of multiple types of bitmaps.
 
        *      Output of a user-defined number of extra networks.
 
        *      Multiple networks input from commandline.
 
        *      DNS resolutions of hostnames.
 
        *      Parsing of a newline separated list of networks from standard input (STDIN).
 
        *      The ability to "split" a network based on a smaller netmask, also with recursive runs on the generated subnets.
 
        Features (IPv6) -
 
        *      Compressed and expanded input addresses.
 
        *      Compressed and expanded output.
 
        *      Standard IPv6 network output.
 
        *      v4 in v6 output.
 
        *      Reverse DNS address generation.
 
        *      DNS resolutions of hostnames.
 
        *      The ability to "split" a network based on a smaller netmask, also with recursive runs on the generated subnets.
 
        Output.
 
        Sipcalc output is divided into sections and subsections. Each section starts with the string "-[type : INPUT] - n" where type can be one of  int-ipv4,  ipv6,
        ipv4.  INPUT  is one input option from the commandline and n is the number of the section that this input option has produced currently displayed.  Currently
        the only input option that produces multiple output sections is an interface with multiple addresses. A subsection starts  with  the  string  "[IDENTIFIER]",
        where  IDENTIFIER  is  an  identifier for the subsection type.  The subsection types are based on the used commandline options.  Sections always end with the
        single character '-' alone on a line.  Worth mentioning is also that sections can include not only subsections, but also other sections, this currently  only
        happen when the -u and -s/-S options are used.  Warnings/errors etc. can also be displayed in the form -[type : message].
 
        Description of common output:
 
        [IPv4]
 
        Host address
               The given host address.
 
        Network address
               The first address in a given range, unusable for hosts under normal conditions.
 
        Network mask
               The  network mask (netmask) used to specify the size of a given subnet, usually represented in three different formats: dotted quad (xxx.xxx.xxx.xxx),
               hex (0xnnnnnnnn), and bits (/n where n >= 0 <= 32)
 
        Broadcast address
               The broadcast address of a given subnet, usually the last address in a range.
 
        Cisco wildcard
               The inverted value of the netmask (netmask ^ 0xffffffff).  This value is commonly used in for example access-lists on routers.
 
        Addresses in network
               The number of addresses in the given subnet.
 
        Network range
               The full subnet range.
 
        Usable range
               The range in the given subnet that is commonly used for normal hosts.
 
        [IPv6]
 
        Expanded Address
               The full expanded IPv6 address.
 
        Compressed address
               The IPv6 address compressed in the most efficient way possible.
 
        Subnet prefix
               The prefix of the address (in relation to the netmask), the suffix of the address is zeroed out.
 
        Address ID
               The suffix of the address (in relation to the netmask), the prefix of the address is zeroed out.
 
        Prefix address
               The IPv6 equivalent of the IPv4 netmask.
 
        Prefix length
               Number of bits set in the netmask.
 
        Address type
               The address type as defined in RFC2373.
 
        Comment
               Some addresses will have comments from the author.
 
        Network range
               The start and end addresses of the subnet.
 
        Expanded v4inv6 address
               The full expanded IPv6 address in v4inv6 format.
 
        Compr. v4inv6 address
               The compressed IPv6 address in v4inv6 format.
 
        Reverse DNS
               The address in IPv6 reverse DNS form.
 
## OPTIONS
        -a, --all
               Give all possible information about an address or interface, this is equivalent to giving the flags -b -c -i -n 0 for IPv4 and -e -r -t for IPv6.
 
        -b, --cidr-bitmap (IPv4)
               Display CIDR based bitmaps.
 
        -c, --classfull-addr (IPv4)
               Display classfull address information.
 
        -d, --resolve
               Enable name resolution.
 
        -e, --v4inv6 (IPv6)
               Display v4inv6 address information.
 
        -h, --help
               Display the commandline help.
 
        -i, --cidr-addr (default IPv4)
               Display CIDR address information.
 
        -I, --addr-int=INT
               Explicitly add an interface.  This can be used to circumvent the sipcalc "smart parsing" of addresses/interfaces on the commandline. This can be  use‐
               ful if you for example for some reason have an interface with the same name as an actual address, eg. 127.0.0.1 or ::1 etc.  See also: -4 -6.
 
        -n, --subnets=NUM
               Display NUM extra subnets (starting from the current subnet). Will display all subnets in the current /24 if NUM is 0.
 
        -r, --v6rev (IPv6)
               Display IPv6 reverse DNS information.
 
        -s, --v4split=MASK (IPv4)
               Split the current network into subnets of MASK size. MASK can be given in dotted quad, hex or CIDR form.
 
        -S, --v6split=MASK (IPv6)
               Split the current network into subnets of MASK size. MASK must be given in CIDR form, either with or with the '/' character.
 
        -t, --v6-standard (default IPv6)
               Display IPv6 address information.
 
        -u, --split-verbose
               This  will put network splitting into verbose mode.  This means that all the subnets generated when splitting a network will be passed back to sipcalc
               for explicit parsing giving the same output as if the address had been given on the commandline.  All options passed to  sipcalc  on  the  commandline
               will  also  be  inherited  when  the  subnet is passed back to sipcalc for parsing, with one exception, the -s/-S flag, we don't want an endless loop.
               Sending only the -s/-S and -u flags to sipcalc will give the default output (-i for IPv4 and -t for IPv6).
 
        -v, --version
               Display version information.
 
        -w, --wildcard
               Takes a cisco wildcard (inverse mask) and display the corresponding regular netmask and netmask bit count.
 
        -x, --classful-bitmap (IPv6)
               Display a classfull bitmap.
 
        -4, --addr-ipv4=ADDR
               Explicitly add an IPv4 address.  See also: -I -6.
 
        -6, --addr-ipv6=ADDR
               Explicitly add an IPv6 address.  See also: -I -4.
 
## BUGS
        Probably lots.  Known missing features include getting IPv6 addresses from interfaces and implementing the -n option for IPv6  addresses.   Please  send  any
        bugs, feature requests, patches, comments etc. to simon@routemeister.net.
 
 URL
        Sipcalc can be downloaded from http://www.routemeister.net/
 
## AUTHOR
        Simon Ekstrand <simon@routemeister.net>.
 
                                                                            19 January 2002                                                                SIPCALC(1)
