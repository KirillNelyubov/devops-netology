# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию "3.7. Компьютерные сети, лекция 2":

1.     kirill@kirill-mint:~$ ip -c -br link
       lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP> 
       eno1             UP             74:d0:2b:92:de:df <BROADCAST,MULTICAST,UP,LOWER_UP> 
       virbr0           DOWN           52:54:00:8a:24:82 <NO-CARRIER,BROADCAST,MULTICAST,UP> 
       virbr0-nic       DOWN           52:54:00:8a:24:82 <BROADCAST,MULTICAST> 
 
       PS C:\Users\itshk> ipconfig

       Настройка протокола IP для Windows


       Адаптер Ethernet Ethernet:
       
          DNS-суффикс подключения . . . . . : local
          Локальный IPv6-адрес канала . . . : fe80::15eb:204e:9f45:9b78%3
          IPv4-адрес. . . . . . . . . . . . : 192.168.3.103
          Маска подсети . . . . . . . . . . : 255.255.255.0
          Основной шлюз. . . . . . . . . : fe80::1%3
                                       fe80::789c:eaff:fe21:f81%3
                                       192.168.3.5
2. LLDP – протокол для обмена информацией между соседними устройствами. Пакет в Linux - lldpd.  

       vagrant@vagrant:~$ sudo systemctl enable lldpd && sudo systemctl start lldpd
       vagrant@vagrant:~$ lldpctl
       -------------------------------------------------------------------------------
       LLDP neighbors:
       -------------------------------------------------------------------------------
       Interface:    eth1, via: LLDP, RID: 1, Time: 0 day, 00:00:01
         Chassis:     
           ChassisID:    mac 74:d0:2b:92:de:df
           SysName:      kirill-mint
           SysDescr:     Linux Mint 20.2 Linux 5.4.0-90-generic #101-Ubuntu SMP Fri Oct 15 20:00:55 UTC 2021 x86_64
           MgmtIP:       192.168.3.150
           MgmtIP:       fe80::14a1:2c59:3dcb:c5ff
           Capability:   Bridge, on
           Capability:   Router, on
           Capability:   Wlan, off
           Capability:   Station, off
         Port:        
           PortID:       mac 74:d0:2b:92:de:df
           PortDescr:    eno1
           TTL:          120
           PMD autoneg:  supported: yes, enabled: yes
             Adv:          10Base-T, HD: yes, FD: yes
             Adv:          100Base-TX, HD: yes, FD: yes
             Adv:          1000Base-T, HD: no, FD: yes
             MAU oper type: 1000BaseTFD - Four-pair Category 5 UTP, full duplex mode
       -------------------------------------------------------------------------------
3. Технология VLAN, 802.1q – стандарт Ethernet. Пакет в Linux - vlan. 
            
       vagrant@vagrant:~$ sudo ip link add link eth0 name eth0.100 type vlan id 100
       vagrant@vagrant:~$ ip -d link show eth0.100
       4: eth0.100@eth0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
           link/ether 08:00:27:73:60:cf brd ff:ff:ff:ff:ff:ff promiscuity 0 minmtu 0 maxmtu 65535 
           vlan protocol 802.1Q id 100 <REORDER_HDR> addrgenmode eui64 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535

    /etc/systemd/network/00-eth0.100.netdev:

       [NetDev]
       Name=eth0.100
       Kind=vlan
       
       [VLAN]
       Id=100
   
   /etc/systemd/network/10-eth0.network: 

       [Match]
       Name=eth0
       
       [Network]
       DHCP=ipv4
       VLAN=eth0.100

   /etc/systemd/network/20-eth0.100.network:

       [Match]
       Name=eth0.100
       
       [Network]
       DHCP=no
       
       [Address]
       Address=192.168.1.25/24

   Или по старому - /etc/network/interfaces:

       auto eth0.100
       iface eth0.100 inet static
         vlan-raw-device eth0
         address 192.168.1.25/24
4. Агрегация портов в Linux – бондинг. /etc/network/interfaces:

       auto enp2s0
       iface enp2s0 inet manual
       
       auto enp2s1
       iface enp2s1 inet manual
       
       auto bond0
       iface bond0 inet static
       address 10.10.10.1/24
       gateway 10.10.10.254
       dns-nameservers 10.10.10.10 10.10.10.11
       slaves enp2s0 enp2s1
       bond-mode 802.3ad
       bond-lacp-rate slow5

8. IP адресов в сети с маской /29, для хостов 6. 32 сети с маской /29 можно получить из сети с маской /24:

    10.10.10.0/29, 10.10.10.8/29, 10.10.10.16/29, 10.10.10.24/29.... 10.10.10.248/29.

6. Для частной сети кроме 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 возможно использовать диапазон 100.64.0.0 — 100.127.255.255, например: 100.100.100.0/26.
7.     vagrant@vagrant:~$ ip neigh
       10.0.2.2 dev eth0 lladdr 52:54:00:12:35:02 DELAY
       192.168.3.5 dev eth1 lladdr 00:1e:06:cb:18:19 STALE
       10.0.2.3 dev eth0 lladdr 52:54:00:12:35:03 STALE
       fe80::1 dev eth1 lladdr dc:99:14:0b:9b:a7 router STALE
       fe80::789c:eaff:fe21:f81 dev eth1 lladdr f8:1a:67:a2:93:d7 router STALE

       C:\Users\sergey.myasnikov>arp -a
       Интерфейс: 100.100.14.113 --- 0x3
         адрес в Интернете      Физический адрес      Тип
         100.100.14.1          00-00-0c-9f-f0-02     динамический
         100.100.14.8          6c-9c-ed-40-42-c1     динамический
         100.100.14.9          40-55-39-0c-dd-c1     динамический
         224.0.0.22            01-00-5e-00-00-16     статический
         255.255.255.255       ff-ff-ff-ff-ff-ff     статический

       sudo ip neigh del 10.0.2.3 dev eth0

       sudo ip neigh flush all

