mkfs.exfat(8)                                                                     System Manager's Manual                                                                    mkfs.exfat(8)

NAME
       mkfs.exfat - create an exFAT filesystem

SYNOPSIS
       mkfs.exfat [ -b boundary_alignment ] [ -c cluster_size ] [ -f ] [ -h ] [ -L volume_label ] [ --pack-bitmap ] [ -v ] device
       mkfs.exfat -V

DESCRIPTION
       mkfs.exfat creates an exFAT filesystem by writing on a special file using the values found in the arguments of the command line.  It is invoked automatically by mkfs(8) when it is
       given the -t exfat option.

       As an example, to make a filesystem on the first partition on the first SCSI disk, use:

              mkfs.exfat /dev/sda1

OPTIONS
       -b, --boundary-align=alignment
              Specifies the alignment for the FAT and the start of the cluster heap.  The alignment argument is specified in bytes or may be specified with m/M suffix  for  mebibytes  or
              k/K  suffix  for kibibytes and should be a power of two.  Some media like SD cards need this for optimal performance and endurance, in which case alignment should be set to
              half of the card's native boundary unit size.  If the card's native boundary unit size is not known, refer to the following table of boundary unit sizes recommended by  the
              SD Card Association.

                                                                         Card Capacity Range      Cluster Size   Boundary Unit
                                                                         ──────────────────────────────────────────────────────
                                                                                     ≤8 MiB           8 KiB          8 KiB
                                                                           >8 MiB   ≤64 MiB          16 KiB         16 KiB
                                                                          >64 MiB  ≤256 MiB          16 KiB         32 KiB
                                                                         >256 MiB    ≤1 GiB          16 KiB         64 KiB
                                                                           >1 GiB    ≤2 GiB          32 KiB         64 KiB
                                                                           >2 GiB   ≤32 GiB          32 KiB          4 MiB
                                                                          >32 GiB  ≤128 GiB         128 KiB         16 MiB
                                                                         >128 GiB  ≤512 GiB         256 KiB         32 MiB
                                                                         >512 GiB    ≤2 TiB         512 KiB         64 MiB

       -c, --cluster-size=size
              Specifies  the cluster size of the exFAT file system.  The size argument is specified in bytes or may be specified with m/M suffix for mebibytes or k/K suffix for kibibytes
              and must be a power of two.

       -f, --full-format
              Performs a full format.  This zeros the entire disk device while creating the exFAT filesystem.

       -h, --help
              Prints the help and exit.

       -L, --volume-label=label
              Specifies the volume label to be associated with the exFAT filesystem.

       --pack-bitmap
              Attempts to relocate the exFAT allocation bitmap so that it ends at the alignment boundary immediately following the FAT rather  than  beginning  at  that  boundary.   This
              strictly  violates  the  SD card specification but may improve performance and endurance on SD cards and other flash media not designed for use with exFAT by allowing file-
              system metadata updates to touch fewer flash allocation units.  Furthermore, many SD cards and other flash devices specially optimize the allocation unit where the FAT  re‐
              sides so as to support tiny writes with reduced write amplification but expect only larger writes in subsequent allocation units — where the exFAT bitmap would be placed by
              default.  Specifying --pack-bitmap attempts to avoid the potential problems associated with issuing many small writes to the bitmap by making it share  an  allocation  unit
              with the FAT.  If there is insufficient space for the bitmap there, then this option will have no effect, and the bitmap will be aligned at the boundary as by default.

       -v, --verbose
              Prints verbose debugging information while creating the exFAT filesystem.

       -V, --version
              Prints the version number and exits.

SEE ALSO
       mkfs(8), mount(8),

                                                                                                                                                                             mkfs.exfat(8)
