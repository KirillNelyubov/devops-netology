# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию "3.5. Файловые системы":

2. Не могут. Жёсткая ссылка это запись в таблице разделов файловой системы, которая указывает на объект(файл) в ФС, имеющий права доступа и владельца.
3. 
       kirill@kirill-mint:~/VirtualBox VMs$ vagrant destroy
           default: Are you sure you want to destroy the 'default' VM? [y/N] y
       ==> default: Destroying VM and associated drives...
       kirill@kirill-mint:~/VirtualBox VMs$ vi Vagrantfile
       kirill@kirill-mint:~/VirtualBox VMs$ vagrant up
       Bringing machine 'default' up with 'virtualbox' provider...
       ==> default: Importing base box 'bento/ubuntu-20.04'...
       ==> default: Matching MAC address for NAT networking...
       ==> default: Checking if box 'bento/ubuntu-20.04' version '202107.28.0' is up to date...
       ==> default: Setting the name of the VM: VirtualBoxVMs_default_1635871696045_14574
       ==> default: Clearing any previously set network interfaces...
       ==> default: Preparing network interfaces based on configuration...
           default: Adapter 1: nat
       ==> default: Forwarding ports...
           default: 22 (guest) => 2222 (host) (adapter 1)
       ==> default: Running 'pre-boot' VM customizations...
       ==> default: Booting VM...
       ==> default: Waiting for machine to boot. This may take a few minutes...
           default: SSH address: 127.0.0.1:2222
           default: SSH username: vagrant
           default: SSH auth method: private key
           default: Warning: Remote connection disconnect. Retrying...
           default: Warning: Connection reset. Retrying...
           default: Warning: Remote connection disconnect. Retrying...
           default: Warning: Connection reset. Retrying...
           default: 
           default: Vagrant insecure key detected. Vagrant will automatically replace
           default: this with a newly generated keypair for better security.
           default: 
           default: Inserting generated public key within guest...
           default: Removing insecure key from the guest if it's present...
           default: Key inserted! Disconnecting and reconnecting using new SSH key...
       ==> default: Machine booted and ready!
       ==> default: Checking for guest additions in VM...
       ==> default: Mounting shared folders...
           default: /vagrant => /home/kirill/VirtualBox VMs
       kirill@kirill-mint:~/VirtualBox VMs$ vagrant ssh
       Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-80-generic x86_64)
       
        * Documentation:  https://help.ubuntu.com
        * Management:     https://landscape.canonical.com
        * Support:        https://ubuntu.com/advantage
       
        System information disabled due to load higher than 2.0
       
       
       This system is built by the Bento project by Chef Software
       More information can be found at https://github.com/chef/bento
       vagrant@vagrant:~$ sudo -i
       root@vagrant:~# lsblk
       NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
       sda                    8:0    0   64G  0 disk 
       ├─sda1                 8:1    0  512M  0 part /boot/efi
       ├─sda2                 8:2    0    1K  0 part 
       └─sda5                 8:5    0 63.5G  0 part 
         ├─vgvagrant-root   253:0    0 62.6G  0 lvm  /
         └─vgvagrant-swap_1 253:1    0  980M  0 lvm  [SWAP]
       sdb                    8:16   0  2.5G  0 disk 
       sdc                    8:32   0  2.5G  0 disk 
4. 
       root@vagrant:~# fdisk /dev/sdb
       
       Welcome to fdisk (util-linux 2.34).
       Changes will remain in memory only, until you decide to write them.
       Be careful before using the write command.
       
       Device does not contain a recognized partition table.
       Created a new DOS disklabel with disk identifier 0x19edcbed.
       
       Command (m for help): n
       Partition type
          p   primary (0 primary, 0 extended, 4 free)
          e   extended (container for logical partitions)
       Select (default p): 
       
       Using default response p.
       Partition number (1-4, default 1): 
       First sector (2048-5242879, default 2048): 
       Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-5242879, default 5242879): +2G
       
       Created a new partition 1 of type 'Linux' and of size 2 GiB.
       
       Command (m for help): n
       Partition type
          p   primary (1 primary, 0 extended, 3 free)
          e   extended (container for logical partitions)
       Select (default p): 
       
       Using default response p.
       Partition number (2-4, default 2): 
       First sector (4196352-5242879, default 4196352): 
       Last sector, +/-sectors or +/-size{K,M,G,T,P} (4196352-5242879, default 5242879): 
       
       Created a new partition 2 of type 'Linux' and of size 511 MiB.
       
       Command (m for help): p
       Disk /dev/sdb: 2.51 GiB, 2684354560 bytes, 5242880 sectors
       Disk model: VBOX HARDDISK   
       Units: sectors of 1 * 512 = 512 bytes
       Sector size (logical/physical): 512 bytes / 512 bytes
       I/O size (minimum/optimal): 512 bytes / 512 bytes
       Disklabel type: dos
       Disk identifier: 0x19edcbed
       
       Device     Boot   Start     End Sectors  Size Id Type
       /dev/sdb1          2048 4196351 4194304    2G 83 Linux
       /dev/sdb2       4196352 5242879 1046528  511M 83 Linux
       
       Command (m for help): w
       The partition table has been altered.
       Calling ioctl() to re-read partition table.
       Syncing disks.
5.     root@vagrant:~# sfdisk -d /dev/sdb | sfdisk -f /dev/sdc
       Checking that no-one is using this disk right now ... OK
       
       Disk /dev/sdc: 2.51 GiB, 2684354560 bytes, 5242880 sectors
       Disk model: VBOX HARDDISK   
       Units: sectors of 1 * 512 = 512 bytes
       Sector size (logical/physical): 512 bytes / 512 bytes
       I/O size (minimum/optimal): 512 bytes / 512 bytes
       
       >>> Script header accepted.
       >>> Script header accepted.
       >>> Script header accepted.
       >>> Script header accepted.
       >>> Created a new DOS disklabel with disk identifier 0x19edcbed.
       /dev/sdc1: Created a new partition 1 of type 'Linux' and of size 2 GiB.
       /dev/sdc2: Created a new partition 2 of type 'Linux' and of size 511 MiB.
       /dev/sdc3: Done.
       
       New situation:
       Disklabel type: dos
       Disk identifier: 0x19edcbed
       
       Device     Boot   Start     End Sectors  Size Id Type
       /dev/sdc1          2048 4196351 4194304    2G 83 Linux
       /dev/sdc2       4196352 5242879 1046528  511M 83 Linux
       
       The partition table has been altered.
       Calling ioctl() to re-read partition table.
       Syncing disks
6.     root@vagrant:~# mdadm --create /dev/md1 -l1 -n2 /dev/sd{b1,c1}
       mdadm: Note: this array has metadata at the start and
           may not be suitable as a boot device.  If you plan to
           store '/boot' on this device please ensure that
           your boot-loader understands md/v1.x metadata, or use
           --metadata=0.90
       Continue creating array? y
       mdadm: Defaulting to version 1.2 metadata
       mdadm: array /dev/md1 started.
7.     root@vagrant:~# mdadm --create /dev/md0 -l0 -n2 /dev/sd{b2,c2}
       mdadm: Defaulting to version 1.2 metadata
       mdadm: array /dev/md0 started.
8.     root@vagrant:~# pvcreate /dev/md1 /dev/md0
         Physical volume "/dev/md1" successfully created.
         Physical volume "/dev/md0" successfully created.
9.     root@vagrant:~# vgcreate vg0 /dev/md0 /dev/md1
         Volume group "vg0" successfully created
10.     root@vagrant:~# lvcreate -L 100M vg0 /dev/md0
          Logical volume "lvol0" created.
11.     root@vagrant:~# lvs
          LV     VG        Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
          lvol0  vg0       -wi-a----- 100.00m                                                    
          root   vgvagrant -wi-ao---- <62.54g                                                    
          swap_1 vgvagrant -wi-ao---- 980.00m                                                    
        root@vagrant:~# mkfs.ext4 /dev/vg0/lvol0
        mke2fs 1.45.5 (07-Jan-2020)
        Creating filesystem with 25600 4k blocks and 25600 inodes
        
        Allocating group tables: done                            
        Writing inode tables: done                            
        Creating journal (1024 blocks): done
        Writing superblocks and filesystem accounting information: done
12.     root@vagrant:~# mkdir /tmp/new
        root@vagrant:~# mount /dev/vg0/lvol0 /tmp/new
13.     root@vagrant:~# wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz
        --2021-11-02 20:05:40--  https://mirror.yandex.ru/ubuntu/ls-lR.gz
        Resolving mirror.yandex.ru (mirror.yandex.ru)... 213.180.204.183, 2a02:6b8::183
        Connecting to mirror.yandex.ru (mirror.yandex.ru)|213.180.204.183|:443... connected.
        HTTP request sent, awaiting response... 200 OK
        Length: 22188258 (21M) [application/octet-stream]
        Saving to: ‘/tmp/new/test.gz’
        
        /tmp/new/test.gz            100%[=========================================>]  21.16M  5.68MB/s    in 3.8s    
        
        2021-11-02 20:05:44 (5.54 MB/s) - ‘/tmp/new/test.gz’ saved [22188258/22188258]
14.     root@vagrant:~# lsblk
        NAME                 MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
        sda                    8:0    0   64G  0 disk  
        ├─sda1                 8:1    0  512M  0 part  /boot/efi
        ├─sda2                 8:2    0    1K  0 part  
        └─sda5                 8:5    0 63.5G  0 part  
          ├─vgvagrant-root   253:0    0 62.6G  0 lvm   /
          └─vgvagrant-swap_1 253:1    0  980M  0 lvm   [SWAP]
        sdb                    8:16   0  2.5G  0 disk  
        ├─sdb1                 8:17   0    2G  0 part  
        │ └─md1                9:1    0    2G  0 raid1 
        └─sdb2                 8:18   0  511M  0 part  
          └─md0                9:0    0 1018M  0 raid0 
            └─vg0-lvol0      253:2    0  100M  0 lvm   /tmp/new
        sdc                    8:32   0  2.5G  0 disk  
        ├─sdc1                 8:33   0    2G  0 part  
        │ └─md1                9:1    0    2G  0 raid1 
        └─sdc2                 8:34   0  511M  0 part  
          └─md0                9:0    0 1018M  0 raid0 
            └─vg0-lvol0      253:2    0  100M  0 lvm   /tmp/new
15.     root@vagrant:~# gzip -t /tmp/new/test.gz
        root@vagrant:~# echo $?
        0
16.     root@vagrant:~# pvmove /dev/md0
          /dev/md0: Moved: 12.00%
          /dev/md0: Moved: 100.00%
        root@vagrant:~# lsblk
        NAME                 MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
        sda                    8:0    0   64G  0 disk  
        ├─sda1                 8:1    0  512M  0 part  /boot/efi
        ├─sda2                 8:2    0    1K  0 part  
        └─sda5                 8:5    0 63.5G  0 part  
          ├─vgvagrant-root   253:0    0 62.6G  0 lvm   /
          └─vgvagrant-swap_1 253:1    0  980M  0 lvm   [SWAP]
        sdb                    8:16   0  2.5G  0 disk  
        ├─sdb1                 8:17   0    2G  0 part  
        │ └─md1                9:1    0    2G  0 raid1 
        │   └─vg0-lvol0      253:2    0  100M  0 lvm   /tmp/new
        └─sdb2                 8:18   0  511M  0 part  
          └─md0                9:0    0 1018M  0 raid0 
        sdc                    8:32   0  2.5G  0 disk  
        ├─sdc1                 8:33   0    2G  0 part  
        │ └─md1                9:1    0    2G  0 raid1 
        │   └─vg0-lvol0      253:2    0  100M  0 lvm   /tmp/new
        └─sdc2                 8:34   0  511M  0 part  
          └─md0                9:0    0 1018M  0 raid0 
17.     root@vagrant:~# mdadm /dev/md1 --fail /dev/sdc1
        mdadm: set /dev/sdc1 faulty in /dev/md1
18. dmesg:

        [ 5573.942585] md/raid1:md1: Disk failure on sdc1, disabling device.
                       md/raid1:md1: Operation continuing on 1 devices.
19.     root@vagrant:~# gzip -t /tmp/new/test.gz 
        root@vagrant:~# echo $?                  
        0
20.     root@vagrant:~# logout
        vagrant@vagrant:~$ logout
        Connection to 127.0.0.1 closed.
        kirill@kirill-mint:~/VirtualBox VMs$ vagrant destroy
            default: Are you sure you want to destroy the 'default' VM? [y/N] y
        ==> default: Forcing shutdown of VM...
        ==> default: Destroying VM and associated drives...
