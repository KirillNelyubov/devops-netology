# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию "3.6. Компьютерные сети, лекция 1":

1.     HTTP/1.1 301 Moved Permanently
       cache-control: no-cache, no-store, must-revalidate
       location: https://stackoverflow.com/questions
       x-request-guid: 44160104-0952-4478-958c-28c2219802a1
       feature-policy: microphone 'none'; speaker 'none'
       content-security-policy: upgrade-insecure-requests; frame-ancestors 'self' https://stackexchange.com
       Accept-Ranges: bytes
       Date: Wed, 24 Nov 2021 20:13:15 GMT
       Via: 1.1 varnish
       Connection: close
       X-Served-By: cache-hhn4059-HHN
       X-Cache: MISS
       X-Cache-Hits: 0
       X-Timer: S1637784795.855645,VS0,VE170
       Vary: Fastly-SSL
       X-DNS-Prefetch-Control: off
       Set-Cookie: prov=0719b663-f214-dc1a-9bf0-01e65a451ee2; domain=.stackoverflow.com; expires=Fri, 01-Jan-2055 00:00:00 GMT; path=/; HttpOnly
       
       Connection closed by foreign host.
   Код перенаправляет с http на https.


2.     HTTP/2 200 OK
       cache-control: private
       content-type: text/html; charset=utf-8
       content-encoding: gzip
       strict-transport-security: max-age=15552000
       x-frame-options: SAMEORIGIN
       x-request-guid: 097a0131-3653-4ff6-bd34-114531db6e04
       feature-policy: microphone 'none'; speaker 'none'
       content-security-policy: upgrade-insecure-requests; frame-ancestors 'self' https://stackexchange.com
       accept-ranges: bytes
       date: Wed, 24 Nov 2021 20:09:40 GMT
       via: 1.1 varnish
       x-served-by: cache-hhn4031-HHN
       x-cache: MISS
       x-cache-hits: 0
       x-timer: S1637784581.630904,VS0,VE89
       vary: Accept-Encoding,Fastly-SSL
       x-dns-prefetch-control: off
       X-Firefox-Spdy: h2
       GET / HTTP/2
       Host: stackoverflow.com
       User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:94.0) Gecko/20100101 Firefox/94.0
       Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
       Accept-Language: ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3
       Accept-Encoding: gzip, deflate, br
       Upgrade-Insecure-Requests: 1
       Connection: keep-alive
       Cookie: prov=ecea0b95-250d-59dd-e5da-2fb109a23025; OptanonConsent=isIABGlobal=false&datestamp=Mon+Nov+08+2021+23%3A45%3A45+GMT%2B0300+(%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0%2C+%D1%81%D1%82%D0%B0%D0%BD%D0%B4%D0%B0%D1%80%D1%82%D0%BD%D0%BE%D0%B5+%D0%B2%D1%80%D0%B5%D0%BC%D1%8F)&version=6.10.0&hosts=&landingPath=NotLandingPage&groups=C0003%3A1%2CC0004%3A1%2CC0002%3A1%2CC0001%3A1; OptanonAlertBoxClosed=2021-11-08T20:45:45.535Z; mfnes=dbf5CAMQARoLCNa0vra/upc6EAUyCGJmM2NhYjY0
       Sec-Fetch-Dest: document
       Sec-Fetch-Mode: navigate
       Sec-Fetch-Site: none
       Sec-Fetch-User: ?1
       TE: trailers     
  Время загрузки страницы 960мс. Дольше всего обрабатывался запрос html 525мс.  

<img src="Снимок экрана в 2021-11-25 00-24-03.png"/>

3. 185.125.114.2
4. South Business Communication, LTD. AS50042.
5.     vagrant@vagrant:~$ traceroute -A 8.8.8.8
       traceroute to 8.8.8.8 (8.8.8.8), 30 hops max, 60 byte packets
        1  _gateway (10.0.2.2) [*]  0.177 ms  1.084 ms  1.071 ms
        2  192.168.3.5 (192.168.3.5) [*]  1.031 ms  1.014 ms  0.902 ms
        3  192.168.0.1 (192.168.0.1) [*]  1.103 ms  1.449 ms  1.791 ms
        4  172.16.1.254 (172.16.1.254) [*]  4.742 ms  4.941 ms  5.414 ms
        5  10.1.1.10 (10.1.1.10) [*]  5.146 ms  5.521 ms  5.699 ms
        6  10.1.1.13 (10.1.1.13) [*]  6.008 ms  3.387 ms  12.690 ms
        7  212.110.156.144 (212.110.156.144) [AS28761]  12.839 ms  18.904 ms  18.874 ms
        8  ae20-323.svsl-30-ar1.miranda-media.net (178.34.189.141) [AS201776]  19.970 ms  19.754 ms ae20-10773.smfl-04-bpe1.miranda-media.net (178.34.152.9) [AS201776]  19.071 ms
        9  185.64.45.193 (185.64.45.193) [AS201776]  22.197 ms  23.335 ms  24.241 ms
       10  msk-ix-gw1.google.com (195.208.208.232) [AS5480]  53.948 ms  54.831 ms  54.560 ms
       11  108.170.250.113 (108.170.250.113) [AS15169]  55.981 ms 108.170.250.99 (108.170.250.99) [AS15169]  44.079 ms 108.170.250.113 (108.170.250.113) [AS15169]  55.729 ms
       12  * * 172.253.66.116 (172.253.66.116) [AS15169]  57.844 ms
       13  72.14.238.168 (72.14.238.168) [AS15169]  41.982 ms 108.170.232.251 (108.170.232.251) [AS15169]  46.821 ms 108.170.235.64 (108.170.235.64) [AS15169]  46.348 ms
       14  216.239.42.21 (216.239.42.21) [AS15169]  55.945 ms 172.253.51.241 (172.253.51.241) [AS15169]  59.507 ms 216.239.62.107 (216.239.62.107) [AS15169]  60.934 ms
       15  * * *
       16  * * *
       17  * * *
       18  * * *
       19  * * *
       20  * * *
       21  * * *
       22  * * *
       23  * * *
       24  dns.google (8.8.8.8) [AS15169]  46.896 ms  42.655 ms  46.588 ms
6. Наибольшая задержка происходит на узлах AS15169. 
7. dig ns dns.google 
       
       dns.google.		86400	IN	NS	ns1.zdns.google.
       dns.google.		86400	IN	NS	ns2.zdns.google.
       dns.google.		86400	IN	NS	ns3.zdns.google.
       dns.google.		86400	IN	NS	ns4.zdns.google.
   dig a dns.google

       dns.google.		428	IN	A	8.8.8.8
       dns.google.		428	IN	A	8.8.4.4
8. dig ptr 8.8.8.8.in-addr.arpa.
       
       8.8.8.8.in-addr.arpa.	4100	IN	PTR	dns.google.



























































