# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию "3.8. Компьютерные сети, лекция 3":

1.     route-views>show ip route 185.125.114.2
       Routing entry for 185.125.112.0/22
         Known via "bgp 6447", distance 20, metric 0
         Tag 6939, type external
         Last update from 64.71.137.241 5w6d ago
         Routing Descriptor Blocks:
         * 64.71.137.241, from 64.71.137.241, 5w6d ago
             Route metric is 0, traffic share count is 1
             AS Hops 7
             Route tag 6939
             MPLS label: none
       route-views>show bgp 185.125.114.2             
       BGP routing table entry for 185.125.112.0/22, version 1156393389
       Paths: (24 available, best #23, table default)
         Not advertised to any peer
         Refresh Epoch 1
         4901 6079 3257 12389 201776 28761 50042 50042 50042, (aggregated by 50042 185.125.112.1)
           162.250.137.254 from 162.250.137.254 (162.250.137.254)
             Origin IGP, localpref 100, valid, external
             Community: 65000:10100 65000:10300 65000:10400
             path 7FE07FD900E8 RPKI State not found
             rx pathid: 0, tx pathid: 0
         Refresh Epoch 3
         3303 12389 201776 28761 50042 50042 50042, (aggregated by 50042 185.125.112.1)
           217.192.89.50 from 217.192.89.50 (138.187.128.158)
             Origin IGP, localpref 100, valid, external
             Community: 3303:1004 3303:1006 3303:1030 3303:3056 28761:1008 65500:1 65500:101 65500:102 65500:103 65500:201 65500:205
             path 7FE0A1BABB98 RPKI State not found
             rx pathid: 0, tx pathid: 0
         Refresh Epoch 1
         7660 2516 12389 201776 28761 50042 50042 50042, (aggregated by 50042 185.125.112.1)
           203.181.248.168 from 203.181.248.168 (203.181.248.168)
             Origin IGP, localpref 100, valid, external
             Community: 2516:1050 7660:9003
             path 7FE051E029F0 RPKI State not found
             rx pathid: 0, tx pathid: 0
         Refresh Epoch 1
         3267 1299 12389 201776 28761 50042 50042 50042, (aggregated by 50042 185.125.112.1)
           194.85.40.15 from 194.85.40.15 (185.141.126.1)
             Origin IGP, metric 0, localpref 100, valid, external
             path 7FE0B500B560 RPKI State not found
        --More-- 

2.     vagrant@vagrant:~$ cat /etc/network/interfaces
       # interfaces(5) file used by ifup(8) and ifdown(8)
       # Include files from /etc/network/interfaces.d:
       source-directory /etc/network/interfaces.d
       
       auto dummy0
       iface dummy0 inet static
           address 10.2.2.2/32
           pre-up ip link add dummy0 type dummy
           post-down ip link del dummy0
       vagrant@vagrant:~$ ip route
       default via 10.0.2.2 dev eth0 proto dhcp src 10.0.2.15 metric 100 
       10.0.2.0/24 dev eth0 proto kernel scope link src 10.0.2.15 
       10.0.2.2 dev eth0 proto dhcp scope link src 10.0.2.15 metric 100 
       10.2.2.2 dev dummy0 scope link 
       10.8.0.0/24 via 192.168.3.5 dev eth1 
       192.168.3.0/24 dev eth1 proto kernel scope link src 192.168.3.107 
       192.168.3.5 dev eth1 proto dhcp scope link src 192.168.3.107 metric 100 
3.     vagrant@vagrant:~$ sudo ss -ltpn
       State        Recv-Q       Send-Q             Local Address:Port              Peer Address:Port       Process                                                          
       LISTEN       0            4096                     0.0.0.0:111                    0.0.0.0:*           users:(("rpcbind",pid=595,fd=4),("systemd",pid=1,fd=117))       
       LISTEN       0            4096               127.0.0.53%lo:53                     0.0.0.0:*           users:(("systemd-resolve",pid=596,fd=13))                       
       LISTEN       0            128                      0.0.0.0:22                     0.0.0.0:*           users:(("sshd",pid=827,fd=3))                                   
       LISTEN       0            4096                        [::]:111                       [::]:*           users:(("rpcbind",pid=595,fd=6),("systemd",pid=1,fd=119))       
       LISTEN       0            128                         [::]:22                        [::]:*           users:(("sshd",pid=827,fd=4))
    Открытые порты IPv4: 111, 53, 22; IPv6: 111, 22. Сервисы соответственно: rpcbind(systemd), systemd-resolve, sshd.
4.     vagrant@vagrant:~$ sudo ss -lupn
       State      Recv-Q     Send-Q                          Local Address:Port         Peer Address:Port     Process                                                        
       UNCONN     0          0                                   127.0.0.1:161               0.0.0.0:*         users:(("snmpd",pid=767,fd=6))                                
       UNCONN     0          0                               127.0.0.53%lo:53                0.0.0.0:*         users:(("systemd-resolve",pid=596,fd=12))                     
       UNCONN     0          0                          192.168.3.107%eth1:68                0.0.0.0:*         users:(("systemd-network",pid=1204,fd=21))                    
       UNCONN     0          0                              10.0.2.15%eth0:68                0.0.0.0:*         users:(("systemd-network",pid=1204,fd=23))                    
       UNCONN     0          0                                     0.0.0.0:111               0.0.0.0:*         users:(("rpcbind",pid=595,fd=5),("systemd",pid=1,fd=118))     
       UNCONN     0          0                                       [::1]:161                  [::]:*         users:(("snmpd",pid=767,fd=7))                                
       UNCONN     0          0              [fe80::a00:27ff:fe91:ec4]%eth1:546                  [::]:*         users:(("systemd-network",pid=1204,fd=18))                    
       UNCONN     0          0                                        [::]:111                  [::]:*         users:(("rpcbind",pid=595,fd=7),("systemd",pid=1,fd=120)) 
   Используемые сокеты IPv4: 161, 53, 68, 111; IPv6: 161, 546, 111. Сервисы соответственно: snmpd, systemd-resolve, systemd-network, rpcbind(systemd).
5. ![](Untitled Diagram.drawio)