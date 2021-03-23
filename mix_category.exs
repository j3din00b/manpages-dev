defmodule KaisenManpages.MixProject do
  use Mix.Project

  def project do
    [
      app: :kaisen_manpages,
      version: "1.5.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Manpages",
      homepage_url: "https://kaisenlinux.org/manpages/",
      authors: "Arnaud Cormier & Kevin Chevreuil",
      docs: [
         main: "readme",
         source_ref: "sort by category",
         api_reference: false,
         logo: "priv/assets/kaisen-logo.jpg",
         assets: "priv/assets",
         before_closing_head_tag: &docs_before_closing_head_tag/1,
         formatters: ["html"],
         extra_section: "MANUALS",
    javascript_config_path: "doc-versions.js",
         extras: [
          "category/README.md", [ title: "Manpages by category"],
          "category/Analysis/dstat.md",
          "category/Analysis/file.md",
          "category/Analysis/memstat.md",
          "category/Analysis/pstree.md",
          "category/Analysis/qtop.md",
          "category/Analysis/rdfind.md",
          "category/Analysis/tree.md",
          "category/Ansible/ansible.md",
          "category/Ansible/ansible-config.md",
          "category/Ansible/ansible-console.md",
          "category/Ansible/ansible-doc.md",
          "category/Ansible/ansible-galaxy.md",
          "category/Ansible/ansible-inventory.md",
          "category/Ansible/ansible-playbook.md",
          "category/Ansible/ansible-pull.md",
          "category/Ansible/ansible-vault.md",
          "category/Backup/automysqlbackup.md",
          "category/Backup/autopostgresqlbackup.md",
          "category/Backup/backup2l.md",
          "category/Backup/Bacula.md",
          "category/Backup/dump.md",
          "category/Backup/duplicity.md",
          "category/Backup/duply.md",
          "category/Backup/Grsync.md",
          "category/Backup/restic.md",
          "category/Backup/rsbackup.md",
          "category/Backup/rsync.md",
          "category/Backup/vbackup.md",
          "category/Backup/zbackup.md",
          "category/Backup/zsync.md",
          "category/Bitlocker/bdeinfo.md",
          "category/Bitlocker/bdemount.md",
          "category/Bitlocker/dislocker-bek.md",
          "category/Bitlocker/dislocker-file.md",
          "category/Bitlocker/dislocker-fuse.md",
          "category/Bitlocker/dislocker.md",
          "category/Bitlocker/dislocker-metadata.md",
          "category/BTRFS/btrfs-balance-least-used.md",
          "category/BTRFS/btrfsck.md",
          "category/BTRFS/btrfs-find-root.md",
          "category/BTRFS/btrfs-heatmap.md",
          "category/BTRFS/btrfs-image.md",
          "category/BTRFS/btrfs-map-logical.md",
          "category/BTRFS/btrfs.md",
          "category/BTRFS/btrfs-orphan-cleaner-progress.md",
          "category/BTRFS/btrfs-select-super.md",
          "category/BTRFS/btrfs-space-calculator.md",
          "category/BTRFS/btrfstune.md",
          "category/BTRFS/btrfs-usage-report.md",
          "category/Cloning-USBBoot-Partitioning/dcfldd.md",
          "category/Cloning-USBBoot-Partitioning/dd.md",
          "category/Cloning-USBBoot-Partitioning/fsarchiver.md",
          "category/Cloning-USBBoot-Partitioning/Guymager.md",
          "category/Cloning-USBBoot-Partitioning/partclone.md",
          "category/Cloning-USBBoot-Partitioning/partimage.md",
          "category/ConsolePort/cu.md",
          "category/ConsolePort/minicom.md",
          "category/ConsolePort/picocom.md",
          "category/ConsolePort/screen.md",
          "category/ConsolePort/setserial.md",
          "category/ConsolePort/statserial.md",
          "category/ConsolePort/tmux.md",
          "category/Dataprotection/lockfile-create.md",
          "category/Dataprotection/lockfile-remove.md",
          "category/Dataprotection/lockfile-touch.md",
          "category/DHCP/dhclient.md",
          "category/DHCP/dhcpdump.md",
          "category/DHCP/dhcping.md",
          "category/Dirvish/dirvish-expire.md",
          "category/Dirvish/dirvish-locate.md",
          "category/Dirvish/dirvish.md",
          "category/Dirvish/dirvish-runall.md",
          "category/DisksAnalysis/badblocks.md",
          "category/DisksAnalysis/Baobab.md",
          "category/DisksAnalysis/bonnie++.md",
          "category/DisksAnalysis/df.md",
          "category/DisksAnalysis/di.md",
          "category/DisksAnalysis/diskscan.md",
          "category/DisksAnalysis/disktype.md",
          "category/DisksAnalysis/du.md",
          "category/DisksAnalysis/fsck.md",
          "category/DisksAnalysis/gpart.md",
          "category/DisksAnalysis/GSmartControl.md",
          "category/DisksAnalysis/hdparm.md",
          "category/DisksAnalysis/ioping.md",
          "category/DisksAnalysis/ncdu.md",
          "category/DisksAnalysis/smartctl.md",
          "category/DisksAnalysis/testdisk.md",
          "category/DNS/dig.md",
          "category/DNS/dnsenum.md",
          "category/DNS/dnstop.md",
          "category/DNS/host.md",
          "category/DNS/mdns-scan.md",
          "category/DNS/nslookup.md",
          "category/DNS/whois.md",
          "category/Docker/docker-compose.md",
          "category/Docker/docker.md",
          "category/Ethernet/ethstatus.md",
          "category/Ethernet/ethtool.md",
          "category/Ethernet/PackETH.md",
          "category/EXFAT/fsck.exfat.md",
          "category/EXFAT/partclone.exfat.md",
          "category/F2FS/f2fscrypt.md",
          "category/Filesystems/ceph-fuse.md",
          "category/Filesystems/lxcfs.md",
          "category/Filesystems/ocfs2_hb_ctl.md",
          "category/Filesystems/squashfuse.md",
          "category/Filesystems/sshfs.md",
          "category/FileVault/fvdeinfo.md",
          "category/FileVault/fvdemount.md",
          "category/Firewall/iptstate.md",
          "category/FSCK/fsck.ext2.md",
          "category/FSCK/fsck.ext3.md",
          "category/FSCK/fsck.ext4.md",
          "category/FSCK/fsck.fat.md",
          "category/FSCK/fsck.hfs.md",
          "category/FSCK/fsck.hfsplus.md",
          "category/FSCK/fsck.ocfs2.md",
          "category/FSCK/fsck.vmfs.md",
          "category/FTP/FileZilla.md",
          "category/FTP/gFTP.md",
          "category/FTP/lFTP.md",
          "category/GFS2/gfs2_lockcapture.md",
          "category/GlusterFS/glusterfind.md",
          "category/GlusterFS/glusterfsd.md",
          "category/GlusterFS/glusterfs.md",
          "category/GlusterFS/gluster-mountbroker.md",
          "category/GlusterFS/gluster-setgfid2path.md",
          "category/GNS3/dynamips.md",
          "category/GNS3/nvram_export.md",
          "category/GNS3/vpcs.md",
          "category/Hardware/cpulimit.md",
          "category/Hardware/discover.md",
          "category/Hardware/dmidecode.md",
          "category/Hardware/fio.md",
          "category/Hardware/flashrom.md",
          "category/Hardware/Hardinfo.md",
          "category/Hardware/hwinfo.md",
          "category/Hardware/hw-probe.md",
          "category/Hardware/iozone.md",
          "category/Hardware/lshw.md",
          "category/Hardware/lspci.md",
          "category/Hardware/memtester.md",
          "category/Hardware/stressant.md",
          "category/Hardware/stress.md",
          "category/IP/ifconfig.md",
          "category/IP/ipcalc.md",
          "category/IP/iptraf.md",
          "category/IP/ipv6calc.md",
          "category/IP/sipcalc.md",
          "category/JFS/jfs_debugfs.md",
          "category/JFS/jfs_fscklog.md",
          "category/JFS/jfs_fsck.md",
          "category/JFS/jfs_logdump.md",
          "category/JFS/jfs_mkfs.md",
          "category/JFS/jfs_tune.md",
          "category/LXC/lxc-attach.md",
          "category/LXC/lxc-autostart.md",
          "category/LXC/lxc-cgroup.md",
          "category/LXC/lxc-checkconfig.md",
          "category/LXC/lxc-config.md",
          "category/LXC/lxc-console.md",
          "category/LXC/lxc-copy.md",
          "category/LXC/lxc-create.md",
          "category/LXC/lxc-destroy.md",
          "category/LXC/lxc-device.md",
          "category/LXC/lxc-execute.md",
          "category/LXC/lxc-freeze.md",
          "category/LXC/lxc-info.md",
          "category/LXC/lxc-ls.md",
          "category/LXC/lxc-monitor.md",
          "category/LXC/lxc-snapshot.md",
          "category/LXC/lxc-start.md",
          "category/LXC/lxc-stop.md",
          "category/LXC/lxctl.md",
          "category/LXC/lxc-unfreeze.md",
          "category/LXC/lxc-unshare.md",
          "category/LXC/lxc-update-config.md",
          "category/LXC/lxc-usernsexec.md",
          "category/LXC/lxc-wait.md",
          "category/MAC/arpalert.md",
          "category/MAC/arping.md",
          "category/MAC/arp.md",
          "category/MAC/arp-scan.md",
          "category/MAC/arptables.md",
          "category/MAC/arpwatch.md",
          "category/MAC/macchanger.md",
          "category/MalwareScan/chkrootkit.md",
          "category/MalwareScan/clamscan.md",
          "category/MalwareScan/ClamTk.md",
          "category/MalwareScan/rkhunter.md",
          "category/Microsoft/cabextract.md",
          "category/Miscellaneous/git-repair.md",
          "category/Miscellaneous/gpg.md",
          "category/Miscellaneous/GtkHash.md",
          "category/Miscellaneous/img2pdf.md",
          "category/Miscellaneous/irqbalance.md",
          "category/Miscellaneous/ltrace.md",
          "category/Miscellaneous/mlocate.md",
          "category/Miscellaneous/progress.md",
          "category/Miscellaneous/pv.md",
          "category/Miscellaneous/strace.md",
          "category/Miscellaneous/yamllint.md",
          "category/MKFS/mkfs.btrfs.md",
          "category/MKFS/mkfs.exfat.md",
          "category/MKFS/mkfs.ext2.md",
          "category/MKFS/mkfs.ext3.md",
          "category/MKFS/mkfs.ext4.md",
          "category/MKFS/mkfs.fat.md",
          "category/MKFS/mkfs.hfsplus.md",
          "category/MKFS/mkfs.nilfs2.md",
          "category/MKFS/mkfs.ntfs.md",
          "category/MKFS/mkfs.ocfs2.md",
          "category/MKFS/mkfs.reiserfs.md",
          "category/MKFS/mkfs.xfs.md",
          "category/Monitoring/cbm.md",
          "category/Monitoring/EtherApe.md",
          "category/Monitoring/ifstat.md",
          "category/Monitoring/iftop.md",
          "category/Monitoring/iotop.md",
          "category/Monitoring/iperf3.md",
          "category/Monitoring/iperf.md",
          "category/Monitoring/nethogs.md",
          "category/Monitoring/netperfmeter.md",
          "category/Monitoring/sockstat.md",
          "category/Mount/archivemount.md",
          "category/Mount/fuseiso.md",
          "category/Mount/fusesmb.md",
          "category/Mount/fuse-zip.md",
          "category/Mount/mount.md",
          "category/Mount/tmfs.md",
          "category/Mount/umount.md",
          "category/Mount/xmount.md",
          "category/NetworkSecurity/2ping.md",
          "category/NetworkSecurity/atftp.md",
          "category/NetworkSecurity/cdpr.md",
          "category/NetworkSecurity/comgt.md",
          "category/NetworkSecurity/logrotate.md",
          "category/NetworkSecurity/ndisc6.md",
          "category/NetworkSecurity/ntpdate.md",
          "category/NetworkSecurity/wakeonlan.md",
          "category/NetworkSecurity/wondershaper.md",
          "category/NILFS/nilfs_cleanerd.md",
          "category/NILFS/nilfs-clean.md",
          "category/NILFS/nilfs-resize.md",
          "category/NILFS/nilfs-tune.md",
          "category/NTFS/ntfs-3g.md",
          "category/NTFS/ntfs-3g.probe.md",
          "category/NTFS/ntfscat.md",
          "category/NTFS/ntfsclone.md",
          "category/NTFS/ntfscluster.md",
          "category/NTFS/ntfscmp.md",
          "category/NTFS/ntfscp.md",
          "category/NTFS/ntfsdecrypt.md",
          "category/NTFS/ntfsfallocate.md",
          "category/NTFS/ntfsfix.md",
          "category/NTFS/ntfsinfo.md",
          "category/NTFS/ntfslabel.md",
          "category/NTFS/ntfsls.md",
          "category/NTFS/ntfsrecover.md",
          "category/NTFS/ntfsresize.md",
          "category/NTFS/ntfssecaudit.md",
          "category/NTFS/ntfstruncate.md",
          "category/NTFS/ntfsundelete.md",
          "category/NTFS/ntfsusermap.md",
          "category/NTFS/ntfswipe.md",
          "category/Partitioning/BleachBit.md",
          "category/Partitioning/fatresize.md",
          "category/Partitioning/fdisk.md",
          "category/Partitioning/fstrim.md",
          "category/Partitioning/gdisk.md",
          "category/Partitioning/GParted.md",
          "category/Partitioning/nwipe.md",
          "category/Partitioning/parted.md",
          "category/Partitioning/scrub.md",
          "category/Partitioning/sdmem.md",
          "category/Partitioning/sfill.md",
          "category/Partitioning/shred.md",
          "category/Partitioning/srm.md",
          "category/Partitioning/sswap.md",
          "category/Partitioning/wipe.md",
          "category/Partitioning/zerofree.md",
          "category/Passwords/apg.md",
          "category/Passwords/bruteforce-luks.md",
          "category/Passwords/chntpw.md",
          "category/Passwords/cmospwd.md",
          "category/Passwords/crack.md",
          "category/Passwords/crunch.md",
          "category/Passwords/fcrackzipinfo.md",
          "category/Passwords/fcrackzip.md",
          "category/Passwords/hashcat.md",
          "category/Passwords/hydra.md",
          "category/Passwords/john.md",
          "category/Passwords/KeePassXC.md",
          "category/Passwords/ophcrack-cli.md",
          "category/Passwords/Ophcrack.md",
          "category/Passwords/pdfcrack.md",
          "category/Passwords/pwgen.md",
          "category/Passwords/rephrase.md",
          "category/Passwords/samdump2.md",
          "category/Passwords/xHydra.md",
          "category/PCAP/darkstat.md",
          "category/PCAP/hunt.md",
          "category/PCAP/netsed.md",
          "category/PCAP/ngrep.md",
          "category/PCAP/pcapfix.md",
          "category/PCAP/tshark.md",
          "category/PCAP/Wireshark.md",
          "category/PST/pffexport.md",
          "category/PST/pffinfo.md",
          "category/PST/pst2dii.md",
          "category/PST/pst2ldif.md",
          "category/Recovery/ddrescueview.md",
          "category/Recovery/ddrutility.md",
          "category/Recovery/ext4magic.md",
          "category/Recovery/extundelete.md",
          "category/Recovery/foremost.md",
          "category/Recovery/hfsprescue.md",
          "category/Recovery/magicrescue.md",
          "category/Recovery/myrescue.md",
          "category/Recovery/photorec.md",
          "category/Recovery/recoverdm.md",
          "category/Recovery/recoverjpeg.md",
          "category/Recovery/safecopy.md",
          "category/Recovery/scalpel.md",
          "category/Recovery/scrounge-ntfs.md",
          "category/REISER4/debugfs.reiser4.md",
          "category/REISER4/fsck.reiser4.md",
          "category/REISER4/measurefs.reiser4.md",
          "category/REISER4/mkfs.reiser4.md",
          "category/REISER4/partclone.reiser4.md",
          "category/REISERFS/reiserfsck.md",
          "category/REISERFS/reiserfstune.md",
          "category/RemoteAdministration/ClusterSSH.md",
          "category/RemoteAdministration/parallel-nuke.md",
          "category/RemoteAdministration/parallel-rsync.md",
          "category/RemoteAdministration/parallel-scp.md",
          "category/RemoteAdministration/parallel-slurp.md",
          "category/RemoteAdministration/parallel-ssh.md",
          "category/RemoteAdministration/rdesktop.md",
          "category/RemoteAdministration/scp.md",
          "category/RemoteAdministration/xfreerdp.md",
          "category/RemoteAdministration/zssh.md",
        #  "category/RemoteAdmin/Remmina.md",
          "category/Scanner/driftnet.md",
          "category/Scanner/dsniff.md",
          "category/Scanner/Ettercap.md",
          "category/Scanner/Full.md",
          "category/Scanner/hping3.md",
          "category/Scanner/lft.md",
          "category/Scanner/mtr.md",
          "category/Scanner/nast.md",
          "category/Scanner/ndiff.md",
          "category/Scanner/netdiscover.md",
          "category/Scanner/netsniff-ng.md",
          "category/Scanner/nmap.md",
          "category/Scanner/NmapSI4.md",
          "category/Scanner/telnet.md",
          "category/Scanner/tracepath.md",
          "category/Scanner/traceroute6.md",
          "category/Scanner/traceroute.md",
          "category/SSL/ssldump.md",
          "category/SSL/sslscan.md",
          "category/SSL/sslsniff.md",
          "category/SSL/sslsplit.md",
          "category/SysOps/JMeter.md",
          "category/SysOps/kubectl.md",
          "category/SysOps/packer.md",
          "category/SysOps/puppet.md",
          "category/SysOps/vagrant.md",
          "category/SystemSecurity/ab.md",
          "category/SystemSecurity/ctop.md",
          "category/SystemSecurity/cups.md",
          "category/SystemSecurity/curl.md",
          "category/SystemSecurity/hexedit.md",
          "category/SystemSecurity/Htop.md",
          "category/SystemSecurity/lsof.md",
          "category/SystemSecurity/XCA.md",
          "category/TCP/masscan.md",
          "category/TCP/nc.md",
          "category/TCP/netstat.md",
          "category/TCP/scapy.md",
          "category/TCP/socat.md",
          "category/TCP/ssmping.md",
          "category/TCP/tcpbridge.md",
          "category/TCP/tcpdump.md",
          "category/TCP/tcpflow.md",
          "category/TCP/tcpreplay.md",
          "category/TCP/tcpstat.md",
          "category/TCP/tcptrace.md",
          "category/TCP/tcptraceroute.md",
          "category/TCP/tcpxtract.md",
          "category/Temperature/hddtemp.md",
          "category/Temperature/sensors-detect.md",
          "category/Temperature/XSensors.md",
          "category/Timeshift/timeshift.md",
          "category/UDF/udfinfo.md",
          "category/UDF/udflabel.md",
          "category/UDP/Packet.md",
          "category/UDP/udp-receiver.md",
          "category/UDP/udp-sender.md",
          "category/VHDI/vhdiinfo.md",
          "category/Virtualization/VirtualBox.md",
          "category/VMDK/vmdkinfo.md",
          "category/VMFS/vmfs6-fuse.md",
          "category/VMFS/vmfs6-lvm.md",
          "category/VMFS/vmfs-fuse.md",
          "category/VMFS/vmfs-lvm.md",
          "category/VPN/openvpn.md",
          "category/VPN/wireguard.md",
          "category/WIFI/aircrack-ng.md",
          "category/WIFI/hostapd.md",
          "category/WIFI/iw.md",
          "category/WIFI/kismet.md",
          "category/WIFI/rfkill.md",
          "category/XFS/xfs_admin.md",
          "category/XFS/xfs_bmap.md",
          "category/XFS/xfs_copy.md",
          "category/XFS/xfs_db.md",
          "category/XFS/xfsdump.md",
          "category/XFS/xfs_estimate.md",
          "category/XFS/xfs_freeze.md",
          "category/XFS/xfs_fsr.md",
          "category/XFS/xfs_growfs.md",
          "category/XFS/xfs_info.md",
          "category/XFS/xfsinvutil.md",
          "category/XFS/xfs_io.md",
          "category/XFS/xfs_logprint.md",
          "category/XFS/xfs_mdrestore.md",
          "category/XFS/xfs_metadump.md",
          "category/XFS/xfs_mkfile.md",
          "category/XFS/xfs_ncheck.md",
          "category/XFS/xfs_quota.md",
          "category/XFS/xfs_repair.md",
          "category/XFS/xfsrestore.md",
          "category/XFS/xfs_rtcp.md",
          "category/XFS/xfs_scrub_all.md",
          "category/XFS/xfs_scrub.md",
          "category/XFS/xfs_spaceman.md",
          "category/ZFS/zfs-fuse.md",
          "category/ZFS/zfs.md",
          "category/ZFS/zpool.md",
          "category/ZIP/lzop.md",
          "category/ZIP/pigz.md",
          "category/ZIP/pzstd.md",
          "category/ZIP/unp.md",
          "category/ZIP/unrar-free.md",
          "category/ZIP/unrar.md",
          "category/ZIP/unzip.md",
          "category/ZIP/zip.md",
          "category/ZIP/zstd.md",




#: ["",
#	title: ""start with tcp dump"",
     ],
      #],"",
      groups_for_extras: [
        "Analysis": Path.wildcard("category/Analysis/*.md"),
        "Ansible": Path.wildcard("category/Ansible/*.md"),
        "Backup": Path.wildcard("category/Backup/*.md"),
        "Bitlocker": Path.wildcard("category/Bitlocker/*.md"),
        "BTRFS": Path.wildcard("category/BTRFS/*.md"),
        "Cloning-USBBoot-Partitioning": Path.wildcard("category/Cloning-USBBoot-Partitioning/*.md"),
        "ConsolePort": Path.wildcard("category/ConsolePort/*.md"),
        "Dataprotection": Path.wildcard("category/Dataprotection/*.md"),
        "DHCP": Path.wildcard("category/DHCP/*.md"),
        "Dirvish": Path.wildcard("category/Dirvish/*.md"),
        "DisksAnalysis": Path.wildcard("category/DisksAnalysis/*.md"),
        "DNS": Path.wildcard("category/DNS/*.md"),
        "Docker": Path.wildcard("category/Docker/*.md"),
        "Ethernet": Path.wildcard("category/Ethernet/*.md"),
        "EXFAT": Path.wildcard("category/EXFAT/*.md"),
        "F2FS": Path.wildcard("category/F2FS/*.md"),
        "Filesystems": Path.wildcard("category/Filesystems/*.md"),
        "FileVault": Path.wildcard("category/FileVault/*.md"),
        "Firewall": Path.wildcard("category/Firewall/*.md"),
        "FSCK": Path.wildcard("category/FSCK/*.md"),
        "FTP": Path.wildcard("category/FTP/*.md"),
        "GFS2": Path.wildcard("category/GFS2/*.md"),
        "GlusterFS": Path.wildcard("category/GlusterFS/*.md"),
        "GNS3": Path.wildcard("category/GNS3/*.md"),
        "Hardware": Path.wildcard("category/Hardware/*.md"),
        "IP": Path.wildcard("category/IP/*.md"),
        "JFS": Path.wildcard("category/JFS/*.md"),
        "LXC": Path.wildcard("category/LXC/*.md"),
        "MAC": Path.wildcard("category/MAC/*.md"),
        "MalwareScan": Path.wildcard("category/MalwareScan/*.md"),
        "Microsoft": Path.wildcard("category/Microsoft/*.md"),
        "Miscellaneous": Path.wildcard("category/Miscellaneous/*.md"),
        "MKFS": Path.wildcard("category/MKFS/*.md"),
        "Monitoring": Path.wildcard("category/Monitoring/*.md"),
        "Mount": Path.wildcard("category/Mount/*.md"),
        "NetworkSecurity": Path.wildcard("category/NetworkSecurity/*.md"),
        "NILFS": Path.wildcard("category/NILFS/*.md"),
        "NTFS": Path.wildcard("category/NTFS/*.md"),
        "Partitioning": Path.wildcard("category/Partitioning/*.md"),
        "Passwords": Path.wildcard("category/Passwords/*.md"),
        "PCAP": Path.wildcard("category/PCAP/*.md"),
        "PST": Path.wildcard("category/PST/*.md"),
        "Recovery": Path.wildcard("category/Recovery/*.md"),
        "REISER4": Path.wildcard("category/REISER4/*.md"),
        "REISERFS": Path.wildcard("category/REISERFS/*.md"),
       # "RemoteAdmin": Path.wildcard("category/RemoteAdmin/*.md"),
        "RemoteAdministration": Path.wildcard("category/RemoteAdministration/*.md"),
        "Scanner": Path.wildcard("category/Scanner/*.md"),
        "SSL": Path.wildcard("category/SSL/*.md"),
        "SysOps": Path.wildcard("category/SysOps/*.md"),
        "SystemSecurity": Path.wildcard("category/SystemSecurity/*.md"),
        "TCP": Path.wildcard("category/TCP/*.md"),
        "Temperature": Path.wildcard("category/Temperature/*.md"),
        "Timeshift": Path.wildcard("category/Timeshift/*.md"),
        "Backup": Path.wildcard("category/UDF/*.md"),
        "UDP": Path.wildcard("category/UDP/*.md"),
        "VHDI": Path.wildcard("category/VHDI/*.md"),
        "Virtualization": Path.wildcard("category/Virtualization/*.md"),
        "VMDK": Path.wildcard("category/VMDK/*.md"),
        "VMFS": Path.wildcard("category/VMFS/*.md"),
        "VPN": Path.wildcard("category/VPN/*.md"),
        "WIFI": Path.wildcard("category/WIFI/*.md"),
        "XFS": Path.wildcard("category/XFS/*.md"),
        "ZFS": Path.wildcard("category/ZFS/*.md"),
        "ZIP": Path.wildcard("category/ZIP/*.md")
   ],

    ],
    ]
  end

  # Run mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
    {:ex_doc, "~> 0.23.0", only: :dev, runtime: false},
    {:earmark, "~> 1.4.13"}
      # {:"dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  # adding custom stylesheet
  defp docs_before_closing_head_tag(:html) do
    ~s{<link rel="stylesheet" href="assets/doc.css">}
  end
  defp docs_before_closing_head_tag(_), do: ""
end
