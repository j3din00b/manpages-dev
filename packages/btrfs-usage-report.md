  BTRFS-## USAGE-REPORT
 
## NAME
        btrfs-usage-report - show a detailed usage report about your btrfs filesystem
 
## SYNOPSIS
        btrfs-usage-report [args] mountpoint
 
## DESCRIPTION
        The btrfs-usage-report program shows a detailed report about how a btrfs filesystem is using available disk space.
 
        The filesystem to show information about needs to be online and mounted.  Because the needed information is retrieved using the btrfs kernel API, it has to
        be run as root.
 
        In a btrfs filesystem, raw storage is shared by data of different types (System, MetaData and Data) and profiles (e.g. single, DUP, RAID1). Also, a
        filesystem can have multiple block devices of different sizes attached. All of this together confuses regular tools like df, which will already fail to show
        us how much free space we still have to add more data to the filesystem.
 
        The report will show information about:
 
        - Physical disk space usage. On this level we can see the amount of disk space allocated for specific combinations of type and profile. E.g. 1GiB of Data
        with profile RAID1 will show that two devices both store 1GiB of raw data, because it is duplicated.
 
        - Virtual disk space usage. The btrfs virtual address space shows the amount of data we store disregarding the storage profile. So, if we store 1GiB of data
        using a RAID1 profile, then the virtual address space shows we have 1GiB of data, while the physical space usage will show up as 2GiB in total. Note that
        when using compression, the virtual address space counts compressed data instead of uncompressed data.
 
        - Estimated free virtual space left for use. By extrapolating the current usage patterns, a prediction can be made that shows how much extra data can be
        added to the filesystem. These are the values that you would like to have df show you.
 
        - Unallocatable disk space, which is raw physical disk space that cannot be used, either because allocations in the filesystem are unbalanced, or because of
        having different sizes of devices attached. Additionally, it will show us if disk space can be reclaimed for use by using btrfs balance.  When converting
        between profiles, these values can quickly show you if the conversion to another profile can actually be completed or not.
 
## OPTIONS
        -h, --help
               Show the built-in help message and exit.
 
## SEE ALSO
        btrfs-space-calculator is a program that can calculate the amount of allocatable (and unallocatable) disk space based on a list of (maybe differently sized)
        block devices and target profiles to use.
 
        This program is an example of what can be done using the python-btrfs library.  Do not parse the output of this program, as it just displays data that is
        readily available when using functionality from this library.
 
        Source and documentation on github: https://github.com/knorrie/python-btrfs
 
                                                                                 2018                                                           BTRFS-## USAGE-REPORT(1)
