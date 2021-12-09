# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию "3.9. Элементы безопасности информационных систем":

1. <img src="Снимок экрана в 2021-12-09 00-58-08.png"/>
2. Выполнено. Принт-скрин "Google authenticator"а сделать не получается, доступ запрещён.


3. <img src="Снимок экрана в 2021-12-09 18-11-27.png"/>
   <img src="Снимок экрана в 2021-12-09 18-11-39.png"/>

4.     root@vagrant:~/testssl.sh# ./testssl.sh -U --sneaky https://duckduckgo.com
      
       ###########################################################
          testssl.sh       3.1dev from https://testssl.sh/dev/
          (0118603 2021-12-09 13:16:50 -- )
      
            This program is free software. Distribution and
                   modification under GPLv2 permitted.
            USAGE w/o ANY WARRANTY. USE IT AT YOUR OWN RISK!
      
             Please file bugs @ https://testssl.sh/bugs/
      
       ###########################################################
    
       Using "OpenSSL 1.0.2-chacha (1.0.2k-dev)" [~183 ciphers]
       on vagrant:./bin/openssl.Linux.x86_64
       (built: "Jan 18 17:12:17 2019", platform: "linux-x86_64")
      
      
       Start 2021-12-09 15:23:38        -->> 40.114.177.156:443 (duckduckgo.com) <<--
      
       rDNS (40.114.177.156):  --
       Service detected:       HTTP
      
      
       Testing vulnerabilities 
      
       Heartbleed (CVE-2014-0160)                not vulnerable (OK), no heartbeat extension
       CCS (CVE-2014-0224)                       not vulnerable (OK)
       Ticketbleed (CVE-2016-9244), experiment.  not vulnerable (OK)
       ROBOT                                     not vulnerable (OK)
       Secure Renegotiation (RFC 5746)           supported (OK)
       Secure Client-Initiated Renegotiation     not vulnerable (OK)
       CRIME, TLS (CVE-2012-4929)                not vulnerable (OK)
       BREACH (CVE-2013-3587)                    potentially NOT ok, "br gzip" HTTP compression detected. - only supplied "/" tested
                                                 Can be ignored for static pages or if no secrets in the page
       POODLE, SSL (CVE-2014-3566)               not vulnerable (OK)
       TLS_FALLBACK_SCSV (RFC 7507)              No fallback possible (OK), no protocol below TLS 1.2 offered
       SWEET32 (CVE-2016-2183, CVE-2016-6329)    not vulnerable (OK)
       FREAK (CVE-2015-0204)                     not vulnerable (OK)
       DROWN (CVE-2016-0800, CVE-2016-0703)      not vulnerable on this host and port (OK)
                                                 make sure you don't use this certificate elsewhere with SSLv2 enabled services
                                                 https://censys.io/ipv4?q=A5D67800EBB234DB3814A0FA562D57DDC6F3D55FE999012D67CCCE96EEDEC9D5 could help you to find out
       LOGJAM (CVE-2015-4000), experimental      not vulnerable (OK): no DH EXPORT ciphers, no DH key detected with <= TLS 1.2
       BEAST (CVE-2011-3389)                     not vulnerable (OK), no SSL3 or TLS1
       LUCKY13 (CVE-2013-0169), experimental     potentially VULNERABLE, uses cipher block chaining (CBC) ciphers with TLS. Check patches
       Winshock (CVE-2014-6321), experimental    not vulnerable (OK)
       RC4 (CVE-2013-2566, CVE-2015-2808)        no RC4 ciphers detected (OK)
      
      
       Done 2021-12-09 15:24:15 [  46s] -->> 40.114.177.156:443 (duckduckgo.com) <<--
5.     vagrant@vagrant:~$ ssh-keygen
       Generating public/private rsa key pair.
       Enter file in which to save the key (/home/vagrant/.ssh/id_rsa): 
       Enter passphrase (empty for no passphrase): 
       Enter same passphrase again: 
       Your identification has been saved in /home/vagrant/.ssh/id_rsa
       Your public key has been saved in /home/vagrant/.ssh/id_rsa.pub
       The key fingerprint is:
       SHA256:xTTQf3SD3yJj0MmDJd+s5aw4EDddZFx2FejLD6dG6Hk vagrant@vagrant
       The key's randomart image is:
       +---[RSA 3072]----+
       |        .o+=.+*oB|
       |         o+==Booo|
       |        . =o+o=.o|
       |         + .=*o..|
       |        S  .+++. |
       |         . o * . |
       |          + + =  |
       |           + E . |
       |            o    |
       +----[SHA256]-----+
       vagrant@vagrant:~$ ssh-copy-id kirill@192.168.3.150
       /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/vagrant/.ssh/id_rsa.pub"
       The authenticity of host '192.168.3.150 (192.168.3.150)' can't be established.
       ECDSA key fingerprint is SHA256:+IAXssdwADp7fwK9xkfX5aTvHZ/9fRSWnIulcWXFCu0.
       Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
       /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
       /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
       kirill@192.168.3.150's password: 
       
       Number of key(s) added: 1
       
       Now try logging into the machine, with:   "ssh 'kirill@192.168.3.150'"
       and check to make sure that only the key(s) you wanted were added.
       
       vagrant@vagrant:~$ ssh kirill@192.168.3.150
       
       kirill@kirill-mint:~$ 
6.     vagrant@vagrant:~$ mv .ssh/id_rsa .ssh/mint.key
       vagrant@vagrant:~$ nano .ssh/config
       vagrant@vagrant:~$ cat .ssh/config
       Host mint
         HostName 192.168.3.150
         IdentityFile ~/.ssh/mint.key
         User kirill
       vagrant@vagrant:~$ chmod 600 .ssh/config
       vagrant@vagrant:~$ ssh mint
       
       Last login: Thu Dec  9 18:34:17 2021 from 192.168.3.107
       kirill@kirill-mint:~$
7.     vagrant@vagrant:~$ sudo tcpdump -c 100 -s 0 -i eth1 -w mycap.pcap
        tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size 262144 bytes
        100 packets captured
        112 packets received by filter
        0 packets dropped by kernel
        vagrant@vagrant:~$ tshark -r mycap.pcap
            1   0.000000  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
            2   3.061706  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
            3   6.123344  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
            4   9.185041  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
            5   9.865174 PcsCompu_91:0e:c4 → LLDP_Multicast LLDP 217 MA/08:00:27:73:60:cf MA/08:00:27:91:0e:c4 120 SysN=vagrant.vm SysD=Ubuntu 20.04.2 LTS Linux 5.4.0-80-generic #90-Ubuntu SMP Fri Jul 9 22:49:44 UTC 2021 x86_64 
            6  12.246635  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
            7  15.269521  192.168.3.1 → 239.255.255.250 SSDP 366 NOTIFY * HTTP/1.1 
            8  15.308392  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
            9  15.369902  192.168.3.1 → 239.255.255.250 SSDP 375 NOTIFY * HTTP/1.1 
           10  15.470337  192.168.3.1 → 239.255.255.250 SSDP 438 NOTIFY * HTTP/1.1 
           11  15.570977  192.168.3.1 → 239.255.255.250 SSDP 430 NOTIFY * HTTP/1.1 
           12  15.671921  192.168.3.1 → 239.255.255.250 SSDP 375 NOTIFY * HTTP/1.1 
           13  15.772243  192.168.3.1 → 239.255.255.250 SSDP 414 NOTIFY * HTTP/1.1 
           14  15.872819  192.168.3.1 → 239.255.255.250 SSDP 446 NOTIFY * HTTP/1.1 
           15  15.973776  192.168.3.1 → 239.255.255.250 SSDP 375 NOTIFY * HTTP/1.1 
           16  16.074176  192.168.3.1 → 239.255.255.250 SSDP 434 NOTIFY * HTTP/1.1 
           17  16.174945  192.168.3.1 → 239.255.255.250 SSDP 428 NOTIFY * HTTP/1.1 
           18  18.370153  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           19  19.404201 ASUSTekC_92:de:df → LLDP_Multicast LLDP 216 MA/74:d0:2b:92:de:df MA/74:d0:2b:92:de:df 120 SysN=kirill-mint SysD=Linux Mint 20.2 Linux 5.4.0-91-generic #102-Ubuntu SMP Fri Nov 5 16:31:28 UTC 2021 x86_64 
           20  21.431746  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           21  24.493478  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           22  27.555143  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           23  30.616833  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           24  33.678470  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           25  34.256994      fe80::1 → ff05::c      SSDP 188 M-SEARCH * HTTP/1.1 
           26  34.516794      fe80::1 → ff05::c      SSDP 188 M-SEARCH * HTTP/1.1 
           27  34.778104      fe80::1 → ff02::c      SSDP 188 M-SEARCH * HTTP/1.1 
           28  35.037288      fe80::1 → ff02::c      SSDP 188 M-SEARCH * HTTP/1.1 
           29  35.297187  192.168.3.7 → 239.255.255.250 SSDP 174 M-SEARCH * HTTP/1.1 
           30  35.557392  192.168.3.7 → 239.255.255.250 SSDP 174 M-SEARCH * HTTP/1.1 
           31  35.817795      fe80::1 → ff05::c      SSDP 189 M-SEARCH * HTTP/1.1 
           32  36.077711      fe80::1 → ff05::c      SSDP 189 M-SEARCH * HTTP/1.1 
           33  36.337877      fe80::1 → ff02::c      SSDP 189 M-SEARCH * HTTP/1.1 
           34  36.598125      fe80::1 → ff02::c      SSDP 189 M-SEARCH * HTTP/1.1 
           35  36.740342  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           36  36.858430  192.168.3.7 → 239.255.255.250 SSDP 175 M-SEARCH * HTTP/1.1 
           37  37.118174  192.168.3.7 → 239.255.255.250 SSDP 175 M-SEARCH * HTTP/1.1 
           38  39.801739  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           39  39.880790 PcsCompu_91:0e:c4 → LLDP_Multicast LLDP 217 MA/08:00:27:73:60:cf MA/08:00:27:91:0e:c4 120 SysN=vagrant.vm SysD=Ubuntu 20.04.2 LTS Linux 5.4.0-80-generic #90-Ubuntu SMP Fri Jul 9 22:49:44 UTC 2021 x86_64 
           40  42.863541  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           41  44.449893 ASUSTekC_92:de:df → Broadcast    ARP 60 Who has 192.168.3.107? Tell 192.168.3.150
           42  44.449918 PcsCompu_91:0e:c4 → ASUSTekC_92:de:df ARP 42 192.168.3.107 is at 08:00:27:91:0e:c4
           43  44.450002 192.168.3.150 → 192.168.3.107 TCP 74 52000 → 22 [SYN] Seq=0 Win=64240 Len=0 MSS=1460 SACK_PERM=1 TSval=1446280567 TSecr=0 WS=128
           44  44.450017 192.168.3.107 → 192.168.3.150 TCP 74 22 → 52000 [SYN, ACK] Seq=0 Ack=1 Win=65160 Len=0 MSS=1460 SACK_PERM=1 TSval=2856006081 TSecr=1446280567 WS=128
           45  44.450099 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=1 Ack=1 Win=64256 Len=0 TSval=1446280568 TSecr=2856006081
           46  44.450387 192.168.3.150 → 192.168.3.107 SSH 107 Client: Protocol (SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.3)
           47  44.450394 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=1 Ack=42 Win=65152 Len=0 TSval=2856006081 TSecr=1446280568
           48  44.456061 192.168.3.107 → 192.168.3.150 SSHv2 107 Server: Protocol (SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.2)
           49  44.456186 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=42 Ack=42 Win=64256 Len=0 TSval=1446280574 TSecr=2856006087
           50  44.456776 192.168.3.107 → 192.168.3.150 SSHv2 1122 Server: Key Exchange Init
           51  44.456875 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=42 Ack=1098 Win=64128 Len=0 TSval=1446280574 TSecr=2856006087
           52  44.458828 192.168.3.150 → 192.168.3.107 SSHv2 1578 Client: Key Exchange Init
           53  44.458834 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=1098 Ack=1554 Win=63872 Len=0 TSval=2856006089 TSecr=1446280576
           54  44.460478 192.168.3.150 → 192.168.3.107 SSHv2 114 Client: Diffie-Hellman Key Exchange Init
           55  44.460482 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=1098 Ack=1602 Win=64128 Len=0 TSval=2856006091 TSecr=1446280578
           56  44.464309 192.168.3.107 → 192.168.3.150 SSHv2 574 Server: Diffie-Hellman Key Exchange Reply, New Keys, Encrypted packet (len=228)
           57  44.464659 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=1602 Ack=1606 Win=64128 Len=0 TSval=1446280582 TSecr=2856006095
           58  45.925303  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           59  47.711389 192.168.3.150 → 192.168.3.107 SSHv2 82 Client: New Keys
           60  47.711434 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=1606 Ack=1618 Win=64128 Len=0 TSval=2856009342 TSecr=1446283827
           61  47.712139 192.168.3.150 → 192.168.3.107 SSHv2 110 Client: Encrypted packet (len=44)
           62  47.712154 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=1606 Ack=1662 Win=64128 Len=0 TSval=2856009343 TSecr=1446283828
           63  47.712346 192.168.3.107 → 192.168.3.150 SSHv2 110 Server: Encrypted packet (len=44)
           64  47.712537 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=1662 Ack=1650 Win=64128 Len=0 TSval=1446283828 TSecr=2856009343
           65  47.712648 192.168.3.150 → 192.168.3.107 SSHv2 134 Client: Encrypted packet (len=68)
           66  47.712658 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=1650 Ack=1730 Win=64128 Len=0 TSval=2856009343 TSecr=1446283828
           67  47.721772 192.168.3.107 → 192.168.3.150 SSHv2 118 Server: Encrypted packet (len=52)
           68  47.721899 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=1730 Ack=1702 Win=64128 Len=0 TSval=1446283838 TSecr=2856009352
           69  47.721928 192.168.3.150 → 192.168.3.107 SSHv2 206 Client: Encrypted packet (len=140)
           70  47.721931 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=1702 Ack=1870 Win=64128 Len=0 TSval=2856009352 TSecr=1446283838
           71  47.730848 192.168.3.107 → 192.168.3.150 SSHv2 118 Server: Encrypted packet (len=52)
           72  47.730975 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=1870 Ack=1754 Win=64128 Len=0 TSval=1446283847 TSecr=2856009361
           73  48.986963  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           74  49.423336 ASUSTekC_92:de:df → LLDP_Multicast LLDP 216 MA/74:d0:2b:92:de:df MA/74:d0:2b:92:de:df 120 SysN=kirill-mint SysD=Linux Mint 20.2 Linux 5.4.0-91-generic #102-Ubuntu SMP Fri Nov 5 16:31:28 UTC 2021 x86_64 
           75  52.048599  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           76  53.891532 192.168.3.150 → 192.168.3.107 SSHv2 214 Client: Encrypted packet (len=148)
           77  53.891577 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=1754 Ack=2018 Win=64128 Len=0 TSval=2856015522 TSecr=1446290004
           78  53.909965 192.168.3.107 → 192.168.3.150 SSHv2 94 Server: Encrypted packet (len=28)
           79  53.910069 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=2018 Ack=1782 Win=64128 Len=0 TSval=1446290023 TSecr=2856015541
           80  53.910206 192.168.3.150 → 192.168.3.107 SSHv2 178 Client: Encrypted packet (len=112)
           81  53.910211 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=1782 Ack=2130 Win=64128 Len=0 TSval=2856015541 TSecr=1446290023
           82  54.135251 192.168.3.107 → 192.168.3.150 SSHv2 694 Server: Encrypted packet (len=628)
           83  54.177227 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=2130 Ack=2410 Win=64128 Len=0 TSval=1446290290 TSecr=2856015766
           84  54.177247 192.168.3.107 → 192.168.3.150 SSHv2 110 Server: Encrypted packet (len=44)
           85  54.177455 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=2130 Ack=2454 Win=64128 Len=0 TSval=1446290290 TSecr=2856015808
           86  54.177642 192.168.3.150 → 192.168.3.107 SSHv2 526 Client: Encrypted packet (len=460)
           87  54.177654 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=2454 Ack=2590 Win=64128 Len=0 TSval=2856015808 TSecr=1446290290
           88  54.179391 192.168.3.107 → 192.168.3.150 SSHv2 174 Server: Encrypted packet (len=108)
           89  54.179653 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=2590 Ack=2562 Win=64128 Len=0 TSval=1446290292 TSecr=2856015810
           90  54.179812 192.168.3.107 → 192.168.3.150 SSHv2 862 Server: Encrypted packet (len=796)
           91  54.180055 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=2590 Ack=3358 Win=64128 Len=0 TSval=1446290293 TSecr=2856015810
           92  54.192040 192.168.3.107 → 192.168.3.150 SSHv2 174 Server: Encrypted packet (len=108)
           93  54.192158 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=2590 Ack=3466 Win=64128 Len=0 TSval=1446290305 TSecr=2856015823
           94  55.110416  192.168.3.1 → 255.255.255.255 UDP 215 34160 → 7437 Len=173
           95  56.637260 192.168.3.150 → 192.168.3.107 SSHv2 102 Client: Encrypted packet (len=36)
           96  56.637300 192.168.3.107 → 192.168.3.150 TCP 66 22 → 52000 [ACK] Seq=3466 Ack=2626 Win=64128 Len=0 TSval=2856018268 TSecr=1446292748
           97  56.638016 192.168.3.107 → 192.168.3.150 SSHv2 102 Server: Encrypted packet (len=36)
           98  56.638140 192.168.3.107 → 192.168.3.150 SSHv2 174 Server: Encrypted packet (len=108)
           99  56.638281 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=2626 Ack=3502 Win=64128 Len=0 TSval=1446292750 TSecr=2856018269
          100  56.638281 192.168.3.150 → 192.168.3.107 TCP 66 52000 → 22 [ACK] Seq=2626 Ack=3610 Win=64128 Len=0 TSval=1446292750 TSecr=2856018269





