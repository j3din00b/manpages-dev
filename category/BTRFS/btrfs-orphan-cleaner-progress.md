BTRFS-ORPHAN-CLEANER-PROGRESS(1)                                    Btrfs Orphan Cleaner Progress                                   BTRFS-ORPHAN-CLEANER-PROGRESS(1)

NAME
       btrfs-orphan-cleaner-progress - show progress information about background deletion of btrfs subvolumes

SYNOPSIS
       btrfs-orphan-cleaner-progress [args] mountpoint

DESCRIPTION
       The btrfs-orphan-cleaner-progress program shows live progress of the deletion of subvolumes that is happening in the background.

       Ever deleted too many subvolumes at the same time, resulting in having a kernel thread "btrfs-cleaner" go wild using cpu or writing to disk? There's no way
       to stop this process any more, but at least we can get a good idea what progress it is making.

       Because the needed information is retrieved using the btrfs kernel API, it has to be run as root.

       btrfs-orphan-cleaner-progress shows the amount of orphaned subvolumes that are waiting to be removed. If current one that is being processed takes more than
       a fraction of time, progress will be reported with 2 minute intervals.

       Example output:

         100 orphans left to clean
         dropping root 1294230 for at least 0 sec drop_progress (637928 EXTENT_DATA 0)
         dropping root 1294230 finished after at least 109 sec
         99 orphans left to clean
         dropping root 1094252 for at least 0 sec drop_progress (5504 DIR_ITEM 1048466060)
         dropping root 1094252 for at least 120 sec drop_progress (1058244 INODE_REF 1056848)
         dropping root 1094252 finished after at least 121 sec
         98 orphans left to clean
         dropping root 1299468 for at least 0 sec drop_progress (14216 DIR_INDEX 33)
         dropping root 1299468 finished after at least 17 sec
         97 orphans left to clean
         dropping root 1294116 for at least 0 sec drop_progress (4297 INODE_ITEM 0)
         dropping root 1294116 finished after at least 6 sec
         96 orphans left to clean
         dropping root 1094148 for at least 0 sec drop_progress (3193 INODE_REF 1558)
         dropping root 1094148 finished after at least 7 sec
         95 orphans left to clean
         dropping root 1294233 for at least 0 sec drop_progress (29155 INODE_REF 28406)
         dropping root 1294233 for at least 120 sec drop_progress (1718475 INODE_ITEM 0)
         dropping root 1294233 for at least 240 sec drop_progress (2930889 DIR_INDEX 17)
         dropping root 1294233 for at least 360 sec drop_progress (3739430 INODE_ITEM 0)
         dropping root 1294233 for at least 480 sec drop_progress (5077225 INODE_ITEM 0)
         dropping root 1294233 for at least 600 sec drop_progress (5762256 EXTENT_DATA 0)
         dropping root 1294233 for at least 720 sec drop_progress (6754272 INODE_REF 6754207)
         dropping root 1294233 for at least 840 sec drop_progress (7279795 INODE_ITEM 0)
         dropping root 1294233 for at least 960 sec drop_progress (7969363 DIR_ITEM 985984353)
         dropping root 1294233 for at least 1080 sec drop_progress (8304717 DIR_INDEX 25)
         dropping root 1294233 for at least 1200 sec drop_progress (8668644 EXTENT_DATA 0)
         dropping root 1294233 finished after at least 1292 sec
         94 orphans left to clean
         dropping root 1094253 for at least 0 sec drop_progress (15681 DIR_ITEM 1073933304)
         dropping root 1094253 for at least 120 sec drop_progress (937036 INODE_REF 936022)
         [...]
         73 orphans left to clean
         dropping root 1094244 for at least 0 sec drop_progress (183679 INODE_ITEM 0)
         dropping root 1094244 finished after at least 6 sec
         72 orphans left to clean
         69 orphans left to clean
         dropping root 1094183 for at least 0 sec drop_progress (112400 DIR_ITEM 4071209755)
         dropping root 1094183 finished after at least 6 sec
         68 orphans left to clean
         66 orphans left to clean
         dropping root 1094184 for at least 0 sec drop_progress (265876 DIR_ITEM 2364958367)
         dropping root 1094184 finished after at least 7 sec
         65 orphans left to clean
         dropping root 1299429 for at least 0 sec drop_progress (69781 INODE_ITEM 0)
         dropping root 1299429 finished after at least 6 sec
         64 orphans left to clean
         63 orphans left to clean
         62 orphans left to clean
         [...]

OPTIONS
       -h, --help
              Show the built-in help message and exit.

SEE ALSO
       This program is an example of what can be done using the python-btrfs library.

       Source and documentation on github: https://github.com/knorrie/python-btrfs

                                                                                2017                                                BTRFS-ORPHAN-CLEANER-PROGRESS(1)
