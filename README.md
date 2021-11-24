# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию "3.6. Компьютерные сети, лекция 1":

2. На 2,4ГГц В России и странах СНГ для использования доступно 13 каналов. Всего 14. При ширине канала 20МГц три не пересекающихся канала. Для 5ГГц диапазона в РФ используется 17 каналов.
3.     kirill@kirill-mint:~$ grep 38F9D3 /usr/share/nmap/nmap-mac-prefixes
       38F9D3 Apple
4. 9001(Ethernet MTU)-20(IP Header)-32(TCP Header)=8949(Payload) 
5. При нормальном поведении TCP они никогда не должны быть установлены в одном пакете.
6. Поскольку реч идёт о UDP протоколе, TIME-WAIT в State присутствовать не может, т.к. сокет не ждёт ответа.  
7.      инициатор                ответчик
       ESTABLESHED              ESTABLESHED 
       FIN WAIT 1  >  FIN   >   CLOSE WAIT
       FIN WAIT 2 < ACK-FIN  <  CLOSE WAIT
       TIME WAIT   >  ACK   >   LAST ACK
       CLOSED                   CLOSED
8. Уникальность сокета определяется четырьмя факторами: 

    1. локальный IP-адрес
    2. номер локального порта
    3. удаленный IP-адрес
    4. номер удаленного порта

     Теоретически с одного IP-адреса можно установить 65535 соединений на каждый порт сервера. Но реально сервер ограничен ресурсами процессора, памяти и т.д.  
9. Может у клиента, который активно подключается/отключается к удаленной службе. Если клиент был активной стороной завершения TCP-сессии, то это соединение будет заблокировано какое-то время в состоянии TIME_WAIT. Если соединения устанавливаются быстрее чем порты выходят из TIME_WAIT, то свободные порты могут закончиться. К тому же расходуются системные ресурсы.        
10. Если один фрагмент теряется, то теряется весь пакет, и его надо посылать повторно. Контроль целостности данных ложится на приложение. В TCP соединении контроль осуществляется на уровне протокола.      
   
11. Если требуется гарантированная доставка логов с нескольких хостов, то предпочтительнее использовать TCP протокол, к тому же он может обеспечить безопасное(шифрованое) соединение.   
12.     vagrant@vagrant:~$ sudo ss  -ltp
        State     Recv-Q    Send-Q       Local Address:Port         Peer Address:Port   Process                                                                         
        LISTEN    0         4096         127.0.0.53%lo:domain            0.0.0.0:*       users:(("systemd-resolve",pid=610,fd=13))                                      
        LISTEN    0         128                0.0.0.0:ssh               0.0.0.0:*       users:(("sshd",pid=1353,fd=3))                                                 
        LISTEN    0         4096               0.0.0.0:sunrpc            0.0.0.0:*       users:(("rpcbind",pid=609,fd=4),("systemd",pid=1,fd=35))                       
        LISTEN    0         128                   [::]:ssh                  [::]:*       users:(("sshd",pid=1353,fd=4))                                                 
        LISTEN    0         4096                  [::]:sunrpc               [::]:*       users:(("rpcbind",pid=609,fd=6),("systemd",pid=1,fd=37))                       
    3-IPv4, 2-IPv6. systemd-resolve, sshd, rpcbind.
13.     vagrant@vagrant:~$ sudo tcpdump -A -c 1
        tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
        listening on eth0, link-type EN10MB (Ethernet), capture size 262144 bytes
        21:11:24.325992 IP vagrant.ssh > _gateway.42178: Flags [P.], seq 3940246595:3940246743, ack 6791863, win 62780, length 148
        E...?.@.@.. 
        ...
        .........dC.g..P..<.....n,.#,Tn.m.<7...d<!.......U.g.K|..!C4N.$N..G.,..W....;..\.../.BU..cT?....\.#....~....n..r=...F.....N.,..#:.....wPZ..S.....7.g/zN..m.n+yG..,+M.3.....
        1 packet captured
        11 packets received by filter
        0 packets dropped by kernel
        vagrant@vagrant:~$ sudo tcpdump -X -c 1
        tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
        listening on eth0, link-type EN10MB (Ethernet), capture size 262144 bytes
        21:12:09.086026 IP vagrant.ssh > _gateway.42178: Flags [P.], seq 3940248547:3940248583, ack 6792943, win 62780, length 36
            0x0000:  4510 004c 4021 4000 4006 e26a 0a00 020f  E..L@!@.@..j....
            0x0010:  0a00 0202 0016 a4c2 eadb 6be3 0067 a6ef  ..........k..g..
            0x0020:  5018 f53c 184f 0000 6ad3 49bb cf3a b89a  P..<.O..j.I..:..
            0x0030:  386b 3d51 a7bc cdf2 aa4c f20d cabd 6de7  8k=Q.....L....m.
            0x0040:  4010 ce6d e13c e76b 0f2e 8b73            @..m.<.k...s
        1 packet captured
        11 packets received by filter
        0 packets dropped by kernel
14.     Ethernet II, Src: PcsCompu_73:60:cf (08:00:27:73:60:cf), Dst: RealtekU_12:35:02 (52:54:00:12:35:02)
            Destination: RealtekU_12:35:02 (52:54:00:12:35:02)
                Address: RealtekU_12:35:02 (52:54:00:12:35:02)
            .... ..1. .... .... .... .... = LG bit: Locally administered address (this is NOT the factory default)
            .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
            Source: PcsCompu_73:60:cf (08:00:27:73:60:cf)
                Address: PcsCompu_73:60:cf (08:00:27:73:60:cf)
                .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
                .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
            Type: IPv4 (0x0800)
        Internet Protocol Version 4, Src: 10.0.2.15, Dst: 10.0.2.2
            0100 .... = Version: 4
            .... 0101 = Header Length: 20 bytes (5)
            Differentiated Services Field: 0x10 (DSCP: Unknown, ECN: Not-ECT)
                0001 00.. = Differentiated Services Codepoint: Unknown (4)
                .... ..00 = Explicit Congestion Notification: Not ECN-Capable Transport (0)
            Total Length: 76
            Identification: 0x9278 (37496)
            Flags: 0x4000, Don't fragment
                0... .... .... .... = Reserved bit: Not set
                .1.. .... .... .... = Don't fragment: Set
                ..0. .... .... .... = More fragments: Not set
            Fragment offset: 0
            Time to live: 64

