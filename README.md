# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию "3.9. Элементы безопасности информационных систем":

1. <img src="Снимок экрана в 2021-12-09 00-58-08.png"/>
2. lkk
3. <img src="/home/kirill/git/devops-netology/Снимок экрана в 2021-12-09 18-11-27.png"/>
   <img src="/home/kirill/git/devops-netology/Снимок экрана в 2021-12-09 18-11-39.png"/>

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
7. 




