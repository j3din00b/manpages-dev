man(8)                                                                              hfsprescue man page                                                                             man(8)

NAME
       hfsprescue - recover files from a HFS+ file system

SYNOPSIS
       hfsprescue [-h|--help] [--version]

       hfsprescue -s1 <device node|image file> [-b <block size>] [-o <offset in bytes>] [-d <working / destination directory>] [-f|--force]

       hfsprescue -s2 [--utf8len <value 1 to 5>] [--future-days <days>] [-d <working directory>]

       hfsprescue -s3 <device node|image file> [-b <block size>] [-o <offset in bytes>] [-d <working directory>] [--vh-file <file name>] [--eof-file <file name>] [--ignore-eof] [-c <file
       number>] [--file-list <file name>] [--file-list-csv <file name>] [--alternative] [--ignore-blocks] [--ignore-file-error]

       hfsprescue -s4 [-d <working directory>]

       hfsprescue -s5 [-d <working directory>]

       hfsprescue -s6 [-d <working directory>] [-k]

       hfsprescue --find <device node|image file> [-ff <num bytes> <file1> [file2] [...]] [-fs <string>] [-o <offset in bytes>]

       hfsprescue --list [--slash] [-d <working directory>]

       hfsprescue --csv <file name> [--slash] [-d <working directory>]

       hfsprescue --one-file <device node|image file> <file number> [-b <block size>] [-o <offset in bytes>] [-d <working directory>] [--vh-file <file  name>]  [--eof-file  <file  name>]
       [--ignore-eof] [--alternative]

       hfsprescue --find-eof [-b <block size>] [-o <offset in bytes>] [--vh-file <file name>]

       hfsprescue  --extract-eof  <device  node|image file> [ [--start-block <number>] < [--last-block <number>] | [--num-blocks <number>] > ] [--eof-file <output file>] [--vh-file <file
       name>]

       hfsprescue --find-vh [-o <offset in bytes>] [--first] [-f|--force] [-v|--verbose]

       hfsprescue --find-avh [-o <offset in bytes>] [--first] [-f|--force] [-v|--verbose]

       hfsprescue --extract-vh <device node|image file> <LBA sector> [--vh-file <output file>]

       hfsprescue --remove-empty-dirs [--dir <directory>] [-f|--force]

DESCRIPTION
       hfsprescue scans a damaged image file or partition that is formatted with HFS+. You can restore your files and directories, even when it's not possible to mount it with your oper‐
       ating system. Your files and directories will be stored in the directory './restored' in your current directory. The HFS+ file or partition will not be changed. So you need enough
       space to copy out the files from the HFS+ file system. hfsprescue supports HFS+ compression (resource fork).

       You find a complete reference, depending on your installation, in '/usr/share/hfsprescue', '/usr/local/share/hfsprescue' or '/opt/share/hfsprescue' in English and German as  HTML,
       PDF and TEXT.

RESTORING FILES
       You have to complete 6 steps to restore your files:

       1) Scan for your files.

       hfsprescue -s1 <device node|image file> [-b <block size>] [-o <offset in bytes>] [-d <working / destination directory>] [-f|--force]

       2) Cleanup file database.

       hfsprescue -s2 [--utf8len <value 1 to 5>] [--future-days <days>] [-d <working directory>]

       3) Restore your files.

       hfsprescue  -s3  <device  node|image  file>  [-b  <block size>] [-o <offset in bytes>] [-d <working directory>] [--vh-file <file name>] [--eof-file <file name>] [-c <file number>]
       [--file-list <file name>] [--alternative]

       4) Restore your directory structure.

       hfsprescue -s4 [-d <working directory>]

       5) Move the restored files to the correct directories.

       hfsprescue -s5 [-d <working directory>]

       6) Last step, finalize and cleanup.

       hfsprescue -s6 [-d <working directory>] [-k]

       hfsprescue will guide you through every step and is telling you the command for the next step.

       Additional features

        o  Search Unicode string (useful on damaged/lost partition table).
        o  Search bytes from a file (useful on damaged/lost partition table).
        o  List files that have been found.
        o  CSV export of the list of files that have been found.
        o  Recover one file instead of all files.
        o  Recover files from a list.
        o  Find possible positions of the Extents Overflow File.
        o  Extract the Extents Overflow File.
        o  Find HFS+ Volume Header and partition start.
        o  Find HFS+ Alternate Volume Header.
        o  Extract a HFS+ Volume Header.
        o  Remove empty directories.

OPTIONS
       -h, --help
              Display help and exit.

       o STEP 1: Scan for your files.

       -s1 <device node|image file>
              Run step 1. You have to tell the device node or image file.

       -b <block size>
              Set the block size in bytes. Useful when the boot sector has been lost.

       -f, --force
              Overwrite current log files.

       -o <offset>
              Set the start offset of the partition in bytes. Useful when the partition table is lost or damaged.

       -d <working / destination directory>
              Use the directory instead of the current working directory.

       o STEP 2: Cleanup file database.

       -s2 [--utf8len <value 1 to 5>] [--future-days <days>] [-d <working directory>]
              Run step 2. Remove duplicate and invalid file entries with wrong chars in the file name or a file date in the future.

       --utf8len <value 1 to 5>
              Set the allowed maximum char length of an UTF-8 char. File names that have invlaid chars will be removed. Values from 1 to 5 are allowed. 1 is the default value and  should
              be fine. For file names with asian chars use 2. The values 3-5 should not be used.

       --future-days <days>
              Set  the  allowed tollerance for future file dates. The default value is 7 days. Files with a date more in the future will be removed. Usually, those files are false detec‐
              tion.

       -d <working directory>
              Use the directory instead of the current working directory.

       o STEP 3: Restore your files.

       -s3 <device node|image file>
              Run step 3. You have to tell the device node or image file.

       -b <block size>
              Set the block size in bytes. Useful when the boot sector has been lost.

       -c <file number>
              Continue the file restore and skip the files before <file number>.

       -o <offset>
              Set the start offset of the partition in bytes. Useful when the partition table is lost or damaged.

       -d <working directory>
              Use the directory instead of the current working directory.

       --alternative
              Find a new name when the file already exists in it's directory. Can happen with older versions or deleted files.

       o STEP 4: Restore your directory structure.

       -s4    Run step 4.

       -d <working directory>
              Use the directory instead of the current working directory.

       o STEP 5: Move the restored files to the correct directories.

       -s5    Run step 5.

       -d <working directory>
              Use the directory instead of the current working directory.

       o STEP 6: Last step, finalize and cleanup.

       -s6    Run step 6.

       -d <working directory>
              Use the directory instead of the current working directory.

       -k     Keep mkdir.sh and hfsprescue_dir_id.tmp files.

       o FIND FILE BYTES AND/OR AN UNICODE STRING: Find data on sectors.

       --find <device node|image file>
              Find data. You have to tell the device node or image file.

       -ff <num bytes> <file1> [file2] [...]
              Find number of bytes from one or more files.

       -fs <string>
              Find a given string. The string will be converted to Unicode.

       -o <offset in bytes>
              Start search from offset.

       o LIST FILES: List found files.

       --list
              This parameter lists all files that have been found. You can run this after you completed Step 2.

       --slash
              Mac OS X allows the char '/' in file names in the GUI. For directory compatibility, '/' is converted to ':'. Use --slash when you want to display the '/' in the  file  name
              instead of ':'. Maybe when you search a file name which has '/'.

       -d <working directory>
              Use the directory instead of the current working directory.

       o CSV EXPORT OF FILE LIST: Export list to a CSV file.

       --csv
              Export the file list to a CSV file. You can run this after you completed Step 2.

       --slash
              Mac  OS  X  allows the char '/' in file names in the GUI. For directory compatibility, '/' is converted to ':'. Use --slash when you want to export the '/' in the file name
              instead of ':'.

       -d <working directory>
              Use the directory instead of the current working directory.

       o RESTORE ONE FILE: Restore just one file instead of all files that have been found. You can run this after you completed Step 2.

       --one-file  <device node|image file>  <file number>
              You have to tell the device node or image file and the file number of the requested file. Both parameters are required.

       -b <block size>
              Set the block size in bytes. Useful when the boot sector has been lost.

       -o <offset>
              Set the start offset of the partition in bytes. Useful when the partition table is lost or damaged.

       -d <working directory>
              Use the directory instead of the current working directory.

       --alternative
              Find a new name when the file already exists in it's directory. Can happen with older versions or deleted files.

       o FIND EXTENTS OVERFLOW FILE: Scan the device for possible start blocks.

       --find-eof <device node|image file>
              You have to tell the device node or image file.

       -b <block size>
              Set the block size in bytes. Useful when the boot sector has been lost.

       -o <offset>
              Set the start offset of the partition in bytes. Useful when the partition table is lost or damaged.

       o FIND HFS+ VOLUME HEADER: Scan the device for possible Volume Headers and shows the start of the partition.

       --find-vh <device node|image file>
              You have to tell the device node or image file.

       -o <offset in bytes>
              Start search from offset.

       --first
              Just show the first HFS+ Volume Header and quit.

       -f, --force
              Show Volume Header even when the lastMountVersion field reports another OS than Mac OS X or Linux.

       -v, --verbose
              Display detailed informations.

EXAMPLE RESTORE COMMAND SEQUENCE
       There are 6 Steps to complete.

       hfsprescue -s1 /dev/sdb2

       hfsprescue -s2

       hfsprescue -s3 /dev/sdb2

       hfsprescue -s4

       hfsprescue -s5

       hfsprescue -s6

PARTITION START OFFSET CALCULATION FORMULA
       You find a detailed description with an example on https://www.plop.at or in the hfsprescue.txt and hfsprescue.pdf

       offset = byte_search_result - list_start_block * block_size

       o Note:

       Use --list to get the file start block (list_start_block) of the requested file.
              Example: hfsprescue --list|grep PerfectPicture.jpg

       Use --find and -ff to search for the reference file and get the byte_search_result value.
              Example hfsprescue --find /dev/sdb -ff 2000 PerfectPicture.jpg

SEE ALSO
       hfsprescue.txt hfsprescue.pdf https://www.plop.at

BUGS
       Unicode to UTF-8 conversion is not fully supported. There are problems with accents on non Mac OS X systems. When you restore on another system than Mac OS  X,  then  the  accents
       should be corrected when you copy the restored files to a HFS+ file system.

       This bug will be fixed maybe in a further version.

AUTHOR
       Elmar Hanlhofer (office@plop.at) https://www.plop.at

3.5                                                                                     25 Sep 2020                                                                                 man(8)
