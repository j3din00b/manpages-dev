NCDU(1)                                                                      ncdu manual                                                                     NCDU(1)

NAME
       ncdu - NCurses Disk Usage

SYNOPSIS
       ncdu [options] dir

DESCRIPTION
       ncdu (NCurses Disk Usage) is a curses-based version of the well-known 'du', and provides a fast way to see what directories are using your disk space.

OPTIONS
   Mode Selection
       -h, --help
           Print a short help message and quit.

       -v, -V, --version
           Print ncdu version and quit.

       -f FILE
           Load the given file, which has earlier been created with the "-o" option. If FILE is equivalent to "-", the file is read from standard input.

           For the sake of preventing a screw-up, the current version of ncdu will assume that the directory information in the imported file does not represent the
           filesystem on which the file is being imported. That is, the refresh, file deletion and shell spawning options in the browser will be disabled.

       dir Scan the given directory.

       -o FILE
           Export all necessary information to FILE instead of opening the browser interface. If FILE is "-", the data is written to standard output.  See the
           examples section below for some handy use cases.

           Be warned that the exported data may grow quite large when exporting a directory with many files. 10.000 files will get you an export in the order of 600
           to 700 KiB uncompressed, or a little over 100 KiB when compressed with gzip. This scales linearly, so be prepared to handle a few tens of megabytes when
           dealing with millions of files.

       -e  Enable extended information mode. This will, in addition to the usual file information, also read the ownership, permissions and last modification time
           for each file. This will result in higher memory usage (by roughly ~30%) and in a larger output file when exporting.

           When using the file export/import function, this flag will need to be added both when exporting (to make sure the information is added to the export),
           and when importing (to read this extra information in memory). This flag has no effect when importing a file that has been exported without the extended
           information.

           This enables viewing and sorting by the latest child mtime, or modified time, using 'm' and 'M', respectively.

   Interface options
       -0  Don't give any feedback while scanning a directory or importing a file, other than when a fatal error occurs. Ncurses will not be initialized until the
           scan is complete. When exporting the data with "-o", ncurses will not be initialized at all. This option is the default when exporting to standard
           output.

       -1  Similar to "-0", but does give feedback on the scanning progress with a single line of output. This option is the default when exporting to a file.

           In some cases, the ncurses browser interface which you'll see after the scan/import is complete may look garbled when using this option. If you're not
           exporting to a file, "-2" is probably a better choice.

       -2  Provide a full-screen ncurses interface while scanning a directory or importing a file. This is the only interface that provides feedback on any non-
           fatal errors while scanning.

       -q  Quiet mode. While scanning or importing the directory, ncdu will update the screen 10 times a second by default, this will be decreased to once every 2
           seconds in quiet mode. Use this feature to save bandwidth over remote connections. This option has no effect when "-0" is used.

       -r  Read-only mode. This will disable the built-in file deletion feature. This option has no effect when "-o" is used, because there will not be a browser
           interface in that case. It has no effect when "-f" is used, either, because the deletion feature is disabled in that case anyway.

           WARNING: This option will only prevent deletion through the file browser. It is still possible to spawn a shell from ncdu and delete or modify files from
           there. To disable that feature as well, pass the "-r" option twice (see "-rr").

       -rr In addition to "-r", this will also disable the shell spawning feature of the file browser.

       --si
           List sizes using base 10 prefixes, that is, powers of 1000 (KB, MB, etc), as defined in the International System of Units (SI), instead of the usual base
           2 prefixes, that is, powers of 1024 (KiB, MiB, etc).

       --confirm-quit
           Requires a confirmation before quitting ncdu. Very helpful when you accidentally press 'q' during or after a very long scan.

       --color SCHEME
           Select a color scheme. Currently only two schemes are recognized: off to disable colors (the default) and dark for a color scheme intended for dark
           backgrounds.

   Scan Options
       These options affect the scanning progress, and have no effect when importing directory information from a file.

       -x  Do not cross filesystem boundaries, i.e. only count files and directories on the same filesystem as the directory being scanned.

       --exclude PATTERN
           Exclude files that match PATTERN. The files will still be displayed by default, but are not counted towards the disk usage statistics. This argument can
           be added multiple times to add more patterns.

       -X FILE, --exclude-from FILE
           Exclude files that match any pattern in FILE. Patterns should be separated by a newline.

       --exclude-caches
           Exclude directories containing CACHEDIR.TAG.  The directories will still be displayed, but not their content, and they are not counted towards the disk
           usage statistics.  See http://www.brynosaurus.com/cachedir/

       -L, --follow-symlinks
           Follow symlinks and count the size of the file they point to. As of ncdu 1.14, this option will not follow symlinks to directories and will count each
           symlinked file as a unique file (i.e. unlike how hard links are handled). This is subject to change in later versions.

       --exclude-firmlinks
           (MacOS only) Exclude firmlinks.

       --exclude-kernfs
           (Linux only) Exclude Linux pseudo filesystems, e.g. /proc (procfs), /sys (sysfs).

           The complete list of currently known pseudo filesystems is: binfmt, bpf, cgroup, cgroup2, debug, devpts, proc, pstore, security, selinux, sys, trace.

KEYS
       ?   Show help + keys + about screen

       up, down j, k
           Cycle through the items

       right, enter, l
           Open selected directory

       left, <, h
           Go to parent directory

       n   Order by filename (press again for descending order)

       s   Order by filesize (press again for descending order)

       C   Order by number of items (press again for descending order)

       a   Toggle between showing disk usage and showing apparent size.

       M   Order by latest child mtime, or modified time. (press again for descending order) Requires the -e flag.

       d   Delete the selected file or directory. An error message will be shown when the contents of the directory do not match or do not exist anymore on the
           filesystem.

       t   Toggle dirs before files when sorting.

       g   Toggle between showing percentage, graph, both, or none. Percentage is relative to the size of the current directory, graph is relative to the largest
           item in the current directory.

       c   Toggle display of child item counts.

       m   Toggle display of latest child mtime, or modified time. Requires the -e flag.

       e   Show/hide 'hidden' or 'excluded' files and directories. Please note that even though you can't see the hidden files and directories, they are still there
           and they are still included in the directory sizes. If you suspect that the totals shown at the bottom of the screen are not correct, make sure you
           haven't enabled this option.

       i   Show information about the current selected item.

       r   Refresh/recalculate the current directory.

       b   Spawn shell in current directory.

           Ncdu will determine your preferred shell from the "NCDU_SHELL" or "SHELL" variable (in that order), or will call "/bin/sh" if neither are set.  This
           allows you to also configure another command to be run when he 'b' key is pressed. For example, to spawn the vifm(1) file manager instead of a shell, run
           ncdu as follows:

             export NCDU_SHELL=vifm
             ncdu

       q   Quit

FILE FLAGS
       Entries in the browser interface may be prefixed by a one-character flag. These flags have the following meaning:

       !   An error occurred while reading this directory.

       .   An error occurred while reading a subdirectory, so the indicated size may not be correct.

       <   File or directory is excluded from the statistics by using exclude patterns.

       >   Directory is on another filesystem.

       ^   Directory is excluded from the statistics due to being a Linux pseudo filesystem.

       @   This is neither a file nor a folder (symlink, socket, ...).

       H   Same file was already counted (hard link).

       e   Empty directory.

EXAMPLES
       To scan and browse the directory you're currently in, all you need is a simple:

         ncdu

       If you want to scan a full filesystem, your root filesystem, for example, then you'll want to use "-x":

         ncdu -x /

       Since scanning a large directory may take a while, you can scan a directory and export the results for later viewing:

         ncdu -1xo- / | gzip >export.gz
         # ...some time later:
         zcat export.gz | ncdu -f-

       To export from a cron job, make sure to replace "-1" with "-0" to suppress any unnecessary output.

       You can also export a directory and browse it once scanning is done:

         ncdu -o- | tee export.file | ./ncdu -f-

       The same is possible with gzip compression, but is a bit kludgey:

         ncdu -o- | gzip | tee export.gz | gunzip | ./ncdu -f-

       To scan a system remotely, but browse through the files locally:

         ssh -C user@system ncdu -o- / | ./ncdu -f-

       The "-C" option to ssh enables compression, which will be very useful over slow links. Remote scanning and local viewing has two major advantages when
       compared to running ncdu directly on the remote system: You can browse through the scanned directory on the local system without any network latency, and
       ncdu does not keep the entire directory structure in memory when exporting, so you won't consume much memory on the remote system.

HARD LINKS
       Every disk usage analysis utility has its own way of (not) counting hard links.  There does not seem to be any universally agreed method of handling hard
       links, and it is even inconsistent among different versions of ncdu. This section explains what each version of ncdu does.

       ncdu 1.5 and below does not support any hard link detection at all: each link is considered a separate inode and its size is counted for every link. This
       means that the displayed directory sizes are incorrect when analyzing directories which contain hard links.

       ncdu 1.6 has basic hard link detection: When a link to a previously encountered inode is detected, the link is considered to have a file size of zero bytes.
       Its size is not counted again, and the link is indicated in the browser interface with a 'H' mark. The displayed directory sizes are only correct when all
       links to an inode reside within that directory. When this is not the case, the sizes may or may not be correct, depending on which links were considered as
       "duplicate" and which as "original". The indicated size of the topmost directory (that is, the one specified on the command line upon starting ncdu) is
       always correct.

       ncdu 1.7 and later has improved hard link detection. Each file that has more than two links has the "H" mark visible in the browser interface. Each hard link
       is counted exactly once for every directory it appears in. The indicated size of each directory is therefore, correctly, the sum of the sizes of all unique
       inodes that can be found in that directory. Note, however, that this may not always be same as the space that will be reclaimed after deleting the directory,
       as some inodes may still be accessible from hard links outside it.

BUGS
       Directory hard links are not supported. They will not be detected as being hard links, and will thus be scanned and counted multiple times.

       Some minor glitches may appear when displaying filenames that contain multibyte or multicolumn characters.

       All sizes are internally represented as a signed 64bit integer. If you have a directory larger than 8 EiB minus one byte, ncdu will clip its size to 8 EiB
       minus one byte. When deleting items in a directory with a clipped size, the resulting sizes will be incorrect.

       Item counts are stored in a signed 32-bit integer without overflow detection.  If you have a directory with more than 2 billion files, quite literally
       anything can happen.

       On macOS 10.15 and later, running ncdu on the root directory without `--exclude-firmlinks` may cause directories to be scanned and counted multiple times.
       Firmlink cycles are currently (1.15.1) not detected, so it may also cause ncdu to get stuck in an infinite loop and eventually run out of memory.

       Please report any other bugs you may find at the bug tracker, which can be found on the web site at https://dev.yorhel.nl/ncdu

AUTHOR
       Written by Yoran Heling <projects@yorhel.nl>.

SEE ALSO
       du(1)

ncdu-1.15                                                                    2020-06-07                                                                      NCDU(1)
