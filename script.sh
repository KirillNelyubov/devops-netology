#!/usr/bin/env bash

ips=('192.168.0.2' '173.194.222.113' '87.250.250.242')
       for ip in "${ips[@]}"
       do
         rs='недоступен'
         a=5
         while (($a > 0))
         do
           curl -m3 http://"$ip"
           if (($? == 0))
           then
             rs='доступен'
             break
           fi
           ((a-=1))
         done
         echo "$ip $rs" >> test.log
       done
