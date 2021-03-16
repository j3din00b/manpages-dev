  DISKSCAN
 
## NAME
        diskscan - scan a disk for failed and near failure sectors
 
## SYNOPSIS
        diskscan [options...] block_device
 
## DESCRIPTION
        diskscan is intended to check a disk and find any bad sectors already present and assess it for any possible sectors that are in the process of going bad.
        The operation is all read-only and can cause no direct damage to the data on the disk.
 
        diskscan reads the entire block device and notes the time it took to read a block. When there is an error it is immediately noted and also when there is a
        higher latency to read a block. A histogram of the block latency times is also given to assess the health of the disk.
 
        The output of diskscan will show any serious errors or very high latency and will also emit an histogram at the end of the run in the form:
 
            I: Validating path /dev/sdg
            I: Opened disk /dev/sdg
            I: Scanning disk /dev/sdg
            Access time histogram:
                   1: 0
                  10: 0
                 100: 0
                 500: 120
                1000: 0
                2000: 1
                3000: 0
                4000: 0
                5000: 0
                6000: 0
                7000: 0
                8000: 0
                9000: 0
               10000: 0
               15000: 0
               20000: 0
               25000: 0
               30000: 0
            above that: 0
            I: Closed disk /dev/sdg
 
        This means that all I/Os in this case were between 100 and 600 msec and there were 120 chunks being read. Current these chunks are 1MB in size.
 
## OPTIONS
        -v, --verbose display verbose information from the workings of the scan use multiple times for increased verbosity.
 
        -f, --fix Attempt to fix areas that are nearing failure. This should only be attempted on an unmounted block device and never on an inuse filesystem or
        corruption is likely.
 
        -s <mode>, --scan <mode> Scan mode can be either seq or random, random reduces the chance that the disk will be able spend time to recover data before we try
        to access a sector but the seeks add noise to the latency measurement. Sequential test is the default and random test is still experimental with regard to
        its usefulness.
 
        -e <size>, --size <size> Set the size in which the scan will be done, this must be a multiple of the sector size which is normally 512 bytes.
 
        -o <file>, --output <file> Set the output file that the scan will generate. This is a JSON file with the summary and details about the exceptional events
        found during the scan.
 
        -r <file>, --raw-log <file> Set the output file for the raw log which logs everything done and seen during the scan. This is a rather large file but it can
        help get the finer details of the scan progress and the disk behavior during the scan. This is too a JSON file.
 
## SEE ALSO
        badblocks(1), fsck(1)
 
## AUTHOR
        Baruch Even \<baruch@ev-en.org>
 
 DiskScan 0.19                                                                2013-10-25                                                                  DISKSCAN(1)
